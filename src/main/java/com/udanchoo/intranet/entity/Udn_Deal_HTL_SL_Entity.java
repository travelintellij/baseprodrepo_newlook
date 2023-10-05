package com.udanchoo.intranet.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.Valid;

import com.udanchoo.intranet.entity.quotation.Udn_Manual_Hotel_Quotation_Entity;
import com.udanchoo.intranet.model.HotelServiceLineVO;

@Entity
@Table(name = "udn_htl_service_line")
public class Udn_Deal_HTL_SL_Entity extends AuditModel {
   	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false,name="htlServiceId", unique = true)
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
	private int noofrooms;
	private float serviceLineCost;
	private float markup;
	private int displayOrder;
	
	public Udn_Deal_HTL_SL_Entity() {}
	
	
	public Udn_Deal_HTL_SL_Entity(@Valid HotelServiceLineVO htlServiceLineVO) {
		this.htlServiceId =htlServiceLineVO.getHtlServiceId();
		this.serviceMapId =htlServiceLineVO.getServiceMapId();
		this.checkInDate = htlServiceLineVO.getCheckInDate();
		this.checkOutDate=htlServiceLineVO.getCheckOutDate();
		this.supplierId=htlServiceLineVO.getSupplierId();
		this.holdingDate=htlServiceLineVO.getHoldingDate();
		this.remarks=htlServiceLineVO.getRemarks();
		this.status=htlServiceLineVO.getStatus();
		this.hotelId=htlServiceLineVO.getHotelId();
		this.adults=htlServiceLineVO.getAdults();
		this.children=htlServiceLineVO.getChildren();
		this.extrabed=htlServiceLineVO.getExtrabed();
		this.mealPlan=htlServiceLineVO.getMealPlan();
		this.cityId = htlServiceLineVO.getCityId();
		this.roomCategoryId = htlServiceLineVO.getRoomCategoryId();
		this.dealConfirmationId = htlServiceLineVO.getDealConfirmationId();
		this.noofrooms=htlServiceLineVO.getNoofrooms();
		this.serviceLineCost=htlServiceLineVO.getServiceLineCost();
		this.displayOrder=htlServiceLineVO.getDisplayOrder();
		this.markup=htlServiceLineVO.getMarkup();
		
	}


	public Udn_Deal_HTL_SL_Entity(Udn_Manual_Hotel_Quotation_Entity hotelQtnEntity) {
		this.checkInDate = hotelQtnEntity.getCheckInDate();
		this.checkOutDate=hotelQtnEntity.getCheckOutDate();
		this.remarks=hotelQtnEntity.getRemarks();
		this.hotelId=hotelQtnEntity.getHotelId();
		this.adults=hotelQtnEntity.getAdults();
		this.children=hotelQtnEntity.getChildren();
		this.extrabed=hotelQtnEntity.getExtrabed();
		this.mealPlan=hotelQtnEntity.getMealPlan();
		this.cityId = hotelQtnEntity.getCityId();
		this.roomCategoryId = hotelQtnEntity.getRoomCategoryId();
		this.noofrooms=hotelQtnEntity.getNoOfRooms();
		this.serviceLineCost=hotelQtnEntity.getHotelStayCost();
		this.displayOrder=hotelQtnEntity.getDisplayOrder();
		this.markup=hotelQtnEntity.getHotelStayMarkup();
 
	}


	public int getCityId() {
		return cityId;
	}
	public void setCityId(int cityId) {
		this.cityId = cityId;
	}
	public int getRoomCategoryId() {
		return roomCategoryId;
	}
	public void setRoomCategoryId(int roomCategoryId) {
		this.roomCategoryId = roomCategoryId;
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
	public void setChildren(int children) {
		this.children = children;
	}
	public int getExtrabed() {
		return extrabed;
	}
	public void setExtrabed(int extrabed) {
		this.extrabed = extrabed;
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


	public float getMarkup() {
		return markup;
	}


	public void setMarkup(float markup) {
		this.markup = markup;
	} 
	
	
}