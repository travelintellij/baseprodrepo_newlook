package com.udanchoo.intranet.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.model.Tg_B2bPartner_Obj;
import com.udanchoo.intranet.model.Udn_Hotel_Chain_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.service.TgB2bPartnerServicesImpl;
import com.udanchoo.intranet.util.UdanChooConstants;

@Controller
public class B2bPartnerController {

	
	@Autowired
	TgB2bPartnerServicesImpl b2bPartnerService;
	
	@ResponseBody
	@RequestMapping("getB2bPartnerById")
    public Tg_B2bPartner_Obj findB2bPartnerByID(@RequestParam("b2bPartnerId") int b2bPartnerId) {
		Tg_B2bPartner_Obj partnerObj = new Tg_B2bPartner_Obj(); 
		Tg_B2b_Partner_Entity partnerEntity= b2bPartnerService.findPartnerById(b2bPartnerId);
		if(partnerEntity==null) {
			return partnerObj;
		}
		partnerObj.updateVoFromEntity(partnerEntity); 
		return partnerObj;
	}

	@RequestMapping("form_register_partner")
   	public ModelAndView form_register_partner(@ModelAttribute("PARTNER_OBJ") Tg_B2bPartner_Obj partnerObj,BindingResult result) {
    	ModelAndView mapview = new ModelAndView("admin/partner/form_register_new_partner");
    	return mapview;
    }

	 @Transactional
	@PostMapping("create_create_partner")
	public ModelAndView create_create_partner(@ModelAttribute("PARTNER_OBJ") Tg_B2bPartner_Obj partnerObj,  BindingResult result,final RedirectAttributes redirectAttrib ) throws IOException {
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("redirect:form_register_partner");
		//leadValidator.validate(leadRecorderObj, result);
		if(result.hasErrors()) {
			modelView = form_register_partner(partnerObj, result);
			return modelView;
		}else {
			b2bPartnerService.savePartnerAndFile(partnerObj);
			/*
			Tg_Leads_Recorder_Entity tgLeadEntity = new Tg_Leads_Recorder_Entity(leadRecorderObj);
			//below is the temporary code and need to be deleted and uncomment the saveLead part. 
			//tgLeadEntity.setLeadId(7l);
			leadService.saveLead(tgLeadEntity);
			leadRecorderObj.setLeadId(tgLeadEntity.getLeadId());
			redirectAttrib.addFlashAttribute("Success", "Lead Record is updated Successfully..");
			modelView.setViewName("redirect:view_lead_details?leadId="+tgLeadEntity.getLeadId());
			if(leadRecorderObj.isLeadCreationClientInformed()) {
				notifyLeadCreationTargetAudience(leadRecorderObj,"LeadCreateConfirmation.ftl",true,true);
				notifyLeadCreationSms(leadRecorderObj);
			}*/
			//write email code here. 
		}
		return modelView; 
	 }
	
}
