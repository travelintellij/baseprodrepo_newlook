package com.udanchoo.intranet.controller.quotation;


import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;
import com.udanchoo.intranet.entity.Udn_Destinations_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Master_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.entity.quotation.Tg_Quotation_Recorder_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Visa_Quotation_Entity;
import com.udanchoo.intranet.model.Udn_Visa_Master_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.model.quotation.ManualVisaQuotationVO;
import com.udanchoo.intranet.model.quotation.TgQuotationRecorderVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.LeadServiceImpl;
import com.udanchoo.intranet.service.QuotationServiceImpl;
import com.udanchoo.intranet.service.TgB2bPartnerServicesImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.service.VisaServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.validator.SightSeeingQuotationValidator;
import com.udanchoo.intranet.validator.VisaQuotationValidator;

@Controller
public class VisaQuotationController {
	 
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
	VisaServiceImpl visaService;

	
	@Autowired
    private VisaQuotationValidator visaQtnValidator;
	
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
	
	@RequestMapping("/form_view_visa_quotation_details")
	public ModelAndView form_view_visa_quotation_details(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = new ModelAndView("quotation/visa/viewVisaQuotationDetails");
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
		updateManualVisaAdditionalFields(qtnRecorderObj);
		qtnRecorderObj.setLeadEntity(tgLeadEntity);
		//mapview.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm"));
		//mapview.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy"));
		//mapview.addObject("localDateTimeFormatToEdit", DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm"));
		return mapview;
	}
	
	private void updateManualVisaAdditionalFields(TgQuotationRecorderVO qtnRecorderObj) {
		qtnRecorderObj.getVisaVoList().forEach((e) -> { 
			Udn_Visa_Master_Entity visaEntity = e.getVisaQuotationEntity();
			e.setVisaConsulate(commonService.findDestinationById(visaEntity.getConsulateCity()).getCityName());
			e.setVisaCountry(commonService.findDestinationByCountryCode(visaEntity.getCountryCode()).getCountryName());
		});
		
	}
	
	
	  //@PostMapping("view_list_visa_proceed_docs_form")
    @RequestMapping(value = "view_visa_master_details_modal", method = { RequestMethod.GET, RequestMethod.POST })
   	public ModelAndView view_visa_master_details_modal(@ModelAttribute("VISA_OBJ") @Valid Udn_Visa_Master_Obj visaObj, BindingResult result ) {
    	
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView();
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	int visaId;
    	if(visaObj.getVisaId()!=0) {
    		visaId = visaObj.getVisaId();
 	    	modelView.addObject("VISA_PROFILE", UdanChooConstants.VISA_PROFILE);
	    	modelView.addObject("VISA_TYPE", UdanChooConstants.VISA_TYPE);
	    	modelView.addObject("VISA_PURPOSE", UdanChooConstants.VISA_PURPOSE);
	    	
	    	visaObj = new Udn_Visa_Master_Obj(visaService.findVisaEntityById(visaId) );
	        visaObj.setCountryName(commonService.findDestinationByCountryCode(visaObj.getCountryCode()).getCountryName());
	        visaObj.setCityName(commonService.findDestinationById(visaObj.getConsulateCity()).getCityName());
	    	modelView.setViewName("quotation/visa/view_visa_master_details_modal");
	    	List listVisaDoc = visaService.findVisaDocsByVisaId(visaId);
	  	   	modelView.addObject("VISA_DOC_LIST", listVisaDoc);
	  	   	modelView.addObject("VISA_OBJ", visaObj);
    	}
    	else {
    		modelView.addObject("Error", "Invalid Visa Master Record !!");
    	}
    		
  	   	return modelView;
    }

