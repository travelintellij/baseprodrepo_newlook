package com.udanchoo.intranet.controller.quotation;


import java.time.format.DateTimeFormatter;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ti.services.request.quotation.QuotationEmailSendingRequestVO;
import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Master_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.entity.quotation.Tg_Quotation_Recorder_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Configuration_Manual_Quotation_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.ClientObj;
import com.udanchoo.intranet.model.EmailMessageVO;
import com.udanchoo.intranet.model.FileUploaderListVO;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.model.quotation.ConfigurationQuotationVO;
import com.udanchoo.intranet.model.quotation.Itinerary;
import com.udanchoo.intranet.model.quotation.TgQuotationRecorderVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.EmailServiceImpl;
import com.udanchoo.intranet.service.HotelServiceImpl;
import com.udanchoo.intranet.service.LeadServiceImpl;
import com.udanchoo.intranet.service.QuotationServiceImpl;
import com.udanchoo.intranet.service.TgB2bPartnerServicesImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.service.WhatsAppServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.validator.ConfigurationQuotationValidator;
import com.udanchoo.intranet.validator.EmailAudienceValidator;

@Controller
public class ConfigurationQuotationController {
	 
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
    private ConfigurationQuotationValidator configurationQtnValidator;
	
	@Autowired
    private HotelServiceImpl hotelService;
	
	@Autowired
	LeadServiceImpl leadService;
	
	@Autowired
	QuotationServiceImpl quotationService;
	
	@Autowired
	EmailServiceImpl emailService;

	@Autowired
	ClientServiceImpl clientService;

	@Autowired
	UserDetailsServiceImpl userService;

	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	TgB2bPartnerServicesImpl b2bPartnerService;
	
	@Autowired
    private RestTemplate restTemplate;
	
	@Value("${all.email.notify.communication.active}")
	private boolean emailNotifyActive;
	
	@Value("${email.preferred.default.email.cc}")
	private String defaultEmailNotifyInCc;
	
	@Value("${email.client.valid}")
	private boolean emailClientNotifyActive;
	
	@Value("${SRVC_CHECK_QTN_EXSTS_URL}")
	private String SRVC_CHECK_QTN_EXSTS_URL;
	
	@Value("${GENERATE_QTN_URL}")
	private String GENERATE_QTN_URL;
	
	@Value("${SRVC_DELETE_QTN_URL}")
	private String SRVC_DELETE_QTN_URL;
	
	@Value("${SRVC_SEND_EMAIL_QTN_URL}")
	private String SRVC_SEND_EMAIL_QTN_URL;
	
	@Value("${ITINERARY_SERVICE_URL}")
	private String ITINERARY_SERVICE_URL;
	
	
	
	@Autowired
    private EmailAudienceValidator emailValidator;
	
	@Autowired
	private WhatsAppServiceImpl whatsappService;

	@Value("${whatsapp.notify.active:false}")
	private boolean whatsappNotifyActive;

    @Value("${whatsapp.template.lead.registered}")
    private String whatsappTemplateId;
	
	@Value("${BASE_QUOTATION_URL:http://yourshms.com/view/}")
	private String baseQuotationUrl;
	
	

	
	private UserDetailsObj getLoggedInUser() {
	    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    	String username;
	    	if (principal instanceof UserDetails) {
	    	   username = ((UserDetails)principal).getUsername();
	    	} else {
	    	   username = principal.toString();
	    	}
	     	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
	     	
	     	return userObj;
	 }
	
    


