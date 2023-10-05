package com.udanchoo.intranet.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.validation.Valid;

import org.codehaus.jackson.annotate.JsonManagedReference;
import org.hibernate.annotations.Filter;
import org.hibernate.annotations.Where;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.udanchoo.intranet.model.Udn_Hotel_Master_Obj;

@Entity
@Table(name = "udn_hotel_master")
public class Udn_Hotel_Master_Entity extends AuditModel {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int hotelId;

	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy = "hotelId")
    @OrderBy("higherCategory ASC")
	@Where(clause = "active = true and deleted = false")
	@JsonBackReference
    private Set<Udn_Room_Category_Entity> roomCategoryEntityList = new HashSet<Udn_Room_Category_Entity>();
	
	@Column(nullable = false,name="hotelName", unique = false)
	private String hotelName;

	
	@Column(nullable = true,name="hotelChainId", unique = false)
	private int hotelChainId;
	
	@Column(nullable = true,name="cityId", unique = false)
	private int cityId;
	
	@Column(nullable = false,name="address", unique = false)
	private String address;

	@Column(nullable = false,name="locality", unique = false)
	private String locality;

	
	@Column(nullable = false,name="email", unique = false)
	private String email;
	
	@Column(nullable = true,name="phone", unique = false)
	private long phone;
	

	@Column(nullable = true,name="starCategory", unique = false)
	private int starCategory;
	
	@Column(nullable = true,name="udnServiceRating", unique = false)
	private int udnServiceRating;
	
	@Column(nullable = false,name="preferred", unique = false)
	private boolean preferred;

	@Column(nullable = false,name="remarks", unique = false)
	private String remarks;

	
	@Column(nullable = false,name="active", unique = false)
	private boolean active;


	public Udn_Hotel_Master_Entity(@Valid Udn_Hotel_Master_Obj hotelObj) {
		this.hotelId = hotelObj.getHotelId();
		this.cityId=hotelObj.getCityId();
		this.hotelChainId=hotelObj.getHotelChainId();
		this.starCategory=hotelObj.getStarCategory();
		this.udnServiceRating=hotelObj.getUdnServiceRating();
		this.active=hotelObj.isActive();
		this.preferred=hotelObj.isPreferred();
		this.address=hotelObj.getAddress();
		this.email=hotelObj.getEmail();
		this.hotelName=hotelObj.getHotelName();
		this.locality=hotelObj.getLocality();
		this.remarks=hotelObj.getRemarks();
		this.phone=hotelObj.getPhone();

	}


	public Set<Udn_Room_Category_Entity> getRoomCategoryEntityList() {
		return roomCategoryEntityList;
	}


	public void setRoomCategoryEntityList(Set<Udn_Room_Category_Entity> roomCategoryEntityList) {
		this.roomCategoryEntityList = roomCategoryEntityList;
	}


	public int getHotelId() {
		return hotelId;
	}


	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
	}


	public String getHotelName() {
		return hotelName;
	}


	public void setHotelName(String hotelName) {
		this.hotelName = hotelName;
	}


	public int getHotelChainId() {
		return hotelChainId;
	}


	public void setHotelChainId(int hotelChainId) {
		this.hotelChainId = hotelChainId;
	}


	public int getCityId() {
		return cityId;
	}


	public void setCityId(int cityId) {
		this.cityId = cityId;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getLocality() {
		return locality;
	}


	public void setLocality(String locality) {
		this.locality = locality;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public long getPhone() {
		return phone;
	}


	public void setPhone(long phone) {
		this.phone = phone;
	}


	public int getStarCategory() {
		return starCategory;
	}


	public void setStarCategory(int starCategory) {
		this.starCategory = starCategory;
	}


	public int getUdnServiceRating() {
		return udnServiceRating;
	}


	public void setUdnServiceRating(int udnServiceRating) {
		this.udnServiceRating = udnServiceRating;
	}


	public boolean isPreferred() {
		return preferred;
	}


	public void setPreferred(boolean preferred) {
		this.preferred = preferred;
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

	public Udn_Hotel_Master_Entity() {}
	
}