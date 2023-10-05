package com.udanchoo.intranet.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import com.udanchoo.intranet.entity.UdnTeam;
import com.udanchoo.intranet.entity.Udn_Deal_Services_Entity;
import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;
import com.udanchoo.intranet.entity.Udn_Services_Master_Entity;
import com.udanchoo.intranet.util.UdanChooConstants;

public class Udn_Deals_Recorder_Obj  {
    
    private Long dealConfirmationId;
    private long queryId;
    private Long clientId;
    private Date travelStartDate;
    private Date travelEndDate;
    private Date bookingDate;
    private String travelingFromCity;
    private String travelingToCity;
    private int travelingFrom;
    private int travelingTo;
    private String clientName;
    private java.util.Date createdAt;
    private long dealOwner;
	private String dealDescription;
    private int dealSource;
    private boolean isNewClient;
    private boolean isClientInformed;
    private int dealStatus = UdanChooConstants.DEAL_FRESH_CREATED_STATUS;
    private boolean isActive;
    private String statusName;
    private int adults;
    private int children;
    private String dealSourceName;
    
    private float projectedCost;
    private float actualCost;
    private float sellingPrice;
    private float projectedMarkup;

    private String [] serviceList;
    private List<Udn_Deal_Services_Map_Obj> serviceWorkLoadList ;
    
    private String dealOwnerName;
    
    protected Set<UdnTeam> team = new HashSet<UdnTeam>();
    

    
	private String teamNames;
	private Set<String> operatingTeams = new HashSet();
	
 	
	private void updateTeamsFromVO(Set<UdnTeam> teamEntity) {
		teamEntity.forEach((e) -> { 
			operatingTeams.add(String.valueOf(e.getUserId()));
		});
	}

	
 	public String getTeamNames() {
		return teamNames;
	}

	public void setTeamNames(String teamNames) {
		this.teamNames = teamNames;
	}

	public Set<String> getOperatingTeams() {
		return operatingTeams;
	}

	public void setOperatingTeams(Set<String> operatingTeams) {
		this.operatingTeams = operatingTeams;
	}
    
    
    public int getAdults() {
		return adults;
	}

	public void setAdults(int adults) {
		this.adults = adults;
	}

	public int getChildren() {
		return children;
	}

	public void setChildren(int children) {
		this.children = children;
	}

	public void setServiceWorkLoadList(List serviceWorkLoadList) {
		this.serviceWorkLoadList = serviceWorkLoadList;
	}
	
	public List getServiceWorkLoadList() {
		return this.serviceWorkLoadList;
	}

	public String getTravelingFromCity() {
		return travelingFromCity;
	}

	public void setTravelingFromCity(String travelingFromCity) {
		this.travelingFromCity = travelingFromCity;
	}

	public String getTravelingToCity() {
		return travelingToCity;
	}

	public void setTravelingToCity(String travelingToCity) {
		this.travelingToCity = travelingToCity;
	}

	public Date getBookingDate() {
		return bookingDate;
	}

	public void setBookingDate(Date bookingDate) {
		this.bookingDate = bookingDate;
	}
    
    public long getDealOwner() {
		return dealOwner;
	}

	public void setDealOwner(long dealOwner) {
		this.dealOwner = dealOwner;
	}

	public java.util.Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
 
	
    
    public String[] getServiceList() {
		return serviceList;
	}

	public void setServiceList(String[] serviceList) {
		this.serviceList = serviceList;
	}

	public void setNewClient(boolean isNewClient) {
		this.isNewClient = isNewClient;
	}

	public void setClientInformed(boolean isClientInformed) {
		this.isClientInformed = isClientInformed;
	}



    

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public Long getDealConfirmationId() {
		return dealConfirmationId;
	}

	public void setDealConfirmationId(Long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}

	public long getQueryId() {
		return queryId;
	}

	public void setQueryId(long queryId) {
		this.queryId = queryId;
	}

	public Long getClientId() {
		return clientId;
	}

	public void setClientId(Long clientId) {
		this.clientId = clientId;
	}

	public Date getTravelStartDate() {
		return travelStartDate;
	}

	public void setTravelStartDate(Date travelStartDate) {
		this.travelStartDate = travelStartDate;
	}

	public Date getTravelEndDate() {
		return travelEndDate;
	}

	public void setTravelEndDate(Date travelEndDate) {
		this.travelEndDate = travelEndDate;
	}

	public int getTravelingFrom() {
		return travelingFrom;
	}

