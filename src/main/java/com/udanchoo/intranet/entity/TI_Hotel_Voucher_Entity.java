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
import com.udanchoo.intranet.model.vouchers.HotelVoucherVO;

@Entity
@Table(name = "ti_hotel_vouchers")
public class TI_Hotel_Voucher_Entity extends AuditModel {
   	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false,name="htlVoucherId", unique = true)
	private Long htlVoucherId;
	
	private long htlServiceId;
	private int hotelId;
	private int roomCategoryId;
	private int cityId;
	private Date checkInDate;
	private Date checkOutDate;
	private Date voucherDate;
	private int adults;
	private int children;
	private int mealPlan;
	private int noofrooms;
	private String remarks;
	private int status;
	private String advance;
	private String balance;
	private String confirmedBy;
	private String referenceNumber;
	private int b2bPartnerId;
	private String clientName;
	private String phoneNumber;

	
	public TI_Hotel_Voucher_Entity() {}

	public TI_Hotel_Voucher_Entity(HotelVoucherVO hotelVoucherVO) {
		//this.htlVoucherId=hotelVoucherVO.getHtlVoucherId();
		this.htlServiceId=hotelVoucherVO.getHtlServiceId();
		this.hotelId=hotelVoucherVO.getHotelId();
		this.roomCategoryId=hotelVoucherVO.getRoomCategoryId();
		this.cityId=hotelVoucherVO.getCityId();
		this.checkInDate=hotelVoucherVO.getCheckInDate();
		this.checkOutDate=hotelVoucherVO.getCheckOutDate();
		this.voucherDate=hotelVoucherVO.getVoucherDate();
		this.adults=hotelVoucherVO.getAdults();
		this.children=hotelVoucherVO.getChildren();
		//this.extrabed=hotelVoucherVO;
		this.mealPlan=hotelVoucherVO.getMealPlan();
		this.noofrooms=hotelVoucherVO.getNoofrooms();
		this.remarks=hotelVoucherVO.getRemarks();
		this.status=hotelVoucherVO.getStatus();
		this.advance=hotelVoucherVO.getAdvance();
		this.balance=hotelVoucherVO.getBalance();
		this.confirmedBy=hotelVoucherVO.getConfirmedBy();
		this.referenceNumber=hotelVoucherVO.getReferenceNumber();
		this.b2bPartnerId=hotelVoucherVO.getB2bPartnerId();
		this.clientName=hotelVoucherVO.getClientName();
		this.phoneNumber=hotelVoucherVO.getPhoneNumber();
	}

	public Long getHtlVoucherId() {
		return htlVoucherId;
	}


	public void setHtlVoucherId(Long htlVoucherId) {
		this.htlVoucherId = htlVoucherId;
	}


	public long getHtlServiceId() {
		return htlServiceId;
	}


	public void setHtlServiceId(long htlServiceId) {
		this.htlServiceId = htlServiceId;
	}


	public int getHotelId() {
		return hotelId;
	}


	public void setHotelId(int hotelId) {
		this.hotelId = hotelId;
	}


	public int getRoomCategoryId() {
		return roomCategoryId;
	}


	public void setRoomCategoryId(int roomCategoryId) {
		this.roomCategoryId = roomCategoryId;
	}


	public int getCityId() {
		return cityId;
	}


	public void setCityId(int cityId) {
		this.cityId = cityId;
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



	public int getMealPlan() {
		return mealPlan;
	}


	public void setMealPlan(int mealPlan) {
		this.mealPlan = mealPlan;
	}


	public int getNoofrooms() {
		return noofrooms;
	}


	public void setNoofrooms(int noofrooms) {
		this.noofrooms = noofrooms;
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


	


	public String getAdvance() {
		return advance;
	}


	public void setAdvance(String advance) {
		this.advance = advance;
	}


	public String getBalance() {
		return balance;
	}


	public void setBalance(String balance) {
		this.balance = balance;
	}


	public String getConfirmedBy() {
		return confirmedBy;
	}


	public void setConfirmedBy(String confirmedBy) {
		this.confirmedBy = confirmedBy;
	}


	public String getReferenceNumber() {
		return referenceNumber;
	}


	public void setReferenceNumber(String referenceNumber) {
		this.referenceNumber = referenceNumber;
	}


	@Override
	public String toString() {
		return "TI_Hotel_Voucher_Entity [htlVoucherId=" + htlVoucherId + ", htlServiceId=" + htlServiceId + ", hotelId="
				+ hotelId + ", roomCategoryId=" + roomCategoryId + ", cityId=" + cityId + ", checkInDate=" + checkInDate
				+ ", checkOutDate=" + checkOutDate + ", adults=" + adults + ", children=" + children + ", "
						+ " status=" + status + ", advance=" + advance + ", balance=" + balance + ", confirmedBy="
				+ confirmedBy + ", referenceNumber=" + referenceNumber + "]";
	}


	public int getB2bPartnerId() {
		return b2bPartnerId;
	}


	public void setB2bPartnerId(int b2bPartnerId) {
		this.b2bPartnerId = b2bPartnerId;
	}

	public Date getVoucherDate() {
		return voucherDate;
	}

	public void setVoucherDate(Date voucherDate) {
		this.voucherDate = voucherDate;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	




	
}