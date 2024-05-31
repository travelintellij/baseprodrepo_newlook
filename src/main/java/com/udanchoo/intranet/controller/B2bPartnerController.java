package com.udanchoo.intranet.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;
import com.udanchoo.intranet.entity.leads.TI_Leads_Followup_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;

import com.udanchoo.intranet.model.UdnDealStatusVO;
import com.udanchoo.intranet.model.Udn_Hotel_Chain_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.leads.FilterLeadObj;
import com.udanchoo.intranet.model.leads.TI_Leads_Followup_VO;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.model.partner.FilterPartnerObj;
import com.udanchoo.intranet.model.partner.Tg_B2bPartner_Obj;
import com.udanchoo.intranet.service.FileStorageService;
import com.udanchoo.intranet.service.TgB2bPartnerServicesImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.validator.B2bPartnerValidator;

@Controller
public class B2bPartnerController {

	
	@Autowired
	TgB2bPartnerServicesImpl b2bPartnerService;
	
	@Autowired
	B2bPartnerValidator b2bPartnerValidator;
	
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	 private FileStorageService fileStorageService;
	

	
	//@Value("${file.upload-partnerlogodir}")
	//private String LOGO_FILE_PATH;
	
    @Value("${file.upload-partnerlogodir}")
    private String absoluteImageDirectory;
	//private String LOGO_FILE_PATH="/uploads/";

	
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
	@PostMapping("create_create_b2b_partner")
	public ModelAndView create_create_b2b_partner(@ModelAttribute("PARTNER_OBJ") Tg_B2bPartner_Obj partnerObj,  BindingResult result,final RedirectAttributes redirectAttrib ) throws IOException {
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("redirect:view_filter_partners");
		b2bPartnerValidator.validate(partnerObj, result);
		if(partnerObj.getPartnerShortName()==null || partnerObj.getPartnerShortName().trim().length()==0) {
			result.rejectValue("partnerShortName", "parnter.shortname.error");
		}
		if(b2bPartnerService.checkPartnerExistByShortName(partnerObj.getPartnerShortName())){
			result.rejectValue("partnerShortName", "parnter.shortname.duplicate.error");
		}

		if(result.hasErrors()) {
			modelView = form_register_partner(partnerObj, result);
			return modelView;
		}else {
			b2bPartnerService.savePartnerAndFile(partnerObj);
		}
		return modelView; 
	 }
	
	private boolean isValidImageFile(MultipartFile file) {
        return file.getContentType() != null && (file.getContentType().equals(MediaType.IMAGE_JPEG_VALUE)
                || file.getContentType().equals(MediaType.IMAGE_PNG_VALUE));
    }
	
	@Transactional
	@PostMapping(value = "edit_edit_b2b_partner", params = "Update_Partner")
	public ModelAndView edit_edit_b2b_partner(@ModelAttribute("PARTNER_OBJ") Tg_B2bPartner_Obj partnerObj,  BindingResult result,final RedirectAttributes redirectAttrib ) throws IOException {
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("redirect:form_auto_resubmit?partnerId="+partnerObj.getPartnerId());
		b2bPartnerValidator.validate(partnerObj, result);
		if(result.hasErrors()) {
			modelView = form_view_edit_b2b_partner(partnerObj, result);
			return modelView;
		}else {
			System.out.println("Logo Exists for " + b2bPartnerService.checkPartnerLogoExists(partnerObj));
			b2bPartnerService.savePartnerAndFile(partnerObj);
		}
		return modelView; 
	 }
	
	@PostMapping(value = "edit_edit_b2b_partner", params = "Delete_Logo")
	public ModelAndView deleteLogo(@ModelAttribute("PARTNER_OBJ") Tg_B2bPartner_Obj partnerObj,BindingResult result) throws IOException {
		b2bPartnerService.deleteLogoIfExists(partnerObj);
		ModelAndView mapview = form_view_edit_b2b_partner(partnerObj, result);
    	return mapview;
	}
	
