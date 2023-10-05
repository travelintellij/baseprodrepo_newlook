package com.tg.api.flight.response.object;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Penalty implements Serializable{

	@JsonProperty(value = "ReissueCharge")
	private float reissueCharge;
	
	@JsonProperty(value = "CancellationCharge")
	private float cancellationCharge;

	public float getReissueCharge() {
		return reissueCharge;
	}

	public void setReissueCharge(float reissueCharge) {
		this.reissueCharge = reissueCharge;
	}

	public float getCancellationCharge() {
		return cancellationCharge;
	}

	public void setCancellationCharge(float cancellationCharge) {
		this.cancellationCharge = cancellationCharge;
	}

	@Override
	public String toString() {
		return "Penalty [reissueCharge=" + reissueCharge + ", cancellationCharge=" + cancellationCharge + "]";
	}


}
