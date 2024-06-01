package com.udanchoo.intranet.model.partner;

public class FilterPartnerObj  {
    
   private int partnerId;
   private String partnerShortName;
   private String partnerName;
   private String partnerBrandName;
   private String partnerCityName;
   private int cityId;
   private boolean active=true;
   private String cityName;

   
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
	
	public String getPartnerBrandName() {
		return partnerBrandName;
	}
	
	public void setPartnerBrandName(String partnerBrandName) {
		this.partnerBrandName = partnerBrandName;
	}
	
	public String getPartnerCityName() {
		return partnerCityName;
	}
	
	public void setPartnerCityName(String partnerCityName) {
		this.partnerCityName = partnerCityName;
	}

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	
	
	
	
   
}
