package com.udanchoo.intranet.model;

import java.sql.Date;

public class FilterServiceLineObj {
	private int clientId = 0;
	private String clientName;
	private int statusId =0;
	private String dateFrom;
	private String dateTo;
	private String sortBy;
	//private int next;
	
	public int getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		if(clientId!=null && clientId.trim().length()>0) {
			this.clientId = Integer.parseInt(clientId);
		}
		else {
			this.clientId = 0;
		}
		
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public int getStatusId() {
		return statusId;
	}
	public void setStatusId(String statusId) {
		if(statusId!=null && statusId.trim().length()>0) {
			this.statusId = Integer.parseInt(statusId);
		}
		else {
			this.statusId = 0;
		}
		
	}
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
	
	public String toString() {
		String attrib = "Displaying Filter Criteria Requested \n";
		attrib = attrib  + "clientId -> " + clientId + "\n";
		attrib = attrib  + " clientName -> " +clientName + "\n";
		attrib = attrib  + "statusId ->" +statusId + "\n";
		attrib = attrib  + "dateFrom -> " +dateFrom + "\n";
		attrib = attrib  + " dateTo ->" + dateTo+ "\n";
		
		return attrib ;
	}
	
}
