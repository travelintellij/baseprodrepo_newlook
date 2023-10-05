package com.udanchoo.intranet.model;

public class FilterTicketObj {
	private int ticketOwner = 0;
	private long ticketId;
	private String dateFrom;
	private String dateTo;
	private String sortBy;
	private String ticketStatus;
	private long dealConfirmationId;
	private String ticketPriority;
	private boolean overDueTickets;
	private boolean myCreatedTicketOnly;
	private boolean myAssignedTicketOnly;
	private boolean completedTicketOnly;
	
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
	
	
	
	public int getTicketOwner() {
		return ticketOwner;
	}
	public void setTicketOwner(int ticketOwner) {
		this.ticketOwner = ticketOwner;
	}
	public String getTicketStatus() {
		return ticketStatus;
	}
	public void setTicketStatus(String ticketStatus) {
		this.ticketStatus = ticketStatus;
	}
	public String toString() {
		String attrib = "Displaying Filter Ticket Criteria Requested \n";
		attrib = attrib  + "ticketOwner -> " + ticketOwner + "\n";
		attrib = attrib  + "dateFrom -> " +dateFrom + "\n";
		attrib = attrib  + " dateTo ->" + dateTo+ "\n";
		attrib = attrib  + " sortBy ->" + sortBy+ "\n";
		attrib = attrib  + " ticketStatus ->" + ticketStatus+ "\n";
		attrib = attrib  + " ticketPriority ->" + ticketPriority+ "\n";
		attrib = attrib  + " dealConfirmationId ->" + dealConfirmationId+ "\n";
		attrib = attrib  + " overDueTickets ->" + overDueTickets + "\n";
		
		
		return attrib ;
	}
	public long getDealConfirmationId() {
		return dealConfirmationId;
	}
	public void setDealConfirmationId(long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}
	public String getTicketPriority() {
		return ticketPriority;
	}
	public void setTicketPriority(String ticketPriority) {
		this.ticketPriority = ticketPriority;
	}
	public boolean isOverDueTickets() {
		return overDueTickets;
	}
	public void setOverDueTickets(boolean overDueTickets) {
		this.overDueTickets = overDueTickets;
	}
	public boolean isMyCreatedTicketOnly() {
		return myCreatedTicketOnly;
	}
	public void setMyCreatedTicketOnly(boolean myCreatedTicketOnly) {
		this.myCreatedTicketOnly = myCreatedTicketOnly;
	}
	public boolean isMyAssignedTicketOnly() {
		return myAssignedTicketOnly;
	}
	public void setMyAssignedTicketOnly(boolean myAssignedTicketOnly) {
		this.myAssignedTicketOnly = myAssignedTicketOnly;
	}
	public boolean isCompletedTicketOnly() {
		return completedTicketOnly;
	}
	public void setCompletedTicketOnly(boolean completedTicketOnly) {
		this.completedTicketOnly = completedTicketOnly;
	}
	public long getTicketId() {
		return ticketId;
	}
	public void setTicketId(long ticketId) {
		this.ticketId = ticketId;
	}
	
	
	
	
}
