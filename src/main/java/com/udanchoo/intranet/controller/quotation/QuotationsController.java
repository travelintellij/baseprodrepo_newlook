package com.udanchoo.intranet.controller.quotation;


import java.io.IOException;
import java.net.MalformedURLException;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tg.api.flight.request.object.FlightSearchRequest;
import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;
import com.udanchoo.intranet.entity.Tg_Flt_Airport_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.entity.quotation.Tg_Quotation_Recorder_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Configuration_Manual_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Flight_Quotation_Stop_Detail_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Cruise_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Flight_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Hotel_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Insurance_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Other_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Package_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_SightSeeing_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Transfer_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Visa_Quotation_Entity;
import com.udanchoo.intranet.model.UdnDealStatusVO;
import com.udanchoo.intranet.model.Udn_Deals_Recorder_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.api.flight.Tg_Flt_Airport_Obj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.model.quotation.ConfigurationQuotationVO;
import com.udanchoo.intranet.model.quotation.FlightStopDetailQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualCruiseQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualFlightQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualHotelQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualInsuranceQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualOtherQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualPackageQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualSightSeeingQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualTransferQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualVisaQuotationVO;
import com.udanchoo.intranet.model.quotation.Itinerary;
import com.udanchoo.intranet.model.quotation.TgQuotationRecorderVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.DealServiceImpl;
import com.udanchoo.intranet.service.EmailServiceImpl;
import com.udanchoo.intranet.service.HotelServiceImpl;
import com.udanchoo.intranet.service.LeadServiceImpl;
import com.udanchoo.intranet.service.QuotationServiceImpl;
import com.udanchoo.intranet.service.TgB2bPartnerServicesImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.util.UdanChooUtil;
import com.udanchoo.intranet.validator.FlightStopValidator;
import com.udanchoo.intranet.validator.ManualQuotationValidator;
import com.udanchoo.intranet.validator.QuotationEditValidator;
import com.udanchoo.intranet.validator.QuotationVersionAddValidator;
import org.springframework.web.client.RestTemplate;

@Transactional
@Controller
public class QuotationsController<Resource> {
	 
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
    private ManualQuotationValidator manualQtnValidator;

	@Autowired
    private QuotationEditValidator qtnEditValidator;
	
	@Autowired
    private QuotationVersionAddValidator qtnAddValidator;

	
	@Autowired
    private FlightStopValidator flightStopValidator;
	
	@Autowired
    private RestTemplate restTemplate;
	
		
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
	DealServiceImpl dealService;
	
	@Autowired
	HotelServiceImpl hotelService;
	
	
	@Value("${all.email.notify.communication.active}")
	private boolean emailNotifyActive;
	
	@Value("${email.client.valid}")
	private boolean emailClientNotifyActive;
	
	@Value("${VIEW_QTN_URL}")
	private String VIEW_QTN_URL;
	
	@Value("${DWNLOAD_QTN_URL}")
	private String DWNLOAD_QTN_URL;

	@Value("${CHECK_ITINERARY_EXIST}")
	private String CHECK_ITINERARY_EXIST;
	
	@Value("${ITINERARY_SERVICE_URL}")
	private String ITINERARY_SERVICE_URL;
	
	

	@Autowired
	EntityManager entityManager;
    
	
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
	
	@RequestMapping("view_lead_quotations_list")
	public String view_lead_quotations_list(@RequestParam long leadId, Model model){
		Tg_Leads_Recorder_Entity tgLeadEntity =leadService.findLeadRecordById(leadId);
		TgLeadsRecorderVO leadRecorderVO =leadService.getLeadVoFromEntity(tgLeadEntity);
		Tg_Quotation_Recorder_Entity qtnEntity = findCovertedQuotation(leadId);
		model.addAttribute("CONVERTED_QTN",qtnEntity );
		/*Iterator itrQtnEntity =leadRecorderVO.getLeadQuotationsList().iterator();
		while(itrQtnEntity.hasNext()) {
			Tg_Quotation_Recorder_Entity qtnEntity =(Tg_Quotation_Recorder_Entity) itrQtnEntity.next();
			if(qtnEntity.isConverted()) {
				model.addAttribute("CONVERTED_QTN",qtnEntity );
			}
		}*/
		model.addAttribute("LEAD_OBJ",leadRecorderVO );
	    //return "leads/viewLeadDetails";
		return "quotation/viewLeadQuotationsList";
	}
	
	private Tg_Quotation_Recorder_Entity findCovertedQuotation(long leadId) {
		Tg_Quotation_Recorder_Entity qtnEntity = new Tg_Quotation_Recorder_Entity(); 
		Tg_Leads_Recorder_Entity tgLeadEntity =leadService.findLeadRecordById(leadId);
		TgLeadsRecorderVO leadRecorderVO =leadService.getLeadVoFromEntity(tgLeadEntity);
		Iterator itrQtnEntity =leadRecorderVO.getLeadQuotationsList().iterator();
		while(itrQtnEntity.hasNext()) {
			Tg_Quotation_Recorder_Entity convertedQtnEntity =(Tg_Quotation_Recorder_Entity) itrQtnEntity.next();
			if(convertedQtnEntity.isConverted()) {
				return convertedQtnEntity;
			}
		}
		return qtnEntity;
	}
	
