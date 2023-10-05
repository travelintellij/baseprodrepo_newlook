package com.udanchoo.intranet.entity.leads;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

@Entity
@Table(name = "ti_leads_team_map")
@IdClass(Ti_Leads_User_Map_Id.class)
public class Ti_Leads_Team_Map_Entity implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 6147777197004639944L;

	@Id
	private Long leadId;
  
	@Id
	private int userId;

	public Long getLeadId() {
		return leadId;
	}

	public void setLeadId(Long leadId) {
		this.leadId = leadId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}
  
  
  
}
