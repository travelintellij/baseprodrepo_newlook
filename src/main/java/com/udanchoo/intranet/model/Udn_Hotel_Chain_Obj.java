package com.udanchoo.intranet.model;

import com.udanchoo.intranet.entity.Udn_Hotel_Chain_Entity;

public class Udn_Hotel_Chain_Obj  {
	
	private int hotelChainId=0;


	private String hotelChainName;

	

	private String remarks;

	private boolean active=true;

	public int getHotelChainId() {
		return hotelChainId;
	}

	public void setHotelChainId(int hotelChainId) {
		this.hotelChainId = hotelChainId;
	}

	public String getHotelChainName() {
		return hotelChainName;
	}

	public void setHotelChainName(String hotelChainName) {
		this.hotelChainName = hotelChainName;
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
		String attrib = "hotelChainId -> " + hotelChainId +"\n";
		attrib = attrib + "hotelChainName -> " + hotelChainName + "\n";
		attrib = attrib + "remarks -> " + remarks + "\n";
		attrib = attrib + "active -> " + active + "\n";
		return attrib;
	}
	
	public Udn_Hotel_Chain_Obj() {
		
	}
	public Udn_Hotel_Chain_Obj(Udn_Hotel_Chain_Entity hotelChainEntity) {
		this.hotelChainId = hotelChainEntity.getHotelChainId();
		this.hotelChainName = hotelChainEntity.getHotelChainName();
		this.remarks = hotelChainEntity.getRemarks();
		this.active = hotelChainEntity.isActive();
	}
	
}