	@RequestMapping("/form_view_new_quotation")
	public ModelAndView form_view_new_quotation(@RequestParam(value="leadId", required=false) Long leadId,
			@RequestParam(value="quotationId", required=false) Long quotationId,
			@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,
			@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,
			BindingResult result) {
		
		if (leadId == null && leadRecorderObj.getLeadId() != null) {
			leadId = leadRecorderObj.getLeadId();
		}
		if (leadId == null) {
			return new ModelAndView("redirect:/view_leads");
		}
		ModelAndView mapview = new ModelAndView("quotation/createNewQuotation");
		Tg_Leads_Recorder_Entity tgLeadEntity = leadService.findLeadRecordById(leadId);
		leadRecorderObj.updateLeadVoFromEntity(tgLeadEntity);
		leadRecorderObj.setSourceName(commonService.findDestinationById(leadRecorderObj.getSource()).getCityName());
		leadRecorderObj.setDestinationName(commonService.findDestinationById(leadRecorderObj.getDestination()).getCityName());
		leadRecorderObj.setContactName(clientService.find_ClientBy_Id(leadRecorderObj.getContactId()).getClientName());
		Tg_B2b_Partner_Entity b2bPartner = b2bPartnerService.findPartnerById(leadRecorderObj.getLeadSource());
		leadRecorderObj.setLeadSourceShortName(b2bPartner.getPartnerShortName());
		leadRecorderObj.setLeadSourceName(b2bPartner.getPartnerName());
		leadRecorderObj.setStatusName(commonService.find_DealStatusById(leadRecorderObj.getLeadStatus()).getWorkloadStatusName());
		leadRecorderObj.setLeadOwnerName(userService.findUserByID(leadRecorderObj.getLeadOwner()).getUsername());
		qtnRecorderObj.setLeadEntity(tgLeadEntity);
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
	
	
	@PostMapping("create_create_lead_quotation")
	public ModelAndView create_create_lead_quotation(@RequestParam(value="leadId", required=false) Long leadId,
			@RequestParam(value="quotationId", required=false) Long quotationId,
			@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,
			@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,
			BindingResult result,
			final RedirectAttributes redirectAttrib ) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		
		if (leadId == null) leadId = leadRecorderObj.getLeadId();
		
		qtnAddValidator.validate(qtnRecorderObj, result);
		if(result.hasErrors()) {
			modelView = form_view_new_quotation(leadId, quotationId, leadRecorderObj, qtnRecorderObj, result);
			return modelView;
		}
		else {
			
			qtnRecorderObj.setCreatedBy(userObj.getUserId());
			qtnRecorderObj.setLastUpdatedBy(userObj.getUserId());
			
			Tg_Leads_Recorder_Entity leadEntity = leadService.findLeadRecordById(leadId);
			int maxVersion = quotationService.fetchMax_QuotationVersion(leadId);
			maxVersion++; // new verion for this quotation. 
			qtnRecorderObj.setVersion(maxVersion);
			Tg_Quotation_Recorder_Entity quotationEntity = new Tg_Quotation_Recorder_Entity(qtnRecorderObj);
			quotationEntity.setLeadEntity(leadEntity);
			leadEntity.getLeadQuotationsList().add(quotationEntity);
			leadService.saveLead(leadEntity);
			modelView.setViewName("redirect:view_lead_quotations_list?leadId="+leadId);
		}
		//leadRecorderObj.setLeadStatus(UdanChooConstants.LEAD_CLOSE_REASON.get(UdanChooConstants.LEAD_NEW));
		/*if(leadRecorderObj.getLeadOwner()==0) {
			leadRecorderObj.setLeadOwner(userObj.getUserId());
		}
		
		leadValidator.validate(leadRecorderObj, result);
		System.out.println(leadRecorderObj);
		if(result.hasErrors()) {
			//modelView.setViewName("leads/form_RegisterNewLead");
			modelView = form_register_newlead(leadRecorderObj, result);
			//modelView.setViewName("forward:form_register_newlead");
			return modelView;
		}else {
			Tg_Leads_Recorder_Entity tgLeadEntity = new Tg_Leads_Recorder_Entity(leadRecorderObj);
			//below is the temporary code and need to be deleted and uncomment the saveLead part. 
			//tgLeadEntity.setLeadId(7l);
			leadService.saveLead(tgLeadEntity);
			leadRecorderObj.setLeadId(tgLeadEntity.getLeadId());
			redirectAttrib.addFlashAttribute("Success", "Lead Record is updated Successfully..");
			modelView.setViewName("redirect:view_lead_details?leadId="+tgLeadEntity.getLeadId());
			if(leadRecorderObj.isLeadCreationClientInformed()) {
				notifyLeadCreationTargetAudience(leadRecorderObj,"LeadCreateConfirmation.ftl",true,true);
			}
			//write email code here. 
		}
		*/
		return modelView;
	 }

