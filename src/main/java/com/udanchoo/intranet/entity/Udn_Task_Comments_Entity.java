package com.udanchoo.intranet.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.udanchoo.intranet.model.Udn_Room_Category_Obj;

@Entity
@Table(name = "udn_task_comments")
public class Udn_Task_Comments_Entity extends AuditModel {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long taskCommentId;

	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="taskId", nullable=false)
	@JsonManagedReference
    private Udn_Task_Recorder_Entity taskEntity;
	
	private String taskComment;
	private int updatedBy;
	public long getTaskCommentId() {
		return taskCommentId;
	}
	public void setTaskCommentId(long taskCommentId) {
		this.taskCommentId = taskCommentId;
	}
	public Udn_Task_Recorder_Entity getTaskEntity() {
		return taskEntity;
	}
	public void setTaskEntity(Udn_Task_Recorder_Entity taskEntity) {
		this.taskEntity = taskEntity;
	}
	public String getTaskComment() {
		return taskComment;
	}
	public void setTaskComment(String taskComment) {
		this.taskComment = taskComment;
	}
	public int getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(int updatedBy) {
		this.updatedBy = updatedBy;
	}
	
	

	



}