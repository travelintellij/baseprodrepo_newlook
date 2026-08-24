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
import com.udanchoo.intranet.entity.Udn_Task_Comments_Entity;
import com.udanchoo.intranet.entity.Udn_Task_Recorder_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.model.FilterTaskObj;
import com.udanchoo.intranet.model.Mail;
import com.udanchoo.intranet.model.TTCommentsVO;
import com.udanchoo.intranet.model.Udn_Task_Recorder_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.service.EmailServiceImpl;
import com.udanchoo.intranet.service.TaskServiceImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;

import freemarker.template.TemplateException;




@Controller
public class TaskController {
	 
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
	TaskServiceImpl taskService;
	
	@Autowired
	EmailServiceImpl emailService;
	
	@Value("${all.email.notify.communication.active}")
	private boolean emailNotifyActive;
	
	@Value("${email.internal.valid}")
	private boolean emailInternalActive;
	
	private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");	
	
	
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
	
	 //@RequestMapping("/workload/view_create_task_form_user")
	 @RequestMapping("/view_create_task_form_user")
	 public ModelAndView view_create_task_form_user(@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorder,  BindingResult result) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView mapview = new ModelAndView(); 
		mapview.setViewName("task/form_createTask");

		//List<UserDetailsObj> activeUsersList= userDetailsService.findAllActiveUsers();
    	//mapview.addObject("ACTIVE_USERS_LIST", activeUsersList);
		
    	List<UserDetailsObj> activeUsersList = userDetailsService.findAllActiveUsers();
 		Map<Integer, String> activeUsersMap = (Map<Integer, String>) activeUsersList.stream().collect(
                 Collectors.toMap(UserDetailsObj::getUserId, UserDetailsObj::getUsername));
 		mapview.addObject("ACTIVE_USERS_MAP", activeUsersMap);

