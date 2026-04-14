package com.udanchoo.intranet.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.udanchoo.intranet.entity.CampaignFormEntity;
import com.udanchoo.intranet.entity.UdnCentralConfigEntity;
import com.udanchoo.intranet.entity.UdnClientEntity;
import com.udanchoo.intranet.entity.UdnTeam;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.repository.CampaignFormRepository;
import com.udanchoo.intranet.repository.ClientRepository;
import com.udanchoo.intranet.repository.TG_Leads_Repostory;
import com.udanchoo.intranet.repository.UdnCentralConfigRepository;
import com.udanchoo.intranet.repository.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Service for handling Meta (Facebook/Instagram) Lead Ads synchronization.
 *
 * Migrated from vistaluxhms -> TravelIntelliJ (UdanChoo Intranet).
 *
 * Logic:
 * 1. Connects to Meta Graph API using Page Access Token from udn_central_config.
 * 2. Every synced lead is auto-converted into a UdnClientEntity + Tg_Leads_Recorder_Entity.
 * 3. Deduplication via social_lead_log table (tracks imported Meta Lead IDs).
 * 4. Sends email notification to the default lead owner after successful import.
 */
@Service
public class SocialMediaLeadService {

    private static final Logger logger = LoggerFactory.getLogger(SocialMediaLeadService.class);
    private static final String GRAPH_API_BASE = "https://graph.facebook.com/";

    @Autowired
    private ClientRepository clientRepository;

    @Autowired
    private TG_Leads_Repostory leadsRepository;

    @Autowired
    private CampaignFormRepository campaignFormRepository;

    @Autowired
    private UdnCentralConfigRepository centralConfigRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ApplicationContext applicationContext;

    @PersistenceContext
    private EntityManager entityManager;

    private final ObjectMapper objectMapper = new ObjectMapper();

    /**
     * Fetches new leads from Meta API and creates Client + Lead records in CRM.
     * @return List of imported lead result maps
     */
    public List<Map<String, String>> fetchAndImportLeads(Long campaignFormId) {
        List<Map<String, String>> importedLeads = new ArrayList<>();

        try {
            CampaignFormEntity formConfig = campaignFormRepository.findById(campaignFormId).orElse(null);
            if (formConfig == null) {
                Map<String, String> err = new HashMap<>();
                err.put("status", "Error");
                err.put("message", "Campaign Form not found with ID: " + campaignFormId);
                importedLeads.add(err);
                return importedLeads;
            }

            UdnCentralConfigEntity centralConfig = centralConfigRepository.findTopByOrderByIdAsc();
            if (centralConfig == null || centralConfig.getMetaPageAccessToken() == null
                    || centralConfig.getMetaPageAccessToken().isEmpty()) {
                throw new RuntimeException("Meta Page Access Token is not configured. Please set it in Settings -> Central Config.");
            }

            String activeFormId = formConfig.getFormId();
            String activeAccessToken = centralConfig.getMetaPageAccessToken();
            String apiVersion = (centralConfig.getMetaGraphApiVersion() != null
                    && !centralConfig.getMetaGraphApiVersion().isEmpty())
                    ? centralConfig.getMetaGraphApiVersion() : "v19.0";

            String apiUrl = GRAPH_API_BASE + apiVersion + "/" + activeFormId
                    + "/leads?access_token=" + activeAccessToken
                    + "&limit=50&fields=id,created_time,field_data,platform";

            String response = makeGetRequest(apiUrl);
            JsonNode rootNode = objectMapper.readTree(response);
            JsonNode dataArray = rootNode.get("data");

            if (dataArray == null || !dataArray.isArray()) {
                logger.debug("[SocialMediaLeadService] No data array in API response");
                return importedLeads;
            }

            logger.info("[SocialMediaLeadService] Found {} leads from Meta API", dataArray.size());

            for (JsonNode leadNode : dataArray) {
                String metaLeadId = leadNode.get("id").asText();
                String createdTime = leadNode.has("created_time") ? leadNode.get("created_time").asText() : "";
                String platform = leadNode.has("platform") ? leadNode.get("platform").asText() : "fb";

                if (isLeadAlreadyImported(metaLeadId)) {
                    logger.debug("[SocialMediaLeadService] Lead {} already imported, skipping", metaLeadId);
                    continue;
                }

                Map<String, String> fieldData = parseFieldData(leadNode.get("field_data"));
                fieldData.put("meta_lead_id", metaLeadId);
                fieldData.put("created_time", createdTime);
                fieldData.put("platform", platform);

                try {
                    Map<String, String> result = applicationContext.getBean(SocialMediaLeadService.class)
                            .processAndImportLead(fieldData);
                    importedLeads.add(result);
                    notifyLeadOwnerFromFieldData(result);
                } catch (Exception ex) {
                    logger.error("Error importing lead {}", metaLeadId, ex);
                    Map<String, String> errorMap = new HashMap<>();
                    errorMap.put("status", "Error");
                    errorMap.put("message", "Failed to import lead " + metaLeadId + ": " + ex.getMessage());
                    importedLeads.add(errorMap);
                }
            }

            // Handle pagination
            if (rootNode.has("paging") && rootNode.get("paging").has("next")) {
                String nextPageUrl = rootNode.get("paging").get("next").asText();
                importedLeads.addAll(fetchAndImportFromUrl(nextPageUrl));
            }

        } catch (Exception e) {
            logger.error("[SocialMediaLeadService] Error fetching leads: {}", e.getMessage(), e);
            Map<String, String> errorMap = new HashMap<>();
            errorMap.put("status", "Error");
            errorMap.put("message", e.getMessage());
            importedLeads.add(errorMap);
        }

        return importedLeads;
    }

