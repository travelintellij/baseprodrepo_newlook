package com.udanchoo.intranet.entity.leads;

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

import org.hibernate.annotations.Where;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.udanchoo.intranet.entity.AuditModel;
import com.udanchoo.intranet.entity.UdnTeam;
import com.udanchoo.intranet.entity.Udn_Destinations_Entity;
import com.udanchoo.intranet.entity.Udn_Task_Comments_Entity;
import com.udanchoo.intranet.entity.quotation.Tg_Quotation_Recorder_Entity;
import com.udanchoo.intranet.entity.supplier.Tg_Supplier_Contact_Entity;
import com.udanchoo.intranet.model.Udn_Deals_Recorder_Obj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;

@Entity
@Table(name = "tg_leads_recorder")
public class Tg_Leads_Recorder_Entity extends AuditModel {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    protected Long leadId;

	protected long contactId;
	protected int leadSource;
	protected int adults;
	protected int children;
	protected int tentativeCost;
	protected String clientRemarks;
	protected String internalRemarks;
	protected String childrenAgeInfo;
	protected Integer source;
	
	protected boolean landPackage;
	//protected boolean packageWithFlight;
	//protected boolean packageWithoutFlight;
	protected boolean flight;
	protected boolean hotel;
	protected boolean transfers;
	protected boolean sightseeing;
	protected boolean visa;
	protected boolean insurance;
	protected boolean cruise;
	protected boolean others;
	protected boolean leadCreationClientInformed;
	protected boolean whatsappInformed;
 
	
	@ManyToMany(targetEntity = UdnTeam.class,fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @JoinTable(name = "ti_leads_team_map",
            joinColumns = {@JoinColumn(name="leadId")},
            inverseJoinColumns = {@JoinColumn(name="userId")})
	protected Set<UdnTeam> team = new HashSet<UdnTeam>();
	
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy = "leadEntity")
	@OrderBy("version DESC")
	@JsonBackReference
	protected Set<Tg_Quotation_Recorder_Entity> leadQuotationsList = new HashSet<Tg_Quotation_Recorder_Entity>();
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy = "leadEntity")
    @OrderBy("createdAt DESC")
	@JsonBackReference
    private Set<TI_Leads_Followup_Entity> leadFollowupEntityList = new HashSet<TI_Leads_Followup_Entity>();

	
    
    
    
	public Set<TI_Leads_Followup_Entity> getLeadFollowupEntityList() {
		return leadFollowupEntityList;
	}
	public void setLeadFollowupEntityList(Set<TI_Leads_Followup_Entity> leadFollowupEntityList) {
		this.leadFollowupEntityList = leadFollowupEntityList;
	}
	
	
	public Integer getSource() {
		return source;
	}
	public void setSource(Integer source) {
		this.source = source;
	}

	protected Integer destination;
	protected Date travelStartDate;
	protected Date travelEndDate;
	protected int leadStatus;
	protected int resultReason;
	protected boolean	isQualified;
	protected boolean isFlagged;
	protected int leadOwner;
	
	public Long getLeadId() {
		return leadId;
	}
	public void setLeadId(Long leadId) {
		this.leadId = leadId;
	}

	public long getContactId() {
		return contactId;
	}
	public void setContactId(long contactId) {
		this.contactId = contactId;
	}
	public int getLeadSource() {
		return leadSource;
	}
	public void setLeadSource(int leadSource) {
		this.leadSource = leadSource;
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
	public int getTentativeCost() {
		return tentativeCost;
	}
	public void setTentativeCost(int tentativeCost) {
		this.tentativeCost = tentativeCost;
	}

	public Integer getDestination() {
		return destination;
	}
	public void setDestination(Integer destination) {
		this.destination = destination;
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
	public int getLeadStatus() {
		return leadStatus;
	}
	public void setLeadStatus(int leadStatus) {
		this.leadStatus = leadStatus;
	}
	public int getResultReason() {
		return resultReason;
	}
	public void setResultReason(int resultReason) {
		this.resultReason = resultReason;
	}
	public boolean isQualified() {
		return isQualified;
	}
	public void setQualified(boolean isQualified) {
		this.isQualified = isQualified;
	}
	public boolean isFlagged() {
		return isFlagged;
	}
	public void setFlagged(boolean isFlagged) {
		this.isFlagged = isFlagged;
	}
	public int getLeadOwner() {
		return leadOwner;
	}
	public void setLeadOwner(int leadOwner) {
		this.leadOwner = leadOwner;
	}
	
	
	public Tg_Leads_Recorder_Entity() {

	}
	
	public Tg_Leads_Recorder_Entity(TgLeadsRecorderVO leadsRecorderVo) {
		this.leadId=leadsRecorderVo.getLeadId();

		this.contactId=leadsRecorderVo.getContactId();
		this.leadSource=leadsRecorderVo.getLeadSource();
		this.adults=leadsRecorderVo.getAdults();
		this.children=leadsRecorderVo.getChildren();
		this.tentativeCost=leadsRecorderVo.getTentativeCost();
		this.clientRemarks=leadsRecorderVo.getClientRemarks();
		this.internalRemarks=leadsRecorderVo.getInternalRemarks();
		this.childrenAgeInfo=leadsRecorderVo.getChildrenAgeInfo();
		this.source=leadsRecorderVo.getSource();
		//this.packageWithFlight=leadsRecorderVo.isPackageWithFlight();
		//this.packageWithoutFlight=leadsRecorderVo.isPackageWithoutFlight();
		this.landPackage =leadsRecorderVo.isLandPackage()  ;
		this.flight=leadsRecorderVo.isFlight();
		this.hotel=leadsRecorderVo.isHotel();
		this.transfers=leadsRecorderVo.isTransfers();
		this.sightseeing=leadsRecorderVo.isSightseeing();
		this.visa=leadsRecorderVo.isVisa();
		this.insurance=leadsRecorderVo.isInsurance();
		this.cruise=leadsRecorderVo.isCruise();
		this.others=leadsRecorderVo.isOthers();
		this.leadCreationClientInformed=leadsRecorderVo.isLeadCreationClientInformed();
		this.whatsappInformed=leadsRecorderVo.isWhatsappInformed();
		this.destination=leadsRecorderVo.getDestination();
		this.travelStartDate=leadsRecorderVo.getTravelStartDate();
		this.travelEndDate=leadsRecorderVo.getTravelEndDate();
		this.leadStatus=leadsRecorderVo.getLeadStatus();
		this.resultReason=leadsRecorderVo.getResultReason();
		this.isQualified=leadsRecorderVo.isQualified();
		this.isFlagged=leadsRecorderVo.isFlagged();
		this.leadOwner=leadsRecorderVo.getLeadOwner();
	}
	
	public String getClientRemarks() {
		return clientRemarks;
	}
	public void setClientRemarks(String clientRemarks) {
		this.clientRemarks = clientRemarks;
	}
	public String getInternalRemarks() {
		return internalRemarks;
	}
	public void setInternalRemarks(String internalRemarks) {
		this.internalRemarks = internalRemarks;
	}
	
	
	/*public boolean isPackageWithFlight() {
		return packageWithFlight;
	}
	public void setPackageWithFlight(boolean packageWithFlight) {
		this.packageWithFlight = packageWithFlight;
	}
	public boolean isPackageWithoutFlight() {
		return packageWithoutFlight;
	}
	public void setPackageWithoutFlight(boolean packageWithoutFlight) {
		this.packageWithoutFlight = packageWithoutFlight;
	}
	*/
	
	public boolean isFlight() {
		return flight;
	}
	public boolean isLandPackage() {
		return landPackage;
	}
	public void setLandPackage(boolean landPackage) {
		this.landPackage = landPackage;
	}
	public void setFlight(boolean flight) {
		this.flight = flight;
	}
	public boolean isHotel() {
		return hotel;
	}
	public void setHotel(boolean hotel) {
		this.hotel = hotel;
	}
	public boolean isTransfers() {
		return transfers;
	}
	public void setTransfers(boolean transfers) {
		this.transfers = transfers;
	}
	public boolean isSightseeing() {
		return sightseeing;
	}
	public void setSightseeing(boolean sightseeing) {
		this.sightseeing = sightseeing;
	}
	public boolean isVisa() {
		return visa;
	}
	public void setVisa(boolean visa) {
		this.visa = visa;
	}
	public boolean isInsurance() {
		return insurance;
	}
	public void setInsurance(boolean insurance) {
		this.insurance = insurance;
	}
	public boolean isCruise() {
		return cruise;
	}
	public void setCruise(boolean cruise) {
		this.cruise = cruise;
	}

	
	
	public boolean isOthers() {
		return others;
	}
	public void setOthers(boolean others) {
		this.others = others;
	}
	public boolean isLeadCreationClientInformed() {
		return leadCreationClientInformed;
	}
	public void setLeadCreationClientInformed(boolean leadCreationClientInformed) {
		this.leadCreationClientInformed = leadCreationClientInformed;
	}
	
	public boolean isWhatsappInformed() {
		return whatsappInformed;
	}
	public void setWhatsappInformed(boolean whatsappInformed) {
		this.whatsappInformed = whatsappInformed;
	}
	
	public String getChildrenAgeInfo() {
		return childrenAgeInfo;
	}
	public void setChildrenAgeInfo(String childrenAgeInfo) {
		this.childrenAgeInfo = childrenAgeInfo;
	}
	
	
	public Set<Tg_Quotation_Recorder_Entity> getLeadQuotationsList() {
		return leadQuotationsList;
	}
	
	public void setLeadQuotationsList(Set<Tg_Quotation_Recorder_Entity> leadQuotationsList) {
		this.leadQuotationsList = leadQuotationsList;
	}
	
	public String toString(){
		String attrib = "Displaying Lead Details : " ; 
		attrib = attrib + "leadId " + leadId + " \n ";
		attrib = attrib + "contactId " + contactId + " \n ";
		attrib = attrib + "leadSource " + leadSource + " \n ";
		attrib = attrib + " adults " + adults + " \n ";
		attrib = attrib + "children " + children + " \n ";
		attrib = attrib + "tentativeCost " + tentativeCost + " \n ";
		attrib = attrib + "Client Remarks " + clientRemarks + " \n ";
		attrib = attrib + "Internal Remarks " + internalRemarks + " \n ";
		attrib = attrib + "destination " + destination + " \n ";
		attrib = attrib + "travelStartDate " + travelStartDate + " \n ";
		attrib = attrib + "travelEndDate " + travelEndDate + " \n ";
		attrib = attrib + "leadStatus " + leadStatus + " \n ";
		attrib = attrib + "resultReason " + resultReason + " \n ";
		attrib = attrib + "isQualified " + isQualified + " \n ";
		attrib = attrib + "isFlagged " + isFlagged + " \n ";
		attrib = attrib + "leadOwner " + leadOwner + " \n ";
		attrib = attrib + "Package " + landPackage + " \n ";
		
		attrib = attrib + "flight " + flight + " \n ";
		attrib = attrib + "hotel " + hotel + " \n ";
		attrib = attrib + "transfers " + transfers + " \n ";
		attrib = attrib + "sightseeing " + sightseeing + " \n ";
		attrib = attrib + "visa " + visa + " \n ";
		attrib = attrib + "insurance " + insurance + " \n ";
		attrib = attrib + "cruise " + cruise + " \n ";
		attrib = attrib + "leadCreationClientInformed " + leadCreationClientInformed + " \n ";
		
		return attrib;
	
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
