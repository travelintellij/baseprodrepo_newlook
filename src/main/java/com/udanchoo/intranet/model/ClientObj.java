package com.udanchoo.intranet.model;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.udanchoo.intranet.entity.UdnClientEntity;

public class ClientObj {

	private Long clientId;
	private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	@Size(min=3, max=100,message = "Error: [Client Name] Must be 3 - 100 characters.")
	private String clientName;
	
	//@Size(min=3, max=200,message = "Error: [Client Address] Must be 3 - 200 characters.")
	private String address;
	
	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	//@NotNull(message = "Error: [City] can not be left blank.")
	private Integer cityId;
	
	private String cityName;
	
	
	private String countryName;
	
	
	
	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public Integer getCityId() {
		return cityId;
	}

	public void setCityId(String cityId) {
		if(cityId==null || cityId.trim().length()==0) {
			this.cityId=0;
		}
		else {
			this.cityId = Integer.parseInt(cityId);
		}
	}

	private String email;
	
	private Long mobile;
	
	private Long phone;
	
	private String companyDetails;
	
	private String referredBy;
	
	private String gstDetails;
	
	
	private String bankDetails;
	
	private String remarks;


	private int countryId;
	private String passportNumber;
	private Date passportExpiry;
	private Date birthDate;
	private Date anniversaryDate;
	private int hotelPref;
	private int costSavvy;
	private int serviceSavvy;
	private String foodPref;
	private int aggressiveness;
	private int paymentRating;
	private boolean active=true;
	
	
	
	
	
	
	public int getCountryId() {
		return countryId;
	}

	public void setCountryId(String countryId) {
		if(countryId==null || countryId.trim().length()==0) {
			this.countryId=0;
		}
		else {
			this.countryId = Integer.parseInt(countryId);
		}
	}

	public String getPassportNumber() {
		return passportNumber;
	}

	public void setPassportNumber(String passportNumber) {
		this.passportNumber = passportNumber;
	}

	public Date getPassportExpiry() {
		return passportExpiry;
	}

	public void setPassportExpiry(String passportExpiry) {
		if(passportExpiry!=null && passportExpiry.trim().length()>0) {
			try {
				java.util.Date tempDate =dateFormat.parse(passportExpiry); 
				this.passportExpiry = new Date(tempDate.getTime());
			}
			catch(Exception e) {
				e.printStackTrace();
			}
				
		}
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		if(birthDate!=null && birthDate.trim().length()>0) {
			try {
				java.util.Date tempDate =dateFormat.parse(birthDate); 
				this.birthDate = new Date(tempDate.getTime());
			}
			catch(Exception e) {
				e.printStackTrace();
			}
				
		}
	}

	public Date getAnniversaryDate() {
		return anniversaryDate;
	}

	public void setAnniversaryDate(String anniversaryDate) {
		if(anniversaryDate!=null && anniversaryDate.trim().length()>0) {
			try {
				java.util.Date tempDate =dateFormat.parse(anniversaryDate); 
				this.anniversaryDate = new Date(tempDate.getTime());
			}
			catch(Exception e) {
				e.printStackTrace();
			}
				
		}
	}

	public int getHotelPref() {
		return hotelPref;
	}

	public void setHotelPref(int hotelPref) {
		this.hotelPref = hotelPref;
	}

	public int getCostSavvy() {
		return costSavvy;
	}

	public void setCostSavvy(int costSavvy) {
		this.costSavvy = costSavvy;
	}

	public int getServiceSavvy() {
		return serviceSavvy;
	}

	public void setServiceSavvy(int serviceSavvy) {
		this.serviceSavvy = serviceSavvy;
	}

	public String getFoodPref() {
		return foodPref;
	}

	public void setFoodPref(String foodPref) {
		this.foodPref = foodPref;
	}

	public int getAggressiveness() {
		return aggressiveness;
	}

	public void setAggressiveness(int aggressiveness) {
		this.aggressiveness = aggressiveness;
	}

	public int getPaymentRating() {
		return paymentRating;
	}

