package com.udanchoo.intranet.entity.deals;

import java.io.Serializable;

public class Ti_Deals_User_Map_Id implements Serializable {



	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private Long dealConfirmationId;
	  
	
	private int userId;


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + userId;
		result = prime * result + ((dealConfirmationId == null) ? 0 : dealConfirmationId .hashCode());
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
		Ti_Deals_User_Map_Id other = (Ti_Deals_User_Map_Id) obj;
		if (userId != other.userId)
			return false;
		if (dealConfirmationId== null) {
			if (other.dealConfirmationId != null)
				return false;
		} else if (!dealConfirmationId.equals(other.dealConfirmationId))
			return false;
		return true;
	}
	
	
}
