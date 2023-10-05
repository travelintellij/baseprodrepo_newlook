package com.tg.api.security.request;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlRootElement;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
@XmlRootElement
@XmlAccessorType(XmlAccessType.FIELD)
public class AuthenticateRequest {

	@JsonProperty(value = "ClientId")
	private String clientId="ApiIntegrationNew";
	
	@JsonProperty(value = "UserName")
	private String userName="udanchoo";
	
	@JsonProperty(value = "Password")
	private String password="mycareer@123";
	
	@JsonProperty(value = "EndUserIp")
	private String endUserIp="192.168.1.2";
	
	@JsonProperty(value = "ClientId")
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		clientId = clientId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		password = password;
	}
	public String getEndUserIp() {
		return endUserIp;
	}
	public void setEndUserIp(String endUserIp) {
		endUserIp = endUserIp;
	}

	
	@Override
	public String toString() {
		return "AuthenticateRequest [clientId=" + clientId + ", userName=" + userName + ", password=" + password
				+ ", endUserIp=" + endUserIp + "]";
	}
	public AuthenticateRequest() {
	}

  
  
  
}
