package com.udanchoo.intranet.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.mail.MessagingException;
import javax.validation.Valid;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;
import com.udanchoo.intranet.entity.UdnTeam;
import com.udanchoo.intranet.entity.Udn_Deal_FLT_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_Services_Entity;
import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.entity.quotation.Tg_Quotation_Recorder_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.ClientObj;
import com.udanchoo.intranet.model.Mail;
import com.udanchoo.intranet.model.SearchDealObj;
import com.udanchoo.intranet.model.Tag;
import com.udanchoo.intranet.model.Tg_B2bPartner_Obj;
import com.udanchoo.intranet.model.UdnDealStatusVO;
import com.udanchoo.intranet.model.Udn_Deals_Recorder_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.leads.FilterLeadObj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.model.quotation.TgQuotationRecorderVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.DealServiceImpl;
import com.udanchoo.intranet.service.EmailServiceImpl;
import com.udanchoo.intranet.service.QuotationServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.validator.DealEditValidator;

import freemarker.template.TemplateException;




@Controller
public class DealController {

	 
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired 
	ClientServiceImpl clientService;
	
	@Autowired
	DealServiceImpl dealService;
	
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
    private DealEditValidator dealEditValidator;
	
	@Autowired
	EmailServiceImpl emailService;
	
	@Value("${email.client.valid}")
	private boolean emailClientOn;

	@Autowired
    private QuotationServiceImpl quotationService;
	
	@Autowired
	UserDetailsServiceImpl userService;

    
	
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
    
    //@RequestMapping("/workload/view_workload_createNewDealForm")
    @RequestMapping("/view_workload_createNewDealForm")
   	public ModelAndView view_workload_createNewDeal(@ModelAttribute("dealRecorder") Udn_Deals_Recorder_Obj dealRecorder, BindingResult result) {
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	String username;
    	if (principal instanceof UserDetails) {
    	   username = ((UserDetails)principal).getUsername(); 
    	} else {
    	   username = principal.toString();
    	}
     	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
    	ModelAndView mapview = new ModelAndView("deals/form_createNewDeal");
    	mapview.addObject("userName", username);
    	mapview.addObject("Id", userObj.getUserId());
    	//mapview.addObject("userRole", userObj.getRoles());
    	
    	ClientObj clientObj = new ClientObj();
    	mapview.addObject("client", clientObj);
    	
    	
    	List udnServiceList = userDetailsService.findAllActiveUdnServices();
    	mapview.addObject("UdnServicesList", udnServiceList);
    	
    	List<Tg_B2bPartner_Obj> listAgents = dealService.findAllActiveAgents();
    	mapview.addObject("DEAL_SOURCE",listAgents);
    	
    	
    	Tag tag = new Tag();
    	mapview.addObject("tag", tag);
    	
    	List udnDestinationList = commonService.listAllActiveDestinations();
    	mapview.addObject("UdnDestinationsList", udnDestinationList);
    	
    	mapview.addObject("dealRecorder",dealRecorder);
		
    	return mapview;
    }
    