    	mapview.addObject("TASK_PRIORITY", UdanChooConstants.TASK_PRIORITY);
    	mapview.addObject("TASK_STATUS", UdanChooConstants.TASK_STATUS);
		return mapview;
	 }

	 //@PostMapping("/workload/create_create_task_form_user")
	 @PostMapping("/create_create_task_form_user")
	 public ModelAndView create_create_task_form_user(@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
		UserDetailsObj userObj = getLoggedInUser();
		taskRecorderObj.setTaskCreator(userObj.getUserId());
		taskRecorderObj.setNotifyTaskOwner(true);
		if(taskRecorderObj.getDealName()==null || taskRecorderObj.getDealName().trim().length()==0) {
			taskRecorderObj.setDealConfirmationId(0l);
		}
		ModelAndView mapview = null; 
		//mapview.setViewName("forward:view_open_task_form_user");
		try {
			Udn_Task_Recorder_Entity taskEntity = new Udn_Task_Recorder_Entity(taskRecorderObj);
			taskService.saveTask(taskEntity);
			if(taskRecorderObj.isNotifyTaskOwner()) {
				taskRecorderObj.setTaskId(taskEntity.getTaskId());
				String subject = "Your task '" + taskRecorderObj.getTaskTitle() +  "' is due by " + DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm").format(taskRecorderObj.getTaskDueDate());
				notifyTaskTargetAudience(taskRecorderObj,subject,"TaskCreated.ftl");
			}
			mapview = view_open_task_form_user("0","UpdatedAt",new FilterTaskObj(),null) ;
			//System.out.println("SOURCE IS -> " + mapview.getModel().get("VIEW_SOURCE"));
			mapview.addObject("Success","Task is updated successfully");
		}
		catch(Exception exp) {
			mapview.addObject("Error","Error: Updating Task !!.Please contact administrator.  ");
			exp.printStackTrace();
		}
		return mapview; 
	 }

	private void notifyTaskTargetAudience(Udn_Task_Recorder_Obj taskRecorderObj,String subject, String templateName) {
		if(emailNotifyActive && emailInternalActive) {
			UdnTeam taskCreator = userDetailsService.findUserByID(taskRecorderObj.getTaskCreator());
			UdnTeam taskOwner = userDetailsService.findUserByID(taskRecorderObj.getTaskOwner());
			Mail mail = new Mail();
			mail.setSubject(subject);
			mail.setTo(taskOwner.getEmail());
			mail.setCc(taskCreator.getEmail());
			try {
		        Map<String, Object> model = new HashMap<String, Object>();
		        model.put("taskOwner", taskOwner.getName());
		        model.put("taskCreator",taskCreator.getName());
		        model.put("taskId", taskRecorderObj.getTaskId());
		        model.put("taskTitle", taskRecorderObj.getTaskTitle());
		        model.put("taskDesciption", taskRecorderObj.getTaskDescription());
		        
		        model.put("taskPriority", taskRecorderObj.getTaskPriority());
		        model.put("taskStatus", taskRecorderObj.getTaskStatus());
		        model.put("username", taskRecorderObj.getPlaceHolder1());
		        model.put("taskComment", taskRecorderObj.getTaskComment());
		        model.put("taskDueDate", DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm").format(taskRecorderObj.getTaskDueDate()));
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

	//@RequestMapping("/workload/view_open_task_form_user")
	@RequestMapping("/view_open_task_form_user")
	public ModelAndView view_open_task_form_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TASK_FILTER_OBJ") FilterTaskObj taskFilter,  BindingResult result) {
		UserDetailsObj userObj = getLoggedInUser();
		int pageNum = Integer.parseInt(page);
		ModelAndView mapview = new ModelAndView(); 
		mapview.setViewName("task/view_openTask");
		Page<Udn_Task_Recorder_Entity> taskPageResult = taskService.searchTasks(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, userObj.getUserId(), sortBy,taskFilter);
		List<Udn_Task_Recorder_Obj> taskListObj = generateVo(taskPageResult);
		mapview.addObject("OPEN_TASK_LIST", taskListObj);

		List<UserDetailsObj> activeUsersList= userDetailsService.findAllActiveUsers();
		mapview.addObject("ACTIVE_USERS_LIST", activeUsersList);
    	mapview.addObject("TASK_PRIORITY", UdanChooConstants.TASK_PRIORITY);
    	mapview.addObject("TASK_STATUS", UdanChooConstants.TASK_STATUS);
    	mapview.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm"));
    	mapview.addObject("page", pageNum);
    	mapview.addObject("maxPages", taskPageResult.getTotalPages());
    	mapview.addObject("sortBy", sortBy);
    	mapview.addObject("dateFrom", taskFilter.getDateFrom());
    	mapview.addObject("dateTo", taskFilter.getDateTo());
    	mapview.addObject("taskOwner",taskFilter.getTaskOwner());
    	mapview.addObject("dealConfirmationId",taskFilter.getDealConfirmationId());
    	mapview.addObject("taskPriority",taskFilter.getTaskPriority());
		return mapview;
	 }
	 
	 private List<Udn_Task_Recorder_Obj> generateVo(Page<Udn_Task_Recorder_Entity> taskPage) {
		 
		 List<Udn_Task_Recorder_Obj> taskObjList = new ArrayList<Udn_Task_Recorder_Obj>();
			List<Udn_Task_Recorder_Entity> taskEntityList = taskPage.getContent();
			Iterator itrTaskList = taskEntityList.iterator();
			while(itrTaskList.hasNext()){
				Udn_Task_Recorder_Obj taskObj = new Udn_Task_Recorder_Obj((Udn_Task_Recorder_Entity)itrTaskList.next());
				taskObj.setTaskCreatorName(userDetailsService.findUserByID(taskObj.getTaskCreator()).getName());
				taskObj.setTaskOwnerName(userDetailsService.findUserByID(taskObj.getTaskOwner()).getName());
				taskObjList.add(taskObj);
			}
		return taskObjList; 
	}

	 @RequestMapping(value="/view_view_task")
	 public ModelAndView view_view_task(@RequestParam("taskId") long taskId,@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskObj,  BindingResult result) {
		 UserDetailsObj userObj = getLoggedInUser();
    	int DEFAULT_PAGE_NUM=taskObj.getPage();
    	int DEFAULT_PAGE_SIZE=3;
    	String DEFAULT_SORTING="UpdatedAt";
    	ModelAndView modelView = new ModelAndView();
    	Optional<Udn_Task_Recorder_Entity> taskEntity = taskService.find_task_ById(taskId);
    	if(taskEntity.isPresent()) {
    		//Udn_Task_Recorder_Obj taskObj = new Udn_Task_Recorder_Obj(taskEntity.get());
    		taskObj.updateVoFrmEntity(taskEntity.get());
    		taskObj.setTaskOwnerName(userDetailsService.findUserByID(taskObj.getTaskOwner()).getName());
    		//modelView.addObject("TASK_OBJ", taskObj);
    		Page<Udn_Task_Comments_Entity> pageTaskCommentsRecords = taskService.searchTasksComments(DEFAULT_PAGE_NUM,DEFAULT_PAGE_SIZE,taskId,DEFAULT_SORTING);
    		List<TTCommentsVO> taskCommentsList = generateTaskCommentsVo(pageTaskCommentsRecords);

    		modelView.addObject("FILTERED_TASK_COMMENTS",taskCommentsList);
    		modelView.addObject("maxPages", pageTaskCommentsRecords.getTotalPages());
    		modelView.addObject("page", DEFAULT_PAGE_NUM);
    		modelView.addObject("sortBy", DEFAULT_SORTING);
    	}
    	else {
    		modelView.addObject("ERROR", "Error: Invalid Task Id Provided. " );
    	}
    	modelView.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm"));
    	modelView.addObject("VIEW_SOURCE","OPEN_TASK");
    	
    	modelView.setViewName("task/view_Task");
    	return modelView;
    }

	private List<TTCommentsVO> generateTaskCommentsVo(Page<Udn_Task_Comments_Entity> pagedResult) {
		List<TTCommentsVO> filteredCommentsVoList = new ArrayList<TTCommentsVO>();
		List<Udn_Task_Comments_Entity> taskCommentsEntityList = pagedResult.getContent();
		Iterator filteredTaskCommentIterator = taskCommentsEntityList.iterator();
		while(filteredTaskCommentIterator.hasNext()) {
			Udn_Task_Comments_Entity taskCommentEntity = (Udn_Task_Comments_Entity) filteredTaskCommentIterator.next();
			TTCommentsVO commentsVO = new TTCommentsVO();
			commentsVO.setCommentedBy(userDetailsService.findUserByID(taskCommentEntity.getUpdatedBy()).getUsername());
			commentsVO.setCommentId(taskCommentEntity.getTaskCommentId());
			commentsVO.setTtComment(taskCommentEntity.getTaskComment());
			commentsVO.setLastUpdated(taskCommentEntity.getUpdatedAt().toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime());
			filteredCommentsVoList.add(commentsVO);
		}
		return filteredCommentsVoList;
	}
	 
	 
	 public ModelAndView view_view_comments(@RequestParam("taskId") long taskId,@RequestParam(defaultValue = "0") int page,@RequestParam(defaultValue = "4") Integer pageSize, @RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskObj,  BindingResult result) {
		 ModelAndView modelView = view_view_task(taskId,taskObj,result);
		 
 		Page<Udn_Task_Comments_Entity> pageTaskCommentsRecords = taskService.searchTasksComments(page,pageSize,taskId,sortBy);
 		modelView.addObject("FILTERED_TASK_COMMENTS",pageTaskCommentsRecords);
 		modelView.addObject("maxPages", pageTaskCommentsRecords.getTotalPages());
 		modelView.addObject("page", page);
 		modelView.addObject("sortBy", pageSize);
 		
		 return modelView;
	 }
	 
	 
 
    
    @RequestMapping(value="/view_form_edit_task_req")
    public ModelAndView view_form_edit_task_req(@RequestParam("taskId") long taskId, @ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
    	return view_form_edit_task(taskId, taskRecorderObj, result); 
    }
    
    
    
		 
    //@RequestMapping(value="/workload/view_form_edit_task")
	//@RequestMapping(value="/view_form_edit_task")
    //@PostMapping(value = "/view_form_edit_task", params = "Edit")
    @RequestMapping(value="view_form_edit_task",method= {RequestMethod.GET,RequestMethod.POST},params = "Edit")
    public ModelAndView view_form_edit_task(@RequestParam("taskId") long taskId, @ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_view_task(taskId,taskRecorderObj,result);
		//List<UserDetailsObj> activeUsersList= userDetailsService.findAllActiveUsers();
		//modelView.addObject("ACTIVE_USERS_LIST", activeUsersList);
    	
    	List<UserDetailsObj> activeUsersList = userDetailsService.findAllActiveUsers();
    	Map<Integer, String> activeUsersMap = (Map<Integer, String>) activeUsersList.stream().collect(
                 Collectors.toMap(UserDetailsObj::getUserId, UserDetailsObj::getUsername));
 		modelView.addObject("ACTIVE_USERS_MAP", activeUsersMap);

		
		modelView.addObject("TASK_PRIORITY_MAP", UdanChooConstants.TASK_PRIORITY_MAP);
		modelView.addObject("TASK_STATUS", UdanChooConstants.TASK_STATUS);
		
		modelView.addObject("VIEW_SOURCE","OPEN_TASK");
    	modelView.setViewName("task/edit_Task");
    	return modelView;
    }
	    
    @Transactional
    @RequestMapping(value="view_form_edit_task",method= {RequestMethod.GET,RequestMethod.POST},params = "Update Comments")
	public ModelAndView update_update_comments(@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskObj, BindingResult result,final RedirectAttributes redirectAttrib ) {
    	UserDetailsObj userObj = getLoggedInUser();
    	int DEFAULT_PAGE_NUM=0;
    	int DEFAULT_PAGE_SIZE=4;
    	String DEFAULT_SORTING="UpdatedAt";
    	//ModelAndView modelView = view_view_task(taskObj.getTaskId(),taskObj,result);
		Udn_Task_Recorder_Entity taskEntity = taskService.find_task_ById(taskObj.getTaskId()).get();
		taskObj.updateVoFrmEntity(taskEntity);
    	Udn_Task_Comments_Entity taskCommentEntity = new Udn_Task_Comments_Entity ();
		taskCommentEntity.setTaskComment(taskObj.getTaskComment());
		taskCommentEntity.setUpdatedBy(userObj.getUserId());
		taskCommentEntity.setTaskEntity(taskEntity);
		taskEntity.getTaskCommentsEntityList().add(taskCommentEntity);
		taskService.saveTask(taskEntity);
		taskObj.setPlaceHolder1(userObj.getUsername());

		notifyTaskTargetAudience(taskObj, "Task ID <"+ taskEntity.getTaskId() + ">"  + " | Comment Update by " +  userObj.getUsername(), UdanChooConstants.TASK_COMMENT_UPDATE_TEMPLATE);

		redirectAttrib.addFlashAttribute("Success", "Task Comment is updated Successfully..");
		ModelAndView modelView = new ModelAndView(); 
		modelView.setViewName("redirect:view_view_task?taskId="+taskObj.getTaskId());
 		
		/*Page<Udn_Task_Comments_Entity> pageTaskCommentsRecords = taskService.searchTasksComments(DEFAULT_PAGE_NUM,DEFAULT_PAGE_SIZE,taskObj.getTaskId(),DEFAULT_SORTING);
 		modelView.addObject("FILTERED_TASK_COMMENTS",pageTaskCommentsRecords);
 		modelView.addObject("maxPages", pageTaskCommentsRecords.getTotalPages());
		modelView.addObject("page", DEFAULT_PAGE_NUM);
		modelView.addObject("sortBy", DEFAULT_SORTING);
		
		System.out.println("Total number of Pages : " + pageTaskCommentsRecords.getTotalPages());
		*/
		
		 return modelView;
	 }

	 //@PostMapping("/workload/edit_edit_task_form_user")
	 @PostMapping("/edit_edit_task_form_user")
	 public ModelAndView edit_edit_task_form_user(@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
		/*ModelAndView mapview = new ModelAndView(); 
		mapview.addObject("VIEW_SOURCE","OPEN_TASK");
		//taskRecorderObj.setNotifyTaskOwner(false);
		mapview.setViewName("forward:create_create_task_form_user");
		return mapview;
		*/
		UserDetailsObj userObj = getLoggedInUser();
		Optional<Udn_Task_Recorder_Entity> existingTaskOpt = taskService.find_task_ById(taskRecorderObj.getTaskId());
		if(existingTaskOpt.isPresent()) {
			taskRecorderObj.setTaskCreator(existingTaskOpt.get().getTaskCreator());
		}
		if(taskRecorderObj.getDealName()==null || taskRecorderObj.getDealName().trim().length()==0) {
			taskRecorderObj.setDealConfirmationId(0l);
		}
		ModelAndView mapview = null; 
		//mapview.setViewName("forward:view_open_task_form_user");
		try {
			Udn_Task_Recorder_Entity taskEntity = new Udn_Task_Recorder_Entity(taskRecorderObj);
			//Udn_Task_Comments_Entity taskComments = new Udn_Task_Comments_Entity();
			//taskEntity.getTaskCommentsEntityList().add(taskComments);
			taskService.saveTask(taskEntity);
			if(taskRecorderObj.isNotifyTaskOwner()) {
				taskRecorderObj.setTaskId(taskEntity.getTaskId());
				String subject = "Your Task <" + taskRecorderObj.getTaskId() + " > is updated and status is <" + taskRecorderObj.getTaskStatus() +">"; 
				notifyTaskTargetAudience(taskRecorderObj, subject, "TaskUpdated.ftl");
			}
			mapview = view_open_task_form_user("0","UpdatedAt",new FilterTaskObj(),null) ;
			//System.out.println("SOURCE IS -> " + mapview.getModel().get("VIEW_SOURCE"));
			mapview.addObject("Success","Task is updated successfully");
		}
		catch(Exception exp) {
			mapview.addObject("Error","Error: Updating Task !!.Please contact administrator.  ");
			exp.printStackTrace();
		}
		return mapview;

	 }

	 //@RequestMapping("/workload/view_open_task_form_user_filter_due_today")
	 @RequestMapping("/view_open_task_form_user_filter_due_today")
	 public ModelAndView view_open_task_form_user_filter_due_today() {
		 FilterTaskObj taskFilter = new FilterTaskObj();
		 //Date dateTo=new SimpleDateFormat("yyyy-MM-dd").parse(LocalDateTime.now());
		 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");  
		 LocalDateTime now = LocalDateTime.now();  
		 //System.out.println("Date formatted is " + now);
		 taskFilter.setDateFrom(dtf.format(now));
		 taskFilter.setDateTo(dtf.format(now));
		 
		ModelAndView mapview = view_open_task_form_user( "0","UpdatedAt",taskFilter,null);
		mapview.setViewName("task/view_openTodaysTask");
		return mapview;
	 }
		 
	//@RequestMapping("/workload/view_open_due_today_task_form_user")
	 @RequestMapping("/view_open_due_today_task_form_user")
	public ModelAndView view_open_due_today_task_form_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TASK_FILTER_OBJ") FilterTaskObj taskFilter,  BindingResult result) {
		ModelAndView modelView = new ModelAndView();
		modelView = view_open_task_form_user( page,sortBy, taskFilter, result);
		modelView.setViewName("task/view_openTodaysTask");
		return modelView;
	}
	
    //@RequestMapping(value="/workload/view_view_due_today_task")
	 @RequestMapping(value="/view_view_due_today_task")
    public ModelAndView view_view_due_today_task(@RequestParam("taskId") long taskId,@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_view_task(taskId,taskRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","DUE_TODAY");
    	modelView.setViewName("task/view_Task");
    	return modelView;
    }

    //@RequestMapping(value="/workload/view_form_edit_due_today_task")
	 @RequestMapping(value="/view_form_edit_due_today_task")
    public ModelAndView view_form_edit_due_today_task(@RequestParam("taskId") long taskId,@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_form_edit_task(taskId,taskRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","DUE_TODAY");
    	return modelView;
    }
	
	 //@PostMapping("/workload/edit_edit_due_today_task_form_user")
	 @PostMapping("/edit_edit_due_today_task_form_user")
	 public ModelAndView edit_edit_due_today_task_form_user(@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
		//taskRecorderObj.setNotifyTaskOwner(false);
		 ModelAndView mapview = edit_edit_task_form_user(taskRecorderObj,result); 
		mapview.setViewName("forward:view_open_task_form_user_filter_due_today");
		return mapview;
	 }

	
	 
	//@RequestMapping("/workload/view_open_task_form_user_filter_overdue")
	 @RequestMapping("/view_open_task_form_user_filter_overdue")
	public ModelAndView view_open_task_form_user_filter_overdue( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TASK_FILTER_OBJ") FilterTaskObj taskFilter,  BindingResult result) {
		taskFilter = new FilterTaskObj();
		ModelAndView modelView = new ModelAndView();
		taskFilter.setOverDueTasks(true);
		modelView = view_open_task_form_user( page,sortBy, taskFilter, result);
		modelView.setViewName("task/view_openOverDueTask");
		return modelView;
	}
	
	
	//@RequestMapping("/workload/view_open_over_due_task_form_user")
	 @RequestMapping("/view_open_over_due_task_form_user")
	public ModelAndView view_open_over_due_task_form_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TASK_FILTER_OBJ") FilterTaskObj taskFilter,  BindingResult result) {
		//ModelAndView modelView = new ModelAndView();
		taskFilter.setOverDueTasks(true);
		//ModelAndView modelView = view_open_task_form_user( "0","UpdatedAt",taskFilter,null);
		ModelAndView modelView = view_open_task_form_user( page,sortBy, taskFilter, result);
		modelView.setViewName("task/view_openOverDueTask");
		return modelView;
	}
	
 
	//@RequestMapping(value="/workload/view_view_over_due_task")
	 @RequestMapping(value="/view_view_over_due_task")
    public ModelAndView view_view_over_due_task(@RequestParam("taskId") long taskId,@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_view_task(taskId,taskRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","OVER_DUE");
    	modelView.setViewName("task/view_Task");
    	return modelView;
    }
 
    //@RequestMapping(value="/workload/view_form_edit_over_due_task")
	 @RequestMapping(value="/view_form_edit_over_due_task")
    public ModelAndView view_form_edit_over_due_task(@RequestParam("taskId") long taskId,@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_form_edit_task(taskId,taskRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","OVER_DUE");
    	return modelView;
    }

	 //@PostMapping("/workload/edit_edit_over_due_task_form_user")
	 @PostMapping("/edit_edit_over_due_task_form_user")
	 public ModelAndView edit_edit_over_due_task_form_user(@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
		//taskRecorderObj.setNotifyTaskOwner(false);
		 ModelAndView mapview = edit_edit_task_form_user(taskRecorderObj,null); 
		mapview.setViewName("forward:view_open_task_form_user_filter_overdue");
		return mapview;
	 }

	 
	//@RequestMapping("/workload/view_open_my_created_task_form_user")
	 @RequestMapping("/view_open_my_created_task_form_user")
	public ModelAndView view_open_my_created_task_form_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TASK_FILTER_OBJ") FilterTaskObj taskFilter,  BindingResult result) {
		taskFilter.setMyCreatedTaskOnly(true);
		ModelAndView modelView = view_open_task_form_user(page,sortBy,taskFilter,result);
		modelView.setViewName("task/view_openMyCreatedTask");
		return modelView;
	}	
	
	 //@RequestMapping(value="/workload/view_view_my_created_task")
	 @RequestMapping(value="/view_view_my_created_task")
	 public ModelAndView view_view_my_created_task(@RequestParam("taskId") long taskId,@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_view_task(taskId,taskRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","MY_CREATED");
    	modelView.setViewName("task/view_Task");
    	return modelView;
	 }
	 
    //@RequestMapping(value="/workload/view_form_edit_my_created_task")
	 @RequestMapping(value="/view_form_edit_my_created_task")
    public ModelAndView view_form_edit_my_created_task(@RequestParam("taskId") long taskId,@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_form_edit_task(taskId,taskRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","MY_CREATED");
    	return modelView;
    }
    
	 //@PostMapping("/workload/edit_edit_my_created_task_form_user")
	 @PostMapping("/edit_edit_my_created_task_form_user")
	 public ModelAndView edit_edit_my_created_task_form_user(@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
		 //taskRecorderObj.setNotifyTaskOwner(false);
		 ModelAndView mapview = edit_edit_task_form_user(taskRecorderObj,null); 
		mapview.setViewName("forward:view_open_task_form_user_filter_my_created");
		return mapview;
	 }
	 
	 //@RequestMapping("/workload/view_open_task_form_user_filter_my_created")
	 @RequestMapping("/view_open_task_form_user_filter_my_created")
	 public ModelAndView view_open_task_form_user_filter_my_created( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TASK_FILTER_OBJ") FilterTaskObj taskFilter,  BindingResult result) {
		taskFilter = new FilterTaskObj();
		ModelAndView modelView = new ModelAndView();
		taskFilter.setMyCreatedTaskOnly(true);
		modelView = view_open_task_form_user( page,sortBy, taskFilter, result);
		modelView.setViewName("task/view_openMyCreatedTask");
		return modelView;
	 }	

	 //@RequestMapping("/workload/view_open_my_assigned_task_form_user")
	 @RequestMapping("/view_open_my_assigned_task_form_user")
	 public ModelAndView view_open_my_assigned_task_form_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TASK_FILTER_OBJ") FilterTaskObj taskFilter,  BindingResult result) {
		taskFilter.setMyAssignedTaskOnly(true);
		ModelAndView modelView = view_open_task_form_user(page,sortBy,taskFilter,result);
		modelView.setViewName("task/view_openMyAssignedTask");
		return modelView;
	 }	

	 //@RequestMapping(value="/workload/view_view_my_assigned_task")
	 @RequestMapping(value="/view_view_my_assigned_task")
	 public ModelAndView view_view_my_assigned_task(@RequestParam("taskId") long taskId,@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_view_task(taskId,taskRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","MY_ASSIGNED");
    	modelView.setViewName("task/view_Task");
    	return modelView;
	 }

    //@RequestMapping(value="/workload/view_form_edit_my_assigned_task")
	 @RequestMapping(value="/view_form_edit_my_assigned_task")
    public ModelAndView view_form_edit_my_assigned_task(@RequestParam("taskId") long taskId,@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_form_edit_task(taskId,taskRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","MY_ASSIGNED");
    	return modelView;
    }

	 //@PostMapping("/workload/edit_edit_my_assigned_task_form_user")
	 @PostMapping("/edit_edit_my_assigned_task_form_user")
	 public ModelAndView edit_edit_my_assigned_task_form_user(@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
		//taskRecorderObj.setNotifyTaskOwner(false);
		 ModelAndView mapview = edit_edit_task_form_user(taskRecorderObj,null); 
		mapview.setViewName("forward:view_open_task_form_user_filter_my_assigned");
		return mapview;
	 }

	//@RequestMapping("/workload/view_open_task_form_user_filter_my_assigned")
	 @RequestMapping("/view_open_task_form_user_filter_my_assigned")
	public ModelAndView view_open_task_form_user_filter_my_assigned( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TASK_FILTER_OBJ") FilterTaskObj taskFilter,  BindingResult result) {
		taskFilter = new FilterTaskObj();
		ModelAndView modelView = new ModelAndView();
		taskFilter.setMyAssignedTaskOnly(true);
		modelView = view_open_task_form_user( page,sortBy, taskFilter, result);
		modelView.setViewName("task/view_openMyAssignedTask");
		return modelView;
	 }	

	
	 //@RequestMapping("/workload/view_completed_task_form_user")
	 @RequestMapping("/view_completed_task_form_user")
	 public ModelAndView view_completed_task_form_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TASK_FILTER_OBJ") FilterTaskObj taskFilter,  BindingResult result) {
		taskFilter.setCompletedTaskOnly(true);
		ModelAndView modelView = view_open_task_form_user(page,sortBy,taskFilter,result);
		modelView.setViewName("task/view_completedTask");
		return modelView;
	 }	

	 //@RequestMapping(value="/workload/view_view_completed_task")
	 @RequestMapping(value="/view_view_completed_task")
	 public ModelAndView view_view_completed_task(@RequestParam("taskId") long taskId,@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_view_task(taskId,taskRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","COMPLETED_TASK");
    	modelView.setViewName("task/view_Task");
    	return modelView;
	 }

	 //@RequestMapping(value="/workload/view_form_edit_completed_task")
	 @RequestMapping(value="/view_form_edit_completed_task")
	 public ModelAndView view_form_edit_completed_task(@RequestParam("taskId") long taskId,@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_form_edit_task(taskId,taskRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","COMPLETED_TASK");
    	return modelView;
    }

	 //@PostMapping("/workload/edit_edit_completed_task_form_user")
	 @PostMapping("/edit_edit_completed_task_form_user")
	 public ModelAndView edit_edit_completed_task_form_user(@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
		 //taskRecorderObj.setNotifyTaskOwner(false);
		 ModelAndView mapview = edit_edit_task_form_user(taskRecorderObj,null); 
		mapview.setViewName("forward:view_completed_task_form_user_filter_completed");
		return mapview;
	 }
	 
	//@RequestMapping("/workload/view_completed_task_form_user_filter_completed")
	@RequestMapping("/view_completed_task_form_user_filter_completed")
	public ModelAndView view_completed_task_form_user_filter_completed( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("TASK_FILTER_OBJ") FilterTaskObj taskFilter,  BindingResult result) {
			taskFilter = new FilterTaskObj();
			ModelAndView modelView = new ModelAndView();
			taskFilter.setCompletedTaskOnly(true);
			modelView = view_open_task_form_user( page,sortBy, taskFilter, result);
			modelView.setViewName("task/view_completedTask");
			return modelView;
	}	
	 
	//@RequestMapping(value="/workload/view_form_delete_task")
	@RequestMapping(value="/view_form_delete_task")
    public ModelAndView view_form_delete_task(@RequestParam("taskId") long taskId,@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_view_task(taskId,taskRecorderObj,result);
		modelView.addObject("VIEW_SOURCE","OPEN_TASK");
    	modelView.setViewName("task/view_confirm_delete_task");
    	return modelView;
    }
	
	
	
  	public boolean delete_delete_task(@RequestParam(value = "taskId") long taskId) 
  	{
      	boolean isSuccess = false;
      	Udn_Task_Recorder_Obj taskRecorderObj = null;
      	try {
      		Optional<Udn_Task_Recorder_Entity> taskRecorderEntity = taskService.find_task_ById(taskId);
      		if(taskRecorderEntity.isPresent()) {
      			taskRecorderObj = new Udn_Task_Recorder_Obj(taskRecorderEntity.get());
      			taskRecorderObj.setNotifyTaskOwner(true);
      			taskService.deleteTaskById(taskId);
      			taskRecorderObj.setTaskStatus("Deleted");
      		}
      		isSuccess=true;
  		} catch (Exception e) {
  			isSuccess = false;
  			return isSuccess;
  		}
      	
      	if(taskRecorderObj.isNotifyTaskOwner()) {
			String subject = "Your Task <" + taskRecorderObj.getTaskId() + " > is updated and status is <" + taskRecorderObj.getTaskStatus() +">"; 
			notifyTaskTargetAudience(taskRecorderObj, subject, "TaskDeleted.ftl");
		}
      	
      	return isSuccess;
  	}
    
	
	
    //@PostMapping("/workload/delete_delete_task_form_user")
  	@PostMapping("/delete_delete_task_form_user")
  	public ModelAndView delete_delete_task_form_user(@RequestParam(value = "taskId") long taskId,final RedirectAttributes redirectAttrib)
  	{
      	 
      	boolean success =delete_delete_task(taskId); 		
      	//ModelAndView mapview = view_open_task_form_user("0","UpdatedAt",new FilterTaskObj(),null) ;
      	ModelAndView mapview = new ModelAndView("redirect:view_open_task_form_user");
      	if(success) {
      		redirectAttrib.addFlashAttribute("Success", "Task is Deleted Successfully. !!");
      		//mapview.addObject("Success", "Task is Deleted Successfully. !!");
      	}else {
      		redirectAttrib.addFlashAttribute("Error", "Error: Deleting Task. Please contact administrator!! ");
      		//mapview.addObject("Error", "Error: Deleting Task. Please contact administrator!! ");
      	}
      	
      	return mapview;
  	}
    
    /***************************************************************************/
    
    //@RequestMapping(value="/workload/view_form_delete_due_today_task")
  	@RequestMapping(value="/view_form_delete_due_today_task")
    public ModelAndView view_form_delete_due_today_task(@RequestParam("taskId") long taskId,@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_view_task(taskId,taskRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","DUE_TODAY");
    	modelView.setViewName("task/view_confirm_delete_task");
    	return modelView;
    }

    //@PostMapping("/workload/delete_delete_due_today_task")
  	@PostMapping("/delete_delete_due_today_task")
  	public ModelAndView delete_delete_due_today_task(@RequestParam(value = "taskId") long taskId)
  	{
    	ModelAndView modelView = new ModelAndView();
    	if(delete_delete_task(taskId)) {
    		modelView.addObject("Success", "Task is Deleted Successfully. !!");
        }
    	else {
    		modelView.addObject("Error", "Error: Deleting Task. Please contact administrator!! ");
        }
    	modelView.setViewName("forward:view_open_task_form_user_filter_due_today");
    	return modelView;
  	}
 
    /***************************************************************************/
    //@RequestMapping(value="/workload/view_form_delete_over_due_task")
  	@RequestMapping(value="/view_form_delete_over_due_task")
    public ModelAndView view_form_delete_over_due_task(@RequestParam("taskId") long taskId,@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_view_task(taskId,taskRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","OVER_DUE");
    	modelView.setViewName("task/view_confirm_delete_task");
    	return modelView;
    }
    
    //@PostMapping("/workload/delete_delete_overdue_task")
  	@PostMapping("/delete_delete_overdue_task")
   	public ModelAndView delete_delete_overdue_task(@RequestParam(value = "taskId") long taskId)
   	{
     	ModelAndView modelView = new ModelAndView();
     	if(delete_delete_task(taskId)) {
     		modelView.addObject("Success", "Task is Deleted Successfully. !!");
         }
     	else {
     		modelView.addObject("Error", "Error: Deleting Task. Please contact administrator!! ");
         }
     	modelView.setViewName("forward:view_open_task_form_user_filter_overdue");
     	return modelView;
   	}
    
    /***************************************************************************/
    
    //@RequestMapping(value="/workload/view_form_delete_my_created_task")
  	@RequestMapping(value="/view_form_delete_my_created_task")
    public ModelAndView view_form_delete_my_created_task(@RequestParam("taskId") long taskId,@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_view_task(taskId,taskRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","MY_CREATED");
    	modelView.setViewName("task/view_confirm_delete_task");
    	return modelView;
    }
    
    //@PostMapping("/workload/delete_delete_my_created_task")
  	@PostMapping("/delete_delete_my_created_task")
   	public ModelAndView delete_delete_my_created_task(@RequestParam(value = "taskId") long taskId)
   	{
     	ModelAndView modelView = new ModelAndView();
     	if(delete_delete_task(taskId)) {
     		modelView.addObject("Success", "Task is Deleted Successfully. !!");
         }
     	else {
     		modelView.addObject("Error", "Error: Deleting Task. Please contact administrator!! ");
         }
     	modelView.setViewName("forward:view_open_task_form_user_filter_my_created");
     	return modelView;
   	}
    
    /***************************************************************************/
    //@RequestMapping(value="/workload/view_form_delete_my_assigned_task")
  	@RequestMapping(value="/view_form_delete_my_assigned_task")
    public ModelAndView view_form_delete_my_assigned_task(@RequestParam("taskId") long taskId,@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_view_task(taskId,taskRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","MY_ASSIGNED");
    	modelView.setViewName("task/view_confirm_delete_task");
    	return modelView;
    }

    //@PostMapping("/workload/delete_delete_my_assigned_task")
  	@PostMapping("/delete_delete_my_assigned_task")
   	public ModelAndView delete_delete_my_assigned_task(@RequestParam(value = "taskId") long taskId)
   	{
     	ModelAndView modelView = new ModelAndView();
     	if(delete_delete_task(taskId)) {
     		modelView.addObject("Success", "Task is Deleted Successfully. !!");
         }
     	else {
     		modelView.addObject("Error", "Error: Deleting Task. Please contact administrator!! ");
         }
     	modelView.setViewName("forward:view_open_task_form_user_filter_my_assigned");
     	return modelView;
   	}
    
    /***************************************************************************/

    //@RequestMapping(value="/workload/view_form_delete_completed_task")
  	@RequestMapping(value="/view_form_delete_completed_task")
    public ModelAndView view_form_delete_completed_task(@RequestParam("taskId") long taskId,@ModelAttribute("TASK_RECORDER_OBJ") Udn_Task_Recorder_Obj taskRecorderObj,  BindingResult result) {
    	ModelAndView modelView = view_view_task(taskId,taskRecorderObj,result);
    	modelView.addObject("VIEW_SOURCE","COMPLETED_TASK");
    	modelView.setViewName("task/view_confirm_delete_task");
    	return modelView;
    }
    
    //@PostMapping("/workload/delete_delete_completed_task")
  	@PostMapping("/delete_delete_completed_task")
   	public ModelAndView delete_delete_completed_task(@RequestParam(value = "taskId") long taskId)
   	{
     	ModelAndView modelView = new ModelAndView();
     	if(delete_delete_task(taskId)) {
     		modelView.addObject("Success", "Task is Deleted Successfully. !!");
         }
     	else {
     		modelView.addObject("Error", "Error: Deleting Task. Please contact administrator!! ");
         }
     	modelView.setViewName("forward:view_completed_task_form_user_filter_completed");
     	return modelView;
   	}

    
}

