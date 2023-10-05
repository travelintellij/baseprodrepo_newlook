package com.udanchoo.intranet.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.udanchoo.intranet.entity.Udn_Destinations_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Consulate_Master_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Doc_Map_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Master_Entity;
import com.udanchoo.intranet.model.Mail;
import com.udanchoo.intranet.model.Udn_Destinations_Master_Obj;
import com.udanchoo.intranet.model.Udn_Visa_Consulate_Master_Obj;
import com.udanchoo.intranet.model.Udn_Visa_Doc_Map_Obj;
import com.udanchoo.intranet.model.Udn_Visa_Master_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.VisaDocEmailFormObj;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.DealServiceImpl;
import com.udanchoo.intranet.service.EmailServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.service.VisaServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.validator.CityNameValidator;
import com.udanchoo.intranet.validator.CountryCodeValidator;
import com.udanchoo.intranet.validator.EmailAudienceValidator;

import freemarker.template.TemplateException;




@Controller
public class VisaController {
	
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
	ClientServiceImpl clientService;
	
	@Autowired
	DealServiceImpl dealService;
	
	@Autowired
	VisaServiceImpl visaService;
	
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
    private EmailAudienceValidator emailValidator;
	
	@Autowired
    private CountryCodeValidator countryValidator;
	
	@Autowired
    private CityNameValidator cityValidator;
	
	@Autowired
	EmailServiceImpl emailService;
	
	@Value("${all.email.notify.communication.active}")
	private boolean emailNotifyActive;
	
	@Value("${email.client.valid}")
	private boolean emailClientActive;
	
     
	
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
    
    /*********** Following Section of code deals with Visa services ********************************/
  
    
    @RequestMapping("view_add_visa_form")
   	public ModelAndView view_add_visa_form(@ModelAttribute("visa_obj") @Valid Udn_Visa_Master_Obj hotelObj, BindingResult result ) {
    	
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/visa/Admin_Add_Visa");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	modelView.addObject("VISA_PROFILE", UdanChooConstants.VISA_PROFILE);
    	modelView.addObject("VISA_TYPE", UdanChooConstants.VISA_TYPE);
    	modelView.addObject("VISA_PURPOSE", UdanChooConstants.VISA_PURPOSE);
    	return modelView;
    }
    

    @PostMapping("add_add_visa_master")
   	public ModelAndView add_add_visa_master(@ModelAttribute("VISA_OBJ") @Valid Udn_Visa_Master_Obj visaObj, @ModelAttribute("VISA_DOC_OBJ") Udn_Visa_Doc_Map_Obj visaDocObj,BindingResult result ) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView();
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	/*String visaId = (visaObj.getCountryCode().trim()+"_"+visaObj.getProfile().trim()+"_"+visaObj.getVisaType().trim()).toLowerCase()+"_"+visaObj.getVisaPurpose().trim().toLowerCase();
    	visaObj.setVisaId(visaId.toLowerCase());
    	*/
    	modelView.addObject("VISA_PROFILE", UdanChooConstants.VISA_PROFILE);
    	modelView.addObject("VISA_TYPE", UdanChooConstants.VISA_TYPE);
    	modelView.addObject("VISA_PURPOSE", UdanChooConstants.VISA_PURPOSE);

    	if(visaService.visaRecodExists(visaObj.getCountryCode(),visaObj.getConsulateCity(), visaObj.getProfile(),visaObj.getVisaType(),visaObj.getVisaPurpose())) {
    		modelView.setViewName("admin/visa/Admin_Add_Visa");
    		modelView.addObject("Error", "Visa Master Record exists already!! Please consider edit. ");
    	}
    	else {
    		Udn_Visa_Master_Entity visaEntity = new Udn_Visa_Master_Entity(visaObj);
	 	   	visaService.saveOrUpdate_Visa(visaEntity);
	 	   	visaObj.setVisaId(visaEntity.getVisaId());
	 	   	visaObj.setCityName(commonService.findDestinationById(visaObj.getConsulateCity()).getCityName());
	 	   	modelView.addObject("Success", "Visa Master Record is updated Successfully..");
	    	modelView.setViewName("admin/visa/Admin_Update_Visa_Docs");
	    	List listVisaDoc = visaService.findVisaDocsByVisaId(visaEntity.getVisaId());
	    	modelView.addObject("VISA_DOC_ACTION", "VIEW");
	  	   	modelView.addObject("VISA_DOC_LIST", listVisaDoc);
    	}
    	