	public void setPaymentRating(int paymentRating) {
		this.paymentRating = paymentRating;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public Long getClientId() {
		return clientId;
	}

	public void setClientId(Long clientId) {
		this.clientId = clientId;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
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

	public Long getMobile() {
		return mobile;
	}

	public void setMobile(Long mobile) {
		if(mobile!=null)
			this.mobile = mobile;
		else
			this.mobile=0l;
	}

	public Long getPhone() {
		return phone;
	}

	public void setPhone(Long phone) {
		if( phone!=null)
			this. phone =  phone;
		else
			this. phone=0l;
	}

	

	public String getReferredBy() {
		return referredBy;
	}

	public void setReferredBy(String referredBy) {
		this.referredBy = referredBy;
	}

	

	

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	public ClientObj() {
		
	}
	
	public String toString() {
		String attributes = "" + " Client ID - " + clientId + "\n";
		attributes = attributes + " Client Name - " + clientName + "\n";
		attributes = attributes + " Client Address -  " + address + "\n";
		attributes = attributes + " City - " + cityId + "\n";
		attributes = attributes + " Email - " + email + "\n";
		attributes = attributes + " mobile  - " + mobile + "\n";
		attributes = attributes + " Phone - " + phone + "\n";
		attributes = attributes + " Company Name - " + companyDetails + "\n";
		attributes = attributes + " ReferredBy - " + referredBy + "\n";
		attributes = attributes + " GST Number - " + gstDetails + "\n";
		attributes = attributes + " Bank Account Details - " + bankDetails + "\n";
		attributes = attributes + " remarks - " + remarks + "\n";
		
		
		attributes = attributes + " countryId - " + countryId + "\n";
		attributes = attributes + " passportNumber - " + passportNumber + "\n";
		attributes = attributes + " passportExpiry - " + passportExpiry + "\n";
		attributes = attributes + " birthDate - " + birthDate + "\n";
		attributes = attributes + " anniversaryDate - " + anniversaryDate + "\n";
		attributes = attributes + " hotelPref - " + hotelPref + "\n";
		attributes = attributes + " costSavvy - " + costSavvy + "\n";
		attributes = attributes + " serviceSavvy - " + serviceSavvy + "\n";
		attributes = attributes + " foodPref - " + foodPref + "\n";
		attributes = attributes + " aggressiveness - " + aggressiveness + "\n";
		attributes = attributes + " paymentRating - " + paymentRating + "\n";
		attributes = attributes + " active - " + active + "\n";

		return attributes;
		
	}
	
	public ClientObj(UdnClientEntity clientEntity) {
		this.clientId=clientEntity.getClientId();
		this.mobile=clientEntity.getMobile();
		this.phone=clientEntity.getPhone();
		this.address=clientEntity.getAddress();
		this.bankDetails=clientEntity.getBankDetails();
		this.cityId = clientEntity.getCityId() != null ? clientEntity.getCityId() : 0;
		this.clientName=clientEntity.getClientName();
		this.companyDetails=clientEntity.getCompanyDetails();
		this.email=clientEntity.getEmail();
		this.gstDetails=clientEntity.getGstDetails();
		this.referredBy=clientEntity.getReferredBy();
		this.remarks=clientEntity.getRemarks();
		this.countryId=clientEntity.getCountryId();
		this.passportNumber=clientEntity.getPassportNumber();
		this.passportExpiry=clientEntity.getPassportExpiry();
		this.birthDate=clientEntity.getBirthDate();
		this.anniversaryDate=clientEntity.getAnniversaryDate();
		this.hotelPref=clientEntity.getHotelPref();
		this.costSavvy=clientEntity.getCostSavvy();
		this.serviceSavvy=clientEntity.getServiceSavvy();
		this.foodPref=clientEntity.getFoodPref();
		this.aggressiveness=clientEntity.getAggressiveness();
		this.paymentRating=clientEntity.getPaymentRating();
		this.active=clientEntity.isActive();
	}

	public String getCompanyDetails() {
		return companyDetails;
	}

	public void setCompanyDetails(String companyDetails) {
		this.companyDetails = companyDetails;
	}

	public String getGstDetails() {
		return gstDetails;
	}

	public void setGstDetails(String gstDetails) {
		this.gstDetails = gstDetails;
	}

	public String getBankDetails() {
		return bankDetails;
	}

	public void setBankDetails(String bankDetails) {
		this.bankDetails = bankDetails;
	} 
	
	
	
}
