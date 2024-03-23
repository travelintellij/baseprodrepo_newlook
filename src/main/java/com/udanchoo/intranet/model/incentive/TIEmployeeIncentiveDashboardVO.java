package com.udanchoo.intranet.model.incentive;

public class TIEmployeeIncentiveDashboardVO {
	public int userId;
	public String financialYear;
	int minTarget;
	int approvedTarget;
	int pendingApprovalTarget;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getFinancialYear() {
		return financialYear;
	}
	public void setFinancialYear(String financialYear) {
		this.financialYear = financialYear;
	}
	public int getMinTarget() {
		return minTarget;
	}
	public void setMinTarget(int minTarget) {
		this.minTarget = minTarget;
	}
	public int getApprovedTarget() {
		return approvedTarget;
	}
	public void setApprovedTarget(int approvedTarget) {
		this.approvedTarget = approvedTarget;
	}
	public int getPendingApprovalTarget() {
		return pendingApprovalTarget;
	}
	public void setPendingApprovalTarget(int pendingApprovalTarget) {
		this.pendingApprovalTarget = pendingApprovalTarget;
	}

	

}
