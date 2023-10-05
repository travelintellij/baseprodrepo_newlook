package com.udanchoo.intranet.entity.deals;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@Table(name = "ti_deals_team_map")
@IdClass(Ti_Deals_User_Map_Id.class)
public class Ti_Deals_Team_Map_Entity implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6147777197004639944L;

	@Id
	private Long dealConfirmationId;
  
	@Id
	private int userId;

	

	public Long getDealConfirmationId() {
		return dealConfirmationId;
	}

	public void setDealConfirmationId(Long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
  
  
  
}