    //@PostMapping("/workload/create_workload_MainDealRecord")
    @PostMapping("/create_workload_MainDealRecord")
    public ModelAndView createMainDealRecord(@Valid Udn_Deals_Recorder_Obj dealRecorderObj) {
        //System.out.println("Deal Object Received is " + dealRecorderObj);
        UserDetailsObj user = getLoggedInUser();
        dealRecorderObj.setDealOwner(user.getUserId());
        Udn_Deals_Recorder_Entity dealRecordEntity = new Udn_Deals_Recorder_Entity(dealRecorderObj);
        dealRecordEntity.setDealOwner(user.getUserId());
        String serviceEmailList="";
        for (int i=0;i<dealRecorderObj.getServiceList().length;i++) {
    		Udn_Deal_Services_Entity serviceMapEntity = new Udn_Deal_Services_Entity();
    		serviceMapEntity.setDealServiceCode(dealRecorderObj.getServiceList()[i]);
    		if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_FLT_CODE)) {
    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_FLT_WL_STATUS);
    			serviceEmailList = serviceEmailList + "<li>" + UdanChooConstants.UDN_FLT_SRV_SUPP_NAME;
    		}
    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_HTL_CODE)) {
    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_HTL_WL_STATUS);
    			serviceEmailList = serviceEmailList + "<li>" + UdanChooConstants.UDN_HTL_SRV_SUPP_NAME;
    		}
    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_INS_CODE)) {
    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_INS_WL_STATUS);
    			serviceEmailList = serviceEmailList + "<li>" + UdanChooConstants.UDN_INS_SRV_SUPP_NAME;
    		} 
    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_LDP_CODE)) {
    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_LDP_WL_STATUS);
    			serviceEmailList = serviceEmailList + "<li>" + UdanChooConstants.UDN_LDP_SRV_SUPP_NAME;
    		}
    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_OTH_CODE)) {
    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_OTH_WL_STATUS);
    			serviceEmailList = serviceEmailList + "<li>" + UdanChooConstants.UDN_OTH_SRV_SUPP_NAME;
    		}
    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_STS_CODE)) {
    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_STS_WL_STATUS);
    			serviceEmailList = serviceEmailList + "<li>" + UdanChooConstants.UDN_STS_SRV_SUPP_NAME;
    		}
    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_TRN_CODE)) {
    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_TRN_WL_STATUS);
    			serviceEmailList = serviceEmailList + "<li>" + UdanChooConstants.UDN_TRN_SRV_SUPP_NAME;
    		}
    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_VSA_CODE)) {
    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_VSA_WL_STATUS);
    			serviceEmailList = serviceEmailList + "<li>" + UdanChooConstants.UDN_VSA_SRV_SUPP_NAME;
    		}
    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_CRS_CODE)) {
    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_CRS_WL_STATUS);
    			serviceEmailList = serviceEmailList + "<li>" + UdanChooConstants.UDN_CRS_SRV_SUPP_NAME;
    		}

    		serviceMapEntity.setParentDealRecord(dealRecordEntity);
    		dealRecordEntity.getDealServicesEntityList().add(serviceMapEntity);
    	}
    	
        Udn_Deals_Recorder_Entity newDealEntity= dealService.createDealWithServices(dealRecordEntity);
        
        if(dealRecorderObj.isClientInformed() && emailClientOn) {
        	ClientObj client = clientService.find_ClientByDealConfirmationId(newDealEntity.getDealConfirmationId());
        	informClientDealConfirmation(client,dealRecordEntity.getDealConfirmationId(),serviceEmailList,user);
        }

        //System.out.println("Deal Entity Object is " + newDealEntity );
        ModelAndView dealMapView = new ModelAndView ();  
        dealMapView.addObject("Success", "Deal Record is created Successfully!! ");
        
        dealMapView.setViewName("forward:view_view_deal_form?dealConfirmationId="+newDealEntity.getDealConfirmationId());
        /*dealMapView.setViewName("workload/DisplayConfirmation");
        dealMapView.addObject("confirmation", "<h2> You Deal is Updated Successfully.  !!<h2>");
        dealMapView.addObject("ConfirmationFor", "Deal-Update");
        */
        return dealMapView;
    }

    private void informClientDealConfirmation(ClientObj client, Long dealConfirmationId, String serviceEmailList,
			UserDetailsObj user) {
    	Mail mail = new Mail();
        mail.setTo(client.getEmail().trim());
        mail.setCc(user.getEmail());
        mail.setSubject(UdanChooConstants.MY_COMPANY_NAME + ": Deal Reference UDN-" + dealConfirmationId + " Created !! . " );

        Map<String, Object> model = new HashMap<String, Object>();
        model.put("clientName", client.getClientName());
        model.put("Services",serviceEmailList);
        model.put("serviceAdvisor", user.getName());
        model.put("contactNumber", user.getMobile());
        model.put("dealConfirmationId", dealConfirmationId);
        mail.setModel(model);
        try {
			emailService.sendEmailMessageUsingTemplate(mail,UdanChooConstants.FRESH_DEAL_CONF_TEMPLATE_NAME);
			
		} catch (MessagingException | IOException | TemplateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	//@RequestMapping("/workload/view_deal_searchDealForm")
	@RequestMapping("/view_deal_searchDealForm")
   	public ModelAndView view_deal_searchDeal(@ModelAttribute("FILTER_DEAL_OBJ") SearchDealObj searchDealForm, BindingResult result) {
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	String username;
    	if (principal instanceof UserDetails) {
    	   username = ((UserDetails)principal).getUsername();
    	} else {
    	   username = principal.toString();
    	}
     	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
    	ModelAndView mapview = new ModelAndView("deals/form_searchDeal");
    	mapview.addObject("userName", username);
    	mapview.addObject("Id", userObj.getUserId());
    	//mapview.addObject("userRole", userObj.getRoles());
    	mapview.addObject("searchDealForm", searchDealForm);
 		mapview.addObject("DEAL_SEARCH_PERIOD_TYPE", UdanChooConstants.DEAL_SEARCH_PERIOD_TYPE);
    	
 		
    	//List<UdnDealStatusVO> udnDealStatusVoList = commonService.find_All_Status_Deal_Obj("DEAL_OBJ");
    	//mapview.addObject("DEAL_STATUS_LIST", udnDealStatusVoList);
    	
    	List<UdnDealStatusVO> udnDealStatusVoList = commonService.find_All_Status_Deal_Obj("DEAL_OBJ");
    	Map<Integer, String> dealStatusMap = (Map<Integer, String>) udnDealStatusVoList.stream().collect(
                Collectors.toMap(UdnDealStatusVO::getWorkloadStatusId, UdnDealStatusVO::getWorkloadStatusName));
    	
    	mapview.addObject("DEAL_STATUS_MAP", dealStatusMap);
    	
    	List dealSearchList = new ArrayList();
    	
    	/*
    	// Get current date
    	java.util.Date currentDate = new java.util.Date();
    	// Create a Calendar object and set it to the current date
    	Calendar calendar = Calendar.getInstance();
    	calendar.setTime(currentDate);
    	// Subtract one month from the current date
    	calendar.add(Calendar.MONTH, -1);
    	java.util.Date previousMonthDate = calendar.getTime();
    	// Convert the dates to java.sql.Date objects
    	Date currentSqlDate = new Date(currentDate.getTime());
    	Date previousMonthSqlDate = new Date(previousMonthDate.getTime());
    	*/
    	
    	Calendar calendar = Calendar.getInstance();

        // Set the calendar to the first day of the current month
        calendar.set(Calendar.DAY_OF_MONTH, 1);

        // Get the date for the first day of the current month
        java.util.Date firstDayOfMonth = calendar.getTime();

        // Set the calendar to the last day of the current month
        calendar.add(Calendar.MONTH, 1); // Move to the next month
        calendar.add(Calendar.DAY_OF_MONTH, -1); // Move to the last day of the previous month

        // Get the date for the last day of the current month
        java.util.Date lastDayOfMonth = calendar.getTime();

        Date currentSqlDate = new Date(lastDayOfMonth.getTime());
    	Date previousMonthSqlDate = new Date(firstDayOfMonth.getTime());
    	
    	
    	searchDealForm.setStartDate(previousMonthSqlDate);
    	searchDealForm.setEndDate(currentSqlDate);
    	searchDealForm.setSearchOnBookingDate(true);
    	
    	
    	
    	
    	
    	searchDealBasedOnStatusAndDate(dealSearchList,searchDealForm);
    	mapview.addObject("dealSearchList",dealSearchList);
    	//mapview.setViewName("deals/form_searchDealResults");
    	mapview = view_filter_deals( "0",3, "CreatedAt",searchDealForm,result);
    	//mapview.setViewName("deals/view_filter_deals");
    	
    	
    	return mapview;
    }
    /*
    //@PostMapping("/workload/search_viewSearchDealReport")
	@PostMapping("/search_viewSearchDealReport")
    public ModelAndView showSearchDealReport(@ModelAttribute("FILTER_DEAL_OBJ") @Valid SearchDealObj searchDealObj, BindingResult result, ModelMap model) {
		System.out.println("Deal Search Form is " + searchDealObj);
		UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}

    	
    	ModelAndView mapview = new ModelAndView();
    	mapview.addObject("userName", userObj.getUsername());
    	mapview.addObject("Id", userObj.getUserId());
    	//mapview.addObject("userRole", userObj.getRoles());
    	mapview.setViewName("deals/form_searchDealResults");
    	List<UdnDealStatusVO> udnDealStatusVoList = commonService.find_All_Status_Deal_Obj("DEAL_OBJ");
    	mapview.addObject("DEAL_STATUS_LIST", udnDealStatusVoList);
    	List dealSearchList = new ArrayList();
    	
    	String searchCriteria = searchDealObj.getSearchCriteria(); 
    	if(searchCriteria.equalsIgnoreCase(UdanChooConstants.DEAL_SEARCH_CONF) && (searchDealObj.getDealConfirmationId()!=null)) {
    		//perform search based on deal confirmation id.
	    		System.out.println("//perform search based on deal confirmation id.");
	    		
	    		Udn_Deals_Recorder_Obj dealRecorderObj = null;
				try {
					dealRecorderObj = dealService.findDealEntityById(searchDealObj.getDealConfirmationId(),userObj.getUserId(),isAdmin);
					System.out.println("Deal Recorder chughe is " + dealRecorderObj );
					dealRecorderObj.setStatusName(commonService.find_DealStatusById(dealRecorderObj.getDealStatus()).getWorkloadStatusName());
					dealSearchList.add(dealRecorderObj);
				} catch (RecordNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	    		
    	}
    	else if(searchCriteria.equalsIgnoreCase(UdanChooConstants.DEAL_SEARCH_CLIENT) && searchDealObj.getClientId()!=null) {
    		//perform search based on client id. 
    		
    		
    		List dealList = dealService.findDealsByClientnOwnerId(searchDealObj.getClientId(), userObj.getUserId());
    		Iterator itrDeals =  dealList.iterator();
    		while(itrDeals.hasNext()) {
    			Udn_Deals_Recorder_Obj dealObj = new Udn_Deals_Recorder_Obj((Udn_Deals_Recorder_Entity) itrDeals.next());
    			try {
    				dealObj.setClientName((clientService.getClientById(dealObj.getClientId()).getClientName()));
				
    			} catch (RecordNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
    			dealSearchList.add(dealObj);
    		}
    		
    		System.out.println("//perform search based on client id.");
    	}
    	else if((searchCriteria.equalsIgnoreCase(UdanChooConstants.DEAL_SEARCH_QUERY)) && (searchDealObj.getQueryId()!=null) && (searchDealObj.getQueryId().trim().length()>0)) {
    		//perform search based on query id. 
    		searchDealBasedOnQueryId(dealSearchList,searchDealObj);
    		System.out.println("//perform search based on query id.");
    	}
    	else if(searchCriteria.equalsIgnoreCase(UdanChooConstants.DEAL_SEARCH_CLIENT) && (searchDealObj.getClientId()==null) && (searchDealObj.getClientName()!=null) && (searchDealObj.getClientName().trim().length()>0)) {
    		//ERROR : Return back with invalid client details provided. 
    		System.out.println("//ERROR : Return back with invalid client details provided.");
    	}
    	else { 
    		//perform search based on deal status and date. 
    		searchDealBasedOnStatusAndDate(dealSearchList,searchDealObj);
    		System.out.println("//perform search based on deal status and date.");
    	}
    	
    	mapview.addObject("dealSearchList",dealSearchList);
    	//System.out.println("Search Query Form Value Received is " + searchDealObj);
    	return mapview;
    }

    */
	@RequestMapping(value="view_filter_deals",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView view_filter_deals( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "3") Integer pageSize, @RequestParam(defaultValue = "CreatedAt") String sortBy,@ModelAttribute("FILTER_DEAL_OBJ") SearchDealObj filterDealObj,BindingResult result) {
		pageSize = UdanChooConstants.DEFAULT_PAGE_SIZE;
		ModelAndView modelView = new ModelAndView("deals/form_searchDealResults");
		modelView.addObject("DEAL_SEARCH_PERIOD_TYPE", UdanChooConstants.DEAL_SEARCH_PERIOD_TYPE);
    	List<UdnDealStatusVO> udnDealStatusVoList = commonService.find_All_Status_Deal_Obj("DEAL_OBJ");
    	Map<Integer, String> dealStatusMap = (Map<Integer, String>) udnDealStatusVoList.stream().collect(
                Collectors.toMap(UdnDealStatusVO::getWorkloadStatusId, UdnDealStatusVO::getWorkloadStatusName));
    	modelView.addObject("DEAL_STATUS_MAP", dealStatusMap);
		if(filterDealObj.getEndDate().compareTo(filterDealObj.getStartDate()) <0) {
			result.rejectValue("endDate", "lead.invalid.date.range");
		}
		if(result.hasErrors()) {
			System.out.println("Error there " + result);
			return modelView; 
		}
		else {
			UserDetailsObj user = getLoggedInUser();
			boolean isAdmin=false;
		    if(user.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN") || a.getAuthority().equals("LEAD_MANAGER"))) {
		   		isAdmin=true;
		   	}
		    if((!isAdmin) && filterDealObj.getDealOwner()==0) {
		    	filterDealObj.setDealOwner(user.getUserId());
		    }
			int pageNum = Integer.parseInt(page);
			
			Page<Udn_Deals_Recorder_Entity> pageDealsFilteredRecords = dealService.filterDeals(pageNum, pageSize, filterDealObj.getDealOwner(), sortBy, filterDealObj, isAdmin);
			//modelView.addObject("dealSearchList",pageDealsFilteredRecords);
			List<Udn_Deals_Recorder_Obj> filteredDealsVoList = generateFilteredDealsVo(pageDealsFilteredRecords);
			modelView.addObject("FILTERED_DEAL_RECORDS",filteredDealsVoList);
			modelView.addObject("maxPages", pageDealsFilteredRecords.getTotalPages());
			modelView.addObject("page", pageNum);
			modelView.addObject("sortBy", sortBy);
		}
		return modelView;
	}
	
	private List<Udn_Deals_Recorder_Obj> generateFilteredDealsVo(Page<Udn_Deals_Recorder_Entity> pagedResult) {
		List<Udn_Deals_Recorder_Obj> filteredDealsVoList = new ArrayList<Udn_Deals_Recorder_Obj>();
		List<Udn_Deals_Recorder_Entity> dealsEntityList = pagedResult.getContent();
		Iterator filteredDealsIterator = dealsEntityList.iterator();
		while(filteredDealsIterator.hasNext()) {
			Udn_Deals_Recorder_Entity dealEntity = (Udn_Deals_Recorder_Entity) filteredDealsIterator.next();
			Udn_Deals_Recorder_Obj dealsVO =new Udn_Deals_Recorder_Obj(dealEntity);
			try {
				dealsVO.setClientName((clientService.getClientById(dealsVO.getClientId()).getClientName()));
				dealsVO.setStatusName(commonService.find_DealStatusById(dealsVO.getDealStatus()).getWorkloadStatusName());
				dealsVO.setDealOwnerName(userService.findUserByID(Integer.parseInt(String.valueOf(dealsVO.getDealOwner()))).getUsername());
			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			filteredDealsVoList.add(dealsVO);
		}
		return filteredDealsVoList;
	}
	
	private List searchDealBasedOnStatusAndDate(List dealSearchList, @Valid SearchDealObj searchDealObj) {
    	UserDetailsObj userObj = getLoggedInUser();
    	
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}

    	List dealList = dealService.findDealsByStatusAndDate(searchDealObj, userObj.getUserId(),isAdmin);
		Iterator itrDeals =  dealList.iterator();
		while(itrDeals.hasNext()) {
			Udn_Deals_Recorder_Obj dealObj = new Udn_Deals_Recorder_Obj((Udn_Deals_Recorder_Entity) itrDeals.next());
			try {
				dealObj.setClientName((clientService.getClientById(dealObj.getClientId()).getClientName()));
				dealObj.setStatusName(commonService.find_DealStatusById(dealObj.getDealStatus()).getWorkloadStatusName());
			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dealSearchList.add(dealObj);
		}
		return dealSearchList;
    	
		
	}

	private List searchDealBasedOnQueryId(List dealSearchList, SearchDealObj searchDealObj) {
		UserDetailsObj userObj = getLoggedInUser();
		List dealList = dealService.findDealsByQuerynOwnerId(searchDealObj.getQueryId(), userObj.getUserId());
		Iterator itrDeals =  dealList.iterator();
		while(itrDeals.hasNext()) {
			Udn_Deals_Recorder_Obj dealObj = new Udn_Deals_Recorder_Obj((Udn_Deals_Recorder_Entity) itrDeals.next());
			try {
				dealObj.setClientName((clientService.getClientById(dealObj.getClientId()).getClientName()));
				dealObj.setStatusName(commonService.find_DealStatusById(dealObj.getDealStatus()).getWorkloadStatusName());
			
			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dealSearchList.add(dealObj);
		}
		return dealSearchList;
    }
	
	
	//@RequestMapping("/workload/view_edit_deal_form")
	@RequestMapping("/view_edit_deal_form")
	   	public ModelAndView view_edit_deal_form(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("dealRecorder") Udn_Deals_Recorder_Obj dealRecorder, BindingResult result) {
	    System.out.println("Deal Recorder Object is " + dealRecorder);	
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    	String username;
	    	if (principal instanceof UserDetails) {
	    	   username = ((UserDetails)principal).getUsername(); 
	    	} else {
	    	   username = principal.toString();
	    	}
	    	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
	    	boolean isAdmin=false;
	     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
	    		isAdmin=true;
	    	}
	    	try {
	    		dealRecorder = dealService.findDealEntityBy_Id(dealConfirmationId,userObj.getUserId(),isAdmin,dealRecorder);

			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	
	    	ModelAndView mapview = new ModelAndView("deals/form_editDeal");
	    	mapview.addObject("userName", username);
	    	mapview.addObject("Id", userObj.getUserId());
	    	//mapview.addObject("userRole", userObj.getRoles());
	    	
	    	ClientObj clientObj = new ClientObj();
	    	mapview.addObject("client", clientObj);
	    	
	    	List udnServiceList = userDetailsService.findAllActiveUdnServices();
	    	mapview.addObject("UdnServicesList", udnServiceList);
	    	
	    	List<Tg_B2bPartner_Obj> listAgents = dealService.findAllActiveAgents();
	    	mapview.addObject("DEAL_SOURCE",listAgents);
	    	
	    	Tag tag = new Tag();
	    	mapview.addObject("tag", tag);
	    	
	    	List udnDestinationList = commonService.listAllActiveDestinations();
	    	mapview.addObject("UdnDestinationsList", udnDestinationList);

	    	List<UdnDealStatusVO> udnDealStatusVoList = commonService.find_All_Status_Deal_Obj("DEAL_OBJ");
	    	mapview.addObject("DEAL_STATUS_LIST", udnDealStatusVoList);
	    	mapview.addObject("DealObject",dealRecorder);
	    	
	    	List<UserDetailsObj> activeUsersList = userDetailsService.findAllActiveUsers();
	 		Map<Integer, String> activeUsersMap = (Map<Integer, String>) activeUsersList.stream().collect(
	                 Collectors.toMap(UserDetailsObj::getUserId, UserDetailsObj::getUsername));
	 		mapview.addObject("ACTIVE_USERS_MAP", activeUsersMap);

	 		HashSet operatingTeam= new HashSet(); 
	 		dealRecorder.getTeam().forEach(e->operatingTeam.add(String.valueOf(e.getUserId())));
	 		dealRecorder.setOperatingTeams(operatingTeam);
	    	List<Object> jsonList = new ArrayList();
			Iterator itr = dealRecorder.getOperatingTeams().iterator();
			while(itr.hasNext()) {
				int jsonString = Integer.parseInt((String) itr.next()); 
				JSONObject opDestin = new JSONObject();
				JSONArray array = new JSONArray();
				opDestin.put("id", jsonString);
				UdnTeam team = userService.findUserByID(jsonString);
				opDestin.put("tagName", team.getUsername() + "--" + team.getName());	
				jsonList.add(opDestin);
			}
			JSONArray myArray = new JSONArray(jsonList);
			String arrayToJson = myArray.toString(2);
			dealRecorder.setTeamNames(arrayToJson);

	    	
	    	return mapview;
	    }
    
	//@RequestMapping("/workload/view_view_deal_form")
	@RequestMapping("/view_view_deal_form")
   	public ModelAndView view_view_deal_form(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("dealRecorder") Udn_Deals_Recorder_Obj dealRecorder, BindingResult result) {
		ModelAndView modelView = view_edit_deal_form(dealConfirmationId,dealRecorder,null);
		modelView.setViewName("deals/form_viewDeal");
    	return modelView;
    } 
	
	
	@RequestMapping("/view_view_deal_form_modal")
   	public ModelAndView view_view_deal_form_modal(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("dealRecorder") Udn_Deals_Recorder_Obj dealRecorder, BindingResult result) {
		ModelAndView modelView = view_edit_deal_form(dealConfirmationId,dealRecorder,null);
		modelView.setViewName("deals/form_viewDeal_modal");
    	return modelView;
    }
	
	@RequestMapping("/view_view_deal_form_modal_free_acl")
   	public ModelAndView view_view_deal_form_modal_free_acl(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("dealRecorder") Udn_Deals_Recorder_Obj dealRecorder, BindingResult result) {
		ModelAndView modelView = new ModelAndView();
		try {
			Udn_Deals_Recorder_Entity dealEntity = dealService.find_DealEntityBy_Id(dealConfirmationId);
			
			Udn_Deals_Recorder_Obj dealRecorderObj = new Udn_Deals_Recorder_Obj(dealEntity);
			dealService.setDealWLServicesStatasName(dealRecorderObj);
			dealRecorderObj.setClientName((clientService.getClientById(dealRecorderObj.getClientId()).getClientName()));
			dealRecorderObj.setTravelingFromCity(commonService.findDestinationById(dealRecorderObj.getTravelingFrom()).getCityName());
			dealRecorderObj.setTravelingToCity(commonService.findDestinationById(dealRecorderObj.getTravelingTo()).getCityName());
			dealRecorderObj.setStatusName(commonService.find_DealStatusById(dealRecorderObj.getDealStatus()).getWorkloadStatusName());
			dealRecorderObj.setDealSourceName(dealService.findAgentById(dealRecorderObj.getDealSource()).getPartnerShortName());
			
			modelView.addObject("DealObject",dealRecorderObj);
			
			List udnServiceList = userDetailsService.findAllActiveUdnServices();
			modelView.addObject("UdnServicesList", udnServiceList);
		
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		modelView.setViewName("deals/form_viewDeal_modal");
    	return modelView;
    } 
	
	//@PostMapping("/workload/edit_workload_MainDealRecord")
	@PostMapping("/edit_workload_MainDealRecord")
    public ModelAndView edit_workload_MainDealRecord(@Valid Udn_Deals_Recorder_Obj dealRecorderObj,BindingResult result) {
       UserDetailsObj userObj = getLoggedInUser(); 
        dealEditValidator.validate(dealRecorderObj, result);

        ModelAndView mapview = new ModelAndView();
    	mapview.addObject("userName", userObj.getUsername());
    	mapview.addObject("Id", userObj.getUserId());
    	//mapview.addObject("userRole", userObj.getRoles());
    	
    	ClientObj clientObj = new ClientObj();
    	mapview.addObject("client", clientObj);

        String errors="";
        if(result.hasErrors()) {
        	errors = getValidationErrorMessage(result);
        	mapview.addObject("ERRORS", errors);
        	mapview.addObject("DealObject", dealRecorderObj);
        	mapview.setViewName("deals/errors_deals_update");
        }
        else {
        	try {
        		dealRecorderObj.getOperatingTeams().forEach((e) -> { 
        			UdnTeam userEntity = userService.findUserByID(Integer.parseInt(e));
        			dealRecorderObj.getTeam().add(userEntity);
        		});
        		dealService.updateDealMainRecord(dealRecorderObj);
        		mapview.addObject("Success", "Deal Record is updated Successfully!! ");
        		mapview.setViewName("forward:view_view_deal_form");
        	} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        	//mapview = view_edit_deal_form(dealRecorderObj.getDealConfirmationId(),dealRecorderObj,null);
        	
        }
      
        //mapview.setViewName("forward:view_edit_deal_form");
        return mapview;
    }
	   
	   private static String getValidationErrorMessage(BindingResult bindingResult) {
		   StringBuilder sb = new StringBuilder();
		   //sb.append(bindingResult.getErrorCount()).append(" error(s): ");
		   for (ObjectError error : bindingResult.getAllErrors()) {
		     sb.append("[").append(error.getDefaultMessage()).append("] <BR><hr>");
		   }
		   return sb.toString();
		 }

	   
	    //@PostMapping("/workload/create_workload_MainDealRecord")
	    @PostMapping("/convert_Quotation_To_DealRecord")
	    public ModelAndView convert_Quotation_To_DealRecord(@ModelAttribute("DEAL_OBJ") Udn_Deals_Recorder_Obj dealRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj) {
	        UserDetailsObj user = getLoggedInUser();
	        ModelAndView dealMapView = new ModelAndView ();
	        dealRecorderObj.setDealOwner(user.getUserId());
	        //System.out.println("Flight Entries are : " + qtnRecorderObj.getManualQuotationsVoList());
	        boolean isSuccess = dealService.convertQuotationToDealRecord(dealRecorderObj, qtnRecorderObj.getQuotationId(),user);
	        if(isSuccess) {
	        	Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(qtnRecorderObj.getQuotationId());
	        	quotationEntity.setConverted(true);
	        	quotationService.saveLead(quotationEntity);
	        }
	        dealMapView.setViewName("forward:view_view_deal_form?dealConfirmationId="+dealRecorderObj.getDealConfirmationId());
	        
	        return dealMapView;
	    }
	 
}

