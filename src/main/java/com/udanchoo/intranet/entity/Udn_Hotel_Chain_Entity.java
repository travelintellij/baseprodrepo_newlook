package com.udanchoo.intranet.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.udanchoo.intranet.model.Udn_Hotel_Chain_Obj;

@Entity
@Table(name = "udn_hotel_chain_master")
public class Udn_Hotel_Chain_Entity extends AuditModel {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int hotelChainId;

	@Column(nullable = false,name="hotelChainName", unique = true)
	private String hotelChainName;

	
	@Column(nullable = true,name="remarks", unique = false)
	private String remarks;
	
	@Column(nullable = false,name="active", unique = false)
	private boolean active;

	public Udn_Hotel_Chain_Entity() {}
	
	public Udn_Hotel_Chain_Entity(Udn_Hotel_Chain_Obj hotelChainObj) {
		this.hotelChainId = hotelChainObj.getHotelChainId();
		this.hotelChainName= hotelChainObj.getHotelChainName();
		this.remarks = hotelChainObj.getRemarks();
		this.active = hotelChainObj.isActive();
	}

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
	

}