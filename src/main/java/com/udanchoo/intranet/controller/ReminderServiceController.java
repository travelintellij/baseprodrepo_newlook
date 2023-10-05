package com.udanchoo.intranet.controller;


import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tts.communication.mode.vo.SMS;
import com.udanchoo.intranet.entity.UdnClientEntity;
import com.udanchoo.intranet.entity.Udn_Deal_LDP_SL_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.entity.reminder.Tts_Lead_Reminder_Recorder_Entity;
import com.udanchoo.intranet.model.ClientObj;
import com.udanchoo.intranet.model.EmailMessageVO;
import com.udanchoo.intranet.model.ReminderServiceObj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.model.reminder.TtsLeadsReminderRecorderVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.EmailServiceImpl;
import com.udanchoo.intranet.service.LeadServiceImpl;
import com.udanchoo.intranet.service.QuotationServiceImpl;
import com.udanchoo.intranet.service.ReminderServiceImpl;
import com.udanchoo.intranet.service.TgB2bPartnerServicesImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.util.UdanChooUtil;
import com.udanchoo.intranet.validator.EmailAudienceValidator;

import freemarker.template.TemplateException;

@Controller
public class ReminderServiceController {
	 
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
/*
	@Autowired
    private PackageQuotationValidator packageQtnValidator;
*/
	
	@Autowired
	LeadServiceImpl leadService;
	
	@Autowired
	QuotationServiceImpl quotationService;
	
	@Autowired
	EmailServiceImpl emailService;

	@Autowired
	ClientServiceImpl clientService;

	@Autowired
	UserDetailsServiceImpl userService;

	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	TgB2bPartnerServicesImpl b2bPartnerService;
	
	@Value("${all.email.notify.communication.active}")
	private boolean emailNotifyActive;
	
	@Value("${email.client.valid}")
	private boolean emailClientNotifyActive;

	@Value("${COMPANY_NAME}")
	private String COMPANY_NAME;

	
	@Autowired
    private EmailAudienceValidator emailValidator;

	@Autowired
	ReminderServiceImpl reminderService;
	
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
	

	@RequestMapping("/form_view_lead_reminder_details")
	public ModelAndView form_view_lead_reminder_details(long leadId, @RequestParam(defaultValue = "0") String page,@ModelAttribute("REMINDER_SERVICE") ReminderServiceObj reminderServiceObj,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj loggedUser = getLoggedInUser();
		ModelAndView mapview = new ModelAndView("reminder/viewReminderDetails");
		TgLeadsRecorderVO leadRecorderObj = new TgLeadsRecorderVO(); 
		leadRecorderObj.setLeadId(leadId);
		Tg_Leads_Recorder_Entity tgLeadEntity =leadService.findLeadRecordById(leadRecorderObj.getLeadId());
		leadRecorderObj.updateLeadVoFromEntity(tgLeadEntity);
		leadService.updateLeadVoFromEntity(tgLeadEntity,leadRecorderObj);
		reminderServiceObj.setLeadsRecorderObj(leadRecorderObj);
		EmailMessageVO emailMessageVo = new EmailMessageVO();
		
		ClientObj client = clientService.find_ClientBy_Id(leadRecorderObj.getContactId());
		emailMessageVo.setEmailToList(client.getEmail());
    	emailMessageVo.setEmailSubject("Reminder: Your Upcoming Travel plan for Query Id: UDN-" + leadRecorderObj.getLeadId() + "-" + leadRecorderObj.getLeadSourceShortName());
    	emailMessageVo.setEmailMessage("This is to remind you that we are eagerly waiting to serve you and we are worried that we have not heard it back from you. Kindly contact us for your best deal." );
    	reminderServiceObj.setEmailMessageVo(emailMessageVo);

    	//String message = "Dear " + client.getClientName() +", This is to remind you that we are eagerly waiting to hear for your upcoming travel plan. Please share an update as we are eager to serve you. Thx " + COMPANY_NAME +  " " + loggedUser.getName() + " " +  loggedUser.getMobile() ;
    	Map<String, Object> smsValuesMap=new HashMap<String, Object>();
    	smsValuesMap.put("CONTACT_NAME",client.getClientName());
    	smsValuesMap.put("COMPANY_NAME",COMPANY_NAME);
    	smsValuesMap.put("USER_NAME",loggedUser.getName());
    	smsValuesMap.put("USER_MOBILE",loggedUser.getMobile());
    	//String message = "Dear %(CONTACT_NAME), This is to remind you that we are eagerly waiting to hear for your upcoming travel plan. Please share an update as we are eager to serve you. Thx %(COMPANY_NAME) %(USER_NAME) %(USER_MOBILE)";
    	String message = UdanChooUtil.notificationMessagesList().getProperty(UdanChooConstants.QUERY_REMINDER_MESSAGE);
    	message = UdanChooUtil.replacePlaceholders(message,smsValuesMap);
    	SMS smsMessage = new SMS();
    	smsMessage.setTo(client.getMobile());
    	smsMessage.setMessage(message);
    	reminderServiceObj.setSmsVo(smsMessage);
    	mapview.addObject("page", page);
    	
		List<TtsLeadsReminderRecorderVO> leadsReminderVoList = reminderService.listAllLeadsReminderDetails(leadId);
		mapview.addObject("LEADS_REMINDER_RECORDS",leadsReminderVoList);

		return mapview;
	}

