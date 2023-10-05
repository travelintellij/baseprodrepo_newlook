package com.udanchoo.intranet.controller.quotation;


import java.time.format.DateTimeFormatter;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.entity.quotation.Tg_Quotation_Recorder_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_SightSeeing_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Transfer_Quotation_Entity;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.model.quotation.ManualSightSeeingQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualTransferQuotationVO;
import com.udanchoo.intranet.model.quotation.TgQuotationRecorderVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.LeadServiceImpl;
import com.udanchoo.intranet.service.QuotationServiceImpl;
import com.udanchoo.intranet.service.TgB2bPartnerServicesImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.validator.SightSeeingQuotationValidator;
import com.udanchoo.intranet.validator.TransferQuotationValidator;

@Controller
public class SightSeeingQuotationController {
	 
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
	LeadServiceImpl leadService;
	
	@Autowired
	QuotationServiceImpl quotationService;
	
	@Autowired
	UdnCommonServicesImpl commonService;

	@Autowired
	ClientServiceImpl clientService;

	@Autowired
	TgB2bPartnerServicesImpl b2bPartnerService;

	@Autowired
	UserDetailsServiceImpl userService;
	
	@Autowired
    private SightSeeingQuotationValidator sightSeeingQtnValidator;
	
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
	
	@RequestMapping("/form_view_sightseeing_quotation_details")
	public ModelAndView form_view_sightseeing_quotation_details(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = new ModelAndView("quotation/sightseeing/viewSightSeeingQuotationDetails");
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
		updateManualSightSeeingAdditionalFields(qtnRecorderObj);
		qtnRecorderObj.setLeadEntity(tgLeadEntity);
		//mapview.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm"));
		mapview.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy"));
		//mapview.addObject("localDateTimeFormatToEdit", DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm"));
		return mapview;
	}
	
	private void updateManualSightSeeingAdditionalFields(TgQuotationRecorderVO qtnRecorderObj) {
		qtnRecorderObj.getSightSeeingVoList().forEach((e) -> { 
			e.setCityName(commonService.findDestinationById(e.getCityId()).getCityName());
			e.setTransferTypeName(UdanChooConstants.TRANSFER_TYPE_MODE.get(e.getTransferType()));
		});
		
	}
	
	
	
	@RequestMapping("/form_view_add_sightseeing_quotation")
	public ModelAndView form_view_add_sightseeing_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_STS") ManualSightSeeingQuotationVO manualSightSeeingRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_sightseeing_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
		
		mapview.addObject("STS_ACTION", "ADD");
		mapview.addObject("TRANSFER_TYPE_MODE", UdanChooConstants.TRANSFER_TYPE_MODE);
		
