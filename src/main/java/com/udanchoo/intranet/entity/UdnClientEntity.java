package com.udanchoo.intranet.entity;


import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.Valid;

import com.udanchoo.intranet.model.ClientObj;



@Entity
@Table(name = "udnclients")
public class UdnClientEntity extends AuditModel {
	@Id
	@GeneratedValue
	@Column(nullable = false,name="clientId", unique = false)
	private Long clientId;

	@Column(nullable = false,name="clientName", unique = false)
	private String clientName;

	@Column(nullable = true,name="address", unique = false)
	private String address;

	
	@Column(nullable = true,name="cityId", unique = false)
	private Integer cityId;
	
	public Integer getCityId() {
		return cityId;
	}

	public void setCityId(Integer cityId) {
		this.cityId = cityId;
	}

	@Column(nullable = true,name="email", unique = false)
	private String email;
	

	@Column(nullable = true,name="mobile", unique = false)
	private long mobile;
	
	@Column(nullable = true,name="phone", unique = false)
	private long phone;
	
	@Column(nullable = true,name="companyDetails", unique = false)
	private String companyDetails;
	
	@Column(nullable = true,name="referredBy", unique = false)
	private String referredBy;
	

	@Column(nullable = true,name="gstDetails", unique = false)
	private String gstDetails;
	
	@Column(nullable = true,name="bankDetails", unique = false)
	private String bankDetails;
	

	@Column(nullable = true,name="remarks", unique = false)
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
	private boolean active;
	
	
	
	
	
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
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

	public long getMobile() {
		return mobile;
	}

	public void setMobile(long mobile) {
		this.mobile = mobile;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getCompanyDetails() {
		return companyDetails;
	}

	public void setCompanyDetails(String companyDetails) {
		this.companyDetails = companyDetails;
	}

	public String getReferredBy() {
		return referredBy;
	}

	public void setReferredBy(String referredBy) {
		this.referredBy = referredBy;
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

	public UdnClientEntity() {
		
	}
	
	public UdnClientEntity(@Valid ClientObj clientObj) {
			this.clientId= clientObj.getClientId();
			this.address= clientObj.getAddress();
			this.bankDetails=clientObj.getBankDetails();
			this.cityId=clientObj.getCityId();
			this.clientName=clientObj.getClientName();
			this.companyDetails=clientObj.getCompanyDetails();
			this.email=clientObj.getEmail();
			this.gstDetails=clientObj.getGstDetails();
			this.referredBy=clientObj.getReferredBy();
			this.remarks = clientObj.getRemarks();
			this.mobile=clientObj.getMobile();
			this.phone=clientObj.getPhone();
			
			this.countryId=clientObj.getCountryId();
			this.passportNumber=clientObj.getPassportNumber();
			this.passportExpiry=clientObj.getPassportExpiry();
			this.birthDate=clientObj.getBirthDate();
			this.anniversaryDate=clientObj.getAnniversaryDate();
			this.hotelPref=clientObj.getHotelPref();
			this.costSavvy=clientObj.getCostSavvy();
			this.serviceSavvy=clientObj.getServiceSavvy();
			this.foodPref=clientObj.getFoodPref();
			this.aggressiveness=clientObj.getAggressiveness();
			this.paymentRating=clientObj.getPaymentRating();
			this.active=clientObj.isActive();
			
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

	public int getCountryId() {
		return countryId;
	}

	public void setCountryId(int countryId) {
		this.countryId = countryId;
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

	public void setPassportExpiry(Date passportExpiry) {
		this.passportExpiry = passportExpiry;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public Date getAnniversaryDate() {
		return anniversaryDate;
	}

	public void setAnniversaryDate(Date anniversaryDate) {
		this.anniversaryDate = anniversaryDate;
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
	
	
	

}