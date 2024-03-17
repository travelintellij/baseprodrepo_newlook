package com.udanchoo.intranet.entity;

import java.sql.Date;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.udanchoo.intranet.model.Udn_Deals_Recorder_Obj;

@Entity
@Table(name = "udn_deals_recorder")
public class Udn_Deals_Recorder_Entity extends AuditModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long dealConfirmationId;

    @OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY, mappedBy = "parentDealRecord", orphanRemoval=true)
    @OrderBy("dealServiceCode ASC")
    private Set<Udn_Deal_Services_Entity> dealServicesEntityList = new HashSet<Udn_Deal_Services_Entity>();
    
    /*public void removeChild(Udn_Deal_Services_Entity child) {
    	dealServicesEntityList.remove(child);
        child.setParentDealRecord(null);
    }*/
    
	
	@ManyToMany(targetEntity = UdnTeam.class,fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "ti_deals_team_map",
            joinColumns = {@JoinColumn(name="dealConfirmationId")},
            inverseJoinColumns = {@JoinColumn(name="userId")})
	protected Set<UdnTeam> team = new HashSet<UdnTeam>();
	
    private long queryId;

    private int dealSource;
    private boolean isNewClient;
    private boolean isClientInformed;
    private int dealStatus;
    private boolean isActive;
    private long dealOwner=0;
    private Date bookingDate;
    private float projectedCost;
    private float actualCost;
    private float sellingPrice;
	
    @NotNull
    private Long clientId;

    @NotNull
    private Date travelStartDate;
    
    @NotNull
    private Date travelEndDate;
    private int travelingFrom;
    private int travelingTo;
    
    
    @NotNull
    @Size(max = 500)
    String dealDescription;
    
    private int adults;
    private int children;
    
    
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


	public Udn_Deals_Recorder_Entity() {}
    

	public Set<Udn_Deal_Services_Entity> getDealServicesEntityList() {
		
		return dealServicesEntityList;
	}

	public void setDealServicesEntityList(Set<Udn_Deal_Services_Entity> dealServicesEntityList) {
		this.dealServicesEntityList = dealServicesEntityList;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}


	public void updateEntityFromVo(@Valid Udn_Deals_Recorder_Obj dealRecorderObj) {
		this.clientId=dealRecorderObj.getClientId();
		this.dealConfirmationId=dealRecorderObj.getDealConfirmationId();
		this.dealDescription=dealRecorderObj.getDealDescription();
		this.dealSource=dealRecorderObj.getDealSource();
		this.queryId=dealRecorderObj.getQueryId();
		this.dealStatus=dealRecorderObj.getDealStatus();
		this.travelingFrom=dealRecorderObj.getTravelingFrom();
		this.travelingTo=dealRecorderObj.getTravelingTo();
		this.dealDescription=dealRecorderObj.getDealDescription();
		this.isActive=dealRecorderObj.isActive();
		this.isClientInformed=dealRecorderObj.isClientInformed();
		this.isNewClient=dealRecorderObj.getIsNewClient();
		this.travelEndDate=dealRecorderObj.getTravelEndDate();
		this.travelStartDate=dealRecorderObj.getTravelStartDate();
		//this.dealOwner = dealRecorderObj.getDealOwner();
		this.bookingDate = dealRecorderObj.getBookingDate();
		this.adults = dealRecorderObj.getAdults();
		this.children =dealRecorderObj.getChildren(); 
		this.projectedCost = dealRecorderObj.getProjectedCost();
		this.actualCost= dealRecorderObj.getActualCost();
		this.sellingPrice= dealRecorderObj.getSellingPrice();
		this.dealOwner=dealRecorderObj.getDealOwner();
		this.team=dealRecorderObj.getTeam();
		
	}

	public Udn_Deals_Recorder_Entity(@Valid Udn_Deals_Recorder_Obj dealRecorderObj) {
		this.clientId=dealRecorderObj.getClientId();
		this.dealConfirmationId=dealRecorderObj.getDealConfirmationId();
		this.dealDescription=dealRecorderObj.getDealDescription();
		this.dealSource=dealRecorderObj.getDealSource();
		this.queryId=dealRecorderObj.getQueryId();
		this.dealStatus=dealRecorderObj.getDealStatus();
		this.travelingFrom=dealRecorderObj.getTravelingFrom();
		this.travelingTo=dealRecorderObj.getTravelingTo();
		this.dealDescription=dealRecorderObj.getDealDescription();
		this.isActive=dealRecorderObj.isActive();
		this.isClientInformed=dealRecorderObj.isClientInformed();
		this.isNewClient=dealRecorderObj.getIsNewClient();
		this.travelEndDate=dealRecorderObj.getTravelEndDate();
		this.travelStartDate=dealRecorderObj.getTravelStartDate();
		this.dealOwner = dealRecorderObj.getDealOwner();
		this.bookingDate = dealRecorderObj.getBookingDate();
		this.adults = dealRecorderObj.getAdults();
		this.children =dealRecorderObj.getChildren(); 
		this.projectedCost = dealRecorderObj.getProjectedCost();
		this.actualCost= dealRecorderObj.getActualCost();
		this.sellingPrice= dealRecorderObj.getSellingPrice();

				
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

	public boolean isNewClient() {
		return isNewClient;
	}

	public void setNewClient(boolean isNewClient) {
		this.isNewClient = isNewClient;
	}

	public boolean isClientInformed() {
		return isClientInformed;
	}

	public void setClientInformed(boolean isClientInformed) {
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
    
	public String toString() {
		String attrib = " clientId -> " + this.clientId + "\n";
		attrib = attrib + " Confirmation ID  -> " + this.dealConfirmationId + "\n";
		attrib = attrib + "dealDescription  -> " + this.dealDescription + "\n";
		attrib = attrib + "  dealSource  ->" + this.dealSource + "\n";
		attrib = attrib + "queryId  -> " + this.queryId + "\n";
		attrib = attrib + " dealStatus -> " + this.dealStatus + "\n";
		attrib = attrib + "  travelingFrom -> " + this.travelingFrom + "\n";
		attrib = attrib + "travelingTo ->  " + this.travelingTo + "\n";
		attrib = attrib + " dealDescription -> " + this.dealDescription + "\n";
		attrib = attrib + " isActive -> " + this.isActive + "\n";
		attrib = attrib + "isClientInformed ->  " + this.isClientInformed + "\n";
		attrib = attrib + "isNewClient ->  " + this.isNewClient + "\n";
		attrib = attrib + "travelEndDate ->  " + this.travelEndDate + "\n";
		attrib = attrib + "travelStartDate ->  " + this.travelStartDate + "\n";
		attrib = attrib + "bookingDate ->  " + this.bookingDate + "\n";
		attrib = attrib + "adults ->  " + this.adults + "\n";
		attrib = attrib + "children ->  " + this.children + "\n";
		attrib = attrib + "Deal Owner ->  " + this.dealOwner + "\n";

		attrib = attrib + "Projected Cost ->  " + this.projectedCost + "\n";
		attrib = attrib + "Actual Cost ->  " + this.actualCost + "\n";
		attrib = attrib + "Selling Price ->  " + this.sellingPrice  + "\n";

		return attrib;
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
	
	private void updateTeamFromVO(Set<String> operatingTeam) {
		operatingTeam.forEach((e) -> { 
			UdnTeam entity = new UdnTeam();
			//System.out.println("Submitted Entity is " + e);
			entity.setUserId(Integer.parseInt(e));
			team.add(entity);
			//System.out.println("Set is " + destinations);
		});
	}
	
	public Set<UdnTeam> getTeam() {
		return team;
	}
	public void setTeam(Set<UdnTeam> team) {
		this.team = team;
	}
	   
	
   
}
