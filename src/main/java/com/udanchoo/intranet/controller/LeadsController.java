package com.udanchoo.intranet.controller;


import java.io.IOException;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.transaction.Transactional;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tts.communication.mode.vo.SMS;
import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;
import com.udanchoo.intranet.entity.UdnTeam;
import com.udanchoo.intranet.entity.Udn_Destinations_Entity;
import com.udanchoo.intranet.entity.Udn_Task_Comments_Entity;
import com.udanchoo.intranet.entity.Udn_Task_Recorder_Entity;
import com.udanchoo.intranet.entity.leads.TI_Leads_Followup_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.entity.quotation.Tg_Quotation_Recorder_Entity;
import com.udanchoo.intranet.model.ClientObj;
import com.udanchoo.intranet.model.EmailMessageVO;
import com.udanchoo.intranet.model.Mail;
import com.udanchoo.intranet.model.ReminderServiceObj;
import com.udanchoo.intranet.model.TTCommentsVO;
import com.udanchoo.intranet.model.Tg_B2bPartner_Obj;
import com.udanchoo.intranet.model.UdnDealStatusVO;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.leads.FilterLeadObj;
import com.udanchoo.intranet.model.leads.TI_Leads_Followup_VO;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.model.quotation.TgQuotationRecorderVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.EmailServiceImpl;
import com.udanchoo.intranet.service.LeadServiceImpl;
import com.udanchoo.intranet.service.ReminderServiceImpl;
import com.udanchoo.intranet.service.TgB2bPartnerServicesImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.util.UdanChooUtil;
import com.udanchoo.intranet.validator.FilterLeadValidator;
import com.udanchoo.intranet.validator.LeadValidator;

import freemarker.template.TemplateException;




@Controller
public class LeadsController {
	 
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
    private LeadValidator leadValidator;
	
	@Autowired
	LeadServiceImpl leadService;
	
	@Autowired
	TgB2bPartnerServicesImpl b2bPartnerService;
	
	@Autowired
	EmailServiceImpl emailService;

	@Autowired
	ClientServiceImpl clientService;

	@Autowired
	UserDetailsServiceImpl userService;

	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	FilterLeadValidator filterLeadValidator;
	
	
	
	@Value("${all.email.notify.communication.active}")
	private boolean emailNotifyActive;
	
	@Value("${email.client.valid}")
	private boolean emailClientNotifyActive;

	@Autowired
	ReminderServiceImpl reminderService;
	
	@Value("${COMPANY_NAME}")
	private String COMPANY_NAME;

