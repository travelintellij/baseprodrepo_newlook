package com.udanchoo.intranet.entity.reminder;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.udanchoo.intranet.entity.AuditModel;
import com.udanchoo.intranet.model.reminder.TtsLeadsReminderRecorderVO;

@Entity
@Table(name = "tts_lead_reminder_recorder_service")
public class Tts_Lead_Reminder_Recorder_Entity extends AuditModel {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long leadReminderId;

	protected Long leadId;
	protected boolean smsSent;
	protected boolean emailSent;
	
	
		
	public Tts_Lead_Reminder_Recorder_Entity() {

	}
	
	public Tts_Lead_Reminder_Recorder_Entity(TtsLeadsReminderRecorderVO leadsReminderRecorderVo) {
		this.leadReminderId=leadsReminderRecorderVo.getLeadReminderId();
		this.leadId=leadsReminderRecorderVo.getLeadId();
		this.smsSent=leadsReminderRecorderVo.isSmsSent();
		this.emailSent=leadsReminderRecorderVo.isEmailSent();
	}

	public Long getLeadReminderId() {
		return leadReminderId;
	}

	public void setLeadReminderId(Long leadReminderId) {
		this.leadReminderId = leadReminderId;
	}

	public Long getLeadId() {
		return leadId;
	}

	public void setLeadId(Long leadId) {
		this.leadId = leadId;
	}

	public boolean isSmsSent() {
		return smsSent;
	}

	public void setSmsSent(boolean smsSent) {
		this.smsSent = smsSent;
	}

	@Override
	public String toString() {
		return "Tts_Lead_Reminder_Recorder_Entity [leadReminderId=" + leadReminderId + ", leadId=" + leadId
				+ ", smsSent=" + smsSent + ", emailSent=" + emailSent + "]";
	}

	public boolean isEmailSent() {
		return emailSent;
	}

	public void setEmailSent(boolean emailSent) {
		this.emailSent = emailSent;
	}
	
}
