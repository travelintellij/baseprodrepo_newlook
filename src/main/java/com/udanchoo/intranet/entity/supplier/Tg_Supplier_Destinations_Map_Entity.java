package com.udanchoo.intranet.entity.supplier;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@Table(name = "supplier_destinations_map")
@IdClass(Tg_Supplier_Destination_Map_Id.class)
public class Tg_Supplier_Destinations_Map_Entity implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6147777197004639944L;

	@Id
	private Long supplierId;
  
	@Id
	private int destinationId;
  
  	public Long getSupplierId() {
		return supplierId;
	}
	
  	public void setSupplierId(Long supplierId) {
		this.supplierId = supplierId;
	}
	
  	public int getDestinationId() {
		return destinationId;
	}
	
  	public void setDestinationId(int destinationId) {
		this.destinationId = destinationId;
	}
  
  
}
