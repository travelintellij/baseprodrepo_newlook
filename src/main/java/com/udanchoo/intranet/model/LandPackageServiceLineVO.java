package com.udanchoo.intranet.model;

import java.sql.Date;

import com.udanchoo.intranet.entity.Udn_Deal_HTL_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_LDP_SL_Entity;

public class LandPackageServiceLineVO  {

	private Long ldpServiceId;
	private long serviceMapId;
	private Long dealConfirmationId;
	private int destinationId;
	private int adults;
	private int children;
	private int infants;
	private Date startDate;
	private Date endDate;
	private Date holdingDate;
	private long supplierId;
	private String packageName;
	private String packageType;
	private String packageDetails;
	private String inclusions;
	private String exclusions;
	private String cancellationPolicy;
	private String remarks;
	private int status;
	private long serviceLineOwner;
	private java.util.Date createdAt;
	private float serviceLineCost;
	private float serviceLineMarkup;
	
	private int displayOrder;
	
	
	/*********Extra fields Not there in DB ******/
	
	private String destinationName;
	private String supplierName;
	private String statusName;
	private String clientName;
	private String dealOwnerName;

	/*************************/

	
	

	public LandPackageServiceLineVO(){}
	
	public LandPackageServiceLineVO(Udn_Deal_LDP_SL_Entity landPackageSLEntity) {
		this.ldpServiceId = landPackageSLEntity.getLdpServiceId();
		this.serviceMapId= landPackageSLEntity.getServiceMapId();
		this.dealConfirmationId= landPackageSLEntity.getDealConfirmationId();
		this.supplierId= landPackageSLEntity.getSupplierId();
		this.destinationId= landPackageSLEntity.getDestinationId();
		this.adults= landPackageSLEntity.getAdults();
		this.children= landPackageSLEntity.getChildren();
		this.infants = landPackageSLEntity.getInfants();
		this.startDate= landPackageSLEntity.getStartDate();
		this.endDate= landPackageSLEntity.getEndDate();
		this.holdingDate= landPackageSLEntity.getHoldingDate();
		this.packageName= landPackageSLEntity.getPackageName();
		this.packageType= landPackageSLEntity.getPackageType();
		this.packageDetails= landPackageSLEntity.getPackageDetails();
		this.inclusions=landPackageSLEntity.getInclusions();
		this.exclusions = landPackageSLEntity.getExclusions();
		this.cancellationPolicy = landPackageSLEntity.getCancellationPolicy();
		this.remarks= landPackageSLEntity.getRemarks();
		this.status= landPackageSLEntity.getStatus();
		this.serviceLineCost = landPackageSLEntity.getServiceLineCost();
		this.serviceLineMarkup=landPackageSLEntity.getServiceLineMarkup();
		this.displayOrder=landPackageSLEntity.getDisplayOrder();
		this.createdAt = landPackageSLEntity.getCreatedAt();

	}
	
