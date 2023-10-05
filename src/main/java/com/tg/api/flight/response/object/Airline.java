package com.tg.api.flight.response.object;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Airline implements Serializable{

	@JsonProperty(value = "AirlineCode")
	private String airlineCode;
	
	@JsonProperty(value = "AirlineName")
	private String airlineName;
	
	@JsonProperty(value = "FlightNumber")
	private String flightNumber;
	
	@JsonProperty(value = "FareClass")
	private String fareClass;
	
	@JsonProperty(value = "OperatingCarrier")
	private String operatingCarrier;

	public String getAirlineCode() {
		return airlineCode;
	}

	public void setAirlineCode(String airlineCode) {
		this.airlineCode = airlineCode;
	}

	public String getAirlineName() {
		return airlineName;
	}

	public void setAirlineName(String airlineName) {
		this.airlineName = airlineName;
	}

	public String getFlightNumber() {
		return flightNumber;
	}

	public void setFlightNumber(String flightNumber) {
		this.flightNumber = flightNumber;
	}

	public String getFareClass() {
		return fareClass;
	}

	public void setFareClass(String fareClass) {
		this.fareClass = fareClass;
	}

	public String getOperatingCarrier() {
		return operatingCarrier;
	}

	public void setOperatingCarrier(String operatingCarrier) {
		this.operatingCarrier = operatingCarrier;
	}

	@Override
	public String toString() {
		return "Airline [airlineCode=" + airlineCode + ", airlineName=" + airlineName + ", flightNumber=" + flightNumber
				+ ", fareClass=" + fareClass + ", operatingCarrier=" + operatingCarrier + "]";
	}
	
	
}
