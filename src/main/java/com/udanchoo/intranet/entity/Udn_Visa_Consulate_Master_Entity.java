package com.udanchoo.intranet.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.udanchoo.intranet.model.Udn_Visa_Consulate_Master_Obj;

@Entity
@Table(name = "udn_visa_consulate")
public class Udn_Visa_Consulate_Master_Entity extends AuditModel {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	protected int consulateId;

	protected String consulateTitle;
	protected int consulateCity;
	protected String visaCountryCode;
	protected String address;
	protected String email;
	
	protected String telephone;
	protected String website;
	protected String fax;
	protected boolean active=true;
	
	public String toString() {

		String attrib = "Displaying Visa Consulate Entity Obj: \n";
		attrib = attrib +" consulateId -> " + consulateId + "\n";
		attrib = attrib +" consulateTitle -> " + consulateTitle + "\n";
		attrib = attrib +" consulateCity-> " +consulateCity + "\n";
		attrib = attrib +" visaCountryCode-> " + visaCountryCode+ "\n";
		attrib = attrib +" address -> " + address+ "\n";
		attrib = attrib +" email -> " + email+ "\n";
		attrib = attrib +" telephone -> " +telephone + "\n";
		attrib = attrib +" website -> " +website + "\n";
		attrib = attrib +" fax -> " +fax + "\n";
		attrib = attrib +" active -> " + active + "\n";
		
		return attrib;
	}

	public Udn_Visa_Consulate_Master_Entity() {
	
	}
	public Udn_Visa_Consulate_Master_Entity(Udn_Visa_Consulate_Master_Obj consulateObj) {
		this.consulateId=consulateObj.getConsulateId();
		this.consulateTitle=consulateObj.getConsulateTitle();
		this.consulateCity=consulateObj.getConsulateCity();
		this.visaCountryCode=consulateObj.getVisaCountryCode();
		this.address=consulateObj.getAddress();
		this.email=consulateObj.getEmail();
		this.telephone=consulateObj.getTelephone();
		this.website=consulateObj.getWebsite();
		this.fax=consulateObj.getFax();
		this.active=consulateObj.isActive();

	}

	
	public int getConsulateId() {
		return consulateId;
	}

	public void setConsulateId(int consulateId) {
		this.consulateId = consulateId;
	}

	public int getConsulateCity() {
		return consulateCity;
	}

	public void setConsulateCity(int consulateCity) {
		this.consulateCity = consulateCity;
	}


	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getConsulateTitle() {
		return consulateTitle;
	}

	public void setConsulateTitle(String consulateTitle) {
		this.consulateTitle = consulateTitle;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getVisaCountryCode() {
		return visaCountryCode;
	}

	public void setVisaCountryCode(String visaCountryCode) {
		this.visaCountryCode = visaCountryCode;
	}

	
	
	
}