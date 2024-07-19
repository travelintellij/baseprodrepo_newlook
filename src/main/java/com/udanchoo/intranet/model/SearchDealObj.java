package com.udanchoo.intranet.model;

import java.sql.Date;

import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;
import com.udanchoo.intranet.util.UdanChooConstants;

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
    private int  dealSearchPeriodType;
    private boolean upcomingDeal=true;
    
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

	

	public int getDealSearchPeriodType() {
		return dealSearchPeriodType;
	}

	public void setDealSearchPeriodType(int dealSearchPeriodType) {
		this.dealSearchPeriodType = dealSearchPeriodType;
	}

	
	

	public boolean isUpcomingDeal() {
		return upcomingDeal;
	}

	public void setUpcomingDeal(boolean upcomingDeal) {
		this.upcomingDeal = upcomingDeal;
	}

	@Override
	public String toString() {
		return "SearchDealObj [dealConfirmationId=" + dealConfirmationId + ", queryId=" + queryId + ", clientId="
				+ clientId + ", clientName=" + clientName + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", searchOnBookingDate=" + searchOnBookingDate + ", dealStatus=" + dealStatus + ", statusName="
				+ statusName + ", dealOwner=" + dealOwner + ", dateCheckFilterNeeded=" + dateCheckFilterNeeded
				+ ", dealSearchPeriodType=" + dealSearchPeriodType + ", searchCriteria=" + searchCriteria + "]";
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
