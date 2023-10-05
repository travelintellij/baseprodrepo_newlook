package com.udanchoo.intranet.model.quotation;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Map;

import com.udanchoo.intranet.entity.quotation.Udn_Manual_Hotel_Quotation_Entity;

public class ManualHotelQuotationVO extends Udn_Manual_Hotel_Quotation_Entity implements Comparable{

private String cityName;
private String hotelName;
private String roomCategoryName;
private Map roomCategoryMap;
private String mealPlanName;
private String formattedCheckInDate;
private String formattedCheckOutDate;
	
	public void updateManualHotelVoFromEntity(Udn_Manual_Hotel_Quotation_Entity manualHotelEntity) {
		this.manualHotelQuotationId = manualHotelEntity.getManualHotelQuotationId();
		this.optionNo = manualHotelEntity.getOptionNo();
		this.hotelId = manualHotelEntity.getHotelId();
		this.roomCategoryId = manualHotelEntity.getRoomCategoryId();
		this.cityId = manualHotelEntity.getCityId();
		this.checkInDate = manualHotelEntity.getCheckInDate();
		this.checkOutDate = manualHotelEntity.getCheckOutDate();
		this.adults = manualHotelEntity.getAdults();
		this.children = manualHotelEntity.getChildren();
		this.extrabed = manualHotelEntity.getExtrabed();
		this.mealPlan = manualHotelEntity.getMealPlan();
		this.noOfRooms = manualHotelEntity.getNoOfRooms();
		this.remarks = manualHotelEntity.getRemarks();
		this.hotelStayCost = manualHotelEntity.getHotelStayCost();
		this.hotelStayMarkup = manualHotelEntity.getHotelStayMarkup();
		this.displayOrder = manualHotelEntity.getDisplayOrder();
		this.active = manualHotelEntity.isActive();
		this.quotationEntity = manualHotelEntity.getQuotationEntity();
		updateformattedDate(checkInDate,checkOutDate);
	}


	private void updateformattedDate(Date checkInDate, Date checkOutDate) {
		SimpleDateFormat formatter = new SimpleDateFormat("dd-MM-yyyy");  
		formattedCheckInDate = formatter.format(checkInDate); 	
		formattedCheckOutDate = formatter.format(checkOutDate);
	}


@Override
public int compareTo(Object manualHotel) {
	if(this.getDisplayOrder() < ((ManualHotelQuotationVO)manualHotel).getDisplayOrder() ) {
		return -1;
	}
	else {
		return 1;
	}
}


public String getCityName() {
	return cityName;
}


public void setCityName(String cityName) {
	this.cityName = cityName;
}


public String getHotelName() {
	return hotelName;
}


public void setHotelName(String hotelName) {
	this.hotelName = hotelName;
}


public String getRoomCategoryName() {
	return roomCategoryName;
}


public void setRoomCategoryName(String roomCategoryName) {
	this.roomCategoryName = roomCategoryName;
}


public String getMealPlanName() {
	return mealPlanName;
}


public void setMealPlanName(String mealPlanName) {
	this.mealPlanName = mealPlanName;
}


@Override
public String toString() {
	return "ManualHotelQuotationVO [cityName=" + cityName + ", hotelName=" + hotelName + ", roomCategoryName="
			+ roomCategoryName + ", mealPlanName=" + mealPlanName + ", manualHotelQuotationId=" + manualHotelQuotationId
			+ ", hotelId=" + hotelId + ", roomCategoryId=" + roomCategoryId + ", cityId=" + cityId + ", checkInDate="
			+ checkInDate + ", checkOutDate=" + checkOutDate + ", adults=" + adults + ", children=" + children
			+ ", extrabed=" + extrabed + ", mealplan=" + mealPlan + ", noOfRooms=" + noOfRooms + ", remarks=" + remarks
			+ ", hotelStayCost=" + hotelStayCost + ", hotelStayMarkup=" + hotelStayMarkup + ", displayOrder="
			+ displayOrder + ", active=" + active + ", quotationEntity=" + quotationEntity + "]";
}


public Map getRoomCategoryMap() {
	return roomCategoryMap;
}


public void setRoomCategoryMap(Map roomCategoryMap) {
	this.roomCategoryMap = roomCategoryMap;
}


public String getFormattedCheckInDate() {
	return formattedCheckInDate;
}


public void setFormattedCheckInDate(String formattedCheckInDate) {
	this.formattedCheckInDate = formattedCheckInDate;
}


public String getFormattedCheckOutDate() {
	return formattedCheckOutDate;
}


public void setFormattedCheckOutDate(String formattedCheckOutDate) {
	this.formattedCheckOutDate = formattedCheckOutDate;
}



}
