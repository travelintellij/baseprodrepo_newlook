package com.udanchoo.intranet.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.udanchoo.intranet.model.Udn_Room_Category_Obj;

@Entity
@Table(name = "udn_room_category_master")
public class Udn_Room_Category_Entity extends AuditModel {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int roomCategoryId;

	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="hotelId", nullable=false)
	@JsonManagedReference
    private Udn_Hotel_Master_Entity hotelId;
	
	@Column(nullable = false,name="roomCategoryName", unique = false)
	private String roomCategoryName;


	public Udn_Hotel_Master_Entity getHotelId() {
		return hotelId;
	}

	public void setHotelId(Udn_Hotel_Master_Entity hotelId) {
		this.hotelId = hotelId;
	}

	@Column(nullable = false,name="higherCategory", unique = false)
	private int higherCategory;

	@Column(nullable = false,name="roomSize", unique = false)
	private int roomSize;

	
	@Column(nullable = false,name="no_of_rooms", unique = false)
	private int noOfRooms;

	
	public int getNoOfRooms() {
		return noOfRooms;
	}

	public void setNoOfRooms(int noOfRooms) {
		this.noOfRooms = noOfRooms;
	}

	@Column(nullable = true,name="remarks", unique = false)
	private String remarks;
	
	@Column(nullable = false,name="active", unique = false)
	private boolean active=true;
	
	private boolean deleted;

	public Udn_Room_Category_Entity() {}

	public Udn_Room_Category_Entity(Udn_Room_Category_Obj roomCategoryObj) {
		this.active=roomCategoryObj.isActive();
		this.higherCategory=roomCategoryObj.getHigherCategory();
		this.roomCategoryId=roomCategoryObj.getRoomCategoryId();
		this.hotelId = roomCategoryObj.getParentEntity();
		this.roomSize=roomCategoryObj.getRoomSize();
		this.remarks=roomCategoryObj.getRemarks();
		this.roomCategoryName=roomCategoryObj.getRoomCategoryName();
		this.noOfRooms = roomCategoryObj.getNoOfRooms();
		this.deleted = roomCategoryObj.isDeleted();
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

	public boolean isDeleted() {
		return deleted;
	}

	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	



}