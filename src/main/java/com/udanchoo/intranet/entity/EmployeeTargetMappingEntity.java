package com.udanchoo.intranet.entity;

import javax.persistence.*;

import com.udanchoo.intranet.model.incentive.TIEmployeeIncentiveDashboardVO;

@Entity
@Table(name = "employee_target_mapping")
public class EmployeeTargetMappingEntity extends AuditModel{

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	protected Integer id;

    @Column(name = "userid")
    protected int userId;

    @Column(name = "financial_year")
    protected String financialYear;

    @Column(name = "target_amount")
    protected int targetAmount;

    @Column(name = "incentive_amount")
    protected int incentiveAmount;

    
    public EmployeeTargetMappingEntity() {
    	
    }
    
    // Getters and setters
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

 
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

    public int getTargetAmount() {
        return targetAmount;
    }

    public void setTargetAmount(int targetAmount) {
        this.targetAmount = targetAmount;
    }

    public int getIncentiveAmount() {
        return incentiveAmount;
    }

    public void setIncentiveAmount(int incentiveAmount) {
        this.incentiveAmount = incentiveAmount;
    }
    
    public EmployeeTargetMappingEntity(TIEmployeeIncentiveDashboardVO employeeIncVO) {
    	this.id=employeeIncVO.getId();
    	this.userId = employeeIncVO.getUserId();
    	this.financialYear=employeeIncVO.getFinancialYear();
    	this.targetAmount=employeeIncVO.getTargetAmount();
    	this.incentiveAmount=employeeIncVO.getIncentiveAmount();
    	
    }

	@Override
	public String toString() {
		return "EmployeeTargetMappingEntity [id=" + id + ", userId=" + userId + ", financialYear=" + financialYear
				+ ", targetAmount=" + targetAmount + ", incentiveAmount=" + incentiveAmount + "]";
	}
    
	
    
}
