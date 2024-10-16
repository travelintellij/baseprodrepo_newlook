package com.udanchoo.intranet.model;

import java.sql.Date;
import java.time.LocalDateTime;

import com.udanchoo.intranet.entity.Udn_Deal_STS_SL_Entity;

public class SightSeeingServiceLineVO  {

	private Long stsServiceId;
	private long serviceMapId;
	private Date  tourDate;
	private int supplierId;

	private String remarks;
	private int status;
	private long sightSeeingId;
	private int adults;
	private int children;
	private int infants;
	private int transferType;
	private String transferTypeName;
	private int cityId;
	private Long dealConfirmationId;
	
	private float serviceLineCost;
	private float markup;
	private int displayOrder;
	private boolean savedSightSeeing;
	
	/*********Extra fields Not there in DB ******/
	
	private String cityName;
	private String supplierName;
	private String sightSeeingName;
	
	private String statusName;
	private String clientName;
	private String dealOwnerName;
	/*************************/

	
	
	public SightSeeingServiceLineVO(){}
	
	public SightSeeingServiceLineVO(Udn_Deal_STS_SL_Entity stsSLEntity) {
		this.stsServiceId =stsSLEntity.getStsServiceId();
		this.sightSeeingName=stsSLEntity.getSightSeeingName();
		this.serviceMapId =stsSLEntity.getServiceMapId();
		this.tourDate = stsSLEntity.getTourDate();
		this.supplierId=stsSLEntity.getSupplierId();
		this.remarks=stsSLEntity.getRemarks();
		this.status=stsSLEntity.getStatus();
		this.sightSeeingId=stsSLEntity.getSightSeeingId();
		this.adults=stsSLEntity.getAdults();
		this.children=stsSLEntity.getChildren();
		this.cityId = stsSLEntity.getCityId();
		this.transferType = stsSLEntity.getTransferType();
		this.dealConfirmationId = stsSLEntity.getDealConfirmationId();
		this.serviceLineCost = stsSLEntity.getServiceLineCost();
		this.markup=stsSLEntity.getMarkup();
		this.displayOrder=stsSLEntity.getDisplayOrder();
		this.savedSightSeeing=stsSLEntity.isSavedSightSeeing();
		this.infants=stsSLEntity.getInfants();
	}
	
	
	public void updateVoFromEntity(Udn_Deal_STS_SL_Entity stsSLEntity) {
		this.stsServiceId =stsSLEntity.getStsServiceId();
		this.sightSeeingName=stsSLEntity.getSightSeeingName();
		this.serviceMapId =stsSLEntity.getServiceMapId();
		this.tourDate = stsSLEntity.getTourDate();
		this.supplierId=stsSLEntity.getSupplierId();
		this.remarks=stsSLEntity.getRemarks();
		this.status=stsSLEntity.getStatus();
		this.sightSeeingId=stsSLEntity.getSightSeeingId();
		this.adults=stsSLEntity.getAdults();
		this.children=stsSLEntity.getChildren();
		this.cityId = stsSLEntity.getCityId();
		this.transferType = stsSLEntity.getTransferType();
		this.dealConfirmationId = stsSLEntity.getDealConfirmationId();
		this.serviceLineCost = stsSLEntity.getServiceLineCost();
		this.markup=stsSLEntity.getMarkup();
		this.displayOrder=stsSLEntity.getDisplayOrder();
		this.savedSightSeeing=stsSLEntity.isSavedSightSeeing();
		this.infants=stsSLEntity.getInfants();
	}
	

	
	@Override
	public String toString() {
		return "SightSeeingServiceLineVO [stsServiceId=" + stsServiceId + ", serviceMapId=" + serviceMapId
				+ ", tourDate=" + tourDate + ", supplierId=" + supplierId + ", remarks=" + remarks + ", status="
				+ status + ", sightSeeingId=" + sightSeeingId + ", adults=" + adults + ", children=" + children
				+ ", infants=" + infants + ", transferType=" + transferType + ", transferTypeName=" + transferTypeName
				+ ", cityId=" + cityId + ", dealConfirmationId=" + dealConfirmationId + ", serviceLineCost="
				+ serviceLineCost + ", markup=" + markup + ", displayOrder=" + displayOrder + ", savedSightSeeing="
				+ savedSightSeeing + ", cityName=" + cityName + ", supplierName=" + supplierName + ", sightSeeingName="
				+ sightSeeingName + ", statusName=" + statusName + ", clientName=" + clientName + "]";
	}

	public void setChildren(String children) {
		if(children!=null && children.trim().length()>0) {
			this.children = Integer.parseInt(children);
		}
		else {
			this.children = 0;
		}
	}

	public Long getStsServiceId() {
		return stsServiceId;
	}

	public void setStsServiceId(Long stsServiceId) {
		this.stsServiceId = stsServiceId;
	}

	public long getServiceMapId() {
		return serviceMapId;
	}

	public void setServiceMapId(long serviceMapId) {
		this.serviceMapId = serviceMapId;
	}

	public Date getTourDate() {
		return tourDate;
	}

	public void setTourDate(Date tourDate) {
		this.tourDate = tourDate;
	}

	public int getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
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

	public long getSightSeeingId() {
		return sightSeeingId;
	}

	public void setSightSeeingId(long sightSeeingId) {
		this.sightSeeingId = sightSeeingId;
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

	
	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getSightSeeingName() {
		return sightSeeingName;
	}

	public void setSightSeeingName(String sightSeeingName) {
		this.sightSeeingName = sightSeeingName;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public int getTransferType() {
		return transferType;
	}

	public void setTransferType(int transferType) {
		this.transferType = transferType;
	}

	public Long getDealConfirmationId() {
		return dealConfirmationId;
	}

	public void setDealConfirmationId(Long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}


	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
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

	public boolean isSavedSightSeeing() {
		return savedSightSeeing;
	}

	public void setSavedSightSeeing(boolean savedSightSeeing) {
		this.savedSightSeeing = savedSightSeeing;
	}

	public void setChildren(int children) {
		this.children = children;
	}

	public int getInfants() {
		return infants;
	}

	public void setInfants(int infants) {
		this.infants = infants;
	}

	public String getTransferTypeName() {
		return transferTypeName;
	}

	public void setTransferTypeName(String transferTypeName) {
		this.transferTypeName = transferTypeName;
	}

	public String getDealOwnerName() {
		return dealOwnerName;
	}

	public void setDealOwnerName(String dealOwnerName) {
		this.dealOwnerName = dealOwnerName;
	}
	
	
	
	
}