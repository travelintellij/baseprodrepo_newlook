package com.udanchoo.intranet.model.incentive;

import com.udanchoo.intranet.entity.EmployeeTargetMappingEntity;

public class TIEmployeeIncentiveDashboardVO {
	public int userId;
	public String selectedFinancialYear;
	public String currentFinancialYear;
	public int targetAmount;
	public int approvedTarget;
	public int pendingApprovalTarget;
	public int incentiveAmount;
	public String userName;
	
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
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
	public int getIncentiveAmount() {
		return incentiveAmount;
	}
	public void setIncentiveAmount(int incentiveAmount) {
		this.incentiveAmount = incentiveAmount;
	}
	public String getSelectedFinancialYear() {
		return selectedFinancialYear;
	}
	public void setSelectedFinancialYear(String selectedFinancialYear) {
		this.selectedFinancialYear = selectedFinancialYear;
	}
	public String getCurrentFinancialYear() {
		return currentFinancialYear;
	}
	public void setCurrentFinancialYear(String currentFinancialYear) {
		this.currentFinancialYear = currentFinancialYear;
	}
	public int getTargetAmount() {
		return targetAmount;
	}
	public void setTargetAmount(int targetAmount) {
		this.targetAmount = targetAmount;
	}
	@Override
	public String toString() {
		return "TIEmployeeIncentiveDashboardVO [userId=" + userId + ", selectedFinancialYear=" + selectedFinancialYear
				+ ", currentFinancialYear=" + currentFinancialYear + ", targetAmount=" + targetAmount
				+ ", approvedTarget=" + approvedTarget + ", pendingApprovalTarget=" + pendingApprovalTarget
				+ ", incentiveAmount=" + incentiveAmount + "]";
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void updateTargetDashboardVOFromEntity(EmployeeTargetMappingEntity targetMapping) {
		this.userId = targetMapping.getUserId();
		this.selectedFinancialYear = targetMapping.getFinancialYear();
		this.currentFinancialYear = targetMapping.getFinancialYear();
		this.targetAmount = targetMapping.getTargetAmount();
		this.incentiveAmount = targetMapping.getIncentiveAmount();
	}

}
