package com.udanchoo.intranet.model.api.flight;

import com.udanchoo.intranet.entity.Tg_Flt_Airport_Entity;

public class Tg_Flt_Airport_Obj extends Tg_Flt_Airport_Entity{
	


	public Tg_Flt_Airport_Obj(Tg_Flt_Airport_Entity udnFltAirportEntity) {
		this.airportId = udnFltAirportEntity.getAirportId();
		this.airportName = udnFltAirportEntity.getAirportName();
		this.airportCode = udnFltAirportEntity.getAirportCode();
		this.cityName = udnFltAirportEntity.getCityName();
		this.cityCode = udnFltAirportEntity.getCityCode();
		this.countryName = udnFltAirportEntity.getCountryName();
		this.countryCode = udnFltAirportEntity.getCountryCode();
		this.nationality = udnFltAirportEntity.getNationality();
		this.currency = udnFltAirportEntity.getCurrency();
		this.active = udnFltAirportEntity.isActive();
	}

	
	 
	

}