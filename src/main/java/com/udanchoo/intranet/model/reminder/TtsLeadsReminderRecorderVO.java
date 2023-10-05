package com.udanchoo.intranet.model.reminder;

import com.udanchoo.intranet.entity.reminder.Tts_Lead_Reminder_Recorder_Entity;


public class TtsLeadsReminderRecorderVO extends Tts_Lead_Reminder_Recorder_Entity{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

 	public TtsLeadsReminderRecorderVO() {

	}
	
 	public void updateLeadVoFromEntity(Tts_Lead_Reminder_Recorder_Entity ttsLeadsReminderRecorderEntity) {
 		this.leadReminderId=ttsLeadsReminderRecorderEntity.getLeadReminderId();
		this.leadId=ttsLeadsReminderRecorderEntity.getLeadId();
		this.smsSent=ttsLeadsReminderRecorderEntity.isSmsSent();
		this.emailSent=ttsLeadsReminderRecorderEntity.isEmailSent();
	}
 	
	public TtsLeadsReminderRecorderVO(Tts_Lead_Reminder_Recorder_Entity ttsLeadsReminderRecorderEntity) {
		this.leadReminderId=ttsLeadsReminderRecorderEntity.getLeadReminderId();
		this.leadId=ttsLeadsReminderRecorderEntity.getLeadId();
		this.smsSent=ttsLeadsReminderRecorderEntity.isSmsSent();
		this.emailSent=ttsLeadsReminderRecorderEntity.isEmailSent();
		this.setCreatedAt(ttsLeadsReminderRecorderEntity.getCreatedAt());

	}


	
}