	@RequestMapping(value="form_auto_resubmit",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView form_auto_resubmit( @ModelAttribute("PARTNER_OBJ") Tg_B2bPartner_Obj partnerObj,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView modelView = new ModelAndView("admin/partner/form_auto_resubmit");
		//redirectAttrib.addFlashAttribute("Success", "Partner Record is updated Successfully..");
		modelView.addObject("Success", "Partner Record is updated Successfully..");
		return modelView; 
	}

	
	@RequestMapping(value="view_filter_partners",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView view_filter_partners( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "3") Integer pageSize, @RequestParam(defaultValue = "CreatedAt") String sortBy,@ModelAttribute("FILTER_PARTNER") FilterPartnerObj filterPartnerObj,BindingResult result) {
		pageSize = UdanChooConstants.DEFAULT_PAGE_SIZE;
		ModelAndView modelView = new ModelAndView("admin/partner/view_filterPartners");
		//System.out.println(filterObj);
		
		/* filterLeadValidator.validate(filterObj, result);
		if(result.hasErrors()) {
			System.out.println("error is " + result);
			return modelView; 
		}
		*/
		UserDetailsObj user = getLoggedInUser();
		
		boolean isAdmin=false;
	    if(user.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN") || a.getAuthority().equals("PARTNER_MANAGER"))) {
	   		isAdmin=true;
	   	}
		//TODO Check if some one changes the url manually then it should lead to an error page. not to a server error. 
		int pageNum = Integer.parseInt(page);
		Page<Tg_B2b_Partner_Entity> pageLeadsFilteredRecords = b2bPartnerService.filterPartners(pageNum, pageSize, sortBy, filterPartnerObj, isAdmin);
		List<Tg_B2bPartner_Obj> filteredPartnersVoList = generateFilteredPartnersVo(pageLeadsFilteredRecords);
		modelView.addObject("FILTERED_PARTNERS_RECORDS",filteredPartnersVoList);
		modelView.addObject("maxPages", pageLeadsFilteredRecords.getTotalPages());
		modelView.addObject("page", pageNum);
		modelView.addObject("sortBy", sortBy);
		return modelView;
	}
	
	private List<Tg_B2bPartner_Obj> generateFilteredPartnersVo(Page<Tg_B2b_Partner_Entity> pagedResult) {
		List<Tg_B2bPartner_Obj> filteredLeadsVoList = new ArrayList<Tg_B2bPartner_Obj>();
		List<Tg_B2b_Partner_Entity> partnersEntityList = pagedResult.getContent();
		Iterator filteredPartnersIterator = partnersEntityList.iterator();
		while(filteredPartnersIterator.hasNext()) {
			Tg_B2b_Partner_Entity partnerEntity = (Tg_B2b_Partner_Entity) filteredPartnersIterator.next();
			Tg_B2bPartner_Obj partnerVO =b2bPartnerService.getPartnerVoFromEntity(partnerEntity);
			partnerVO.setCityName(commonService.findDestinationById(partnerVO.getCityId()).getCityName());
			filteredLeadsVoList.add(partnerVO);
		}
		return filteredLeadsVoList;
	}
	
	@PostMapping(value = "form_action_b2b_partner", params = "Edit")
	public ModelAndView form_view_edit_b2b_partner(@ModelAttribute("PARTNER_OBJ") Tg_B2bPartner_Obj partnerObj,BindingResult result) throws IOException {
		Tg_B2b_Partner_Entity partnerEntity = b2bPartnerService.findPartnerById(partnerObj.getPartnerId());
		partnerObj.updateVoFromEntity(partnerEntity);
		partnerObj.setCityName(commonService.findDestinationById(partnerObj.getCityId()).getCityName());
		ModelAndView mapview = new ModelAndView("admin/partner/form_edit_partner");
		
		
		String logoFileName = partnerObj.getPartnerShortName() + ".jpg";; 
        Path logoFilePath = Paths.get(absoluteImageDirectory, logoFileName);

        if (Files.exists(logoFilePath)) {
        	partnerObj.setLogFilePath("/absolute-images/" + logoFileName);
        	partnerObj.setLogoFileName(logoFileName);
        }
        else {
        	logoFileName = partnerObj.getPartnerShortName() + ".png"; 
        	logoFilePath = Paths.get(absoluteImageDirectory, logoFileName);
        	if (Files.exists(logoFilePath)) {
        		 //"/partner-images/" + logoFileName);
        		partnerObj.setLogFilePath("/absolute-images/" + logoFileName);
        		partnerObj.setLogoFileName(logoFileName);
        	}
        	else partnerObj.setLogFilePath(null);
        }
    	return mapview;
	}
	
	@PostMapping(value = "form_action_b2b_partner", params = "View")
	public ModelAndView form_view_view_b2b_partner(@ModelAttribute("PARTNER_OBJ") Tg_B2bPartner_Obj partnerObj,@RequestParam(defaultValue = "") String Success,BindingResult result) throws IOException {
		Tg_B2b_Partner_Entity partnerEntity = b2bPartnerService.findPartnerById(partnerObj.getPartnerId());
		partnerObj.updateVoFromEntity(partnerEntity);
		partnerObj.setCityName(commonService.findDestinationById(partnerObj.getCityId()).getCityName());
		ModelAndView mapview = new ModelAndView("admin/partner/form_view_partner");
		mapview.addObject("Success", Success);
		String logoFileName = partnerObj.getPartnerShortName() + ".jpg";; 
        Path logoFilePath = Paths.get(absoluteImageDirectory, logoFileName);
        if (Files.exists(logoFilePath)) {
        	partnerObj.setLogFilePath("/absolute-images/" + logoFileName);
        	partnerObj.setLogoFileName(logoFileName);
        }
        else {
        	logoFileName = partnerObj.getPartnerShortName() + ".png"; 
        	logoFilePath = Paths.get(absoluteImageDirectory, logoFileName);
        	if (Files.exists(logoFilePath)) {
        		 //"/partner-images/" + logoFileName);
        		partnerObj.setLogFilePath("/absolute-images/" + logoFileName);
        		partnerObj.setLogoFileName(logoFileName);
        	}
        	else partnerObj.setLogFilePath(null);
        }
    	return mapview;
	}

	
	@PostMapping(value = "form_action_b2b_partner", params = "Delete")
	public ModelAndView form_view_delete_b2b_partner(@ModelAttribute("PARTNER_OBJ") Tg_B2bPartner_Obj partnerObj,BindingResult result) throws IOException {
		Tg_B2b_Partner_Entity partnerEntity = b2bPartnerService.findPartnerById(partnerObj.getPartnerId());
		partnerObj.updateVoFromEntity(partnerEntity);
		ModelAndView mapview = new ModelAndView("admin/partner/form_delete_partner");
    	return mapview;
	}

	
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


}
