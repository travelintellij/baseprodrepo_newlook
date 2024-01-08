package com.udanchoo.intranet.controller;


import java.io.IOException;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.mail.MessagingException;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
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

import com.udanchoo.intranet.entity.UdnTeam;
import com.udanchoo.intranet.entity.Udn_Ticket_Comments_Entity;
import com.udanchoo.intranet.entity.Udn_Ticket_Recorder_Entity;
import com.udanchoo.intranet.model.ClientObj;
import com.udanchoo.intranet.model.FilterTicketObj;
import com.udanchoo.intranet.model.Mail;
import com.udanchoo.intranet.model.TTCommentsVO;
import com.udanchoo.intranet.model.Udn_Task_Recorder_Obj;
import com.udanchoo.intranet.model.Udn_Ticket_Recorder_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.EmailServiceImpl;
import com.udanchoo.intranet.service.TicketServiceImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.validator.TicketValidator;

import freemarker.template.TemplateException;




@Controller
public class TicketController {
	 
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
	TicketServiceImpl ticketService;
	
	@Autowired
	EmailServiceImpl emailService;

	@Value("${all.email.notify.communication.active}")
	private boolean emailNotifyActive;
	
	@Value("${email.client.valid}")
	private boolean emailClientNotifyActive;
		
	@Autowired
    private TicketValidator validator;

	@Autowired
	ClientServiceImpl clientService;

	
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
	
	 //@RequestMapping("/workload/view_create_ticket_form_user")
	@RequestMapping("/view_create_ticket_form_user")
	 public ModelAndView view_create_ticket_form_user(@ModelAttribute("TICKET_RECORDER") Udn_Ticket_Recorder_Obj ticketRecorder,  BindingResult result) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView mapview = new ModelAndView(); 
		mapview.setViewName("ticket/form_createTicket");
		
    	List<UserDetailsObj> activeUsersList = userDetailsService.findAllActiveUsers();
 		Map<Integer, String> activeUsersMap = (Map<Integer, String>) activeUsersList.stream().collect(
                 Collectors.toMap(UserDetailsObj::getUserId, UserDetailsObj::getUsername));
 		mapview.addObject("ACTIVE_USERS_MAP", activeUsersMap);

		
		//List<UserDetailsObj> activeUsersList= userDetailsService.findAllActiveUsers();
    	
