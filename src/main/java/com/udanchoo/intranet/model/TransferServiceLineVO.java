package com.udanchoo.intranet.model;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.TimeZone;

import com.udanchoo.intranet.entity.Udn_Deal_STS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_TRN_SL_Entity;

public class TransferServiceLineVO  {

	private Long trnServiceId;
	
	private Date transferDate;
	private long serviceMapId;
	private int supplierId;
	private String remarks;
	private int status;
	private int adults;
	private int children;
	private int infants;
	private int transferType;
	private int pickupCityId;
	private int dropCityId;
	private int pickUpFrom;
	private String pickUpFromName;
	private int dropTo;
	private String dropToName;
	private Long dealConfirmationId;
	private int displayOrder;
	private java.util.Date createdAt;
	private float serviceLineCost;
	private float markup;

	
	/*********Extra fields Not there in DB ******/
	private String pickupCityName;
	private String dropCityName;
	private String supplierName;
	private String statusName;
	private String clientName;
	private String transferTypeName;
	private String pickupTransferPointName;
	private String dropTransferPointName;
	private String dealOwnerName;
	/*************************/

	
	
	public TransferServiceLineVO(){}
	
	public TransferServiceLineVO(Udn_Deal_TRN_SL_Entity trnSLEntity) {
		this.trnServiceId = trnSLEntity.getTrnServiceId();
		this.transferDate=trnSLEntity.getTransferDate();
		this.serviceMapId=trnSLEntity.getServiceMapId();
		this.supplierId=trnSLEntity.getSupplierId();
		this.remarks=trnSLEntity.getRemarks();
		this.status=trnSLEntity.getStatus();
		this.adults=trnSLEntity.getAdults();
		this.children=trnSLEntity.getChildren();
		this.transferType=trnSLEntity.getTransferType();
		this.pickupCityId=trnSLEntity.getPickupCityId();
		this.dropCityId=trnSLEntity.getDropCityId();
		this.pickUpFrom=trnSLEntity.getPickUpFrom();
		this.pickUpFromName=trnSLEntity.getPickUpFromName();
		this.dropTo=trnSLEntity.getDropTo();
		this.dropToName=trnSLEntity.getDropToName();
		this.dealConfirmationId = trnSLEntity.getDealConfirmationId();
		this.createdAt = trnSLEntity.getCreatedAt();
		this.serviceLineCost=trnSLEntity.getServiceLineCost();
		this.markup=trnSLEntity.getMarkup();
		this.displayOrder=trnSLEntity.getDisplayOrder();
		this.infants=trnSLEntity.getInfants();
		
	}
	
	public void updateTransferFromEntity(Udn_Deal_TRN_SL_Entity trnSLEntity) {
		this.trnServiceId = trnSLEntity.getTrnServiceId();
		this.transferDate=trnSLEntity.getTransferDate();
		this.serviceMapId=trnSLEntity.getServiceMapId();
		this.supplierId=trnSLEntity.getSupplierId();
		this.remarks=trnSLEntity.getRemarks();
		this.status=trnSLEntity.getStatus();
		this.adults=trnSLEntity.getAdults();
		this.children=trnSLEntity.getChildren();
		this.transferType=trnSLEntity.getTransferType();
		this.pickupCityId=trnSLEntity.getPickupCityId();
		this.dropCityId=trnSLEntity.getDropCityId();
		this.pickUpFrom=trnSLEntity.getPickUpFrom();
		this.pickUpFromName=trnSLEntity.getPickUpFromName();
		this.dropTo=trnSLEntity.getDropTo();
		this.dropToName=trnSLEntity.getDropToName();
		this.dealConfirmationId = trnSLEntity.getDealConfirmationId();
		this.createdAt = trnSLEntity.getCreatedAt();
		this.serviceLineCost=trnSLEntity.getServiceLineCost();
		this.markup=trnSLEntity.getMarkup();
		this.displayOrder=trnSLEntity.getDisplayOrder();
		this.infants=trnSLEntity.getInfants();
		
	}
	
