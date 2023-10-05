package com.udanchoo.intranet.model;

public class FilterTaskObj {
	private int taskOwner = 0;
	private long taskId;
	private String dateFrom;
	private String dateTo;
	private String sortBy;
	private String taskStatus;
	private long dealConfirmationId;
	private String taskPriority;
	private boolean overDueTasks;
	private boolean myCreatedTaskOnly;
	private boolean myAssignedTaskOnly;
	private boolean completedTaskOnly;
	
	public String getDateFrom() {
		return dateFrom;
	}
	public void setDateFrom(String dateFrom) {
		this.dateFrom = dateFrom;
	}
	public String getDateTo() {
		return dateTo;
	}
	public void setDateTo(String dateTo) {
		this.dateTo = dateTo;
	}
	
	public String getSortBy() {
		return sortBy;
	}
	public void setSortBy(String sortBy) {
		this.sortBy = sortBy;
	}
	
	
	
	public int getTaskOwner() {
		return taskOwner;
	}
	public void setTaskOwner(int taskOwner) {
		this.taskOwner = taskOwner;
	}
	public String getTaskStatus() {
		return taskStatus;
	}
	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
	}
	public String toString() {
		String attrib = "Displaying Filter Task Criteria Requested \n";
		attrib = attrib  + "taskOwner -> " + taskOwner + "\n";
		attrib = attrib  + "dateFrom -> " +dateFrom + "\n";
		attrib = attrib  + " dateTo ->" + dateTo+ "\n";
		attrib = attrib  + " sortBy ->" + sortBy+ "\n";
		attrib = attrib  + " taskStatus ->" + taskStatus+ "\n";
		attrib = attrib  + " taskPriority ->" + taskPriority+ "\n";
		attrib = attrib  + " dealConfirmationId ->" + dealConfirmationId+ "\n";
		attrib = attrib  + " overDueTasks ->" + overDueTasks + "\n";
		
		
		return attrib ;
	}
	public long getDealConfirmationId() {
		return dealConfirmationId;
	}
	public void setDealConfirmationId(long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}
	public String getTaskPriority() {
		return taskPriority;
	}
	public void setTaskPriority(String taskPriority) {
		this.taskPriority = taskPriority;
	}
	public boolean isOverDueTasks() {
		return overDueTasks;
	}
	public void setOverDueTasks(boolean overDueTasks) {
		this.overDueTasks = overDueTasks;
	}
	public boolean isMyCreatedTaskOnly() {
		return myCreatedTaskOnly;
	}
	public void setMyCreatedTaskOnly(boolean myCreatedTaskOnly) {
		this.myCreatedTaskOnly = myCreatedTaskOnly;
	}
	public boolean isMyAssignedTaskOnly() {
		return myAssignedTaskOnly;
	}
	public void setMyAssignedTaskOnly(boolean myAssignedTaskOnly) {
		this.myAssignedTaskOnly = myAssignedTaskOnly;
	}
	public boolean isCompletedTaskOnly() {
		return completedTaskOnly;
	}
	public void setCompletedTaskOnly(boolean completedTaskOnly) {
		this.completedTaskOnly = completedTaskOnly;
	}
	public long getTaskId() {
		return taskId;
	}
	public void setTaskId(long taskId) {
		this.taskId = taskId;
	}
	
	
	
	
}
