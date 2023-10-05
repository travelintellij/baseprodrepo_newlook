package com.udanchoo.intranet.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.validation.Valid;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
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
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.udanchoo.intranet.entity.UdnClientEntity;
import com.udanchoo.intranet.entity.UdnTeam;
import com.udanchoo.intranet.entity.Udn_Deal_LDP_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Destinations_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.entity.supplier.Tg_Supplier_Contact_Entity;
import com.udanchoo.intranet.entity.supplier.Tg_Supplier_Master_Entity;
import com.udanchoo.intranet.model.ClientObj;
import com.udanchoo.intranet.model.Mail;
import com.udanchoo.intranet.model.SearchClientObj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.VisaServiceStatusEmailFormObj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.model.quotation.QuoteReqestSupplierEmailFormObj;
import com.udanchoo.intranet.model.supplier.SearchSupplierObj;
import com.udanchoo.intranet.model.supplier.TgSupplierContactVO;
import com.udanchoo.intranet.model.supplier.TgSupplierMasterVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.EmailServiceImpl;
import com.udanchoo.intranet.service.LeadServiceImpl;
import com.udanchoo.intranet.service.SupplierServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.validator.EmailAudienceValidator;
import com.udanchoo.intranet.validator.SupplierValidator;

import freemarker.template.TemplateException;


@Controller
public class SupplierController {

	@Autowired
	private SupplierServiceImpl supplierService;
	    
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
	ClientServiceImpl clientService;
 
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
    private SupplierValidator supplierValidator;
	
	@Autowired
	private LeadServiceImpl leadService;

	@Autowired
    private EmailAudienceValidator emailValidator;
	
	@Autowired
	EmailServiceImpl emailService;


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
    