    /**
     * Process a single lead in its own transaction.
     */
    @Transactional
    public Map<String, String> processAndImportLead(Map<String, String> fieldData) {
        String platform = fieldData.getOrDefault("platform", "fb");
        String metaLeadId = fieldData.getOrDefault("meta_lead_id", "");
        String createdTime = fieldData.getOrDefault("created_time", "");
        String sourceName = "ig".equals(platform) ? "Instagram Lead Ad" : "Facebook Lead Ad";

        UdnClientEntity client = findOrCreateClient(fieldData, sourceName);
        Tg_Leads_Recorder_Entity lead = createLead(client, fieldData, sourceName);

        applicationContext.getBean(SocialMediaLeadService.class)
                .logImportedLead(metaLeadId, lead.getLeadId(), platform, createdTime);

        fieldData.put("crm_lead_id", String.valueOf(lead.getLeadId()));
        fieldData.put("source", sourceName);
        fieldData.put("status", "Imported Successfully");
        fieldData.put("client_name", client.getClientName() != null ? client.getClientName() : "Unknown");
        fieldData.put("client_email", client.getEmail() != null ? client.getEmail() : "");
        fieldData.put("client_mobile", String.valueOf(client.getMobile()));

        logger.info("[SocialMediaLeadService] Imported lead: {} from {} -> CRM Lead #{}",
                fieldData.getOrDefault("full_name", "Unknown"), sourceName, lead.getLeadId());

        return fieldData;
    }

    /**
     * Log an imported lead to prevent duplicate imports.
     * Runs in its own transaction (REQUIRES_NEW).
     */
    @Transactional(propagation = Propagation.REQUIRES_NEW)
    public void logImportedLead(String metaLeadId, Long crmLeadId, String platform, String createdTime) {
        try {
            Query query = entityManager.createNativeQuery(
                    "INSERT INTO social_lead_log (meta_lead_id, crm_lead_id, platform, meta_created_time, imported_at) "
                            + "VALUES (?1, ?2, ?3, ?4, ?5)");
            query.setParameter(1, metaLeadId);
            query.setParameter(2, crmLeadId);
            query.setParameter(3, platform);
            query.setParameter(4, createdTime);
            query.setParameter(5, new java.sql.Timestamp(System.currentTimeMillis()));
            query.executeUpdate();
        } catch (Exception e) {
            logger.error("[SocialMediaLeadService] Error logging lead: {}", e.getMessage());
        }
    }

