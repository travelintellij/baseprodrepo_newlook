package com.udanchoo.intranet.model;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import com.udanchoo.intranet.entity.Udn_Ticket_Recorder_Entity;


public class Udn_Ticket_Recorder_Obj {
	
	private Long ticketId;
	private String ticketTitle;
	private String  ticketPriority;
	private long dealConfirmationId;
	private int ticketOwner;
	private int ticketCreator;
	private LocalDateTime ticketDueDate;
	private String ticketDescription;
	private String ticketStatus;
	private Date createdAt;
	private Date updatedAt;
	private boolean notifyTicketOwner;
	private long clientId;
	private int page;
	
	
	private String dealName;
	private String clientName;
	
	private String ticketComment;
	
	// this is the default view name where after the changes form will show the right navigation from left option. 
	//private String viewSource ="OPEN_TICKET";
	
	//Additional fields not part of entity. 
	private String ticketOwnerName;
	private String ticketCreatorName;
	
	private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
	
	public Udn_Ticket_Recorder_Obj() {
		
	}
	
	public void updateVoFromEntity(Udn_Ticket_Recorder_Entity ticketEntity) {
		this.ticketId=ticketEntity.getTicketId();
		this.ticketTitle=ticketEntity.getTicketTitle();
		this.ticketPriority=ticketEntity.getTicketPriority();
		this.dealConfirmationId=ticketEntity.getDealConfirmationId();
		this.ticketOwner=ticketEntity.getTicketOwner();
		this.ticketCreator=ticketEntity.getTicketCreator();
		this.ticketDueDate=ticketEntity.getTicketDueDate();
		this.ticketDescription=ticketEntity.getTicketDescription();
		this.ticketStatus=ticketEntity.getTicketStatus();
		this.createdAt=ticketEntity.getCreatedAt();
		this.updatedAt=ticketEntity.getUpdatedAt();
		this.clientId=ticketEntity.getClientId();
		
	}
	
	public Udn_Ticket_Recorder_Obj(Udn_Ticket_Recorder_Entity ticketEntity) {
		this.ticketId=ticketEntity.getTicketId();
		this.ticketTitle=ticketEntity.getTicketTitle();
		this.ticketPriority=ticketEntity.getTicketPriority();
		this.dealConfirmationId=ticketEntity.getDealConfirmationId();
		this.ticketOwner=ticketEntity.getTicketOwner();
		this.ticketCreator=ticketEntity.getTicketCreator();
		this.ticketDueDate=ticketEntity.getTicketDueDate();
		this.ticketDescription=ticketEntity.getTicketDescription();
		this.ticketStatus=ticketEntity.getTicketStatus();
		this.createdAt=ticketEntity.getCreatedAt();
		this.updatedAt=ticketEntity.getUpdatedAt();
		this.clientId=ticketEntity.getClientId();
			
	}
	public Long getTicketId() {
		return ticketId;
	}
	public void setTicketId(Long ticketId) {
		this.ticketId = ticketId;
	}
	public String getTicketTitle() {
		return ticketTitle;
	}
	public void setTicketTitle(String ticketTitle) {
		this.ticketTitle = ticketTitle;
	}
	public String getTicketPriority() {
		return ticketPriority;
	}
	public void setTicketPriority(String ticketPriority) {
		this.ticketPriority = ticketPriority;
	}
	public Long getDealConfirmationId() {
		return dealConfirmationId;
	}
	public void setDealConfirmationId(Long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}
	public int getTicketOwner() {
		return ticketOwner;
	}
	public void setTicketOwner(int ticketOwner) {
		this.ticketOwner = ticketOwner;
	}
	public int getTicketCreator() {
		return ticketCreator;
	}
	public void setTicketCreator(int ticketCreator) {
		this.ticketCreator = ticketCreator;
	}
	public LocalDateTime getTicketDueDate() {
		return ticketDueDate;
	}
	public void setTicketDueDate(String dueDate) {
		
		this.ticketDueDate = LocalDateTime.parse(dueDate,formatter);
		//this.ticketDueDate = LocalDateTime.parse(dueDate);
		
	}
	public String getTicketDescription() {
		return ticketDescription;
	}
	public void setTicketDescription(String ticketDescrption) {
		this.ticketDescription = ticketDescrption;
	}
	public String getTicketStatus() {
		return ticketStatus;
	}
	public void setTicketStatus(String ticketStatus) {
		this.ticketStatus = ticketStatus;
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
	
	
	
	
	@Override
	public String toString() {
		return "Udn_Ticket_Recorder_Obj [ticketId=" + ticketId + ", ticketTitle=" + ticketTitle + ", ticketPriority="
				+ ticketPriority + ", dealConfirmationId=" + dealConfirmationId + ", ticketOwner=" + ticketOwner
				+ ", ticketCreator=" + ticketCreator + ", ticketDueDate=" + ticketDueDate + ", ticketDescription="
				+ ticketDescription + ", ticketStatus=" + ticketStatus + ", createdAt=" + createdAt + ", updatedAt="
				+ updatedAt + ", notifyTicketOwner=" + notifyTicketOwner + ", clientId=" + clientId + ", dealName="
				+ dealName + ", clientName=" + clientName + ", ticketOwnerName=" + ticketOwnerName
				+ ", ticketCreatorName=" + ticketCreatorName + ", formatter=" + formatter + "]";
	}

	public String getTicketOwnerName() {
		return ticketOwnerName;
	}
	public void setTicketOwnerName(String ticketOwnerName) {
		this.ticketOwnerName = ticketOwnerName;
	}
	public String getTicketCreatorName() {
		return ticketCreatorName;
	}
	public void setTicketCreatorName(String ticketCreatorName) {
		this.ticketCreatorName = ticketCreatorName;
	}

	public String getDealName() {
		return dealName;
	}

	public void setDealName(String dealName) {
		this.dealName = dealName;
	}
	public boolean isNotifyTicketOwner() {
		return notifyTicketOwner;
	}
	public void setNotifyTicketOwner(boolean notifyTicketOwner) {
		this.notifyTicketOwner= notifyTicketOwner;
	}
	public long getClientId() {
		return clientId;
	}
	public void setClientId(long clientId) {
		this.clientId = clientId;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public void setDealConfirmationId(long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getTicketComment() {
		return ticketComment;
	}

	public void setTicketComment(String ticketComment) {
		this.ticketComment = ticketComment;
	}
	
	
	
	
	
}