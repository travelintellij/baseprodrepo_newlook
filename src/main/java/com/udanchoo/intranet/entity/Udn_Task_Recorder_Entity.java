package com.udanchoo.intranet.entity;

import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;

import org.hibernate.annotations.Where;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.udanchoo.intranet.model.Udn_Task_Recorder_Obj;

@Entity
@Table(name = "udn_task_recorder")
public class Udn_Task_Recorder_Entity extends AuditModel {
   
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false,name="taskId", unique = true)
	private Long taskId;
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy = "taskEntity")
    @OrderBy("createdAt DESC")
	@JsonBackReference
    private Set<Udn_Task_Comments_Entity> taskCommentsEntityList = new HashSet<Udn_Task_Comments_Entity>();

	
	
	private String taskTitle;
	private String  taskPriority;
	private long dealConfirmationId;
	private int taskOwner;
	private int taskCreator;
	private LocalDateTime taskDueDate;
	private String taskDescription;
	private String taskStatus;
	
	public Udn_Task_Recorder_Entity() {}
	
	public Udn_Task_Recorder_Entity(Udn_Task_Recorder_Obj taskObj) {
		this.taskId=taskObj.getTaskId();
		this.taskTitle=taskObj.getTaskTitle();
		this.taskPriority=taskObj.getTaskPriority();
		if(taskObj.getDealConfirmationId()!=null) {
			this.dealConfirmationId=taskObj.getDealConfirmationId();
		}
		this.taskOwner=taskObj.getTaskOwner();
		this.taskCreator=taskObj.getTaskCreator();
		this.taskDueDate=taskObj.getTaskDueDate();
		this.taskDescription=taskObj.getTaskDescription();
		this.taskStatus=taskObj.getTaskStatus();
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
	public long getDealConfirmationId() {
		return dealConfirmationId;
	}
	public void setDealConfirmationId(long dealConfirmationId) {
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
	public void setTaskDueDate(LocalDateTime taskDueDate) {
		this.taskDueDate = taskDueDate;
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


	public String toString() {
		String attrib = " Displaying Task Entity : " +"\n";
		attrib = attrib + " taskId-> " + taskId+ "\n";
		attrib = attrib + "taskTitle -> " + taskTitle+ "\n";
		attrib = attrib + "taskPriority -> " +taskPriority + "\n";
		attrib = attrib + " dealConfirmationId-> " + dealConfirmationId+ "\n";
		attrib = attrib + " taskOwner-> " + taskOwner+ "\n";
		attrib = attrib + " taskCreator-> " +taskCreator + "\n";
		attrib = attrib + "taskDueDate -> " + taskDueDate+ "\n";
		attrib = attrib + " taskDescrption-> " +taskDescription + "\n";
		attrib = attrib + " taskStatus-> " +taskStatus + "\n";
		return attrib;
	}

	public Set<Udn_Task_Comments_Entity> getTaskCommentsEntityList() {
		return taskCommentsEntityList;
	}

	public void setTaskCommentsEntityList(Set<Udn_Task_Comments_Entity> taskCommentsEntityList) {
		this.taskCommentsEntityList = taskCommentsEntityList;
	}


	
	
	
}