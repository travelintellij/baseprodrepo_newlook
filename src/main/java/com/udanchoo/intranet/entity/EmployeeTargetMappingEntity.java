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
    private Long id;

    @Column(name = "userid")
    private int userId;

    @Column(name = "financial_year")
    protected String financialYear;

    @Column(name = "target_amount")
    private double targetAmount;

    @Column(name = "incentive_amount")
    private double incentiveAmount;

    
    public EmployeeTargetMappingEntity() {
    	
    }
    
    // Getters and setters
    
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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

    public double getTargetAmount() {
        return targetAmount;
    }

    public void setTargetAmount(double targetAmount) {
        this.targetAmount = targetAmount;
    }

    public double getIncentiveAmount() {
        return incentiveAmount;
    }

    public void setIncentiveAmount(double incentiveAmount) {
        this.incentiveAmount = incentiveAmount;
    }
    
    public EmployeeTargetMappingEntity(TIEmployeeIncentiveDashboardVO employeeIncVO) {
    	this.userId = employeeIncVO.getUserId();
    	this.financialYear=employeeIncVO.getSelectedFinancialYear();
    	this.targetAmount=employeeIncVO.getTargetAmount();
    	this.incentiveAmount=employeeIncVO.getIncentiveAmount();
    	
    }

	@Override
	public String toString() {
		return "EmployeeTargetMappingEntity [id=" + id + ", userId=" + userId + ", financialYear=" + financialYear
				+ ", targetAmount=" + targetAmount + ", incentiveAmount=" + incentiveAmount + "]";
	}
    
	
    
}
