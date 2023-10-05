package com.udanchoo.intranet.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import com.udanchoo.intranet.entity.Udn_Task_Recorder_Entity;


public class Udn_Task_Recorder_Obj {
	
	private Long taskId;
	private String taskTitle;
	private String  taskPriority;
	private Long dealConfirmationId;
	private int taskOwner;
	private int taskCreator;
	private LocalDateTime taskDueDate;
	private String taskDescription;
	private String taskStatus;
	private Date createdAt;
	private Date updatedAt;
	private boolean notifyTaskOwner;
	private String taskComment;
	
	private int page;
	
	private String dealName;
	
	//Additional fields not part of entity. 
	private String taskOwnerName;
	private String taskCreatorName;
	
	private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
	
	public Udn_Task_Recorder_Obj() {
		
	}
	public Udn_Task_Recorder_Obj(Udn_Task_Recorder_Entity taskEntity) {
		this.taskId=taskEntity.getTaskId();
		this.taskTitle=taskEntity.getTaskTitle();
		this.taskPriority=taskEntity.getTaskPriority();
		this.dealConfirmationId=taskEntity.getDealConfirmationId();
		this.taskOwner=taskEntity.getTaskOwner();
		this.taskCreator=taskEntity.getTaskCreator();
		this.taskDueDate=taskEntity.getTaskDueDate();
		this.taskDescription=taskEntity.getTaskDescription();
		this.taskStatus=taskEntity.getTaskStatus();
		this.createdAt=taskEntity.getCreatedAt();
		this.updatedAt=taskEntity.getUpdatedAt();
			
	}
	
	public void updateVoFrmEntity(Udn_Task_Recorder_Entity taskEntity) {
		this.taskId=taskEntity.getTaskId();
		this.taskTitle=taskEntity.getTaskTitle();
		this.taskPriority=taskEntity.getTaskPriority();
		this.dealConfirmationId=taskEntity.getDealConfirmationId();
		this.taskOwner=taskEntity.getTaskOwner();
		this.taskCreator=taskEntity.getTaskCreator();
		this.taskDueDate=taskEntity.getTaskDueDate();
		this.taskDescription=taskEntity.getTaskDescription();
		this.taskStatus=taskEntity.getTaskStatus();
		this.createdAt=taskEntity.getCreatedAt();
		this.updatedAt=taskEntity.getUpdatedAt();
			
	}
	
	public Long getTaskId() {
		return taskId;
	}
	public void setTaskId(Long taskId) {
		this.taskId = taskId;
	}
	public String getTaskTitle() {
		return taskTitle;
	}
	public void setTaskTitle(String taskTitle) {
		this.taskTitle = taskTitle;
	}
	public String getTaskPriority() {
		return taskPriority;
	}
	public void setTaskPriority(String taskPriority) {
		this.taskPriority = taskPriority;
	}
	public Long getDealConfirmationId() {
		return dealConfirmationId;
	}
	public void setDealConfirmationId(Long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}
	public int getTaskOwner() {
		return taskOwner;
	}
	public void setTaskOwner(int taskOwner) {
		this.taskOwner = taskOwner;
	}
	public int getTaskCreator() {
		return taskCreator;
	}
	public void setTaskCreator(int taskCreator) {
		this.taskCreator = taskCreator;
	}
	public LocalDateTime getTaskDueDate() {
		return taskDueDate;
	}
	public void setTaskDueDate(String dueDate) {
		System.out.println("Received Due Date as " +dueDate); 
		this.taskDueDate = LocalDateTime.parse(dueDate,formatter);
		//SUSH this.taskDueDate = LocalDateTime.parse(dueDate);
		System.out.println("Due Date after Parsing and Set as  " + taskDueDate );
	}
	public String getTaskDescription() {
		return taskDescription;
	}
	public void setTaskDescription(String taskDescrption) {
		this.taskDescription = taskDescrption;
	}
	public String getTaskStatus() {
		return taskStatus;
	}
	public void setTaskStatus(String taskStatus) {
		this.taskStatus = taskStatus;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	
	public String toString() {
		String attrib = " Displaying Task Obj : " +"\n";
		attrib = attrib + " taskId-> " + taskId+ "\n";
		attrib = attrib + "taskTitle -> " + taskTitle+ "\n";
		attrib = attrib + "taskPriority -> " +taskPriority + "\n";
		attrib = attrib + " dealConfirmationId-> " + dealConfirmationId+ "\n";
		attrib = attrib + " taskOwner-> " + taskOwner+ "\n";
		attrib = attrib + " taskCreator-> " +taskCreator + "\n";
		attrib = attrib + "taskDueDate -> " + taskDueDate+ "\n";
		attrib = attrib + " taskDescrption-> " +taskDescription + "\n";
		attrib = attrib + " taskStatus-> " +taskStatus + "\n";
		attrib = attrib + " createdAt-> " +createdAt + "\n";
		attrib = attrib + " updatedAt-> " +updatedAt + "\n";
		
		return attrib;
	}
	public String getTaskOwnerName() {
		return taskOwnerName;
	}
	public void setTaskOwnerName(String taskOwnerName) {
		this.taskOwnerName = taskOwnerName;
	}
	public String getTaskCreatorName() {
		return taskCreatorName;
	}
	public void setTaskCreatorName(String taskCreatorName) {
		this.taskCreatorName = taskCreatorName;
	}

	public String getDealName() {
		return dealName;
	}

	public void setDealName(String dealName) {
		this.dealName = dealName;
		
	}
	public boolean isNotifyTaskOwner() {
		return notifyTaskOwner;
	}
	public void setNotifyTaskOwner(boolean notifyTaskOwner) {
		this.notifyTaskOwner = notifyTaskOwner;
	}
	public String getTaskComment() {
		return taskComment;
	}
	public void setTaskComment(String taskComment) {
		this.taskComment = taskComment;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}

	
	
}