	@RequestMapping("/form_view_lead_reminder_confirmation")
	public ModelAndView form_view_lead_reminder_confirmation(long leadId, @RequestParam(defaultValue = "0") String page,@ModelAttribute("REMINDER_SERVICE") ReminderServiceObj reminderServiceObj,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView modelView = new ModelAndView();
		//modelView = form_view_lead_reminder_details(reminderServiceObj.getLeadsRecorderObj().getLeadId(),"0",reminderServiceObj,result,redirectAttrib);
		TgLeadsRecorderVO leadRecorderObj = new TgLeadsRecorderVO(); 
		leadRecorderObj.setLeadId(leadId);
		Tg_Leads_Recorder_Entity tgLeadEntity =leadService.findLeadRecordById(leadRecorderObj.getLeadId());
		leadRecorderObj.updateLeadVoFromEntity(tgLeadEntity);
		leadService.updateLeadVoFromEntity(tgLeadEntity,leadRecorderObj);
		reminderServiceObj.setLeadsRecorderObj(leadRecorderObj);
		
		List<TtsLeadsReminderRecorderVO> leadsReminderVoList = reminderService.listAllLeadsReminderDetails(leadId);
		modelView.addObject("LEADS_REMINDER_RECORDS",leadsReminderVoList);

		modelView.setViewName("reminder/viewReminderServiceConfirmation");
		return modelView;
	}
	
	@PostMapping(value="/send_send_leadReminder")
	public ModelAndView send_send_leadReminder(@ModelAttribute("REMINDER_SERVICE") ReminderServiceObj reminderServiceObj,BindingResult result,final RedirectAttributes redirectAttrib) {
		int smsSuccessCode=0;
		int emailSuccessCode;
		ModelAndView modelView = new ModelAndView("redirect:form_view_lead_reminder_confirmation?leadId="+reminderServiceObj.getLeadsRecorderObj().getLeadId());
		//ModelAndView modelView = new ModelAndView("reminder/viewReminderDetails");
		if(reminderServiceObj.isBothSmsAndEmailReminder()) {
			emailSuccessCode = send_send_emailReminder(reminderServiceObj,result,redirectAttrib);
			if(emailSuccessCode==0) {
				Tts_Lead_Reminder_Recorder_Entity ttsLeadsReminderEntity = new Tts_Lead_Reminder_Recorder_Entity();
				ttsLeadsReminderEntity.setLeadId(reminderServiceObj.getLeadsRecorderObj().getLeadId());
				ttsLeadsReminderEntity.setEmailSent(true);
				smsSuccessCode = send_send_smsReminder(reminderServiceObj,result,redirectAttrib);
				if(smsSuccessCode==200) {
					redirectAttrib.addFlashAttribute("Success","Success: SMS & Email Reminders sent successfully.  ");
					ttsLeadsReminderEntity.setSmsSent(true);
				}else {
					redirectAttrib.addFlashAttribute("Success","Success: Email Sent Successfully <br> <font color='red'>Failure: SMS Reminders sending failed.</font>  ");
				}
				reminderService.saveLeadsReminderRecorder(ttsLeadsReminderEntity);
			}
			/*else if(smsSuccessCode==200 && emailSuccessCode!=0) {
				redirectAttrib.addFlashAttribute("Success","Success: SMS Sent Successfully <br> <font color='red'>Failure: Email Reminders sending failed.</font>  ");
				modelView = form_view_lead_reminder_details(reminderServiceObj.getLeadsRecorderObj().getLeadId(),"0",reminderServiceObj,result,redirectAttrib);
			}
			else if (smsSuccessCode!=200 && emailSuccessCode==0) {
				redirectAttrib.addFlashAttribute("Success","Success: Email Sent Successfully <br> <font color='red'>Failure: SMS Reminders sending failed.</font>  ");
			}*/
			else {
				modelView = form_view_lead_reminder_details(reminderServiceObj.getLeadsRecorderObj().getLeadId(),"0",reminderServiceObj,result,redirectAttrib);
				//redirectAttrib.addFlashAttribute("Failure","Failure: Reminder Service Failed. Please contact Administrator !! ");
			}
		}
		else if(reminderServiceObj.isSmsReminder()) {
			//modelView.setViewName("forward:send_send_smsReminder");
			smsSuccessCode = send_send_smsReminder(reminderServiceObj,result,redirectAttrib);
			if(smsSuccessCode==200) {
				Tts_Lead_Reminder_Recorder_Entity ttsLeadsReminderEntity = new Tts_Lead_Reminder_Recorder_Entity();
				ttsLeadsReminderEntity.setLeadId(reminderServiceObj.getLeadsRecorderObj().getLeadId());
				ttsLeadsReminderEntity.setEmailSent(false);
				ttsLeadsReminderEntity.setSmsSent(true);
				reminderService.saveLeadsReminderRecorder(ttsLeadsReminderEntity);
				redirectAttrib.addFlashAttribute("Success","Success: SMS Reminder Sent Successfully. ");
			}
			else {
				redirectAttrib.addFlashAttribute("Failure","Failure: SMS reminder failed. Please contact Administrator.");
			}
		}
		else if(reminderServiceObj.isEmailReminder()) {
			emailSuccessCode = send_send_emailReminder(reminderServiceObj,result,redirectAttrib);
			if(emailSuccessCode==0) {
				Tts_Lead_Reminder_Recorder_Entity ttsLeadsReminderEntity = new Tts_Lead_Reminder_Recorder_Entity();
				ttsLeadsReminderEntity.setLeadId(reminderServiceObj.getLeadsRecorderObj().getLeadId());
				ttsLeadsReminderEntity.setEmailSent(true);
				ttsLeadsReminderEntity.setSmsSent(false);
				reminderService.saveLeadsReminderRecorder(ttsLeadsReminderEntity);
				redirectAttrib.addFlashAttribute("Success","Success: Email Reminder Sent Successfully. ");
			}
			else {
				modelView = form_view_lead_reminder_details(reminderServiceObj.getLeadsRecorderObj().getLeadId(),"0",reminderServiceObj,result,redirectAttrib);
				redirectAttrib.addFlashAttribute("Failure","Failure: Email Reminder failed. Please contact Administrator.  ");
			}
			//modelView.setViewName("forward:send_send_emailReminder");
		}
		return modelView;
	}
	
