package com.udanchoo.intranet.model;

import java.sql.Date;

import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;

public class SearchDealObj  {
    
    private long dealConfirmationId;
    private long queryId;
    private long clientId;
    private String clientName;
	private Date startDate;
    private Date endDate;
    private boolean searchOnBookingDate;
    private int dealStatus=0;
    private String statusName;
    private long dealOwner;
    private boolean dateCheckFilterNeeded;
    
    public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public String getSearchCriteria() {
		return searchCriteria;
	}

	public void setSearchCriteria(String searchCriteria) {
		this.searchCriteria = searchCriteria;
	}

	private String searchCriteria="";
    
    public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	
	
	public long getDealConfirmationId() {
		return dealConfirmationId;
	}


	public void setDealConfirmationId(long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}


	public long getQueryId() {
		return queryId;
	}


	public void setQueryId(long queryId) {
		this.queryId = queryId;
	}


	public long getClientId() {
		return clientId;
	}


	public void setClientId(long clientId) {
		this.clientId = clientId;
	}


	public Date getStartDate() {
		return startDate;
	}


	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}


	public Date getEndDate() {
		return endDate;
	}


	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}


	public boolean getSearchOnBookingDate() {
		return searchOnBookingDate;
	}


	public void setSearchOnBookingDate(boolean searchOnBookingDate) {
		this.searchOnBookingDate = searchOnBookingDate;
	}


	public int getDealStatus() {
		return dealStatus;
	}


	public void setDealStatus(int dealStatus) {
		this.dealStatus = dealStatus;
	}


	public String toString() {
		String attrib = " clientId -> " + this.clientId + "\n";
		attrib = attrib + " Client Name -> " + this.clientName + "\n";
		attrib = attrib + " Confirmation ID  -> " + this.dealConfirmationId + "\n";
		attrib = attrib + "queryId  -> " + this.queryId + "\n";
		attrib = attrib + " dealStatus -> " + this.dealStatus + "\n";
		attrib = attrib + "  startDate -> " + this.startDate + "\n";
		attrib = attrib + "endDate ->  " + this.endDate + "\n";
		attrib = attrib + " searchOnBookingDate -> " + this.searchOnBookingDate + "\n";
		return attrib;
	}

	public long getDealOwner() {
		return dealOwner;
	}

	public void setDealOwner(long dealOwner) {
		this.dealOwner = dealOwner;
	}

	public boolean isDateCheckFilterNeeded() {
		return dateCheckFilterNeeded;
	}

	public void setDateCheckFilterNeeded(boolean dateCheckFilterNeeded) {
		this.dateCheckFilterNeeded = dateCheckFilterNeeded;
	}
   
   
}