	@RequestMapping("/form_view_configure_quotation_details")
	public ModelAndView form_view_configure_quotation_details(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_CNF") ConfigurationQuotationVO configurationQtnVO,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = new ModelAndView();
		Tg_Leads_Recorder_Entity tgLeadEntity =leadService.findLeadRecordById(leadRecorderObj.getLeadId());
		leadRecorderObj.updateLeadVoFromEntity(tgLeadEntity);
		leadRecorderObj.setSourceName(commonService.findDestinationById(leadRecorderObj.getSource()).getCityName());
		leadRecorderObj.setDestinationName(commonService.findDestinationById(leadRecorderObj.getDestination()).getCityName());
		leadRecorderObj.setContactName(clientService.find_ClientBy_Id(leadRecorderObj.getContactId()).getClientName());
		Tg_B2b_Partner_Entity b2bPartner = b2bPartnerService.findPartnerById(leadRecorderObj.getLeadSource());
		leadRecorderObj.setLeadSourceShortName(b2bPartner.getPartnerShortName());
		leadRecorderObj.setLeadSourceName(b2bPartner.getPartnerName());
		leadRecorderObj.setStatusName(commonService.find_DealStatusById(leadRecorderObj.getLeadStatus()).getWorkloadStatusName());
		leadRecorderObj.setLeadOwnerName(userService.findUserByID(leadRecorderObj.getLeadOwner()).getUsername());
		Tg_Quotation_Recorder_Entity quotationEntity= quotationService.findQuotationRecordById(qtnRecorderObj.getQuotationId());
		qtnRecorderObj.setVoFromEntity(quotationEntity);
		//updateManualConfigurationAdditionalFields(qtnRecorderObj);
		qtnRecorderObj.setLeadEntity(tgLeadEntity);
		
		
        Map<String, String> params = new HashMap<String, String>();
        params.put("leadId", String.valueOf(leadRecorderObj.getLeadId()));
        params.put("quotationId", String.valueOf(quotationEntity.getQuotationId()));
        params.put("version", String.valueOf(quotationEntity.getVersion()));
        
		Boolean isQuotationExists = restTemplate.getForObject(SRVC_CHECK_QTN_EXSTS_URL, Boolean.class,params );

		mapview.addObject("QUOTATION_EXISTS", isQuotationExists);
		
		if(quotationService.configurationQuotationExists(quotationEntity)) {
			mapview.setViewName("quotation/configuration/form_view_add_configuration_manual_quotation");
			mapview.addObject("B2B_PARTNERS_MAP", b2bPartnerService.find_All_B2bPartners_Map());
			Udn_Configuration_Manual_Quotation_Entity configurationQuotationEntity = quotationService.findConfigurationBasedOnQuotationId(quotationEntity);
			configurationQtnVO.updateConfigurationVoFromEntity(configurationQuotationEntity);
		}else {
			mapview.setViewName("quotation/configuration/form_view_add_configuration_manual_quotation");
			mapview.addObject("B2B_PARTNERS_MAP", b2bPartnerService.find_All_B2bPartners_Map());
		}
		mapview.addObject("ITINERARIES", fetchItinerariesForLead(leadRecorderObj.getLeadId()));
		return mapview;
	}

	private List<Itinerary> fetchItinerariesForLead(long leadId) {
		try {
			String url = ITINERARY_SERVICE_URL + "/get_itineraries_by_lead?leadId=" + leadId;
			Itinerary[] itineraries = restTemplate.getForObject(url, Itinerary[].class);
			return itineraries != null ? java.util.Arrays.asList(itineraries) : new ArrayList<>();
		} catch (Exception e) {
			e.printStackTrace();
			return new ArrayList<>();
		}
	}

