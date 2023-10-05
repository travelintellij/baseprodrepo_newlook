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
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Transfer_Quotation_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.Udn_Room_Category_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.api.flight.Tg_Flt_Airport_Obj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.model.quotation.FlightStopDetailQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualFlightQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualHotelQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualTransferQuotationVO;
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
import com.udanchoo.intranet.validator.TransferQuotationValidator;

@Controller
public class TransferQuotationController {
	 
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
    private TransferQuotationValidator transferQtnValidator;
	
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
	
	@RequestMapping("/form_view_transfer_quotation_details")
	public ModelAndView form_view_transfer_quotation_details(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = new ModelAndView("quotation/transfers/viewTransfersQuotationDetails");
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
		updateManualTransferAdditionalFields(qtnRecorderObj);
		qtnRecorderObj.setLeadEntity(tgLeadEntity);
		mapview.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm"));
		mapview.addObject("localDateTimeFormatToEdit", DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm"));
		return mapview;
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
	
	@RequestMapping("/form_view_add_transfer_quotation")
	public ModelAndView form_view_add_transfer_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_TRN") ManualTransferQuotationVO manualTransferRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_transfer_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
		
		mapview.addObject("TRN_ACTION", "ADD");
		mapview.addObject("TRANSFER_POINT_NAME", UdanChooConstants.TRANSFER_POINT_MAP);
		mapview.addObject("TRANSFER_TYPE_MODE", UdanChooConstants.TRANSFER_TYPE_MODE);
		
		//mapview.addObject("MANUAL_HTL", manualHotelRequest);
		return mapview;
	}
	
	@Transactional
	@PostMapping("/create_create_transfer_manual_quotation")
	public ModelAndView create_create_transfer_manual_quotation(@RequestParam long quotationId,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_TRN") ManualTransferQuotationVO manualTransferRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		transferQtnValidator.validate(manualTransferRequest, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		if(result.hasErrors()) {
			TgLeadsRecorderVO leadRecorderObj = new TgLeadsRecorderVO();
			leadRecorderObj.setLeadId(quotationEntity.getLeadEntity().getLeadId());
			modelView = form_view_add_transfer_quotation(leadRecorderObj,qtnRecorderObj,manualTransferRequest,result,redirectAttrib);
			modelView.addObject("LEAD_OBJ",leadRecorderObj);
			return modelView;
		}else {
			Udn_Manual_Transfer_Quotation_Entity manualTransferQuotationEntity = new Udn_Manual_Transfer_Quotation_Entity(manualTransferRequest); 
			manualTransferQuotationEntity.setQuotationEntity(quotationEntity);
			manualTransferRequest.setActive(true);
			quotationEntity.getTransferQuotationList().add(manualTransferQuotationEntity);
			quotationService.saveLead(quotationEntity);
			//quotationService.saveManualFlightQuotation(manualFlightQuotationEntity);
			redirectAttrib.addFlashAttribute("Success","Transfer Record is added successfully!!");
			modelView.setViewName("redirect:form_view_transfer_quotation_details?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&quotationId="+quotationId);
			
		}
		return modelView; 
	 }
	
	@RequestMapping("/form_view_edit_manual_transfer_quotation")
	public ModelAndView form_view_edit_manual_transfer_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_TRN") ManualTransferQuotationVO manualTransferRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_transfer_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
		quotationService.updateInjectedManualTransferObject(manualTransferRequest.getManualTransferQuotationId(), manualTransferRequest);
		mapview.addObject("TRN_ACTION", "EDIT");
		mapview.addObject("TRANSFER_POINT_NAME", UdanChooConstants.TRANSFER_POINT_MAP);
		mapview.addObject("TRANSFER_TYPE_MODE", UdanChooConstants.TRANSFER_TYPE_MODE);
		return mapview;
	}
	
	@Transactional
	@PostMapping("/edit_edit_transfer_manual_quotation")
	public ModelAndView edit_edit_transfer_manual_quotation(@RequestParam long quotationId,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_TRN") ManualTransferQuotationVO manualTransferRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		transferQtnValidator.validate(manualTransferRequest, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		if(result.hasErrors()) {
			TgLeadsRecorderVO leadRecorderObj = new TgLeadsRecorderVO();
			leadRecorderObj.setLeadId(quotationEntity.getLeadEntity().getLeadId());
			modelView = form_view_edit_manual_transfer_quotation(leadRecorderObj,qtnRecorderObj,manualTransferRequest,result,redirectAttrib);
			modelView.addObject("LEAD_OBJ",leadRecorderObj);
			return modelView;
		}else {
			Udn_Manual_Transfer_Quotation_Entity manualTransferQuotationEntity = new Udn_Manual_Transfer_Quotation_Entity(manualTransferRequest); 
			manualTransferQuotationEntity.setQuotationEntity(quotationEntity);
			quotationService.saveTransferStayQuotation(manualTransferQuotationEntity);
			redirectAttrib.addFlashAttribute("Success","Transfer Record is updated successfully!!");
			modelView.setViewName("redirect:form_view_transfer_quotation_details?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&quotationId="+quotationId);
			
		}
		return modelView; 
	 }
	
	@RequestMapping("/form_view_delete_manual_transfer_quotation")
	public ModelAndView form_view_delete_manual_transfer_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_TRN") ManualTransferQuotationVO manualTransferRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_transfer_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
		quotationService.updateInjectedManualTransferObject(manualTransferRequest.getManualTransferQuotationId(), manualTransferRequest);
		mapview.addObject("TRN_ACTION", "DELETE");
		quotationService.updateInjectedManualTransferObject(manualTransferRequest.getManualTransferQuotationId(), manualTransferRequest);
		return mapview;
	}
	
	@Transactional
	@PostMapping("/delete_delete_transfer_manual_quotation")
	public ModelAndView delete_delete_transfer_manual_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_TRN") ManualTransferQuotationVO manualTransferRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView modelView = new ModelAndView();
		quotationService.deleteTranferQuotationRecord(manualTransferRequest.getManualTransferQuotationId());
		redirectAttrib.addFlashAttribute("Success","Transfer Record is deleted successfully!!");
		modelView.setViewName("redirect:form_view_transfer_quotation_details?leadId="+leadRecorderObj.getLeadId() + "&quotationId="+qtnRecorderObj.getQuotationId());
		return modelView; 
	 }
	
	
}

