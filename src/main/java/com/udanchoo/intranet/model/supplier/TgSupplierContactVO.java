package com.udanchoo.intranet.model.supplier;

import com.udanchoo.intranet.entity.supplier.Tg_Supplier_Contact_Entity;

public class TgSupplierContactVO extends Tg_Supplier_Contact_Entity {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = -1972264995856135548L;
	
	public TgSupplierContactVO() {
		
	}
	
	public TgSupplierContactVO(Tg_Supplier_Contact_Entity supplierContactEntity) {
		this.supplierContactId = supplierContactEntity.getSupplierContactId();
		this.contactName = supplierContactEntity.getContactName();
		this.mobile = supplierContactEntity.getMobile();
		this.phone = supplierContactEntity.getPhone();
		this.email = supplierContactEntity.getEmail();
		this.description = supplierContactEntity.getDescription();
		this.role = supplierContactEntity.getRole();
		this.city = supplierContactEntity.getCity();
		this.deleted = supplierContactEntity.isDeleted();
		this.lastUpdatedBy = supplierContactEntity.getLastUpdatedBy();
	}

	public void updateSupplierContactFromEntity(Tg_Supplier_Contact_Entity supplierContactEntity) {
		this.contactName = supplierContactEntity.getContactName();
		this.mobile = supplierContactEntity.getMobile();
		this.phone = supplierContactEntity.getPhone();
		this.email = supplierContactEntity.getEmail();
		this.description = supplierContactEntity.getDescription();
		this.role = supplierContactEntity.getRole();
		this.city = supplierContactEntity.getCity();
		this.deleted= supplierContactEntity.isDeleted();
		this.lastUpdatedBy = supplierContactEntity.getLastUpdatedBy();
	}


	@Override
	public String toString() {
		return "TgSupplierContactVO [getSupplierEntity()=" + getSupplierEntity() + ", getContactName()="
				+ getContactName() + ", getMobile()=" + getMobile() + ", getEmail()=" + getEmail()
				+ ", getDescription()=" + getDescription() + ", getCity()=" + getCity() + 
				", isActive()=" + isDeleted() + ", getLastUpdatedBy()=" + getLastUpdatedBy()
				+ ", getSupplierContactId()=" + getSupplierContactId() + ", getPhone()=" + getPhone() + ", getRole()="
				+ getRole() + ", toString()=" + super.toString() + ", getCreatedAt()=" + getCreatedAt()
				+ ", getUpdatedAt()=" + getUpdatedAt() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ "]";
	}

	
}