	public String toString() {
		String attrib = "trnServiceId-> " +trnServiceId + "\n";
		attrib = attrib + " tourDate-> " +transferDate + "\n";
		attrib = attrib + " serviceMapId-> " + serviceMapId+ "\n";
		attrib = attrib + " supplierId-> " +supplierId + "\n";
		attrib = attrib + " remarks-> " + remarks+ "\n";
		attrib = attrib + " status-> " + status+ "\n";
		attrib = attrib + "adults -> " + adults+ "\n";
		attrib = attrib + " children-> " + children+ "\n";
		attrib = attrib + " pickupCityId-> " + pickupCityId + "\n";
		attrib = attrib + " dropCityId-> " + dropCityId + "\n";
		attrib = attrib + " transferType-> " + transferType + "\n";
		attrib = attrib + "pickUpFrom -> " + pickUpFrom+ "\n";
		attrib = attrib + " pickUpFromName-> " + pickUpFromName+ "\n";
		attrib = attrib + " dropTo-> " + dropTo + "\n";
		attrib = attrib + " dropToName-> " + dropToName + "\n";
		attrib = attrib + " dealConfirmationId-> " + dealConfirmationId + "\n";
		attrib = attrib + " serviceLineCost-> " + serviceLineCost + "\n";
		attrib = attrib + " createdAt -> " + createdAt + "\n";

		return attrib;
	}
	
	public void setChildren(String children) {
		if(children!=null && children.trim().length()>0) {
			this.children = Integer.parseInt(children);
		}
		else {
			this.children = 0;
		}
	}

	public Long getTrnServiceId() {
		return trnServiceId;
	}

	public void setTrnServiceId(Long trnServiceId) {
		this.trnServiceId = trnServiceId;
	}

	

	public long getServiceMapId() {
		return serviceMapId;
	}

	public void setServiceMapId(long serviceMapId) {
		this.serviceMapId = serviceMapId;
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

	public int getAdults() {
		return adults;
	}

	public void setAdults(int adults) {
		this.adults = adults;
	}

	public int getChildren() {
		return children;
	}

	
	public int getTransferType() {
		return transferType;
	}

	public void setTransferType(int transferType) {
		this.transferType = transferType;
	}

	

	public int getPickUpFrom() {
		return pickUpFrom;
	}

	public void setPickUpFrom(int pickUpFrom) {
		this.pickUpFrom = pickUpFrom;
	}

	public String getPickUpFromName() {
		return pickUpFromName;
	}

	public void setPickUpFromName(String pickUpFromName) {
		this.pickUpFromName = pickUpFromName;
	}

	public int getDropTo() {
		return dropTo;
	}

	public void setDropTo(int dropTo) {
		this.dropTo = dropTo;
	}

	public String getDropToName() {
		return dropToName;
	}

	public void setDropToName(String dropToName) {
		this.dropToName = dropToName;
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

	public int getPickupCityId() {
		return pickupCityId;
	}

	public void setPickupCityId(int pickupCityId) {
		this.pickupCityId = pickupCityId;
	}

	public int getDropCityId() {
		return dropCityId;
	}

	public void setDropCityId(int dropCityId) {
		this.dropCityId = dropCityId;
	}

	public String getPickupCityName() {
		return pickupCityName;
	}

	public void setPickupCityName(String pickupCityName) {
		this.pickupCityName = pickupCityName;
	}

	public String getDropCityName() {
		return dropCityName;
	}

	public void setDropCityName(String dropCityName) {
		this.dropCityName = dropCityName;
	}

	public Long getDealConfirmationId() {
		return dealConfirmationId;
	}

	public void setDealConfirmationId(Long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}


	public java.util.Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(java.util.Date createdAt) {
		this.createdAt = createdAt;
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

	public Date getTransferDate() {
		return transferDate;
	}

	public void setTransferDate(Date transferDate) {
		this.transferDate = transferDate;
	}

	public int getInfants() {
		return infants;
	}

	public void setInfants(int infants) {
		this.infants = infants;
	}

	public int getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}

	public float getMarkup() {
		return markup;
	}

	public void setMarkup(float markup) {
		this.markup = markup;
	}

	public void setChildren(int children) {
		this.children = children;
	}

	public String getTransferTypeName() {
		return transferTypeName;
	}

	public void setTransferTypeName(String transferTypeName) {
		this.transferTypeName = transferTypeName;
	}

	public String getPickupTransferPointName() {
		return pickupTransferPointName;
	}

	public void setPickupTransferPointName(String pickupTransferPointName) {
		this.pickupTransferPointName = pickupTransferPointName;
	}

	public String getDropTransferPointName() {
		return dropTransferPointName;
	}

	public void setDropTransferPointName(String dropTransferPointName) {
		this.dropTransferPointName = dropTransferPointName;
	}

	public String getDealOwnerName() {
		return dealOwnerName;
	}

	public void setDealOwnerName(String dealOwnerName) {
		this.dealOwnerName = dealOwnerName;
	}

	
	
}