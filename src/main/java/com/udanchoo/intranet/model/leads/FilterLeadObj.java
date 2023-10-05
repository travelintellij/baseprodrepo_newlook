package com.udanchoo.intranet.model.leads;

import java.sql.Date;

import com.udanchoo.intranet.util.UdanChooConstants;

public class FilterLeadObj  {
    
    private long leadId;
    private long contactId;
    private String contactName;
    private int leadStatus=UdanChooConstants.VIEW_ALL_OPEN_LEADS_WL_STATUS;
    private String startDate;
    private String endDate;
    private int dateCriteria;
    private int leadSource;
    private int leadOwner;
    private boolean qualified;
    private boolean flagged;
    private String sourceName;
    private int source;
    private String destinationName;
    private int destination;
    private boolean onlyLeadOwner;
    
	public long getLeadId() {
		return leadId;
	}



	public void setLeadId(long leadId) {
		this.leadId = leadId;
	}



	public long getContactId() {
		return contactId;
	}



	public void setContactId(long contactId) {
		this.contactId = contactId;
	}



	public String getContactName() {
		return contactName;
	}



	public void setContactName(String contactName) {
		this.contactName = contactName;
	}



	public int getLeadStatus() {
		return leadStatus;
	}



	public void setLeadStatus(int leadStatus) {
		this.leadStatus = leadStatus;
	}



	public String getStartDate() {
		return startDate;
	}



	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}



	public String getEndDate() {
		return endDate;
	}



	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}



	public int getDateCriteria() {
		return dateCriteria;
	}



	public void setDateCriteria(int dateCriteria) {
		this.dateCriteria = dateCriteria;
	}



	public int getLeadSource() {
		return leadSource;
	}



	public void setLeadSource(int leadSource) {
		this.leadSource = leadSource;
	}



	public int getLeadOwner() {
		return leadOwner;
	}



	public void setLeadOwner(int leadOwner) {
		this.leadOwner = leadOwner;
	}



	public boolean isQualified() {
		return qualified;
	}



	public void setQualified(boolean qualified) {
		this.qualified = qualified;
	}



	public boolean isFlagged() {
		return flagged;
	}



	public void setFlagged(boolean flagged) {
		this.flagged = flagged;
	}



	public String getSourceName() {
		return sourceName;
	}



	public void setSourceName(String sourceName) {
		this.sourceName = sourceName;
	}



	public int getSource() {
		return source;
	}



	public void setSource(int source) {
		this.source = source;
	}



	public String getDestinationName() {
		return destinationName;
	}



	public void setDestinationName(String destinationName) {
		this.destinationName = destinationName;
	}



	public int getDestination() {
		return destination;
	}



	public void setDestination(int destination) {
		this.destination = destination;
	}



	public boolean isOnlyLeadOwner() {
		return onlyLeadOwner;
	}



	public void setOnlyLeadOwner(boolean onlyLeadOwner) {
		this.onlyLeadOwner = onlyLeadOwner;
	}



	@Override
	public String toString() {
		return "FilterLeadObj [leadId=" + leadId + ", contactId=" + contactId + ", contactName=" + contactName
				+ ", leadStatus=" + leadStatus + ", startDate=" + startDate + ", endDate=" + endDate + ", dateCriteria="
				+ dateCriteria + ", leadSource=" + leadSource + ", leadOwner=" + leadOwner + ", qualified=" + qualified
				+ ", flagged=" + flagged + ", sourceName=" + sourceName + ", source=" + source + ", destinationName="
				+ destinationName + ", destination=" + destination + ", onlyLeadOwner=" + onlyLeadOwner + "]";
	}




   
   
}
