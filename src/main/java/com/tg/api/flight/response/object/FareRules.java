package com.tg.api.flight.response.object;

import java.io.Serializable;
import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class FareRules implements Serializable{

	@JsonProperty(value = "Origin")
	private String origin;
	
	@JsonProperty(value = "Destination")
	private String destination;
	
	@JsonProperty(value = "Airline")
	private String airline;
	
	@JsonProperty(value = "FareBasisCode")
	private String fareBasisCode;
	
	@JsonProperty(value = "FareRuleDetail")
	private String fareRuleDetail;
	
	@JsonProperty(value = "FareRestriction")
	private String fareRestriction;
	


	public String getOrigin() {
		return origin;
	}

	public void setOrigin(String origin) {
		this.origin = origin;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getAirline() {
		return airline;
	}

	public void setAirline(String airline) {
		this.airline = airline;
	}

	public String getFareBasisCode() {
		return fareBasisCode;
	}

	public void setFareBasisCode(String fareBasisCode) {
		this.fareBasisCode = fareBasisCode;
	}

	public String getFareRuleDetail() {
		return fareRuleDetail;
	}

	public void setFareRuleDetail(String fareRuleDetail) {
		this.fareRuleDetail = fareRuleDetail;
	}

	public String getFareRestriction() {
		return fareRestriction;
	}

	public void setFareRestriction(String fareRestriction) {
		this.fareRestriction = fareRestriction;
	}

	@Override
	public String toString() {
		return "FareRules [origin=" + origin + ", destination=" + destination + ", airline=" + airline
				+ ", fareBasisCode=" + fareBasisCode + ", fareRuleDetail=" + fareRuleDetail + ", fareRestriction="
				+ fareRestriction + "]";
	}

	


	
	
}