    @RequestMapping("view_form_admin_new_supplier")
   	public ModelAndView view_form_admin_new_supplier(@ModelAttribute("SUPPLIER_OBJ") @Valid TgSupplierMasterVO supplierObj) {
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	String username;
    	if (principal instanceof UserDetails) {
    	   username = ((UserDetails)principal).getUsername();
    	} else {
    	   username = principal.toString();
    	}
     	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
    	ModelAndView mapview = new ModelAndView("admin/supplier/AddNewSupplier");
    	mapview.addObject("userName", username);
    	mapview.addObject("Id", userObj.getUserId());
    	mapview.addObject("SUPPLIER_RATING_MAP", UdanChooConstants.SUPPLIER_RATING_MAP);
    	mapview.addObject("SUPPLIER_NEGOTIATES", UdanChooConstants.SUPPLIER_NEGOTIATES);
    	//mapview.addObject("SUPPLIER_OBJ", supplierObj);
    	//mapview.addObject("userRole", userObj.getRoles());
    	
    	return mapview;
    }
 
    
    @PostMapping(value="edit_edit_admin_supplier")
    public ModelAndView edit_edit_admin_supplier(@ModelAttribute("SUPPLIER_OBJ") @Valid TgSupplierMasterVO supplierObj, BindingResult result,final RedirectAttributes redirectAttrib) {
    	return create_create_admin_supplier(true,supplierObj, result,redirectAttrib); 
    }
    
    
    @PostMapping(value="create_create_admin_supplier")
    public ModelAndView create_create_admin_supplier(@RequestParam(defaultValue = "false") boolean isEditMode,@ModelAttribute("SUPPLIER_OBJ") @Valid TgSupplierMasterVO supplierObj, BindingResult result,final RedirectAttributes redirectAttrib) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView();
    	if(!isEditMode) {
    		modelView.setViewName("admin/supplier/AddNewSupplier");
    	}
    	else {
    		modelView.setViewName("admin/supplier/EditSupplier");
    	}
    	supplierValidator.validate(supplierObj, result);
    	if(result.hasErrors()) {
    		modelView.addObject("SUPPLIER_RATING_MAP", UdanChooConstants.SUPPLIER_RATING_MAP);
    		modelView.addObject("SUPPLIER_NEGOTIATES", UdanChooConstants.SUPPLIER_NEGOTIATES);
    		List<Object> jsonList = new ArrayList();
    		Iterator itr = supplierObj.getOperatingDestinations().iterator();
    		while(itr.hasNext()) {
    			int jsonString = Integer.parseInt((String) itr.next()); 
    			JSONObject opDestin = new JSONObject();
    			JSONArray array = new JSONArray();
    			opDestin.put("id", jsonString);
    			opDestin.put("tagName", commonService.findDestinationById(jsonString).getCityName());	
    			jsonList.add(opDestin);
    		}
    		JSONArray myArray = new JSONArray(jsonList);
    		String arrayToJson = myArray.toString(2);
    		supplierObj.setDestinationNames(arrayToJson);
    		return modelView; 
    	}
    	else {
    		supplierObj.setLastUpdatedBy(getLoggedInUser().getUserId());
    		System.out.println("Supplier Obj is " + supplierObj);
    		Tg_Supplier_Master_Entity supplierEntity = new Tg_Supplier_Master_Entity(supplierObj);
    		supplierObj.getOperatingDestinations().forEach((e) -> { 
    			Udn_Destinations_Entity destinationEntity = commonService.findDestinationById(Integer.parseInt(e));
    			supplierEntity.getDestinations().add(destinationEntity);
    		});
    		supplierService.saveSupplier(supplierEntity);
    		supplierObj.setSupplierId(supplierEntity.getSupplierId());
    		redirectAttrib.addFlashAttribute("Success", "Supplier Record is updated Successfully..");
			modelView.setViewName("redirect:view_supplier_details?supplierId="+supplierEntity.getSupplierId());
	
    	}
		return modelView;
    }
    //The only difference between two controllers below is that one redirects it to modal based screen display without menu and other redirects it to the supplier details with main menu.
    @RequestMapping("view_supplier_details")
	public String view_supplier_details(@RequestParam long supplierId, Model model){
		Tg_Supplier_Master_Entity tgSupplierEntity =supplierService.findSupplierById(supplierId).get();
		//System.out.println("Supporting Destinations are " + tgSupplierEntity.getDestinations().size());
		TgSupplierMasterVO supplierRecorderVO =supplierService.getSupplierVoFromEntity(tgSupplierEntity);
		model.addAttribute("SUPPLIER_OBJ",supplierRecorderVO );
		model.addAttribute("destinationNames",supplierRecorderVO.getDestinations() );
	    //return "leads/viewLeadDetails";
		return "admin/supplier/viewSupplierDetails";
	}
     
    @RequestMapping("view_supplier_details_modal")
   	public String view_supplier_details_modal(@RequestParam long supplierId, Model model){
   		Tg_Supplier_Master_Entity tgSupplierEntity =supplierService.findSupplierById(supplierId).get();
   		System.out.println("Supporting Destinations are " + tgSupplierEntity.getDestinations().size());
   		TgSupplierMasterVO supplierRecorderVO =supplierService.getSupplierVoFromEntity(tgSupplierEntity);
   		model.addAttribute("SUPPLIER_OBJ",supplierRecorderVO );
   		model.addAttribute("destinationNames",supplierRecorderVO.getDestinations() );
   	    //return "leads/viewLeadDetails";
   		return "admin/supplier/viewSupplierDetails_Modal";
   	}
    
    @RequestMapping(value="form_view_editsupplier",method= {RequestMethod.GET,RequestMethod.POST})
   	public ModelAndView form_view_editsupplier(@ModelAttribute("SUPPLIER_OBJ") @Valid TgSupplierMasterVO supplierObj,BindingResult result) {
    	ModelAndView mapview = new ModelAndView("admin/supplier/EditSupplier");
    	mapview.addObject("SUPPLIER_RATING_MAP", UdanChooConstants.SUPPLIER_RATING_MAP);
    	mapview.addObject("SUPPLIER_NEGOTIATES", UdanChooConstants.SUPPLIER_NEGOTIATES);
    	Tg_Supplier_Master_Entity supplierMasterEntity = supplierService.findSupplierById(supplierObj.getSupplierId()).get();
    	supplierObj = supplierService.updateVoFromEntity(supplierMasterEntity, supplierObj);
    	System.out.println("Operating Destinations " + supplierObj.getOperatingDestinations());
    	List<Object> jsonList = new ArrayList();
		Iterator itr = supplierObj.getOperatingDestinations().iterator();
		while(itr.hasNext()) {
			int jsonString = Integer.parseInt((String) itr.next()); 
			JSONObject opDestin = new JSONObject();
			JSONArray array = new JSONArray();
			opDestin.put("id", jsonString);
			opDestin.put("tagName", commonService.findDestinationById(jsonString).getCityName());	
			jsonList.add(opDestin);
		}
		JSONArray myArray = new JSONArray(jsonList);
		String arrayToJson = myArray.toString(2);
		supplierObj.setDestinationNames(arrayToJson);
    	return mapview;
    }
    
    @RequestMapping("view_supplier_contacts_listing")
   	public ModelAndView view_supplier_contacts_listing(@RequestParam long supplierId,@RequestParam(defaultValue = "0")  long leadId,@ModelAttribute("EMAIL_QUOTE_OBJ") QuoteReqestSupplierEmailFormObj quoteReqEmail){
   		Tg_Supplier_Master_Entity tgSupplierEntity =supplierService.findSupplierById(supplierId).get();
   		//System.out.println("Contact from main entity " + tgSupplierEntity.getSupplierContactsList());
   		TgSupplierMasterVO supplierRecorderVO =supplierService.getSupplierVoFromEntity(tgSupplierEntity);
   		System.out.println("Contact List is " + supplierRecorderVO.getSupplierContactsList());
   		ModelAndView model = new ModelAndView("admin/supplier/viewSupplierContactsListing");
   		quoteReqEmail.setSupplierName(supplierRecorderVO.getSupplierName());
   		model.addObject("SUPPLIER_OBJ",supplierRecorderVO );
   		model.addObject("destinationNames",supplierRecorderVO.getDestinations() );
   		
   		model.addObject("LEAD_ID",leadId);
   	    return model;
   	}

    @RequestMapping(value="form_view_add_supplier_contact",method= {RequestMethod.GET,RequestMethod.POST})
   	public ModelAndView form_view_add_supplier_contact(@RequestParam long supplierId,@ModelAttribute("SUPPLIER_OBJ") @Valid TgSupplierMasterVO supplierObj,@ModelAttribute("SUPPLIER_CONTACT_OBJ") @Valid TgSupplierContactVO supplierContactObj,BindingResult result) {
    	System.out.println("I am called for adding contact. ");
    	ModelAndView modelView = new ModelAndView("admin/supplier/AddNewSupplierContact");
    	Tg_Supplier_Master_Entity supplierMasterEntity = supplierService.findSupplierById(supplierId).get();
    	supplierContactObj.setSupplierEntity(supplierMasterEntity);
    	supplierObj.setSupplierVoFromEntity(supplierMasterEntity);
    	//System.out.println("Supplier Contact is " + supplierContactObj);
    	return modelView;
    }

    @PostMapping(value="create_create_supplier_contact")
    public ModelAndView create_create_supplier_contact(@RequestParam long supplierId,@ModelAttribute("SUPPLIER_CONTACT_OBJ") @Valid TgSupplierContactVO supplierContactObj, BindingResult result,final RedirectAttributes redirectAttrib) {
    	UserDetailsObj user = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView();
    	Tg_Supplier_Master_Entity supplierMasterEntity = supplierService.findSupplierById(supplierId).get();
    	Tg_Supplier_Contact_Entity tgSupplierContactEntity = new Tg_Supplier_Contact_Entity(supplierContactObj);
    	tgSupplierContactEntity.setSupplierEntity(supplierMasterEntity);
    	tgSupplierContactEntity.setLastUpdatedBy(user.getUserId());
    	supplierMasterEntity.getSupplierContactsList().add(tgSupplierContactEntity);
    	supplierService.saveSupplier(supplierMasterEntity);
    	//System.out.println("Supplier id is " + supplierId);
    	//System.out.println("Supplier Contact Object is " +  supplierContactObj);
    	redirectAttrib.addFlashAttribute("Success", "Supplier Contact Record is updated Successfully..");
    	modelView.setViewName("redirect:view_supplier_contacts_listing?supplierId="+supplierId);
    	return modelView;
    }
    
	@RequestMapping("view_supplier_contact_details_modal")
	public String view_supplier_contact_details_modal(@RequestParam long supplierContactId, Model model){
		Tg_Supplier_Contact_Entity supplierContactEntity =supplierService.findSupplierContactById(supplierContactId);
		TgSupplierContactVO supplierContactVo = new TgSupplierContactVO(supplierContactEntity);  
		
		model.addAttribute("SUPPLIER_CONTACT_OBJ",supplierContactVo );
	    //return "leads/viewLeadDetails";
		return "admin/supplier/view_SupplierContact_Modal";
	}

	
	 @RequestMapping(value="form_view_edit_supplier_contact",method= {RequestMethod.GET,RequestMethod.POST})
	   	public ModelAndView form_view_edit_supplier_contact(@RequestParam long supplierContactId,@ModelAttribute("SUPPLIER_OBJ") @Valid TgSupplierMasterVO supplierObj,@ModelAttribute("SUPPLIER_CONTACT_OBJ") @Valid TgSupplierContactVO supplierContactObj,BindingResult result) {
	    	ModelAndView modelView = new ModelAndView("admin/supplier/editSupplierContact");
	    	Tg_Supplier_Contact_Entity supplierContactEntity =supplierService.findSupplierContactById(supplierContactId);
	    	supplierContactObj.updateSupplierContactFromEntity(supplierContactEntity);
	    	Tg_Supplier_Master_Entity supplierMasterEntity = supplierContactEntity.getSupplierEntity();
	    	supplierObj.setSupplierVoFromEntity(supplierMasterEntity);
	    	supplierContactObj.setSupplierEntity(supplierMasterEntity);
	    	return modelView;
	}
	 
	@PostMapping(value="edit_edit_supplier_contact")
	public ModelAndView edit_edit_supplier_contact(@ModelAttribute("SUPPLIER_CONTACT_OBJ") @Valid TgSupplierContactVO supplierContactObj, BindingResult result,final RedirectAttributes redirectAttrib) {
	    	UserDetailsObj user = getLoggedInUser();
	    	ModelAndView modelView = new ModelAndView();
	    	Tg_Supplier_Contact_Entity tgSupplierContactEntity = supplierService.findSupplierContactById(supplierContactObj.getSupplierContactId());
	    	tgSupplierContactEntity.updateSupplierEntityFromVO(supplierContactObj);
	    	tgSupplierContactEntity.setLastUpdatedBy(user.getUserId());
	    	Tg_Supplier_Master_Entity supplierEntity =tgSupplierContactEntity.getSupplierEntity();
	    	supplierEntity.getSupplierContactsList().add(tgSupplierContactEntity);
	    	supplierService.saveSupplier(supplierEntity);
	    	redirectAttrib.addFlashAttribute("Success", "Supplier Contact Record is updated Successfully..");
	    	modelView.setViewName("redirect:view_supplier_contacts_listing?supplierId="+supplierEntity.getSupplierId());
	    	return modelView;
	}
	
	
	@RequestMapping("view_delete_supplier_contact_confirm_modal")
	public String view_delete_supplier_contact_confirm_modal(@RequestParam long supplierContactId, Model model){
		Tg_Supplier_Contact_Entity supplierContactEntity =supplierService.findSupplierContactById(supplierContactId);
		TgSupplierContactVO supplierContactVo = new TgSupplierContactVO(supplierContactEntity);  
		
		model.addAttribute("SUPPLIER_CONTACT_OBJ",supplierContactVo );
	    //return "leads/viewLeadDetails";
		return "admin/supplier/deleteSupplierContactConfrm_Modal";
	}

	@PostMapping(value="delete_delete_supplier_contact")
	public ModelAndView delete_delete_supplier_contact(@ModelAttribute("SUPPLIER_CONTACT_OBJ") @Valid TgSupplierContactVO supplierContactObj, BindingResult result,final RedirectAttributes redirectAttrib) {
	    	UserDetailsObj user = getLoggedInUser();
	    	ModelAndView modelView = new ModelAndView();
	    	Tg_Supplier_Contact_Entity tgSupplierContactEntity = supplierService.findSupplierContactById(supplierContactObj.getSupplierContactId());
	    	//tgSupplierContactEntity.updateSupplierEntityFromVO(supplierContactObj);
	    	tgSupplierContactEntity.setDeleted(true);
	    	tgSupplierContactEntity.setLastUpdatedBy(user.getUserId());
	    	Tg_Supplier_Master_Entity supplierEntity =tgSupplierContactEntity.getSupplierEntity();
	    	supplierEntity.getSupplierContactsList().add(tgSupplierContactEntity);
	    	supplierService.saveSupplier(supplierEntity);
	    	redirectAttrib.addFlashAttribute("Success", "Supplier Contact Record is deleted Successfully..");
	    	modelView.setViewName("redirect:view_supplier_contacts_listing?supplierId="+supplierEntity.getSupplierId());
	    	return modelView;
	}
	
	
	@RequestMapping("view_form_admin_search_supplier")
	public ModelAndView view_form_admin_search_client(@RequestParam(defaultValue = "0") int page,@RequestParam(defaultValue = "3") int pageSize, @RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("SEARCH_SUPPLIER") SearchSupplierObj searchSupplierObj, BindingResult result ) {
    	pageSize = UdanChooConstants.DEFAULT_PAGE_SIZE;
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView("admin/supplier/ViewSearchSupplier");
		modelView.addObject("userName", userObj.getUsername());
		modelView.addObject("Id", userObj.getUserId());
		//modelView.addObject("userRole", userObj.getRoles());
		UserDetailsObj user = getLoggedInUser();
		//TODO Check if some one changes the url manually then it should lead to an error page. not to a server error. 

		Page<Tg_Supplier_Master_Entity> pageSupplierList = supplierService.find_all_suppliers(page, pageSize, sortBy, searchSupplierObj);
		List<TgSupplierMasterVO> supplierObjList = generateSupplierObj(pageSupplierList);
		modelView.addObject("SUPPLIER_LIST", supplierObjList);
		modelView.addObject("maxPages", pageSupplierList.getTotalPages());
		modelView.addObject("page", page); 
		modelView.addObject("sortBy", sortBy);
		modelView.addObject("supplierName", searchSupplierObj.getSupplierName());
		modelView.addObject("cityId", searchSupplierObj.getCityId());
		modelView.addObject("cityName", searchSupplierObj.getCityName());
		
		return modelView;
	}

	 private List<TgSupplierMasterVO> generateSupplierObj(Page<Tg_Supplier_Master_Entity> pagedResult) {
			List<TgSupplierMasterVO> supplierVoList = new ArrayList<TgSupplierMasterVO>();
			List<Tg_Supplier_Master_Entity> supplierEntityList = pagedResult.getContent();
			
			Iterator<Tg_Supplier_Master_Entity> itrSupplierEntity = supplierEntityList.iterator();
			while(itrSupplierEntity.hasNext()) {
				Tg_Supplier_Master_Entity supplierEntity = (Tg_Supplier_Master_Entity) itrSupplierEntity.next();
				TgSupplierMasterVO supplierObj;
				try {
					supplierObj= new TgSupplierMasterVO(supplierEntity);
					if(supplierObj.getCityId()!=0)
						supplierObj.setCityName(commonService.findDestinationById(supplierObj.getCityId()).getCityName());
					
					supplierVoList.add(supplierObj);

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return supplierVoList;
		}

	@RequestMapping("view_delete_supplier_confirm_modal")
	public String view_delete_supplier_confirm_modal(@RequestParam long supplierId, Model model){
		Tg_Supplier_Master_Entity supplierEntity =supplierService.findSupplierById(supplierId).get();
		TgSupplierMasterVO supplierVo =supplierService.getSupplierVoFromEntity(supplierEntity);  
		
		model.addAttribute("SUPPLIER_OBJ",supplierVo );
	    //return "leads/viewLeadDetails";
		return "admin/supplier/deleteSupplierConfrm_Modal";
	}

	@PostMapping(value="delete_delete_supplier")
	public ModelAndView delete_delete_supplier(@ModelAttribute("SUPPLIER_OBJ") @Valid TgSupplierMasterVO supplierObj, BindingResult result,final RedirectAttributes redirectAttrib) {
	    	UserDetailsObj user = getLoggedInUser();
	    	ModelAndView modelView = new ModelAndView();
	    	Tg_Supplier_Master_Entity tgSupplierEntity = supplierService.findSupplierById(supplierObj.getSupplierId()).get();
	    	//tgSupplierContactEntity.updateSupplierEntityFromVO(supplierContactObj);
	    	tgSupplierEntity.setDeleted(true);
	    	tgSupplierEntity.setLastUpdatedBy(user.getUserId());
	    	supplierService.saveSupplier(tgSupplierEntity);
	    	redirectAttrib.addFlashAttribute("Success", "Supplier Record is deleted Successfully..");
	    	modelView.setViewName("redirect:view_form_admin_search_supplier");
	    	return modelView;
	}
 
	
	@RequestMapping("view_form_search_supplier_quote")
	public ModelAndView view_form_search_supplier_quote(@RequestParam(defaultValue = "0") int page,@RequestParam(defaultValue = "3") int pageSize, @RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("SEARCH_SUPPLIER") SearchSupplierObj searchSupplierObj, BindingResult result ) {
    	pageSize = UdanChooConstants.DEFAULT_PAGE_SIZE;
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView("admin/supplier/ViewSearchSupplier");
		modelView.addObject("userName", userObj.getUsername());
		modelView.addObject("Id", userObj.getUserId());
		//modelView.addObject("userRole", userObj.getRoles());
		UserDetailsObj user = getLoggedInUser();
		//TODO Check if some one changes the url manually then it should lead to an error page. not to a server error. 

		if(searchSupplierObj.getLeadId()!=0) {
			Tg_Leads_Recorder_Entity leadEntity = leadService.findLeadRecordById(searchSupplierObj.getLeadId());
			
			searchSupplierObj.setServiceCityId(leadEntity.getDestination());
			searchSupplierObj.setCruise(leadEntity.isCruise());
			searchSupplierObj.setFlight(leadEntity.isFlight());
			searchSupplierObj.setHotel(leadEntity.isHotel());
			searchSupplierObj.setInsurance(leadEntity.isInsurance());
			
			searchSupplierObj.setLandPackage(leadEntity.isLandPackage());
			//searchSupplierObj.setPackageWithFlight(leadEntity.isPackageWithFlight());
			//searchSupplierObj.setPackageWithoutFlight(leadEntity.isPackageWithoutFlight());
			
			searchSupplierObj.setSightseeing(leadEntity.isSightseeing());
			searchSupplierObj.setTransfers(leadEntity.isTransfers());
			searchSupplierObj.setVisa(leadEntity.isVisa());
			searchSupplierObj.setOthers(leadEntity.isOthers());
			searchSupplierObj.setServiceCityName(commonService.findDestinationById(leadEntity.getDestination()).getCityName());
		}
			
		Page<Tg_Supplier_Master_Entity> pageSupplierList = supplierService.find_all_suppliers(page, pageSize, sortBy, searchSupplierObj);
		List<TgSupplierMasterVO> supplierObjList = generateSupplierObj(pageSupplierList);
		modelView.addObject("SUPPLIER_LIST", supplierObjList);
		modelView.addObject("maxPages", pageSupplierList.getTotalPages());
		modelView.addObject("page", page); 
		modelView.addObject("sortBy", sortBy);
		//modelView.addObject("supplierName", searchSupplierObj.getSupplierName());
		modelView.addObject("cityId", searchSupplierObj.getCityId());
		modelView.addObject("cityName", searchSupplierObj.getCityName());
		
		return modelView;
	}

	@RequestMapping("form_view_quote_req_email_supplier")
   	public ModelAndView form_view_quote_req_email_supplier(@ModelAttribute("EMAIL_QUOTE_OBJ") QuoteReqestSupplierEmailFormObj quoteReqEmail,BindingResult result){
		//ModelAndView model = new ModelAndView("redirect:view_supplier_contacts_listing?supplierId="+quoteReqEmail.getSupplierId()+"&leadId="+quoteReqEmail.getLeadId());
		UserDetailsObj user = getLoggedInUser();
		//quoteReqEmail.setEmailCcList(quoteReqEmail.getEmailCcList()+","+user.getEmail());
		ModelAndView modelView = new ModelAndView();
		
		TgLeadsRecorderVO leadVo=null ; 
		if(quoteReqEmail.getLeadId()!=0) {
			Tg_Leads_Recorder_Entity leadEntity = leadService.findLeadRecordById(quoteReqEmail.getLeadId());
			leadVo = leadService.getLeadVoFromEntity(leadEntity);
			quoteReqEmail.setLeadReferenceNumber("Q-" + String.format("%04d",leadVo.getLeadId())+"-"+leadVo.getLeadSourceShortName());
			if(leadVo.getChildren()>0) {
				quoteReqEmail.setEmailSubject("B2BQuery | Lead Id: " + quoteReqEmail.getLeadReferenceNumber() + " | " + leadVo.getDestinationName() +  " | " + + leadVo.getAdults() + " A " + leadVo.getChildren() + " C" + " | Child Age: " + leadVo.getChildrenAgeInfo());
			}
			else{
				quoteReqEmail.setEmailSubject("B2BQuery | Lead Id: " + quoteReqEmail.getLeadReferenceNumber() + " | " + leadVo.getDestinationName() +  " | " + + leadVo.getAdults() + " A " + leadVo.getChildren() + " C");
			}
			modelView.addObject("LEAD_OBJ", leadVo);
			String emailMessage = "Destination              : " + leadVo.getDestinationName() +"\n";
			emailMessage = emailMessage + "Guests                   : " + leadVo.getAdults() + " Adults " + leadVo.getChildren() + " Children " + leadVo.getChildrenAgeInfo() +"\n";
			SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
			emailMessage = emailMessage + "Travel Start Date        : " +  dateFormat.format(leadVo.getTravelStartDate()) +"\n";
			emailMessage = emailMessage + "Travel End Date          : " +  dateFormat.format(leadVo.getTravelEndDate()) +"\n";
			emailMessage = emailMessage + "\nRemarks :        \n" + leadVo.getClientRemarks();
			quoteReqEmail.setEmailMessage(emailMessage);
		}
		modelView.setViewName("quotation/form_supplier_request_quotation_emailer");
		return modelView ;
	}

	
	@PostMapping(value="send_send_email_req_quote_supplier")
    public ModelAndView send_send_email_req_quote_supplier(@ModelAttribute("EMAIL_QUOTE_OBJ") QuoteReqestSupplierEmailFormObj quoteReqEmail,  BindingResult result,final RedirectAttributes redirectAttrib) {
	//	ModelAndView modelView = new ModelAndView();
		//modelView.setViewName("admin/quotation/form_supplier_request_quotation_emailer");
	
		
		ModelAndView modelView = new ModelAndView();
    	emailValidator.validate(quoteReqEmail, result);
    	if(result.hasErrors()) {
    		modelView.addObject("Error","Email Ids are not correct. ");
    		modelView.setViewName("forward:form_view_quote_req_email_supplier");
    	}
    	else {
    		if(emailClientActive) {
    			try {
    				notifyLeadCreationTargetAudience(quoteReqEmail, "SupplierQuoteRequest.ftl");
					modelView.setViewName("redirect:view_form_search_supplier_quote?supplierId="+quoteReqEmail.getSupplierId() + "&leadId="+quoteReqEmail.getLeadId());
					redirectAttrib.addFlashAttribute("Success","Email Quotation Request added to the mailing queue successfully!! ");
				} catch (MessagingException | IOException | TemplateException e) {
					redirectAttrib.addFlashAttribute("Error","Error: While sending email. Recipients setting error / Template Incorrect.<br> Please send individually or contact adminstrator.");	
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
    		}
    		else {
    			modelView.setViewName("redirect:form_view_quote_req_email_supplier?supplierId="+quoteReqEmail.getSupplierId() + "&leadId="+quoteReqEmail.getLeadId());
    			redirectAttrib.addFlashAttribute("Error","Error: All Client Communication Emails are disabled by Administrator. ");
    		}
    	}
		return modelView;
	}
	
	
	private void notifyLeadCreationTargetAudience(QuoteReqestSupplierEmailFormObj quoteReqEmail, String templateName) throws MessagingException, IOException, TemplateException {
			UserDetailsObj userObj = getLoggedInUser();
			Mail mail = new Mail();
			mail.setSubject(quoteReqEmail.getEmailSubject());
			quoteReqEmail.getEmailCcValidatedList().add((String)userObj.getEmail());
			InternetAddress[] emailToList = new InternetAddress[quoteReqEmail.getEmailToValidatedList().size()];
			InternetAddress[] emailCcList = new InternetAddress[quoteReqEmail.getEmailCcValidatedList().size()];
        	for (int i = 0; i < quoteReqEmail.getEmailToValidatedList().size(); i++) {
        		emailToList[i] = new InternetAddress((String) quoteReqEmail.getEmailToValidatedList().get(i));
        	}
        	for (int i = 0; i < quoteReqEmail.getEmailCcValidatedList().size(); i++) {
        		emailCcList[i] = new InternetAddress((String) quoteReqEmail.getEmailCcValidatedList().get(i));
				
        	}
			mail.setToList(emailToList);
			//quoteReqEmail.setEmailCcList(quoteReqEmail.getEmailCcList()+","+user.getEmail());
			mail.setCcList(emailCcList);

			Map<String, Object> model = new HashMap<String, Object>();
			model.put("leadConfirmationNumber", quoteReqEmail.getLeadReferenceNumber());
	        model.put("queryMessage", quoteReqEmail.getEmailMessage());
	        model.put("serviceAdvisor", userObj.getName());
	        model.put("contactNumber", userObj.getMobile());
	        mail.setModel(model);
			emailService.sendB2bEmailMessageUsingTemplate_MultipleRecipients(mail,templateName);
		}
	
}
