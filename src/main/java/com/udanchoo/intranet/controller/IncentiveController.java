package com.udanchoo.intranet.controller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.udanchoo.intranet.entity.UdnIncentiveEntity;
import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.IncentiveObj;
import com.udanchoo.intranet.model.SearchIncentiveObj;
import com.udanchoo.intranet.model.Tag;
import com.udanchoo.intranet.model.UdnDealStatusVO;
import com.udanchoo.intranet.model.Udn_Deals_Recorder_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.DealServiceImpl;
import com.udanchoo.intranet.service.EmailServiceImpl;
import com.udanchoo.intranet.service.IncentiveServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;


@Controller
@SessionAttributes("incentive")
public class IncentiveController {

	
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
	IncentiveServiceImpl incentiveService;
	
	@Autowired
	DealServiceImpl dealService;
	
	@Autowired
	ClientServiceImpl clientService;
	
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	EmailServiceImpl emailService;
	
	DateFormat dateFilterFormat = new SimpleDateFormat("yyyy-MM-dd");
 
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
 
    //@RequestMapping("/workload/newincentive")
    @RequestMapping("/newincentive")
   	public ModelAndView newIncentiveFormDisplay(@ModelAttribute("INCENTIVE_OBJ") IncentiveObj incentiveObj,BindingResult result) {
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	String username;
    	if (principal instanceof UserDetails) {
    	   username = ((UserDetails)principal).getUsername();
    	} else {
    	   username = principal.toString();
    	}
     	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
    	ModelAndView mapview = new ModelAndView("incentive/SubmitNewIncentiveClaim");
    	mapview.addObject("userName", username);
    	mapview.addObject("userId", userObj.getUserId());
    	
    	List<UserDetailsObj> activeUsersList = userDetailsService.findAllActiveUsers();
 		Map<Integer, String> activeUsersMap = (Map<Integer, String>) activeUsersList.stream().collect(
                 Collectors.toMap(UserDetailsObj::getUserId, UserDetailsObj::getUsername));
 		mapview.addObject("ACTIVE_USERS_MAP", activeUsersMap);
    	//mapview.addObject("userRole", userObj.getRoles());
    	
    	
    	return mapview;
    	
    	
    }
    
    
    //@PostMapping(value="/workload/submitincentive")
    @PostMapping("create_create_incentive")
    public ModelAndView create_create_incentive(@ModelAttribute("INCENTIVE_OBJ") @Valid IncentiveObj incentiveObj, BindingResult result,final RedirectAttributes redirectAttrib) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView mapview = new ModelAndView();
		mapview.addObject("userName",userObj.getUsername());
		//mapview.addObject("userRole",userObj.getRoles());
		
