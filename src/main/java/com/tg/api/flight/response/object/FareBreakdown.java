package com.tg.api.flight.response.object;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class FareBreakdown implements Serializable{

	@JsonProperty(value = "Currency")
	private String currency;
	
	@JsonProperty(value = "PassengerType")
	private String passengerType;
	
	@JsonProperty(value = "PassengerCount")
	private int passengerCount;
	
	@JsonProperty(value = "BaseFare")
	private float baseFare;
	
	@JsonProperty(value = "Tax")
	private float tax;
	
	@JsonProperty(value = "YQTax")
	private float yQTax;
	
	@JsonProperty(value = "AdditionalTxnFeeOfrd")
	private float additionalTxnFeeOfrd;
	
	@JsonProperty(value = "AdditionalTxnFeePub")
	private float additionalTxnFeePub;

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
	}

	public String getPassengerType() {
		return passengerType;
	}

	public void setPassengerType(String passengerType) {
		this.passengerType = passengerType;
	}

	public int getPassengerCount() {
		return passengerCount;
	}

	public void setPassengerCount(int passengerCount) {
		this.passengerCount = passengerCount;
	}

	public float getBaseFare() {
		return baseFare;
	}

	public void setBaseFare(float baseFare) {
		this.baseFare = baseFare;
	}

	public float getTax() {
		return tax;
	}

	public void setTax(float tax) {
		this.tax = tax;
	}

	public float getyQTax() {
		return yQTax;
	}

	public void setyQTax(float yQTax) {
		this.yQTax = yQTax;
	}

	public float getAdditionalTxnFeeOfrd() {
		return additionalTxnFeeOfrd;
	}

	public void setAdditionalTxnFeeOfrd(float additionalTxnFeeOfrd) {
		this.additionalTxnFeeOfrd = additionalTxnFeeOfrd;
	}

	public float getAdditionalTxnFeePub() {
		return additionalTxnFeePub;
	}

	public void setAdditionalTxnFeePub(float additionalTxnFeePub) {
		this.additionalTxnFeePub = additionalTxnFeePub;
	}

	@Override
	public String toString() {
		return "FareBreakdown [currency=" + currency + ", passengerType=" + passengerType + ", passengerCount="
				+ passengerCount + ", baseFare=" + baseFare + ", tax=" + tax + ", yQTax=" + yQTax
				+ ", additionalTxnFeeOfrd=" + additionalTxnFeeOfrd + ", additionalTxnFeePub=" + additionalTxnFeePub
				+ "]";
	}
	
	
	
}
