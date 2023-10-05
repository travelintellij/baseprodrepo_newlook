package com.udanchoo.intranet.entity;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name = "udnsuppliers")
public class UdnSupplierEntity {
	@Id
	@GeneratedValue
	@Column(nullable = false,name="supplierId", unique = false)
	private Long supplierId;
	private String supplierShortName;
	private String supplierName;
	private String servicecode;
	private String supplierAddress;
	
	private long mobile;
	private long phone;
	private String email;
	private int supplierRating;
	private boolean isPreferred;
	private boolean isConsolidator;
	private String remarks;
	private boolean active;

	
	public UdnSupplierEntity() {
		
	}
	public Long getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Long supplierId) {
		this.supplierId = supplierId;
	}
	
	public String getSupplierShortName() {
		return supplierShortName;
	}
	public void setSupplierShortName(String supplierShortName) {
		this.supplierShortName = supplierShortName;
	}
	
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getServicecode() {
		return servicecode;
	}
	public void setServicecode(String servicecode) {
		this.servicecode = servicecode;
	}
	public String getSupplierAddress() {
		return supplierAddress;
	}
	public void setSupplierAddress(String supplierAddress) {
		this.supplierAddress = supplierAddress;
	}
	public long getMobile() {
		return mobile;
	}
	public void setMobile(long mobile) {
		this.mobile = mobile;
	}
	public long getPhone() {
		return phone;
	}
	public void setPhone(long phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getSupplierRating() {
		return supplierRating;
	}
	public void setSupplierRating(int supplierRating) {
		this.supplierRating = supplierRating;
	}
	public boolean isPreferred() {
		return isPreferred;
	}
	public void setPreferred(boolean isPreferred) {
		this.isPreferred = isPreferred;
	}
	public boolean isConsolidator() {
		return isConsolidator;
	}
	public void setConsolidator(boolean isConsolidator) {
		this.isConsolidator = isConsolidator;
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