		if(result.hasErrors()) {
			mapview.addObject("userId", incentiveObj.getClaimantId());
    		mapview.setViewName("incentive/SubmitNewIncentiveClaim");
      		return mapview; 
    	}
    	else {
    		UdnIncentiveEntity entity = new UdnIncentiveEntity(incentiveObj);
    		
			try {
				entity.setStatus(UdanChooConstants.INCENTIVE_FRESH_CREATED_STATUS);
				entity = incentiveService.createOrUpdateIncentive(entity);
				//incentiveObj.setIncentiveId(entity.getIncentiveId());
				redirectAttrib.addFlashAttribute("Success", "Your Incentive Claim is Submitted Successfully !!");
				mapview.setViewName("redirect:view_incentive_details?incentiveId="+entity.getIncentiveId());
			
			} catch (Exception e) {
				// TODO Auto-generated catch block
				redirectAttrib.addFlashAttribute("Error", "Error !! While adding claim. Please contact administrator !!");
				mapview.setViewName("incentive/SubmitNewIncentiveClaim");
				e.printStackTrace();
			}
    		
    	}
    	return mapview ;
    	
    }
    
    @RequestMapping(value = "adminDisplayIncentive", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView adminDisplayIncentive(@RequestParam("incentiveId") long incentiveId) {
    	ModelAndView modelView = displayIncentive(incentiveId);
    	modelView.setViewName("admin/incentive/DisplayIncentive");
    	return modelView ;
    }
    
    @RequestMapping("view_incentive_details")
	public ModelAndView view_incentive_details(@RequestParam long incentiveId){
    	ModelAndView incentiveView = new ModelAndView();
    	String username = getLoggedInUser().getUsername();
    	UdnIncentiveEntity incentiveEntity=null;
		try {
			incentiveEntity = incentiveService.getIncentiveById(incentiveId).get();
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	IncentiveObj incentiveObj =  new IncentiveObj();
		incentiveObj.updateIncentiveVoFromEntity(incentiveEntity);
		incentiveObj.setClaimStatusName(commonService.find_DealStatusById(incentiveObj.getStatus()).getWorkloadStatusShortName());
		
		Udn_Deals_Recorder_Entity dealEntity;
		try {
			dealEntity = dealService.find_DealEntityBy_Id(incentiveEntity.getDealConfirmationId());
			incentiveObj.setGuestName((clientService.getClientById(dealEntity.getClientId()).getClientName()));
			incentiveObj.setClaimantName(userDetailsService.findUserByID(incentiveObj.getClaimantId()).getUsername());
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		incentiveView.addObject("INCENTIVE_OBJ", incentiveObj);
	
		incentiveView.setViewName("incentive/viewIncentiveDetails");
		
		incentiveView.addObject("userName", username);
	    //return "leads/viewLeadDetails";
		return incentiveView;
	}
	
    
    //@RequestMapping(value = "/workload/displayIncentive", method = RequestMethod.GET)
    @RequestMapping(value = "/displayIncentive", method = RequestMethod.GET)
    public ModelAndView displayIncentive(@RequestParam("incentiveId") long incentiveId) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView displayIncentiveView = new ModelAndView();
    	displayIncentiveView.setViewName("incentive/DisplayIncentive");
    	UdnIncentiveEntity incentiveEntity = null;
		try {
			incentiveEntity = incentiveService.getIncentiveById(incentiveId).get();
			IncentiveObj incentiveObj =  new IncentiveObj();
			incentiveObj.updateIncentiveVoFromEntity(incentiveEntity);
			displayIncentiveView.addObject("INCENTIVE_OBJ", incentiveObj);
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return displayIncentiveView;
    }
   
    
    @RequestMapping(value = "/displayIncentiveModal", method = RequestMethod.GET)
    public ModelAndView displayIncentiveModal(@RequestParam("incentiveId") long incentiveId) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView displayIncentiveView = new ModelAndView();
    	displayIncentiveView.setViewName("incentive/viewIncentiveDetails_modal");
    	UdnIncentiveEntity incentiveEntity = null;
		try {
			incentiveEntity = incentiveService.getIncentiveById(incentiveId).get();
			IncentiveObj incentiveObj =  new IncentiveObj();
			incentiveObj.updateIncentiveVoFromEntity(incentiveEntity);
			incentiveObj.setClaimantName(userDetailsService.findUserByID(incentiveObj.getClaimantId()).getUsername());
			
			displayIncentiveView.addObject("INCENTIVE_OBJ", incentiveObj);
			Udn_Deals_Recorder_Entity dealEntity = dealService.find_DealEntityBy_Id(incentiveObj.getDealConfirmationId());
			Udn_Deals_Recorder_Obj dealObj = new Udn_Deals_Recorder_Obj(dealEntity);
			dealObj.setClientName(clientService.find_ClientBy_Id(dealObj.getClientId()).getClientName());
			displayIncentiveView.addObject("DEAL_OBJ", dealObj);
			
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return displayIncentiveView;
    }
    

   
    
    private List<IncentiveObj> generateFilteredIncentiveVo(List<UdnIncentiveEntity> incentiveEntityList) {
		List<IncentiveObj> filteredIncentiveVoList = new ArrayList<IncentiveObj>();
		
		Iterator incentiveIterator = incentiveEntityList.iterator();
		while(incentiveIterator.hasNext()) {
			UdnIncentiveEntity incentiveEntity = (UdnIncentiveEntity) incentiveIterator.next();
			try {
				Udn_Deals_Recorder_Entity dealEntity = dealService.find_DealEntityBy_Id(incentiveEntity.getDealConfirmationId());
				IncentiveObj incentiveVO = new IncentiveObj();
				incentiveVO.updateIncentiveVoFromEntity(incentiveEntity);
				incentiveVO.setGuestName((clientService.getClientById(dealEntity.getClientId()).getClientName()));
				incentiveVO.setClaimantName(userDetailsService.findUserByID(incentiveVO.getClaimantId()).getUsername());
				incentiveVO.setTravelStartDate(dealEntity.getTravelStartDate());
				incentiveVO.setTravelEndDate(dealEntity.getTravelEndDate());
				incentiveVO.setClaimStatusName(commonService.find_DealStatusById(incentiveVO.getStatus()).getWorkloadStatusShortName());
				
				filteredIncentiveVoList.add(incentiveVO);
			
			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		return filteredIncentiveVoList;
	}
    
    private List<IncentiveObj> generateFilteredIncentiveVo(Page<UdnIncentiveEntity> incentiveEntityList) {
		List<IncentiveObj> filteredIncentiveVoList = new ArrayList<IncentiveObj>();
		
		Iterator incentiveIterator = incentiveEntityList.iterator();
		while(incentiveIterator.hasNext()) {
			UdnIncentiveEntity incentiveEntity = (UdnIncentiveEntity) incentiveIterator.next();
			//System.out.println("Incentive Entity is " + incentiveEntity);
			try {
				Udn_Deals_Recorder_Entity dealEntity = dealService.find_DealEntityBy_Id(incentiveEntity.getDealConfirmationId());
				IncentiveObj incentiveVO = new IncentiveObj();
				incentiveVO.updateIncentiveVoFromEntity(incentiveEntity);
				incentiveVO.setGuestName((clientService.getClientById(dealEntity.getClientId()).getClientName()));
				incentiveVO.setClaimantName(userDetailsService.findUserByID(incentiveVO.getClaimantId()).getUsername());
				incentiveVO.setTravelStartDate(dealEntity.getTravelStartDate());
				incentiveVO.setTravelEndDate(dealEntity.getTravelEndDate());
				incentiveVO.setClaimStatusName(commonService.find_DealStatusById(incentiveVO.getStatus()).getWorkloadStatusShortName());
				filteredIncentiveVoList.add(incentiveVO);
			
			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		}
		return filteredIncentiveVoList;
	}
    
   
    
   
    
    @RequestMapping("adminIncentiveReport")
    public ModelAndView showAdminIncentiveSearchPage(@ModelAttribute("SEARCH_INCENTIVE") @Valid SearchIncentiveObj searchIncentiveObj) {
        UserDetailsObj userObj = getLoggedInUser();
        ModelAndView mapview = new ModelAndView();
    	mapview.addObject("userName", userObj.getUsername());
    	mapview.addObject("userId", userObj.getUserId());
    	mapview.setViewName("admin/incentive/AdminIncentiveReportSearch");
    	
    	List<UserDetailsObj> activeUsersList= userDetailsService.findAllActiveUsers();
 
    	mapview.addObject("ActiveUsersList", activeUsersList);
    	//SearchIncentiveObj searchIncentiveObj = new SearchIncentiveObj();
    	mapview.addObject("searchincentive", searchIncentiveObj);
    	//mapview.addObject("userRole", userObj.getRoles());
    	return mapview;
    }
    
    
    
    //@RequestMapping("/workload/IncentiveReport")
    @RequestMapping("/view_default_incentives_report")
    public ModelAndView view_default_incentives_report(@RequestParam(defaultValue = "0") Integer page,@RequestParam(defaultValue = "3") Integer pageSize, @RequestParam(defaultValue = "CreatedAt") String sortBy,@ModelAttribute("SEARCH_INCENTIVE") @Valid SearchIncentiveObj searchIncentiveObj, BindingResult result) {
        UserDetailsObj userObj = getLoggedInUser();
        searchIncentiveObj.setClaimantId(userObj.getUserId());
        ModelAndView mapview = new ModelAndView();
    	mapview.addObject("userName", userObj.getUsername());
    	mapview.addObject("userId", userObj.getUserId());
    	mapview.setViewName("incentive/IncentiveReportSearch");
    	searchIncentiveObj.setClaimStatus(UdanChooConstants.INCENTIVE_ANY_STATUS);
    	Date dateFrom = null;
    	Date dateTo = null ;
    	Calendar calender = Calendar.getInstance();
    	try {
    		if(searchIncentiveObj.getClaimToDate()==null) {
    			//calender.set(Calendar.DAY_OF_MONTH, 1);
    			calender.set(Calendar.DAY_OF_MONTH, calender.getActualMaximum(Calendar.DAY_OF_MONTH));
    			dateTo = calender.getTime();
				String strToDate = dateFilterFormat.format(dateTo); 
				searchIncentiveObj.setClaimToDate(strToDate);
			}else {
				dateTo = new SimpleDateFormat("yyyy-MM-dd").parse(searchIncentiveObj.getClaimToDate());
			}
    		
    		if(searchIncentiveObj.getClaimFromDate()==null) {
				//searchIncentiveObj.setClaimToDate(calender.getTime());
    			calender.set(Calendar.DAY_OF_MONTH, 1);
				//calender.add(Calendar.MONTH, -1);
				dateFrom = calender.getTime();
				String strFromDate = dateFilterFormat.format(dateFrom); 
				searchIncentiveObj.setClaimFromDate(strFromDate);
				
				
				/*calender.add(Calendar.MONTH, -1);
				dateFrom = calender.getTime();
				String strFromDate = dateFilterFormat.format(dateFrom); 
				searchIncentiveObj.setClaimFromDate(strFromDate);
				*/

				
			}else {
				dateFrom=new SimpleDateFormat("yyyy-MM-dd").parse(searchIncentiveObj.getClaimFromDate());
			}
    		
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//searchIncentiveObj.setClaimFromDate(calender.getTime());
		//List <UdnIncentiveEntity> udnIncentiveList = incentiveService.findDefaultIncentiveSearchRecords(dateFrom,dateTo);
		
		boolean isAdmin=false;
	    if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
	   		isAdmin=true;
	   		searchIncentiveObj.setClaimantId(0);
	   	}
		System.out.println("Incentive Object is " + searchIncentiveObj);
	    Page <UdnIncentiveEntity> udnIncentiveList = incentiveService.filterIncentiveRecord(page, UdanChooConstants.DEFAULT_PAGE_SIZE, sortBy, searchIncentiveObj, isAdmin);
		
		List <IncentiveObj> udnIncentiveListVO = generateFilteredIncentiveVo(udnIncentiveList);
		mapview.addObject("INCENTIVES_LIST", udnIncentiveListVO);
		List<UdnDealStatusVO> incentive_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_INCENTIVE_OBJ);
		Map<Integer, String> activeIncentiveStatusMap = (Map<Integer, String>) incentive_wl_statusList.stream().collect(
                Collectors.toMap(UdnDealStatusVO::getWorkloadStatusId, UdnDealStatusVO::getWorkloadStatusName));
		activeIncentiveStatusMap.put(0, "ALL");
		mapview.addObject("ACTIVE_INCENTIVE_STATUS", activeIncentiveStatusMap);

    	List<UserDetailsObj> activeUsersList = userDetailsService.findAllActiveUsers();
 		Map<Integer, String> activeUsersMap = (Map<Integer, String>) activeUsersList.stream().collect(
                 Collectors.toMap(UserDetailsObj::getUserId, UserDetailsObj::getUsername));
 		activeUsersMap.put(0, "ALL");
 		mapview.addObject("ACTIVE_USERS_MAP", activeUsersMap);
 		mapview.addObject("INCENTIVE_SEARCH_PERIOD_TYPE", UdanChooConstants.INCENTIVE_SEARCH_PERIOD_TYPE);
 		mapview.addObject("maxPages", udnIncentiveList.getTotalPages());
    	mapview.addObject("page", page);
    	mapview.addObject("sortBy", sortBy);
    	
 			
    	return mapview;
    }
    
    
    //@PostMapping("/workload/showIncentiveSearchReport")
    @RequestMapping(value="view_filter_incentives",method= {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView view_filter_incentives(@RequestParam(defaultValue = "0") Integer page,@RequestParam(defaultValue = "3") Integer pageSize, @RequestParam(defaultValue = "CreatedAt") String sortBy,@ModelAttribute("SEARCH_INCENTIVE") @Valid SearchIncentiveObj searchIncentiveObj, BindingResult result) {
    	pageSize = UdanChooConstants.DEFAULT_PAGE_SIZE;
    	UserDetailsObj userObj = getLoggedInUser();
        ModelAndView mapview = new ModelAndView();
    	mapview.addObject("userName", userObj.getUsername());
    	mapview.addObject("userId", userObj.getUserId());
    	//List <UdnIncentiveEntity> undIncentiveList = incentiveService.findIncentiveSearchRecords(searchIncentiveObj);
    	//mapview.addObject("incentiveList", undIncentiveList);
    	mapview.setViewName("incentive/IncentiveReportSearch");
    	boolean isAdmin=false;
	    if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
	   		isAdmin=true;
	   	}else {
	   		searchIncentiveObj.setClaimantId(userObj.getUserId());
	   	}
	    System.out.println("Incentive Object is " + searchIncentiveObj);
	    Page <UdnIncentiveEntity> udnIncentiveList = incentiveService.filterIncentiveRecord(page,pageSize,"createdAt",searchIncentiveObj,isAdmin);
    	List <IncentiveObj> udnIncentiveListVO = generateFilteredIncentiveVo(udnIncentiveList);
		mapview.addObject("INCENTIVES_LIST", udnIncentiveListVO);
    	List<UserDetailsObj> activeUsersList = userDetailsService.findAllActiveUsers();
 		Map<Integer, String> activeUsersMap = (Map<Integer, String>) activeUsersList.stream().collect(
                 Collectors.toMap(UserDetailsObj::getUserId, UserDetailsObj::getUsername));
 		activeUsersMap.put(0, "ALL");
 		mapview.addObject("ACTIVE_USERS_MAP", activeUsersMap);
 		List<UdnDealStatusVO> incentive_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_INCENTIVE_OBJ);
		Map<Integer, String> activeIncentiveStatusMap = (Map<Integer, String>) incentive_wl_statusList.stream().collect(
                Collectors.toMap(UdnDealStatusVO::getWorkloadStatusId, UdnDealStatusVO::getWorkloadStatusName));
		activeIncentiveStatusMap.put(0, "ALL");
		mapview.addObject("ACTIVE_INCENTIVE_STATUS", activeIncentiveStatusMap);
		mapview.addObject("INCENTIVE_SEARCH_PERIOD_TYPE", UdanChooConstants.INCENTIVE_SEARCH_PERIOD_TYPE);
    	
    	mapview.addObject("maxPages", udnIncentiveList.getTotalPages());
    	mapview.addObject("page", page);
    	mapview.addObject("sortBy", sortBy);
    	
    	return mapview;
    }
    
    /*
    @PostMapping("showAdminIncentiveSearchReport")
    public ModelAndView showAdminIncentiveSearchReport(@ModelAttribute("searchincentive") @Valid SearchIncentiveObj searchIncentiveObj, BindingResult result, ModelMap model) {
        UserDetailsObj userObj = getLoggedInUser();

        ModelAndView mapview = new ModelAndView();
    	mapview.addObject("userName", userObj.getUsername());
    	mapview.addObject("userId", userObj.getUserId());
    	
    	System.out.println("Selected User is " + searchIncentiveObj);
    	
    	List <UdnIncentiveEntity> undIncentiveList = incentiveService.findAdminIncentiveSearchRecordsByUser(searchIncentiveObj);
    	mapview.addObject("incentiveList", undIncentiveList);
    	
    	List<UserDetailsObj> activeUsersList= userDetailsService.findAllActiveUsers();
    	mapview.addObject("ActiveUsersList", activeUsersList);
    	
    	mapview.setViewName("admin/incentive/AdminSearchIncentiveResult");
    	//mapview.addObject("userRole", userObj.getRoles());
    	
    	System.out.println("Search Form values : " + searchIncentiveObj);
    	
    	return mapview;
    }
 
    */
    @RequestMapping(value = "form_view_editIncentive", method = RequestMethod.GET)
    public ModelAndView form_view_editIncentive(@RequestParam("incentiveId") long incentiveId) {
    	
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView();
    	modelView.setViewName("incentive/form_editIncentiveClaim");
    	UdnIncentiveEntity incentiveEntity = null;
		try {
			incentiveEntity = incentiveService.getIncentiveById(incentiveId).get();
			IncentiveObj incentiveObj = new IncentiveObj();
			incentiveObj.updateIncentiveVoFromEntity(incentiveEntity);
			incentiveObj.setClaimantName(userDetailsService.findUserByID(incentiveObj.getClaimantId()).getUsername());
			modelView.addObject("INCENTIVE_OBJ", incentiveObj);
			//System.out.println("Entity Details is "  + incentiveEntity);
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		List<UserDetailsObj> activeUsersList = userDetailsService.findAllActiveUsers();
 		Map<Integer, String> activeUsersMap = (Map<Integer, String>) activeUsersList.stream().collect(
                 Collectors.toMap(UserDetailsObj::getUserId, UserDetailsObj::getUsername));
 		modelView.addObject("ACTIVE_USERS_MAP", activeUsersMap);
 		
		List<UdnDealStatusVO> incentive_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_INCENTIVE_OBJ);
		Map<Integer, String> activeIncentiveStatusMap = (Map<Integer, String>) incentive_wl_statusList.stream().collect(
                Collectors.toMap(UdnDealStatusVO::getWorkloadStatusId, UdnDealStatusVO::getWorkloadStatusShortName));
		
		modelView.addObject("ACTIVE_INCENTIVE_STATUS", activeIncentiveStatusMap);
		
		
        return modelView;
    }
    
    @PostMapping(value="edit_edit_incentive_details")
    public ModelAndView edit_edit_incentive_details(@ModelAttribute("updateincentive") @Valid IncentiveObj incentiveObj, BindingResult result, final RedirectAttributes redirectAttrib) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView updateIncentiveView = new ModelAndView();
    	try {
			
    		System.out.println("Incentive Object is " + incentiveObj);
    		/*if(incentiveObj.getApprovedAmount()>0 &&  incentiveObj.getStatus()==) {
    			errors.rejectValue("sourceName", "city.error");
    		}
    		*/
    		
    		UdnIncentiveEntity incentiveEntity = new UdnIncentiveEntity(incentiveObj);
			
			incentiveEntity = incentiveService.createOrUpdateIncentive(incentiveEntity);
			if(incentiveObj.isNotifyClaimant()) {
				String emailTo = userDetailsService.findUserByID(incentiveObj.getClaimantId()).getEmail();
				String emailSubject ="Check Update on your Incentive Claim No. " + incentiveObj.getIncentiveId() + " | Deal Confirmation No. " + incentiveObj.getDealConfirmationId();
				String status = commonService.find_DealStatusById(incentiveObj.getStatus()).getWorkloadStatusShortName();
				String clientName = clientService.find_ClientBy_Id(dealService.find_DealEntityBy_Id(incentiveObj.getDealConfirmationId()).getClientId()).getClientName();
				String emailBody = " Dear Claimant \n There is an action taken on your Incentive Claim No." +incentiveObj.getIncentiveId() + " | Deal Confirmation No. " + incentiveObj.getDealConfirmationId() + " | Client Name: " + clientName + " | Current Status: " + status +".  \n\n Please login at Portal to check complete details. \n\n Thanks ";
				emailService.sendMail(emailTo,emailSubject, emailBody);
			}
			redirectAttrib.addFlashAttribute("Success","Incentive Details are updated Successfully!!");
			
    	} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			redirectAttrib.addFlashAttribute("Error","Error Updating Incentive. Please contact Administrator !! ");
		}
    	updateIncentiveView.addObject("userName", userObj.getUsername());
    	updateIncentiveView.addObject("userId", userObj.getUserId());
    	updateIncentiveView.setViewName("redirect:view_incentive_details?incentiveId="+incentiveObj.getIncentiveId());
    	return updateIncentiveView;
    	
    	
    }
    
    
    @RequestMapping(value = "/getDealInfo_For_Incentives", method = RequestMethod.GET)
	public @ResponseBody
	List<Tag> getDealInfo_For_Incentives(@RequestParam String dealKeyword) {
		UserDetailsObj user = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(user.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}

		List<Tag> result = new ArrayList<Tag>();
		List<Udn_Deals_Recorder_Obj> dealListResult;
		try {
			dealListResult = incentiveService.find_claimant_eligible_deals(dealKeyword,user.getUserId(),isAdmin);
			// iterate a list and filter by tagName
			for (Udn_Deals_Recorder_Obj dealObj : dealListResult) {
				Tag dealTag= new Tag();
				dealTag.setId((long) dealObj.getDealConfirmationId());
				dealTag.setTagName(dealObj.getDealConfirmationId() + "   |   " + dealObj.getClientName() + "   |   " + dealObj.getTravelingFromCity() + "   |   " + dealObj.getTravelingToCity() + "   |   TravDate - " + dealObj.getTravelStartDate());
				result.add(dealTag);
			}
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
