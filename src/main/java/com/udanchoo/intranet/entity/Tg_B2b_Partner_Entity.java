package com.udanchoo.intranet.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.udanchoo.intranet.model.Tg_B2bPartner_Obj;

@Entity
@Table(name = "tg_b2b_partners")
public class Tg_B2b_Partner_Entity extends AuditModel {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	protected int partnerId;

	protected String partnerShortName; 
	protected String partnerBrandName;
	protected String partnerName ;
	protected String address ;
	protected long mobile ;
	protected long cityId ;
	protected String email;
	protected String gstNumber; 
	protected String remarks; 
	protected String website;
	protected boolean active; 
		
	
	
	
	public Tg_B2b_Partner_Entity(Tg_B2bPartner_Obj partnerObj) {
		this.partnerId = partnerObj.getPartnerId();
		this.partnerShortName = partnerObj.getPartnerShortName();
		this.partnerBrandName = partnerObj.getPartnerBrandName();
		this.partnerName = partnerObj.getPartnerName();
		this.address = partnerObj.getAddress();
		this.mobile = partnerObj.getMobile();
		this.cityId = partnerObj.getCityId();
		this.email = partnerObj.getEmail();
		this.gstNumber = partnerObj.getGstNumber();
		this.remarks = partnerObj.getRemarks();
		this.website = partnerObj.getWebsite();
		this.active = partnerObj.isActive();
	}



	public int getPartnerId() {
		return partnerId;
	}



	public void setPartnerId(int partnerId) {
		this.partnerId = partnerId;
	}



	public String getPartnerShortName() {
		return partnerShortName;
	}



	public void setPartnerShortName(String partnerShortName) {
		this.partnerShortName = partnerShortName;
	}



	public String getPartnerName() {
		return partnerName;
	}



	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}



	public String getAddress() {
		return address;
	}



	public void setAddress(String address) {
		this.address = address;
	}



	public long getMobile() {
		return mobile;
	}



	public void setMobile(long mobile) {
		this.mobile = mobile;
	}



	public long getCityId() {
		return cityId;
	}



	public void setCityId(long cityId) {
		this.cityId = cityId;
	}



	public String getGstNumber() {
		return gstNumber;
	}



	public void setGstNumber(String gstNumber) {
		this.gstNumber = gstNumber;
	}



	public String getRemarks() {
		return remarks;
	}



	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}



	public boolean isActive() {
		return active;
	}



	public void setActive(boolean active) {
		this.active = active;
	}



	

	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPartnerBrandName() {
		return partnerBrandName;
	}



	public void setPartnerBrandName(String partnerBrandName) {
		this.partnerBrandName = partnerBrandName;
	}



	public Tg_B2b_Partner_Entity() {}



	public String getWebsite() {
		return website;
	}



	public void setWebsite(String website) {
		this.website = website;
	}
	
	
}