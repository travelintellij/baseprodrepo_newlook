package com.udanchoo.intranet.model;

import java.util.ArrayList;
import java.util.List;

public class VisaServiceStatusEmailFormObj  {
	
	//Following list contains all the visa service line objects for a particular deal.
	private List<VisaServiceLineVO> visaServiceListForEmail;
	
	// following list will get populated when the user selects the number of visa to be forwards to the client for status. 
	private ArrayList<String> visaIdListToEmail;
	private EmailMessageVO emailMessageVo;
	
	public String toString() {
		String attrib = " Displaying Visa Service Line Status Email Form " + "\n";
		//attrib = attrib + "visaIdListToEmail -> " + visaIdListToEmail + "\n";
		
		attrib = attrib + "visaServiceListForEmail -> " + visaServiceListForEmail + "\n";
		
		attrib = attrib + "visaIdListToEmail -> " + visaIdListToEmail + "\n";
		
		return attrib;
	}

	public List<VisaServiceLineVO> getVisaServiceListForEmail() {
		return visaServiceListForEmail;
	}

	public void setVisaServiceListForEmail(List<VisaServiceLineVO> visaServiceListForEmail) {
		this.visaServiceListForEmail = visaServiceListForEmail;
	}

	public ArrayList<String> getVisaIdListToEmail() {
		return visaIdListToEmail;
	}

	public void setVisaIdListToEmail(ArrayList<String> visaIdListToEmail) {
		this.visaIdListToEmail = visaIdListToEmail;
	}

	public EmailMessageVO getEmailMessageVo() {
		return emailMessageVo;
	}

	public void setEmailMessageVo(EmailMessageVO emailMessageVo) {
		this.emailMessageVo = emailMessageVo;
	}

	

			
}