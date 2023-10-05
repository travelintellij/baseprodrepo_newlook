package com.udanchoo.intranet.model;

import com.udanchoo.intranet.entity.Udn_Deal_Services_Entity;

public class Udn_Deal_Services_Map_Obj  {
    
    private Long dealConfirmationId;
    private Long serviceMapId;
    private String dealServiceCode;
    private String serviceName;
    private int serviceStatus;
    private String statusName;

    
    
    
  

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public Long getDealConfirmationId() {
		return dealConfirmationId;
	}

	public void setDealConfirmationId(Long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}

	public Long getServiceMapId() {
		return serviceMapId;
	}

	public void setServiceMapId(Long serviceMapId) {
		this.serviceMapId = serviceMapId;
	}

	public String getDealServiceCode() {
		return dealServiceCode;
	}

	public void setDealServiceCode(String dealServiceCode) {
		this.dealServiceCode = dealServiceCode;
	}

	public int getServiceStatus() {
		return serviceStatus;
	}

	public void setServiceStatus(int serviceStatus) {
		this.serviceStatus = serviceStatus;
	}

	

	
	
    
    public Udn_Deal_Services_Map_Obj() { 	
    }
    
    public Udn_Deal_Services_Map_Obj(Udn_Deal_Services_Entity dealServiceMapEntity) {
		this.serviceMapId = dealServiceMapEntity.getServiceMapId();
    	this.dealServiceCode=dealServiceMapEntity.getDealServiceCode();
		this.serviceStatus = dealServiceMapEntity.getServiceStatus();

		//this.createdAt = dealServiceMapEntity.getCreatedAt();
		//this.updatedAt=dealServiceMapEntity.getUpdatedAt();
	}
   
	
	public String toString() {
		String attrib = " dealConfirmationId -> " + this.dealConfirmationId + "\n<BR>";
		attrib = attrib + " serviceMapId  -> " + this.serviceMapId + "\n<BR>";
		attrib = attrib + " dealServiceCode  -> " + this.dealServiceCode + "\n<BR>";
		attrib = attrib + " serviceStatus  -> " + this.serviceStatus + "\n<BR>";
		attrib = attrib + "*******************************************<BR>";

		return attrib;
	}
   
    
}