		mapview.addObject("ACTIVE_USERS_MAP", activeUsersMap);
    	mapview.addObject("TICKET_PRIORITY", UdanChooConstants.TICKET_PRIORITY);
    	mapview.addObject("TICKET_STATUS", UdanChooConstants.TICKET_STATUS);
		return mapview;
	 }

	 //@PostMapping("/workload/create_create_ticket_form_user")
	@PostMapping("/create_create_ticket_form_user")
	 public ModelAndView create_create_ticket_form_user(@ModelAttribute("TICKET_RECORDER") Udn_Ticket_Recorder_Obj ticketRecorderObj,  BindingResult result) {
		UserDetailsObj userObj = getLoggedInUser();
		ticketRecorderObj.setTicketCreator(userObj.getUserId());
		ModelAndView mapview = null;
		validator.validate(ticketRecorderObj, result);
		if(result.hasErrors()) {
			//mapview = new ModelAndView("forward:view_create_ticket_form_user");
			mapview  = view_create_ticket_form_user(ticketRecorderObj,result);
    		//result.rejectValue("dealName", "invalid.dealName", "Error: Invalid Deal Association");
    		System.out.println("Error While Crating ticket is " + result);
			return mapview; 
    	}
		//mapview.setViewName("forward:view_open_ticket_form_user");
		try {
			Udn_Ticket_Recorder_Entity ticketEntity = new Udn_Ticket_Recorder_Entity(ticketRecorderObj);
			ticketService.saveTicket(ticketEntity);
			ticketRecorderObj.updateVoFromEntity(ticketEntity);
			if(ticketRecorderObj.isNotifyTicketOwner()) {
				ticketRecorderObj.setTicketId(ticketEntity.getTicketId());
				String emailSubject = "Your ticket '" + ticketRecorderObj.getTicketTitle() +  "' is created with Ticket Id < " + ticketRecorderObj.getTicketId() +" >";
				notifyTicketTargetAudience(ticketRecorderObj, "TicketCreated.ftl",emailSubject);
			}
			mapview = view_open_ticket_form_user("0","UpdatedAt",new FilterTicketObj(),null) ;
			mapview.addObject("Success","Ticket is updated successfully");
		}
		catch(Exception exp) {
			mapview.addObject("Error","Error: Updating Ticket !!.Please contact administrator.  ");
			exp.printStackTrace();
		}
		return mapview;
	 }

	private void notifyTicketTargetAudience(Udn_Ticket_Recorder_Obj ticketRecorderObj,String templateName,String emailSubject) {
		if(emailNotifyActive && emailClientNotifyActive) {
			UdnTeam ticketCreator = userDetailsService.findUserByID(ticketRecorderObj.getTicketCreator());
			UdnTeam ticketOwner = userDetailsService.findUserByID(ticketRecorderObj.getTicketOwner());
			Mail mail = new Mail();
			mail.setSubject(emailSubject);
			//Udn_Ticket_Recorder_Obj
			ClientObj client = null;
			if(ticketRecorderObj.getClientId()!=0) {
				client = clientService.find_ClientBy_Id(ticketRecorderObj.getClientId());
			}
			else if(ticketRecorderObj.getDealConfirmationId()!=0) {
				client = clientService.find_ClientByDealConfirmationId(ticketRecorderObj.getDealConfirmationId());
			}
			if(client!=null) {
				mail.setTo(client.getEmail());
				mail.setCc(ticketCreator.getEmail());
				mail.setCc(ticketOwner.getEmail());
				try {
			        Map<String, Object> model = new HashMap<String, Object>();
			        model.put("ticketOwner", ticketOwner.getName());
			        model.put("ticketCreator",ticketCreator.getName());
			        model.put("ticketId", ticketRecorderObj.getTicketId());
			        model.put("ticketTitle", ticketRecorderObj.getTicketTitle());
			        model.put("clientName", client.getClientName());
			        model.put("status", ticketRecorderObj.getTicketStatus());
			        model.put("ticketOwnerEmail", ticketOwner.getEmail());
			        model.put("username", ticketRecorderObj.getPlaceHolder1());
			        mail.setModel(model);
					emailService.sendEmailMessageUsingTemplate(mail,templateName);
				
				} catch (MessagingException | IOException | TemplateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		else {
			System.out.println("Email Notification DISABLE. ");
		}
		
	}
	 
	
	private void notifyTicketCommentsTargetAudience(Udn_Ticket_Recorder_Obj ticketRecorderObj,String templateName,String emailSubject) {
		if(emailNotifyActive) {
			UdnTeam ticketCreator = userDetailsService.findUserByID(ticketRecorderObj.getTicketCreator());
			UdnTeam ticketOwner = userDetailsService.findUserByID(ticketRecorderObj.getTicketOwner());
			Mail mail = new Mail();
			mail.setSubject(emailSubject);
			mail.setTo(ticketOwner.getEmail());
			mail.setCc(ticketCreator.getEmail());
			try {
		        Map<String, Object> model = new HashMap<String, Object>();
		        model.put("ticketOwner", ticketOwner.getName());
		        model.put("ticketCreator",ticketCreator.getName());
		        model.put("ticketId", ticketRecorderObj.getTicketId());
		        model.put("ticketTitle", ticketRecorderObj.getTicketTitle());
		        model.put("status", ticketRecorderObj.getTicketStatus());
		        model.put("ticketOwnerEmail", ticketOwner.getEmail());
		        model.put("username", ticketRecorderObj.getPlaceHolder1());
		        model.put("ticketComment", ticketRecorderObj.getTicketComment());
		        mail.setModel(model);
				emailService.sendEmailMessageUsingTemplate(mail,templateName);
			} catch (MessagingException | IOException | TemplateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	 
	 
	//@RequestMapping("/workload/view_open_ticket_form_user")
	@RequestMapping("/view_open_ticket_form_user")
	public ModelAndView view_open_ticket_form_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TICKET_FILTER_OBJ") FilterTicketObj ticketFilter,  BindingResult result) {
		UserDetailsObj userObj = getLoggedInUser();
		int pageNum = Integer.parseInt(page);
		ModelAndView mapview = new ModelAndView(); 
		mapview.setViewName("ticket/view_openTicket");
		Page<Udn_Ticket_Recorder_Entity> ticketPageResult = ticketService.searchTickets(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, userObj.getUserId(), sortBy,ticketFilter);
		List<Udn_Ticket_Recorder_Obj> ticketListObj = generateVo(ticketPageResult);
		mapview.addObject("OPEN_TICKET_LIST", ticketListObj);

		List<UserDetailsObj> activeUsersList= userDetailsService.findAllActiveUsers();
		mapview.addObject("ACTIVE_USERS_LIST", activeUsersList);
    	mapview.addObject("TICKET_PRIORITY", UdanChooConstants.TICKET_PRIORITY);
    	mapview.addObject("TICKET_STATUS", UdanChooConstants.TICKET_STATUS);
    	mapview.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm"));
    	mapview.addObject("page", pageNum);
    	mapview.addObject("maxPages", ticketPageResult.getTotalPages());
    	mapview.addObject("sortBy", sortBy);
    	mapview.addObject("dateFrom", ticketFilter.getDateFrom());
    	mapview.addObject("dateTo", ticketFilter.getDateTo());
    	mapview.addObject("ticketOwner",ticketFilter.getTicketOwner());
    	mapview.addObject("dealConfirmationId",ticketFilter.getDealConfirmationId());
    	mapview.addObject("ticketPriority",ticketFilter.getTicketPriority());
		return mapview;
	 }
	 
	 private List<Udn_Ticket_Recorder_Obj> generateVo(Page<Udn_Ticket_Recorder_Entity> ticketPage) {
		 
		 List<Udn_Ticket_Recorder_Obj> ticketObjList = new ArrayList<Udn_Ticket_Recorder_Obj>();
			List<Udn_Ticket_Recorder_Entity> ticketEntityList = ticketPage.getContent();
			Iterator itrTicketList = ticketEntityList.iterator();
			while(itrTicketList.hasNext()){
				Udn_Ticket_Recorder_Obj ticketObj = new Udn_Ticket_Recorder_Obj((Udn_Ticket_Recorder_Entity)itrTicketList.next());
				ticketObj.setTicketCreatorName(userDetailsService.findUserByID(ticketObj.getTicketCreator()).getName());
				ticketObj.setTicketOwnerName(userDetailsService.findUserByID(ticketObj.getTicketOwner()).getName());
				if(ticketObj.getClientId()!=0) {
					ticketObj.setClientName(clientService.find_ClientBy_Id(ticketObj.getClientId()).getClientName());	
				}
				
				ticketObjList.add(ticketObj);
			}
		return ticketObjList; 
	}

    //@RequestMapping(value="/workload/view_view_ticket")
	 @RequestMapping(value="/view_view_ticket")
    public ModelAndView view_view_ticket(@RequestParam("ticketId") long ticketId,@ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketObj,  BindingResult result) {
		UserDetailsObj userObj = getLoggedInUser();
     	int DEFAULT_PAGE_NUM=ticketObj.getPage();
     	int DEFAULT_PAGE_SIZE=3;
     	String DEFAULT_SORTING="UpdatedAt";

    	ModelAndView modelView = new ModelAndView();
    	 
    	Optional<Udn_Ticket_Recorder_Entity> ticketEntity = ticketService.find_ticket_ById(ticketId);
    	if(ticketEntity.isPresent()) {
    		//Udn_Ticket_Recorder_Obj ticketObj = new Udn_Ticket_Recorder_Obj(ticketEntity.get());
    		ticketObj.updateVoFromEntity(ticketEntity.get());
    		ticketObj.setTicketOwnerName(userDetailsService.findUserByID(ticketObj.getTicketOwner()).getName());
    		if(ticketObj.getClientId()!=0) {
    			ticketObj.setClientName(clientService.find_ClientBy_Id(ticketObj.getClientId()).getClientName());
    		}
    		//modelView.addObject("TICKET_OBJ", ticketObj);
    		Page<Udn_Ticket_Comments_Entity> pageTicketCommentsRecords = ticketService.searchTicketComments(DEFAULT_PAGE_NUM,DEFAULT_PAGE_SIZE,ticketId,DEFAULT_SORTING);
    		List<TTCommentsVO> ticketCommentsList = generateTicketCommentsVo(pageTicketCommentsRecords);

    		modelView.addObject("FILTERED_TICKET_COMMENTS",ticketCommentsList);
    		modelView.addObject("maxPages", pageTicketCommentsRecords.getTotalPages());
    		modelView.addObject("page", DEFAULT_PAGE_NUM);
    		modelView.addObject("sortBy", DEFAULT_SORTING);

    		
    	}
    	else {
    		modelView.addObject("ERROR", "Error: Invalid Ticket Id Provided. " );
    	}
    	modelView.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm"));
    	modelView.addObject("VIEW_SOURCE","OPEN_TICKET");
    	
    	modelView.setViewName("ticket/view_Ticket");
    	return modelView;
    }
	 
	private List<TTCommentsVO> generateTicketCommentsVo(Page<Udn_Ticket_Comments_Entity> pagedResult) {
		List<TTCommentsVO> filteredCommentsVoList = new ArrayList<TTCommentsVO>();
		List<Udn_Ticket_Comments_Entity> ticketCommentsEntityList = pagedResult.getContent();
		Iterator filteredTicketCommentIterator = ticketCommentsEntityList.iterator();
		while(filteredTicketCommentIterator.hasNext()) {
			Udn_Ticket_Comments_Entity ticketCommentEntity = (Udn_Ticket_Comments_Entity) filteredTicketCommentIterator.next();
			TTCommentsVO commentsVO = new TTCommentsVO();
			commentsVO.setCommentedBy(userDetailsService.findUserByID(ticketCommentEntity.getUpdatedBy()).getUsername());
			commentsVO.setCommentId(ticketCommentEntity.getTicketCommentId());
			commentsVO.setTtComment(ticketCommentEntity.getTicketComment());
			commentsVO.setLastUpdated(ticketCommentEntity.getUpdatedAt().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime());
			filteredCommentsVoList.add(commentsVO);
		}
		return filteredCommentsVoList;
	}

	
    @RequestMapping(value="/view_form_edit_ticket_req")
    public ModelAndView view_form_edit_ticket_req(@RequestParam("ticketId") long ticketId, @ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketRecorderObj,  BindingResult result) {
    	return view_form_edit_ticket(ticketId, ticketRecorderObj, result); 
    }


    //@RequestMapping(value="/workload/view_form_edit_ticket")
	 //@RequestMapping(value="/view_form_edit_ticket")
	 @RequestMapping(value="view_form_edit_ticket",method= {RequestMethod.GET,RequestMethod.POST},params = "Edit")
	 public ModelAndView view_form_edit_ticket(@RequestParam("ticketId") long ticketId,@ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_view_ticket(ticketId,ticketRecorderObj,result);

    	List<UserDetailsObj> activeUsersList= userDetailsService.findAllActiveUsers();
    	Map<Integer, String> activeUsersMap = (Map<Integer, String>) activeUsersList.stream().collect(
                 Collectors.toMap(UserDetailsObj::getUserId, UserDetailsObj::getUsername));
 		modelView.addObject("ACTIVE_USERS_MAP", activeUsersMap);


		//modelView.addObject("ACTIVE_USERS_LIST", activeUsersList);
		
		
		modelView.addObject("TICKET_PRIORITY_MAP", UdanChooConstants.TICKET_PRIORITY_MAP);
		modelView.addObject("TICKET_STATUS", UdanChooConstants.TICKET_STATUS);
		
		modelView.addObject("VIEW_SOURCE","OPEN_TICKET");
    	modelView.setViewName("ticket/edit_Ticket");
    	return modelView;
    }
	 
    @Transactional
    @RequestMapping(value="view_form_edit_ticket",method= {RequestMethod.GET,RequestMethod.POST},params = "Update Comments")
	public ModelAndView update_update_comments(@ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketObj, BindingResult result,final RedirectAttributes redirectAttrib ) {
    	UserDetailsObj userObj = getLoggedInUser();
    	int DEFAULT_PAGE_NUM=0;
    	int DEFAULT_PAGE_SIZE=4;
    	String DEFAULT_SORTING="UpdatedAt";
    	//ModelAndView modelView = view_view_task(taskObj.getTaskId(),taskObj,result);
		Udn_Ticket_Recorder_Entity ticketEntity = ticketService.find_ticket_ById(ticketObj.getTicketId()).get();
    	Udn_Ticket_Comments_Entity ticketCommentEntity = new Udn_Ticket_Comments_Entity();
    	ticketCommentEntity.setTicketComment(ticketObj.getTicketComment());
    	ticketCommentEntity.setUpdatedBy(userObj.getUserId());
    	ticketCommentEntity.setTicketEntity(ticketEntity);
		ticketEntity.getTicketCommentsEntityList().add(ticketCommentEntity);
		ticketService.saveTicket(ticketEntity);
		
		ticketObj.setPlaceHolder1(userObj.getUsername());
		ticketObj.updateVoFromEntity(ticketEntity);
		notifyTicketCommentsTargetAudience(ticketObj,  UdanChooConstants.TICKET_COMMENT_UPDATE_TEMPLATE,"Ticket ID <"+ ticketEntity.getTicketId() + ">"  + " | Comment Update by " +  userObj.getUsername());
		
		redirectAttrib.addFlashAttribute("Success", "Ticket Comment is updated Successfully..");
		ModelAndView modelView = new ModelAndView(); 
		modelView.setViewName("redirect:view_view_ticket?ticketId="+ticketObj.getTicketId());
 		
		 return modelView;
	 }
	    
	 //@PostMapping("/workload/edit_edit_ticket_form_user")
	 @PostMapping("/edit_edit_ticket_form_user")
	 public ModelAndView edit_edit_ticket_form_user(@ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketRecorderObj,  BindingResult result) {
		 ModelAndView mapview = new ModelAndView();
		 //mapview.addObject("VIEW_SOURCE","OPEN_TICKET");
		 validator.validate(ticketRecorderObj, result);
		if(result.hasErrors()) {
	    		mapview = view_form_edit_ticket(ticketRecorderObj.getTicketId(),ticketRecorderObj,result);
	    		//result.rejectValue("dealName", "invalid.dealName", "Error: Invalid Deal Association");
	    		return mapview; 
	    }
		try {
			ticketRecorderObj.setTicketCreator(getLoggedInUser().getUserId());
			Udn_Ticket_Recorder_Entity ticketEntity = new Udn_Ticket_Recorder_Entity(ticketRecorderObj);
			ticketService.saveTicket(ticketEntity);
			if(ticketRecorderObj.isNotifyTicketOwner()) {
				ticketRecorderObj.setTicketId(ticketEntity.getTicketId());
				String emailSubject = "Your Ticket Number < " + ticketRecorderObj.getTicketId() + " > is " + ticketRecorderObj.getTicketStatus(); 
				notifyTicketTargetAudience(ticketRecorderObj,"TicketUpdated.ftl", emailSubject);
			}
			mapview = view_open_ticket_form_user("0","UpdatedAt",new FilterTicketObj(),null) ;
			mapview.addObject("Success","Ticket is updated successfully");
		}
		catch(Exception exp) {
			mapview.addObject("Error","Error: Updating Ticket !!.Please contact administrator.  ");
			exp.printStackTrace();
		}
		//mapview.setViewName("forward:create_create_ticket_form_user");
		return mapview;
	 }

	 //@RequestMapping("/workload/view_open_ticket_form_user_filter_due_today")
	 @RequestMapping("/view_open_ticket_form_user_filter_due_today")
	 public ModelAndView view_open_ticket_form_user_filter_due_today() {
		 FilterTicketObj ticketFilter = new FilterTicketObj();
		 //Date dateTo=new SimpleDateFormat("yyyy-MM-dd").parse(LocalDateTime.now());
		 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
		 LocalDateTime now = LocalDateTime.now();  
		 //System.out.println("Date formatted is " + now);
		 ticketFilter.setDateFrom(dtf.format(now));
		 ticketFilter.setDateTo(dtf.format(now));
		 
		ModelAndView mapview = view_open_ticket_form_user( "0","UpdatedAt",ticketFilter,null);
		mapview.setViewName("ticket/view_openTodaysTicket");
		return mapview;
	 }
		 
	//@RequestMapping("/workload/view_open_due_today_ticket_form_user")
	 @RequestMapping("/view_open_due_today_ticket_form_user")
	public ModelAndView view_open_due_today_ticket_form_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TICKET_FILTER_OBJ") FilterTicketObj ticketFilter,  BindingResult result) {
		ModelAndView modelView = new ModelAndView();
		modelView = view_open_ticket_form_user( page,sortBy, ticketFilter, result);
		modelView.setViewName("ticket/view_openTodaysTicket");
		return modelView;
	}
	
    //@RequestMapping(value="/workload/view_view_due_today_ticket")
	 @RequestMapping(value="/view_view_due_today_ticket")
    public ModelAndView view_view_due_today_ticket(@RequestParam("ticketId") long ticketId,@ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_view_ticket(ticketId,ticketRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","DUE_TODAY");
    	modelView.setViewName("ticket/view_Ticket");
    	return modelView;
    }

    //@RequestMapping(value="/workload/view_form_edit_due_today_ticket")
	 @RequestMapping(value="/view_form_edit_due_today_ticket")
    public ModelAndView view_form_edit_due_today_ticket(@RequestParam("ticketId") long ticketId,@ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_form_edit_ticket(ticketId,ticketRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","DUE_TODAY");
    	return modelView;
    }
	
	 //@PostMapping("/workload/edit_edit_due_today_ticket_form_user")
	 @PostMapping("/edit_edit_due_today_ticket_form_user")
	 public ModelAndView edit_edit_due_today_ticket_form_user(@ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketRecorderObj,  BindingResult result) {
		//ModelAndView mapview = create_create_ticket_form_user(ticketRecorderObj,result); 
		 ModelAndView mapview = edit_edit_ticket_form_user(ticketRecorderObj,result);
		 mapview.setViewName("forward:view_open_ticket_form_user_filter_due_today");
		return mapview;
	 }

	
	 
	//@RequestMapping("/workload/view_open_ticket_form_user_filter_overdue")
	 @RequestMapping("/view_open_ticket_form_user_filter_overdue")
	public ModelAndView view_open_ticket_form_user_filter_overdue( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TICKET_FILTER_OBJ") FilterTicketObj ticketFilter,  BindingResult result) {
		ticketFilter = new FilterTicketObj();
		ModelAndView modelView = new ModelAndView();
		ticketFilter.setOverDueTickets(true);
		modelView = view_open_ticket_form_user( page,sortBy, ticketFilter, result);
		modelView.setViewName("ticket/view_openOverDueTicket");
		return modelView;
	}
	
	
	//@RequestMapping("/workload/view_open_over_due_ticket_form_user")
	 @RequestMapping("/view_open_over_due_ticket_form_user")
	public ModelAndView view_open_over_due_ticket_form_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TICKET_FILTER_OBJ") FilterTicketObj ticketFilter,  BindingResult result) {
		//ModelAndView modelView = new ModelAndView();
		ticketFilter.setOverDueTickets(true);
		//ModelAndView modelView = view_open_ticket_form_user( "0","UpdatedAt",ticketFilter,null);
		ModelAndView modelView = view_open_ticket_form_user( page,sortBy, ticketFilter, result);
		modelView.setViewName("ticket/view_openOverDueTicket");
		return modelView;
	}
	
 
	//@RequestMapping(value="/workload/view_view_over_due_ticket")
	 @RequestMapping(value="/view_view_over_due_ticket")
    public ModelAndView view_view_over_due_ticket(@RequestParam("ticketId") long ticketId,@ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_view_ticket(ticketId,ticketRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","OVER_DUE");
    	modelView.setViewName("ticket/view_Ticket");
    	return modelView;
    }
 
    //@RequestMapping(value="/workload/view_form_edit_over_due_ticket")
	 @RequestMapping(value="/view_form_edit_over_due_ticket")
    public ModelAndView view_form_edit_over_due_ticket(@RequestParam("ticketId") long ticketId,@ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_form_edit_ticket(ticketId,ticketRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","OVER_DUE");
    	return modelView;
    }

	 //@PostMapping("/workload/edit_edit_over_due_ticket_form_user")
	 @PostMapping("/edit_edit_over_due_ticket_form_user")
	 public ModelAndView edit_edit_over_due_ticket_form_user(@ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketRecorderObj,  BindingResult result) {
		//ModelAndView mapview = create_create_ticket_form_user(ticketRecorderObj,result); 
		ModelAndView mapview = edit_edit_ticket_form_user(ticketRecorderObj,result);
		
		mapview.setViewName("forward:view_open_ticket_form_user_filter_overdue");
		return mapview;
	 }

	 
	//@RequestMapping("/workload/view_open_my_created_ticket_form_user")
	 @RequestMapping("/view_open_my_created_ticket_form_user")
	public ModelAndView view_open_my_created_ticket_form_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TICKET_FILTER_OBJ") FilterTicketObj ticketFilter,  BindingResult result) {
		ticketFilter.setMyCreatedTicketOnly(true);
		ModelAndView modelView = view_open_ticket_form_user(page,sortBy,ticketFilter,result);
		modelView.setViewName("ticket/view_openMyCreatedTicket");
		return modelView;
	}	
	
	 //@RequestMapping(value="/workload/view_view_my_created_ticket")
	 @RequestMapping(value="/view_view_my_created_ticket")
	 public ModelAndView view_view_my_created_ticket(@RequestParam("ticketId") long ticketId,@ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_view_ticket(ticketId,ticketRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","MY_CREATED");
    	modelView.setViewName("ticket/view_Ticket");
    	return modelView;
	 }
	 
    //@RequestMapping(value="/workload/view_form_edit_my_created_ticket")
	 @RequestMapping(value="/view_form_edit_my_created_ticket")
    public ModelAndView view_form_edit_my_created_ticket(@RequestParam("ticketId") long ticketId,@ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_form_edit_ticket(ticketId,ticketRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","MY_CREATED");
    	return modelView;
    }
    
	 //@PostMapping("/workload/edit_edit_my_created_ticket_form_user")
	 @PostMapping("/edit_edit_my_created_ticket_form_user")
	 public ModelAndView edit_edit_my_created_ticket_form_user(@ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketRecorderObj,  BindingResult result) {
		//ModelAndView mapview = create_create_ticket_form_user(ticketRecorderObj,result); 
		ModelAndView mapview = edit_edit_ticket_form_user(ticketRecorderObj,result);
		mapview.setViewName("forward:view_open_ticket_form_user_filter_my_created");
		return mapview;
	 }
	 
	 //@RequestMapping("/workload/view_open_ticket_form_user_filter_my_created")
	 @RequestMapping("/view_open_ticket_form_user_filter_my_created")
	 public ModelAndView view_open_ticket_form_user_filter_my_created( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TICKET_FILTER_OBJ") FilterTicketObj ticketFilter,  BindingResult result) {
		ticketFilter = new FilterTicketObj();
		ModelAndView modelView = new ModelAndView();
		ticketFilter.setMyCreatedTicketOnly(true);
		modelView = view_open_ticket_form_user( page,sortBy, ticketFilter, result);
		modelView.setViewName("ticket/view_openMyCreatedTicket");
		return modelView;
	 }	

	 //@RequestMapping("/workload/view_open_my_assigned_ticket_form_user")
	 @RequestMapping("/view_open_my_assigned_ticket_form_user")
	 public ModelAndView view_open_my_assigned_ticket_form_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TICKET_FILTER_OBJ") FilterTicketObj ticketFilter,  BindingResult result) {
		ticketFilter.setMyAssignedTicketOnly(true);
		ModelAndView modelView = view_open_ticket_form_user(page,sortBy,ticketFilter,result);
		modelView.setViewName("ticket/view_openMyAssignedTicket");
		return modelView;
	 }	

	 //@RequestMapping(value="/workload/view_view_my_assigned_ticket")
	 @RequestMapping(value="/view_view_my_assigned_ticket")
	 public ModelAndView view_view_my_assigned_ticket(@RequestParam("ticketId") long ticketId,@ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_view_ticket(ticketId,ticketRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","MY_ASSIGNED");
    	modelView.setViewName("ticket/view_Ticket");
    	return modelView;
	 }

    //@RequestMapping(value="/workload/view_form_edit_my_assigned_ticket")
	 @RequestMapping(value="/view_form_edit_my_assigned_ticket")
    public ModelAndView view_form_edit_my_assigned_ticket(@RequestParam("ticketId") long ticketId,@ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_form_edit_ticket(ticketId,ticketRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","MY_ASSIGNED");
    	return modelView;
    }

	 //@PostMapping("/workload/edit_edit_my_assigned_ticket_form_user")
	 @PostMapping("/edit_edit_my_assigned_ticket_form_user")
	 public ModelAndView edit_edit_my_assigned_ticket_form_user(@ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketRecorderObj,  BindingResult result) {
		//ModelAndView mapview = create_create_ticket_form_user(ticketRecorderObj,result); 
		ModelAndView mapview = edit_edit_ticket_form_user(ticketRecorderObj,result);
		mapview.setViewName("forward:view_open_ticket_form_user_filter_my_assigned");
		return mapview;
	 }

	//@RequestMapping("/workload/view_open_ticket_form_user_filter_my_assigned")
	 @RequestMapping("/view_open_ticket_form_user_filter_my_assigned")
	public ModelAndView view_open_ticket_form_user_filter_my_assigned( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TICKET_FILTER_OBJ") FilterTicketObj ticketFilter,  BindingResult result) {
		ticketFilter = new FilterTicketObj();
		ModelAndView modelView = new ModelAndView();
		ticketFilter.setMyAssignedTicketOnly(true);
		modelView = view_open_ticket_form_user( page,sortBy, ticketFilter, result);
		modelView.setViewName("ticket/view_openMyAssignedTicket");
		return modelView;
	 }	

	
	 //@RequestMapping("/workload/view_completed_ticket_form_user")
	 @RequestMapping("/view_completed_ticket_form_user")
	 public ModelAndView view_completed_ticket_form_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TICKET_FILTER_OBJ") FilterTicketObj ticketFilter,  BindingResult result) {
		ticketFilter.setCompletedTicketOnly(true);
		ModelAndView modelView = view_open_ticket_form_user(page,sortBy,ticketFilter,result);
		modelView.setViewName("ticket/view_completedTicket");
		return modelView;
	 }	

	 //@RequestMapping(value="/workload/view_view_completed_ticket")
	 @RequestMapping(value="/view_view_completed_ticket")
	 public ModelAndView view_view_completed_ticket(@RequestParam("ticketId") long ticketId,@ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_view_ticket(ticketId,ticketRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","COMPLETED_TICKET");
    	modelView.setViewName("ticket/view_Ticket");
    	return modelView;
	 }

	 //@RequestMapping(value="/workload/view_form_edit_completed_ticket")
	 @RequestMapping(value="/view_form_edit_completed_ticket")
	 public ModelAndView view_form_edit_completed_ticket(@RequestParam("ticketId") long ticketId,@ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_form_edit_ticket(ticketId,ticketRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","COMPLETED_TICKET");
    	return modelView;
    }

	 //@PostMapping("/workload/edit_edit_completed_ticket_form_user")
	 @PostMapping("/edit_edit_completed_ticket_form_user")
	 public ModelAndView edit_edit_completed_ticket_form_user(@ModelAttribute("TICKET_RECORDER_OBJ") Udn_Ticket_Recorder_Obj ticketRecorderObj,  BindingResult result) {
		//ModelAndView mapview = create_create_ticket_form_user(ticketRecorderObj,result); 
		ModelAndView mapview = edit_edit_ticket_form_user(ticketRecorderObj,result);
		
		mapview.setViewName("forward:view_completed_ticket_form_user_filter_completed");
		return mapview;
	 }
	 
	 //@RequestMapping("/workload/view_completed_ticket_form_user_filter_completed")
	 @RequestMapping("/view_completed_ticket_form_user_filter_completed")
		public ModelAndView view_completed_ticket_form_user_filter_completed( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TICKET_FILTER_OBJ") FilterTicketObj ticketFilter,  BindingResult result) {
			ticketFilter = new FilterTicketObj();
			ModelAndView modelView = new ModelAndView();
			ticketFilter.setCompletedTicketOnly(true);
			modelView = view_open_ticket_form_user( page,sortBy, ticketFilter, result);
			modelView.setViewName("ticket/view_completedTicket");
			return modelView;
		 }	

}

