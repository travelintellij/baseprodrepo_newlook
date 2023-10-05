package com.udanchoo.intranet.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.udanchoo.intranet.model.FlightServiceLineVO;
import com.udanchoo.intranet.model.Udn_Deal_Expense_Recorder_Obj;

@Entity
@Table(name = "udn_deal_expense_recorder")
public class Udn_Deal_Expense_Recorder_Entity extends AuditModel {
   
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false,name="expenseId", unique = true)
	private Long expenseId;
	
	private String expenseName;
	private long dealConfirmationId;
	private Date expenseDate;
	private float expenseAmount;
	
	public Udn_Deal_Expense_Recorder_Entity() {
		
	}
	
	public Udn_Deal_Expense_Recorder_Entity(Udn_Deal_Expense_Recorder_Obj expenseObj) {
		this.expenseId = expenseObj.getExpenseId();
		this.expenseName = expenseObj.getExpenseName();
		this.expenseDate = expenseObj.getExpenseDate();
		this.expenseAmount = expenseObj.getExpenseAmount();
		this.dealConfirmationId =expenseObj.getDealConfirmationId();
	}
	public Long getExpenseId() {
		return expenseId;
	}
	public void setExpenseId(Long expenseId) {
		this.expenseId = expenseId;
	}

	public long getDealConfirmationId() {
		return dealConfirmationId;
	}

	public void setDealConfirmationId(long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}

	public Date getExpenseDate() {
		return expenseDate;
	}

	public void setExpenseDate(Date expenseDate) {
		this.expenseDate = expenseDate;
	}

	

	public float getExpenseAmount() {
		return expenseAmount;
	}


	public void setExpenseAmount(float expenseAmount) {
		this.expenseAmount = expenseAmount;
	}


	public String getExpenseName() {
		return expenseName;
	}

	public void setExpenseName(String expenseName) {
		this.expenseName = expenseName;
	}

	
}