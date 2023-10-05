package com.udanchoo.intranet.entity.leads;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.udanchoo.intranet.entity.AuditModel;
import com.udanchoo.intranet.entity.Udn_Deal_LDP_SL_Entity;
import com.udanchoo.intranet.model.Udn_Room_Category_Obj;
import com.udanchoo.intranet.model.leads.TI_Leads_Followup_VO;

@Entity
@Table(name = "ti_leads_followup")
public class TI_Leads_Followup_Entity extends AuditModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	protected long leadFollowupId;

	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="leadId", nullable=false)
	@JsonManagedReference
	protected Tg_Leads_Recorder_Entity leadEntity;
	
	protected LocalDateTime followuptime;
	protected String response;
	protected LocalDateTime nextfollowuptime;
	protected String nextactionplan;
	protected int updatedBy;
	
	public TI_Leads_Followup_Entity() {
		
	}

	public TI_Leads_Followup_Entity(TI_Leads_Followup_VO leadFollowupVo) {
		this.leadFollowupId=leadFollowupVo.getLeadFollowupId();
		this.followuptime=leadFollowupVo.getFollowuptime();
		this.response=leadFollowupVo.getResponse();
		this.nextfollowuptime=leadFollowupVo.getNextfollowuptime();
		this.nextactionplan=leadFollowupVo.getNextactionplan();
		this.updatedBy= leadFollowupVo.getUpdatedBy();
	}
	
	public long getLeadFollowupId() {
		return leadFollowupId;
	}
	public void setLeadFollowupId(long leadFollowupId) {
		this.leadFollowupId = leadFollowupId;
	}
	public Tg_Leads_Recorder_Entity getLeadEntity() {
		return leadEntity;
	}
	public void setLeadEntity(Tg_Leads_Recorder_Entity leadEntity) {
		this.leadEntity = leadEntity;
	}
	public LocalDateTime getFollowuptime() {
		return followuptime;
	}
	
	/*
	public void setFollowuptime(LocalDateTime followuptime) {
		this.followuptime = followuptime;
	}
	*/
	
	public String getResponse() {
		return response;
	}
	public void setResponse(String response) {
		this.response = response;
	}
	
	
	public LocalDateTime getNextfollowuptime() {
		return nextfollowuptime;
	}
	
	/*
	public void setNextfollowuptime(LocalDateTime nextfollowuptime) {
		this.nextfollowuptime = nextfollowuptime;
	}
	*/
	public String getNextactionplan() {
		return nextactionplan;
	}
	public void setNextactionplan(String nextactionplan) {
		this.nextactionplan = nextactionplan;
	}
	
	
	
	

	@Override
	public String toString() {
		return "TI_Leads_Followup_Entity [leadFollowupId=" + leadFollowupId + ", leadEntity=" + leadEntity
				+ ", followuptime=" + followuptime + ", response=" + response + ", nextfollowuptime=" + nextfollowuptime
				+ ", nextactionplan=" + nextactionplan + ", updatedBy=" + updatedBy + "]";
	}

	public int getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(int updatedBy) {
		this.updatedBy = updatedBy;
	}
	
	
	
}