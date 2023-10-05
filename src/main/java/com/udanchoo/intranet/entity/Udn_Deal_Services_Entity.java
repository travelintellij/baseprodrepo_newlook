package com.udanchoo.intranet.entity;

import java.util.Comparator;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.udanchoo.intranet.model.AirLineVO;

@Entity
@Table(name = "udn_deal_service_map")
public class Udn_Deal_Services_Entity extends AuditModel {
   
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false,name="serviceMapId", unique = true)
	private Long serviceMapId;
	
	/*@Column(nullable = false,name="dealConfirmationId", unique = true)
	private String dealConfirmationId;
	*/
	
	@Column(nullable = false,name="dealServiceCode", unique = true)
	private String dealServiceCode;
	
	
	@ManyToOne
    @JoinColumn(name="dealConfirmationId", nullable=false)
    private Udn_Deals_Recorder_Entity parentDealRecord;
	
	public Udn_Deals_Recorder_Entity getParentDealRecord() {
		return parentDealRecord;
	}

	public void setParentDealRecord(Udn_Deals_Recorder_Entity parentDealRecord) {
		this.parentDealRecord = parentDealRecord;
	}

	
	/*
	public String getDealConfirmationId() {
		return dealConfirmationId;
	}

	public void setDealConfirmationId(String dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}
	 */
	public Long getServiceMapId() {
		return serviceMapId;
	}

	public void setServiceMapId(Long serviceMapId) {
		this.serviceMapId = serviceMapId;
	}

	@Column(nullable = false,name="status", unique = true)
	private int serviceStatus;

	

	public String getDealServiceCode() {
		return dealServiceCode;
	}

	public void setDealServiceCode(String dealServiceCode) {
		this.dealServiceCode = dealServiceCode;
	}

	public int getServiceStatus() {
		return serviceStatus;
	}

	public void setServiceStatus(int serviceStatus) {
		this.serviceStatus = serviceStatus;
	}

	

		
	
}