package com.udanchoo.intranet.model;

import org.springframework.web.multipart.MultipartFile;

import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;

public class Tg_B2bPartner_Obj extends Tg_B2b_Partner_Entity{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String cityName;
	private MultipartFile logoFile;

	public Tg_B2bPartner_Obj() {}
	
	public Tg_B2bPartner_Obj(Tg_B2b_Partner_Entity agentEntity) {
		this.partnerId = agentEntity.getPartnerId();
		this.partnerName=agentEntity.getPartnerName();
		this.partnerShortName=agentEntity.getPartnerShortName();
		this.partnerBrandName=agentEntity.getPartnerBrandName();
		this.mobile=agentEntity.getMobile();
		this.address=agentEntity.getAddress();
		this.email = agentEntity.getEmail();
		this.gstNumber=agentEntity.getGstNumber();
		this.cityId=agentEntity.getCityId();
		this.website=agentEntity.getWebsite();
		this.active=agentEntity.isActive();
	}
	
	public void updateVoFromEntity(Tg_B2b_Partner_Entity agentEntity) {
		this.partnerId = agentEntity.getPartnerId();
		this.partnerName=agentEntity.getPartnerName();
		this.mobile=agentEntity.getMobile();
		this.partnerShortName=agentEntity.getPartnerShortName();
		this.partnerBrandName=agentEntity.getPartnerBrandName();
		this.address=agentEntity.getAddress();
		this.email = agentEntity.getEmail();
		this.cityId=agentEntity.getCityId();
		this.website=agentEntity.getWebsite();
		this.active=agentEntity.isActive();
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public MultipartFile getLogoFile() {
		return logoFile;
	}

	public void setLogoFile(MultipartFile logoFile) {
		this.logoFile = logoFile;
	}
	
	

}