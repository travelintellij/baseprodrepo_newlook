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
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Hotel_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Other_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Package_Quotation_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.Udn_Room_Category_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.api.flight.Tg_Flt_Airport_Obj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.model.quotation.FlightStopDetailQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualFlightQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualHotelQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualOtherQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualPackageQuotationVO;
import com.udanchoo.intranet.model.quotation.TgQuotationRecorderVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
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
import com.udanchoo.intranet.validator.HotelQuotationValidator;
import com.udanchoo.intranet.validator.ManualQuotationValidator;
import com.udanchoo.intranet.validator.PackageQuotationValidator;

@Controller
public class OtherServiceQuotationController {
	 
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
/*
	@Autowired
    private PackageQuotationValidator packageQtnValidator;
*/
	
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
	

	@RequestMapping("/form_view_other_quotation_details")
	public ModelAndView form_view_other_quotation_details(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = new ModelAndView("quotation/other/viewOtherQuotationDetails");
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
		updateManualPackageAdditionalFields(qtnRecorderObj);
		qtnRecorderObj.setLeadEntity(tgLeadEntity);
		mapview.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy"));
		
		return mapview;
	}

	
	
	private void updateManualPackageAdditionalFields(TgQuotationRecorderVO qtnRecorderObj) {
		qtnRecorderObj.getTourPackageVoList().forEach((e) -> { 
			e.setCityName(commonService.findDestinationById(e.getCityId()).getCityName());
		});
		
	}
	
	
	
	@RequestMapping("/form_view_add_other_quotation")
	public ModelAndView form_view_add_other_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_OTH") ManualOtherQuotationVO manualOtherRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_other_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
		//mapview.setViewName("quotation/package/form_view_add_manual_other_quotation");
		//mapview.setViewName("quotation/package/addPackageQuotationDetails");
		mapview.addObject("OTH_ACTION", "ADD");
		//mapview.addObject("MANUAL_HTL", manualHotelRequest);
		return mapview;
	}
	
	
	@Transactional
	@PostMapping("/create_create_other_manual_quotation")
	public ModelAndView create_create_other_manual_quotation(@RequestParam long quotationId,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_OTH") ManualOtherQuotationVO manualOtherRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		//packageQtnValidator.validate(manualPackageRequest, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		if(result.hasErrors()) {
			TgLeadsRecorderVO leadRecorderObj = new TgLeadsRecorderVO();
			leadRecorderObj.setLeadId(quotationEntity.getLeadEntity().getLeadId());
			modelView = form_view_add_other_quotation(leadRecorderObj,qtnRecorderObj,manualOtherRequest,result,redirectAttrib);
			modelView.addObject("LEAD_OBJ",leadRecorderObj);
			return modelView;
		}else {
			Udn_Manual_Other_Quotation_Entity manualOtherQuotationEntity = new Udn_Manual_Other_Quotation_Entity(manualOtherRequest); 
			manualOtherQuotationEntity.setQuotationEntity(quotationEntity);
			manualOtherQuotationEntity.setActive(true);
			quotationEntity.getOtherQuotationsList().add(manualOtherQuotationEntity);
			quotationService.saveLead(quotationEntity);
			//quotationService.saveManualFlightQuotation(manualFlightQuotationEntity);
			redirectAttrib.addFlashAttribute("Success","Other Service Record Added Successfully!!");
			modelView.setViewName("redirect:form_view_other_quotation_details?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&quotationId="+quotationId);
			
		}
		return modelView; 
	 }
	
	
	
	@RequestMapping("/form_view_edit_manual_other_quotation")
	public ModelAndView form_view_edit_manual_other_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_OTH") ManualOtherQuotationVO manualOtherRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_other_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
		quotationService.updateInjectedManualOtherObject(manualOtherRequest.getManualOtherQuotationId(), manualOtherRequest);
		mapview.addObject("OTH_ACTION", "EDIT");
		//mapview.setViewName("quotation/package/form_view_edit_manual_package_quotation");
		return mapview;
	}
	
	@Transactional
	@PostMapping("/edit_edit_other_manual_quotation")
	public ModelAndView edit_edit_other_manual_quotation(@RequestParam long quotationId,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_OTH") ManualOtherQuotationVO manualOtherRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		//packageQtnValidator.validate(manualOtherRequest, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		if(result.hasErrors()) {
			TgLeadsRecorderVO leadRecorderObj = new TgLeadsRecorderVO();
			leadRecorderObj.setLeadId(quotationEntity.getLeadEntity().getLeadId());
			modelView = form_view_edit_manual_other_quotation(leadRecorderObj,qtnRecorderObj,manualOtherRequest,result,redirectAttrib);
			modelView.addObject("LEAD_OBJ",leadRecorderObj);
			return modelView;
		}else {
			Udn_Manual_Other_Quotation_Entity manualOtherQuotationEntity = new Udn_Manual_Other_Quotation_Entity(manualOtherRequest); 
			manualOtherQuotationEntity.setQuotationEntity(quotationEntity);
			quotationService.saveOtherQuotation(manualOtherQuotationEntity);
			//quotationEntity.getHotelQuotationsList().add(manualHotelQuotationEntity);
			//quotationService.saveLead(quotationEntity);
			//quotationService.saveManualFlightQuotation(manualFlightQuotationEntity);
			redirectAttrib.addFlashAttribute("Success","Other Service Record Updated Successfully!!");
			modelView.setViewName("redirect:form_view_other_quotation_details?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&quotationId="+quotationId);
			
		}
		return modelView; 
	 }
	
	@RequestMapping("/form_view_delete_manual_other_quotation")
	public ModelAndView form_view_delete_manual_other_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_OTH") ManualOtherQuotationVO manualOtherRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_other_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
		quotationService.updateInjectedManualOtherObject(manualOtherRequest.getManualOtherQuotationId(), manualOtherRequest);
		
		mapview.addObject("OTH_ACTION", "DELETE");
		//mapview.setViewName("quotation/package/form_view_delete_manual_package_quotation");

		return mapview;
	}
	
	@Transactional
	@PostMapping("/delete_delete_other_manual_quotation")
	public ModelAndView delete_delete_other_manual_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_OTH") ManualOtherQuotationVO manualOtherRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView modelView = new ModelAndView();
		quotationService.deleteOtherStayQuotation(manualOtherRequest.getManualOtherQuotationId());
		redirectAttrib.addFlashAttribute("Success","Other Service Record Deleted Successfully!!");
		modelView.setViewName("redirect:form_view_other_quotation_details?leadId="+leadRecorderObj.getLeadId() + "&quotationId="+qtnRecorderObj.getQuotationId());
		return modelView; 
	 }


}

