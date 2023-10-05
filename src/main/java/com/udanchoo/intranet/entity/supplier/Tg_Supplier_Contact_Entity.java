package com.udanchoo.intranet.entity.supplier;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.validation.Valid;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.udanchoo.intranet.entity.AuditModel;
import com.udanchoo.intranet.model.supplier.TgSupplierContactVO;

@Entity
@Table(name = "tg_supplier_contacts")
public class Tg_Supplier_Contact_Entity extends AuditModel {
  
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long supplierContactId;

	@ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinColumn(name="supplierId", nullable=false)
	@JsonManagedReference
    protected Tg_Supplier_Master_Entity supplierEntity;

	
	protected String contactName;
	protected long  mobile;
	protected long  phone;
	protected String email;
	protected String description;
	protected String role;
	protected String city;
	protected boolean deleted=false;
	protected int lastUpdatedBy;

	
	
	public Tg_Supplier_Contact_Entity() {
		
	}
	

	public Tg_Supplier_Contact_Entity(@Valid TgSupplierContactVO supplierContactObj) {
		this.supplierContactId=supplierContactObj.getSupplierContactId();
		this.contactName = supplierContactObj.getContactName();
		this.mobile = supplierContactObj.getMobile();
		this.phone = supplierContactObj.getPhone();
		this.email = supplierContactObj.getEmail();
		this.description = supplierContactObj.getDescription();
		this.role = supplierContactObj.getRole();
		this.city = supplierContactObj.getCity();
		this.deleted = supplierContactObj.isDeleted();
		this.lastUpdatedBy = supplierContactObj.getLastUpdatedBy();
	}
	
	public void updateSupplierEntityFromVO(TgSupplierContactVO supplierContactObj) {
		this.supplierContactId=supplierContactObj.getSupplierContactId();
		this.contactName = supplierContactObj.getContactName();
		this.mobile = supplierContactObj.getMobile();
		this.phone = supplierContactObj.getPhone();
		this.email = supplierContactObj.getEmail();
		this.description = supplierContactObj.getDescription();
		this.role = supplierContactObj.getRole();
		this.city = supplierContactObj.getCity();
		this.deleted = supplierContactObj.isDeleted();
		this.lastUpdatedBy = supplierContactObj.getLastUpdatedBy();
	}

	public Tg_Supplier_Master_Entity getSupplierEntity() {
		return supplierEntity;
	}

	public void setSupplierEntity(Tg_Supplier_Master_Entity supplierEntity) {
		this.supplierEntity = supplierEntity;
	}

	public String getContactName() {
		return contactName;
	}
	
	public void setContactName(String contactName) {
		this.contactName = contactName;
	}
	
	public long getMobile() {
		return mobile;
	}
	
	public void setMobile(long mobile) {
		this.mobile = mobile;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public boolean isDeleted() {
		return deleted;
	}


	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}


	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
	

	public int getLastUpdatedBy() {
		return lastUpdatedBy;
	}
	
	public void setLastUpdatedBy(int lastUpdatedBy) {
		this.lastUpdatedBy = lastUpdatedBy;
	}

	public Long getSupplierContactId() {
		return supplierContactId;
	}

	public void setSupplierContactId(Long supplierContactId) {
		this.supplierContactId = supplierContactId;
	}

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	
	
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@Override
	public String toString() {
		return "Tg_Supplier_Contact_Entity [supplierContactId=" + supplierContactId + ", supplierEntity="
				+ supplierEntity + ", contactName=" + contactName + ", mobile=" + mobile + ", phone=" + phone
				+ ", email=" + email + ", description=" + description + ", role=" + role + ", city=" + city
				+  ", active=" + deleted + ", lastUpdatedBy=" + lastUpdatedBy + "]";
	}

	
		
	
	
}
