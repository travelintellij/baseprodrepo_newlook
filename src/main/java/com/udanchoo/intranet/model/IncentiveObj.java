package com.udanchoo.intranet.model;



import java.util.Date;

import com.udanchoo.intranet.constant.incentive.ClaimOption;
import com.udanchoo.intranet.entity.UdnIncentiveEntity;

public class IncentiveObj extends UdnIncentiveEntity {

	private Date travelStartDate;
	private Date travelEndDate;
	private String claimantName;
	private String guestName;
	private String claimStatusName;
	private boolean notifyClaimant;
	private ClaimOption claimOption;
	private String dealName;
	
	public IncentiveObj() {
		
	}

	
	
	public Date getTravelStartDate() {
		return travelStartDate;
	}

	public void setTravelStartDate(Date travelStartDate) {
		this.travelStartDate = travelStartDate;
	}

	public Date getTravelEndDate() {
		return travelEndDate;
	}

	public void setTravelEndDate(Date travelEndDate) {
		this.travelEndDate = travelEndDate;
	}

	public void updateIncentiveVoFromEntity(UdnIncentiveEntity incentiveEntity) {
		
		this.incentiveId = incentiveEntity.getIncentiveId();
		this.dealConfirmationId = incentiveEntity.getDealConfirmationId();
		this.claimantId = incentiveEntity.getClaimantId();
		this.question1 = incentiveEntity.isQuestion1();
		this.question2 = incentiveEntity.isQuestion2();
		this.question3 = incentiveEntity.isQuestion3();
		this.question4 = incentiveEntity.isQuestion4();
		this.question5 = incentiveEntity.isQuestion5();
		this.question6 = incentiveEntity.isQuestion6();
		this.claimedAmount = incentiveEntity.getClaimedAmount();
		this.approvedAmount = incentiveEntity.getApprovedAmount();
		this.userRemarks = incentiveEntity.getUserRemarks();
		this.managementRemarks = incentiveEntity.getManagementRemarks();
		//this.requestedDate = incentiveEntity.getRequestedDate();
		this.responseDate = incentiveEntity.getResponseDate();
		this.status = incentiveEntity.getStatus();
		this.setCreatedAt(incentiveEntity.getCreatedAt());
	}



	public String getClaimantName() {
		return claimantName;
	}



	public void setClaimantName(String claimantName) {
		this.claimantName = claimantName;
	}



	public String getGuestName() {
		return guestName;
	}



	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}

	
	


	public String getClaimStatusName() {
		return claimStatusName;
	}



	public void setClaimStatusName(String claimStatusName) {
		this.claimStatusName = claimStatusName;
	}



	



	public boolean isNotifyClaimant() {
		return notifyClaimant;
	}



	public void setNotifyClaimant(boolean notifyClaimant) {
		this.notifyClaimant = notifyClaimant;
	}



	@Override
	public String toString() {
		return "IncentiveObj [travelStartDate=" + travelStartDate + ", travelEndDate=" + travelEndDate
				+ ", claimantName=" + claimantName + ", getIncentiveId()=" + getIncentiveId()
				+ ", getDealConfirmationId()=" + getDealConfirmationId() + ", getClaimantId()=" + getClaimantId()
				+ ", isQuestion1()=" + isQuestion1() + ", isQuestion2()=" + isQuestion2() + ", isQuestion3()="
				+ isQuestion3() + ", isQuestion4()=" + isQuestion4() + ", isQuestion5()=" + isQuestion5()
				+ ", isQuestion6()=" + isQuestion6() + ", getClaimedAmount()=" + getClaimedAmount()
				+ ", getApprovedAmount()=" + getApprovedAmount() + ", getUserRemarks()=" + getUserRemarks()
				+ ", getManagementRemarks()=" + getManagementRemarks() + ", getResponseDate()=" + getResponseDate()
				+ ", getStatus()=" + getStatus() + ", toString()=" + super.toString() + ", getCreatedAt()="
				+ getCreatedAt() + ", getUpdatedAt()=" + getUpdatedAt() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + "]";
	}



	public ClaimOption getClaimOption() {
		return claimOption;
	}

	public void setClaimOption(ClaimOption claimOption) {
		this.claimOption = claimOption;
	}



	public String getDealName() {
		return dealName;
	}



	public void setDealName(String dealName) {
		this.dealName = dealName;
	}
 	

	
}
