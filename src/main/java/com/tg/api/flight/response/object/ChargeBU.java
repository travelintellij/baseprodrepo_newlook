package com.tg.api.flight.response.object;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class ChargeBU  implements Serializable {
	
	@JsonProperty(value = "TBOMarkUp")
	private float tBOMarkUp;
	
	@JsonProperty(value = "ConvenienceCharge")
	private float convenienceCharge;
	
	@JsonProperty(value = "OtherCharge")
	private float otherCharge;

	public float gettBOMarkUp() {
		return tBOMarkUp;
	}

	public void settBOMarkUp(float tBOMarkUp) {
		this.tBOMarkUp = tBOMarkUp;
	}

	public float getConvenienceCharge() {
		return convenienceCharge;
	}

	public void setConvenienceCharge(float convenienceCharge) {
		this.convenienceCharge = convenienceCharge;
	}

	public float getOtherCharge() {
		return otherCharge;
	}

	public void setOtherCharge(float otherCharge) {
		this.otherCharge = otherCharge;
	}

	@Override
	public String toString() {
		return "ChargeBU [tBOMarkUp=" + tBOMarkUp + ", convenienceCharge=" + convenienceCharge + ", otherCharge="
				+ otherCharge + "]";
	}
	
	
}
