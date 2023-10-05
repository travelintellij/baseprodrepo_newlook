package com.tg.api.flight.response.object;

import java.io.Serializable;
import java.util.Arrays;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Results implements Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	@JsonProperty(value = "IsHoldAllowedWithSSR")
	private boolean isHoldAllowedWithSSR;

	public boolean isHoldAllowedWithSSR() {
		return isHoldAllowedWithSSR;
	}

	public void setHoldAllowedWithSSR(boolean isHoldAllowedWithSSR) {
		this.isHoldAllowedWithSSR = isHoldAllowedWithSSR;
	}
	
	
	
	
	@JsonProperty(value = "isUpsellAllowed")
	private boolean isUpsellAllowed;
	
	@JsonProperty(value = "ResultIndex")
	private String resultIndex;
	
	@JsonProperty(value = "Source")
	private String source;
	
	@JsonProperty(value = "IsLCC")
	private boolean isLCC;
	
	@JsonProperty(value = "IsRefundable")
	private boolean isRefundable;
	
	@JsonProperty(value = "AirlineRemarks")
	private String airlineRemarks;
	
	
	
	@JsonProperty(value = "Fare")
	private Fare fare;
	/*
	@JsonProperty(value = "FareBreakdown")
	private FareBreakdown[] fareBreakdown;
	
	@JsonProperty(value = "Segments")
	private Segments[] segments;
	*/
	
	@JsonProperty(value = "LastTicketDate")
	private String lastTicketDate;
	
	@JsonProperty(value = "FareRules")
	private List<FareRules> farerules;
	
	
	
	@JsonProperty(value = "TicketAdvisory")
	private String ticketAdvisory;


	@JsonProperty(value = "AirlineCode")
	private String airlineCode;

	public boolean isUpsellAllowed() {
		return isUpsellAllowed;
	}

	public void setUpsellAllowed(boolean isUpsellAllowed) {
		this.isUpsellAllowed = isUpsellAllowed;
	}

	public String getResultIndex() {
		return resultIndex;
	}

	public void setResultIndex(String resultIndex) {
		this.resultIndex = resultIndex;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public boolean isLCC() {
		return isLCC;
	}

	public void setLCC(boolean isLCC) {
		this.isLCC = isLCC;
	}

	public boolean isRefundable() {
		return isRefundable;
	}

	public void setRefundable(boolean isRefundable) {
		this.isRefundable = isRefundable;
	}

	public String getAirlineRemarks() {
		return airlineRemarks;
	}

	public void setAirlineRemarks(String airlineRemarks) {
		this.airlineRemarks = airlineRemarks;
	}


	public String getTicketAdvisory() {
		return ticketAdvisory;
	}

	public void setTicketAdvisory(String ticketAdvisory) {
		this.ticketAdvisory = ticketAdvisory;
	}

	
	
	public String getLastTicketDate() {
		return lastTicketDate;
	}

	public void setLastTicketDate(String lastTicketDate) {
		this.lastTicketDate = lastTicketDate;
	}




	public List<FareRules> getFarerules() {
		return farerules;
	}

	public void setFarerules(List<FareRules> farerules) {
		this.farerules = farerules;
	}

	public Results() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getAirlineCode() {
		return airlineCode;
	}

	public void setAirlineCode(String airlineCode) {
		this.airlineCode = airlineCode;
	}
	
	public Fare getFare() {
		return fare;
	}

	public void setFare(Fare fare) {
		this.fare = fare;
	}

	@Override
	public String toString() {
		return "Results [isHoldAllowedWithSSR=" + isHoldAllowedWithSSR + ", isUpsellAllowed=" + isUpsellAllowed
				+ ", resultIndex=" + resultIndex + ", source=" + source + ", isLCC=" + isLCC + ", isRefundable="
				+ isRefundable + ", airlineRemarks=" + airlineRemarks + ", fare=" + fare + ", lastTicketDate="
				+ lastTicketDate + ", farerules=" + farerules + ", ticketAdvisory=" + ticketAdvisory + ", airlineCode="
				+ airlineCode + "]";
	}

	
	




	
}