	/*private void updateManualConfigurationAdditionalFields(TgQuotationRecorderVO qtnRecorderObj) {
		qtnRecorderObj.getHotelVoList().forEach((e) -> { 
			try {
				e.setHotelName(hotelService.find_HotelbyId(e.getHotelId()).getHotelName());
			} catch (RecordNotFoundException e1) {
				e.setHotelName("Hotel Name Not Found" );
				e1.printStackTrace();
			}
			e.setCityName(commonService.findDestinationById(e.getCityId()).getCityName());
			e.setRoomCategoryName(hotelService.find_RoomCategoryById(e.getRoomCategoryId()).getRoomCategoryName());
			e.setMealPlanName((String) UdanChooConstants.MEAL_PLANS_MAP.get(e.getMealPlan()));
		});
		
	}*/
	
	
	@RequestMapping("/form_view_cost_remarks_configure_quotation_details")
	public ModelAndView form_view_cost_remarks_configure_quotation_details(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_CNF") ConfigurationQuotationVO configurationQtnVO,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = new ModelAndView();
		Tg_Leads_Recorder_Entity tgLeadEntity =leadService.findLeadRecordById(leadRecorderObj.getLeadId());
		leadRecorderObj.updateLeadVoFromEntity(tgLeadEntity);
		leadRecorderObj.setSourceName(commonService.findDestinationById(leadRecorderObj.getSource()).getCityName());
		leadRecorderObj.setDestinationName(commonService.findDestinationById(leadRecorderObj.getDestination()).getCityName());
		leadRecorderObj.setContactName(clientService.find_ClientBy_Id(leadRecorderObj.getContactId()).getClientName());
		Tg_B2b_Partner_Entity b2bPartner = b2bPartnerService.findPartnerById(leadRecorderObj.getLeadSource());
		leadRecorderObj.setLeadSourceShortName(b2bPartner.getPartnerShortName());
		leadRecorderObj.setLeadSourceName(b2bPartner.getPartnerName());
		leadRecorderObj.setStatusName(commonService.find_DealStatusById(leadRecorderObj.getLeadStatus()).getWorkloadStatusName());
		leadRecorderObj.setLeadOwnerName(userService.findUserByID(leadRecorderObj.getLeadOwner()).getUsername());
		Tg_Quotation_Recorder_Entity quotationEntity= quotationService.findQuotationRecordById(qtnRecorderObj.getQuotationId());
		qtnRecorderObj.setVoFromEntity(quotationEntity);
		
		qtnRecorderObj.setHotelOptionsWiseMap(quotationService.findOptionWiseHotelMap(qtnRecorderObj.getQuotationId()));
		
		//updateManualConfigurationAdditionalFields(qtnRecorderObj);
		qtnRecorderObj.setLeadEntity(tgLeadEntity);
		
        Map<String, String> params = new HashMap<String, String>();
        params.put("leadId", String.valueOf(leadRecorderObj.getLeadId()));
        params.put("quotationId", String.valueOf(quotationEntity.getQuotationId()));
        params.put("version", String.valueOf(quotationEntity.getVersion()));
        
		Boolean isQuotationExists = restTemplate.getForObject(SRVC_CHECK_QTN_EXSTS_URL, Boolean.class,params );

		mapview.addObject("QUOTATION_EXISTS", isQuotationExists);

		
		if(quotationService.configurationQuotationExists(quotationEntity)) {
			Udn_Configuration_Manual_Quotation_Entity configurationQuotationEntity = quotationService.findConfigurationBasedOnQuotationId(quotationEntity);
			configurationQtnVO.updateConfigurationVoFromEntity(configurationQuotationEntity);
		}
		
		mapview.setViewName("quotation/configuration/form_view_add_cstrem_configuration_manual_quotation");
		mapview.addObject("B2B_PARTNERS_MAP", b2bPartnerService.find_All_B2bPartners_Map());
		/*
		if(quotationService.configurationQuotationExists(quotationEntity)) {
			mapview.setViewName("quotation/configuration/form_view_add_cstrem_configuration_manual_quotation");
			mapview.addObject("B2B_PARTNERS_MAP", b2bPartnerService.find_All_B2bPartners_Map());
		}else {
			mapview.setViewName("quotation/configuration/form_view_add_cstrem_configuration_manual_quotation");
			mapview.addObject("B2B_PARTNERS_MAP", b2bPartnerService.find_All_B2bPartners_Map());
		}*/
		return mapview;
	}
	
	
	@Transactional
	@PostMapping(value = "/create_update_generate_manual_configuration_quotation", params = "Save Configuration")
	public ModelAndView create_update_generate_manual_configuration_quotation(@RequestParam long quotationId,@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_CNF") ConfigurationQuotationVO configurationQtnVO,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		configurationQtnValidator.validate(configurationQtnVO, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		if(result.hasErrors()) {
			modelView = form_view_configure_quotation_details(leadRecorderObj,qtnRecorderObj,configurationQtnVO,result,redirectAttrib); 
			return modelView;
		}else {
				Udn_Configuration_Manual_Quotation_Entity configQtnEntity = new Udn_Configuration_Manual_Quotation_Entity(configurationQtnVO);
				configQtnEntity.setQuotationEntity(quotationEntity);
				quotationEntity.setConfigurationQuotationEntity(configQtnEntity);
				
				// Update Itinerary ID if changed in this screen
				if (qtnRecorderObj.getItineraryId() != null) {
					quotationEntity.setItineraryId(qtnRecorderObj.getItineraryId());
				}
				
				quotationService.saveLead(quotationEntity);
				redirectAttrib.addFlashAttribute("Success","Quotation Configuration is updated Successfully!!");
				modelView.setViewName("redirect:form_view_configure_quotation_details?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&quotationId="+quotationId);
				
				Map<String, String> params = new HashMap<String, String>();
		        params.put("leadId", String.valueOf(leadRecorderObj.getLeadId()));
		        params.put("quotationId", String.valueOf(quotationEntity.getQuotationId()));
		        params.put("version", String.valueOf(quotationEntity.getVersion()));
				Boolean isQuotationDeleted = restTemplate.getForObject(SRVC_DELETE_QTN_URL, Boolean.class,params );
				if(!isQuotationDeleted)
					redirectAttrib.addFlashAttribute("Success","Quotation Configuration is updated Successfully but existing quotation could not be deleted!!");
				

				
		}
		return modelView; 
	 }


	@PostMapping(value = "/create_update_generate_manual_configuration_quotation", params = "Generate Quotation")
	public ModelAndView generateQuotation(@RequestParam long quotationId,@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_CNF") ConfigurationQuotationVO configurationQtnVO,BindingResult result,final RedirectAttributes redirectAttrib) {
		Map<String, String> params = new HashMap<String, String>();
        params.put("quotationId", String.valueOf(quotationId));
        params.put("manualConfigurationQuotationId", String.valueOf(configurationQtnVO.getManualConfigurationQuotationId()));
		Boolean isQuotationGenerated= restTemplate.getForObject(GENERATE_QTN_URL, Boolean.class,params );
		ModelAndView modelView = form_view_configure_quotation_details(leadRecorderObj,qtnRecorderObj,configurationQtnVO,result,redirectAttrib);
		if(isQuotationGenerated) {
			modelView.addObject("Success","Quotation is generated Successfully!!");
		}
		else {
			modelView.addObject("Error","Error: While Generating quotation. Please contact Admin !!");
			//redirectAttrib.addFlashAttribute("Error","Error: While Generating quotation. Please contact Admin !!");
		}
		return modelView; 
		
	}	
	
	
	@PostMapping(value = "/create_update_costing_remarks_manual_configuration_quotation", params = "Generate Quotation")
	public ModelAndView generateQuotationFromCostingScreen(@RequestParam long quotationId,@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_CNF") ConfigurationQuotationVO configurationQtnVO,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView modelView = new ModelAndView("forward:create_update_generate_manual_configuration_quotation");
		return modelView;
	}
	
	
	@Transactional
	@PostMapping(value="/create_update_costing_remarks_manual_configuration_quotation", params = "Save Configuration")
	public ModelAndView create_update_costing_remarks_manual_configuration_quotation(@RequestParam long quotationId,@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_CNF") ConfigurationQuotationVO configurationQtnVO,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		configurationQtnValidator.validate(configurationQtnVO, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		if(result.hasErrors()) {
			modelView = form_view_configure_quotation_details(leadRecorderObj,qtnRecorderObj,configurationQtnVO,result,redirectAttrib); 
			return modelView;
		}else {
			Udn_Configuration_Manual_Quotation_Entity configQtnEntity ;
			if(quotationService.configurationQuotationExists(quotationEntity))	{
				configQtnEntity = quotationService.findConfigurationBasedOnQuotationId(quotationEntity);
				configQtnEntity.setRemarks(configurationQtnVO.getRemarks());
				configQtnEntity.setTotalQuotationAmount(configurationQtnVO.getTotalQuotationAmount());
			}
			else {
				configQtnEntity = new Udn_Configuration_Manual_Quotation_Entity(configurationQtnVO);
			}
			configQtnEntity.setQuotationEntity(quotationEntity);
			quotationEntity.setConfigurationQuotationEntity(configQtnEntity);
			quotationService.saveLead(quotationEntity);
			redirectAttrib.addFlashAttribute("Success","Quotation Configuration is updated Successfully!!");
			modelView.setViewName("redirect:form_view_cost_remarks_configure_quotation_details?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&quotationId="+quotationId);
		}
		return modelView; 
	 }
	
	
	@RequestMapping("/form_view_delete_confirm_configure_quotation_details")
	public ModelAndView form_view_delete_confirm_configure_quotation_details(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_CNF") ConfigurationQuotationVO configurationQtnVO,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_configure_quotation_details(leadRecorderObj,qtnRecorderObj,configurationQtnVO,result,redirectAttrib);

		mapview.setViewName("quotation/configuration/form_view_delete_configuration_manual_quotation");
		return mapview;
	}

	@Transactional
	@PostMapping("/delete_delete_manual_configuration_quotation")
	public ModelAndView delete_delete_manual_configuration_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_CNF") ConfigurationQuotationVO configurationQtnVO,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView modelView = new ModelAndView();
		quotationService.deleteConfigurationQuotation(configurationQtnVO.getManualConfigurationQuotationId());
		redirectAttrib.addFlashAttribute("Success","Quotation Record is reset Successfully!!");
		modelView.setViewName("redirect:form_view_configure_quotation_details?leadId="+leadRecorderObj.getLeadId() + "&quotationId="+qtnRecorderObj.getQuotationId());
		return modelView; 
	 }
	
	
	
	@Transactional
	@RequestMapping("/form_view_quotation_modal")
	public ModelAndView form_view_quotation_modal(@RequestParam long quotationId,@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_CNF") ConfigurationQuotationVO configurationQtnVO,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		/*Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		qtnRecorderObj.setVoFromEntity(quotationEntity);
		*/
		modelView = form_view_configure_quotation_details(leadRecorderObj,qtnRecorderObj,configurationQtnVO,result,redirectAttrib);
		updateManualFlightAdditionalFields(qtnRecorderObj);
		qtnRecorderObj.setHotelOptionsWiseMap(quotationService.findOptionWiseHotelMap(qtnRecorderObj.getQuotationId()));
		//updateManualHotelAdditionalFields(qtnRecorderObj);
		updateManualTransferAdditionalFields(qtnRecorderObj);
		updateManualSightSeeingAdditionalFields(qtnRecorderObj);
		updateManualVisaAdditionalFields(qtnRecorderObj);
		updateManualInsuranceAdditionalFields(qtnRecorderObj);
		updateManualCruiseAdditionalFields(qtnRecorderObj);
		updateManualPackageAdditionalFields(qtnRecorderObj);
		Tg_B2b_Partner_Entity partnerEntity ;
		if(configurationQtnVO.getManualConfigurationQuotationId()!=0) {
			Udn_Configuration_Manual_Quotation_Entity configuration = quotationService.findQuotationConfigurationRecordById(configurationQtnVO.getManualConfigurationQuotationId());
			configurationQtnVO.updateConfigurationVoFromEntity(configuration);
			partnerEntity = b2bPartnerService.findPartnerById(configurationQtnVO.getPartnerId());
			
		}else {
			partnerEntity = b2bPartnerService.findPartnerById(UdanChooConstants.B2B_PARTNER_SELF_REFERENCE);
		}
		modelView.addObject("B2B_PARTNER", partnerEntity);
		modelView.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm"));

		if (qtnRecorderObj.getItineraryId() != null) {
			try {
				String url = ITINERARY_SERVICE_URL + "/get_itinerary?itineraryId=" + qtnRecorderObj.getItineraryId();
				Itinerary linkedItinerary = restTemplate.getForObject(url, Itinerary.class);
				modelView.addObject("LINKED_ITINERARY", linkedItinerary);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		modelView.setViewName("quotation/configuration/view_final_quotation");
		return modelView; 
	 }

	private void updateManualFlightAdditionalFields(TgQuotationRecorderVO qtnRecorderObj) {
		qtnRecorderObj.getManualQuotationsVoList().forEach((e) -> { 
			e.setAirlineName(commonService.findAirlineById(e.getAirlineId()).getAirlineShortName());
			e.setCabinClassName(UdanChooConstants.CABIN_CLASS.get(e.getCabinClass()));
			e.setOriginCity(commonService.findAirportById(e.getAirportCodeOrigin()).getCityName());
			e.setDestinationCity(commonService.findAirportById(e.getAirportCodeDestination()).getCityName());
			e.getFlightStopsQuotationsVoList().forEach((a) -> { 
				a.setOriginCity(commonService.findAirportById(a.getAirportCodeOrigin()).getCityName());
				a.setDestinationCity(commonService.findAirportById(a.getAirportCodeDestination()).getCityName());
				a.setAirlineName(commonService.findAirlinebyId(a.getAirlineId()).getAirlineShortName());
				a.setCabinClassName(UdanChooConstants.CABIN_CLASS.get(a.getCabinClass()));
			});
		});
	}
	
	private void updateManualHotelAdditionalFields(TgQuotationRecorderVO qtnRecorderObj) {
		qtnRecorderObj.getHotelVoList().forEach((e) -> { 
			try {
				e.setHotelName(hotelService.find_HotelbyId(e.getHotelId()).getHotelName());
			} catch (RecordNotFoundException e1) {
				e.setHotelName("Hotel Name Not Found" );
				e1.printStackTrace();
			}
			e.setCityName(commonService.findDestinationById(e.getCityId()).getCityName());
			e.setRoomCategoryName(hotelService.find_RoomCategoryById(e.getRoomCategoryId()).getRoomCategoryName());
			e.setMealPlanName((String) UdanChooConstants.MEAL_PLANS_MAP.get(e.getMealPlan()));
		});
	}
	private void updateManualTransferAdditionalFields(TgQuotationRecorderVO qtnRecorderObj) {
		qtnRecorderObj.getTransferVoList().forEach((e) -> { 
			e.setDropToCityName(commonService.findDestinationById(e.getDropToCityId()).getCityName());
			e.setPickUpCityName(commonService.findDestinationById(e.getPickUpCityId()).getCityName());
			e.setDropToDesc(UdanChooConstants.TRANSFER_POINT_MAP.get(e.getDropTo()));
			e.setPickUpFromDesc(UdanChooConstants.TRANSFER_POINT_MAP.get(e.getPickUpFrom()));
			e.setTransferTypeName(UdanChooConstants.TRANSFER_TYPE_MODE.get(e.getTransferType()));
		});
	}
	private void updateManualSightSeeingAdditionalFields(TgQuotationRecorderVO qtnRecorderObj) {
		qtnRecorderObj.getSightSeeingVoList().forEach((e) -> { 
			e.setCityName(commonService.findDestinationById(e.getCityId()).getCityName());
			e.setTransferTypeName(UdanChooConstants.TRANSFER_TYPE_MODE.get(e.getTransferType()));
		});
	}

	private void updateManualVisaAdditionalFields(TgQuotationRecorderVO qtnRecorderObj) {
		qtnRecorderObj.getVisaVoList().forEach((e) -> { 
			Udn_Visa_Master_Entity visaEntity = e.getVisaQuotationEntity();
			e.setVisaConsulate(commonService.findDestinationById(visaEntity.getConsulateCity()).getCityName());
			e.setVisaCountry(commonService.findDestinationByCountryCode(visaEntity.getCountryCode()).getCountryName());
		});
	}
	private void updateManualInsuranceAdditionalFields(TgQuotationRecorderVO qtnRecorderObj) {
		qtnRecorderObj.getInsuranceVoList().forEach((e) -> { 
			e.setInsuranceProviderName(UdanChooConstants.INSURANCE_PROVIDERS_MAP.get(e.getInsuranceProvider()));
			e.setCountryName(commonService.findDestinationById(e.getCountryId()).getCountryName());
		});
	}
	private void updateManualCruiseAdditionalFields(TgQuotationRecorderVO qtnRecorderObj) {
		qtnRecorderObj.getCruiseVoList().forEach((e) -> { 
			e.setCityName(commonService.findDestinationById(e.getCityId()).getCityName());
			e.setStateRoomName(UdanChooConstants.CRUISE_STATE_ROOM_TYPE_MAP.get(e.getStateRoomType()));
			e.setCruiseProviderName(UdanChooConstants.CRUISE_PROVIDER_NAMES_MAP.get(e.getCruiseProvider()));
		});
	}
	private void updateManualPackageAdditionalFields(TgQuotationRecorderVO qtnRecorderObj) {
		qtnRecorderObj.getTourPackageVoList().forEach((e) -> { 
			e.setCityName(commonService.findDestinationById(e.getCityId()).getCityName());
		});
		
	}
	
	@RequestMapping(path = "/form_view_email_quotation", method = RequestMethod.GET)
	public ModelAndView form_view_email_quotation(@RequestParam long quotationId,@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_CNF") ConfigurationQuotationVO configurationQtnVO,@ModelAttribute("EMAIL_DETAILS") EmailMessageVO emailMessageVo ,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = form_view_configure_quotation_details(leadRecorderObj,qtnRecorderObj,configurationQtnVO,result,redirectAttrib);
		
		ClientObj clientObj =clientService.find_ClientBy_Id(leadRecorderObj.getContactId());
		String clientEmail = clientObj.getEmail();
		
		//EmailMessageVO emailMessageVo = new EmailMessageVO();
    	emailMessageVo.setEmailToList(clientEmail);
    	emailMessageVo.setEmailCcList(defaultEmailNotifyInCc);
    	
    	emailMessageVo.setEmailSubject("Quotation: | " + leadRecorderObj.getDestinationName()  + " | " + clientObj.getClientName() + " | Version: " + qtnRecorderObj.getVersion());
    	emailMessageVo.setEmailMessage("Dear " + clientObj.getClientName() + " \n \nThanks for considering us. \n\nPlease find attached quotation for your reference. \n\n\n\n\n\nRegards \n" + userObj.getName() + "\nYour Service Advisor." );
    	
    	configurationQtnVO.setEmailMessageVo(emailMessageVo);
    	//modelView.addObject("EMAIL_DETAILS", emailMessageVo);

		modelView.setViewName("quotation/configuration/form_view_send_email_quotation");
		return modelView; 
		
	}
	
	
	@Transactional
	@PostMapping(value = "/create_update_generate_manual_configuration_quotation", params = "Send Email")
    public ModelAndView send_emailVouchers(@RequestParam long quotationId,@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_CNF") ConfigurationQuotationVO configurationQtnVO,BindingResult result,final RedirectAttributes redirectAttrib,ModelMap model)  {
		UserDetailsObj userObj = getLoggedInUser();
		emailValidator.validate(configurationQtnVO.getEmailMessageVo(), result);
    	ModelAndView modelView = new ModelAndView("redirect:view_view_quotation_email_confirmation?leadId="+leadRecorderObj.getLeadId()+"&quotationId="+quotationId,model);
    	modelView = form_view_configure_quotation_details(leadRecorderObj,qtnRecorderObj,configurationQtnVO,result,redirectAttrib);
    	if(result.hasErrors()) {
    		modelView.setViewName("quotation/configuration/form_view_send_email_quotation");
    		return modelView; 
    	}else {
    		try {
    		   QuotationEmailSendingRequestVO quotationEmailVO = new QuotationEmailSendingRequestVO();   
    		   EmailMessageVO emailMessageVO =configurationQtnVO.getEmailMessageVo();
    		   emailMessageVO.setEmailMessageFrom(userObj.getEmail());
    		   quotationEmailVO.setEmailMessageVO(emailMessageVO);
    		   quotationEmailVO.setLeadId(leadRecorderObj.getLeadId());
    		   quotationEmailVO.setQuotationId(quotationId);
    		   quotationEmailVO.setVersion(qtnRecorderObj.getVersion());
    		   
    		   Boolean isQuotationSent = restTemplate.postForObject(SRVC_SEND_EMAIL_QTN_URL, quotationEmailVO,Boolean.class);
    		   if(isQuotationSent) {	
    			   modelView.addObject("Success","Your Email is sent Successfully!!! ");
    		   }else {
    			   modelView.addObject("Error","Error While Sending!!! Kindly download and manually send the quotation or contact administrator!!.");
    		   }
        	}
        	catch(Exception e) {
        		e.printStackTrace();
        		modelView.addObject("Error","Error Sending Email. Please contact Administrator !! ");
        	}	
    	}
    	
    	return modelView ;
    } 
	
	@RequestMapping("/view_view_quotation_email_confirmation")
	public ModelAndView view_view_quotation_email_confirmation(@RequestParam long quotationId, @ModelAttribute("QTN_OBJ") TgQuotationRecorderVO quotationVO,@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,BindingResult result,final RedirectAttributes redirectAttrib) {
		ConfigurationQuotationVO configurationQtnVO = new ConfigurationQuotationVO();
		ModelAndView modelView = form_view_configure_quotation_details(leadRecorderObj,quotationVO,configurationQtnVO,result,redirectAttrib);
		modelView.setViewName("quotation/configuration/form_view_send_email_quotation_confirmation");
		return modelView;
		
	}

    @RequestMapping("/send_whatsapp_quotation")
    public ModelAndView send_whatsapp_quotation(
            @RequestParam long quotationId,
            @ModelAttribute("QTN_OBJ") TgQuotationRecorderVO quotationVO,
            @ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,
            final RedirectAttributes redirectAttrib) {

        Tg_Quotation_Recorder_Entity quotationEntity =
                quotationService.findQuotationRecordById(quotationId);

        ClientObj client = clientService.find_ClientBy_Id(leadRecorderObj.getContactId());
        UserDetailsObj userObj = getLoggedInUser();

        // ✅ Validate mobile first
        if (client.getMobile() == null || client.getMobile().toString().trim().isEmpty()) {
            redirectAttrib.addFlashAttribute("Error", "Client mobile number not available.");
            return new ModelAndView("redirect:form_view_configure_quotation_details?leadId="
                    + leadRecorderObj.getLeadId() + "&quotationId=" + quotationId);
        }

        // ✅ Check WhatsApp toggle
        if (!whatsappNotifyActive) {
            redirectAttrib.addFlashAttribute("Error", "WhatsApp service is disabled.");
            return new ModelAndView("redirect:form_view_configure_quotation_details?leadId="
                    + leadRecorderObj.getLeadId() + "&quotationId=" + quotationId);
        }

        // ✅ Format mobile properly
        String mobile = String.valueOf(client.getMobile()).replaceAll("\\s+", "");
        mobile = mobile.replaceAll("[^0-9]", "");


        // ✅ Prepare template params
        Map<Integer, String> params = new HashMap<>();
        params.put(1, client.getClientName());                        // {{1}} Customer Name
        params.put(2, String.valueOf(leadRecorderObj.getLeadId()));   // {{2}} Query ID
        params.put(3, userObj.getName());                             // {{3}} Representative Name
        params.put(4, mobile);                                        // {{4}} Mobile
        params.put(5, client.getEmail());                             // {{5}} Email

        boolean sent = false;

        try {
            // ✅ Send WhatsApp message
            sent = whatsappService.sendTemplateMessage(
                    mobile,
                    whatsappTemplateId,   // <-- from application.properties
                    params
            );
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttrib.addFlashAttribute("Error", "WhatsApp sending failed due to exception.");
            return new ModelAndView("redirect:form_view_configure_quotation_details?leadId="
                    + leadRecorderObj.getLeadId() + "&quotationId=" + quotationId);
        }

        // ✅ Handle response
        if (sent) {
            redirectAttrib.addFlashAttribute("Success", "Quotation shared via WhatsApp successfully!");
        } else {
            redirectAttrib.addFlashAttribute("Error", "Failed to share via WhatsApp. Please check configuration.");
        }

        return new ModelAndView("redirect:form_view_configure_quotation_details?leadId="
                + leadRecorderObj.getLeadId() + "&quotationId=" + quotationId);
    }

}

