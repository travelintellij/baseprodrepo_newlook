package com.tg.api.flight.response.object;

import java.io.Serializable;
import java.util.Arrays;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Fare implements Serializable{

	@JsonProperty(value = "Currency")
	private String currency;
	
	@JsonProperty(value = "BaseFare")
	private float baseFare;
	
	@JsonProperty(value = "Tax")
	private float tax;
	
	@JsonProperty(value = "YQTax")
	private float yQTax;
	
	@JsonProperty(value = "AdditionalTxnFeeOfrd")
	private float additionalTxnFeeOfrd; //tbo will always charge zero but u can charge from customer.
	
	@JsonProperty(value = "AdditionalTxnFeePub")
	private float additionalTxnFeePub; // tbo will always charge zero but u can charge from customer.
	
	@JsonProperty(value = "OtherCharges")
	private float otherCharges;
	
	@JsonProperty(value = "ChargeBU")
	private ChargeBU[] chargeBU;
	
	@JsonProperty(value = "Discount")
	private float discount;
	
	@JsonProperty(value = "PublishedFare")
	private float publishedFare;
	
	@JsonProperty(value = "CommissionEarned")
	private float commissionEarned;
	
	@JsonProperty(value = "PLBEarned")
	private float pLBEarned;
	
	@JsonProperty(value = "IncentiveEarned")
	private float incentiveEarned;
	
	@JsonProperty(value = "OfferedFare")
	private float offeredFare;
	
	@JsonProperty(value = "TdsOnCommission")
	private float tdsOnCommission;
	
	@JsonProperty(value = "TdsOnPLB")
	private float tdsOnPLB;
	
	@JsonProperty(value = "TdsOnIncentive")
	private float tdsOnIncentive;
	
	@JsonProperty(value = "ServiceFee")
	private float serviceFee;

	public String getCurrency() {
		return currency;
	}

	public void setCurrency(String currency) {
		this.currency = currency;
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

	public float getOtherCharges() {
		return otherCharges;
	}

	public void setOtherCharges(float otherCharges) {
		this.otherCharges = otherCharges;
	}

	public ChargeBU[] getChargeBU() {
		return chargeBU;
	}

	public void setChargeBU(ChargeBU[] chargeBU) {
		this.chargeBU = chargeBU;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public float getPublishedFare() {
		return publishedFare;
	}

	public void setPublishedFare(float publishedFare) {
		this.publishedFare = publishedFare;
	}

	public float getCommissionEarned() {
		return commissionEarned;
	}

	public void setCommissionEarned(float commissionEarned) {
		this.commissionEarned = commissionEarned;
	}

	public float getpLBEarned() {
		return pLBEarned;
	}

	public void setpLBEarned(float pLBEarned) {
		this.pLBEarned = pLBEarned;
	}

	public float getIncentiveEarned() {
		return incentiveEarned;
	}

	public void setIncentiveEarned(float incentiveEarned) {
		this.incentiveEarned = incentiveEarned;
	}

	public float getOfferedFare() {
		return offeredFare;
	}

	public void setOfferedFare(float offeredFare) {
		this.offeredFare = offeredFare;
	}

	public float getTdsOnCommission() {
		return tdsOnCommission;
	}

	public void setTdsOnCommission(float tdsOnCommission) {
		this.tdsOnCommission = tdsOnCommission;
	}

	public float getTdsOnPLB() {
		return tdsOnPLB;
	}

	public void setTdsOnPLB(float tdsOnPLB) {
		this.tdsOnPLB = tdsOnPLB;
	}

	public float getTdsOnIncentive() {
		return tdsOnIncentive;
	}

	public void setTdsOnIncentive(float tdsOnIncentive) {
		this.tdsOnIncentive = tdsOnIncentive;
	}

	public float getServiceFee() {
		return serviceFee;
	}

	public void setServiceFee(float serviceFee) {
		this.serviceFee = serviceFee;
	}

	@Override
	public String toString() {
		return "Fare [currency=" + currency + ", baseFare=" + baseFare + ", tax=" + tax + ", yQTax=" + yQTax
				+ ", additionalTxnFeeOfrd=" + additionalTxnFeeOfrd + ", additionalTxnFeePub=" + additionalTxnFeePub
				+ ", otherCharges=" + otherCharges + ", chargeBU=" + Arrays.toString(chargeBU) + ", discount="
				+ discount + ", publishedFare=" + publishedFare + ", commissionEarned=" + commissionEarned
				+ ", pLBEarned=" + pLBEarned + ", incentiveEarned=" + incentiveEarned + ", offeredFare=" + offeredFare
				+ ", tdsOnCommission=" + tdsOnCommission + ", tdsOnPLB=" + tdsOnPLB + ", tdsOnIncentive="
				+ tdsOnIncentive + ", serviceFee=" + serviceFee + "]";
	}
	
	
}
