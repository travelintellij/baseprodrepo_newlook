package com.tg.api.flight.response.object;

import java.io.Serializable;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Segments implements Serializable{

	@JsonProperty(value = "TripIndicator")
	private int tripIndicator;
	
	@JsonProperty(value = "SegmentIndicator")
	private int segmentIndicator;
	
	@JsonProperty(value = "Airline")
	private Airline airline;
	
	@JsonProperty(value = "Origin")
	private Origin origin;
	
	@JsonProperty(value = "DepTime")
	private LocalDateTime depTime;
	
	@JsonProperty(value = "Destination")
	private Destination destination;
	
	@JsonProperty(value = "ArrTime")
	private LocalDateTime arrTime;
	
	@JsonProperty(value = "AccumulatedDuration")
	private float accumulatedDuration;
	
	@JsonProperty(value = "GroundTime")
	private float groundTime;
	
	@JsonProperty(value = "Mile")
	private String mile;
	
	@JsonProperty(value = "StopOver")
	private StopOver stopOver;
	
	@JsonProperty(value = "Craft")
	private String craft;
	
	@JsonProperty(value = "IsETicketEligible")
	private boolean isETicketEligible;
	
	@JsonProperty(value = "FlightStatus")
	private String flightStatus;
	
	@JsonProperty(value = "Status")
	private String status;

	public int getTripIndicator() {
		return tripIndicator;
	}

	public void setTripIndicator(int tripIndicator) {
		this.tripIndicator = tripIndicator;
	}

	public int getSegmentIndicator() {
		return segmentIndicator;
	}

	public void setSegmentIndicator(int segmentIndicator) {
		this.segmentIndicator = segmentIndicator;
	}

	public Airline getAirline() {
		return airline;
	}

	public void setAirline(Airline airline) {
		this.airline = airline;
	}

	public Origin getOrigin() {
		return origin;
	}

	public void setOrigin(Origin origin) {
		this.origin = origin;
	}

	public LocalDateTime getDepTime() {
		return depTime;
	}

	public void setDepTime(LocalDateTime depTime) {
		this.depTime = depTime;
	}

	public Destination getDestination() {
		return destination;
	}

	public void setDestination(Destination destination) {
		this.destination = destination;
	}

	public LocalDateTime getArrTime() {
		return arrTime;
	}

	public void setArrTime(LocalDateTime arrTime) {
		this.arrTime = arrTime;
	}

	public float getAccumulatedDuration() {
		return accumulatedDuration;
	}

	public void setAccumulatedDuration(float accumulatedDuration) {
		this.accumulatedDuration = accumulatedDuration;
	}

	public float getGroundTime() {
		return groundTime;
	}

	public void setGroundTime(float groundTime) {
		this.groundTime = groundTime;
	}

	public String getMile() {
		return mile;
	}

	public void setMile(String mile) {
		this.mile = mile;
	}

	public StopOver getStopOver() {
		return stopOver;
	}

	public void setStopOver(StopOver stopOver) {
		this.stopOver = stopOver;
	}

	public String getCraft() {
		return craft;
	}

	public void setCraft(String craft) {
		this.craft = craft;
	}

	public boolean isETicketEligible() {
		return isETicketEligible;
	}

	public void setETicketEligible(boolean isETicketEligible) {
		this.isETicketEligible = isETicketEligible;
	}

	public String getFlightStatus() {
		return flightStatus;
	}

	public void setFlightStatus(String flightStatus) {
		this.flightStatus = flightStatus;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Segments [tripIndicator=" + tripIndicator + ", segmentIndicator=" + segmentIndicator + ", airline="
				+ airline + ", origin=" + origin + ", depTime=" + depTime + ", destination=" + destination
				+ ", arrTime=" + arrTime + ", accumulatedDuration=" + accumulatedDuration + ", groundTime=" + groundTime
				+ ", mile=" + mile + ", stopOver=" + stopOver + ", craft=" + craft + ", isETicketEligible="
				+ isETicketEligible + ", flightStatus=" + flightStatus + ", status=" + status + "]";
	}
	
	
}
