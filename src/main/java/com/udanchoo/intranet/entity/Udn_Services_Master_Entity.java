package com.udanchoo.intranet.entity;

import java.sql.Date;
import java.time.LocalDate;

import javax.persistence.*;
import javax.validation.Valid;

import com.udanchoo.intranet.model.UserDetailsObj;



@Entity
@Table(name = "udn_services_master")
public class Udn_Services_Master_Entity{
	
	@Id
	@Column(nullable = false,name="servicecode", unique = true)
	private String serviceCode;
	
	public String getServiceCode() {
		return serviceCode;
	}

	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}

	@Column(nullable = false,name="servicename", unique = true)
	private String serviceName;

	@Column(nullable = false,name="active", unique = false)
	boolean active;

	public Udn_Services_Master_Entity() {
		
	}
	
	
	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
	
	public String toString() {
		String attrib = "Service Code -> " + serviceCode + "\n";
		attrib = attrib + " Service Name -> " + serviceName + "\n";
		attrib = attrib + " Service Active -> " + active + "\n";
		return attrib;
	}

}