    @RequestMapping(value = "view_visa_documents_details_modal", method = { RequestMethod.GET, RequestMethod.POST })
   	public ModelAndView view_visa_documents_details_modal(@ModelAttribute("VISA_OBJ") @Valid Udn_Visa_Master_Obj visaObj, BindingResult result ) {
    	ModelAndView modelView = view_visa_master_details_modal( visaObj, result );
    	modelView.setViewName("quotation/visa/view_visa_master_documents_details_modal");
  	   	return modelView;
    }

    
    @RequestMapping("form_view_search_visa_quotation_form")
   	public ModelAndView form_view_search_visa_quotation_form(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("visa_obj") @Valid Udn_Visa_Master_Obj visaObj, BindingResult result,final RedirectAttributes redirectAttrib ) {
    	ModelAndView modelView = form_view_visa_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
    	modelView.addObject("VSA_ACTION","SEARCH_ADD");
    	return modelView;
    }

    
    @RequestMapping(value = "search_search_visa_master_quotation", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView search_search_visa_master_quotation(@RequestParam("countryCode") String countryCode,@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("visa_obj") @Valid Udn_Visa_Master_Obj visaObj, BindingResult result,final RedirectAttributes redirectAttrib ) {
    	ModelAndView modelView = form_view_search_visa_quotation_form(leadRecorderObj,qtnRecorderObj,visaObj,result,redirectAttrib);
    	UserDetailsObj userObj = getLoggedInUser();
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	List visaEntityList = new ArrayList();
    	if(countryCode!=null && countryCode.trim().length()>0) {
    		visaEntityList = visaService.findVisaEntityByCountryCode(countryCode);
    	}
    	Udn_Destinations_Entity destinationEntity = commonService.findDestinationByCountryCode(countryCode);
    	List visaMasterObjList = generateVoVisaMaster(visaEntityList);
    	modelView.addObject("VISA_COUNT_MSG", "<B>" + visaMasterObjList.size() + " Visa Record Found. </B>"); 
    	modelView.addObject("VISA_RESULT_SET", visaMasterObjList);
    	modelView.addObject("COUNTRY_CODE", countryCode);
    	modelView.addObject("COUNTRY_NAME", destinationEntity.getCountryName());
	    modelView.addObject("VISA_PROFILE", UdanChooConstants.VISA_PROFILE);
    	modelView.addObject("VISA_TYPE", UdanChooConstants.VISA_TYPE);
    	modelView.addObject("VISA_PURPOSE", UdanChooConstants.VISA_PURPOSE);

    	return modelView;
    }

	private List<Udn_Visa_Master_Obj> generateVoVisaMaster(List<Udn_Visa_Master_Entity> visaEntityList) {
		List<Udn_Visa_Master_Obj> visaMasterObjList = new ArrayList<Udn_Visa_Master_Obj>();
		Iterator itrVisaEntity=visaEntityList.iterator();
		while(itrVisaEntity.hasNext()) {
			Udn_Visa_Master_Entity visaEntity =(Udn_Visa_Master_Entity) itrVisaEntity.next(); 
			Udn_Visa_Master_Obj visaObj = new Udn_Visa_Master_Obj(visaEntity);
			visaObj.setCountryName(commonService.findDestinationByCountryCode(visaObj.getCountryCode()).getCountryName());
			visaObj.setCityName(commonService.findDestinationById(visaObj.getConsulateCity()).getCityName());
			visaMasterObjList.add(visaObj);
		}
		return visaMasterObjList;
	}
    
	
	@RequestMapping("form_view_add_visa_quotation_form")
	public ModelAndView form_view_add_visa_quotation_form(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("VISA_OBJ") @Valid Udn_Visa_Master_Obj visaObj, @ModelAttribute("MANUAL_VSA") ManualVisaQuotationVO manualVisaQtnVo, BindingResult result,final RedirectAttributes redirectAttrib ) {
		ModelAndView modelView = form_view_visa_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
		Udn_Visa_Master_Entity visaEntity = visaService.findVisaEntityById(visaObj.getVisaId());
		visaObj.updateVisaVoFromEntity(visaEntity);
		visaObj.setCountryName(commonService.findDestinationByCountryCode(visaObj.getCountryCode()).getCountryName());
	    visaObj.setCityName(commonService.findDestinationById(visaObj.getConsulateCity()).getCityName());
		modelView.addObject("VSA_ACTION","ADD_VISA");
	    return modelView;
	}
	
	@Transactional
	@PostMapping("/create_create_visa_manual_quotation")
	public ModelAndView create_create_visa_manual_quotation(@RequestParam long quotationId,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("VISA_OBJ") @Valid Udn_Visa_Master_Obj visaObj,@ModelAttribute("MANUAL_VSA") ManualVisaQuotationVO manualVisaRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		visaQtnValidator.validate(manualVisaRequest, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		if(result.hasErrors()) {
			TgLeadsRecorderVO leadRecorderObj = new TgLeadsRecorderVO();
			leadRecorderObj.setLeadId(quotationEntity.getLeadEntity().getLeadId());
			modelView = form_view_add_visa_quotation_form(leadRecorderObj,qtnRecorderObj,visaObj,manualVisaRequest,result,redirectAttrib);
			modelView.addObject("LEAD_OBJ",leadRecorderObj);
			return modelView;
		}else {
			Udn_Visa_Master_Entity visaMasterEntity = visaService.findVisaEntityById(visaObj.getVisaId());
			
			Udn_Manual_Visa_Quotation_Entity manualVisaQuotationEntity = new Udn_Manual_Visa_Quotation_Entity(manualVisaRequest); 
			manualVisaQuotationEntity.setQuotationEntity(quotationEntity);
			manualVisaQuotationEntity.setActive(true);
			manualVisaQuotationEntity.setVisaQuotationEntity(visaMasterEntity );
			quotationEntity.getVisaQuotationList().add(manualVisaQuotationEntity);
			quotationService.saveLead(quotationEntity);
			//quotationService.saveManualFlightQuotation(manualFlightQuotationEntity);
			redirectAttrib.addFlashAttribute("Success","Visa Quotation Record is added successfully!!");
			modelView.setViewName("redirect:form_view_visa_quotation_details?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&quotationId="+quotationId);
			
		}
		return modelView; 
	 }
	
	@RequestMapping("form_view_edit_visa_quotation_form")
	public ModelAndView form_view_edit_visa_quotation_form(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("VISA_OBJ") @Valid Udn_Visa_Master_Obj visaObj, @ModelAttribute("MANUAL_VSA") ManualVisaQuotationVO manualVisaQtnVo, BindingResult result,final RedirectAttributes redirectAttrib ) {
		ModelAndView modelView = form_view_visa_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
		Udn_Visa_Master_Entity visaEntity = visaService.findVisaEntityById(visaObj.getVisaId());
		visaObj.updateVisaVoFromEntity(visaEntity);
		visaObj.setCountryName(commonService.findDestinationByCountryCode(visaObj.getCountryCode()).getCountryName());
	    visaObj.setCityName(commonService.findDestinationById(visaObj.getConsulateCity()).getCityName());
		modelView.addObject("VSA_ACTION","EDIT_VISA");
		Udn_Manual_Visa_Quotation_Entity manualVisaEntity = quotationService.findManualVisaQuotationEntityById(manualVisaQtnVo.getManualVisaQuotationId());
		manualVisaQtnVo.updateManualVisaVoFromEntity(manualVisaEntity);
	    return modelView;
	}
	
	
	@Transactional
	@PostMapping("/edit_edit_visa_manual_quotation")
	public ModelAndView edit_edit_visa_manual_quotation(@RequestParam long quotationId,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("VISA_OBJ") @Valid Udn_Visa_Master_Obj visaObj,@ModelAttribute("MANUAL_VSA") ManualVisaQuotationVO manualVisaRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		visaQtnValidator.validate(manualVisaRequest, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		if(result.hasErrors()) {
			TgLeadsRecorderVO leadRecorderObj = new TgLeadsRecorderVO();
			leadRecorderObj.setLeadId(quotationEntity.getLeadEntity().getLeadId());
			modelView = form_view_add_visa_quotation_form(leadRecorderObj,qtnRecorderObj,visaObj,manualVisaRequest,result,redirectAttrib);
			modelView.addObject("LEAD_OBJ",leadRecorderObj);
			return modelView;
		}else {
			Udn_Visa_Master_Entity visaMasterEntity = visaService.findVisaEntityById(visaObj.getVisaId());
			Udn_Manual_Visa_Quotation_Entity manualVisaQuotationEntity = new Udn_Manual_Visa_Quotation_Entity(manualVisaRequest); 
			manualVisaQuotationEntity.setQuotationEntity(quotationEntity);
			manualVisaQuotationEntity.setActive(true);
			manualVisaQuotationEntity.setVisaQuotationEntity(visaMasterEntity );
			quotationService.saveVisaQuotation(manualVisaQuotationEntity);
			//quotationService.saveManualFlightQuotation(manualFlightQuotationEntity);
			redirectAttrib.addFlashAttribute("Success","Visa Quotation Record is updated successfully!!");
			modelView.setViewName("redirect:form_view_visa_quotation_details?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&quotationId="+quotationId);
			
		}
		return modelView; 
	 }

	@RequestMapping("/form_view_delete_manual_visa_quotation")
	public ModelAndView form_view_delete_manual_visa_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_VSA") ManualVisaQuotationVO manualVisaRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = form_view_visa_quotation_details(leadRecorderObj,qtnRecorderObj,result,redirectAttrib);
		quotationService.updateInjectedManualVisaObject(manualVisaRequest.getManualVisaQuotationId(), manualVisaRequest);
		mapview.addObject("VSA_ACTION", "DELETE");
		return mapview;
	}

	@Transactional
	@PostMapping("/delete_delete_visa_manual_quotation")
	public ModelAndView delete_delete_visa_manual_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_VSA") ManualVisaQuotationVO manualVisaRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView modelView = new ModelAndView();
		quotationService.deleteVisaQuotationRecord(manualVisaRequest.getManualVisaQuotationId());
		redirectAttrib.addFlashAttribute("Success","Visa Record is deleted successfully!!");
		modelView.setViewName("redirect:form_view_visa_quotation_details?leadId="+leadRecorderObj.getLeadId() + "&quotationId="+qtnRecorderObj.getQuotationId());
		return modelView; 
	 }
	
	
}

