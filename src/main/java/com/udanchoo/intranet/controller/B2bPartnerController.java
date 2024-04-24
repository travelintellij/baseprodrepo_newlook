package com.udanchoo.intranet.controller;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;
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
   	public ModelAndView form_register_newlead(@ModelAttribute("PARTNER_OBJ") Tg_B2bPartner_Obj partnerObj,BindingResult result) {
    	ModelAndView mapview = new ModelAndView("admin/partner/form_register_new_partner");
    	return mapview;
    }

	
	
}
