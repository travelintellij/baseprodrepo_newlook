package com.tg.api.flight.request.object;

import java.text.SimpleDateFormat;
import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class FlightSearchRequest {


    SimpleDateFormat df = new SimpleDateFormat("dd-MM-yyyy hh:mm");
    
	@JsonProperty(value = "EndUserIp")
	private String endUserIp;	
	
	@JsonProperty(value = "TokenId")
	private String tokenId;
	
	@JsonProperty(value = "AdultCount")
	private int adultCount;
	
	@JsonProperty(value = "ChildCount")
	private int childCount;
	
	@JsonProperty(value = "InfantCount")
	private int infantCount;
	
	@JsonProperty(value = "DirectFlight")
	private boolean directFlight;// Optional
	
	@JsonProperty(value = "OneStopFlight")
	private boolean oneStopFlight;// Optional
	
	@JsonProperty(value = "JourneyType")
	private int journeyType; // Mandatory
	
	@JsonProperty(value = "PreferredAirlines")
	private String[] preferredAirlines; // Optional
	
	@JsonProperty(value = "Segments")
	private Segments[] segments;
	
	@JsonProperty(value = "Sources")
	private String [] sources;
	//Airline Sources For Normal OW/RT (GDS - Amadeus/Galileo SG - SpiceJet 6E - Indigo G8 - Go Air G9 - Air Arabia FZ - Fly Dubai IX - Air India Express AK - Air Asia LB - Air Costa For LCC Spl Return: SG - SpiceJet 6E - Indigo G8 - Go Air For GDS Spl Return: GDS For Advance Search: GDS - Amadeus/Galileo For MultiStop Search: GDS - Amadeus/Galileo)

	public String getEndUserIp() {
		return endUserIp;
	}

	public void setEndUserIp(String endUserIp) {
		this.endUserIp = endUserIp;
	}

	public String getTokenId() {
		return tokenId;
	}

	public void setTokenId(String tokenId) {
		this.tokenId = tokenId;
	}

	public int getAdultCount() {
		return adultCount;
	}

	public void setAdultCount(int adultCount) {
		this.adultCount = adultCount;
	}

	public int getChildCount() {
		return childCount;
	}

	public void setChildCount(int childCount) {
		this.childCount = childCount;
	}

	public int getInfantCount() {
		return infantCount;
	}

	public void setInfantCount(int infantCount) {
		this.infantCount = infantCount;
	}

	public boolean isDirectFlight() {
		return directFlight;
	}

	public void setDirectFlight(boolean directFlight) {
		this.directFlight = directFlight;
	}

	public boolean isOneStopFlight() {
		return oneStopFlight;
	}

	public void setOneStopFlight(boolean oneStopFlight) {
		this.oneStopFlight = oneStopFlight;
	}

	public int getJourneyType() {
		return journeyType;
	}

	public void setJourneyType(int journeyType) {
		this.journeyType = journeyType;
	}

	public String[] getPreferredAirlines() {
		return preferredAirlines;
	}

	public void setPreferredAirlines(String[] preferredAirlines) {
		this.preferredAirlines = preferredAirlines;
	}

	public Segments[] getSegments() {
		return segments;
	}

	public void setSegments(Segments[] segments) {
		this.segments = segments;
	}

	public String[] getSources() {
		return sources;
	}

	public void setSources(String[] sources) {
		this.sources = sources;
	}

	@Override
	public String toString() {
		return "FlightSearchRequest [df=" + df + ", endUserIp=" + endUserIp + ", tokenId=" + tokenId + ", adultCount="
				+ adultCount + ", childCount=" + childCount + ", infantCount=" + infantCount + ", directFlight="
				+ directFlight + ", oneStopFlight=" + oneStopFlight + ", journeyType=" + journeyType
				+ ", preferredAirlines=" + Arrays.toString(preferredAirlines) + ", segments="
				+ Arrays.toString(segments) + ", sources=" + Arrays.toString(sources) + "]";
	}

	

				
	
}
