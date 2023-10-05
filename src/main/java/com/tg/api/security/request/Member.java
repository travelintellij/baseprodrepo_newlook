package com.tg.api.security.request;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Member implements Serializable {

	@JsonProperty(value = "FirstName")
	private String firstName;
	
	@JsonProperty(value = "LastName")
	private String lastName;
	
	@JsonProperty(value = "Email")
	private String email;
	
	@JsonProperty(value = "LoginName")
	private String loginName;
	
	@JsonProperty(value = "LoginDetails")
	private String loginDetails;
	
	@JsonProperty(value = "AgencyId")
	private int agencyId;
	
	@JsonProperty(value = "MemberId")
	private int memberId;
	
	
	
	
	public String getFirstName() {
		return firstName;
	}




	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}




	public String getLastName() {
		return lastName;
	}




	public void setLastName(String lastName) {
		this.lastName = lastName;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public String getLoginName() {
		return loginName;
	}




	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}




	public String getLoginDetails() {
		return loginDetails;
	}




	public void setLoginDetails(String loginDetails) {
		this.loginDetails = loginDetails;
	}




	public int getAgencyId() {
		return agencyId;
	}




	public void setAgencyId(int agencyId) {
		this.agencyId = agencyId;
	}




	public int getMemberId() {
		return memberId;
	}




	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}




	public Member() {
	}




	public Member(String firstName, String lastName, String email, String loginName, String loginDetails, int agencyId,
			int memberId) {
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.loginName = loginName;
		this.loginDetails = loginDetails;
		this.agencyId = agencyId;
		this.memberId = memberId;
	}




	@Override
	public String toString() {
		return "Member [firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", loginName="
				+ loginName + ", loginDetails=" + loginDetails + ", agencyId=" + agencyId + ", memberId=" + memberId
				+ "]";
	}

	
	

	
	
}
