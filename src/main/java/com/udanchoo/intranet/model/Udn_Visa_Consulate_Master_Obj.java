package com.udanchoo.intranet.model;

import com.udanchoo.intranet.entity.Udn_Visa_Consulate_Master_Entity;


public class Udn_Visa_Consulate_Master_Obj extends Udn_Visa_Consulate_Master_Entity {
	private String countryName;
	private String cityName;

	

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	
	public void updateFromEntity(Udn_Visa_Consulate_Master_Entity consulateEntity) {
		this.consulateId=consulateEntity.getConsulateId();
		this.consulateTitle=consulateEntity.getConsulateTitle();
		this.consulateCity=consulateEntity.getConsulateCity();
		this.visaCountryCode=consulateEntity.getVisaCountryCode();
		this.address=consulateEntity.getAddress();
		this.email=consulateEntity.getEmail();
		this.telephone=consulateEntity.getTelephone();
		this.website=consulateEntity.getWebsite();
		this.fax=consulateEntity.getFax();
		this.active=consulateEntity.isActive();

	}
	
	public Udn_Visa_Consulate_Master_Obj(Udn_Visa_Consulate_Master_Entity consulateEntity) {
		this.consulateId=consulateEntity.getConsulateId();
		this.consulateTitle=consulateEntity.getConsulateTitle();
		this.consulateCity=consulateEntity.getConsulateCity();
		this.visaCountryCode=consulateEntity.getVisaCountryCode();
		this.address=consulateEntity.getAddress();
		this.email=consulateEntity.getEmail();
		this.telephone=consulateEntity.getTelephone();
		this.website=consulateEntity.getWebsite();
		this.fax=consulateEntity.getFax();
		this.active=consulateEntity.isActive();

	}
	
	public Udn_Visa_Consulate_Master_Obj() {
		
	}
}