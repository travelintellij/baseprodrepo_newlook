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
import com.udanchoo.intranet.repository.Udn_Destinations_Master_Repository;
import com.udanchoo.intranet.entity.Udn_Destinations_Entity;
import com.udanchoo.intranet.repository.TgB2bPartnersRepository;
import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;
import com.udanchoo.intranet.util.UdanChooConstants;
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
    private Udn_Destinations_Master_Repository destinationRepository;

    @Autowired
    private TgB2bPartnersRepository b2bPartnerRepository;

    @Autowired
    private EmailServiceImpl emailService;

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
                logger.warn("[SocialMediaLeadService] No leads found for Form ID: {}. Response: {}", activeFormId, response);
                return importedLeads;
            }

            logger.info("[SocialMediaLeadService] Found {} leads from Meta API for Form ID: {}", dataArray.size(), activeFormId);

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
                            .processAndImportLead(fieldData, formConfig);
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
                importedLeads.addAll(fetchAndImportFromUrl(nextPageUrl, formConfig));
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
    public Map<String, String> processAndImportLead(Map<String, String> fieldData, CampaignFormEntity formConfig) {
        String platform = fieldData.getOrDefault("platform", "fb");
        String metaLeadId = fieldData.getOrDefault("meta_lead_id", "");
        String createdTime = fieldData.getOrDefault("created_time", "");
        String sourceName = "ig".equals(platform) ? "Instagram Lead Ad" : "Facebook Lead Ad";

        UdnClientEntity client = findOrCreateClient(fieldData, sourceName);
        Tg_Leads_Recorder_Entity lead = createLead(client, fieldData, sourceName, formConfig);

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

            String token = centralConfig.getMetaPageAccessToken();
            String version = "v19.0";

            // Test by fetching token info from Meta — does not need a Form ID
            String apiUrl = GRAPH_API_BASE + version + "/me?fields=id,name&access_token=" + token;
            String response = makeGetRequest(apiUrl);
            JsonNode node = objectMapper.readTree(response);

            result.put("success", true);
            result.put("formName", node.has("name") ? node.get("name").asText() : "Meta Page");
            result.put("formId", node.has("id") ? node.get("id").asText() : "N/A");
            result.put("formStatus", "ACTIVE");
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

    private List<Map<String, String>> fetchAndImportFromUrl(String url, CampaignFormEntity formConfig) {
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
                                .processAndImportLead(fieldData, formConfig);
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
                String name = field.get("name").asText().toLowerCase();
                JsonNode valuesNode = field.get("values");
                if (valuesNode != null && valuesNode.isArray() && valuesNode.size() > 0) {
                    String value = valuesNode.get(0).asText();
                    fields.put(name, value);

                    // Map variations to standard keys for easier processing
                    if (name.contains("name") && !fields.containsKey("full_name")) fields.put("full_name", value);
                    if (name.contains("email") && !fields.containsKey("email")) fields.put("email", value);
                    if (name.contains("phone") && !fields.containsKey("phone_number")) fields.put("phone_number", value);
                    if (name.contains("mobile") && !fields.containsKey("phone_number")) fields.put("phone_number", value);
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
            List<UdnClientEntity> existing = clientRepository.findByEmail(email);
            if (!existing.isEmpty()) {
                client = existing.get(0);
            }
        }

        // Try to find by mobile
        if (client == null && mobile != 0) {
            List<UdnClientEntity> existing = clientRepository.findByMobile(mobile);
            if (!existing.isEmpty()) {
                client = existing.get(0);
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
            // Ensure cityId is null to avoid FK constraint violation (null won't trigger FK check)
            client.setCityId(null); 
            client = clientRepository.save(client);
            logger.info("[SocialMediaLeadService] Created new client: {} (ID: {})", name, client.getClientId());
        } else {
            logger.info("[SocialMediaLeadService] Found existing client: {} (ID: {})", client.getClientName(), client.getClientId());
        }

        return client;
    }

    private Tg_Leads_Recorder_Entity createLead(UdnClientEntity client, Map<String, String> fieldData, String source, CampaignFormEntity formConfig) {
        Tg_Leads_Recorder_Entity lead = new Tg_Leads_Recorder_Entity();
        lead.setContactId(client.getClientId());
        lead.setAdults(1);
        lead.setChildren(0);
        lead.setLeadStatus(UdanChooConstants.DEAL_FRESH_CREATED_LEAD_WL_STATUS); // Open

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
        
        // Resolve Destination: Default to "Unknown" if not provided
        Integer destinationId = null;
        String destName = fieldData.get("destination");
        if (destName == null || destName.trim().isEmpty()) {
            destName = fieldData.get("what_is_your_destination?");
        }
        if (destName == null || destName.trim().isEmpty()) {
            destName = fieldData.get("city");
        }
        
        // Fallback to Campaign's defined destination if provided
        if ((destName == null || destName.trim().isEmpty()) && formConfig != null) {
            destName = formConfig.getDestination();
        }
        
        if (destName != null && !destName.trim().isEmpty()) {
            List<Udn_Destinations_Entity> dests = destinationRepository.findByCityNameIgnoreCase(destName.trim());
            if (!dests.isEmpty()) {
                destinationId = dests.get(0).getDestinationId();
            } else {
                destinationId = getUnknownDestinationId();
            }
        } else {
            destinationId = getUnknownDestinationId();
        }
        
        lead.setDestination(destinationId);
        lead.setLeadSource(getDefaultDigitalMarketingSourceId());
        lead.setSource(getUnknownDestinationId());
        
        // Resolve TSD & TED: Default to present date if not provided
        java.sql.Date sqlNow = new java.sql.Date(System.currentTimeMillis());
        java.sql.Date tsd = null;
        if (fieldData.containsKey("what_is_your_traveling_date?")) {
            java.util.Date parsed = tryParseDate(fieldData.get("what_is_your_traveling_date?"));
            if (parsed != null) {
                tsd = new java.sql.Date(parsed.getTime());
            }
        }
        if (tsd == null) {
            tsd = sqlNow;
        }
        
        lead.setTravelStartDate(tsd);
        
        // TED defaults to TSD if not provided separately
        java.sql.Date ted = null;
        if (fieldData.containsKey("what_is_your_return_date?")) {
            java.util.Date parsed = tryParseDate(fieldData.get("what_is_your_return_date?"));
            if (parsed != null) {
                ted = new java.sql.Date(parsed.getTime());
            }
        }
        if (ted == null) {
            ted = tsd; // Or sqlNow
        }
        
        lead.setTravelEndDate(ted);
        
        // Inherit tentative cost and service from Campaign config
        if (formConfig != null) {
            lead.setTentativeCost(formConfig.getTentativeCost() != null ? formConfig.getTentativeCost() : 0);
            
            String defService = formConfig.getDefaultService();
            if (defService != null && !defService.trim().isEmpty()) {
                String[] selectedServices = defService.split(",");
                for (String serviceCode : selectedServices) {
                    serviceCode = serviceCode.trim();
                    if (UdanChooConstants.WORKLOAD_FLT_CODE.equalsIgnoreCase(serviceCode)) lead.setFlight(true);
                    else if (UdanChooConstants.WORKLOAD_HTL_CODE.equalsIgnoreCase(serviceCode)) lead.setHotel(true);
                    else if (UdanChooConstants.WORKLOAD_LDP_CODE.equalsIgnoreCase(serviceCode)) lead.setLandPackage(true);
                    else if (UdanChooConstants.WORKLOAD_VSA_CODE.equalsIgnoreCase(serviceCode)) lead.setVisa(true);
                    else if (UdanChooConstants.WORKLOAD_TRN_CODE.equalsIgnoreCase(serviceCode)) lead.setTransfers(true);
                    else if (UdanChooConstants.WORKLOAD_STS_CODE.equalsIgnoreCase(serviceCode)) lead.setSightseeing(true);
                    else if (UdanChooConstants.WORKLOAD_INS_CODE.equalsIgnoreCase(serviceCode)) lead.setInsurance(true);
                    else if (UdanChooConstants.WORKLOAD_CRS_CODE.equalsIgnoreCase(serviceCode)) lead.setCruise(true);
                    else if (UdanChooConstants.WORKLOAD_OTH_CODE.equalsIgnoreCase(serviceCode)) lead.setOthers(true);
                    
                    // Also handle the internal names used in the JSP before
                    else if ("flight".equalsIgnoreCase(serviceCode)) lead.setFlight(true);
                    else if ("hotel".equalsIgnoreCase(serviceCode)) lead.setHotel(true);
                    else if ("landPackage".equalsIgnoreCase(serviceCode)) lead.setLandPackage(true);
                    else if ("visa".equalsIgnoreCase(serviceCode)) lead.setVisa(true);
                    else if ("transfers".equalsIgnoreCase(serviceCode)) lead.setTransfers(true);
                    else if ("sightseeing".equalsIgnoreCase(serviceCode)) lead.setSightseeing(true);
                    else if ("insurance".equalsIgnoreCase(serviceCode)) lead.setInsurance(true);
                    else if ("cruise".equalsIgnoreCase(serviceCode)) lead.setCruise(true);
                    else if ("others".equalsIgnoreCase(serviceCode)) lead.setOthers(true);
                }
            }
        }

        lead.setQualified(false);
        lead.setFlagged(false);
        lead.setLeadCreationClientInformed(false);

        // Build remarks from lead form data
        StringBuilder internalRemarks = new StringBuilder();
        internalRemarks.append("[").append(source).append("]\n");

        if (fieldData.containsKey("email")) {
            internalRemarks.append("Email: ").append(fieldData.get("email")).append("\n");
        }
        if (fieldData.containsKey("phone_number")) {
            internalRemarks.append("Phone: ").append(fieldData.get("phone_number")).append("\n");
        }
        if (fieldData.containsKey("what_is_your_traveling_date?")) {
            internalRemarks.append("Travel Date: ").append(fieldData.get("what_is_your_traveling_date?")).append("\n");
        }
        if (fieldData.containsKey("what_is_your_departure_city?")) {
            internalRemarks.append("Departure City: ").append(fieldData.get("what_is_your_departure_city?")).append("\n");
        }
        if (fieldData.containsKey("city")) {
            internalRemarks.append("City: ").append(fieldData.get("city")).append("\n");
        }
        internalRemarks.append("Meta Lead ID: ").append(fieldData.getOrDefault("meta_lead_id", "N/A")).append("\n");
        internalRemarks.append("Platform: ").append(fieldData.getOrDefault("platform", "N/A")).append("\n");
        internalRemarks.append("Imported: ").append(new Date());

        String internalRemarksStr = internalRemarks.toString();
        if (internalRemarksStr.length() > 250) internalRemarksStr = internalRemarksStr.substring(0, 250) + "...";
        
        lead.setInternalRemarks(internalRemarksStr);
        lead.setClientRemarks(""); // Keep empty as requested

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

            String clientName = fieldData.getOrDefault("full_name", "Unknown");
            String clientEmail = fieldData.getOrDefault("email", "N/A");
            String clientPhone = fieldData.getOrDefault("phone_number", "N/A");
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

            // Compose email
            String subject = "New Social Media Lead Assigned: " + leadId + " (" + clientName + ")";
            StringBuilder body = new StringBuilder();
            body.append("Hello ").append(ownerUser.getName()).append(",\n\n");
            body.append("A new lead has been auto-imported from ").append(source).append(" and assigned to you.\n\n");
            body.append("--- Lead Details ---\n");
            body.append("Lead ID: ").append(leadId).append("\n");
            body.append("Name:    ").append(clientName).append("\n");
            body.append("Email:   ").append(clientEmail).append("\n");
            body.append("Phone:   ").append(clientPhone).append("\n");
            
            if (fieldData.containsKey("what_is_your_traveling_date?")) {
                body.append("Travel Date: ").append(fieldData.get("what_is_your_traveling_date?")).append("\n");
            }
            if (fieldData.containsKey("what_is_your_departure_city?")) {
                body.append("Departure City: ").append(fieldData.get("what_is_your_departure_city?")).append("\n");
            }
            if (fieldData.containsKey("city")) {
                body.append("City: ").append(fieldData.get("city")).append("\n");
            }

            body.append("\nPlatform: ").append(fieldData.getOrDefault("platform", "N/A")).append("\n");
            body.append("Submitted: ").append(fieldData.getOrDefault("created_time", "N/A")).append("\n\n");
            body.append("Please log in to the CRM to view full details and start follow-up.\n\n");
            body.append("Regards,\nUdanChoo CRM Auto-Sync System");

            emailService.sendMail(ownerUser.getEmail(), subject, body.toString());
            logger.info("[SocialMediaLeadService] Sent lead notification email for {} to {}", leadId, ownerUser.getEmail());

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

    private Integer getUnknownDestinationId() {
        List<Udn_Destinations_Entity> list = destinationRepository.findByCityNameIgnoreCase("Unknown");
        if (!list.isEmpty()) {
            return list.get(0).getDestinationId();
        }
        Udn_Destinations_Entity unknown = new Udn_Destinations_Entity();
        unknown.setCityName("Unknown");
        unknown.setCountryCode("UN");
        unknown.setCountryName("Unknown");
        unknown.setActive(true);
        unknown = destinationRepository.save(unknown);
        return unknown.getDestinationId();
    }

    private Integer getDefaultDigitalMarketingSourceId() {
        List<Tg_B2b_Partner_Entity> partners = b2bPartnerRepository.find_All_Active_Agents();
        for (Tg_B2b_Partner_Entity p : partners) {
            if ("Digital Marketing".equalsIgnoreCase(p.getPartnerName())) {
                return p.getPartnerId();
            }
        }
        
        Tg_B2b_Partner_Entity dmPartner = new Tg_B2b_Partner_Entity();
        dmPartner.setPartnerName("Digital Marketing");
        dmPartner.setPartnerShortName("UDN");
        dmPartner.setPartnerBrandName("UdanChoo DM");
        dmPartner.setActive(true);
        dmPartner = b2bPartnerRepository.save(dmPartner);
        return dmPartner.getPartnerId();
    }
}