    /**
     * Get count of all imported leads
     */
    public int getImportedLeadCount() {
        try {
            Query query = entityManager.createNativeQuery("SELECT COUNT(*) FROM social_lead_log");
            return ((Number) query.getSingleResult()).intValue();
        } catch (Exception e) {
            return 0;
        }
    }

    /**
     * Test the Meta API connection using config from udn_central_config.
     */
    public Map<String, Object> testConnection() {
        Map<String, Object> result = new HashMap<>();
        try {
            UdnCentralConfigEntity centralConfig = centralConfigRepository.findTopByOrderByIdAsc();

            if (centralConfig == null || centralConfig.getMetaPageAccessToken() == null
                    || centralConfig.getMetaPageAccessToken().isEmpty()) {
                throw new RuntimeException("Meta Page Access Token is not configured. Please set it in Settings.");
            }
            if (centralConfig.getMetaLeadFormId() == null || centralConfig.getMetaLeadFormId().trim().isEmpty()) {
                throw new RuntimeException("Meta Lead Form ID is not configured. Please set it in Settings.");
            }

            String token = centralConfig.getMetaPageAccessToken();
            String formId = centralConfig.getMetaLeadFormId();
            String version = (centralConfig.getMetaGraphApiVersion() != null
                    && !centralConfig.getMetaGraphApiVersion().isEmpty())
                    ? centralConfig.getMetaGraphApiVersion() : "v19.0";

            String apiUrl = GRAPH_API_BASE + version + "/" + formId
                    + "?fields=id,name,status&access_token=" + token;
            String response = makeGetRequest(apiUrl);
            JsonNode node = objectMapper.readTree(response);

            result.put("success", true);
            result.put("formName", node.has("name") ? node.get("name").asText() : "N/A");
            result.put("formId", node.has("id") ? node.get("id").asText() : "N/A");
            result.put("formStatus", node.has("status") ? node.get("status").asText() : "N/A");
            result.put("message", "Connected to Meta API successfully!");
        } catch (Exception e) {
            result.put("success", false);
            result.put("message", "Connection failed: " + e.getMessage());
        }
        return result;
    }

    // ======================================================
    // Private Helper Methods
    // ======================================================

    private List<Map<String, String>> fetchAndImportFromUrl(String url) {
        List<Map<String, String>> results = new ArrayList<>();
        try {
            String response = makeGetRequest(url);
            JsonNode rootNode = objectMapper.readTree(response);
            JsonNode dataArray = rootNode.get("data");

            if (dataArray != null && dataArray.isArray()) {
                for (JsonNode leadNode : dataArray) {
                    String metaLeadId = leadNode.get("id").asText();
                    if (isLeadAlreadyImported(metaLeadId)) continue;

                    Map<String, String> fieldData = parseFieldData(leadNode.get("field_data"));
                    fieldData.put("meta_lead_id", metaLeadId);
                    fieldData.put("platform", leadNode.has("platform") ? leadNode.get("platform").asText() : "fb");
                    fieldData.put("created_time", leadNode.has("created_time") ? leadNode.get("created_time").asText() : "");

                    try {
                        Map<String, String> result = applicationContext.getBean(SocialMediaLeadService.class)
                                .processAndImportLead(fieldData);
                        results.add(result);
                        notifyLeadOwnerFromFieldData(result);
                    } catch (Exception ex) {
                        logger.error("Pagination lead error for {}", metaLeadId, ex);
                        Map<String, String> errorMap = new HashMap<>();
                        errorMap.put("status", "Error");
                        errorMap.put("message", "Failed: " + ex.getMessage());
                        results.add(errorMap);
                    }
                }
            }
        } catch (Exception e) {
            logger.error("[SocialMediaLeadService] Pagination error: {}", e.getMessage());
        }
        return results;
    }

