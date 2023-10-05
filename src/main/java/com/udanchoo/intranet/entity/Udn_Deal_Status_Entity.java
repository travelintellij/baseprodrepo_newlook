package com.udanchoo.intranet.entity;

import java.sql.Date;
import java.time.LocalDate;

import javax.persistence.*;
import javax.validation.Valid;

import com.udanchoo.intranet.model.UdnDealStatusVO;
import com.udanchoo.intranet.model.UserDetailsObj;



@Entity
@Table(name = "udn_deal_status")
public class Udn_Deal_Status_Entity{
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	 @Column(columnDefinition = "DEFAULT 0")
	private int id;

	private int workloadStatusId;
	private String workloadStatusObj;
	private String workloadStatusObjType;
	private String workloadStatusShortName;
	private String workloadStatusName;
	private String workloadStatusActionPending;
	private boolean active;
	
	
	public Udn_Deal_Status_Entity() {
		
	}
	
	public Udn_Deal_Status_Entity(UdnDealStatusVO statusVO) {
		//workloadStatusId = statusVO.getWorkloadStatusId();
		workloadStatusObj=statusVO.getWorkloadStatusObj();
		workloadStatusObjType=statusVO.getWorkloadStatusObjType();
		workloadStatusShortName=statusVO.getWorkloadStatusShortName();
		workloadStatusName=statusVO.getWorkloadStatusName();
		workloadStatusActionPending=statusVO.getWorkloadStatusActionPending();
		active=statusVO.isActive();
			
	}
	
	@PrePersist
    public void prePersist() {
        this.workloadStatusId = this.id;
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


	public String getWorkloadStatusShortName() {
		return workloadStatusShortName;
	}

	public void setWorkloadStatusShortName(String workloadStatusShortName) {
		this.workloadStatusShortName = workloadStatusShortName;
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


	
	
	
	public String getWorkloadStatusObjType() {
		return workloadStatusObjType;
	}

	public void setWorkloadStatusObjType(String workloadStatusObjType) {
		this.workloadStatusObjType = workloadStatusObjType;
	}

	public String toString() {
		String attrib = " Id -> " + id + "\n";
		attrib = attrib + " workloadStatusId -> " + workloadStatusId + "\n";
		attrib = attrib + " workloadStatusObj -> " + workloadStatusObj + "\n";
		attrib = attrib + " workloadStatusObjType -> " + workloadStatusObjType + "\n";
		attrib = attrib + " workloadStatusName -> " + workloadStatusName + "\n";
		attrib = attrib + " workloadStatusActionPending -> " + workloadStatusActionPending + "\n";
		return attrib;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}
	
	

}