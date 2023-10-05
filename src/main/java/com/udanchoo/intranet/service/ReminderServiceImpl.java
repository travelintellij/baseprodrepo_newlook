package com.udanchoo.intranet.service;


import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.udanchoo.intranet.entity.quotation.Udn_Manual_Flight_Quotation_Entity;
import com.udanchoo.intranet.entity.reminder.Tts_Lead_Reminder_Recorder_Entity;
import com.udanchoo.intranet.model.EmailMessageVO;
import com.udanchoo.intranet.model.Mail;
import com.udanchoo.intranet.model.UdnDealStatusVO;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.reminder.TtsLeadsReminderRecorderVO;
import com.udanchoo.intranet.repository.quotation.Udn_Manual_Flight_Quotation_Repository;
import com.udanchoo.intranet.repository.reminder.TTS_Leads_Reminder_Repository;

import freemarker.template.Configuration;
import freemarker.template.TemplateException;


@Service
public class ReminderServiceImpl {
	
	@Autowired
	EmailServiceImpl emailService;
	
	@Value("${email.client.from}")
	private String systemEmailFrom;
	
	@Value("${email.notify.communication.email}")
	private String emailNotifyBcc;
	
	@Value("${SMS_API_URL}")
	private String SMS_API_URL;

	@Value("${SMS_API_USER}")
	private String SMS_API_USER;

	@Value("${SMS_API_PASSWD}")
	private String SMS_API_PASSWD;
	
	@Value("${SMS_SENDER_ID}")
	private String SMS_SENDER_ID;
	
	@Value("${COMPANY_NAME}")
	private String COMPANY_NAME;
	
	@Autowired
	private Configuration freemarkerConfig;
	 
	@Value("${all.email.notify.communication.active}")
	private boolean emailNotifyActive;
	 
	
	@Autowired
	TTS_Leads_Reminder_Repository leadsReminderRepository;
	
	public boolean send_lead_reminder_email_msg(EmailMessageVO emailMessageVo,String recipientName,UserDetailsObj user) throws MessagingException, IOException, TemplateException {
		Mail mail = new Mail();
		mail.setSubject(emailMessageVo.getEmailSubject());
		InternetAddress[] emailToList = new InternetAddress[emailMessageVo.getEmailToValidatedList().size()];
		InternetAddress[] emailCcList = new InternetAddress[emailMessageVo.getEmailCcValidatedList().size()];
    	for (int i = 0; i < emailMessageVo.getEmailToValidatedList().size(); i++) {
			emailToList[i] = new InternetAddress((String) emailMessageVo.getEmailToValidatedList().get(i));
			//redirectAttrib.addFlashAttribute("Error","Error: While sending email. Recipients setting error.<br> Please send individually or contact adminstrator.");
    	}
    	for (int i = 0; i < emailMessageVo.getEmailCcValidatedList().size(); i++) {
			emailCcList[i] = new InternetAddress((String) emailMessageVo.getEmailCcValidatedList().get(i));
			//redirectAttrib.addFlashAttribute("Error","Error: While sending email. Recipients setting error.<br> Please send individually or contact adminstrator.");
    	}
		mail.setToList(emailToList);
		mail.setCcList(emailCcList);
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("CLIENT_NAME", recipientName);
        model.put("EMAIL_REMINDER_MSG", emailMessageVo.getEmailMessage());
        model.put("LOGGED_USER", user.getUsername());
        model.put("LOGGED_USER_MOBILE", user.getMobile());
        mail.setModel(model);
		emailService.sendEmailMessageUsingTemplate_MultipleRecipients_from_loggedInUser(mail,"QueryReminderAdvise.ftl",user.getEmail());
		//redirectAttrib.addFlashAttribute("Success","Email Document Checklist added to the mailing queue successfully!! ");
		return true;
	}

	public int sendSms(String sToPhoneNo,String sMessage)
    {
		int returnCode=0;
		//String ServerDomain = "http://smsinteract.in/SMSApi/send";
		//String ApiEndPoint = "/send";

		HttpClient httpclient = HttpClients.createDefault();
		HttpPost httppost = new HttpPost(SMS_API_URL);
		// Request parameters and other properties.
		List<BasicNameValuePair> params = new ArrayList<BasicNameValuePair>();
		params.add(new BasicNameValuePair("userid", SMS_API_USER));
		params.add(new BasicNameValuePair("password", SMS_API_PASSWD));
		params.add(new BasicNameValuePair("msg", sMessage));
		params.add(new BasicNameValuePair("msgType", "text"));
		params.add(new BasicNameValuePair("mobile", sToPhoneNo));
		params.add(new BasicNameValuePair("senderid", SMS_SENDER_ID));
		params.add(new BasicNameValuePair("sendMethod", "quick"));
		params.add(new BasicNameValuePair("format", "text"));
		params.add(new BasicNameValuePair("duplicatecheck", "true"));
		//params.add(new BasicNameValuePair("output", "json"));
		//params.add(new BasicNameValuePair("dltTemplateId", "xxxxxxxxxxxxx"));
		//params.add(new BasicNameValuePair("group", "name1,name2,id1,id2"));
		
		System.out.println("Params is \n " + params);
		try {
			httppost.setEntity(new UrlEncodedFormEntity(params, "UTF-8"));
			HttpResponse response = httpclient.execute(httppost);
			HttpEntity entity = response.getEntity();
			returnCode = response.getStatusLine().getStatusCode();
			System.out.println("StatusCode: " + returnCode);
			if (entity != null) {
				try (InputStream instream = entity.getContent()) {
					System.out.println(EntityUtils.toString(entity, "utf-8"));
				} catch (UnsupportedOperationException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return returnCode;
    }
	
	
	public Tts_Lead_Reminder_Recorder_Entity saveLeadsReminderRecorder(Tts_Lead_Reminder_Recorder_Entity leadsReminderRecorderEntity) {
		leadsReminderRepository.save(leadsReminderRecorderEntity);
		return leadsReminderRecorderEntity;
	}
	
	public List<TtsLeadsReminderRecorderVO> listAllLeadsReminderDetails(long leadId){
		List ttsLeadsReminderRecorderEntity = leadsReminderRepository.findByLeadIdOrderByCreatedAtDesc(leadId);
		Iterator itsTtsLeadsReminderEntity =ttsLeadsReminderRecorderEntity.iterator();
		List<TtsLeadsReminderRecorderVO> leadRecorderVOList = new ArrayList(); 
		while(itsTtsLeadsReminderEntity.hasNext()) {
			Tts_Lead_Reminder_Recorder_Entity leadReminderEntity = (Tts_Lead_Reminder_Recorder_Entity)itsTtsLeadsReminderEntity.next();
			TtsLeadsReminderRecorderVO leadsRecorderVo = new TtsLeadsReminderRecorderVO(leadReminderEntity);
			leadRecorderVOList.add(leadsRecorderVo);
			
		}
		return leadRecorderVOList;
	}
}