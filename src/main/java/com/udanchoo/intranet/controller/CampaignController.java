package com.udanchoo.intranet.controller;

import com.udanchoo.intranet.entity.CampaignFormEntity;
import com.udanchoo.intranet.entity.UdnCentralConfigEntity;
import com.udanchoo.intranet.repository.CampaignFormRepository;
import com.udanchoo.intranet.repository.UdnCentralConfigRepository;
import com.udanchoo.intranet.service.SocialMediaLeadService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    // ========== Campaign Form CRUD ==========

    @GetMapping("/campaign/list")
    public String campaignList(Model model) {
        List<CampaignFormEntity> campaigns = campaignFormRepository.findAll();
        model.addAttribute("campaigns", campaigns);
        return "admin/campaign/campaignList";
    }

    @GetMapping("/campaign/add")
    public String addCampaignForm(Model model) {
        model.addAttribute("campaign", new CampaignFormEntity());
        return "admin/campaign/addCampaignForm";
    }

    @PostMapping("/campaign/save")
    public String saveCampaignForm(@ModelAttribute CampaignFormEntity campaignFormEntity) {
        try {
            if (campaignFormEntity.getActive() == null) campaignFormEntity.setActive(true);
            campaignFormRepository.save(campaignFormEntity);
            logger.info("[CampaignController] Saved campaign form: {}", campaignFormEntity.getFormName());
        } catch (Exception e) {
            logger.error("[CampaignController] Error saving campaign form", e);
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
        return "admin/campaign/centralConfig";
    }

    @PostMapping("/campaign/central-config/save")
    public String saveCentralConfig(@ModelAttribute UdnCentralConfigEntity config) {
        try {
            UdnCentralConfigEntity existing = centralConfigRepository.findTopByOrderByIdAsc();
            if (existing != null) {
                config.setId(existing.getId());
            }
            centralConfigRepository.save(config);
            logger.info("[CampaignController] Central config saved successfully");
        } catch (Exception e) {
            logger.error("[CampaignController] Error saving central config", e);
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
            for (Map<String, String> lead : importedLeads) {
                if ("Imported Successfully".equals(lead.get("status"))) newLeads++;
                else if ("Error".equals(lead.get("status"))) errors++;
            }

            response.put("success", true);
            response.put("newLeadsImported", newLeads);
            response.put("errors", errors);
            response.put("totalImported", socialMediaLeadService.getImportedLeadCount());
            response.put("leads", importedLeads);
            response.put("message", newLeads > 0
                    ? newLeads + " new lead(s) imported successfully!" + (errors > 0 ? " (" + errors + " error(s))" : "")
                    : (errors > 0 ? errors + " lead(s) failed to import." : "No new leads. All leads are already synced."));

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
