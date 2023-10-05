package com.tg.api.flight.response.object;

import java.io.Serializable;
import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonRootName;
import com.tg.api.security.response.Error;

@JsonIgnoreProperties(ignoreUnknown = true)

public class FlightSearchResponseRoot implements Serializable{
	

	@JsonProperty(value = "Response")
	private FlightSearchResponse flightSearchResponse;

	public FlightSearchResponse getFlightSearchResponse() {
		return flightSearchResponse;
	}

	public void setFlightSearchResponse(FlightSearchResponse flightSearchResponse) {
		this.flightSearchResponse = flightSearchResponse;
	}

	@Override
	public String toString() {
		return "FlightSearchResponseRoot [flightSearchResponse=" + flightSearchResponse + "]";
	}
	
	
	
	
}
