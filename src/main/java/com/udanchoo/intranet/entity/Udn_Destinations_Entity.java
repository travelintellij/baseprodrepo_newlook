package com.udanchoo.intranet.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import com.udanchoo.intranet.entity.supplier.Tg_Supplier_Master_Entity;
import com.udanchoo.intranet.model.Udn_Destinations_Master_Obj;
import com.udanchoo.intranet.util.UdanChooConstants;



@Entity
@Table(name = "udndestinations")
public class Udn_Destinations_Entity{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	protected int destinationId;

	protected String cityName;
	protected String countryCode=UdanChooConstants.DEFAULT_DESTINATION_INDIA_CTRY_CODE;
	protected String countryName=UdanChooConstants.DEFAULT_DESTINATION_INDIA_CTRY_NAME;
	protected boolean active=true;

	
	@ManyToMany(targetEntity = Tg_Supplier_Master_Entity.class,fetch = FetchType.LAZY)
    Set<Tg_Supplier_Master_Entity> suppliers = new HashSet<>();
	 
	
	public String getCityName() {
		return cityName;
	}


	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public int getDestinationId() {
		return destinationId;
	}


	public void setDestinationId(int destinationId) {
		this.destinationId = destinationId;
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


	public boolean isActive() {
		return active;
	}


	public void setActive(boolean active) {
		this.active = active;
	}



	public Udn_Destinations_Entity() {
		
	}
	
	public Udn_Destinations_Entity(Udn_Destinations_Master_Obj cityObj) {
		this.active=cityObj.isActive();
		this.cityName=cityObj.getCityName();
		this.countryCode=cityObj.getCountryCode();
		this.countryName=cityObj.getCountryName();
	}

	
	public Set<Tg_Supplier_Master_Entity> getSuppliers() {
		return suppliers;
	}


	public void setSuppliers(Set<Tg_Supplier_Master_Entity> suppliers) {
		this.suppliers = suppliers;
	}


	public String toString() {
		String attrib = "destination Id -> " + destinationId + "\n";
		attrib = attrib + " City Name -> " + cityName + "\n";
		attrib = attrib + " Country Code-> " + countryCode + "\n";
		attrib = attrib + " Country Name-> " + countryName + "\n";
		attrib = attrib + " City Active -> " + active + "\n";
		return attrib;
	}

}