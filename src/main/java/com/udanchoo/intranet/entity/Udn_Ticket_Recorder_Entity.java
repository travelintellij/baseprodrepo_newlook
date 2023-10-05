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

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.udanchoo.intranet.model.Udn_Ticket_Recorder_Obj;

@Entity
@Table(name = "udn_ticket_recorder")
public class Udn_Ticket_Recorder_Entity extends AuditModel {
   
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false,name="ticketId", unique = true)
	private Long ticketId;
	
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy = "ticketEntity")
    @OrderBy("createdAt DESC")
	@JsonBackReference
    private Set<Udn_Ticket_Comments_Entity> ticketCommentsEntityList = new HashSet<Udn_Ticket_Comments_Entity>();


	private String ticketTitle;
	private String  ticketPriority;
	private long dealConfirmationId;
	private long clientId;
	private int ticketOwner;
	private int ticketCreator;
	private LocalDateTime ticketDueDate;
	private String ticketDescription;
	private String ticketStatus;
	
	public Udn_Ticket_Recorder_Entity() {}
	
	public Udn_Ticket_Recorder_Entity(Udn_Ticket_Recorder_Obj ticketObj) {
		this.ticketId=ticketObj.getTicketId();
		this.ticketTitle=ticketObj.getTicketTitle();
		this.ticketPriority=ticketObj.getTicketPriority();
		this.dealConfirmationId=ticketObj.getDealConfirmationId();
		this.ticketOwner=ticketObj.getTicketOwner();
		this.ticketCreator=ticketObj.getTicketCreator();
		this.ticketDueDate=ticketObj.getTicketDueDate();
		this.ticketDescription=ticketObj.getTicketDescription();
		this.ticketStatus=ticketObj.getTicketStatus();
		this.clientId=ticketObj.getClientId();
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
	public long getDealConfirmationId() {
		return dealConfirmationId;
	}
	public void setDealConfirmationId(long dealConfirmationId) {
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
	public void setTicketDueDate(LocalDateTime ticketDueDate) {
		this.ticketDueDate = ticketDueDate;
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


	public String toString() {
		String attrib = " Displaying Ticket Entity : " +"\n";
		attrib = attrib + " ticketId-> " + ticketId+ "\n";
		attrib = attrib + "ticketTitle -> " + ticketTitle+ "\n";
		attrib = attrib + "ticketPriority -> " +ticketPriority + "\n";
		attrib = attrib + " dealConfirmationId-> " + dealConfirmationId+ "\n";
		attrib = attrib + " ticketOwner-> " + ticketOwner+ "\n";
		attrib = attrib + " ticketCreator-> " +ticketCreator + "\n";
		attrib = attrib + "ticketDueDate -> " + ticketDueDate+ "\n";
		attrib = attrib + " ticketDescrption-> " +ticketDescription + "\n";
		attrib = attrib + " ticketStatus-> " +ticketStatus + "\n";
		return attrib;
	}

	public long getClientId() {
		return clientId;
	}

	public void setClientId(long clientId) {
		this.clientId = clientId;
	}

	public Set<Udn_Ticket_Comments_Entity> getTicketCommentsEntityList() {
		return ticketCommentsEntityList;
	}

	public void setTicketCommentsEntityList(Set<Udn_Ticket_Comments_Entity> ticketCommentsEntityList) {
		this.ticketCommentsEntityList = ticketCommentsEntityList;
	}


	
	
	
}