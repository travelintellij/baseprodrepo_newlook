package com.udanchoo.intranet.model;

import java.sql.Date;
import java.time.LocalDate;

import javax.persistence.*;
import javax.validation.Valid;

import com.udanchoo.intranet.entity.Udn_Deal_Status_Entity;
import com.udanchoo.intranet.model.UserDetailsObj;


public class UdnDealStatusVO{
	private int id;

	private int workloadStatusId;
	private String workloadStatusObj;
	private String workloadStatusShortName;
	private String workloadStatusName;
	private String workloadStatusActionPending;
	private String workloadStatusObjType;
	private boolean active=true;
	
	
	
	public UdnDealStatusVO() {
		
	}
	
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public int getWorkloadStatusId() {
		return workloadStatusId;
	}


	public void setWorkloadStatusId(int workloadStatusId) {
		this.workloadStatusId = workloadStatusId;
	}


	public String getWorkloadStatusObj() {
		return workloadStatusObj;
	}


	public void setWorkloadStatusObj(String workloadStatusObj) {
		this.workloadStatusObj = workloadStatusObj;
	}


	public String getWorkloadStatusName() {
		return workloadStatusName;
	}


	public void setWorkloadStatusName(String workloadStatusName) {
		this.workloadStatusName = workloadStatusName;
	}


	public String getWorkloadStatusActionPending() {
		return workloadStatusActionPending;
	}


	public void setWorkloadStatusActionPending(String workloadStatusActionPending) {
		this.workloadStatusActionPending = workloadStatusActionPending;
	}


	public String getWorkloadStatusShortName() {
		return workloadStatusShortName;
	}


	public void setWorkloadStatusShortName(String workloadStatusShortName) {
		this.workloadStatusShortName = workloadStatusShortName;
	}


	

	
	@Override
	public String toString() {
		return "UdnDealStatusVO [id=" + id + ", workloadStatusId=" + workloadStatusId + ", workloadStatusObj="
				+ workloadStatusObj + ", workloadStatusShortName=" + workloadStatusShortName + ", workloadStatusName="
				+ workloadStatusName + ", workloadStatusActionPending=" + workloadStatusActionPending
				+ ", workloadStatusObjType=" + workloadStatusObjType + ", active=" + active + "]";
	}


	public UdnDealStatusVO(Udn_Deal_Status_Entity statusEntity) {
		this.id=statusEntity.getId();
		this.workloadStatusActionPending=statusEntity.getWorkloadStatusActionPending();
		this.workloadStatusId=statusEntity.getWorkloadStatusId();
		this.workloadStatusName=statusEntity.getWorkloadStatusName();
		this.workloadStatusObj=statusEntity.getWorkloadStatusObj();
		this.workloadStatusShortName =statusEntity.getWorkloadStatusShortName(); 
		this.active=statusEntity.isActive();
				
	}


	public boolean isActive() {
		return active;
	}


	public void setActive(boolean active) {
		this.active = active;
	}


	public String getWorkloadStatusObjType() {
		return workloadStatusObjType;
	}


	public void setWorkloadStatusObjType(String workloadStatusObjType) {
		this.workloadStatusObjType = workloadStatusObjType;
	}
	
	
	
	
}