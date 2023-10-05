package com.udanchoo.intranet.entity;


import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.Valid;

import org.springframework.data.annotation.CreatedDate;

import com.udanchoo.intranet.model.IncentiveObj;



@Entity
@Table(name = "udnincentive")
public class UdnIncentiveEntity extends AuditModel {
	@Id
	@GeneratedValue
	@Column(nullable = false,name="incentiveId", unique = false)
	protected Long incentiveId;
	
	protected long dealConfirmationId;
	protected int claimantId;
	protected boolean question1;
	protected boolean question2;
	protected boolean question3;
	protected boolean question4;
	protected boolean question5;
	protected boolean question6;
	protected int claimedAmount;
	protected int approvedAmount;
	protected String userRemarks;
	protected String managementRemarks;
	
	protected Date responseDate;
	protected int status;
	
	
	public UdnIncentiveEntity() {
		
	}
	
	public UdnIncentiveEntity(IncentiveObj incentiveObj) {
		super();
		this.incentiveId = incentiveObj.getIncentiveId();
		this.dealConfirmationId = incentiveObj.getDealConfirmationId();
		this.claimantId = incentiveObj.getClaimantId();
		this.question1 = incentiveObj.isQuestion1();
		this.question2 = incentiveObj.isQuestion2();
		this.question3 = incentiveObj.isQuestion3();
		this.question4 = incentiveObj.isQuestion4();
		this.question5 = incentiveObj.isQuestion5();
		this.question6 = incentiveObj.isQuestion6();
		this.claimedAmount = incentiveObj.getClaimedAmount();
		this.approvedAmount = incentiveObj.getApprovedAmount();
		this.userRemarks = incentiveObj.getUserRemarks();
		this.managementRemarks = incentiveObj.getManagementRemarks();
		//this.requestedDate = incentiveObj.getRequestedDate();
		this.responseDate = incentiveObj.getResponseDate();
		this.status = incentiveObj.getStatus();
	}
	public Long getIncentiveId() {
		return incentiveId;
	}
	public void setIncentiveId(Long incentiveId) {
		this.incentiveId = incentiveId;
	}
	public long getDealConfirmationId() {
		return dealConfirmationId;
	}
	public void setDealConfirmationId(long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}
	public int getClaimantId() {
		return claimantId;
	}
	public void setClaimantId(int claimantId) {
		this.claimantId = claimantId;
	}
	public boolean isQuestion1() {
		return question1;
	}
	public void setQuestion1(boolean question1) {
		this.question1 = question1;
	}
	public boolean isQuestion2() {
		return question2;
	}
	public void setQuestion2(boolean question2) {
		this.question2 = question2;
	}
	public boolean isQuestion3() {
		return question3;
	}
	public void setQuestion3(boolean question3) {
		this.question3 = question3;
	}
	public boolean isQuestion4() {
		return question4;
	}
	public void setQuestion4(boolean question4) {
		this.question4 = question4;
	}
	public boolean isQuestion5() {
		return question5;
	}
	public void setQuestion5(boolean question5) {
		this.question5 = question5;
	}
	public boolean isQuestion6() {
		return question6;
	}
	public void setQuestion6(boolean question6) {
		this.question6 = question6;
	}
	
	
	
	
	public int getClaimedAmount() {
		return claimedAmount;
	}
	public void setClaimedAmount(int claimedAmount) {
		this.claimedAmount = claimedAmount;
	}
	public int getApprovedAmount() {
		return approvedAmount;
	}
	public void setApprovedAmount(int approvedAmount) {
		this.approvedAmount = approvedAmount;
	}
	public String getUserRemarks() {
		return userRemarks;
	}
	public void setUserRemarks(String userRemarks) {
		this.userRemarks = userRemarks;
	}
	public String getManagementRemarks() {
		return managementRemarks;
	}
	public void setManagementRemarks(String managementRemarks) {
		this.managementRemarks = managementRemarks;
	}
	
	
	public Date getResponseDate() {
		return responseDate;
	}
	public void setResponseDate(Date responseDate) {
		this.responseDate = responseDate;
	}
	
	
	
	
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "UdnIncentiveEntity [incentiveId=" + incentiveId + ", dealConfirmationId=" + dealConfirmationId
				+ ", claimantId=" + claimantId + ", question1=" + question1 + ", question2=" + question2
				+ ", question3=" + question3 + ", question4=" + question4 + ", question5=" + question5 + ", question6="
				+ question6 + ", claimedAmount=" + claimedAmount + ", approvedAmount=" + approvedAmount
				+ ", userRemarks=" + userRemarks + ", managementRemarks=" + managementRemarks + ", requestedDate="
				+ getCreatedAt() + ", responseDate=" + responseDate + ", status=" + status + "]";
	}
	
	
	
	
	
	
	
	

	
	

}