    private Map<String, String> parseFieldData(JsonNode fieldDataNode) {
        Map<String, String> fields = new HashMap<>();
        if (fieldDataNode != null && fieldDataNode.isArray()) {
            for (JsonNode field : fieldDataNode) {
                String name = field.get("name").asText();
                JsonNode valuesNode = field.get("values");
                if (valuesNode != null && valuesNode.isArray() && valuesNode.size() > 0) {
                    fields.put(name, valuesNode.get(0).asText());
                }
            }
        }
        return fields;
    }

    private UdnClientEntity findOrCreateClient(Map<String, String> fieldData, String source) {
        String name = fieldData.getOrDefault("full_name", "Unknown Lead");
        String email = fieldData.getOrDefault("email", "");
        String phone = fieldData.getOrDefault("phone_number", "");

        phone = phone.replaceAll("[^0-9]", "");
        if (phone.length() > 10 && phone.startsWith("91")) {
            phone = phone.substring(2);
        }

        long mobile = 0;
        try {
            if (!phone.isEmpty()) mobile = Long.parseLong(phone);
        } catch (NumberFormatException e) {
            logger.warn("[SocialMediaLeadService] Invalid phone: {}", phone);
        }

        // Try to find existing client by email
        UdnClientEntity client = null;
        if (!email.isEmpty()) {
            List<UdnClientEntity> all = clientRepository.findAll();
            for (UdnClientEntity c : all) {
                if (email.equalsIgnoreCase(c.getEmail())) {
                    client = c;
                    break;
                }
            }
        }

        // Try to find by mobile
        if (client == null && mobile != 0) {
            final long finalMobile = mobile;
            List<UdnClientEntity> all = clientRepository.findAll();
            for (UdnClientEntity c : all) {
                if (finalMobile == c.getMobile()) {
                    client = c;
                    break;
                }
            }
        }

        // Create new client if not found
        if (client == null) {
            client = new UdnClientEntity();
            client.setClientName(name);
            client.setEmail(email);
            client.setMobile(mobile);
            client.setReferredBy(source);
            client.setRemarks("Auto-imported from " + source);
            client.setActive(true);
            client = clientRepository.save(client);
            logger.info("[SocialMediaLeadService] Created new client: {} (ID: {})", name, client.getClientId());
        } else {
            logger.info("[SocialMediaLeadService] Found existing client: {} (ID: {})", client.getClientName(), client.getClientId());
        }

        return client;
    }

    private Tg_Leads_Recorder_Entity createLead(UdnClientEntity client, Map<String, String> fieldData, String source) {
        Tg_Leads_Recorder_Entity lead = new Tg_Leads_Recorder_Entity();
        lead.setContactId(client.getClientId());
        lead.setAdults(1);
        lead.setChildren(0);
        lead.setLeadStatus(101); // Open

        // Default lead owner from Central Config
        int defaultOwnerId = 1;
        try {
            UdnCentralConfigEntity config = centralConfigRepository.findTopByOrderByIdAsc();
            if (config != null && config.getDefaultLeadOwnerId() != null) {
                defaultOwnerId = config.getDefaultLeadOwnerId();
            }
        } catch (Exception e) {
            logger.warn("[SocialMediaLeadService] Could not read default lead owner, using admin (1)");
        }
        lead.setLeadOwner(defaultOwnerId);
        lead.setSource(6); // Social Media source code
        lead.setQualified(false);
        lead.setFlagged(false);
        lead.setLeadCreationClientInformed(false);

        // Build remarks from lead form data
        StringBuilder remarks = new StringBuilder();
        remarks.append("[").append(source).append("]\n");

        if (fieldData.containsKey("what_is_your_traveling_date?")) {
            remarks.append("Travel Date: ").append(fieldData.get("what_is_your_traveling_date?")).append("\n");
        }
        if (fieldData.containsKey("what_is_your_departure_city?")) {
            remarks.append("Departure City: ").append(fieldData.get("what_is_your_departure_city?")).append("\n");
        }
        if (fieldData.containsKey("city")) {
            remarks.append("City: ").append(fieldData.get("city")).append("\n");
        }
        remarks.append("Meta Lead ID: ").append(fieldData.getOrDefault("meta_lead_id", "N/A")).append("\n");
        remarks.append("Platform: ").append(fieldData.getOrDefault("platform", "N/A")).append("\n");
        remarks.append("Submitted: ").append(fieldData.getOrDefault("created_time", "N/A"));

        String remarksStr = remarks.toString();
        if (remarksStr.length() > 250) remarksStr = remarksStr.substring(0, 250) + "...";
        lead.setClientRemarks(remarksStr);

        String internalRemarks = "Auto-imported from " + source + " on " + new Date();
        if (internalRemarks.length() > 250) internalRemarks = internalRemarks.substring(0, 250) + "...";
        lead.setInternalRemarks(internalRemarks);

        Date now = new Date();
        lead.setCreatedAt(now);
        lead.setUpdatedAt(now);

        leadsRepository.save(lead);
        return lead;
    }