    	/*if(visaService.visaRecodExists(visaObj.getVisaId())) {
    		visaObj = new Udn_Visa_Master_Obj(visaService.findVisaEntityById(visaId) );
        	visaObj.setCountryName(commonService.findDestinationByCountryCode(visaObj.getCountryCode()).getCountryName());
    		modelView.addObject("Error", "Visa Master Record exists already!! Consider Edit. ");
    	}
    	else {
    	   Udn_Visa_Master_Entity visaEntity = new Udn_Visa_Master_Entity(visaObj);
    	   visaService.saveOrUpdate_Visa(visaEntity);
    	   modelView.addObject("Success", "Visa Master Record is updated Successfully..");
    	}*/
  	   	modelView.addObject("VISA_OBJ", visaObj);
  	   	return modelView;
    }
   
    
    
    
    //@PostMapping("view_list_visa_proceed_docs_form")
    @RequestMapping(value = "view_list_visa_proceed_docs_form", method = { RequestMethod.GET, RequestMethod.POST })
   	public ModelAndView view_list_visa_proceed_docs_form(@ModelAttribute("VISA_OBJ") @Valid Udn_Visa_Master_Obj visaObj, BindingResult result ) {
    	
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
	    	modelView.setViewName("admin/visa/Admin_Update_Visa_Docs");
	    	List listVisaDoc = visaService.findVisaDocsByVisaId(visaId);
	    	modelView.addObject("VISA_DOC_ACTION", "VIEW");
	  	   	modelView.addObject("VISA_DOC_LIST", listVisaDoc);
	  	   	modelView.addObject("VISA_OBJ", visaObj);
    	}
    	else {
    		modelView.addObject("Error", "Invalid Visa Master Record !!");
    	}
    		
  	   	return modelView;
    }
    
    
    
    @PostMapping("view_add_visa_proceed_docs_form")
   	public ModelAndView view_add_visa_proceed_docs_form(@ModelAttribute("VISA_OBJ") @Valid Udn_Visa_Master_Obj visaObj,BindingResult result ) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView();
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	//String visaId = (visaObj.getCountryCode().trim()+"_"+visaObj.getProfile().trim()+"_"+visaObj.getVisaType().trim()).toLowerCase();
    	//visaObj.setVisaId(visaId.toLowerCase());
    	Udn_Visa_Master_Entity visaEntity = visaService.findVisaEntityById(visaObj.getVisaId());
    	visaObj = new Udn_Visa_Master_Obj(visaEntity);
    	visaObj.setCountryName(commonService.findDestinationByCountryCode(visaObj.getCountryCode()).getCountryName());
    	visaObj.setCityName(commonService.findDestinationById(visaObj.getConsulateCity()).getCityName());
    	modelView.setViewName("admin/visa/Admin_Update_Visa_Docs");
    	List listVisaDoc = visaService.findVisaDocsByVisaId(visaObj.getVisaId());
    	modelView.addObject("VISA_DOC_ACTION", "ADD");
  	   	modelView.addObject("VISA_DOC_LIST", listVisaDoc);
  	   	modelView.addObject("VISA_OBJ", visaObj);
  	   	return modelView;
    }

    //@ModelAttribute("visa_obj") @Valid Udn_Visa_Master_Obj visaObj,@ModelAttribute("VISA_DOC_OBJ") Udn_Visa_Doc_Map_Obj visaDocObj
    @PostMapping(value="add_add_visa_doc")
    public ModelAndView add_add_visa_doc(@RequestParam("visaId") int visaId,@ModelAttribute("VISA_DOC_OBJ") Udn_Visa_Doc_Map_Obj visaDocObj,BindingResult result , ModelMap modelMap,final RedirectAttributes redirectAttrib ) {
    	/*ModelAndView modelView = new ModelAndView("admin/visa/Admin_Update_Visa_Docs");
    	Udn_Visa_Master_Entity visaEntity = visaService.findVisaEntityById(visaId);
    	Udn_Visa_Master_Obj visaObj = new Udn_Visa_Master_Obj (visaEntity);
    	visaObj.setCountryName(commonService.findDestinationByCountryCode(visaObj.getCountryCode()).getCountryName());
    	Udn_Visa_Doc_Map_Entity visaDocEntity = new Udn_Visa_Doc_Map_Entity(visaDocObj);
    	visaEntity.getVisaDocumentEntityList().add(visaDocEntity);
    	visaService.saveOrUpdate_Visa(visaEntity);
    	modelView.addObject("VISA_DOC_ACTION", "VIEW");
    	List listVisaDoc = visaService.findVisaDocsByVisaId(visaId);
    	modelView.addObject("VISA_OBJ", visaObj);
    	modelView.addObject("VISA_DOC_LIST", listVisaDoc);
    	*/
    	ModelAndView modelView = new ModelAndView();
    	Udn_Visa_Master_Entity visaEntity = visaService.findVisaEntityById(visaId);
    	Udn_Visa_Master_Obj visaObj = new Udn_Visa_Master_Obj (visaEntity);
    	visaObj.setCountryName(commonService.findDestinationByCountryCode(visaObj.getCountryCode()).getCountryName());
    	visaObj.setCityName(commonService.findDestinationById(visaObj.getConsulateCity()).getCityName());
    	Udn_Visa_Doc_Map_Entity visaDocEntity = new Udn_Visa_Doc_Map_Entity(visaDocObj);
    	visaEntity.getVisaDocumentEntityList().add(visaDocEntity);
    	visaService.saveOrUpdate_Visa(visaEntity);
    	
    	redirectAttrib.addAttribute("VISA_DOC_ACTION", "VIEW");
    	List listVisaDoc = visaService.findVisaDocsByVisaId(visaId);
    	redirectAttrib.addFlashAttribute("VISA_OBJ", visaObj);
    	redirectAttrib.addFlashAttribute("VISA_DOC_LIST", listVisaDoc);
    	redirectAttrib.addFlashAttribute("Success", "Visa Master Record is updated Successfully..");
    	modelView.setViewName("redirect:update_visa_docs_confirmation");
    	return modelView;
    }
    
    
    @RequestMapping(value="update_visa_docs_confirmation")
    public ModelAndView update_visa_docs_confirmation() {
    	//@RequestParam("confirmation") String confirmation,@RequestParam("ConfirmationFor") String confirmationFor
    	ModelAndView mapview = new ModelAndView() ;
    	mapview.setViewName("admin/visa/Admin_Update_Visa_Docs");
    	return mapview;
    }

    
    
    
    @PostMapping(value="view_update_visa_doc_form")
    public ModelAndView view_update_visa_doc_form(@RequestParam("visaId") int visaId,@ModelAttribute("VISA_DOC_OBJ") Udn_Visa_Doc_Map_Obj visaDocObj,BindingResult result ) {
    	Udn_Visa_Master_Entity visaEntity = visaService.findVisaEntityById(visaId);
    	Udn_Visa_Master_Obj visaObj = new Udn_Visa_Master_Obj(visaEntity);
    	Udn_Visa_Doc_Map_Entity visaDocEntity = visaService.findVisaDocEntityById(visaDocObj.getVisaDocId());
    	visaDocObj = new Udn_Visa_Doc_Map_Obj(visaDocEntity);
    	ModelAndView modelView = view_list_visa_proceed_docs_form(visaObj,null);
    	modelView.addObject("VISA_DOC_ACTION", "UPDATE");
    	modelView.addObject("ORG_VISA_DOC_OBJ", visaDocObj);
    	
    	return modelView;
    	
    }
    
    @PostMapping(value="edit_edit_visa_doc")
    public ModelAndView edit_edit_visa_doc(@RequestParam("visaId") int visaId,@ModelAttribute("VISA_DOC_OBJ") Udn_Visa_Doc_Map_Obj visaDocObj,BindingResult result , ModelMap modelMap ) {
    	ModelAndView modelView = new ModelAndView("admin/visa/Admin_Update_Visa_Docs");
    	Udn_Visa_Doc_Map_Entity visaDocEntity = new Udn_Visa_Doc_Map_Entity(visaDocObj);
    	visaService.saveOrUpdate_VisaDoc(visaDocEntity);
    	modelView.addObject("VISA_DOC_ACTION", "VIEW");
    	Udn_Visa_Master_Entity visaEntity = visaService.findVisaEntityById(visaId);
    	Udn_Visa_Master_Obj visaObj = new Udn_Visa_Master_Obj(visaEntity);
    	visaObj.setCountryName(commonService.findDestinationByCountryCode(visaObj.getCountryCode()).getCountryName());
    	visaObj.setCityName(commonService.findDestinationById(visaObj.getConsulateCity()).getCityName());
    	List listVisaDoc = visaService.findVisaDocsByVisaId(visaId);
    	modelView.addObject("VISA_OBJ", visaObj);
    	modelView.addObject("VISA_DOC_LIST", listVisaDoc);
    	return modelView;
    }
    
    @PostMapping(value="view_delete_visa_doc_form")
    public ModelAndView view_delete_visa_doc_form(@RequestParam("visaId") int visaId,@ModelAttribute("VISA_DOC_OBJ") Udn_Visa_Doc_Map_Obj visaDocObj,BindingResult result , ModelMap modelMap ) {
    	ModelAndView modelView = view_update_visa_doc_form(visaId,visaDocObj,null);
    	modelView.setViewName("admin/visa/Admin_Del_Con_Visa_Docs");
    	return modelView;
    }
    
    @PostMapping(value="del_del_visa_docs")
    public ModelAndView del_del_visa_docs(@RequestParam("visaId") int visaId,@ModelAttribute("VISA_DOC_OBJ") Udn_Visa_Doc_Map_Obj visaDocObj,final RedirectAttributes redirectAttrib) {
    	visaService.deleteVisaDocument(visaDocObj.getVisaDocId());
    	Udn_Visa_Master_Obj visaObj = new Udn_Visa_Master_Obj();
    	visaObj.setVisaId(visaId);
    	
    	/*ModelAndView modelView = view_list_visa_proceed_docs_form(visaObj,null);
    	modelView.addObject("Success", "Visa Document Record is deleted Successfully..");
    	*/
    	ModelAndView modelView = new ModelAndView();
    	redirectAttrib.addFlashAttribute("VISA_OBJ",visaObj);
    	redirectAttrib.addFlashAttribute("VISA_DOC_ACTION", "VIEW");
    	redirectAttrib.addFlashAttribute("Success", "Visa Master Record is deleted Successfully..");
    	modelView.setViewName("redirect:view_list_visa_proceed_docs_form");
    	
    	return modelView;
    }

    
    @PostMapping(value="view_update_visa_master_form")
    public ModelAndView view_update_visa_master_form(@RequestParam("visaId") String visaId,@ModelAttribute("VISA_OBJ") Udn_Visa_Master_Obj visaObj,BindingResult result ) {
    	ModelAndView  modelView = view_list_visa_proceed_docs_form(visaObj,result);	
    	//modelView.setViewName("admin/visa/Admin_Update_Visa_Docs");
    	modelView.addObject("VISA_MASTER_ACTION", "UPDATE");
    	//modelView.addObject("VISA_DOC_ACTION", "VIEW");
    	//visaObj = new Udn_Visa_Master_Obj(visaService.findVisaEntityById(visaId) );
        //visaObj.setCountryName(commonService.findDestinationByCountryCode(visaObj.getCountryCode()).getCountryName());
        //modelView.addObject("VISA_OBJ", visaObj);
    	return modelView;
    	
    }
  
    
    @PostMapping(value="edit_edit_visa_master")
    public ModelAndView edit_edit_visa_doc(@ModelAttribute("VISA_OBJ") Udn_Visa_Master_Obj visaObj,BindingResult result,final RedirectAttributes redirectAttrib) {
    	Udn_Visa_Master_Entity visaEntity = visaService.findVisaEntityById(visaObj.getVisaId());
    	visaEntity.setStandardCost(visaObj.getStandardCost());
    	visaEntity.setStandardB2cPrice(visaObj.getStandardB2cPrice());
    	visaEntity.setStandardB2bPrice(visaObj.getStandardB2bPrice());
    	visaEntity.setProcessingTime(visaObj.getProcessingTime());
    	
    	visaEntity.setOtherCosts(visaObj.getOtherCosts());
    	visaEntity.setInternalRemarks(visaObj.getInternalRemarks());
    	
    	visaEntity.setRemarks(visaObj.getRemarks());
    	//Udn_Visa_Master_Entity visaEntity = new Udn_Visa_Master_Entity(visaObj);
    	visaService.saveOrUpdate_Visa(visaEntity);
    	
    	/*
    	ModelAndView  modelView = view_list_visa_proceed_docs_form(visaObj,null);
    	modelView.addObject("Success", "Visa Master Record is updated Successfully..");
    	modelView.addObject("VISA_DOC_ACTION", "VIEW");
    	*/
    	
    	ModelAndView  modelView = new ModelAndView();
    	modelView.setViewName("redirect:view_list_visa_proceed_docs_form");
    	redirectAttrib.addFlashAttribute("VISA_OBJ",visaObj);
    	redirectAttrib.addFlashAttribute("VISA_DOC_ACTION", "VIEW");
    	redirectAttrib.addFlashAttribute("Success", "Visa Master Record is updated Successfully..");
       	//public ModelAndView view_list_visa_proceed_docs_form(@ModelAttribute("VISA_OBJ") @Valid Udn_Visa_Master_Obj visaObj, BindingResult result ) {

    	
    	return modelView;
    }
   
    
    @RequestMapping("view_search_visa_form")
   	public ModelAndView view_search_visa_form(@ModelAttribute("visa_obj") @Valid Udn_Visa_Master_Obj hotelObj, BindingResult result ) {
    	
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/visa/Admin_Search_Visa");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	modelView.addObject("VISA_PROFILE", UdanChooConstants.VISA_PROFILE);
    	modelView.addObject("VISA_TYPE", UdanChooConstants.VISA_TYPE);
    	modelView.addObject("VISA_PURPOSE", UdanChooConstants.VISA_PURPOSE);
    	
    	return modelView;
    }
   
    
    //@PostMapping(value="search_search_visa_master")
    @RequestMapping(value = "search_search_visa_master", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView search_search_visa_master(@RequestParam("countryCode") String countryCode) {
    	ModelAndView modelView = new ModelAndView("admin/visa/Admin_Search_Visa");
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
   
    /********************************************************************************************************/
 
	@PostMapping("view_email_visa_master_docs_form")
   	public ModelAndView view_email_visa_master_docs_form(@ModelAttribute("EMAIL_VISA_MASTER") @Valid VisaDocEmailFormObj visaEmailObj,BindingResult result,final RedirectAttributes redirectAttrib  ) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/visa/form_visa_docs_emailer");
    	
    	ArrayList<Udn_Visa_Master_Entity> visaDocEntityCheckList = new ArrayList<Udn_Visa_Master_Entity>();
    	if(visaEmailObj.getVisaIdListToEmail()!=null && visaEmailObj.getVisaIdListToEmail().size()>0) {
	    	Iterator itrVisaListRequested = visaEmailObj.getVisaIdListToEmail().iterator();
	    	while(itrVisaListRequested.hasNext()) {
	    		Integer visaId = (Integer) itrVisaListRequested.next();
	    		Udn_Visa_Master_Entity visaEntity = visaService.findVisaEntityById(visaId);
	    		visaDocEntityCheckList.add(visaEntity);
	    	}
	    	List visaDocObjCheckList = generateVoVisaMaster(visaDocEntityCheckList);
	    	//modelView.addObject("VISA_PROFILE_EMAIL_OBJ", visaDocObjCheckList);
	    	visaEmailObj.setVisaObjectListForEmail(visaDocObjCheckList);
 	    	modelView.addObject("VISA_PROFILE", UdanChooConstants.VISA_PROFILE);
	    	modelView.addObject("VISA_TYPE", UdanChooConstants.VISA_TYPE);
	    	modelView.addObject("VISA_PURPOSE", UdanChooConstants.VISA_PURPOSE);

    	}
    	else {
    		modelView.setViewName("redirect:search_search_visa_master?countryCode="+visaEmailObj.getCountryCode() );
    		redirectAttrib.addFlashAttribute("Error", "Please select atleast one visa document checklist to email. ");
    		return modelView;
    	}

	    return modelView;
    }
	
	@PostMapping("send_send_email_visa_master_checklist")
   	public ModelAndView send_send_email_visa_master_checklist(@ModelAttribute("EMAIL_VISA_MASTER") @Valid VisaDocEmailFormObj visaEmailObj,BindingResult result,final RedirectAttributes redirectAttrib ) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView();
    	emailValidator.validate(visaEmailObj, result);
    	if(result.hasErrors()) {
    		modelView = view_email_visa_master_docs_form(visaEmailObj,result,null);
    		//modelView.setViewName("admin/visa/form_visa_docs_emailer");
    		//modelView.addObject("EMAIL_VISA_MASTER", visaEmailObj);
    		//modelView.setViewName("redirect:view_email_visa_master_docs_form");
    		return modelView; 
    	}
    	else {
	    	
    		if(emailClientActive) {
	    		List arrayVisaEntity = new ArrayList();
    			Iterator itrVisaListRequested = visaEmailObj.getVisaObjectListForEmail().iterator();
	    		while(itrVisaListRequested.hasNext()) {
		    		Udn_Visa_Master_Obj visaObj = (Udn_Visa_Master_Obj) itrVisaListRequested.next();
		    		Udn_Visa_Master_Entity visaEntity = visaService.findVisaEntityById(visaObj.getVisaId());
		    		//visaEntity.setStandardB2bPrice(visaObj.getStandardB2bPrice());
		    		//visaEntity.setStandardB2cPrice(visaObj.getStandardB2cPrice());
		    		//arrayVisaEntity.add(visaEntity);
		    		visaObj.setVisaDocumentEntityList(visaEntity.getVisaDocumentEntityList());
		    		
		    		visaObj.setProfileString(UdanChooConstants.VISA_PROFILE.get(visaEntity.getProfile()));
		    		visaObj.setVisaTypeString(UdanChooConstants.VISA_TYPE.get(visaEntity.getVisaType()));
		    		visaObj.setVisaPurposeString(UdanChooConstants.VISA_PURPOSE.get(visaEntity.getVisaPurpose()));
		    		
		    		arrayVisaEntity.add(visaObj);
		    	}
		    	//modelView.setViewName("forward:view_email_visa_master_docs_form");
    			Mail mail = new Mail();
    			mail.setSubject(visaEmailObj.getEmailSubject());
    			
    			InternetAddress[] emailToList = new InternetAddress[visaEmailObj.getEmailToValidatedList().size()];
    			InternetAddress[] emailCcList = new InternetAddress[visaEmailObj.getEmailCcValidatedList().size()];
            	for (int i = 0; i < visaEmailObj.getEmailToValidatedList().size(); i++) {
            		try {
						emailToList[i] = new InternetAddress((String) visaEmailObj.getEmailToValidatedList().get(i));
					} catch (AddressException e) {
						redirectAttrib.addFlashAttribute("Error","Error: While sending email. Recipients setting error.<br> Please send individually or contact adminstrator.");
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
            	}
            	for (int i = 0; i < visaEmailObj.getEmailCcValidatedList().size(); i++) {
            		try {
						emailCcList[i] = new InternetAddress((String) visaEmailObj.getEmailCcValidatedList().get(i));
					} catch (AddressException e) {
						redirectAttrib.addFlashAttribute("Error","Error: While sending email. Recipients setting error.<br> Please send individually or contact adminstrator.");
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
            	}
    			mail.setToList(emailToList);
    			mail.setCcList(emailCcList);
		        Map<String, Object> model = new HashMap<String, Object>();
		        model.put("VISA_DOCT_LIST", arrayVisaEntity);
		        model.put("COUNTRY_NAME", visaEmailObj.getCountryName());
		        model.put("VISA_INFO_MAILER",visaEmailObj);
		        
		        model.put("VISA_PROFILE", UdanChooConstants.VISA_PROFILE);
		        model.put("VISA_TYPE", UdanChooConstants.VISA_TYPE);
		        model.put("VISA_PURPOSE", UdanChooConstants.VISA_PURPOSE);

		        
		        mail.setModel(model);
				try {
					emailService.sendEmailMessageUsingTemplate_MultipleRecipients(mail,"Visa-Docs-Checklist.ftl");
					redirectAttrib.addFlashAttribute("Success","Email Document Checklist added to the mailing queue successfully!! ");
				} catch (MessagingException | IOException | TemplateException e) {
					redirectAttrib.addFlashAttribute("Error","Error: While sending email. Please try later or contact Adminstrator !! .");
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				modelView.setViewName("redirect:search_search_visa_master?countryCode="+visaEmailObj.getCountryCode() );
    		}
    		
	    	return modelView;
    	}
    }

	@RequestMapping("view_add_visa_consulate_form")
   	public ModelAndView view_add_visa_consulate_form(@ModelAttribute("VISA_CONSULATE_OBJ") @Valid Udn_Visa_Consulate_Master_Obj visaConsulateObj, BindingResult result ) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/visa/Admin_Add_Visa_Consulate");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	return modelView;
    }

	@RequestMapping(value="/view_view_visa_consulate")
    public ModelAndView view_view_visa_consulate(@RequestParam("consulateId") int consulateId) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView();
    	Optional<Udn_Visa_Consulate_Master_Entity> visaConsulateEntityOpt = visaService.findVisaConsulateById(consulateId);
    	if(visaConsulateEntityOpt.isPresent()) {
    		Udn_Visa_Consulate_Master_Entity visaConsulateEntity = visaConsulateEntityOpt.get();
    		Udn_Visa_Consulate_Master_Obj visaConsulateObj = new Udn_Visa_Consulate_Master_Obj(visaConsulateEntity);
    		visaConsulateObj.setCountryName(commonService.findDestinationByCountryCode(visaConsulateEntity.getVisaCountryCode()).getCountryName());
    		visaConsulateObj.setCityName(commonService.findDestinationById(visaConsulateEntity.getConsulateCity()).getCityName());
    		modelView.addObject("VISA_CONSULATE_OBJ", visaConsulateObj);
    	}
    	else {
    		modelView.addObject("ERROR", "Error: Invalid Ticket Id Provided. " );
    	}
	
    	modelView.setViewName("admin/visa/Admin_View_Visa_Consulate");
    	return modelView;
    }

    @PostMapping("edit_edit_visa_consulate_master")
   	public ModelAndView edit_edit_visa_consulate_master(@ModelAttribute("VISA_CONSULATE_OBJ") @Valid Udn_Visa_Consulate_Master_Obj visaConsulateObj, BindingResult result,final RedirectAttributes redirectAttrib ) {
    	ModelAndView modelView = new ModelAndView();
    	//modelView.setViewName("admin/visa/Admin_Edit_Visa_Consulate");
		Udn_Visa_Consulate_Master_Entity visaConsulateEntity = new Udn_Visa_Consulate_Master_Entity(visaConsulateObj);
		visaConsulateEntity = visaService.saveVisaConsulate(visaConsulateEntity);
		redirectAttrib.addFlashAttribute("Success", "Visa Consulate is updated successfully !!. ");
		modelView.setViewName("redirect:view_view_visa_consulate?consulateId="+visaConsulateEntity.getConsulateId());

    	return modelView;
    }
	
    @PostMapping("add_add_visa_consulate_master")
   	public ModelAndView add_add_visa_consulate_master(@ModelAttribute("VISA_CONSULATE_OBJ") @Valid Udn_Visa_Consulate_Master_Obj visaConsulateObj, BindingResult result,final RedirectAttributes redirectAttrib ) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView();
    	
    	Udn_Destinations_Master_Obj destinationObj = new Udn_Destinations_Master_Obj();
    	destinationObj.setCountryCode(visaConsulateObj.getVisaCountryCode());
    	destinationObj.setCountryName(visaConsulateObj.getCountryName());
    	destinationObj.setDestinationId(visaConsulateObj.getConsulateCity());
    	destinationObj.setCityName(visaConsulateObj.getCityName());
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	
    	countryValidator.validate(destinationObj, result);
    	cityValidator.validate(destinationObj, result);
    	
    	if(result.hasErrors()) {
    		modelView = view_add_visa_consulate_form(visaConsulateObj,result);
    	}
    	else {
    		if(visaService.checkVisaConsulateExists(visaConsulateObj.getVisaCountryCode(),visaConsulateObj.getConsulateCity())) {
    			modelView = view_add_visa_consulate_form(visaConsulateObj,result);
    			modelView.addObject("Error", "Visa Consulate Already Exists !!. ");
    		}
    		else {
	    		Udn_Visa_Consulate_Master_Entity visaConsulateEntity = new Udn_Visa_Consulate_Master_Entity(visaConsulateObj);
	    		visaConsulateEntity = visaService.saveVisaConsulate(visaConsulateEntity);
	    		redirectAttrib.addFlashAttribute("Success", "Visa Consulate is updated successfully !!. ");
	    		modelView.setViewName("redirect:view_view_visa_consulate?consulateId="+visaConsulateEntity.getConsulateId());
    		}
    	}
  	   	return modelView;
    }

	
	@RequestMapping(value = "view_edit_visa_consulate_form", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView view_edit_visa_consulate_form(@ModelAttribute("VISA_CONSULATE_OBJ") @Valid Udn_Visa_Consulate_Master_Obj visaConsulateObj, BindingResult result ) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/visa/Admin_Edit_Visa_Consulate");

    	Optional<Udn_Visa_Consulate_Master_Entity> visaConsulateEntityOpt = visaService.findVisaConsulateById(visaConsulateObj.getConsulateId()); 
    	if(visaConsulateEntityOpt.isPresent()) {
    		Udn_Visa_Consulate_Master_Entity visaConsulateEntity = visaConsulateEntityOpt.get();
    		visaConsulateObj.updateFromEntity(visaConsulateEntity);
    		visaConsulateObj.setCountryName(commonService.findDestinationByCountryCode(visaConsulateEntity.getVisaCountryCode()).getCountryName());
    		visaConsulateObj.setCityName(commonService.findDestinationById(visaConsulateEntity.getConsulateCity()).getCityName());
    	}else {
    		modelView.addObject("Error", "Error in updating Consulate in Edit Mode. Please try later. " );
    		modelView.setViewName("forward:view_view_visa_consulate");
    	}
    	
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	return modelView;
    }

    @RequestMapping(value = "search_search_visa_consulate", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView search_search_visa_consulate(@ModelAttribute("VISA_CONSULATE_SEARCH") @Valid Udn_Destinations_Master_Obj destinationObj,BindingResult result ) {
    	ModelAndView modelView = new ModelAndView("admin/visa/Admin_Search_Visa_Consulate");
    	UserDetailsObj userObj = getLoggedInUser();
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());

    	countryValidator.validate(destinationObj, result);
    	if(!result.hasErrors()) {
    		List<Udn_Visa_Consulate_Master_Entity> consulateList = visaService.findConsulateByVisaCountryCode(destinationObj.getCountryCode());
    		List<Udn_Visa_Consulate_Master_Obj> visaConsulateObjList = generateVoVisaConsulate(consulateList);
        	modelView.addObject("VISA_CONSULATE_RESULT_SET", visaConsulateObjList);
        	modelView.addObject("VISA_CONSULATE_COUNT_MSG", "<B>" + visaConsulateObjList.size() + " Consulate Record Found. </B>");
        	modelView.addObject("COUNTRY_NAME", destinationObj.getCountryName());
    	}
    	return modelView;
    }
    

	private List<Udn_Visa_Consulate_Master_Obj> generateVoVisaConsulate(List<Udn_Visa_Consulate_Master_Entity> consulateEntityList) {
		List<Udn_Visa_Consulate_Master_Obj> consulateObjList = new ArrayList<Udn_Visa_Consulate_Master_Obj>();
		consulateObjList = consulateEntityList.stream().map(temp -> {
			Udn_Visa_Consulate_Master_Obj obj = new Udn_Visa_Consulate_Master_Obj();
	            obj.updateFromEntity(temp);
	            obj.setCityName(commonService.findDestinationById(temp.getConsulateCity()).getCityName());    
	            return obj;
	        }).collect(Collectors.toList());		
		return consulateObjList;
	}

	@RequestMapping("view_search_visa_consulate_form")
   	public ModelAndView view_search_visa_consulate_form() {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/visa/Admin_Search_Visa_Consulate");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	
    	return modelView;
    }
   
	@RequestMapping(value = "/getCountryConsulateList", method = RequestMethod.GET)
	public @ResponseBody
	List<Udn_Destinations_Master_Obj> getCountryConsulateList(@RequestParam String countryName) {
		List<Udn_Destinations_Master_Obj> result = new ArrayList<Udn_Destinations_Master_Obj>();
		List <Udn_Destinations_Entity> entityList = commonService.listCountry(countryName);
		// iterate a list and filter by tagName
		for (Udn_Destinations_Entity entity : entityList) {
			if (entity.getCountryName().toLowerCase().contains(countryName.toLowerCase())) {
				Udn_Destinations_Master_Obj destinationObj = new Udn_Destinations_Master_Obj(entity);
				if(!result.contains(destinationObj)) {
					List<Udn_Visa_Consulate_Master_Entity> consulateEntityList = visaService.findConsulateByVisaCountryCode(destinationObj.getCountryCode());
					List<Udn_Destinations_Entity> consolateCityList = visaService.findDestination_List_By_ConsulateList(consulateEntityList);
					Map<Integer, String> cityMap = consolateCityList.stream().collect(
			                Collectors.toMap(Udn_Destinations_Entity::getDestinationId, Udn_Destinations_Entity::getCityName));
					destinationObj.setCityKeyValue(cityMap);
					result.add(destinationObj);
				}
			}
		}
		
		return result;
	}

	

}
