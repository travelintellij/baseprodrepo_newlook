package com.tg.api.flight.response.object;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Airport implements Serializable{

	@JsonProperty(value = "AirportCode")
	private String airportCode;
	
	@JsonProperty(value = "AirportName")
	private String airportName;
	
	@JsonProperty(value = "Terminal")
	private String terminal;
	
	@JsonProperty(value = "CityCode")
	private String cityCode;
	
	@JsonProperty(value = "CityName")
	private String cityName;
	
	@JsonProperty(value = "CountryCode")
	private String countryCode;
	
	@JsonProperty(value = "CountryName")
	private String countryName;

	public String getAirportCode() {
		return airportCode;
	}

	public void setAirportCode(String airportCode) {
		this.airportCode = airportCode;
	}

	public String getAirportName() {
		return airportName;
	}

	public void setAirportName(String airportName) {
		this.airportName = airportName;
	}

	public String getTerminal() {
		return terminal;
	}

	public void setTerminal(String terminal) {
		this.terminal = terminal;
	}

	public String getCityCode() {
		return cityCode;
	}

	public void setCityCode(String cityCode) {
		this.cityCode = cityCode;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	@Override
	public String toString() {
		return "Airport [airportCode=" + airportCode + ", airportName=" + airportName + ", terminal=" + terminal
				+ ", cityCode=" + cityCode + ", cityName=" + cityName + ", countryCode=" + countryCode
				+ ", countryName=" + countryName + "]";
	}
	
	
}
