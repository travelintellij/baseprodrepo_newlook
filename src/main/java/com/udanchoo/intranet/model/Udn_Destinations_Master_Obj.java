package com.udanchoo.intranet.model;

import java.util.Map;

import com.udanchoo.intranet.entity.Udn_Destinations_Entity;

public class Udn_Destinations_Master_Obj extends Udn_Destinations_Entity {
	

	Map cityKeyValue;
	
	public Udn_Destinations_Master_Obj() {
		
	}
	
	public Udn_Destinations_Master_Obj(Udn_Destinations_Entity udnDestinationsEntity) {
		this.destinationId = udnDestinationsEntity.getDestinationId();
		this.cityName = udnDestinationsEntity.getCityName();
		this.countryCode=udnDestinationsEntity.getCountryCode();
		this.countryName=udnDestinationsEntity.getCountryName();
		this.active = udnDestinationsEntity.isActive();
	}
	
	public void updateCityVOFromEntity(Udn_Destinations_Entity cityEntity) {
		this.destinationId = cityEntity.getDestinationId();
		this.cityName = cityEntity.getCityName();
		this.countryCode=cityEntity.getCountryCode();
		this.countryName=cityEntity.getCountryName();
		this.active = cityEntity.isActive();
	}

	public String toString() {
		String attrib = "destination Id -> " + destinationId + "\n";
		attrib = attrib + " City Name -> " + cityName + "\n";
		attrib = attrib + " Country Code-> " + countryCode + "\n";
		attrib = attrib + " Country Name-> " + countryName + "\n";
		attrib = attrib + " City Active -> " + active + "\n";
		return attrib;
	}
	
	 @Override
	 public boolean equals(Object obj) {
		 if(countryName.equalsIgnoreCase(((Udn_Destinations_Master_Obj)obj).getCountryName())){
			 return true;
		 }
		 return false;
	 }

	public Map getCityKeyValue() {
		return cityKeyValue;
	}

	public void setCityKeyValue(Map cityKeyValue) {
		this.cityKeyValue = cityKeyValue;
	}

		 
	 

}