	private int send_send_emailReminder(@ModelAttribute("REMINDER_SERVICE") ReminderServiceObj reminderServiceObj,BindingResult result,final RedirectAttributes redirectAttrib) {
		int executionStatus =0;
		UserDetailsObj loggedUser = getLoggedInUser();
		
		EmailMessageVO emailMessageVo = reminderServiceObj.getEmailMessageVo();
		emailMessageVo.setReminderServiceMessage(true);
		emailValidator.validate(emailMessageVo, result);
    	//System.out.println("Email Validator Rsult is " + result);
		if(result.hasErrors()) {
			//modelview = form_view_lead_reminder_details(reminderServiceObj.getLeadsRecorderObj().getLeadId(),"0",reminderServiceObj,result,redirectAttrib);
    		//return modelview;
			executionStatus = -1;
    	}
		else {
			try {
				reminderService.send_lead_reminder_email_msg(emailMessageVo,reminderServiceObj.getLeadsRecorderObj().getContactName(),loggedUser);
				executionStatus=0;
				//redirectAttrib.addFlashAttribute("EMAIL","SMS Reminder is sent successfully");
			} catch (MessagingException e) {
				//redirectAttrib.addFlashAttribute("failure","FAIL: Email Reminder is failed. ");
				// TODO Auto-generated catch block
				executionStatus=-1;
				e.printStackTrace();
			} catch (IOException e) {
				executionStatus=-1;
				//redirectAttrib.addFlashAttribute("failure","FAIL: Email Reminder is failed. ");
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (TemplateException e) {
				executionStatus=-1;
				//redirectAttrib.addFlashAttribute("failure","FAIL: Email Reminder is failed. ");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return executionStatus;
	}

	
	private int send_send_smsReminder(@ModelAttribute("REMINDER_SERVICE") ReminderServiceObj reminderServiceObj,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj loggedUser = getLoggedInUser();
		SMS smsMessage = reminderServiceObj.getSmsVo();
		ModelAndView modelview = new ModelAndView("reminder/viewReminderDetails");
		int returnCode =reminderService.sendSms(String.valueOf(smsMessage.getTo()),smsMessage.getMessage());
		/*if(returnCode==200){
			redirectAttrib.addFlashAttribute("success","SMS Reminder is sent successfully");
		}else {
			redirectAttrib.addFlashAttribute("failure","FAIL: SMS Reminder is failed. ");
		}*/
		return returnCode;
	}
	
}