		//mapview.addObject("MANUAL_HTL", manualHotelRequest);
		return mapview;
	}
	
	
	@Transactional
	@PostMapping("/create_create_sightseeing_manual_quotation")
	public ModelAndView create_create_sightseeing_manual_quotation(@RequestParam long quotationId,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_STS") ManualSightSeeingQuotationVO manualSightSeeingRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		sightSeeingQtnValidator.validate(manualSightSeeingRequest, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		if(result.hasErrors()) {
			TgLeadsRecorderVO leadRecorderObj = new TgLeadsRecorderVO();
			leadRecorderObj.setLeadId(quotationEntity.getLeadEntity().getLeadId());
			modelView = form_view_add_sightseeing_quotation(leadRecorderObj,qtnRecorderObj,manualSightSeeingRequest,result,redirectAttrib);
			modelView.addObject("LEAD_OBJ",leadRecorderObj);
			return modelView;
		}else {
			Udn_Manual_SightSeeing_Quotation_Entity manualSightSeeingQuotationEntity = new Udn_Manual_SightSeeing_Quotation_Entity(manualSightSeeingRequest); 
			manualSightSeeingQuotationEntity.setQuotationEntity(quotationEntity);
			manualSightSeeingQuotationEntity.setActive(true);
			quotationEntity.getSightSeeingQuotationList().add(manualSightSeeingQuotationEntity);
			quotationService.saveLead(quotationEntity);
			//quotationService.saveManualFlightQuotation(manualFlightQuotationEntity);
			redirectAttrib.addFlashAttribute("Success","Sight Seeing Record is added successfully!!");
			modelView.setViewName("redirect:form_view_sightseeing_quotation_details?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&quotationId="+quotationId);
			
		}
		return modelView; 
	 }
	
	
	@RequestMapping("/form_view_edit_manual_sightseeing_quotation")
	public ModelAndView form_view_edit_manual_sightseeing_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_STS") ManualSightSeeingQuotationVO manualSightSeeingRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_sightseeing_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
		quotationService.updateInjectedManualSightSeeingObject(manualSightSeeingRequest.getManualSightSeeingQuotationId(), manualSightSeeingRequest);
		mapview.addObject("STS_ACTION", "EDIT");
		mapview.addObject("TRANSFER_TYPE_MODE", UdanChooConstants.TRANSFER_TYPE_MODE);
		return mapview;
	}
	
	
	@Transactional
	@PostMapping("/edit_edit_sightseeing_manual_quotation")
	public ModelAndView edit_edit_sightseeing_manual_quotation(@RequestParam long quotationId,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_STS") ManualSightSeeingQuotationVO manualSightSeeingRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		sightSeeingQtnValidator.validate(manualSightSeeingRequest, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		if(result.hasErrors()) {
			TgLeadsRecorderVO leadRecorderObj = new TgLeadsRecorderVO();
			leadRecorderObj.setLeadId(quotationEntity.getLeadEntity().getLeadId());
			modelView = form_view_edit_manual_sightseeing_quotation(leadRecorderObj,qtnRecorderObj,manualSightSeeingRequest,result,redirectAttrib);
			modelView.addObject("LEAD_OBJ",leadRecorderObj);
			return modelView;
		}else {
			Udn_Manual_SightSeeing_Quotation_Entity manualSightSeeingQuotationEntity = new Udn_Manual_SightSeeing_Quotation_Entity(manualSightSeeingRequest); 
			manualSightSeeingQuotationEntity.setQuotationEntity(quotationEntity);
			quotationService.saveSightSeeingStayQuotation(manualSightSeeingQuotationEntity);
			redirectAttrib.addFlashAttribute("Success","Sight Seeing Record is updated successfully!!");
			modelView.setViewName("redirect:form_view_sightseeing_quotation_details?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&quotationId="+quotationId);
			
		}
		return modelView; 
	 }
	
	@RequestMapping("/form_view_delete_manual_sightseeing_quotation")
	public ModelAndView form_view_delete_manual_sightseeing_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_STS") ManualSightSeeingQuotationVO manualSightSeeingRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_sightseeing_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
		quotationService.updateInjectedManualSightSeeingObject(manualSightSeeingRequest.getManualSightSeeingQuotationId(), manualSightSeeingRequest);
		mapview.addObject("STS_ACTION", "DELETE");
		return mapview;
	}
	
	
	@Transactional
	@PostMapping("/delete_delete_sightseeing_manual_quotation")
	public ModelAndView delete_delete_sightseeing_manual_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_STS") ManualSightSeeingQuotationVO manualSightSeeingRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView modelView = new ModelAndView();
		quotationService.deleteSightSeeingQuotationRecord(manualSightSeeingRequest.getManualSightSeeingQuotationId());
		redirectAttrib.addFlashAttribute("Success","Sight Seeing Record is deleted successfully!!");
		modelView.setViewName("redirect:form_view_sightseeing_quotation_details?leadId="+leadRecorderObj.getLeadId() + "&quotationId="+qtnRecorderObj.getQuotationId());
		return modelView; 
	 }
	
	
	
}

