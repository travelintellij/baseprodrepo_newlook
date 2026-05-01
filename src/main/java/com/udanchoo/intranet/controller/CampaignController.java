package com.udanchoo.intranet.controller;

import com.udanchoo.intranet.entity.CampaignFormEntity;
import com.udanchoo.intranet.entity.UdnCentralConfigEntity;
import com.udanchoo.intranet.entity.Udn_Destinations_Entity;
import com.udanchoo.intranet.repository.CampaignFormRepository;
import com.udanchoo.intranet.repository.UdnCentralConfigRepository;
import com.udanchoo.intranet.service.SocialMediaLeadService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * Controller for Campaign Management and Social Media Lead Sync.
 *
 * Migrated from vistaluxhms -> TravelIntelliJ (UdanChoo Intranet).
 *
 * Endpoints:
 * - GET  /campaign/list              -> View all campaign forms
 * - GET  /campaign/add               -> Add campaign form page
 * - POST /campaign/save              -> Save a campaign form
 * - GET  /campaign/delete/{id}       -> Delete a campaign form
 * - GET  /sync_social_leads          -> Sync leads from Meta (AJAX)
 * - GET  /test_social_connection     -> Test Meta API connection (AJAX)
 * - GET  /campaign/central-config    -> View/Edit Meta API settings
 * - POST /campaign/central-config/save -> Save Meta API settings
 */
@Controller
public class CampaignController {

    private static final Logger logger = LoggerFactory.getLogger(CampaignController.class);

    @Autowired
    private SocialMediaLeadService socialMediaLeadService;

    @Autowired
    private CampaignFormRepository campaignFormRepository;

    @Autowired
    private UdnCentralConfigRepository centralConfigRepository;

    @Autowired
    private UserDetailsServiceImpl userDetailsService;

    @Autowired
    private UdnCommonServicesImpl udnCommonServices;

    // ========== Campaign Form CRUD ==========

    @ModelAttribute("DESTINATIONS_LIST")
    public Map<String, String> getDestinationsList() {
        Map<String, String> map = new LinkedHashMap<>();
        try {
            List<Udn_Destinations_Entity> list = udnCommonServices.listAllActiveDestinations();
            if (list != null) {
                for (Udn_Destinations_Entity d : list) {
                    if (d.getCityName() != null && !d.getCityName().isEmpty()) {
                        String label = d.getCityName() + (d.getCountryName() != null ? " (" + d.getCountryName() + ")" : "");
                        map.put(d.getCityName(), label);
                    }
                }
            }
        } catch (Exception e) {
            logger.error("[CampaignController] Error loading destinations", e);
        }
        return map;
    }

    @GetMapping("/campaign/list")
    public String campaignList(Model model) {
        List<CampaignFormEntity> campaigns = campaignFormRepository.findAll();
        model.addAttribute("campaigns", campaigns);
        return "admin/campaign/campaignList";
    }

    @GetMapping("/campaign/add")
    public String addCampaignForm(Model model) {
        model.addAttribute("campaign", new CampaignFormEntity());
        model.addAttribute("serviceList", userDetailsService.findAllActiveUdnServices());
        return "admin/campaign/addCampaignForm";
    }

    @GetMapping("/campaign/edit/{id}")
    public String editCampaignForm(@PathVariable Long id, Model model) {
        CampaignFormEntity campaign = campaignFormRepository.findById(id).orElse(null);
        if (campaign != null && campaign.getDefaultService() != null && !campaign.getDefaultService().isEmpty()) {
            campaign.setServices(java.util.Arrays.asList(campaign.getDefaultService().split(",")));
        }
        model.addAttribute("campaign", campaign);
        model.addAttribute("serviceList", userDetailsService.findAllActiveUdnServices());
        return "admin/campaign/addCampaignForm";
    }

    @PostMapping("/campaign/save")
    public String saveCampaignForm(@ModelAttribute CampaignFormEntity campaignFormEntity,
                                   RedirectAttributes ra) {
        try {
            if (campaignFormEntity.getActive() == null) campaignFormEntity.setActive(true);

            // Join services into defaultService CSV
            if (campaignFormEntity.getServices() != null && !campaignFormEntity.getServices().isEmpty()) {
                campaignFormEntity.setDefaultService(String.join(",", campaignFormEntity.getServices()));
            }

            // ── Duplicate Form ID check ──
            String newFormId = campaignFormEntity.getFormId();
            if (newFormId != null && !newFormId.trim().isEmpty()) {
                List<CampaignFormEntity> existing = campaignFormRepository.findByFormId(newFormId.trim());
                // If editing, exclude the current campaign from the duplicate check
                boolean isDuplicate = existing.stream().anyMatch(e -> 
                    campaignFormEntity.getCampaignFormId() == null || !e.getCampaignFormId().equals(campaignFormEntity.getCampaignFormId())
                );
                
                if (isDuplicate) {
                    ra.addFlashAttribute("errorMsg",
                            "A campaign with Form ID '" + newFormId + "' already exists. Each Form ID must be unique.");
                    return "redirect:/campaign/list";
                }
            }

            campaignFormRepository.save(campaignFormEntity);
            logger.info("[CampaignController] Saved campaign form: {}", campaignFormEntity.getFormName());
            ra.addFlashAttribute("successMsg", "Campaign saved successfully!");
        } catch (Exception e) {
            logger.error("[CampaignController] Error saving campaign form", e);
            ra.addFlashAttribute("errorMsg", "Error saving campaign: " + e.getMessage());
        }
        return "redirect:/campaign/list";
    }

