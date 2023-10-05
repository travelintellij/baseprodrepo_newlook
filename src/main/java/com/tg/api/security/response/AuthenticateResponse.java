package com.tg.api.security.response;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.tg.api.security.request.Member;

@JsonIgnoreProperties(ignoreUnknown = true)
public class AuthenticateResponse implements Serializable {

  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@JsonProperty(value = "Status")
	private int status;
  
	@JsonProperty(value = "TokenId")
	private String tokenId;
	
	@JsonProperty(value = "Member")
	private Member member;
  
	@JsonProperty(value = "Error")
	private com.tg.api.security.response.Error error;
  
	public AuthenticateResponse() {
	}

	public Member getMember() {
		return member;
	}
	
	public void setMember(Member member) {
		this.member = member;
	}
	
	public com.tg.api.security.response.Error getError() {
		return error;
	}
	
	public void setError(com.tg.api.security.response.Error error) {
		this.error = error;
	}
	
	
	public int getStatus() {
		return status;
	}
	
	public void setStatus(int status) {
		this.status = status;
	}
	
	public String getTokenId() {
		return tokenId;
	}
	
	public void setTokenId(String tokenId) {
		this.tokenId = tokenId;
	}
	
	public AuthenticateResponse(int status, String tokenId, Member member, Error error) {
		super();
		status = status;
		tokenId = tokenId;
		this.member = member;
		this.error = error;
	}

	@Override
	public String toString() {
		return "AuthenticateResponse [status=" + status + ", tokenId=" + tokenId + ", member=" + member + ", error="
				+ error + "]";
	}

  
  
  
}
