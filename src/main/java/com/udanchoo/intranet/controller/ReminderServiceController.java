package com.udanchoo.intranet.controller;


import java.io.IOException;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.mail.MessagingException;

import com.udanchoo.intranet.service.*;
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

    @Value("${whatsapp.template.lead.followup}")
    private String whatsappFollowupTemplateId;


    @Autowired
    WhatsAppServiceImpl whatsappService;

    @Value("${whatsapp.notify.active:false}")
    private boolean whatsappNotifyActive;
	
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
		ModelAndView mapview = new ModelAndView("reminder/viewReminderDetails");
		populateReminderServiceObj(leadId, reminderServiceObj);
		mapview.addObject("page", page);
		
		List<TtsLeadsReminderRecorderVO> leadsReminderVoList = reminderService.listAllLeadsReminderDetails(leadId);
		mapview.addObject("LEADS_REMINDER_RECORDS",leadsReminderVoList);

		return mapview;
	}

	@RequestMapping("/form_view_lead_reminder_confirmation")
	public ModelAndView form_view_lead_reminder_confirmation(long leadId, @RequestParam(defaultValue = "0") String page,@ModelAttribute("REMINDER_SERVICE") ReminderServiceObj reminderServiceObj,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView modelView = new ModelAndView("reminder/viewReminderServiceConfirmation");
		populateReminderServiceObj(leadId, reminderServiceObj);
		
		List<TtsLeadsReminderRecorderVO> leadsReminderVoList = reminderService.listAllLeadsReminderDetails(leadId);
		modelView.addObject("LEADS_REMINDER_RECORDS",leadsReminderVoList);

		return modelView;
	}

	private void populateReminderServiceObj(long leadId, ReminderServiceObj reminderServiceObj) {
		UserDetailsObj loggedUser = getLoggedInUser();
		TgLeadsRecorderVO leadRecorderObj = new TgLeadsRecorderVO(); 
		leadRecorderObj.setLeadId(leadId);
		Tg_Leads_Recorder_Entity tgLeadEntity =leadService.findLeadRecordById(leadRecorderObj.getLeadId());
		leadRecorderObj.updateLeadVoFromEntity(tgLeadEntity);
		leadService.updateLeadVoFromEntity(tgLeadEntity,leadRecorderObj);
		reminderServiceObj.setLeadsRecorderObj(leadRecorderObj);
		
		EmailMessageVO emailMessageVo = reminderServiceObj.getEmailMessageVo();
		if (emailMessageVo == null) {
			emailMessageVo = new EmailMessageVO();
			reminderServiceObj.setEmailMessageVo(emailMessageVo);
		}
		
		ClientObj client = clientService.find_ClientBy_Id(leadRecorderObj.getContactId());
		emailMessageVo.setEmailToList(client.getEmail());
    	emailMessageVo.setEmailSubject("Reminder: Your Upcoming Travel plan for Query Id: UDN-" + leadRecorderObj.getLeadId() + "-" + leadRecorderObj.getLeadSourceShortName());
    	emailMessageVo.setEmailMessage("This is to remind you that we are eagerly waiting to serve you and we are worried that we have not heard it back from you. Kindly contact us for your best deal." );

    	Map<String, Object> smsValuesMap=new HashMap<String, Object>();
    	smsValuesMap.put("CONTACT_NAME",client.getClientName());
    	smsValuesMap.put("COMPANY_NAME",COMPANY_NAME);
    	smsValuesMap.put("USER_NAME",loggedUser.getName());
    	smsValuesMap.put("USER_MOBILE",loggedUser.getMobile());
    	
    	String message = UdanChooUtil.notificationMessagesList().getProperty(UdanChooConstants.QUERY_REMINDER_MESSAGE);
    	message = UdanChooUtil.replacePlaceholders(message,smsValuesMap);
    	
    	SMS smsMessage = reminderServiceObj.getSmsVo();
		if (smsMessage == null) {
			smsMessage = new SMS();
			reminderServiceObj.setSmsVo(smsMessage);
		}
    	smsMessage.setTo(client.getMobile());
    	smsMessage.setMessage(message);
	}

    @PostMapping(value="/send_send_leadReminder")
    public ModelAndView send_send_leadReminder(
            @RequestParam(value = "action", required = false) String action,
            @ModelAttribute("REMINDER_SERVICE") ReminderServiceObj reminderServiceObj,
            BindingResult result,
            final RedirectAttributes redirectAttrib) {

        Long leadId = reminderServiceObj.getLeadsRecorderObj().getLeadId();

        Tts_Lead_Reminder_Recorder_Entity entity = new Tts_Lead_Reminder_Recorder_Entity();
        entity.setLeadId(leadId);
        entity.setSmsSent(false);
        entity.setEmailSent(false);
        entity.setWhatsappSent(false);

        boolean sentSuccessfully = false;

        if ("sms".equals(action)) {
            int smsCode = send_send_smsReminder(reminderServiceObj, result, redirectAttrib);
            sentSuccessfully = (smsCode == 200);
            entity.setSmsSent(sentSuccessfully);
        } else if ("email".equals(action)) {
            int emailCode = send_send_emailReminder(reminderServiceObj, result, redirectAttrib);
            sentSuccessfully = (emailCode == 0);
            entity.setEmailSent(sentSuccessfully);
        } else if ("whatsapp".equals(action)) {
            if (whatsappNotifyActive) {
                sentSuccessfully = sendReminderWhatsApp(reminderServiceObj);
            }
            entity.setWhatsappSent(sentSuccessfully);
        }

        // Save history (single entry for the attempted action)
        if (action != null && (action.equals("sms") || action.equals("email") || action.equals("whatsapp"))) {
            reminderService.saveLeadsReminderRecorder(entity);
        }

        if (sentSuccessfully) {
            redirectAttrib.addFlashAttribute("Success", "Reminder sent successfully.");
        } else {
            redirectAttrib.addFlashAttribute("Failure", "Reminder could not be sent.");
        }

        return new ModelAndView("redirect:form_view_lead_reminder_confirmation?leadId=" + leadId);
    }
	
	private int send_send_emailReminder(@ModelAttribute("REMINDER_SERVICE") ReminderServiceObj reminderServiceObj,BindingResult result,final RedirectAttributes redirectAttrib) {
		int executionStatus = -1;
		UserDetailsObj loggedUser = getLoggedInUser();

        EmailMessageVO emailMessageVo = reminderServiceObj.getEmailMessageVo();

        if (emailMessageVo == null) {
            emailMessageVo = new EmailMessageVO();
            reminderServiceObj.setEmailMessageVo(emailMessageVo);
        }
		emailMessageVo.setReminderServiceMessage(true);
		emailValidator.validate(emailMessageVo, result);
    	//System.out.println("Email Validator Rsult is " + result);
        if (result.hasErrors()) {
            result.getAllErrors().forEach(e -> System.out.println(e));
            return -1;
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


    private boolean sendReminderWhatsApp(ReminderServiceObj reminderServiceObj) {

        try {
            TgLeadsRecorderVO leadVO = reminderServiceObj.getLeadsRecorderObj();
            Tg_Leads_Recorder_Entity leadEntity = leadService.findLeadRecordById(leadVO.getLeadId());

            ClientObj client = clientService.find_ClientBy_Id(leadEntity.getContactId());
            UserDetailsObj rep = getLoggedInUser();

            // Use SAME reference format everywhere
            String leadRef = "Q-" + leadEntity.getLeadId() + "-" +
                    b2bPartnerService.findPartnerById(leadEntity.getLeadSource()).getPartnerShortName();

            String status = commonService
                    .find_DealStatusById(leadEntity.getLeadStatus())
                    .getWorkloadStatusName();

            Map<Integer, String> params = new HashMap<>();
            params.put(1, client.getClientName());
            params.put(2, leadRef);
            params.put(3, rep.getName());
            params.put(4, status);
            params.put(5, String.valueOf(rep.getMobile()));  // ✅ FIXED
            params.put(6, rep.getEmail());

            boolean sent = whatsappService.sendTemplateMessage(
                    String.valueOf(client.getMobile()),
                    whatsappFollowupTemplateId,
                    params
            );

            if (sent) {
                System.out.println("WhatsApp SENT successfully to: " + client.getMobile());
            } else {
                System.out.println("WhatsApp FAILED for: " + client.getMobile());
            }

            return sent;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
	
}