    @GetMapping("/campaign/delete/{id}")
    public String deleteCampaignForm(@PathVariable Long id) {
        try {
            campaignFormRepository.deleteById(id);
            logger.info("[CampaignController] Deleted campaign form ID: {}", id);
        } catch (Exception e) {
            logger.error("[CampaignController] Error deleting campaign form {}", id, e);
        }
        return "redirect:/campaign/list";
    }

    // ========== Meta API Settings ==========

    @GetMapping("/campaign/central-config")
    public String viewCentralConfig(Model model) {
        UdnCentralConfigEntity config = centralConfigRepository.findTopByOrderByIdAsc();
        if (config == null) config = new UdnCentralConfigEntity();
        model.addAttribute("config", config);
        // Populate lead owner dropdown
        List<UserDetailsObj> activeUsersList = userDetailsService.findAllActiveUsers();
        java.util.Map<Integer, String> activeUsersMap = activeUsersList.stream()
                .collect(java.util.stream.Collectors.toMap(
                        UserDetailsObj::getUserId, UserDetailsObj::getUsername));
        model.addAttribute("ACTIVE_USERS_MAP", activeUsersMap);
        return "admin/campaign/centralConfig";
    }

    @PostMapping("/campaign/central-config/save")
    public String saveCentralConfig(@ModelAttribute UdnCentralConfigEntity config,
                                    RedirectAttributes redirectAttribs) {
        try {
            UdnCentralConfigEntity existing = centralConfigRepository.findTopByOrderByIdAsc();
            if (existing != null) {
                config.setId(existing.getId());
            }
            centralConfigRepository.save(config);
            logger.info("[CampaignController] Central config saved successfully");
            redirectAttribs.addFlashAttribute("successMsg", "Settings saved successfully!");
        } catch (Exception e) {
            logger.error("[CampaignController] Error saving central config", e);
            redirectAttribs.addFlashAttribute("errorMsg", "Error saving settings: " + e.getMessage());
        }
        return "redirect:/campaign/central-config";
    }

    // ========== Lead Sync (AJAX) ==========

    @GetMapping("/sync_social_leads")
    @ResponseBody
    public Map<String, Object> syncSocialLeads(
            @RequestParam("campaignFormId") Long campaignFormId) {
        Map<String, Object> response = new HashMap<>();
        try {
            List<Map<String, String>> importedLeads = socialMediaLeadService.fetchAndImportLeads(campaignFormId);

            int newLeads = 0, errors = 0;
            List<String> errorMessages = new java.util.ArrayList<>();
            for (Map<String, String> lead : importedLeads) {
                if ("Imported Successfully".equals(lead.get("status"))) newLeads++;
                else if ("Error".equals(lead.get("status"))) {
                    errors++;
                    if (lead.get("message") != null) errorMessages.add(lead.get("message"));
                }
            }

            String msg;
            if (newLeads > 0 && errors == 0) {
                msg = newLeads + " new lead(s) imported successfully!";
            } else if (newLeads > 0) {
                msg = newLeads + " lead(s) imported. " + errors + " failed.";
            } else if (errors > 0) {
                msg = errors + " lead(s) failed: " + String.join(" | ", errorMessages);
            } else {
                msg = "No new leads. All leads are already synced.";
            }

            response.put("success", errors == 0 || newLeads > 0);
            response.put("newLeadsImported", newLeads);
            response.put("errors", errors);
            response.put("errorDetails", errorMessages);
            response.put("message", msg);

        } catch (Exception e) {
            response.put("success", false);
            response.put("message", "Error syncing leads: " + e.getMessage());
            logger.error("[CampaignController] Lead sync error", e);
        }
        return response;
    }

    @GetMapping("/test_social_connection")
    @ResponseBody
    public Map<String, Object> testConnection() {
        return socialMediaLeadService.testConnection();
    }
}
