package com.udanchoo.intranet.model;

import java.sql.Date;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import com.udanchoo.intranet.entity.Udn_Deal_FLT_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_OTH_SL_Entity;

public class OtherServiceLineVO {
	
	private long othServiceId;
	private long serviceMapId;
	private long dealConfirmationId;
	private long supplierId;

	private String serviceName;
	private String serviceType;
	private String serviceDetails;
	private Date serviceDate;
	private String remarks;
	private int status;
	//private long serviceLineOwner;
	private java.util.Date createdAt;
	private float serviceLineCost;
	private float markup;
	private int displayOrder;
	
	//Additional properties carried by DTO not in Entity.
	private String supplierName;
	private String statusName;
	private String clientName;
	
		
	public String toString() {
		String attrib = " Other Serrvice VO " + "\n";
		attrib = attrib + " othServiceId -> " + this.othServiceId +"\n"; 
		attrib = attrib + " serviceMapId -> " + this.serviceMapId +"\n";
		attrib = attrib + "dealConfirmationId -> " + this.dealConfirmationId +"\n";
		attrib = attrib + "supplierId -> " + this.supplierId +"\n";
		attrib = attrib + "serviceName -> " + this.serviceName +"\n";
		attrib = attrib + "serviceType -> " + this.serviceType +"\n";
		attrib = attrib + "serviceDetails -> " + this.serviceDetails +"\n";
		attrib = attrib + " serviceDate -> " + this.serviceDate +"\n";
		attrib = attrib + " remarks -> " + this.remarks +"\n";
		attrib = attrib + "status " + this.status +"\n";

		attrib = attrib + "serviceLineCost " + this.serviceLineCost+"\n";
		attrib = attrib + "createdAt " + this.createdAt +"\n";
		
		return attrib;
	}

	public OtherServiceLineVO() {}
	
	public OtherServiceLineVO(Udn_Deal_OTH_SL_Entity othSLEntity){
		this.othServiceId = othSLEntity.getOthServiceId();
		this.serviceMapId= othSLEntity.getServiceMapId();
		this.dealConfirmationId= othSLEntity.getDealConfirmationId();
		this.supplierId= othSLEntity.getSupplierId();
		this.serviceName= othSLEntity.getServiceName();
		this.serviceType= othSLEntity.getServiceType();
		this.serviceDetails= othSLEntity.getServiceDetails();
		this.serviceDate= othSLEntity.getServiceDate();
		this.remarks= othSLEntity.getRemarks();
		this.status= othSLEntity.getStatus();
		this.markup=othSLEntity.getMarkup();
		this.displayOrder=othSLEntity.getDisplayOrder();
		this.serviceLineCost = othSLEntity.getServiceLineCost();
		this.createdAt = othSLEntity.getCreatedAt();
	}

	public void updateVOFromEntity(Udn_Deal_OTH_SL_Entity othSLEntity){
		this.othServiceId = othSLEntity.getOthServiceId();
		this.serviceMapId= othSLEntity.getServiceMapId();
		this.dealConfirmationId= othSLEntity.getDealConfirmationId();
		this.supplierId= othSLEntity.getSupplierId();
		this.serviceName= othSLEntity.getServiceName();
		this.serviceType= othSLEntity.getServiceType();
		this.serviceDetails= othSLEntity.getServiceDetails();
		this.serviceDate= othSLEntity.getServiceDate();
		this.remarks= othSLEntity.getRemarks();
		this.status= othSLEntity.getStatus();
		this.markup=othSLEntity.getMarkup();
		this.displayOrder=othSLEntity.getDisplayOrder();
		this.serviceLineCost = othSLEntity.getServiceLineCost();
		this.createdAt = othSLEntity.getCreatedAt();
	}
	
	public long getOthServiceId() {
		return othServiceId;
	}

	public void setOthServiceId(long othServiceId) {
		this.othServiceId = othServiceId;
	}

	public long getServiceMapId() {
		return serviceMapId;
	}

	public void setServiceMapId(long serviceMapId) {
		this.serviceMapId = serviceMapId;
	}

	public long getDealConfirmationId() {
		return dealConfirmationId;
	}

	public void setDealConfirmationId(long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}

	public long getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(long supplierId) {
		this.supplierId = supplierId;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	public String getServiceDetails() {
		return serviceDetails;
	}

	public void setServiceDetails(String serviceDetails) {
		this.serviceDetails = serviceDetails;
	}

	public Date getServiceDate() {
		return serviceDate;
	}

	public void setServiceDate(Date serviceDate) {
		this.serviceDate = serviceDate;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public java.util.Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(java.util.Date createdAt) {
		this.createdAt = createdAt;
	}

	public float getServiceLineCost() {
		return serviceLineCost;
	}

	public void setServiceLineCost(float serviceLineCost) {
		this.serviceLineCost = serviceLineCost;
	}

	public float getMarkup() {
		return markup;
	}

	public void setMarkup(float markup) {
		this.markup = markup;
	}

	public int getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}
	
	
	
	
	
}
