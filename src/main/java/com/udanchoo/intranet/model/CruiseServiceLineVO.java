package com.udanchoo.intranet.model;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.TimeZone;

import com.udanchoo.intranet.entity.Udn_Deal_CRS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_STS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_TRN_SL_Entity;

public class CruiseServiceLineVO  {

	private Long crsServiceId;
	
	private Date cruiseStartDate;
	private Date cruiseEndDate;
	private long serviceMapId;
	private int supplierId;
	private String remarks;
	private int status;
	private int adults;
	private int children;
	private int infants;
	
	private int cityId;
	private Long dealConfirmationId;
	private float serviceLineCost;
	private float markup;
	private int displayOrder;

	private int cruiseProvider;
	private String childrenAgeInfo;
	private int noOfDecks;	
	private int stateRoomType;
	private String cruiseName;
	
	private String statusName;
	private String cityName;
	private String supplierName;
	private String stateRoomTypeName;
	private String cruiseProviderName;

	
	public CruiseServiceLineVO() {
		
	}
	
	public CruiseServiceLineVO(Udn_Deal_CRS_SL_Entity crsEntity) {
		this.crsServiceId=crsEntity.getCrsServiceId();
		this.cruiseStartDate=crsEntity.getCruiseStartDate();
		this.cruiseEndDate=crsEntity.getCruiseEndDate();
		this.serviceMapId=crsEntity.getServiceMapId();
		this.supplierId=crsEntity.getSupplierId();
		this.remarks=crsEntity.getRemarks();
		this.status=crsEntity.getStatus();
		this.adults=crsEntity.getAdults();
		this.children=crsEntity.getChildren();
		this.infants=crsEntity.getInfants();
		this.cityId=crsEntity.getCityId();
		this.dealConfirmationId=crsEntity.getDealConfirmationId();
		this.serviceLineCost=crsEntity.getServiceLineCost();
		this.markup=crsEntity.getMarkup();
		this.displayOrder=crsEntity.getDisplayOrder();
		this.cruiseProvider=crsEntity.getCruiseProvider();
		this.childrenAgeInfo=crsEntity.getChildrenAgeInfo();
		this.noOfDecks=crsEntity.getNoOfDecks();	
		this.stateRoomType=crsEntity.getStateRoomType();
		this.cruiseName=crsEntity.getCruiseName();
	}
	
	public void updateVOFromEntity(Udn_Deal_CRS_SL_Entity crsEntity) {
		this.crsServiceId=crsEntity.getCrsServiceId();
		this.cruiseStartDate=crsEntity.getCruiseStartDate();
		this.cruiseEndDate=crsEntity.getCruiseEndDate();
		this.serviceMapId=crsEntity.getServiceMapId();
		this.supplierId=crsEntity.getSupplierId();
		this.remarks=crsEntity.getRemarks();
		this.status=crsEntity.getStatus();
		this.adults=crsEntity.getAdults();
		this.children=crsEntity.getChildren();
		this.infants=crsEntity.getInfants();
		this.cityId=crsEntity.getCityId();
		this.dealConfirmationId=crsEntity.getDealConfirmationId();
		this.serviceLineCost=crsEntity.getServiceLineCost();
		this.markup=crsEntity.getMarkup();
		this.displayOrder=crsEntity.getDisplayOrder();
		this.cruiseProvider=crsEntity.getCruiseProvider();
		this.childrenAgeInfo=crsEntity.getChildrenAgeInfo();
		this.noOfDecks=crsEntity.getNoOfDecks();	
		this.stateRoomType=crsEntity.getStateRoomType();
		this.cruiseName=crsEntity.getCruiseName();
	}
	
	
	public Long getCrsServiceId() {
		return crsServiceId;
	}
	public void setCrsServiceId(Long crsServiceId) {
		this.crsServiceId = crsServiceId;
	}
	public Date getCruiseStartDate() {
		return cruiseStartDate;
	}
	public void setCruiseStartDate(Date cruiseStartDate) {
		this.cruiseStartDate = cruiseStartDate;
	}
	public Date getCruiseEndDate() {
		return cruiseEndDate;
	}
	public void setCruiseEndDate(Date cruiseEndDate) {
		this.cruiseEndDate = cruiseEndDate;
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
	public void setChildren(int children) {
		this.children = children;
	}
	public int getInfants() {
		return infants;
	}
	public void setInfants(int infants) {
		this.infants = infants;
	}
	public int getCityId() {
		return cityId;
	}
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	public Long getDealConfirmationId() {
		return dealConfirmationId;
	}
	public void setDealConfirmationId(Long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
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
	public int getCruiseProvider() {
		return cruiseProvider;
	}
	public void setCruiseProvider(int cruiseProvider) {
		this.cruiseProvider = cruiseProvider;
	}
	public String getChildrenAgeInfo() {
		return childrenAgeInfo;
	}
	public void setChildrenAgeInfo(String childrenAgeInfo) {
		this.childrenAgeInfo = childrenAgeInfo;
	}
	public int getNoOfDecks() {
		return noOfDecks;
	}
	public void setNoOfDecks(int noOfDecks) {
		this.noOfDecks = noOfDecks;
	}
	public int getStateRoomType() {
		return stateRoomType;
	}
	public void setStateRoomType(int stateRoomType) {
		this.stateRoomType = stateRoomType;
	}
	public String getCruiseName() {
		return cruiseName;
	}
	public void setCruiseName(String cruiseName) {
		this.cruiseName = cruiseName;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
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

	public String getStateRoomTypeName() {
		return stateRoomTypeName;
	}

	public void setStateRoomTypeName(String stateRoomTypeName) {
		this.stateRoomTypeName = stateRoomTypeName;
	}

	public String getCruiseProviderName() {
		return cruiseProviderName;
	}

	public void setCruiseProviderName(String cruiseProviderName) {
		this.cruiseProviderName = cruiseProviderName;
	}
	
	
	
	
}