package com.udanchoo.intranet.model;

import java.util.HashSet;
import java.util.Set;

import javax.validation.constraints.Min;

import com.udanchoo.intranet.entity.Udn_Hotel_Master_Entity;
import com.udanchoo.intranet.entity.Udn_Room_Category_Entity;

public class Udn_Hotel_Master_Obj {
	
	protected int hotelId=0;
	protected String hotelName;
	protected int hotelChainId=0;
	
	@Min(value=1, message="Error[City Name] Invalid City Selected.")  
	protected int cityId;
	
	protected String address;
	protected String locality;

	protected String email;

	protected long phone;

	protected int starCategory;

	protected int udnServiceRating;

	protected boolean preferred;

	protected String remarks;
	
	protected String defaultRoomCategory;
	
	private String hotelChainName;
	
	private String cityName;
	
	private Set<Udn_Room_Category_Entity> roomCategoryEntityList = new HashSet<Udn_Room_Category_Entity>();

	public Set<Udn_Room_Category_Entity> getRoomCategoryEntityList() {
		return roomCategoryEntityList;
	}

	public void setRoomCategoryEntityList(Set<Udn_Room_Category_Entity> roomCategoryEntityList) {
		this.roomCategoryEntityList = roomCategoryEntityList;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getDefaultRoomCategory() {
		return defaultRoomCategory;
	}

	public void setDefaultRoomCategory(String defaultRoomCategory) {
		this.defaultRoomCategory = defaultRoomCategory;
	}

	private boolean active=true;

	public int getHotelId() {
		return hotelId;
	}

	public void setHotelId(String hotelId) {
		if(hotelId!=null && hotelId.trim().length()>0) {
			this.hotelId = Integer.parseInt(hotelId);
		}
		else {
			this.hotelId = 0;
		}
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

	public void setHotelChainId(String hotelChainId) {
		if(hotelChainId!=null && hotelChainId.trim().length()>0) {
			this.hotelChainId = Integer.parseInt(hotelChainId);
		}
		else {
			this.hotelChainId = 0;
		}
	}

	public String getHotelChainName() {
		return hotelChainName;
	}

	public void setHotelChainName(String hotelChainName) {
		this.hotelChainName = hotelChainName;
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
	
	public Udn_Hotel_Master_Obj() {
		this.hotelId=0;
	}

	
	public Udn_Hotel_Master_Obj(Udn_Hotel_Master_Entity hotelEntity) {
		this.hotelId = hotelEntity.getHotelId();
		this.cityId=hotelEntity.getCityId();
		this.hotelChainId=hotelEntity.getHotelChainId();
		this.starCategory=hotelEntity.getStarCategory();
		this.udnServiceRating=hotelEntity.getUdnServiceRating();
		this.active=hotelEntity.isActive();
		this.preferred=hotelEntity.isPreferred();
		this.address=hotelEntity.getAddress();
		this.email=hotelEntity.getEmail();
		this.hotelName=hotelEntity.getHotelName();
		this.locality=hotelEntity.getLocality();
		this.remarks=hotelEntity.getRemarks();
		this.phone=hotelEntity.getPhone();
		this.roomCategoryEntityList = hotelEntity.getRoomCategoryEntityList();
		
	}

	public String toString() {
		String attrib = " hotelId -> " + hotelId + "\n";
		attrib = attrib + "  hotelName -> " +hotelName + "\n";
		attrib = attrib + " hotelChainId  -> " +hotelChainId + "\n";
		attrib = attrib + " cityId  -> " + cityId+ "\n";
		attrib = attrib + " address  -> " +address + "\n";
		attrib = attrib + "  locality -> " + locality+ "\n";
		attrib = attrib + " email  -> " +email + "\n";
		attrib = attrib + " phone  -> " + phone+ "\n";
		attrib = attrib + " starCategory  -> " + starCategory+ "\n";
		attrib = attrib + "  udnServiceRating -> " +udnServiceRating + "\n";
		attrib = attrib + " preferred  -> " + preferred+ "\n";
		attrib = attrib + "  remarks -> " + remarks+ "\n";
		attrib = attrib + "  defaultRoomCategory -> " +defaultRoomCategory + "\n";
		attrib = attrib + "  active -> " + active + "\n";
		
		return attrib;
	}
}