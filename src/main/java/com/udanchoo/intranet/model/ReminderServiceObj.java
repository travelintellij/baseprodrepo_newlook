package com.udanchoo.intranet.model;

import com.tts.communication.mode.vo.SMS;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.model.quotation.TgQuotationRecorderVO;

public class ReminderServiceObj {
	public TgLeadsRecorderVO leadsRecorderObj;
	public EmailMessageVO emailMessageVo = new EmailMessageVO();
	public boolean isSmsReminder;
	public boolean isEmailReminder;
	public boolean bothSmsAndEmailReminder;
	public TgQuotationRecorderVO quotationRecorderObj;
	public SMS smsVo;
	
	public TgLeadsRecorderVO getLeadsRecorderObj() {
		return leadsRecorderObj;
	}
	public void setLeadsRecorderObj(TgLeadsRecorderVO leadsRecorderObj) {
		this.leadsRecorderObj = leadsRecorderObj;
	}
	public EmailMessageVO getEmailMessageVo() {
		return emailMessageVo;
	}
	public void setEmailMessageVo(EmailMessageVO emailMessageVo) {
		this.emailMessageVo = emailMessageVo;
	}
	public boolean isSmsReminder() {
		return isSmsReminder;
	}
	public void setSmsReminder(boolean isSmsReminder) {
		this.isSmsReminder = isSmsReminder;
	}
	public boolean isEmailReminder() {
		return isEmailReminder;
	}
	public void setEmailReminder(boolean isEmailReminder) {
		this.isEmailReminder = isEmailReminder;
	}
	public boolean isBothSmsAndEmailReminder() {
		return bothSmsAndEmailReminder;
	}
	public void setBothSmsAndEmailReminder(boolean bothSmsAndEmailReminder) {
		this.bothSmsAndEmailReminder = bothSmsAndEmailReminder;
	}
	public TgQuotationRecorderVO getQuotationRecorderObj() {
		return quotationRecorderObj;
	}
	public void setQuotationRecorderObj(TgQuotationRecorderVO quotationRecorderObj) {
		this.quotationRecorderObj = quotationRecorderObj;
	}
	public SMS getSmsVo() {
		return smsVo;
	}
	public void setSmsVo(SMS smsVo) {
		this.smsVo = smsVo;
	}
	@Override
	public String toString() {
		return "ReminderServiceObj [leadsRecorderObj=" + leadsRecorderObj + ", emailMessageVo=" + emailMessageVo
				+ ", isSmsReminder=" + isSmsReminder + ", isEmailReminder=" + isEmailReminder
				+ ", bothSmsAndEmailReminder=" + bothSmsAndEmailReminder + ", quotationRecorderObj="
				+ quotationRecorderObj + ", smsVo=" + smsVo + "]";
	}
	
	
	
	
}
