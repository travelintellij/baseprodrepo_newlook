package com.udanchoo.intranet.controller;

import com.udanchoo.intranet.model.quotation.Itinerary;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import com.udanchoo.intranet.service.QuotationServiceImpl;
import com.udanchoo.intranet.service.LeadServiceImpl;
import com.udanchoo.intranet.entity.quotation.Tg_Quotation_Recorder_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;


@Controller
@RequestMapping("/itinerary")
public class ItineraryPageController {

    @Value("${ITINERARY_SERVICE_URL}")
    private String QUOTATION_SERVICE_BASE;

    @Autowired
    private QuotationServiceImpl quotationService;

    @Autowired
    private LeadServiceImpl leadService;

    @GetMapping("/create")
    public String create(@RequestParam("leadId") Long leadId, 
                       @RequestParam(required = false) Long quotationId,
                       Model model) {
        Itinerary itinerary = new Itinerary();
        itinerary.setLeadId(leadId);
        itinerary.setQuotationId(quotationId);
        
        if (quotationId != null) {
            try {
                Tg_Quotation_Recorder_Entity qtn = quotationService.findQuotationRecordById(quotationId);
                model.addAttribute("linkedQuotationName", qtn.getQuotationName());
                model.addAttribute("linkedQuotationId", qtn.getQuotationId());
            } catch (Exception e) {
                System.err.println("Error fetching quotation details: " + e.getMessage());
            }
        }

        try {
            Tg_Leads_Recorder_Entity leadEntity = leadService.findLeadRecordById(leadId);
            TgLeadsRecorderVO leadVo = leadService.getLeadVoFromEntity(leadEntity);
            model.addAttribute("leadName", leadVo.getContactName());
        } catch (Exception e) {
            System.err.println("Error fetching lead details: " + e.getMessage());
        }

        model.addAttribute("leadId", leadId);
        model.addAttribute("quotationId", quotationId);
        model.addAttribute("itinerary", itinerary);
        return "createItineraryPage";
    }

    @GetMapping("/duplicate_itinerary")
    public String duplicatePage(@RequestParam Long leadId, 
                              @RequestParam(required = false) Long quotationId,
                              Model model) {

        RestTemplate restTemplate = new RestTemplate();

        String url = QUOTATION_SERVICE_BASE
                + "/get_itineraries_by_lead?leadId=" + leadId;

        try {
            List itineraryList = restTemplate.getForObject(url, List.class);
            model.addAttribute("itineraryList", itineraryList);
        } catch (Exception e) {
            System.err.println("Error fetching itineraries: " + e.getMessage());
        }

        if (quotationId != null) {
            try {
                Tg_Quotation_Recorder_Entity qtn = quotationService.findQuotationRecordById(quotationId);
                model.addAttribute("linkedQuotationName", qtn.getQuotationName());
                model.addAttribute("linkedQuotationId", qtn.getQuotationId());
            } catch (Exception e) {
                System.err.println("Error fetching quotation details: " + e.getMessage());
            }
        }

        try {
            Tg_Leads_Recorder_Entity leadEntity = leadService.findLeadRecordById(leadId);
            TgLeadsRecorderVO leadVo = leadService.getLeadVoFromEntity(leadEntity);
            model.addAttribute("leadName", leadVo.getContactName());
        } catch (Exception e) {
            System.err.println("Error fetching lead details: " + e.getMessage());
        }

        model.addAttribute("leadId", leadId);
        model.addAttribute("quotationId", quotationId);
        return "duplicateItineraryPage";
    }

    @GetMapping("/link_existing_itinerary")
    public String linkPage(@RequestParam Long leadId, 
                         @RequestParam(required = false) Long quotationId,
                         Model model) {

        RestTemplate restTemplate = new RestTemplate();

        String url = QUOTATION_SERVICE_BASE
                + "/get_itineraries_by_lead?leadId=" + leadId;

        try {
            List itineraryList = restTemplate.getForObject(url, List.class);
            model.addAttribute("itineraryList", itineraryList);
        } catch (Exception e) {
            System.err.println("Error fetching itineraries: " + e.getMessage());
        }

        if (quotationId != null) {
            try {
                Tg_Quotation_Recorder_Entity qtn = quotationService.findQuotationRecordById(quotationId);
                model.addAttribute("linkedQuotationName", qtn.getQuotationName());
                model.addAttribute("linkedQuotationId", qtn.getQuotationId());
            } catch (Exception e) {
                System.err.println("Error fetching quotation details: " + e.getMessage());
            }
        }

        try {
            Tg_Leads_Recorder_Entity leadEntity = leadService.findLeadRecordById(leadId);
            TgLeadsRecorderVO leadVo = leadService.getLeadVoFromEntity(leadEntity);
            model.addAttribute("leadName", leadVo.getContactName());
        } catch (Exception e) {
            System.err.println("Error fetching lead details: " + e.getMessage());
        }

        model.addAttribute("leadId", leadId);
        model.addAttribute("quotationId", quotationId);
        return "linkItineraryPage";
    }

