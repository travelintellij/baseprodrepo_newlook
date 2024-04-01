package com.udanchoo.intranet.model.incentive;

import com.udanchoo.intranet.entity.EmployeeTargetMappingEntity;

public class TIEmployeeIncentiveDashboardVO extends  EmployeeTargetMappingEntity{

	/*public String selectedFinancialYear;
	public String currentFinancialYear;
	*/
	//public int targetAmount;
	public int approvedTarget;
	public int pendingApprovalTarget;

	public String userName; 
	
	public int status;


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
	

	

	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void updateTargetDashboardVOFromEntity(EmployeeTargetMappingEntity targetMapping) {
		this.id=targetMapping.getId();
		this.incentiveAmount=targetMapping.getIncentiveAmount();
		this.userId=targetMapping.getUserId();
		this.targetAmount=targetMapping.getTargetAmount();
		this.financialYear=targetMapping.getFinancialYear();
		//this.userId = targetMapping.getUserId();
		//this.selectedFinancialYear = targetMapping.getFinancialYear();
		//this.currentFinancialYear = targetMapping.getFinancialYear();
		//this.targetAmount = targetMapping.getTargetAmount();
		//this.incentiveAmount = targetMapping.getIncentiveAmount();
	}

}
