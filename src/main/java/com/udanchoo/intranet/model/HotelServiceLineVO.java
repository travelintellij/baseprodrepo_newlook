package com.udanchoo.intranet.model;

import java.sql.Date;

import com.udanchoo.intranet.entity.Udn_Deal_HTL_SL_Entity;

public class HotelServiceLineVO  {

	private Long htlServiceId;
	private long serviceMapId;
	private Date checkInDate;
	private Date checkOutDate;
	private int supplierId;
	private Date holdingDate;
	private String remarks;
	private int status;
	private int hotelId;
	private int adults;
	private int children;
	private int extrabed;
	private int mealPlan;
	private int roomCategoryId;
	private int cityId;
	private Long dealConfirmationId;
		
	private java.util.Date createdAt;
	private int noofrooms;
	private float serviceLineCost;
	private int displayOrder;
	private float markup;
	/*********Extra fields Not there in DB ******/
	
	private String cityName;
	private String supplierName;
	private String hotelName;
	private String roomCategoryName;
	private String statusName;
	private String clientName;
	private String mealPlanName;
	private String dealOwnerName;
	
	/*************************/

	
	
	
	public String getHotelName() {
		return hotelName;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public String getRoomCategoryName() {
		return roomCategoryName;
	}

	public void setRoomCategoryName(String roomCategoryName) {
		this.roomCategoryName = roomCategoryName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}
	
	public int getRoomCategoryId() {
		return roomCategoryId;
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

	public void setRoomCategoryId(int roomCategoryId) {
		this.roomCategoryId = roomCategoryId;
	}

	public HotelServiceLineVO(){}
	
	public HotelServiceLineVO(Udn_Deal_HTL_SL_Entity hotelSLEntity) {
		this.htlServiceId =hotelSLEntity.getHtlServiceId();
		this.serviceMapId =hotelSLEntity.getServiceMapId();
		this.checkInDate = hotelSLEntity.getCheckInDate();
		this.checkOutDate=hotelSLEntity.getCheckOutDate();
		this.supplierId=hotelSLEntity.getSupplierId();
		this.holdingDate=hotelSLEntity.getHoldingDate();
		this.remarks=hotelSLEntity.getRemarks();
		this.status=hotelSLEntity.getStatus();
		this.hotelId=hotelSLEntity.getHotelId();
		this.adults=hotelSLEntity.getAdults();
		this.children=hotelSLEntity.getChildren();
		this.extrabed=hotelSLEntity.getExtrabed();
		this.mealPlan=hotelSLEntity.getMealPlan();
		this.cityId = hotelSLEntity.getCityId();
		this.roomCategoryId = hotelSLEntity.getRoomCategoryId();
		this.dealConfirmationId = hotelSLEntity.getDealConfirmationId();
		this.createdAt= hotelSLEntity.getCreatedAt();
		this.noofrooms=hotelSLEntity.getNoofrooms();
		this.serviceLineCost=hotelSLEntity.getServiceLineCost();
		this.displayOrder=hotelSLEntity.getDisplayOrder();
		this.markup=hotelSLEntity.getMarkup();
	}
	
	public void updateHTLSLVoFrmEntity(Udn_Deal_HTL_SL_Entity hotelSLEntity) {
		this.htlServiceId =hotelSLEntity.getHtlServiceId();
		this.serviceMapId =hotelSLEntity.getServiceMapId();
		this.checkInDate = hotelSLEntity.getCheckInDate();
		this.checkOutDate=hotelSLEntity.getCheckOutDate();
		this.supplierId=hotelSLEntity.getSupplierId();
		this.holdingDate=hotelSLEntity.getHoldingDate();
		//this.remarks=hotelSLEntity.getRemarks();
		this.status=hotelSLEntity.getStatus();
		this.hotelId=hotelSLEntity.getHotelId();
		this.adults=hotelSLEntity.getAdults();
		this.children=hotelSLEntity.getChildren();
		this.extrabed=hotelSLEntity.getExtrabed();
		this.mealPlan=hotelSLEntity.getMealPlan();
		this.cityId = hotelSLEntity.getCityId();
		this.roomCategoryId = hotelSLEntity.getRoomCategoryId();
		this.dealConfirmationId = hotelSLEntity.getDealConfirmationId();
		this.createdAt= hotelSLEntity.getCreatedAt();
		this.noofrooms=hotelSLEntity.getNoofrooms();
		this.serviceLineCost=hotelSLEntity.getServiceLineCost();
		this.displayOrder=hotelSLEntity.getDisplayOrder();
		this.markup=hotelSLEntity.getMarkup();
	}
	
	
	public String toString() {
		String attrib = "htlServiceId-> " +htlServiceId + "\n";
		attrib = attrib + " supplierId-> " +supplierId + "\n";
		attrib = attrib + " serviceMapId-> " + serviceMapId+ "\n";
		attrib = attrib + " checkInDate-> " +checkInDate + "\n";
		attrib = attrib + " checkOutDate-> " + checkOutDate+ "\n";
		attrib = attrib + " holdingDate-> " + holdingDate+ "\n";
		attrib = attrib + " remarks-> " + remarks+ "\n";
		attrib = attrib + " status-> " + status+ "\n";
		attrib = attrib + " hotelId-> " + hotelId+ "\n";
		attrib = attrib + "adults -> " + adults+ "\n";
		attrib = attrib + " children-> " + children+ "\n";
		attrib = attrib + "extrabed -> " +extrabed + "\n";
		attrib = attrib + " mealplan-> " + mealPlan+ "\n";
		attrib = attrib + " cityId-> " + cityId + "\n";
		attrib = attrib + " roomCategory -> " + roomCategoryId + "\n";
		attrib = attrib + " dealConfirmationId -> " + dealConfirmationId + "\n";
		attrib = attrib + " createdAt -> " + createdAt + "\n";
		
		attrib = attrib + " noofrooms -> " + noofrooms + "\n";
		attrib = attrib + " serviceLineCost -> " + serviceLineCost + "\n";
		return attrib;
	}
	
	public Long getHtlServiceId() {
		return htlServiceId;
	}

	public void setHtlServiceId(Long htlServiceId) {
		this.htlServiceId = htlServiceId;
	}
	
	public long getServiceMapId() {
		return serviceMapId;
	}
	
	public void setServiceMapId(long serviceMapId) {
		this.serviceMapId = serviceMapId;
	}
	public Date getCheckInDate() {
		return checkInDate;
	}
	public void setCheckInDate(Date checkInDate) {
		this.checkInDate = checkInDate;
	}
	public Date getCheckOutDate() {
		return checkOutDate;
	}
	public void setCheckOutDate(Date checkOutDate) {
		this.checkOutDate = checkOutDate;
	}
	public int getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
	}
	public Date getHoldingDate() {
		return holdingDate;
	}
	public void setHoldingDate(Date holdingDate) {
		this.holdingDate = holdingDate;
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
	public int getHotelId() {
		return hotelId;
	}
	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
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
	public void setChildren(String children) {
		if(children!=null && children.trim().length()>0) {
			this.children = Integer.parseInt(children);
		}
		else {
			this.children = 0;
		}
	}
	public int getExtrabed() {
		return extrabed;
	}
	public void setExtrabed(String extrabed) {
		if(extrabed!=null && extrabed.trim().length()>0) {
			this.extrabed = Integer.parseInt(extrabed);
		}
		else {
			this.extrabed = 0;
		}
	}
	public int getMealPlan() {
		return mealPlan;
	}
	public void setMealPlan(int mealPlan) {
		this.mealPlan = mealPlan;
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

	public java.util.Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(java.util.Date createdAt) {
		this.createdAt = createdAt;
	}

	public int getNoofrooms() {
		return noofrooms;
	}

	public void setNoofrooms(int noofrooms) {
		this.noofrooms = noofrooms;
	}

	public float getServiceLineCost() {
		return serviceLineCost;
	}

	public void setServiceLineCost(float serviceLineCost) {
		this.serviceLineCost = serviceLineCost;
	}

	public int getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}

	public void setChildren(int children) {
		this.children = children;
	}

	public void setExtrabed(int extrabed) {
		this.extrabed = extrabed;
	}

	public String getMealPlanName() {
		return mealPlanName;
	}

	public void setMealPlanName(String mealPlanName) {
		this.mealPlanName = mealPlanName;
	}

	public float getMarkup() {
		return markup;
	}

	public void setMarkup(float markup) {
		this.markup = markup;
	}

	public String getDealOwnerName() {
		return dealOwnerName;
	}

	public void setDealOwnerName(String dealOwnerName) {
		this.dealOwnerName = dealOwnerName;
	}
	
	
	
	
}