	@RequestMapping("/form_view_quotation_details")
	public ModelAndView form_view_quotation_details(@RequestParam(value="leadId", required=false) Long leadId,
			@RequestParam(value="quotationId", required=false) Long quotationId,
			@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,
			@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,
			BindingResult result) {
		
		if (leadId == null && leadRecorderObj.getLeadId() != null) {
			leadId = leadRecorderObj.getLeadId();
		}
		if (quotationId == null && qtnRecorderObj.getQuotationId() > 0) {
			quotationId = qtnRecorderObj.getQuotationId();
		}

		ModelAndView mapview = new ModelAndView("quotation/viewQuotationDetails");
		
		if (leadId == null) {
			// Fallback or error handling
			return new ModelAndView("redirect:/view_leads"); 
		}

		Tg_Leads_Recorder_Entity tgLeadEntity = leadService.findLeadRecordById(leadId);
		leadRecorderObj.setLeadId(leadId);
		leadRecorderObj.updateLeadVoFromEntity(tgLeadEntity);
		leadRecorderObj.setSourceName(commonService.findDestinationById(leadRecorderObj.getSource()).getCityName());
		leadRecorderObj.setDestinationName(commonService.findDestinationById(leadRecorderObj.getDestination()).getCityName());
		leadRecorderObj.setContactName(clientService.find_ClientBy_Id(leadRecorderObj.getContactId()).getClientName());
		Tg_B2b_Partner_Entity b2bPartner = b2bPartnerService.findPartnerById(leadRecorderObj.getLeadSource());
		leadRecorderObj.setLeadSourceShortName(b2bPartner.getPartnerShortName());
		leadRecorderObj.setLeadSourceName(b2bPartner.getPartnerName());
		leadRecorderObj.setStatusName(commonService.find_DealStatusById(leadRecorderObj.getLeadStatus()).getWorkloadStatusName());
		leadRecorderObj.setLeadOwnerName(userService.findUserByID(leadRecorderObj.getLeadOwner()).getUsername());
		
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId != null ? quotationId : qtnRecorderObj.getQuotationId());
		qtnRecorderObj.setQuotationId(quotationEntity.getQuotationId());
		qtnRecorderObj.setVoFromEntity(quotationEntity);
		qtnRecorderObj.setLeadEntity(tgLeadEntity);
		mapview.addObject("ITINERARIES", fetchItinerariesForLead(leadRecorderObj.getLeadId()));
		return mapview;
	}
	
	@RequestMapping("/form_view_edit_quotation_details")
	public ModelAndView form_view_edit_quotation_details(@RequestParam(value="leadId", required=false) Long leadId,
			@RequestParam(value="quotationId", required=false) Long quotationId,
			@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,
			@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,
			BindingResult result) {
		ModelAndView modelView = form_view_quotation_details(leadId, quotationId, leadRecorderObj, qtnRecorderObj, result);
		modelView.setViewName("quotation/viewEditQuotationDetails");
		return modelView;
	}
	
    @Transactional
	@PostMapping("edit_edit_lead_quotation")
	public ModelAndView edit_edit_lead_quotation(@RequestParam(value="leadId", required=false) Long leadId,
			@RequestParam(value="quotationId", required=false) Long quotationId,
			@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,
			@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,
			BindingResult result,
			final RedirectAttributes redirectAttrib ) {
		UserDetailsObj userObj = getLoggedInUser();
		qtnRecorderObj.setCreatedBy(userObj.getUserId());
		qtnRecorderObj.setLastUpdatedBy(userObj.getUserId());
		ModelAndView modelView = new ModelAndView();
		/*Tg_Leads_Recorder_Entity leadEntity = leadService.findLeadRecordById(leadRecorderObj.getLeadId());
		leadRecorderObj.updateLeadVoFromEntity(leadEntity);
		*/
		qtnEditValidator.validate(qtnRecorderObj, result);
		if(result.hasErrors()) {
			modelView = form_view_edit_quotation_details(leadId, quotationId, leadRecorderObj, qtnRecorderObj, result);
			return modelView;
		}else {
			Tg_Leads_Recorder_Entity leadEntity = leadService.findLeadRecordById(leadRecorderObj.getLeadId());
			Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(qtnRecorderObj.getQuotationId());
			quotationEntity.setQuotationName(qtnRecorderObj.getQuotationName());
			quotationEntity.setTourPackage(qtnRecorderObj.isTourPackage());
			quotationEntity.setFlight(qtnRecorderObj.isFlight());
			quotationEntity.setHotel(qtnRecorderObj.isHotel());
			quotationEntity.setTransfers(qtnRecorderObj.isTransfers());
			quotationEntity.setSightseeing(qtnRecorderObj.isSightseeing());
			quotationEntity.setVisa(qtnRecorderObj.isVisa());
			quotationEntity.setInsurance(qtnRecorderObj.isInsurance());
			quotationEntity.setCruise(qtnRecorderObj.isCruise());
			quotationEntity.setOthers(qtnRecorderObj.isOthers());
			quotationEntity.setItineraryId(qtnRecorderObj.getItineraryId());
			quotationEntity.setLastUpdatedBy(userObj.getUserId());
			quotationService.saveLead(quotationEntity);
			modelView = form_view_quotation_details(leadRecorderObj.getLeadId(), qtnRecorderObj.getQuotationId(), leadRecorderObj, qtnRecorderObj, result);
		}
		//modelView.setViewName("redirect:view_lead_quotations_list?leadId="+leadId);
		return modelView;
	 }
	
	
	
	@RequestMapping("/form_view_delete_quotation_details")
	public ModelAndView form_view_delete_quotation_details(@RequestParam(value="leadId", required=false) Long leadId,
			@RequestParam(value="quotationId", required=false) Long quotationId,
			@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,
			@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,
			BindingResult result) {
		ModelAndView modelView = form_view_quotation_details(leadId, quotationId, leadRecorderObj, qtnRecorderObj, result);
		modelView.setViewName("quotation/viewQuotationDeleteConfirmation");
		return modelView;
	}
	
	
	@PostMapping(value="delete_delete_lead_quotation")
	public ModelAndView delete_delete_lead_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj user = getLoggedInUser();
	    ModelAndView modelView = new ModelAndView();
	    quotationService.deleteQuotationById(qtnRecorderObj.getQuotationId());
	    redirectAttrib.addFlashAttribute("Success", "Quotation Record is deleted Successfully..");
	    modelView.setViewName("redirect:view_lead_quotations_list?leadId="+leadRecorderObj.getLeadId());
	    return modelView;
	}
	
	@RequestMapping("/form_view_flight_quotation_details")
	public ModelAndView form_view_flight_quotation_details(@RequestParam(value="leadId", required=false) Long leadId,
			@RequestParam(value="quotationId", required=false) Long quotationId,
			@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,
			@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,
			BindingResult result,
			final RedirectAttributes redirectAttrib) {
		
		if (leadId == null && leadRecorderObj.getLeadId() != null) {
			leadId = leadRecorderObj.getLeadId();
		}
		if (quotationId == null && qtnRecorderObj.getQuotationId() > 0) {
			quotationId = qtnRecorderObj.getQuotationId();
		}

		ModelAndView mapview = new ModelAndView("quotation/viewFlightQuotationDetails");
		
		if (leadId == null) {
			return new ModelAndView("redirect:/view_leads");
		}

		Tg_Leads_Recorder_Entity tgLeadEntity = leadService.findLeadRecordById(leadId);
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
		updateManualFlightAdditionalFields(qtnRecorderObj);
		qtnRecorderObj.setLeadEntity(tgLeadEntity);
		
		mapview.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm"));
		
		mapview.addObject("localDateTimeFormatToEdit", DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm"));
		
		return mapview;
	}

	private void updateManualFlightAdditionalFields(TgQuotationRecorderVO qtnRecorderObj) {
		qtnRecorderObj.getManualQuotationsVoList().forEach((e) -> { 
			e.setAirlineName(commonService.findAirlineById(e.getAirlineId()).getAirlineShortName());
			e.setCabinClassName(UdanChooConstants.CABIN_CLASS.get(e.getCabinClass()));
			e.setOriginCity(commonService.findAirportById(e.getAirportCodeOrigin()).getCityName());
			e.setDestinationCity(commonService.findAirportById(e.getAirportCodeDestination()).getCityName());
		});
		
		
	}
	
	
	@RequestMapping("/form_view_serach_flight_oneway_quotation")
	public ModelAndView form_view_serach_flight_oneway_quotation(@RequestParam(value="leadId", required=false) Long leadId,
			@RequestParam(value="quotationId", required=false) Long quotationId,
			@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,
			@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,
			@ModelAttribute("FLT_SRCH") FlightSearchRequest flightSearchRequest,
			BindingResult result,
			final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_flight_quotation_details(leadId, quotationId, leadRecorderObj, qtnRecorderObj, result, redirectAttrib);
		ArrayList<Integer> paxCount = new ArrayList<Integer>();
		for(int i=1;i<10;i++)
			paxCount.add(i);
		mapview.addObject("PAX_COUNT", paxCount);
		mapview.setViewName("quotation/searchFlightOneWayQuotation");
		
		return mapview;
	}

	/************ Manual Flight Quotation Starts from here *************************************************************/
	
	@RequestMapping("/form_view_add_manual_flight_quotation")
	public ModelAndView form_view_add_manual_flight_quotation(@RequestParam(value="leadId", required=false) Long leadId,
			@RequestParam(value="quotationId", required=false) Long quotationId,
			@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,
			@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,
			@ModelAttribute("MANUAL_FLT") ManualFlightQuotationVO manualFlightRequest,
			BindingResult result,
			final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_flight_quotation_details(leadId, quotationId, leadRecorderObj, qtnRecorderObj, result, redirectAttrib);
		/*
		ArrayList<Integer> paxCount = new ArrayList<Integer>();
		for(int i=1;i<10;i++)
			paxCount.add(i);
		mapview.addObject("PAX_COUNT", paxCount);
		*/
		mapview.setViewName("quotation/manualflight/form_view_add_manual_flight_quotation");
		HashMap airlineMap = commonService.find_All_Airlines_map();
		mapview.addObject("AIRLINE_MAP", UdanChooUtil.sortByValue(airlineMap));
		mapview.addObject("CABIN_CLASS", UdanChooConstants.CABIN_CLASS);
		return mapview;
	}
	
	
	@RequestMapping("/form_view_edit_manual_flight_quotation")
	public ModelAndView form_view_edit_manual_flight_quotation(@RequestParam(value="leadId", required=false) Long leadId,
			@RequestParam(value="quotationId", required=false) Long quotationId,
			@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,
			@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,
			@ModelAttribute("MANUAL_FLT") ManualFlightQuotationVO manualFlightRequest,
			BindingResult result,
			final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_flight_quotation_details(leadId, quotationId, leadRecorderObj, qtnRecorderObj, result, redirectAttrib);
		ArrayList<Integer> paxCount = new ArrayList<Integer>();
		for(int i=1;i<10;i++)
			paxCount.add(i);
		mapview.addObject("PAX_COUNT", paxCount);
		mapview.setViewName("quotation/manualflight/form_view_edit_manual_flight_quotation");
		
		//manualFlightRequest = quotationService.findManualFlightQuotationById(manualFlightRequest.getManualFlightQuotationId());
		
		quotationService.updateInjectedManualFlightObject(manualFlightRequest.getManualFlightQuotationId(),manualFlightRequest);
		
		//mapview.addObject("MANUAL_FLT", manualFlightRequest);
		
		HashMap airlineMap = commonService.find_All_Airlines_map();
		
		mapview.addObject("AIRLINE_MAP", UdanChooUtil.sortByValue(airlineMap));
		mapview.addObject("CABIN_CLASS", UdanChooConstants.CABIN_CLASS);
		return mapview;
	}

	
	@Transactional
	@PostMapping("/create_create_manual_quotation")
	public ModelAndView create_create_manual_quotation(@RequestParam long quotationId,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_FLT") ManualFlightQuotationVO manualFlightRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		manualQtnValidator.validate(manualFlightRequest, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		if(result.hasErrors()) {
			TgLeadsRecorderVO leadRecorderObj = new TgLeadsRecorderVO();
			leadRecorderObj.setLeadId(quotationEntity.getLeadEntity().getLeadId());
			modelView = form_view_add_manual_flight_quotation(leadRecorderObj.getLeadId(), quotationId, leadRecorderObj, qtnRecorderObj, manualFlightRequest, result, redirectAttrib);
			modelView.addObject("LEAD_OBJ",leadRecorderObj);
			return modelView;
		}else {
			Udn_Manual_Flight_Quotation_Entity manualFlightQuotationEntity = new Udn_Manual_Flight_Quotation_Entity(manualFlightRequest); 
			manualFlightQuotationEntity.setQuotationEntity(quotationEntity);
			manualFlightQuotationEntity.setActive(true);
			quotationEntity.getManualQuotationsList().add(manualFlightQuotationEntity);
			quotationService.saveLead(quotationEntity);
			//quotationService.saveManualFlightQuotation(manualFlightQuotationEntity);
			redirectAttrib.addFlashAttribute("Success","Manual Flight Record Added Successfully!!");
			modelView.setViewName("redirect:form_view_flight_quotation_details?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&quotationId="+quotationId);
		}
		return modelView; 
	 }
	
	
	@Transactional
	@PostMapping("/edit_edit_manual_flight_quotation")
	public ModelAndView edit_edit_manual_flight_quotation(@RequestParam long quotationId,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_FLT") ManualFlightQuotationVO manualFlightRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		manualQtnValidator.validate(manualFlightRequest, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		if(result.hasErrors()) {
			TgLeadsRecorderVO leadRecorderObj = new TgLeadsRecorderVO();
			leadRecorderObj.setLeadId(quotationEntity.getLeadEntity().getLeadId());
			modelView = form_view_flight_quotation_details(leadRecorderObj.getLeadId(), quotationId, leadRecorderObj, qtnRecorderObj, result, redirectAttrib);
			//modelView = form_view_edit_manual_flight_quotation(leadRecorderObj.getLeadId(), quotationId, leadRecorderObj, qtnRecorderObj, manualFlightRequest, result, redirectAttrib);
			modelView.addObject("PAX_COUNT", 9);
			HashMap airlineMap = commonService.find_All_Airlines_map();
			modelView.addObject("AIRLINE_MAP", UdanChooUtil.sortByValue(airlineMap));
			modelView.addObject("CABIN_CLASS", UdanChooConstants.CABIN_CLASS);
			modelView.addObject("LEAD_OBJ",leadRecorderObj);
			modelView.setViewName("quotation/manualflight/form_view_edit_manual_flight_quotation");
			return modelView;
		}else {
			Udn_Manual_Flight_Quotation_Entity manualFlightQuotationEntity = new Udn_Manual_Flight_Quotation_Entity(manualFlightRequest); 
			manualFlightQuotationEntity.setQuotationEntity(quotationEntity);
			manualFlightQuotationEntity.setActive(true);
			//quotationEntity.getManualQuotationsList().add(manualFlightQuotationEntity);
			//quotationService.saveLead(quotationEntity);
			manualFlightQuotationEntity.setQuotationEntity(quotationEntity);
			quotationService.saveManualFlightQuotation(manualFlightQuotationEntity);
			redirectAttrib.addFlashAttribute("Success","Manual Flight Record Updated Successfully!!");
			modelView.setViewName("redirect:form_view_flight_quotation_details?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&quotationId="+quotationId);
		}
		return modelView; 
	 }
	
	
	@RequestMapping("/form_view_delete_manual_flight_quotation")
	public ModelAndView form_view_delete_manual_flight_quotation(@RequestParam(value="leadId", required=false) Long leadId,
			@RequestParam(value="quotationId", required=false) Long quotationId,
			@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,
			@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,
			@ModelAttribute("MANUAL_FLT") ManualFlightQuotationVO manualFlightRequest,
			BindingResult result,
			final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_flight_quotation_details(leadId, quotationId, leadRecorderObj, qtnRecorderObj, result, redirectAttrib);
		ArrayList<Integer> paxCount = new ArrayList<Integer>();
		mapview.addObject("PAX_COUNT", 9);
		mapview.setViewName("quotation/manualflight/form_view_delete_manual_flight_quotation");
		
		//manualFlightRequest = quotationService.findManualFlightQuotationById(manualFlightRequest.getManualFlightQuotationId());
		
		quotationService.updateInjectedManualFlightObject(manualFlightRequest.getManualFlightQuotationId(),manualFlightRequest);
		
		//mapview.addObject("MANUAL_FLT", manualFlightRequest);
		
		HashMap airlineMap = commonService.find_All_Airlines_map();
		
		mapview.addObject("AIRLINE_MAP", UdanChooUtil.sortByValue(airlineMap));
		mapview.addObject("CABIN_CLASS", UdanChooConstants.CABIN_CLASS);
		return mapview;
	}
	
	
	@Transactional
	@PostMapping("/delete_delete_manual_flight_quotation")
	public ModelAndView delete_delete_manual_flight_quotation(@RequestParam long quotationId,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_FLT") ManualFlightQuotationVO manualFlightRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		Udn_Manual_Flight_Quotation_Entity manualFlightQuotationEntity = new Udn_Manual_Flight_Quotation_Entity(manualFlightRequest); 
		manualFlightQuotationEntity.setQuotationEntity(quotationEntity);
		//quotationService.
		quotationService.deleteManualFlight(manualFlightQuotationEntity);
		redirectAttrib.addFlashAttribute("Success","Manual Flight Record Deleted Successfully!!");
		modelView.setViewName("redirect:form_view_flight_quotation_details?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&quotationId="+quotationId);
		return modelView; 
	 }
	
	
	@RequestMapping("/form_view_manage_stops_quotation")
	public ModelAndView form_view_manage_stops_quotation(@RequestParam(value="leadId", required=false) Long leadId,
			@RequestParam(value="quotationId", required=false) Long quotationId,
			@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,
			@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,
			@ModelAttribute("MANUAL_FLT") ManualFlightQuotationVO manualFlightRequest,
			@ModelAttribute("FLT_STOP") FlightStopDetailQuotationVO flightStopVO,
			BindingResult result,
			final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_flight_quotation_details(leadId, quotationId, leadRecorderObj, qtnRecorderObj, result, redirectAttrib);
		quotationService.updateInjectedManualFlightObject(manualFlightRequest.getManualFlightQuotationId(), manualFlightRequest);
		mapview.setViewName("quotation/viewFlightStopDetails");
		HashMap airlineMap = commonService.find_All_Airlines_map();
		mapview.addObject("AIRLINE_MAP", UdanChooUtil.sortByValue(airlineMap));
		mapview.addObject("CABIN_CLASS", UdanChooConstants.CABIN_CLASS);
		return mapview;
	}

	@RequestMapping("/form_view_add_flight_stop_quotation")
	public ModelAndView form_view_add_flight_stop_quotation(@RequestParam(value="leadId", required=false) Long leadId,
			@RequestParam(value="quotationId", required=false) Long quotationId,
			@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,
			@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,
			@ModelAttribute("MANUAL_FLT") ManualFlightQuotationVO manualFlightRequest,
			@ModelAttribute("FLT_STOP") FlightStopDetailQuotationVO flightStopVO,
			BindingResult result,
			final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_manage_stops_quotation(leadId, quotationId, leadRecorderObj, qtnRecorderObj, manualFlightRequest, flightStopVO, result, redirectAttrib);
		mapview.addObject("FLT_STOP_ACTION", "ADD");
		mapview.addObject("MANUAL_FLT", manualFlightRequest);
		return mapview;
	}

	
	@Transactional
	@PostMapping("/create_create_flight_stop_quotation")
	public ModelAndView create_create_flight_stop_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@RequestParam long quotationId,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_FLT") ManualFlightQuotationVO manualFlightRequest,@ModelAttribute("FLT_STOP") FlightStopDetailQuotationVO flightStopVO,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		flightStopValidator.validate(flightStopVO, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		Udn_Manual_Flight_Quotation_Entity manualQtnEntity = quotationService.findManualFlightQuotationEntityById(manualFlightRequest.getManualFlightQuotationId());
		if(result.hasErrors()) {
			leadRecorderObj.setLeadId(quotationEntity.getLeadEntity().getLeadId());
			modelView = form_view_add_flight_stop_quotation(leadRecorderObj.getLeadId(), quotationId, leadRecorderObj, qtnRecorderObj, manualFlightRequest, flightStopVO, result, redirectAttrib);
			return modelView;
		}
		else {
			Udn_Flight_Quotation_Stop_Detail_Entity flighStopEntity = new Udn_Flight_Quotation_Stop_Detail_Entity(flightStopVO);
			flighStopEntity.setActive(true);
			flighStopEntity.setManualFlightQuotationEntity(manualQtnEntity);
			manualQtnEntity.getFltQuotationStopsList().add(flighStopEntity);
			quotationService.saveManualFlightQuotation(manualQtnEntity);
			//quotationEntity.getManualQuotationsList().add(manualQtnEntity);
			//quotationService.saveLead(quotationEntity);
			redirectAttrib.addFlashAttribute("Success","Flight Stop Record Added Successfully!!");
			modelView.setViewName("redirect:form_view_manage_stops_quotation?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&manualFlightQuotationId="+ manualQtnEntity.getManualFlightQuotationId() + "&quotationId="+quotationId);
		}
		return modelView; 
	 }
	
	@RequestMapping("/form_view_edit_flight_stop_quotation")
	public ModelAndView form_view_edit_flight_stop_quotation(@RequestParam(value="leadId", required=false) Long leadId,
			@RequestParam(value="quotationId", required=false) Long quotationId,
			@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,
			@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,
			@ModelAttribute("MANUAL_FLT") ManualFlightQuotationVO manualFlightRequest,
			@ModelAttribute("FLT_STOP") FlightStopDetailQuotationVO flightStopVO,
			BindingResult result,
			final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_manage_stops_quotation(leadId, quotationId, leadRecorderObj, qtnRecorderObj, manualFlightRequest, flightStopVO, result, redirectAttrib);
		Udn_Flight_Quotation_Stop_Detail_Entity flightStopEntity = quotationService.findFlightStopEntityById(flightStopVO.getFltQuotationStopId());
		flightStopVO.updateFlightStopVoFromEntity(flightStopEntity);
		flightStopVO.setOriginCity(commonService.findAirportById(flightStopVO.getAirportCodeOrigin()).getCityName());
		flightStopVO.setDestinationCity(commonService.findAirportById(flightStopVO.getAirportCodeDestination()).getCityName());
		mapview.addObject("FLT_STOP_ACTION", "EDIT");
		mapview.addObject("MANUAL_FLT", manualFlightRequest);
		return mapview;
	}
	
	
	@Transactional
	@PostMapping("/edit_edit_flight_stop_quotation")
	public ModelAndView edit_edit_flight_stop_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@RequestParam long quotationId,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_FLT") ManualFlightQuotationVO manualFlightRequest,@ModelAttribute("FLT_STOP") FlightStopDetailQuotationVO flightStopVO,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		flightStopValidator.validate(flightStopVO, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		Udn_Manual_Flight_Quotation_Entity manualQtnEntity = quotationService.findManualFlightQuotationEntityById(manualFlightRequest.getManualFlightQuotationId());
		if(result.hasErrors()) {
			leadRecorderObj.setLeadId(quotationEntity.getLeadEntity().getLeadId());
			modelView = form_view_edit_flight_stop_quotation(leadRecorderObj.getLeadId(), quotationId, leadRecorderObj, qtnRecorderObj, manualFlightRequest, flightStopVO, result, redirectAttrib);
			return modelView;
		}
		else {
			Udn_Flight_Quotation_Stop_Detail_Entity flighStopEntity = new Udn_Flight_Quotation_Stop_Detail_Entity(flightStopVO);
			flighStopEntity.setActive(true);
			flighStopEntity.setManualFlightQuotationEntity(manualQtnEntity);
			
			quotationService.saveFlightStopQuotation(flighStopEntity);
			//manualQtnEntity.getFltQuotationStopsList().add(flighStopEntity);
			//quotationService.saveManualFlightQuotation(manualQtnEntity);
			//quotationEntity.getManualQuotationsList().add(manualQtnEntity);
			//quotationService.saveLead(quotationEntity);
			redirectAttrib.addFlashAttribute("Success","Flight Stop Record Updated Successfully!!");
			modelView.setViewName("redirect:form_view_manage_stops_quotation?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&manualFlightQuotationId="+ manualQtnEntity.getManualFlightQuotationId() + "&quotationId="+quotationId);
		}
		return modelView; 
	 }
	
	

	@RequestMapping("/form_view_delete_flight_stop_quotation")
	public ModelAndView form_view_delete_flight_stop_quotation(@RequestParam(value="leadId", required=false) Long leadId,
			@RequestParam(value="quotationId", required=false) Long quotationId,
			@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,
			@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,
			@ModelAttribute("MANUAL_FLT") ManualFlightQuotationVO manualFlightRequest,
			@ModelAttribute("FLT_STOP") FlightStopDetailQuotationVO flightStopVO,
			BindingResult result,
			final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_edit_flight_stop_quotation(leadId, quotationId, leadRecorderObj, qtnRecorderObj, manualFlightRequest, flightStopVO, result, redirectAttrib);
		flightStopVO.setAirlineName(commonService.findAirlineById(flightStopVO.getAirlineId()).getAirlineName());
		flightStopVO.setCabinClassName(UdanChooConstants.CABIN_CLASS.get(flightStopVO.getCabinClass()));
		mapview.addObject("FLT_STOP_ACTION", "DELETE");
		return mapview;
	}
	
	@Transactional
	@PostMapping("/delete_delete_flight_stop_quotation")
	public ModelAndView delete_delete_flight_stop_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_FLT") ManualFlightQuotationVO manualFlightRequest,@ModelAttribute("FLT_STOP") FlightStopDetailQuotationVO flightStopVO,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView modelView = new ModelAndView();
		quotationService.deleteFlightStop(flightStopVO.getFltQuotationStopId());
		redirectAttrib.addFlashAttribute("Success","Flight Stop Record Deleted Successfully!!");
		modelView.setViewName("redirect:form_view_manage_stops_quotation?leadId="+leadRecorderObj.getLeadId() + "&manualFlightQuotationId="+ manualFlightRequest.getManualFlightQuotationId() + "&quotationId="+qtnRecorderObj.getQuotationId());
		return modelView; 
	 }
	
	@RequestMapping("/form_view_flight_stops_quotation_modal")
	public ModelAndView form_view_flight_stops_quotation_modal(@RequestParam(value="leadId", required=false) Long leadId,
			@RequestParam(value="quotationId", required=false) Long quotationId,
			@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,
			@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,
			@ModelAttribute("MANUAL_FLT") ManualFlightQuotationVO manualFlightRequest,
			@ModelAttribute("FLT_STOP") FlightStopDetailQuotationVO flightStopVO,
			BindingResult result,
			final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_manage_stops_quotation(leadId, quotationId, leadRecorderObj, qtnRecorderObj, manualFlightRequest, flightStopVO, result, redirectAttrib);
		mapview.setViewName("quotation/viewFlightStopDetails_modal");
		return mapview;
	}
	
	/*******************************************************************************************************************/

	
	@RequestMapping("/serach_flight_oneway_quotation_results")
	public ModelAndView serach_flight_oneway_quotation_results(@RequestParam(value="leadId", required=false) Long leadId,
			@RequestParam(value="quotationId", required=false) Long quotationId,
			@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,
			@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,
			@ModelAttribute("FLT_SRCH") FlightSearchRequest flightSearchRequest,
			BindingResult result,
			final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_flight_quotation_details(leadId, quotationId, leadRecorderObj, qtnRecorderObj, result, redirectAttrib);
		ArrayList<Integer> paxCount = new ArrayList<Integer>();
		for(int i=1;i<10;i++)
			paxCount.add(i);
		mapview.addObject("PAX_COUNT", paxCount);
		mapview.setViewName("quotation/searchFlightOneWayQuotation");
		System.out.println("Flight One Way Search Result is invoked. ");
		return mapview;
	}
	
	@RequestMapping(value = "/getAirportList", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<Tg_Flt_Airport_Obj> getAirportList(@RequestParam String cityName) {
		List<Tg_Flt_Airport_Obj> result = new ArrayList<Tg_Flt_Airport_Obj>();
		List <Tg_Flt_Airport_Entity> entityList = commonService.listAllAirportCities();
		// iterate a list and filter by tagName
		for (Tg_Flt_Airport_Entity entity : entityList) {
			if (entity.getCityName().toLowerCase().contains(cityName.toLowerCase())
					|| (entity.getAirportCode().toLowerCase().contains(cityName.toLowerCase()))
					|| (entity.getAirportName().toLowerCase().contains(cityName.toLowerCase()))
					) {
				Tg_Flt_Airport_Obj destinationObj = new Tg_Flt_Airport_Obj(entity);
				result.add(destinationObj);
			}
		}
		
		return result;
	}
	
	
	@RequestMapping("/form_view_duplicate_quotation_details")
	public ModelAndView form_view_duplicate_quotation_details(@RequestParam(value="leadId", required=false) Long leadId,
			@RequestParam(value="quotationId", required=false) Long quotationId,
			@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,
			@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,
			BindingResult result) {
		ModelAndView mapview = form_view_quotation_details(leadId, quotationId, leadRecorderObj, qtnRecorderObj, result);
		UserDetailsObj userObj = getLoggedInUser();
		qtnRecorderObj.setCreatedBy(userObj.getUserId());
		qtnRecorderObj.setLastUpdatedBy(userObj.getUserId());

		ModelAndView modelView = new ModelAndView();
		//modelView.setViewName("quotation/viewLeadQuotationsList");

		Tg_Leads_Recorder_Entity tgLeadEntity = createDuplicateQuotation(leadRecorderObj,qtnRecorderObj);
		
		modelView.setViewName("redirect:view_lead_quotations_list?leadId="+tgLeadEntity.getLeadId());
		
		/*TgLeadsRecorderVO leadRecorderVO =leadService.getLeadVoFromEntity(tgLeadEntity);
		modelView.addObject("LEAD_OBJ",leadRecorderVO );
		*/

		return modelView;
	
	}
	

	private Tg_Leads_Recorder_Entity createDuplicateQuotation(TgLeadsRecorderVO leadRecorderObj,TgQuotationRecorderVO qtnRecorderObj) {
		Tg_Leads_Recorder_Entity leadEntity = leadService.findLeadRecordById(leadRecorderObj.getLeadId());
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(qtnRecorderObj.getQuotationId());
		int maxVersion = quotationService.fetchMax_QuotationVersion(leadEntity.getLeadId());
		maxVersion++; // new verion for this quotation. 
		quotationEntity.setVersion(maxVersion); 
		quotationEntity.setQuotationId(0);
		quotationEntity.setConverted(false);
		Set<Udn_Manual_Flight_Quotation_Entity> flightSet = quotationEntity.getManualQuotationsList();
		Iterator<Udn_Manual_Flight_Quotation_Entity> flightsIterator  = flightSet.iterator();
		while(flightsIterator.hasNext()) {
			Udn_Manual_Flight_Quotation_Entity flightEntity = (Udn_Manual_Flight_Quotation_Entity)flightsIterator.next();
			Set flightStopSet = flightEntity.getFltQuotationStopsList();
			Iterator itrFlightStop = flightStopSet.iterator();
			while(itrFlightStop.hasNext()) {
				Udn_Flight_Quotation_Stop_Detail_Entity flightStopEntity = (Udn_Flight_Quotation_Stop_Detail_Entity)itrFlightStop.next();
				flightStopEntity.setFltQuotationStopId(0);
			}
			flightEntity.setManualFlightQuotationId(0);
		}
		
		Set<Udn_Manual_Hotel_Quotation_Entity> hotelSet = quotationEntity.getHotelQuotationsList();
		Iterator<Udn_Manual_Hotel_Quotation_Entity> hotelIterator  = hotelSet.iterator();
		while(hotelIterator.hasNext()) {
			Udn_Manual_Hotel_Quotation_Entity hotelEntity = (Udn_Manual_Hotel_Quotation_Entity)hotelIterator.next();
			hotelEntity.setManualHotelQuotationId(0);
		}

		Set<Udn_Manual_Transfer_Quotation_Entity> transfersSet = quotationEntity.getTransferQuotationList();
		Iterator<Udn_Manual_Transfer_Quotation_Entity> transfersIterator  = transfersSet.iterator();
		while(transfersIterator.hasNext()) {
			Udn_Manual_Transfer_Quotation_Entity transfersEntity = (Udn_Manual_Transfer_Quotation_Entity)transfersIterator.next();
			transfersEntity.setManualTransferQuotationId(0);
		}

		Set<Udn_Manual_SightSeeing_Quotation_Entity> sightSeeeingSet = quotationEntity.getSightSeeingQuotationList();
		Iterator<Udn_Manual_SightSeeing_Quotation_Entity> sightSeeingIterator  = sightSeeeingSet.iterator();
		while(sightSeeingIterator.hasNext()) {
			Udn_Manual_SightSeeing_Quotation_Entity sightSeeingEntity = (Udn_Manual_SightSeeing_Quotation_Entity)sightSeeingIterator.next();
			sightSeeingEntity.setManualSightSeeingQuotationId(0);
		}

		Set<Udn_Manual_Visa_Quotation_Entity> visaSet = quotationEntity.getVisaQuotationList();
		Iterator<Udn_Manual_Visa_Quotation_Entity> visaIterator  = visaSet.iterator();
		while(visaIterator.hasNext()) {
			Udn_Manual_Visa_Quotation_Entity visaEntity = (Udn_Manual_Visa_Quotation_Entity)visaIterator.next();
			visaEntity.setManualVisaQuotationId(0);
		}
		
		Set<Udn_Manual_Insurance_Quotation_Entity> insuranceSet = quotationEntity.getInsuranceQuotationsList();
		Iterator<Udn_Manual_Insurance_Quotation_Entity> insuranceIterator  = insuranceSet.iterator();
		while(insuranceIterator.hasNext()) {
			Udn_Manual_Insurance_Quotation_Entity insuranceEntity = (Udn_Manual_Insurance_Quotation_Entity)insuranceIterator.next();
			insuranceEntity.setManualInsuranceQuotationId(0);
		}

		Set<Udn_Manual_Cruise_Quotation_Entity> cruiseSet = quotationEntity.getCruiseQuotationsList();
		Iterator<Udn_Manual_Cruise_Quotation_Entity> cruiseIterator  = cruiseSet.iterator();
		while(cruiseIterator.hasNext()) {
			Udn_Manual_Cruise_Quotation_Entity cruiseEntity = (Udn_Manual_Cruise_Quotation_Entity)cruiseIterator.next();
			cruiseEntity.setManualCruiseQuotationId(0);
		}
		
		Set<Udn_Manual_Package_Quotation_Entity> packageSet = quotationEntity.getPackageQuotationsList();
		Iterator<Udn_Manual_Package_Quotation_Entity> packageIterator  = packageSet.iterator();
		while(packageIterator.hasNext()) {
			Udn_Manual_Package_Quotation_Entity packageEntity = (Udn_Manual_Package_Quotation_Entity)packageIterator.next();
			packageEntity.setManualPkgQuotationId(0);
		}

		Set<Udn_Manual_Other_Quotation_Entity> othersSet = quotationEntity.getOtherQuotationsList();
		Iterator<Udn_Manual_Other_Quotation_Entity> othersIterator  = othersSet.iterator();
		while(othersIterator.hasNext()) {
			Udn_Manual_Other_Quotation_Entity otherEntity = (Udn_Manual_Other_Quotation_Entity)othersIterator.next();
			otherEntity.setManualOtherQuotationId(0);
		}


		Udn_Configuration_Manual_Quotation_Entity configurationEntity = quotationEntity.getConfigurationQuotationEntity();
		if(configurationEntity!=null) {
			configurationEntity.setManualConfigurationQuotationId(0);
		}
		
		entityManager.detach(quotationEntity);
		quotationEntity.setLeadEntity(leadEntity);
		entityManager.merge(quotationEntity);
		return leadEntity;

	}
	
	
	
	@RequestMapping("/form_convert_new_deal")
   	public ModelAndView form_convert_new_deal(@ModelAttribute("DEAL_OBJ") Udn_Deals_Recorder_Obj dealRecorder,@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj, BindingResult result,RedirectAttributes redirectAttrib) {
    	ModelAndView mapview = new ModelAndView("deals/form_convertNewDeal");
		
    	Map mapHotelOptions = hotelService.findOptionWiseHotelMap(qtnRecorderObj.getQuotationId());
    	
		if(mapHotelOptions.size()>1) {
			redirectAttrib.addFlashAttribute("Error", "Error: [Hotel Options] Only one hotel option can be confirmed. Please remove non-confirmed hotel options.");
			mapview.setViewName("redirect:view_lead_quotations_list?leadId="+leadRecorderObj.getLeadId());
		}else {
			mapview.setViewName("deals/form_convertNewDeal");
	    	System.out.println("Lead Id is " + leadRecorderObj.getLeadId());
			Tg_Leads_Recorder_Entity leadEntity = leadService.findLeadRecordById(leadRecorderObj.getLeadId());
			leadRecorderObj.updateLeadVoFromEntity(leadEntity);
			leadRecorderObj.setContactName(clientService.find_ClientBy_Id(leadRecorderObj.getContactId()).getClientName());
	    	Tg_B2b_Partner_Entity b2bPartner = b2bPartnerService.findPartnerById(leadRecorderObj.getLeadSource());
			leadRecorderObj.setLeadSourceShortName(b2bPartner.getPartnerShortName());
			leadRecorderObj.setSourceName(commonService.findDestinationById(leadRecorderObj.getSource()).getCityName());
			leadRecorderObj.setDestinationName(commonService.findDestinationById(leadRecorderObj.getDestination()).getCityName());
			
	
			Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(qtnRecorderObj.getQuotationId());
			qtnRecorderObj.setVoFromEntity(quotationEntity);
	    	
	    	List udnServiceList = userDetailsService.findAllActiveUdnServices();
	    	mapview.addObject("UdnServicesList", udnServiceList);
	    	
	    	float totalDealCost=0;
	    	float totalMarkup=0;
	    	List servicesSoldList = new ArrayList();
	    	if(qtnRecorderObj.isFlight()) {
	    		servicesSoldList.add(UdanChooConstants.WORKLOAD_FLT_CODE);
	    		for (ManualFlightQuotationVO flightVO : qtnRecorderObj.getManualQuotationsVoList()) {
	    			totalDealCost = totalDealCost + flightVO.getFlightCost();
	    			totalMarkup = totalMarkup + flightVO.getFlightMarkup();
	    		}
	    	}
	    	if(qtnRecorderObj.isHotel()) {
	    		servicesSoldList.add(UdanChooConstants.WORKLOAD_HTL_CODE);
	    		for (ManualHotelQuotationVO hotelVO : qtnRecorderObj.getHotelVoList()) {
	    			totalDealCost = totalDealCost + hotelVO.getHotelStayCost();
	    			totalMarkup = totalMarkup + hotelVO.getHotelStayMarkup();
	    		}
	    	}
	    	if(qtnRecorderObj.isInsurance()) {
	    		servicesSoldList.add(UdanChooConstants.WORKLOAD_INS_CODE);
	    		for (ManualInsuranceQuotationVO insuranceVO : qtnRecorderObj.getInsuranceVoList()) {
	    			totalDealCost = totalDealCost + insuranceVO.getPremiumCost();
	    			totalMarkup = totalMarkup + insuranceVO.getPremiumMarkup();
	    		}

	    	}
	    	if(qtnRecorderObj.isOthers()) {
	    		servicesSoldList.add(UdanChooConstants.WORKLOAD_OTH_CODE);
	    		for (ManualOtherQuotationVO otherVO : qtnRecorderObj.getOtherVoList()) {
	    			totalDealCost = totalDealCost + otherVO .getServiceCost();
	    			totalMarkup = totalMarkup + otherVO .getServiceMarkup();
	    		}
	    	}
	    	if(qtnRecorderObj.isSightseeing()) {
	    		servicesSoldList.add(UdanChooConstants.WORKLOAD_STS_CODE);
	    		for (ManualSightSeeingQuotationVO sightSeeingVO : qtnRecorderObj.getSightSeeingVoList()) {
	    			totalDealCost = totalDealCost + sightSeeingVO.getSightSeeingCost();
	    			totalMarkup = totalMarkup + sightSeeingVO.getSightSeeingMarkup();
	    		}
	    	}
	    	if(qtnRecorderObj.isTourPackage()) {
	    		servicesSoldList.add(UdanChooConstants.WORKLOAD_LDP_CODE);
	    		for (ManualPackageQuotationVO packageVO : qtnRecorderObj.getTourPackageVoList()) {
	    			totalDealCost = totalDealCost + packageVO.getPkgCost();
	    			totalMarkup = totalMarkup + packageVO.getPkgMarkup();
	    		}
	    	}
	    	if(qtnRecorderObj.isTransfers()) {
	    		servicesSoldList.add(UdanChooConstants.WORKLOAD_TRN_CODE);
	    		for (ManualTransferQuotationVO transferVO : qtnRecorderObj.getTransferVoList()) {
	    			totalDealCost = totalDealCost + transferVO.getTransferCost();
	    			totalMarkup = totalMarkup + transferVO.getTransferMarkup();
	    		}
	    	}
	    	if(qtnRecorderObj.isVisa()) {
	    		servicesSoldList.add(UdanChooConstants.WORKLOAD_VSA_CODE);
	    		for (ManualVisaQuotationVO visaVO : qtnRecorderObj.getVisaVoList()) {
	    			totalDealCost = totalDealCost + visaVO.getVisaCost();
	    			totalMarkup = totalMarkup + visaVO.getVisaMarkup();
	    		}
	    	}
	    	if(qtnRecorderObj.isCruise()) {
	    		servicesSoldList.add(UdanChooConstants.WORKLOAD_CRS_CODE);
	    		for (ManualCruiseQuotationVO cruiseVO : qtnRecorderObj.getCruiseVoList()) {
	    			totalDealCost = totalDealCost + cruiseVO.getCruiseStayCost();
	    			totalMarkup = totalMarkup + cruiseVO.getCruiseStayMarkup();
	    		}

	    	}
	    	mapview.addObject("UdnSoldServicesList", servicesSoldList);
	    	
	    	 String[] serviceListArray = new String[servicesSoldList.size()];
	    	 
	         for (int i = 0; i < servicesSoldList.size(); i++) {
	        	 serviceListArray[i] = (String) servicesSoldList.get(i);
	         }
	    	dealRecorder.setServiceList(serviceListArray);
	    	
	    	List<Tg_B2b_Partner_Entity> b2bActivePartnerList = b2bPartnerService.findAllActivePartners();
	    	Map<Integer, String> partersMap = (Map<Integer, String>) b2bActivePartnerList.stream().collect(
	                 Collectors.toMap(Tg_B2b_Partner_Entity::getPartnerId, Tg_B2b_Partner_Entity::getPartnerName));
	    	mapview.addObject("PARTNERS_MAP", partersMap);
	    	dealRecorder.setDealSource(leadRecorderObj.getLeadSource());
	    	dealRecorder.setProjectedCost(totalDealCost);
	    	dealRecorder.setProjectedMarkup(totalMarkup);
	    	dealRecorder.setSellingPrice(totalDealCost+totalMarkup);
	    	dealRecorder.setNewClient(!dealService.existAnyDealByClientId(leadRecorderObj.getContactId()));
	    	 /************** Populate all fields one by one here for deal object , which needs to be created in the system *************/ 
	    	 //String queryId = String.valueOf(leadRecorderObj.getLeadId())
	    	 dealRecorder.setQueryId(leadRecorderObj.getLeadId());
	    	 dealRecorder.setTravelStartDate(leadRecorderObj.getTravelStartDate());
	    	 dealRecorder.setTravelEndDate(leadRecorderObj.getTravelEndDate());
	    	 dealRecorder.setTravelingFrom(leadRecorderObj.getSource());
	    	 dealRecorder.setTravelingTo(leadRecorderObj.getDestination());
	    	 dealRecorder.setAdults(leadRecorderObj.getAdults());
	    	 dealRecorder.setChildren(leadRecorderObj.getChildren());
	    	 dealRecorder.setDealOwner(leadRecorderObj.getLeadOwner());
	      	List<UdnDealStatusVO> udnDealStatusVoList = commonService.find_All_Status_Deal_Obj("DEAL_OBJ");
	    	Map<Integer, String> dealStatusMap = (Map<Integer, String>) udnDealStatusVoList.stream().collect(
	                Collectors.toMap(UdnDealStatusVO::getWorkloadStatusId, UdnDealStatusVO::getWorkloadStatusName));
	    	mapview.addObject("DEAL_STATUS_MAP", dealStatusMap);
	    	
	    	List<UserDetailsObj> activeUsersList = userDetailsService.findAllActiveUsers();
	 		Map<Integer, String> activeUsersMap = (Map<Integer, String>) activeUsersList.stream().collect(
	                 Collectors.toMap(UserDetailsObj::getUserId, UserDetailsObj::getUsername));
	 		mapview.addObject("ACTIVE_USERS_MAP", activeUsersMap);
			leadRecorderObj.setLeadOwnerName(userService.findUserByID(leadRecorderObj.getLeadOwner()).getUsername());
		}
    	 
    	return mapview;
    }

	@RequestMapping(path = "/viewQuotation", method = RequestMethod.GET)
    public String viewQuotation(@RequestParam("leadId") int leadId, @RequestParam("quotationId")int quotationId, @RequestParam("version") int version,RedirectAttributes redirectAttrib) throws IOException, MalformedURLException {
		redirectAttrib.addAttribute("leadId", String.valueOf(leadId));
		redirectAttrib.addAttribute("quotationId", String.valueOf(quotationId));
		redirectAttrib.addAttribute("version", String.valueOf(version));
		return "redirect:"+VIEW_QTN_URL;
	}

	
	@RequestMapping(path = "/downloadQuotation", method = RequestMethod.GET)
    public String downloadQuotation(@RequestParam("leadId") int leadId, @RequestParam("quotationId")int quotationId, @RequestParam("version") int version,RedirectAttributes redirectAttrib) throws IOException, MalformedURLException {
		redirectAttrib.addAttribute("leadId", String.valueOf(leadId));
		redirectAttrib.addAttribute("quotationId", String.valueOf(quotationId));
		redirectAttrib.addAttribute("version", String.valueOf(version));
		return "redirect:"+DWNLOAD_QTN_URL;
	}
	
	
	@RequestMapping(value = "/checkItineraryExists")
	public ModelAndView checkItineraryExists(@RequestParam long quotationId) {
		System.out.println("Welcome to check itinery controller man. ");
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
        Map<String, String> params = new HashMap<String, String>();
        params.put("quotationId", String.valueOf(quotationId));
		
        System.out.println("Invoking Itinerary Check 123...");
        Boolean isItineryExist = restTemplate.getForObject(CHECK_ITINERARY_EXIST, Boolean.class,params );
		
		System.out.println("Itineray Response is " + isItineryExist );
		if(isItineryExist) {
			modelView.setViewName("quotation/itinerary/viewItinerary");
		}
		else {
			modelView.setViewName("quotation/itinerary/createItinerary");
		}

				

		return modelView; 
	 }
	

	
}


