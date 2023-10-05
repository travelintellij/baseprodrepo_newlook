package com.udanchoo.intranet.model;

import java.sql.Date;

import com.udanchoo.intranet.entity.Udn_Deal_Expense_Recorder_Entity;


public class Udn_Deal_Expense_Recorder_Obj   {
 
	private Long expenseId;
	private String expenseName;
	private long dealConfirmationId;
	private Date expenseDate;
	private float expenseAmount;
	
	
	public Udn_Deal_Expense_Recorder_Obj(Udn_Deal_Expense_Recorder_Entity expenseEntity) {
		this.expenseId = expenseEntity.getExpenseId();
		this.expenseName = expenseEntity.getExpenseName();
		this.expenseDate = expenseEntity.getExpenseDate();
		this.expenseAmount = expenseEntity.getExpenseAmount();
		this.dealConfirmationId =expenseEntity.getDealConfirmationId();
	}
	
	public Udn_Deal_Expense_Recorder_Obj() {
		
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

	public String getExpenseName() {
		return expenseName;
	}

	public void setExpenseName(String expenseName) {
		this.expenseName = expenseName;
	}

	public float getExpenseAmount() {
		return expenseAmount;
	}

	public void setExpenseAmount(float expenseAmount) {
		this.expenseAmount = expenseAmount;
	}

	
}