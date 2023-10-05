package com.tg.api.flight.request.object;

import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.datatype.jsr310.ser.LocalDateTimeSerializer;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Segments {
	
	@JsonProperty(value = "Origin")
	private String origin;
	
	@JsonProperty(value = "Destination")
	private String destination;
	
	@JsonProperty(value = "FlightCabinClass")
	private int flightCabinClass;
	//Cabin class (1 for All, 2 for Economy, 3 for PremiumEconomy, 4 for Business, 5 for PremiumBusiness, 6 for First)
	
	@JsonProperty(value = "PreferredDepartureTime")
	private LocalDateTime preferredDepartureTime; // Mandatory
	//Date Time		Format: yyyy-MM-ddTHH:mm:ss (2015-08-10T00:00:00 for any time 2015-08-10T08:00:00 for Morning Flights 2015-08-10T14:00:00 for Afternoon Flights 2015-08-10T19:00:00 for Evening Flights 2015-08-10T01:00:00 for Night Flights)
	
	@JsonProperty(value = "PreferredArrivalTime")
	private LocalDateTime preferredArrivalTime;
	//Preferred arrival date (same as above) Format: yyyy-MM-ddTHH:mm:ss

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

	public int getFlightCabinClass() {
		return flightCabinClass;
	}

	public void setFlightCabinClass(int flightCabinClass) {
		this.flightCabinClass = flightCabinClass;
	}

	@JsonSerialize(using = LocalDateTimeSerializer.class)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public LocalDateTime getPreferredDepartureTime() {
		return preferredDepartureTime;
	}

	public void setPreferredDepartureTime(LocalDateTime preferredDeparture) {
		this.preferredDepartureTime = preferredDeparture;
	}

	@JsonSerialize(using = LocalDateTimeSerializer.class)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public LocalDateTime getPreferredArrivalTime() {
		return preferredArrivalTime;
	}

	public void setPreferredArrivalTime(LocalDateTime preferredArrivalTim) {
		this.preferredArrivalTime = preferredArrivalTim;
	}

	@Override
	public String toString() {
		return "Segments [origin=" + origin + ", destination=" + destination + ", flightCabinClass=" + flightCabinClass
				+ ", preferredDepartureTime=" + preferredDepartureTime + ", preferredArrivalTime="
				+ preferredArrivalTime + "]";
	}

	
	
}
