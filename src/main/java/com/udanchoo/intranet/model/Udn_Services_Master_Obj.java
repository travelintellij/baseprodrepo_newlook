package com.udanchoo.intranet.model;

import javax.validation.constraints.Size;

import com.udanchoo.intranet.entity.Udn_Services_Master_Entity;

public class Udn_Services_Master_Obj implements Comparable<Udn_Services_Master_Obj> {

	
	@Size(min=3, max=4,message = "Error: [Service Code] Must be 3 characters.")
	private String serviceCode;
	
	public String getServiceCode() {
		return serviceCode;
	}

	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}

	@Size(min=3, max=100,message = "Error: [Service Name] Must be 3 - 100 characters.")
	private String serviceName;
	
	private boolean active;
	
	public Udn_Services_Master_Obj() {
		
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
	
	public Udn_Services_Master_Obj(Udn_Services_Master_Entity udnServiceEntity) {
		this.serviceCode = udnServiceEntity.getServiceCode();
		this.serviceName=udnServiceEntity.getServiceName();
		this.active=udnServiceEntity.isActive();
	} 
	
	public int compareTo(Udn_Services_Master_Obj udnServiceVO) {  
	    return serviceName.compareTo(udnServiceVO.getServiceName());  
	      
	  } 
}
