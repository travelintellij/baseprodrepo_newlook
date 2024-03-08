package com.udanchoo.intranet.model;

public class SearchIncentiveObj {
	private long incentiveId;
	private String claimFromDate;
	private String claimToDate;
	private int claimStatus;
	private long claimantId;
	private String userName;
	private long reportOfUser;
	private int dealConfirmationId;
	private String dealName;
	private boolean blnSearchOnClaimDate;
	private int incentiveSearchPeriodType;
	
	public String getClaimFromDate() {
		return claimFromDate;
	}
	public void setClaimFromDate(String date) {
		this.claimFromDate = date;
	}
	public String getClaimToDate() {
		return claimToDate;
	}
	public void setClaimToDate(String claimToDate) {
		this.claimToDate = claimToDate;
	}
	
	
	
	
	
	public int getClaimStatus() {
		return claimStatus;
	}
	public void setClaimStatus(int claimStatus) {
		this.claimStatus = claimStatus;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public long getReportOfUser() {
		return reportOfUser;
	}
	public void setReportOfUser(long reportOfUser) {
		this.reportOfUser = reportOfUser;
	}
	
	
	
	
	public long getIncentiveId() {
		return incentiveId;
	}
	public void setIncentiveId(long incentiveId) {
		this.incentiveId = incentiveId;
	}
	public long getClaimantId() {
		return claimantId;
	}
	public void setClaimantId(long claimantId) {
		this.claimantId = claimantId;
	}
	
	
	
	
	public String getDealName() {
		return dealName;
	}
	public void setDealName(String dealName) {
		this.dealName = dealName;
	}
	public int getDealConfirmationId() {
		return dealConfirmationId;
	}
	public void setDealConfirmationId(int dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}

	public boolean isBlnSearchOnClaimDate() {
		return blnSearchOnClaimDate;
	}
	public void setBlnSearchOnClaimDate(boolean blnSearchOnClaimDate) {
		this.blnSearchOnClaimDate = blnSearchOnClaimDate;
	}
	

	public int getIncentiveSearchPeriodType() {
		return incentiveSearchPeriodType;
	}
	public void setIncentiveSearchPeriodType(int incentiveSearchPeriodType) {
		this.incentiveSearchPeriodType = incentiveSearchPeriodType;
	}
	@Override
	public String toString() {
		return "SearchIncentiveObj [incentiveId=" + incentiveId + ", claimFromDate=" + claimFromDate + ", claimToDate="
				+ claimToDate + ", claimStatus=" + claimStatus + ", claimantId=" + claimantId + ", userName=" + userName
				+ ", reportOfUser=" + reportOfUser + ", dealConfirmationId=" + dealConfirmationId + ", dealName="
				+ dealName + ", blnSearchOnClaimDate=" + blnSearchOnClaimDate + ", incentiveSearchPeriodType="
				+ incentiveSearchPeriodType + "]";
	}
	
	
	
	
	
	
	

	

}