    @RequestMapping("/form_register_newlead")
   	public ModelAndView form_register_newlead(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,BindingResult result) {
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	String username;
    	if (principal instanceof UserDetails) {
    	   username = ((UserDetails)principal).getUsername();
    	} else {
    	   username = principal.toString();
    	}
     	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
    	ModelAndView mapview = new ModelAndView("leads/form_RegisterNewLead");
    	mapview.addObject("userName", username);
    	mapview.addObject("userId", userObj.getUserId());
    	List<Tg_B2b_Partner_Entity> b2bActivePartnerList = b2bPartnerService.findAllActivePartners();
    	Map<Integer, String> partersMap = (Map<Integer, String>) b2bActivePartnerList.stream().collect(
                 Collectors.toMap(Tg_B2b_Partner_Entity::getPartnerId, Tg_B2b_Partner_Entity::getPartnerName));
    	 mapview.addObject("PARTNERS_MAP", partersMap);
    	
    	List<UserDetailsObj> activeUsersList = userDetailsService.findAllActiveUsers();
 		Map<Integer, String> activeUsersMap = (Map<Integer, String>) activeUsersList.stream().collect(
                 Collectors.toMap(UserDetailsObj::getUserId, UserDetailsObj::getUsername));
 		mapview.addObject("ACTIVE_USERS_MAP", activeUsersMap);
 		
    	 leadRecorderObj.setLeadStatus(UdanChooConstants.DEAL_FRESH_CREATED_LEAD_WL_STATUS);
    	 leadRecorderObj.setStatusName(commonService.find_DealStatusById(leadRecorderObj.getLeadStatus()).getWorkloadStatusName());
    	 mapview.addObject("userId", userObj.getUserId());
    	//mapview.addObject("userRole", userObj.getRoles());
    	return mapview;
    }

    
    @RequestMapping(value="form_view_editlead",method= {RequestMethod.GET,RequestMethod.POST})
    //@PostMapping("/form_view_editlead")
   	public ModelAndView form_view_editlead(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderVO,BindingResult result) {
    	ModelAndView modelView = form_register_newlead(leadRecorderVO,result);
    	Tg_Leads_Recorder_Entity tgLeadEntity = leadService.findLeadRecordById(leadRecorderVO.getLeadId());
    	leadRecorderVO.updateLeadVoFromEntity(tgLeadEntity);
		HashSet operatingTeam= new HashSet(); 
		tgLeadEntity.getTeam().forEach(e->operatingTeam.add(String.valueOf(e.getUserId())));
		leadRecorderVO.setOperatingTeams(operatingTeam);
    	List<Object> jsonList = new ArrayList();
		Iterator itr = leadRecorderVO.getOperatingTeams().iterator();
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
		leadRecorderVO.setTeamNames(arrayToJson);

    	
    	leadRecorderVO.setSourceName(commonService.findDestinationById(leadRecorderVO.getSource()).getCityName());
    	leadRecorderVO.setDestinationName(commonService.findDestinationById(leadRecorderVO.getDestination()).getCityName());
    	leadRecorderVO.setContactName(clientService.find_ClientBy_Id(leadRecorderVO.getContactId()).getClientName());
    	Tg_B2b_Partner_Entity b2bPartner =b2bPartnerService.findPartnerById(leadRecorderVO.getLeadSource()); 
    	leadRecorderVO.setLeadSourceShortName(b2bPartner.getPartnerShortName());
    	leadRecorderVO.setLeadSourceName(b2bPartner.getPartnerName());
    	
    	//TODO following db call is also done inside form_register_newlead as well. this can be reduced. Think it over. 
    	//leadRecorderVO.setStatusName(commonService.find_DealStatusById(leadRecorderVO.getLeadStatus()).getWorkloadStatusName());
    	List<UdnDealStatusVO> lead_wl_statusList = commonService.find_All_Active_Status_Deal_Obj(UdanChooConstants.WORKLOAD_LEAD_OBJ);
		Map<Integer, String> leadStatusMap = (Map<Integer, String>) lead_wl_statusList.stream().collect(
                Collectors.toMap(UdnDealStatusVO::getWorkloadStatusId, UdnDealStatusVO::getWorkloadStatusName));
		modelView.addObject("LEAD_STATUS_MAP", leadStatusMap);
		
		
    	modelView.setViewName("leads/form_EditLead");
    	return modelView;
    }
    
    
    @Transactional
	@PostMapping("create_create_lead")
	public ModelAndView create_create_lead(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,  BindingResult result,final RedirectAttributes redirectAttrib ) {
		UserDetailsObj userObj = getLoggedInUser();
		//leadRecorderObj.setLeadStatus(UdanChooConstants.LEAD_CLOSE_REASON.get(UdanChooConstants.LEAD_NEW));
		if(leadRecorderObj.getLeadOwner()==0) {
			leadRecorderObj.setLeadOwner(userObj.getUserId());
		}
		ModelAndView modelView = new ModelAndView();
		leadValidator.validate(leadRecorderObj, result);
		//System.out.println(leadRecorderObj);
		if(result.hasErrors()) {
			//modelView.setViewName("leads/form_RegisterNewLead");
			modelView = form_register_newlead(leadRecorderObj, result);
			//modelView.setViewName("forward:form_register_newlead");
			return modelView;
		}else {
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
			}
			//write email code here. 
		}
		return modelView; 
	 }

    private int notifyLeadCreationSms(TgLeadsRecorderVO leadRecorderObj) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ClientObj client = clientService.find_ClientBy_Id(leadRecorderObj.getContactId());
		Map<String, Object> smsValuesMap=new HashMap<String, Object>();
		smsValuesMap.put("CONTACT_NAME",client.getClientName());
		smsValuesMap.put("QueryId","Q-"+ leadRecorderObj.getLeadId()+ "-" + leadRecorderObj.getLeadSourceShortName());
		smsValuesMap.put("COMPANY_NAME",COMPANY_NAME);
		smsValuesMap.put("USER_NAME",userObj.getName());
		smsValuesMap.put("USER_MOBILE",userObj.getMobile());
		
		String message = UdanChooUtil.notificationMessagesList().getProperty(UdanChooConstants.QUERY_REGISTRATION_MSG);
		SMS smsMessage = new SMS();
		smsMessage.setTo(client.getMobile());
		smsMessage.setMessage(message);
		int returnCode =reminderService.sendSms(String.valueOf(smsMessage.getTo()),smsMessage.getMessage());	
	    return returnCode;
    }
    
    @Transactional
   	@PostMapping("edit_edit_lead")
   	public ModelAndView edit_edit_lead(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,  BindingResult result,final RedirectAttributes redirectAttrib ) {
   		UserDetailsObj userObj = getLoggedInUser();
   		//leadRecorderObj.setLeadStatus(UdanChooConstants.LEAD_CLOSE_REASON.get(UdanChooConstants.LEAD_NEW));
   		if(leadRecorderObj.getLeadOwner()==0) {
   			leadRecorderObj.setLeadOwner(userObj.getUserId());
   		}
   		ModelAndView modelView = new ModelAndView();
   		leadValidator.validate(leadRecorderObj, result);
   		if(result.hasErrors()) {
   			modelView = form_view_editlead(leadRecorderObj, result);
  			return modelView;
   		}else {
   			Tg_Leads_Recorder_Entity orgEntity = leadService.findLeadRecordById(leadRecorderObj.getLeadId());
   			long orgLeadOwner = orgEntity.getLeadOwner();
   			Tg_Leads_Recorder_Entity tgLeadEntity = new Tg_Leads_Recorder_Entity(leadRecorderObj);
   			long newLeadOwner = tgLeadEntity.getLeadOwner();
   			leadRecorderObj.getOperatingTeams().forEach((e) -> { 
    			UdnTeam userEntity = userService.findUserByID(Integer.parseInt(e));
    				tgLeadEntity.getTeam().add(userEntity);
    		});
   			
   			leadService.saveLead(tgLeadEntity);
   			redirectAttrib.addFlashAttribute("Success", "Lead Record is updated Successfully..");
   			modelView.setViewName("redirect:view_lead_details?leadId="+tgLeadEntity.getLeadId());
   			if(orgLeadOwner!=newLeadOwner) {
   				notifyLeadCreationTargetAudience(leadRecorderObj,"LeadAssignmentConfirmation.ftl",false,false);
   			}
   			if(leadRecorderObj.isNotifyAgain()) {
   				notifyLeadCreationTargetAudience(leadRecorderObj,"LeadUpdateConfirmation.ftl",false,true);
   				notifyLeadCreationSms(leadRecorderObj);
   			}
   			//write email code here. 
   		}
   		return modelView; 
   	 }
    
    
	@RequestMapping("view_lead_details_modal")
	public String view_lead_details_modal(@RequestParam long leadId, Model model){
		Tg_Leads_Recorder_Entity tgLeadEntity =leadService.findLeadRecordById(leadId);
		TgLeadsRecorderVO leadRecorderVO =leadService.getLeadVoFromEntity(tgLeadEntity);
		model.addAttribute("LEAD_OBJ",leadRecorderVO );
	    //return "leads/viewLeadDetails";
		return "leads/viewLeadDetails_modal";
	}

	@RequestMapping("view_lead_details")
	public String view_lead_details(@RequestParam long leadId, Model model){
		Tg_Leads_Recorder_Entity tgLeadEntity =leadService.findLeadRecordById(leadId);
		TgLeadsRecorderVO leadRecorderVO =leadService.getLeadVoFromEntity(tgLeadEntity);
		model.addAttribute("LEAD_OBJ",leadRecorderVO );
	    //return "leads/viewLeadDetails";
		return "leads/viewLeadDetails";
	}
	
	
	
	private void notifyLeadCreationTargetAudience(TgLeadsRecorderVO leadRecorderObj, String templateName,boolean isCreated,boolean markClient) {
		if(emailClientNotifyActive) {
			
			Mail mail = new Mail();
			String leadReferenceNumber = generateLeadReferenceNumber(leadRecorderObj);
			String guestDetails = constructGuestDetails(leadRecorderObj);
			String emailSubject = generateSubject(leadRecorderObj,guestDetails,leadReferenceNumber,isCreated);
			String servicesList = getServicesOptedList(leadRecorderObj);
			mail.setSubject(emailSubject);
			ClientObj client = clientService.find_ClientBy_Id(leadRecorderObj.getContactId());
			UdnTeam userObj = userService.findUserByID(leadRecorderObj.getLeadOwner());
			if(markClient) {
				mail.setTo(client.getEmail());
				mail.setCc(userObj.getEmail());
			}else {
				mail.setTo(userObj.getEmail());
			}
			mail.setCc(getLoggedInUser().getEmail());
			try {
		        Map<String, Object> model = new HashMap<String, Object>();
		        model.put("leadConfirmationNumber", leadReferenceNumber);
		        model.put("contactName",client.getClientName());
		        model.put("guestDetails", guestDetails);
		        
		        model.put("travelStartDate", leadRecorderObj.getTravelStartDate());
		        model.put("travelEndDate", leadRecorderObj.getTravelEndDate());
		        model.put("sourceName", leadRecorderObj.getSourceName());
		        model.put("destinationName", leadRecorderObj.getDestinationName());
		        model.put("Services", servicesList);
		        model.put("clientRemarks", leadRecorderObj.getClientRemarks());
		        model.put("serviceAdvisor", userObj.getName());
		        model.put("contactNumber", userObj.getMobile());
		        mail.setModel(model);
				emailService.sendEmailMessageUsingTemplate(mail,templateName);
			} catch (MessagingException | IOException | TemplateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			System.out.println("Email Notification DISABLE. ");
		}
	} 

	private String constructGuestDetails(TgLeadsRecorderVO leadRecorderObj){
		String guestDetails ="";
		if(leadRecorderObj.getAdults()>0) {
			guestDetails = guestDetails + leadRecorderObj.getAdults() + " Adults ";
		}
		if(leadRecorderObj.getChildren()>0) {
			guestDetails = guestDetails + leadRecorderObj.getChildren() + " Children " ;
			if(leadRecorderObj.getChildrenAgeInfo()!=null && leadRecorderObj.getChildrenAgeInfo().trim().length()>0) {
				if(leadRecorderObj.getChildrenAgeInfo().trim().length()>15) {
					guestDetails=guestDetails+"("+leadRecorderObj.getChildrenAgeInfo().trim().substring(0, 4) + "..)";
				}
				else {
					guestDetails =guestDetails + "("+leadRecorderObj.getChildrenAgeInfo().trim() +")";
				}
			}
		}
		
	return guestDetails;
	}	
	private String generateSubject(TgLeadsRecorderVO leadRecorderObj,String guestDetails,String leadReferenceNumber,boolean isCreated) {
		String emailSubject; 
		if(isCreated) {
			emailSubject = "Query Created with Query Id: " +leadReferenceNumber +" | "+ leadRecorderObj.getDestinationName() + " | " + guestDetails + " | " +  UdanChooUtil.getMonth(leadRecorderObj.getTravelStartDate().getMonth()) + "-" + (leadRecorderObj.getTravelStartDate().getYear()+1900)   ;
		}
		else {
			emailSubject = "Query Updated having Query Id: " +leadReferenceNumber +" | "+ leadRecorderObj.getDestinationName() + " | " + guestDetails + " | " +  UdanChooUtil.getMonth(leadRecorderObj.getTravelStartDate().getMonth()) + "-" + (leadRecorderObj.getTravelStartDate().getYear()+1900)   ;
		}
		return emailSubject;
	}
	
	private String generateLeadReferenceNumber(TgLeadsRecorderVO leadRecorderObj) {
		String leadId =leadRecorderObj.getLeadId().toString();
		if(leadRecorderObj.getLeadId().toString().length()<4) {
			leadId = String.format("%04d", leadRecorderObj.getLeadId());
		}
		leadRecorderObj.setLeadSourceShortName(b2bPartnerService.findPartnerById(leadRecorderObj.getLeadSource()).getPartnerShortName());
		String leadReferenceNumber = "Q-"+leadId+"-"+ leadRecorderObj.getLeadSourceShortName();
		return leadReferenceNumber;
	}
	
	private String getServicesOptedList(TgLeadsRecorderVO leadRecorderObj) {
		String servicesOpted = "";
		/*if(leadRecorderObj.isPackageWithFlight()) {
			servicesOpted = servicesOpted + "&bull; Package With Flight &nbsp;&nbsp;&nbsp; ";
		}
		if(leadRecorderObj.isPackageWithoutFlight()) {
			servicesOpted = servicesOpted + "&bull; Package Without Flight &nbsp;&nbsp;&nbsp; ";
		}
		*/
		if(leadRecorderObj.isLandPackage()) {
			servicesOpted = servicesOpted + "&bull; Package &nbsp;&nbsp;&nbsp; ";
		}
		if(leadRecorderObj.isFlight()) {
			servicesOpted = servicesOpted + "&bull; Flight &nbsp;&nbsp;&nbsp; ";
		}
		if(leadRecorderObj.isHotel()) {
			servicesOpted = servicesOpted + "&bull; Hotel &nbsp;&nbsp;&nbsp; ";
		}
		if(leadRecorderObj.isTransfers()) {
			servicesOpted = servicesOpted + "&bull; Transfers &nbsp;&nbsp;&nbsp;";
		}
		if(leadRecorderObj.isSightseeing()) {
			servicesOpted = servicesOpted + "&bull; SightSeeing &nbsp;&nbsp;&nbsp;";
		}
		if(leadRecorderObj.isVisa()) {
			servicesOpted = servicesOpted + "&bull; Visa &nbsp;&nbsp;&nbsp;";
		}
		if(leadRecorderObj.isInsurance()) {
			servicesOpted = servicesOpted + "&bull; Insurance &nbsp;&nbsp;&nbsp;";
		}
		if(leadRecorderObj.isCruise()) {
			servicesOpted = servicesOpted + "&bull; Cruise &nbsp;&nbsp;&nbsp;";
		}
		
		return servicesOpted;
	}
	
	
	@RequestMapping(value="view_test_modal",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView view_test_modal() {
		ModelAndView modelView = new ModelAndView("leads/testModal");
		return modelView;
	}
	 
	@RequestMapping(value="view_filter_leads",method= {RequestMethod.GET,RequestMethod.POST})
	public ModelAndView view_filter_leads( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "3") Integer pageSize, @RequestParam(defaultValue = "CreatedAt") String sortBy,@ModelAttribute("FILTER_LEAD_WL") FilterLeadObj filterObj,BindingResult result) {
		pageSize = UdanChooConstants.DEFAULT_PAGE_SIZE;
		ModelAndView modelView = new ModelAndView("leads/view_filterLeads");
		//System.out.println(filterObj);
		List<UdnDealStatusVO> lead_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_LEAD_OBJ);
		Map<Integer, String> leadStatusMap = (Map<Integer, String>) lead_wl_statusList.stream().collect(
                Collectors.toMap(UdnDealStatusVO::getWorkloadStatusId, UdnDealStatusVO::getWorkloadStatusName));
		modelView.addObject("LEAD_STATUS_MAP", leadStatusMap);
		
		List<Tg_B2b_Partner_Entity> b2bActivePartnerList = b2bPartnerService.findAllActivePartners();
		Map<Integer, String> partersMap = (Map<Integer, String>) b2bActivePartnerList.stream().collect(
                Collectors.toMap(Tg_B2b_Partner_Entity::getPartnerId, Tg_B2b_Partner_Entity::getPartnerName));
		modelView.addObject("PARTNERS_MAP", partersMap);
		
		List<UserDetailsObj> activeUsersList = userDetailsService.findAllActiveUsers();
		Map<Integer, String> activeUsersMap = (Map<Integer, String>) activeUsersList.stream().collect(
                Collectors.toMap(UserDetailsObj::getUserId, UserDetailsObj::getUsername));
		modelView.addObject("ACTIVE_USERS_MAP", activeUsersMap);
		
		filterLeadValidator.validate(filterObj, result);
		if(result.hasErrors()) {
			System.out.println("error is " + result);
			return modelView; 
		}
		UserDetailsObj user = getLoggedInUser();
		
		
		//filterObj.setLeadOwner(user.getUserId());
	   	
		boolean isAdmin=false;
	    if(user.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN") || a.getAuthority().equals("LEAD_MANAGER"))) {
	   		isAdmin=true;
	   	}
	   
	    //System.out.println("Lead Filter Owner is " + filterObj.getLeadOwner());
	    
	    if((!isAdmin) && filterObj.getLeadOwner()==0) {
	    	filterObj.setLeadOwner(user.getUserId());
	    }
	    
		//TODO Check if some one changes the url manually then it should lead to an error page. not to a server error. 
		int pageNum = Integer.parseInt(page);
		Page<Tg_Leads_Recorder_Entity> pageLeadsFilteredRecords = leadService.filterLeads(pageNum, pageSize, filterObj.getLeadOwner(), sortBy, filterObj, isAdmin);
		List<TgLeadsRecorderVO> filteredLeadsVoList = generateFilteredLeadsVo(pageLeadsFilteredRecords);
		modelView.addObject("FILTERED_LEADS_RECORDS",filteredLeadsVoList);
		modelView.addObject("maxPages", pageLeadsFilteredRecords.getTotalPages());
		modelView.addObject("page", pageNum);
		modelView.addObject("sortBy", sortBy);
		modelView.addObject("leadStatus", filterObj.getLeadStatus());
		/*
		Page<Udn_Deal_FLT_SL_Entity> pageFlightServiceLine = null;
		if(filterObj.getClientId()==0 && filterObj.getStatusId()==0 && (filterObj.getDateFrom()==null || filterObj.getDateFrom().trim().length()==0) && (filterObj.getDateTo()==null || filterObj.getDateTo().trim().length()==0)  ) {
				pageFlightServiceLine = queueService.findByCreatedAtAfter_BasedOn_Owner(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, user.getUserId(),sortBy,isAdmin);
		}else {
			pageFlightServiceLine = queueService.searchFlightSLSortByCNameBySLOwner(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, user.getUserId(),sortBy,filterObj.getClientId(),filterObj.getStatusId(),filterObj,isAdmin);
		}
		
		List flt_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_FLT_SL_OBJ);
		
		List<FlightServiceLineVO> fltSlVo = generateFLT_SL_Vo(pageFlightServiceLine);
		//PagedListHolder<Udn_Deal_FLT_SL_Entity> pagedListHolder = new PagedListHolder<Udn_Deal_FLT_SL_Entity>(listFlightServiceLine);
		//pagedListHolder.setPageSize(2);
		modelView.addObject("FLT_PAGE_LIST", fltSlVo);
		modelView.addObject("FLT_SL_STATUS_LIST", flt_sl_wl_statusList);
		modelView.addObject("maxPages", pageFlightServiceLine.getTotalPages());
		modelView.addObject("page", pageNum);
		modelView.addObject("sortBy", sortBy);
		modelView.addObject("clientId", filterObj.getClientId());
		modelView.addObject("statusId", filterObj.getStatusId());
		modelView.addObject("dateFrom", filterObj.getDateFrom());
		modelView.addObject("dateTo", filterObj.getDateTo());
		*/
		return modelView;
	}
	
	private List<TgLeadsRecorderVO> generateFilteredLeadsVo(Page<Tg_Leads_Recorder_Entity> pagedResult) {
		List<TgLeadsRecorderVO> filteredLeadsVoList = new ArrayList<TgLeadsRecorderVO>();
		List<Tg_Leads_Recorder_Entity> leadsEntityList = pagedResult.getContent();
		Iterator filteredLeadsIterator = leadsEntityList.iterator();
		while(filteredLeadsIterator.hasNext()) {
			Tg_Leads_Recorder_Entity leadEntity = (Tg_Leads_Recorder_Entity) filteredLeadsIterator.next();
			TgLeadsRecorderVO leadsVO =leadService.getLeadVoFromEntity(leadEntity);
			filteredLeadsVoList.add(leadsVO);
		}
		return filteredLeadsVoList;
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

	
	@ResponseBody
	@RequestMapping("getLeadRecordById")
    public TgLeadsRecorderVO findLeadByID(@RequestParam("leadId") int leadId) {
		
		TgLeadsRecorderVO tgLeadVo = new TgLeadsRecorderVO();
		Tg_Leads_Recorder_Entity leadEntity = leadService.findLeadRecordById(leadId); 
		
		if(leadEntity==null) {
			return tgLeadVo;
		}
		tgLeadVo.updateLeadVoFromEntity(leadEntity); 
		return tgLeadVo;
	}
	
	
	@RequestMapping("/form_view_lead_followup_details")
	public ModelAndView form_view_lead_followup_details(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("LEAD_FOLLOWUP_OBJ") TI_Leads_Followup_VO leadFollowupVO,BindingResult result) {
		ModelAndView modelView = new ModelAndView("leads/viewLeadFollowupDetails");
    	int DEFAULT_PAGE_NUM=leadFollowupVO.getPage();
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
		
		//UdanChooConstants.DEFAULT_PAGE_SIZE
		
		Page<TI_Leads_Followup_Entity> pageListFollowUpRecords = leadService.filterLeadFollowupDetails(DEFAULT_PAGE_NUM,UdanChooConstants.DEFAULT_PAGE_SIZE,leadRecorderObj.getLeadId(),leadFollowupVO.getSortBy(),leadFollowupVO.getSortOrder());
		List<TI_Leads_Followup_VO> leadsFollowUpList = generateListFollowUpVo(pageListFollowUpRecords);

		modelView.addObject("LEADS_FOLLOWUP_LIST",leadsFollowUpList);
		modelView.addObject("maxPages", pageListFollowUpRecords.getTotalPages());
		modelView.addObject("page", DEFAULT_PAGE_NUM);
		modelView.addObject("sortBy", leadFollowupVO.getSortBy());

		
		/*Tg_Quotation_Recorder_Entity quotationEntity= quotationService.findQuotationRecordById(qtnRecorderObj.getQuotationId());
		qtnRecorderObj.setVoFromEntity(quotationEntity);
		qtnRecorderObj.setLeadEntity(tgLeadEntity);
		*/
		return modelView;
	}
	
	  private List<TI_Leads_Followup_VO> generateListFollowUpVo(Page<TI_Leads_Followup_Entity> pageListFollowUpRecords) {
			List<TI_Leads_Followup_VO> filteredLeadsFollowUpVoList = new ArrayList<TI_Leads_Followup_VO>();
			List<TI_Leads_Followup_Entity> leadsFollowUpEntityList = pageListFollowUpRecords.getContent();
			Iterator filteredLeadsFollowUpIterator = leadsFollowUpEntityList.iterator();
			while(filteredLeadsFollowUpIterator.hasNext()) {
				TI_Leads_Followup_Entity leadsFollowUpEntity = (TI_Leads_Followup_Entity) filteredLeadsFollowUpIterator.next();
				TI_Leads_Followup_VO leadsFollowUpVO = new TI_Leads_Followup_VO();
				leadsFollowUpVO.setUserName(userDetailsService.findUserByID(leadsFollowUpEntity.getUpdatedBy()).getUsername());
				leadsFollowUpVO.setFormattedFollowUpTime(DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm").format(leadsFollowUpEntity.getFollowuptime()));
				leadsFollowUpVO.setFormattedNextFollowUpTime(DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm").format(leadsFollowUpEntity.getNextfollowuptime()));
				leadsFollowUpVO.setResponse(leadsFollowUpEntity.getResponse());
				leadsFollowUpVO.setNextactionplan(leadsFollowUpEntity.getNextactionplan());
				filteredLeadsFollowUpVoList.add(leadsFollowUpVO);
			}
			return filteredLeadsFollowUpVoList;
	}


	@Transactional
		@PostMapping("create_create_lead_followup")
		public ModelAndView create_create_lead_followup(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("LEAD_FOLLOWUP_OBJ") TI_Leads_Followup_VO leadFollowupVO,  BindingResult result,final RedirectAttributes redirectAttrib ) {
			UserDetailsObj userObj = getLoggedInUser();
			leadFollowupVO.setUpdatedBy(userObj.getUserId());
			ModelAndView modelView = new ModelAndView();
			Tg_Leads_Recorder_Entity leadEntity = leadService.findLeadRecordById(leadRecorderObj.getLeadId());
			TI_Leads_Followup_Entity tiLeadFollowupEntity = new TI_Leads_Followup_Entity(leadFollowupVO);
			tiLeadFollowupEntity.setLeadEntity(leadEntity);
			leadEntity.getLeadFollowupEntityList().add(tiLeadFollowupEntity);
			leadService.saveLead(leadEntity);

			 
			String clientName = clientService.find_ClientBy_Id(leadEntity.getContactId()).getClientName();
			String destinationName = commonService.findDestinationById(leadEntity.getDestination()).getCityName();
			String emailBody = "Action by:  " +  userObj.getUsername() + "\n";
			emailBody = emailBody + "Action Time: " +  DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm").format(leadFollowupVO.getFollowuptime()) + "\n";
			emailBody = emailBody + "Action Taken: " + leadFollowupVO.getResponse() + "\n\n";
			//emailBody = emailBody + "************ Next Action ***************  " + "\n" ;
			emailBody = emailBody + "Next Action Time: " +  DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm").format(leadFollowupVO.getNextfollowuptime()) + "\n";
			emailBody = emailBody + "Action To Be Taken: " + leadFollowupVO.getNextactionplan() + "\n";
			
			Mail mail = new Mail();
			mail.setSubject("Lead Followup Update: " + " Lead ID: " +leadRecorderObj.getLeadId() + " | Client : " + clientName + " | Destination: " + destinationName);
			 
			ArrayList<String> notifierList = leadEntity.getTeam().stream()
		                .map(obj -> obj.getEmail()) // Replace with the actual method to get the string attribute
		                .collect(Collectors.toCollection(ArrayList::new));
			EmailMessageVO emailMessageVo = new EmailMessageVO();
			notifierList.add(userDetailsService.findUserByID(leadEntity.getLeadOwner()).getEmail());
			emailMessageVo.setEmailToValidatedList(notifierList);
			InternetAddress[] emailToList = new InternetAddress[emailMessageVo.getEmailToValidatedList().size()];
			try {
				for (int i = 0; i < emailMessageVo.getEmailToValidatedList().size(); i++) {
					emailToList[i] = new InternetAddress((String) emailMessageVo.getEmailToValidatedList().get(i));
					//redirectAttrib.addFlashAttribute("Error","Error: While sending email. Recipients setting error.<br> Please send individually or contact adminstrator.");
		    	}
			}
			catch(AddressException ae) {
				ae.printStackTrace();
			}
			mail.setToList(emailToList);
			try {
				emailService.sendEmailMessage_Notification1_MultipleRecipients_from_loggedInUser(mail, emailBody, userObj.getEmail());
			
			} catch (MessagingException | IOException | TemplateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			redirectAttrib.addFlashAttribute("Success", "Lead Followup Status is updated Successfully..");
			modelView.setViewName("redirect:form_view_lead_followup_details?leadId="+leadRecorderObj.getLeadId());
			
			//below is the temporary code and need to be deleted and uncomment the saveLead part. 
			//tgLeadEntity.setLeadId(7l);
			/*leadService.saveLead(tgLeadEntity);
			leadRecorderObj.setLeadId(tgLeadEntity.getLeadId());
			redirectAttrib.addFlashAttribute("Success", "Lead Record is updated Successfully..");
			modelView.setViewName("redirect:view_lead_details?leadId="+tgLeadEntity.getLeadId());
			if(leadRecorderObj.isLeadCreationClientInformed()) {
				notifyLeadCreationTargetAudience(leadRecorderObj,"LeadCreateConfirmation.ftl",true,true);
				notifyLeadCreationSms(leadRecorderObj);
			}*/
			//write email code here. 
			return modelView; 
		 }
	 
	
}

