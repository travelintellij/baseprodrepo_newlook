package com.udanchoo.intranet.controller.quotation;


import java.time.format.DateTimeFormatter;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
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
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Insurance_Quotation_Entity;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.model.quotation.ManualInsuranceQuotationVO;
import com.udanchoo.intranet.model.quotation.TgQuotationRecorderVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.EmailServiceImpl;
import com.udanchoo.intranet.service.LeadServiceImpl;
import com.udanchoo.intranet.service.QuotationServiceImpl;
import com.udanchoo.intranet.service.TgB2bPartnerServicesImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.validator.InsuranceQuotationValidator;

@Controller
public class InsuranceQuotationController {
	 
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	

	@Autowired
    private InsuranceQuotationValidator insuranceQtnValidator;
	
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
	

	@RequestMapping("/form_view_insurance_quotation_details")
	public ModelAndView form_view_insurance_quotation_details(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = new ModelAndView("quotation/insurance/viewInsuranceQuotationDetails");
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
		updateManualInsuranceAdditionalFields(qtnRecorderObj);
		qtnRecorderObj.setLeadEntity(tgLeadEntity);
		
		mapview.addObject("INSURANCE_PROVIDERS_MAP", UdanChooConstants.INSURANCE_PROVIDERS_MAP);
		mapview.addObject("CURRENCY_LIST", UdanChooConstants.CURRENCY_LIST);
		mapview.addObject("INSURANCE_TYPE_MAP", UdanChooConstants.INSURANCE_TYPE_MAP);
		
		return mapview;
	}

	
	
	private void updateManualInsuranceAdditionalFields(TgQuotationRecorderVO qtnRecorderObj) {
		qtnRecorderObj.getInsuranceVoList().forEach((e) -> { 
			e.setInsuranceProviderName(UdanChooConstants.INSURANCE_PROVIDERS_MAP.get(e.getInsuranceProvider()));
			e.setCountryName(commonService.findDestinationById(e.getCountryId()).getCountryName());
			e.setInsuranceTypeName(UdanChooConstants.INSURANCE_TYPE_MAP.get(e.getInsuranceType()));
		});
		
	}
	
	
	
