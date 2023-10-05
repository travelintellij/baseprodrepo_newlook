package com.udanchoo.intranet.controller.quotation;


import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.udanchoo.intranet.entity.quotation.Udn_Flight_Quotation_Stop_Detail_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Flight_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Cruise_Quotation_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.Udn_Room_Category_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.api.flight.Tg_Flt_Airport_Obj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.model.quotation.FlightStopDetailQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualFlightQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualCruiseQuotationVO;
import com.udanchoo.intranet.model.quotation.TgQuotationRecorderVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.EmailServiceImpl;
import com.udanchoo.intranet.service.LeadServiceImpl;
import com.udanchoo.intranet.service.QuotationServiceImpl;
import com.udanchoo.intranet.service.TgB2bPartnerServicesImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.util.UdanChooUtil;
import com.udanchoo.intranet.validator.FlightStopValidator;
import com.udanchoo.intranet.validator.CruiseQuotationValidator;
import com.udanchoo.intranet.validator.ManualQuotationValidator;

@Controller
public class CruiseQuotationController {
	 
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
    private CruiseQuotationValidator cruiseQtnValidator;
	
	
	
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
	
	@Value("${all.email.notify.communication.active}")
	private boolean emailNotifyActive;
	
	@Value("${email.client.valid}")
	private boolean emailClientNotifyActive;


    
	
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
	

	@RequestMapping("/form_view_cruise_quotation_details")
	public ModelAndView form_view_cruise_quotation_details(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = new ModelAndView("quotation/cruise/viewCruiseQuotationDetails");
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
		updateManualCruiseAdditionalFields(qtnRecorderObj);
		qtnRecorderObj.setLeadEntity(tgLeadEntity);
		mapview.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy"));
		
		return mapview;
	}

	private void updateManualCruiseAdditionalFields(TgQuotationRecorderVO qtnRecorderObj) {
		qtnRecorderObj.getCruiseVoList().forEach((e) -> { 
			e.setCityName(commonService.findDestinationById(e.getCityId()).getCityName());
			e.setStateRoomName(UdanChooConstants.CRUISE_STATE_ROOM_TYPE_MAP.get(e.getStateRoomType()));
			e.setCruiseProviderName(UdanChooConstants.CRUISE_PROVIDER_NAMES_MAP.get(e.getCruiseProvider()));
		});
		
	}
	
	@RequestMapping("/form_view_add_cruise_quotation")
	public ModelAndView form_view_add_cruise_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_CRS") ManualCruiseQuotationVO manualCruiseRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_cruise_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
		