	public void updateLandPackageVoFromEntity(Udn_Deal_LDP_SL_Entity landPackageSLEntity) {
		this.ldpServiceId = landPackageSLEntity.getLdpServiceId();
		this.serviceMapId= landPackageSLEntity.getServiceMapId();
		this.dealConfirmationId= landPackageSLEntity.getDealConfirmationId();
		this.supplierId= landPackageSLEntity.getSupplierId();
		this.destinationId= landPackageSLEntity.getDestinationId();
		this.adults= landPackageSLEntity.getAdults();
		this.children= landPackageSLEntity.getChildren();
		this.infants = landPackageSLEntity.getInfants();
		this.startDate= landPackageSLEntity.getStartDate();
		this.endDate= landPackageSLEntity.getEndDate();
		this.holdingDate= landPackageSLEntity.getHoldingDate();
		this.packageName= landPackageSLEntity.getPackageName();
		this.packageType= landPackageSLEntity.getPackageType();
		this.packageDetails= landPackageSLEntity.getPackageDetails();
		this.inclusions=landPackageSLEntity.getInclusions();
		this.exclusions = landPackageSLEntity.getExclusions();
		this.cancellationPolicy = landPackageSLEntity.getCancellationPolicy();
		this.remarks= landPackageSLEntity.getRemarks();
		this.status= landPackageSLEntity.getStatus();
		this.serviceLineCost = landPackageSLEntity.getServiceLineCost();
		this.serviceLineMarkup=landPackageSLEntity.getServiceLineMarkup();
		this.displayOrder=landPackageSLEntity.getDisplayOrder();
		this.createdAt = landPackageSLEntity.getCreatedAt();
	}
	
	
	public String toString() {
		String attrib = "**** Displaying LandPackag ServiceLine VO **** :- \n";
		attrib = attrib + " ldpServiceId-> " +ldpServiceId+ "\n";
		attrib = attrib + " supplierId-> " +supplierId + "\n";
		attrib = attrib + " serviceMapId-> " + serviceMapId+ "\n";
		attrib = attrib + " dealConfirmationID-> " +dealConfirmationId + "\n";
		attrib = attrib + " destinationId-> " + destinationId+ "\n";
		attrib = attrib + " adults-> " + adults+ "\n";
		attrib = attrib + " children-> " + children+ "\n";
		attrib = attrib + " infants-> " + infants+ "\n";
		attrib = attrib + " startDate-> " + startDate+ "\n";
		attrib = attrib + " endDate-> " + endDate+ "\n";
		attrib = attrib + " holdingDate-> " + holdingDate+ "\n";
		attrib = attrib + "packageName -> " + packageName+ "\n";
		attrib = attrib + " packageType-> " + packageType+ "\n";
		attrib = attrib + " packageDetails-> " + packageDetails+ "\n";
		attrib = attrib + " exclusions-> " + exclusions+ "\n";
		attrib = attrib + " cancellationPolicy-> " + cancellationPolicy+ "\n";
		attrib = attrib + " remarks-> " + remarks + "\n";
		attrib = attrib + " status -> " + status + "\n";
		attrib = attrib + " serviceLineOwner -> " + serviceLineOwner + "\n";
		attrib = attrib + " createdAt -> " + createdAt + "\n";
		attrib = attrib + " serviceLineCost -> " + serviceLineCost + "\n";
		return attrib;
	}

	
	
	public int getInfants() {
		return infants;
	}

	public void setInfants(int infants) {
		this.infants = infants;
	}

	public String getCancellationPolicy() {
		return cancellationPolicy;
	}

	public void setCancellationPolicy(String cancellationPolicy) {
		this.cancellationPolicy = cancellationPolicy;
	}

	public Long getLdpServiceId() {
		return ldpServiceId;
	}

	public void setLdpServiceId(Long ldpServiceId) {
		this.ldpServiceId = ldpServiceId;
	}

	public long getServiceMapId() {
		return serviceMapId;
	}

	public void setServiceMapId(long serviceMapId) {
		this.serviceMapId = serviceMapId;
	}

	public Long getDealConfirmationId() {
		return dealConfirmationId;
	}

	public void setDealConfirmationId(Long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}

	public int getDestinationId() {
		return destinationId;
	}

	public void setDestinationId(int destinationId) {
		this.destinationId = destinationId;
	}

	public int getAdults() {
		return adults;
	}

	public void setAdults(int adults) {
		this.adults = adults;
	}

	public int getChildren() {
		return children;
	}

	public void setChildren(int children) {
		this.children = children;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	
	
	
	public Date getHoldingDate() {
		return holdingDate;
	}

	public void setHoldingDate(Date holdingDate) {
		this.holdingDate = holdingDate;
	}

	public long getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(long supplierId) {
		this.supplierId = supplierId;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public String getPackageType() {
		return packageType;
	}

	public void setPackageType(String packageType) {
		this.packageType = packageType;
	}

	
	public String getPackageDetails() {
		return packageDetails;
	}

	public void setPackageDetails(String packageDetails) {
		this.packageDetails = packageDetails;
	}

	
	
	
	public String getExclusions() {
		return exclusions;
	}

	public void setExclusions(String exclusions) {
		this.exclusions = exclusions;
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

	public String getDestinationName() {
		return destinationName;
	}

	public void setDestinationName(String destinationName) {
		this.destinationName = destinationName;
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

	public long getServiceLineOwner() {
		return serviceLineOwner;
	}

	public void setServiceLineOwner(long serviceLineOwner) {
		this.serviceLineOwner = serviceLineOwner;
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

	public String getInclusions() {
		return inclusions;
	}

	public void setInclusions(String inclusions) {
		this.inclusions = inclusions;
	}

	public float getServiceLineMarkup() {
		return serviceLineMarkup;
	}

	public void setServiceLineMarkup(float serviceLineMarkup) {
		this.serviceLineMarkup = serviceLineMarkup;
	}

	public int getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}

	public String getDealOwnerName() {
		return dealOwnerName;
	}

	public void setDealOwnerName(String dealOwnerName) {
		this.dealOwnerName = dealOwnerName;
	}
		
	
	
}