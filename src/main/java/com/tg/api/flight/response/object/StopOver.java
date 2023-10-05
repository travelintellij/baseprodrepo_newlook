package com.tg.api.flight.response.object;

import java.io.Serializable;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class StopOver implements Serializable{

	@JsonProperty(value = "StopPoint")
	private String stopPoint;
	
	@JsonProperty(value = "StopPointArrivalTime")
	private LocalDateTime stopPointArrivalTime;
	
	@JsonProperty(value = "StopPointDepartureTime")
	private LocalDateTime stopPointDepartureTime;

	public String getStopPoint() {
		return stopPoint;
	}

	public void setStopPoint(String stopPoint) {
		this.stopPoint = stopPoint;
	}

	public LocalDateTime getStopPointArrivalTime() {
		return stopPointArrivalTime;
	}

	public void setStopPointArrivalTime(LocalDateTime stopPointArrivalTime) {
		this.stopPointArrivalTime = stopPointArrivalTime;
	}

	public LocalDateTime getStopPointDepartureTime() {
		return stopPointDepartureTime;
	}

	public void setStopPointDepartureTime(LocalDateTime stopPointDepartureTime) {
		this.stopPointDepartureTime = stopPointDepartureTime;
	}

	@Override
	public String toString() {
		return "StopOver [stopPoint=" + stopPoint + ", stopPointArrivalTime=" + stopPointArrivalTime
				+ ", stopPointDepartureTime=" + stopPointDepartureTime + "]";
	}
	
	
}