		mapview.addObject("CRS_ACTION", "ADD");
		mapview.addObject("CRUISE_PROVIDER_NAMES_MAP", UdanChooConstants.CRUISE_PROVIDER_NAMES_MAP);
		mapview.addObject("CRUISE_STATE_ROOM_TYPE_MAP", UdanChooConstants.CRUISE_STATE_ROOM_TYPE_MAP);
		
		
		//mapview.addObject("MANUAL_CRS", manualCruiseRequest);
		return mapview;
	}
	
	@Transactional
	@PostMapping("/create_create_cruise_manual_quotation")
	public ModelAndView create_create_cruise_manual_quotation(@RequestParam long quotationId,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_CRS") ManualCruiseQuotationVO manualCruiseRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		cruiseQtnValidator.validate(manualCruiseRequest, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		if(result.hasErrors()) {
			TgLeadsRecorderVO leadRecorderObj = new TgLeadsRecorderVO();
			leadRecorderObj.setLeadId(quotationEntity.getLeadEntity().getLeadId());
			modelView = form_view_add_cruise_quotation(leadRecorderObj,qtnRecorderObj,manualCruiseRequest,result,redirectAttrib);
			modelView.addObject("LEAD_OBJ",leadRecorderObj);
			return modelView;
		}else {
			Udn_Manual_Cruise_Quotation_Entity manualCruiseQuotationEntity = new Udn_Manual_Cruise_Quotation_Entity(manualCruiseRequest); 
			manualCruiseQuotationEntity.setQuotationEntity(quotationEntity);
			manualCruiseRequest.setActive(true);
			quotationEntity.getCruiseQuotationsList().add(manualCruiseQuotationEntity);
			quotationService.saveLead(quotationEntity);
			//quotationService.saveManualFlightQuotation(manualFlightQuotationEntity);
			redirectAttrib.addFlashAttribute("Success","Manual Cruise Stay Record Added Successfully!!");
			modelView.setViewName("redirect:form_view_cruise_quotation_details?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&quotationId="+quotationId);
			
		}
		return modelView; 
	 }
	
	@RequestMapping("/form_view_edit_manual_cruise_quotation")
	public ModelAndView form_view_edit_manual_cruise_quotation(@RequestParam(defaultValue = "true")boolean reloadCruiseObj,@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_CRS") ManualCruiseQuotationVO manualCruiseRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_cruise_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
		
		if(reloadCruiseObj)
			quotationService.updateInjectedManualCruiseObject(manualCruiseRequest.getManualCruiseQuotationId(), manualCruiseRequest);

		mapview.addObject("CRS_ACTION", "EDIT");
		mapview.addObject("CRUISE_PROVIDER_NAMES_MAP", UdanChooConstants.CRUISE_PROVIDER_NAMES_MAP);
		mapview.addObject("CRUISE_STATE_ROOM_TYPE_MAP", UdanChooConstants.CRUISE_STATE_ROOM_TYPE_MAP);

		
		return mapview;
	}

	@Transactional
	@PostMapping("/edit_edit_cruise_manual_quotation")
	public ModelAndView edit_edit_cruise_manual_quotation(@RequestParam long quotationId,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_CRS") ManualCruiseQuotationVO manualCruiseRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		cruiseQtnValidator.validate(manualCruiseRequest, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		if(result.hasErrors()) {
			TgLeadsRecorderVO leadRecorderObj = new TgLeadsRecorderVO();
			leadRecorderObj.setLeadId(quotationEntity.getLeadEntity().getLeadId());
			modelView = form_view_edit_manual_cruise_quotation(false, leadRecorderObj,qtnRecorderObj,manualCruiseRequest,result,redirectAttrib);
			modelView.addObject("LEAD_OBJ",leadRecorderObj);
			return modelView;
		}else {
			Udn_Manual_Cruise_Quotation_Entity manualCruiseQuotationEntity = new Udn_Manual_Cruise_Quotation_Entity(manualCruiseRequest); 
			manualCruiseQuotationEntity.setQuotationEntity(quotationEntity);
			quotationService.saveCruiseStayQuotation(manualCruiseQuotationEntity);
			//quotationEntity.getCruiseQuotationsList().add(manualCruiseQuotationEntity);
			//quotationService.saveLead(quotationEntity);
			//quotationService.saveManualFlightQuotation(manualFlightQuotationEntity);
			redirectAttrib.addFlashAttribute("Success","Cruise Stay Record Updated Successfully!!");
			modelView.setViewName("redirect:form_view_cruise_quotation_details?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&quotationId="+quotationId);
			
		}
		return modelView; 
	 }

	@RequestMapping("/form_view_delete_manual_cruise_quotation")
	public ModelAndView form_view_delete_manual_cruise_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_CRS") ManualCruiseQuotationVO manualCruiseRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_cruise_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
		quotationService.updateInjectedManualCruiseObject(manualCruiseRequest.getManualCruiseQuotationId(), manualCruiseRequest);
		mapview.addObject("CRS_ACTION", "DELETE");
		return mapview;
	}

	@Transactional
	@PostMapping("/delete_delete_cruise_manual_quotation")
	public ModelAndView delete_delete_cruise_manual_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_CRS") ManualCruiseQuotationVO manualCruiseRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView modelView = new ModelAndView();
		quotationService.deleteCruiseStayQuotation(manualCruiseRequest.getManualCruiseQuotationId());
		redirectAttrib.addFlashAttribute("Success","Cruise Stay Record Deleted Successfully!!");
		modelView.setViewName("redirect:form_view_cruise_quotation_details?leadId="+leadRecorderObj.getLeadId() + "&quotationId="+qtnRecorderObj.getQuotationId());
		return modelView; 
	 }
	
}

