package com.udanchoo.intranet.model;

public class AirLineVO implements Comparable<AirLineVO>{

	private long airlineId;
	private String airlineShortName;
	public long getAirlineId() {
		return airlineId;
	}
	public void setAirlineId(long airlineId) {
		this.airlineId = airlineId;
	}
	public String getAirlineShortName() {
		return airlineShortName;
	}
	public void setAirlineShortName(String airlineShortName) {
		this.airlineShortName = airlineShortName;
	}
	
	public int compareTo(AirLineVO airlineVo) {  
	    return airlineShortName.compareTo(airlineVo.getAirlineShortName());  
	      
	  } 
}
