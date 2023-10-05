package com.udanchoo.intranet.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "udn_ticket_comments")
public class Udn_Ticket_Comments_Entity extends AuditModel {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long ticketCommentId;

	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="ticketId", nullable=false)
	@JsonManagedReference
    private Udn_Ticket_Recorder_Entity ticketEntity;
	
	private String ticketComment;
	private int updatedBy;
	public long getTicketCommentId() {
		return ticketCommentId;
	}
	public void setTicketCommentId(long ticketCommentId) {
		this.ticketCommentId = ticketCommentId;
	}
	public Udn_Ticket_Recorder_Entity getTicketEntity() {
		return ticketEntity;
	}
	public void setTicketEntity(Udn_Ticket_Recorder_Entity ticketEntity) {
		this.ticketEntity = ticketEntity;
	}
	public String getTicketComment() {
		return ticketComment;
	}
	public void setTicketComment(String ticketComment) {
		this.ticketComment = ticketComment;
	}
	public int getUpdatedBy() {
		return updatedBy;
	}
	public void setUpdatedBy(int updatedBy) {
		this.updatedBy = updatedBy;
	}
	
	

	



}