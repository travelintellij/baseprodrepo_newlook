package com.tg.api.flight.response.object;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonRootName;

@JsonIgnoreProperties(ignoreUnknown = true)
@JsonRootName(value = "Response")
public class FlightSearchResponse implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@JsonProperty(value = "TraceId")
	private String traceId;//Trace ID (Trace Id to be echoed back in further requests valid for 15 minutes only)	Mandatory
	
	@JsonProperty(value = "Error")
	private com.tg.api.security.response.Error error;
  
	
	@JsonProperty(value = "Origin")
	private String origin; //Origin city code	Mandatory
	
	@JsonProperty(value = "Destination")
	private String destination; //	String	Destination city code	Mandatory
	
	@JsonProperty(value = "Results")
	private List<List<Results>> results = new ArrayList<List<Results>>();//Array of element	Array of the flight results (Can be blank in case no found for requested flights search)	Mandatory

	
	@JsonProperty(value = "Penalty")
	private Penalty penalty;





	public String getTraceId() {
		return traceId;
	}

	public void setTraceId(String traceId) {
		this.traceId = traceId;
	}

	public com.tg.api.security.response.Error getError() {
		return error;
	}

	public void setError(com.tg.api.security.response.Error error) {
		this.error = error;
	}

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

	
	
	/*
	public Results[] getResults() {
		return results;
	}

	public void setResults(Results[] results) {
		this.results = results;
	}
*/

	



	
	



	


	public Penalty getPenalty() {
		return penalty;
	}

	public void setPenalty(Penalty penalty) {
		this.penalty = penalty;
	}

	
	

	




	

	public List<List<Results>> getResults() {
		return results;
	}

	public void setResults(List<List<Results>> results) {
		this.results = results;
	}

	public FlightSearchResponse() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		System.out.println("*****************************************************************");
		return "FlightSearchResponse [traceId=" + traceId + ", error=" + error + ", origin=" + origin + ", destination="
				+ destination + ", results=" + results + ", penalty=" + penalty + "]";
	}
	
	
	
	
}