    /**
     * SAVE / UPDATE itinerary with days.
     * Uses proper Spring MVC model binding via @ModelAttribute.
     */
    @PostMapping("/save")
    public String saveItinerary(@ModelAttribute("itinerary") Itinerary itinerary) {

        RestTemplate restTemplate = new RestTemplate();
        String url;

        if (itinerary.getItineraryId() != null) {
            url = QUOTATION_SERVICE_BASE + "/update_itinerary";
        } else {
            url = QUOTATION_SERVICE_BASE + "/save_itinerary";
        }

        try {
            // Explicitly set JSON content type for RestTemplate
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            HttpEntity<Itinerary> entity = new HttpEntity<>(itinerary, headers);

            String savedItineraryId = restTemplate.postForObject(url, entity, String.class);

            // AUTO-LINK if quotationId is present
            if (itinerary.getQuotationId() != null && savedItineraryId != null) {
                String linkUrl = QUOTATION_SERVICE_BASE + "/update_quotation_itinerary";
                restTemplate.postForObject(
                        linkUrl + "?quotationId=" + itinerary.getQuotationId() + "&itineraryId=" + savedItineraryId,
                        null,
                        String.class
                );
                return "redirect:/form_view_quotation_details?quotationId=" + itinerary.getQuotationId() + "&leadId=" + itinerary.getLeadId();
            }
        } catch (org.springframework.web.client.RestClientResponseException e) {
            System.err.println("Backend error during save: " + e.getResponseBodyAsString());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("Error saving itinerary: " + e.getMessage());
            e.printStackTrace();
        }

        return "redirect:/itinerary/list?leadId=" + itinerary.getLeadId();
    }

    // DUPLICATE ACTION (POST)
    @PostMapping("/duplicate_itinerary_action")
    public String duplicateAction(
            @RequestParam Long leadId,
            @RequestParam Long itineraryId,
            @RequestParam(required = false) Long quotationId) {

        RestTemplate restTemplate = new RestTemplate();

        String url = QUOTATION_SERVICE_BASE + "/duplicate_itinerary";

        try {
            String newItineraryId = restTemplate.postForObject(
                    url + "?leadId=" + leadId + "&itineraryId=" + itineraryId,
                    null,
                    String.class
            );

            // AUTO-LINK if quotationId is present
            if (quotationId != null && newItineraryId != null) {
                String linkUrl = QUOTATION_SERVICE_BASE + "/update_quotation_itinerary";
                restTemplate.postForObject(
                        linkUrl + "?quotationId=" + quotationId + "&itineraryId=" + newItineraryId,
                        null,
                        String.class
                );
                return "redirect:/form_view_quotation_details?quotationId=" + quotationId + "&leadId=" + leadId;
            }

        } catch (Exception e) {
            System.err.println("Error duplicating itinerary: " + e.getMessage());
        }

        return "redirect:/itinerary/list?leadId=" + leadId;
    }

    // LINK ACTION (POST)
    @PostMapping("/link_existing_itinerary_action")
    public String linkAction(
            @RequestParam Long leadId,
            @RequestParam Long itineraryId,
            @RequestParam(required = false) Long quotationId) {

        RestTemplate restTemplate = new RestTemplate();

        String url = QUOTATION_SERVICE_BASE + "/link_existing_itinerary";

        try {
            String linkedItineraryId = restTemplate.postForObject(
                    url + "?leadId=" + leadId + "&itineraryId=" + itineraryId,
                    null,
                    String.class
            );

            // AUTO-LINK if quotationId is present
            if (quotationId != null && linkedItineraryId != null) {
                String linkUrl = QUOTATION_SERVICE_BASE + "/update_quotation_itinerary";
                restTemplate.postForObject(
                        linkUrl + "?quotationId=" + quotationId + "&itineraryId=" + linkedItineraryId,
                        null,
                        String.class
                );
                return "redirect:/form_view_quotation_details?quotationId=" + quotationId + "&leadId=" + leadId;
            }

        } catch (Exception e) {
            System.err.println("Error linking itinerary: " + e.getMessage());
        }

        return "redirect:/itinerary/list?leadId=" + leadId;
    }


