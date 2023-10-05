package com.udanchoo.intranet.model.vouchers;

import java.sql.Date;

import com.udanchoo.intranet.entity.TI_Hotel_Voucher_Entity;
import com.udanchoo.intranet.model.HotelServiceLineVO;

public class HotelVoucherVO extends HotelServiceLineVO{

	private long htlVoucherId;
	private String advance="100%";
	private String balance="NIL";
	private String confirmedBy;
	private String referenceNumber;
	private int b2bPartnerId;
	private String b2bPartnerName;
	private Date voucherDate;
	private String phoneNumber;



	
	public void updateVOFromEntity(TI_Hotel_Voucher_Entity voucherEntity) {
		this.htlVoucherId=voucherEntity.getHtlVoucherId();
		this.advance=voucherEntity.getAdvance();
		this.balance=voucherEntity.getBalance();
		this.confirmedBy=voucherEntity.getConfirmedBy();
		this.referenceNumber=voucherEntity.getReferenceNumber();
		this.b2bPartnerId=voucherEntity.getB2bPartnerId();
		this.voucherDate=voucherEntity.getVoucherDate();
		this.setCheckInDate(voucherEntity.getCheckInDate());
		this.setCheckOutDate(voucherEntity.getCheckOutDate());
		this.setAdults(voucherEntity.getAdults());
		this.setChildren(voucherEntity.getChildren());
		this.setCityId(voucherEntity.getCityId());
		this.setHotelId(voucherEntity.getHotelId());
		this.setHtlServiceId(voucherEntity.getHtlServiceId());
		this.setMealPlan(voucherEntity.getMealPlan());
		this.setRemarks(voucherEntity.getRemarks());
		this.setRoomCategoryId(voucherEntity.getRoomCategoryId());
		this.setNoofrooms(voucherEntity.getNoofrooms());
		this.setStatus(voucherEntity.getStatus());
		this.setMealPlan(voucherEntity.getMealPlan());
		this.setClientName(voucherEntity.getClientName());
		this.phoneNumber=voucherEntity.getPhoneNumber();

		//this.b2bPartnerName=voucherEntity.getb;
		//this.setCityName(cityName);
		//this.setClientName(clientName);
		//this.setMealPlanName(mealPlanName);
		//this.setRoomCategoryName(roomCategoryName);
		//this.setStatusName(statusName);
		
	}
	
	public long getHtlVoucherId() {
		return htlVoucherId;
	}
	public void setHtlVoucherId(long htlVoucherId) {
		this.htlVoucherId = htlVoucherId;
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
		return "HotelVoucherVO [htlVoucherId=" + htlVoucherId + ", advance=" + advance + ", balance=" + balance
				+ ", confirmedBy=" + confirmedBy + ", referenceNumber=" + referenceNumber + ", b2bPartnerId="
				+ b2bPartnerId + ", b2bPartnerName=" + b2bPartnerName + ", getHotelName()=" + getHotelName()
				+ ", getStatusName()=" + getStatusName() + ", getRoomCategoryName()=" + getRoomCategoryName()
				+ ", getRoomCategoryId()=" + getRoomCategoryId() + ", getCityId()=" + getCityId() + ", getCityName()="
				+ getCityName() + ", getSupplierName()=" + getSupplierName() + ", toString()=" + super.toString()
				+ ", getHtlServiceId()=" + getHtlServiceId() + ", getServiceMapId()=" + getServiceMapId()
				+ ", getCheckInDate()=" + getCheckInDate() + ", getCheckOutDate()=" + getCheckOutDate()
				+ ", getSupplierId()=" + getSupplierId() + ", getHoldingDate()=" + getHoldingDate() + ", getRemarks()="
				+ getRemarks() + ", getStatus()=" + getStatus() + ", getHotelId()=" + getHotelId() + ", getAdults()="
				+ getAdults() + ", getChildren()=" + getChildren() + ", getExtrabed()=" + getExtrabed()
				+ ", getMealPlan()=" + getMealPlan() + ", getDealConfirmationId()=" + getDealConfirmationId()
				+ ", getClientName()=" + getClientName() + ", getCreatedAt()=" + getCreatedAt() + ", getNoofrooms()="
				+ getNoofrooms() + ", getServiceLineCost()=" + getServiceLineCost() + ", getDisplayOrder()="
				+ getDisplayOrder() + ", getMealPlanName()=" + getMealPlanName() + ", getMarkup()=" + getMarkup()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + "]";
	}
	public int getB2bPartnerId() {
		return b2bPartnerId;
	}
	public void setB2bPartnerId(int b2bPartnerId) {
		this.b2bPartnerId = b2bPartnerId;
	}
	public String getB2bPartnerName() {
		return b2bPartnerName;
	}
	public void setB2bPartnerName(String b2bPartnerName) {
		this.b2bPartnerName = b2bPartnerName;
	}
	public Date getVoucherDate() {
		return voucherDate;
	}
	public void setVoucherDate(Date voucherDate) {
		this.voucherDate = voucherDate;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	
	

	
	

}
