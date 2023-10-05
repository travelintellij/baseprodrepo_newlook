package com.udanchoo.intranet.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.udanchoo.intranet.entity.Udn_Hotel_Master_Entity;
import com.udanchoo.intranet.entity.Udn_Room_Category_Entity;
import com.udanchoo.intranet.model.Udn_Hotel_Chain_Obj;


public class Udn_Room_Category_Obj {
	
	private int roomCategoryId;
	private String roomCategoryName;
	private int hotelId;
	private int higherCategory;
	private int roomSize;
	private String remarks;
	private int noOfRooms;
	private Udn_Hotel_Master_Entity parentEntity;
	private boolean active;
	private boolean deleted;
	private String hotelName;
	

	public Udn_Hotel_Master_Entity getParentEntity() {
		return parentEntity;
	}

	public void setParentEntity(Udn_Hotel_Master_Entity parentEntity) {
		this.parentEntity = parentEntity;
	}

	public int getNoOfRooms() {
		return noOfRooms;
	}

	public void setNoOfRooms(int noOfRooms) {
		this.noOfRooms = noOfRooms;
	}

	

	public Udn_Room_Category_Obj() {}

	public Udn_Room_Category_Obj(Udn_Room_Category_Entity roomCategoryEntity) {
		this.active=roomCategoryEntity.isActive();
		this.higherCategory=roomCategoryEntity.getHigherCategory();
		this.roomCategoryId=roomCategoryEntity.getRoomCategoryId();
		this.hotelId=roomCategoryEntity.getHotelId().getHotelId();
		this.roomSize=roomCategoryEntity.getRoomSize();
		this.remarks=roomCategoryEntity.getRemarks();
		this.roomCategoryName=roomCategoryEntity.getRoomCategoryName();
		this.noOfRooms = roomCategoryEntity.getNoOfRooms();
		this.deleted = roomCategoryEntity.isDeleted();
		this.hotelName = roomCategoryEntity.getHotelId().getHotelName();
	}

	public int getRoomCategoryId() {
		return roomCategoryId;
	}

	public void setRoomCategoryId(int roomCategoryId) {
		this.roomCategoryId = roomCategoryId;
	}

	public String getRoomCategoryName() {
		return roomCategoryName;
	}

	public void setRoomCategoryName(String roomCategoryName) {
		this.roomCategoryName = roomCategoryName;
	}

	public int getHotelId() {
		return hotelId;
	}

	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
	}

	public int getHigherCategory() {
		return higherCategory;
	}

	public void setHigherCategory(int higherCategory) {
		this.higherCategory = higherCategory;
	}

	public int getRoomSize() {
		return roomSize;
	}

	public void setRoomSize(int roomSize) {
		this.roomSize = roomSize;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
	
	public String toString() {
		String attrib = "roomCategoryId -> " + roomCategoryId + "\n";
		attrib = attrib +" hotelId -> " + hotelId + "\n";
		attrib = attrib +" higherCategory-> " + higherCategory+ "\n";
		attrib = attrib +" roomSize-> " +roomSize + "\n";
		attrib = attrib +" roomCategoryName-> " + roomCategoryName+ "\n";
		attrib = attrib +" noOfRooms -> " + noOfRooms+ "\n";
		attrib = attrib +" remarks-> " +remarks + "\n";
		attrib = attrib +" active -> " +active + "\n";
		attrib = attrib +" deleted -> " +deleted + "\n";
		return attrib;
	}

	public boolean isDeleted() {
		return deleted;
	}

	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}

	public String getHotelName() {
		return hotelName;
	}

	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}


	
}