    @GetMapping("/list")
    public String listItineraries(@RequestParam(required = false) Long leadId, Model model) {
        if (leadId == null) {
            return "redirect:/view_leads";
        }

        RestTemplate restTemplate = new RestTemplate();

        String url = QUOTATION_SERVICE_BASE
                + "/get_itineraries_by_lead?leadId=" + leadId;

        try {
            List list = restTemplate.getForObject(url, List.class);
            model.addAttribute("itineraryList", list);
        } catch (Exception e) {
            System.err.println("Error listing itineraries: " + e.getMessage());
            // Rethrow or handle to show error in UI
            throw e;
        }

        try {
            Tg_Leads_Recorder_Entity leadEntity = leadService.findLeadRecordById(leadId);
            TgLeadsRecorderVO leadVo = leadService.getLeadVoFromEntity(leadEntity);
            model.addAttribute("leadName", leadVo.getContactName());
        } catch (Exception e) {
            System.err.println("Error fetching lead details: " + e.getMessage());
        }

        try {
            Tg_Leads_Recorder_Entity leadEntity = leadService.findLeadRecordById(leadId);
            TgLeadsRecorderVO leadVo = leadService.getLeadVoFromEntity(leadEntity);
            model.addAttribute("leadName", leadVo.getContactName());
        } catch (Exception e) {
            System.err.println("Error fetching lead details: " + e.getMessage());
        }

        model.addAttribute("leadId", leadId);
        return "itineraryListPage";
    }

    @GetMapping("/edit/{id}")
    public String editItinerary(@PathVariable Long id,
                                @RequestParam Long leadId,
                                Model model) {

        RestTemplate restTemplate = new RestTemplate();

        String url = QUOTATION_SERVICE_BASE
                + "/get_itinerary_by_id?id=" + id;

        try {
            String jsonResponse = restTemplate.getForObject(url, String.class);
            
            // Re-fetch as object (or use ObjectMapper if available, but for simplicity we keep getForObject)
            Itinerary itinerary = restTemplate.getForObject(url, Itinerary.class);
            model.addAttribute("itinerary", itinerary);
            
            if (itinerary != null && itinerary.getQuotationId() != null) {
                try {
                    Tg_Quotation_Recorder_Entity qtn = quotationService.findQuotationRecordById(itinerary.getQuotationId());
                    model.addAttribute("linkedQuotationName", qtn.getQuotationName());
                    model.addAttribute("linkedQuotationId", qtn.getQuotationId());
                } catch (Exception e) {
                    System.err.println("Error fetching quotation details: " + e.getMessage());
                }
            }
        } catch (Exception e) {
            System.err.println("Error editing itinerary: " + e.getMessage());
        }

        model.addAttribute("leadId", leadId);
        return "createItineraryPage";
    }

    @GetMapping("/preview/{id}")
    public String previewItinerary(@PathVariable Long id,
                                   @RequestParam Long leadId,
                                   @RequestParam(value = "mode", required = false) String mode,
                                   Model model) {

        RestTemplate restTemplate = new RestTemplate();

        String url = QUOTATION_SERVICE_BASE
                + "/get_itinerary_by_id?id=" + id;

        try {
            Itinerary itinerary = restTemplate.getForObject(url, Itinerary.class);
            model.addAttribute("itinerary", itinerary);
            
            if (itinerary != null && itinerary.getQuotationId() != null) {
                try {
                    Tg_Quotation_Recorder_Entity qtn = quotationService.findQuotationRecordById(itinerary.getQuotationId());
                    model.addAttribute("linkedQuotationName", qtn.getQuotationName());
                    model.addAttribute("linkedQuotationId", qtn.getQuotationId());
                } catch (Exception e) {
                    System.err.println("Error fetching quotation details: " + e.getMessage());
                }
            }
        } catch (Exception e) {
            System.err.println("Error previewing itinerary: " + e.getMessage());
        }

        model.addAttribute("leadId", leadId);
        model.addAttribute("mode", mode);
        return "previewItineraryPage";
    }

}