	@RequestMapping("/form_view_add_insurance_quotation")
	public ModelAndView form_view_add_insurance_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_INS") ManualInsuranceQuotationVO manualInsuranceRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_insurance_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
		//mapview.setViewName("quotation/package/form_view_add_manual_other_quotation");
		//mapview.setViewName("quotation/package/addPackageQuotationDetails");
		mapview.addObject("INS_ACTION", "ADD");
		mapview.addObject("INSURANCE_TYPE_MAP", UdanChooConstants.INSURANCE_TYPE_MAP);
		//mapview.addObject("MANUAL_HTL", manualHotelRequest);
		return mapview;
	}
	
	
	@Transactional
	@PostMapping("/create_create_insurance_manual_quotation")
	public ModelAndView create_create_insurance_manual_quotation(@RequestParam long quotationId,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_INS") ManualInsuranceQuotationVO manualInsuranceRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		insuranceQtnValidator.validate(manualInsuranceRequest, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		if(result.hasErrors()) {
			TgLeadsRecorderVO leadRecorderObj = new TgLeadsRecorderVO();
			leadRecorderObj.setLeadId(quotationEntity.getLeadEntity().getLeadId());
			modelView = form_view_add_insurance_quotation(leadRecorderObj,qtnRecorderObj,manualInsuranceRequest,result,redirectAttrib);
			modelView.addObject("LEAD_OBJ",leadRecorderObj);
			return modelView;
		}else {
			Udn_Manual_Insurance_Quotation_Entity manualInsuranceQuotationEntity = new Udn_Manual_Insurance_Quotation_Entity(manualInsuranceRequest); 
			manualInsuranceQuotationEntity.setQuotationEntity(quotationEntity);
			manualInsuranceQuotationEntity.setActive(true);
			quotationEntity.getInsuranceQuotationsList().add(manualInsuranceQuotationEntity);
			quotationService.saveLead(quotationEntity);
			//quotationService.saveManualFlightQuotation(manualFlightQuotationEntity);
			redirectAttrib.addFlashAttribute("Success","Insurance Service Record Added Successfully!!");
			modelView.setViewName("redirect:form_view_insurance_quotation_details?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&quotationId="+quotationId);
			
		}
		return modelView; 
	 }
	
	
	
	@RequestMapping("/form_view_edit_manual_insurance_quotation")
	public ModelAndView form_view_edit_manual_insurance_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_INS") ManualInsuranceQuotationVO manualInsuranceRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_insurance_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
		quotationService.updateInjectedManualInsuranceObject(manualInsuranceRequest.getManualInsuranceQuotationId(), manualInsuranceRequest);
		mapview.addObject("INS_ACTION", "EDIT");
		mapview.addObject("INSURANCE_TYPE_MAP", UdanChooConstants.INSURANCE_TYPE_MAP);
		//mapview.setViewName("quotation/package/form_view_edit_manual_package_quotation");
		return mapview;
	}
	
	@Transactional
	@PostMapping("/edit_edit_insurance_manual_quotation")
	public ModelAndView edit_edit_insurance_manual_quotation(@RequestParam long quotationId,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_INS") ManualInsuranceQuotationVO manualInsuranceRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		insuranceQtnValidator.validate(manualInsuranceRequest, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		if(result.hasErrors()) {
			TgLeadsRecorderVO leadRecorderObj = new TgLeadsRecorderVO();
			leadRecorderObj.setLeadId(quotationEntity.getLeadEntity().getLeadId());
			//modelView = form_view_edit_manual_insurance_quotation(leadRecorderObj,qtnRecorderObj,manualInsuranceRequest,result,redirectAttrib);
			modelView = form_view_insurance_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
			modelView.addObject("INS_ACTION", "EDIT");
			modelView.setViewName("quotation/insurance/viewInsuranceQuotationDetails");
			
			modelView.addObject("LEAD_OBJ",leadRecorderObj);
			return modelView;
		}else {
			Udn_Manual_Insurance_Quotation_Entity manualInsuranceQuotationEntity = new Udn_Manual_Insurance_Quotation_Entity(manualInsuranceRequest); 
			manualInsuranceQuotationEntity.setQuotationEntity(quotationEntity);
			quotationService.saveInsuranceQuotation(manualInsuranceQuotationEntity);
			//quotationEntity.getHotelQuotationsList().add(manualHotelQuotationEntity);
			//quotationService.saveLead(quotationEntity);
			//quotationService.saveManualFlightQuotation(manualFlightQuotationEntity);
			redirectAttrib.addFlashAttribute("Success","Insurance Service Record Updated Successfully!!");
			modelView.setViewName("redirect:form_view_insurance_quotation_details?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&quotationId="+quotationId);
			
		}
		return modelView; 
	 }
	
	@RequestMapping("/form_view_delete_manual_insurance_quotation")
	public ModelAndView form_view_delete_manual_insurance_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_INS") ManualInsuranceQuotationVO manualInsuranceRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_insurance_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
		quotationService.updateInjectedManualInsuranceObject(manualInsuranceRequest.getManualInsuranceQuotationId(), manualInsuranceRequest);
		
		mapview.addObject("INS_ACTION", "DELETE");
		//mapview.setViewName("quotation/package/form_view_delete_manual_package_quotation");

		return mapview;
	}
	
	@Transactional
	@PostMapping("/delete_delete_insurance_manual_quotation")
	public ModelAndView delete_delete_insurance_manual_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_INS") ManualInsuranceQuotationVO manualInsuranceRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView modelView = new ModelAndView();
		quotationService.deleteInsuranceQuotation(manualInsuranceRequest.getManualInsuranceQuotationId());
		redirectAttrib.addFlashAttribute("Success","Insurance Service Record Deleted Successfully!!");
		modelView.setViewName("redirect:form_view_insurance_quotation_details?leadId="+leadRecorderObj.getLeadId() + "&quotationId="+qtnRecorderObj.getQuotationId());
		return modelView; 
	 }


}