	public void setTravelingFrom(int travelingFrom) {
		this.travelingFrom = travelingFrom;
	}

	public int getTravelingTo() {
		return travelingTo;
	}

	public void setTravelingTo(int travelingTo) {
		this.travelingTo = travelingTo;
	}

	public String getDealDescription() {
		return dealDescription;
	}

	public void setDealDescription(String dealDescription) {
		this.dealDescription = dealDescription;
	}

	public int getDealSource() {
		return dealSource;
	}

	public void setDealSource(int dealSource) {
		this.dealSource = dealSource;
	}

	public boolean getIsNewClient() {
		return isNewClient;
	}

	public void setIsNewClient(boolean isNewClient) {
		this.isNewClient = isNewClient;
	}

	public boolean isClientInformed() {
		return isClientInformed;
	}

	public void setIsClientInformed(boolean isClientInformed) {
		this.isClientInformed = isClientInformed;
	}

	public int getDealStatus() {
		return dealStatus;
	}

	public void setDealStatus(int dealStatus) {
		this.dealStatus = dealStatus;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setIsActive(boolean isActive) {
		this.isActive = isActive;
	}
    
	public Udn_Deals_Recorder_Obj() {
		
	}
	
	public void updateVoFromEntity(Udn_Deals_Recorder_Entity dealMainEntity) {
		this.clientId=dealMainEntity.getClientId();
		this.dealConfirmationId=dealMainEntity.getDealConfirmationId();
		this.dealDescription=dealMainEntity.getDealDescription();
		this.dealSource=dealMainEntity.getDealSource();
		this.queryId=dealMainEntity.getQueryId();
		this.dealStatus=dealMainEntity.getDealStatus();
		this.travelingFrom=dealMainEntity.getTravelingFrom();
		this.travelingTo=dealMainEntity.getTravelingTo();
		this.dealDescription=dealMainEntity.getDealDescription();
		this.isActive=dealMainEntity.isActive();
		this.isClientInformed=dealMainEntity.isClientInformed();
		this.isNewClient=dealMainEntity.isNewClient();
		this.travelEndDate=dealMainEntity.getTravelEndDate();
		this.travelStartDate=dealMainEntity.getTravelStartDate();
		this.createdAt=dealMainEntity.getCreatedAt();
		this.bookingDate = dealMainEntity.getBookingDate();
		this.adults = dealMainEntity.getAdults();
		this.children = dealMainEntity.getChildren();
		this.projectedCost =  dealMainEntity.getProjectedCost();
		this.actualCost=dealMainEntity.getActualCost();
		this.sellingPrice=dealMainEntity.getSellingPrice();
		this.dealOwner=dealMainEntity.getDealOwner();
		this.team = dealMainEntity.getTeam();
		updateTeamsFromVO(team);
		Iterator itr = dealMainEntity.getDealServicesEntityList().iterator();
		int i=0;
		this.serviceList = new String[dealMainEntity.getDealServicesEntityList().size()];
		while(itr.hasNext()) {
			Udn_Deal_Services_Entity service =(Udn_Deal_Services_Entity)itr.next(); 
			//System.out.println("Servuce under deal is " + service );
			serviceList[i] = service.getDealServiceCode();
			i++;
		}
		Iterator<Udn_Deal_Services_Entity> itrWLList = dealMainEntity.getDealServicesEntityList().iterator();
		serviceWorkLoadList = new ArrayList<Udn_Deal_Services_Map_Obj>();
		while(itrWLList .hasNext()) {
			Udn_Deal_Services_Map_Obj serviceMapObj = new Udn_Deal_Services_Map_Obj((Udn_Deal_Services_Entity)itrWLList.next());
			this.serviceWorkLoadList.add(serviceMapObj);
		}
		
	}
	
	public Udn_Deals_Recorder_Obj(Udn_Deals_Recorder_Entity dealMainEntity) {
		this.clientId=dealMainEntity.getClientId();
		this.dealConfirmationId=dealMainEntity.getDealConfirmationId();
		this.dealDescription=dealMainEntity.getDealDescription();
		this.dealSource=dealMainEntity.getDealSource();
		this.queryId=dealMainEntity.getQueryId();
		this.dealStatus=dealMainEntity.getDealStatus();
		this.travelingFrom=dealMainEntity.getTravelingFrom();
		this.travelingTo=dealMainEntity.getTravelingTo();
		this.dealDescription=dealMainEntity.getDealDescription();
		this.isActive=dealMainEntity.isActive();
		this.isClientInformed=dealMainEntity.isClientInformed();
		this.isNewClient=dealMainEntity.isNewClient();
		this.travelEndDate=dealMainEntity.getTravelEndDate();
		this.travelStartDate=dealMainEntity.getTravelStartDate();
		this.createdAt=dealMainEntity.getCreatedAt();
		this.bookingDate = dealMainEntity.getBookingDate();
		this.adults = dealMainEntity.getAdults();
		this.children = dealMainEntity.getChildren();
		this.projectedCost =  dealMainEntity.getProjectedCost();
		this.actualCost=dealMainEntity.getActualCost();
		this.sellingPrice=dealMainEntity.getSellingPrice();
		this.dealOwner=dealMainEntity.getDealOwner();
		
		Iterator itr = dealMainEntity.getDealServicesEntityList().iterator();
		int i=0;
		this.serviceList = new String[dealMainEntity.getDealServicesEntityList().size()];
		while(itr.hasNext()) {
			Udn_Deal_Services_Entity service =(Udn_Deal_Services_Entity)itr.next(); 
			//System.out.println("Servuce under deal is " + service );
			serviceList[i] = service.getDealServiceCode();
			i++;
		}
		Iterator<Udn_Deal_Services_Entity> itrWLList = dealMainEntity.getDealServicesEntityList().iterator();
		serviceWorkLoadList = new ArrayList<Udn_Deal_Services_Map_Obj>();
		while(itrWLList .hasNext()) {
			Udn_Deal_Services_Map_Obj serviceMapObj = new Udn_Deal_Services_Map_Obj((Udn_Deal_Services_Entity)itrWLList.next());
			this.serviceWorkLoadList.add(serviceMapObj);
		}
		
	}
   
	
	
	public String getDealSourceName() {
		return dealSourceName;
	}

	public void setDealSourceName(String dealSourceName) {
		this.dealSourceName = dealSourceName;
	}

	
   
    @Override
	public String toString() {
		return "Udn_Deals_Recorder_Obj [dealConfirmationId=" + dealConfirmationId + ", queryId=" + queryId
				+ ", clientId=" + clientId + ", travelStartDate=" + travelStartDate + ", travelEndDate=" + travelEndDate
				+ ", bookingDate=" + bookingDate + ", travelingFromCity=" + travelingFromCity + ", travelingToCity="
				+ travelingToCity + ", travelingFrom=" + travelingFrom + ", travelingTo=" + travelingTo
				+ ", clientName=" + clientName + ", createdAt=" + createdAt + ", dealOwner=" + dealOwner
				+ ", dealDescription=" + dealDescription + ", dealSource=" + dealSource + ", isNewClient=" + isNewClient
				+ ", isClientInformed=" + isClientInformed + ", dealStatus=" + dealStatus + ", isActive=" + isActive
				+ ", statusName=" + statusName + ", adults=" + adults + ", children=" + children + ", dealSourceName="
				+ dealSourceName + ", projectedCost=" + projectedCost + ", actualCost=" + actualCost + ", sellingPrice="
				+ sellingPrice + ", projectedMarkup=" + projectedMarkup + ", serviceList="
				+ Arrays.toString(serviceList) + ", serviceWorkLoadList=" + serviceWorkLoadList + "]";
	}

	private String displayServiceList(String[] serviceList) {
    	String strList = "";
    	for (int i=0;i<serviceList.length;i++) {
    		strList = strList + "--" + serviceList[i] + "\n";
    	}
    	return strList;
    }

	public float getProjectedCost() {
		return projectedCost;
	}

	public void setProjectedCost(float projectedCost) {
		this.projectedCost = projectedCost;
	}

	public float getActualCost() {
		return actualCost;
	}

	public void setActualCost(float actualCost) {
		this.actualCost = actualCost;
	}

	public float getSellingPrice() {
		return sellingPrice;
	}

	public void setSellingPrice(float sellingPrice) {
		this.sellingPrice = sellingPrice;
	}

	public float getProjectedMarkup() {
		return projectedMarkup;
	}

	public void setProjectedMarkup(float projectedMarkup) {
		this.projectedMarkup = projectedMarkup;
	}

	public String getDealOwnerName() {
		return dealOwnerName;
	}

	public void setDealOwnerName(String dealOwnerName) {
		this.dealOwnerName = dealOwnerName;
	}


	public Set<UdnTeam> getTeam() {
		return team;
	}


	public void setTeam(Set<UdnTeam> team) {
		this.team = team;
	}
    
	
    
}
