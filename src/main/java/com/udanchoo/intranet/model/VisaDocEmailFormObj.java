package com.udanchoo.intranet.model;

import java.util.ArrayList;
import java.util.List;

public class VisaDocEmailFormObj extends EmailMessageVO{
	
	private ArrayList<Integer> visaIdListToEmail;
	private String visaCostToIncludeList;
	private String countryCode;
	private String countryName;
	
	/*private String emailToList;
	private String emailCcList;
	private String emailSubject;
	*/
	
	private List<Udn_Visa_Master_Obj> visaObjectListForEmail;
	
	
	public ArrayList<Integer> getVisaIdListToEmail() {
		return visaIdListToEmail;
	}
	public void setVisaIdListToEmail(ArrayList<Integer> visaIdListToEmail) {
		this.visaIdListToEmail = visaIdListToEmail;
	}
	public String getVisaCostToIncludeList() {
		return visaCostToIncludeList;
	}
	public void setVisaCostToIncludeList(String visaCostToIncludeList) {
		this.visaCostToIncludeList = visaCostToIncludeList;
	}

	public String toString() {
		String attrib = " Displaying Visa Doc Email Form " + "\n";
		attrib = attrib + "visaIdListToEmail -> " + visaIdListToEmail + "\n";
		attrib = attrib + "visaCostToIncludeList -> " + visaCostToIncludeList + "\n";
		attrib = attrib + "visaObjectListForEmail -> " + visaObjectListForEmail + "\n";
		
		return attrib;
	}
	
	/*
	public String getEmailToList() {
		return emailToList;
	}
	public void setEmailToList(String emailToList) {
		this.emailToList = emailToList;
	}
	public String getEmailCcList() {
		return emailCcList;
	}
	public void setEmailCcList(String emailCcList) {
		this.emailCcList = emailCcList;
	}
	public String getEmailSubject() {
		return emailSubject;
	}
	public void setEmailSubject(String emailSubject) {
		this.emailSubject = emailSubject;
	}
	*/
	
	public List<Udn_Visa_Master_Obj> getVisaObjectListForEmail() {
		return visaObjectListForEmail;
	}
	public void setVisaObjectListForEmail(List<Udn_Visa_Master_Obj> visaObjectListForEmail) {
		this.visaObjectListForEmail = visaObjectListForEmail;
	}
	public String getCountryName() {
		return countryName;
	}
	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}
	public String getCountryCode() {
		return countryCode;
	}
	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}
	
	
			
}