    private boolean isLeadAlreadyImported(String metaLeadId) {
        try {
            Query query = entityManager.createNativeQuery(
                    "SELECT COUNT(*) FROM social_lead_log WHERE meta_lead_id = ?1");
            query.setParameter(1, metaLeadId);
            Number count = (Number) query.getSingleResult();
            return count.intValue() > 0;
        } catch (Exception e) {
            return false;
        }
    }

    private void notifyLeadOwnerFromFieldData(Map<String, String> fieldData) {
        try {
            String crmLeadIdStr = fieldData.get("crm_lead_id");
            if (crmLeadIdStr == null) return;

            String clientName = fieldData.getOrDefault("client_name", "Unknown");
            String leadId = "UDN-" + crmLeadIdStr;
            String source = fieldData.getOrDefault("source", "Social Media Lead Ad");

            // Get lead owner
            int ownerId = 1;
            try {
                UdnCentralConfigEntity config = centralConfigRepository.findTopByOrderByIdAsc();
                if (config != null && config.getDefaultLeadOwnerId() != null) {
                    ownerId = config.getDefaultLeadOwnerId();
                }
            } catch (Exception ignored) {}

            UdnTeam ownerUser = userRepository.findById(ownerId).orElse(null);
            if (ownerUser == null || ownerUser.getEmail() == null || ownerUser.getEmail().trim().isEmpty()) {
                logger.debug("[SocialMediaLeadService] Lead owner not found or has no email. Skipping notification.");
                return;
            }

            logger.info("[SocialMediaLeadService] New lead {} assigned to {} - email notification skipped (configure EmailService to enable)",
                    leadId, ownerUser.getEmail());

        } catch (Exception e) {
            logger.error("[SocialMediaLeadService] Post-import notification failed", e);
        }
    }

    private String makeGetRequest(String urlString) throws Exception {
        URL url = new URL(urlString);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestMethod("GET");
        connection.setConnectTimeout(10000);
        connection.setReadTimeout(10000);

        int responseCode = connection.getResponseCode();
        BufferedReader reader = (responseCode == HttpURLConnection.HTTP_OK)
                ? new BufferedReader(new InputStreamReader(connection.getInputStream()))
                : new BufferedReader(new InputStreamReader(connection.getErrorStream()));

        StringBuilder response = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            response.append(line);
        }
        reader.close();

        if (responseCode != HttpURLConnection.HTTP_OK) {
            throw new RuntimeException("Meta API returned HTTP " + responseCode + ": " + response.toString());
        }

        return response.toString();
    }

    private Date tryParseDate(String dateStr) {
        String[] formats = {"yyyy-MM-dd", "dd/MM/yyyy", "MM/dd/yyyy", "dd-MM-yyyy", "MMMM dd, yyyy"};
        for (String format : formats) {
            try {
                return new SimpleDateFormat(format).parse(dateStr);
            } catch (Exception ignored) {}
        }
        return null;
    }
}
