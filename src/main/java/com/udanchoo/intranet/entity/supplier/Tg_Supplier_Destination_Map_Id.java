package com.udanchoo.intranet.entity.supplier;

import java.io.Serializable;

public class Tg_Supplier_Destination_Map_Id implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -6781672222774913167L;


	private Long supplierId;
	  
	
	private int destinationId;


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + destinationId;
		result = prime * result + ((supplierId == null) ? 0 : supplierId.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Tg_Supplier_Destination_Map_Id other = (Tg_Supplier_Destination_Map_Id) obj;
		if (destinationId != other.destinationId)
			return false;
		if (supplierId == null) {
			if (other.supplierId != null)
				return false;
		} else if (!supplierId.equals(other.supplierId))
			return false;
		return true;
	}
	
	
}
