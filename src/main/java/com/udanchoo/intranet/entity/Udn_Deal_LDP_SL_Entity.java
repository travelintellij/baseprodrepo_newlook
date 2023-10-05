package com.udanchoo.intranet.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.udanchoo.intranet.entity.quotation.Udn_Manual_Package_Quotation_Entity;
import com.udanchoo.intranet.model.LandPackageServiceLineVO;

@Entity
@Table(name = "udn_ldp_service_line")
public class Udn_Deal_LDP_SL_Entity extends AuditModel {
   	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false,name="ldpServiceId", unique = true)
	private Long ldpServiceId;

	private long serviceMapId;
	private Long dealConfirmationId;
	private int destinationId;
	private int adults;
	private int children;
	private int infants;
	private Date startDate;
	private Date endDate;
	private Date holdingDate;
	private long supplierId;
	private String packageName;
	private String packageType;
	private String packageDetails;
	private String inclusions;
	private String exclusions;
	private String cancellationPolicy;
	private String remarks;
	private int status;
	private float serviceLineCost;
	private float serviceLineMarkup;
	private int displayOrder;
	
	public Udn_Deal_LDP_SL_Entity(){}
	public Udn_Deal_LDP_SL_Entity(LandPackageServiceLineVO lpServiceLineVo){
		this.ldpServiceId = lpServiceLineVo.getLdpServiceId();
		this.serviceMapId= lpServiceLineVo.getServiceMapId();
		this.dealConfirmationId= lpServiceLineVo.getDealConfirmationId();
		this.supplierId= lpServiceLineVo.getSupplierId();
		this.destinationId= lpServiceLineVo.getDestinationId();
		this.adults= lpServiceLineVo.getAdults();
		this.children= lpServiceLineVo.getChildren();
		this.infants = lpServiceLineVo.getInfants();
		this.startDate= lpServiceLineVo.getStartDate();
		this.endDate= lpServiceLineVo.getEndDate();
		this.holdingDate= lpServiceLineVo.getHoldingDate();
		this.packageName= lpServiceLineVo.getPackageName();
		this.packageType= lpServiceLineVo.getPackageType();
		this.packageDetails= lpServiceLineVo.getPackageDetails();
		this.inclusions=lpServiceLineVo.getInclusions();
		this.exclusions = lpServiceLineVo.getExclusions();
		this.cancellationPolicy = lpServiceLineVo.getCancellationPolicy();
		this.remarks= lpServiceLineVo.getRemarks();
		this.status= lpServiceLineVo.getStatus();
		this.serviceLineCost = lpServiceLineVo.getServiceLineCost();
		this.serviceLineMarkup=lpServiceLineVo.getServiceLineMarkup();
		this.displayOrder=lpServiceLineVo.getDisplayOrder();
	}
	
	
	public Udn_Deal_LDP_SL_Entity(Udn_Manual_Package_Quotation_Entity packageEntity) {
		this.destinationId= packageEntity.getCityId();
		this.adults= packageEntity.getAdults();
		this.children= packageEntity.getChildren();
		this.infants=packageEntity.getInfant();
		this.startDate= packageEntity.getStartDate();
		this.endDate= packageEntity.getEndDate();
		this.packageName= packageEntity.getPackageName();
		this.packageDetails= packageEntity.getPackageDescription();
		this.inclusions=packageEntity.getInclusions();
		this.exclusions = packageEntity.getExclusions();
		this.cancellationPolicy = packageEntity.getCancellationPolicy();
		this.remarks= packageEntity.getRemarks();
		//this.status= packageEntity.getStatus();
		this.serviceLineCost = packageEntity.getPkgCost();
		this.serviceLineMarkup = packageEntity.getPkgMarkup();
		this.displayOrder = packageEntity.getDisplayOrder();
	}
	public String toString() {
		String attrib = "**** Displaying UDN_DEAL_LDP_ENTITY **** :- \n";
		attrib = attrib + " ldpServiceId-> " +ldpServiceId+ "\n";
		attrib = attrib + " supplierId-> " +supplierId + "\n";
		attrib = attrib + " serviceMapId-> " + serviceMapId+ "\n";
		attrib = attrib + " dealConfirmationId-> " +dealConfirmationId + "\n";
		attrib = attrib + " destinationId-> " + destinationId+ "\n";
		attrib = attrib + " adults-> " + adults+ "\n";
		attrib = attrib + " children-> " + children+ "\n";
		attrib = attrib + " startDate-> " + startDate+ "\n";
		attrib = attrib + " endDate-> " + endDate+ "\n";
		attrib = attrib + " holdingDate-> " + holdingDate+ "\n";
		attrib = attrib + "packageName -> " + packageName+ "\n";
		attrib = attrib + " packageType-> " + packageType+ "\n";
		attrib = attrib + " packageDetails-> " + packageDetails+ "\n";
		attrib = attrib + " exclusions-> " + exclusions+ "\n";
		attrib = attrib + " cancellationPolicy-> " + cancellationPolicy+ "\n";
		attrib = attrib + " remarks-> " + remarks + "\n";
		attrib = attrib + " status -> " + status + "\n";
		attrib = attrib + " serviceLineCost -> " + serviceLineCost + "\n";
		
		return attrib;
	}
	
	
	
	
	public int getInfants() {
		return infants;
	}
	public void setInfants(int infants) {
		this.infants = infants;
	}
	public String getCancellationPolicy() {
		return cancellationPolicy;
	}
	public void setCancellationPolicy(String cancellationPolicy) {
		this.cancellationPolicy = cancellationPolicy;
	}
	public Long getLdpServiceId() {
		return ldpServiceId;
	}
	public void setLdpServiceId(Long ldpServiceId) {
		this.ldpServiceId = ldpServiceId;
	}
	public long getServiceMapId() {
		return serviceMapId;
	}
	public void setServiceMapId(long serviceMapId) {
		this.serviceMapId = serviceMapId;
	}
	public Long getDealConfirmationId() {
		return dealConfirmationId;
	}
	public void setDealConfirmationId(Long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}
	public int getDestinationId() {
		return destinationId;
	}
	public void setDestinationId(int destinationId) {
		this.destinationId = destinationId;
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
	
	
	
	public Date getHoldingDate() {
		return holdingDate;
	}
	public void setHoldingDate(Date holdingDate) {
		this.holdingDate = holdingDate;
	}
	public long getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(long supplierId) {
		this.supplierId = supplierId;
	}
	public String getPackageName() {
		return packageName;
	}
	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}
	public String getPackageType() {
		return packageType;
	}
	public void setPackageType(String packageType) {
		this.packageType = packageType;
	}
	
	public String getPackageDetails() {
		return packageDetails;
	}
	public void setPackageDetails(String packageDetails) {
		this.packageDetails = packageDetails;
	}
	
	
	
	public String getExclusions() {
		return exclusions;
	}
	public void setExclusions(String exclusions) {
		this.exclusions = exclusions;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}

	public float getServiceLineCost() {
		return serviceLineCost;
	}
	public void setServiceLineCost(float serviceLineCost) {
		this.serviceLineCost = serviceLineCost;
	}
	public float getServiceLineMarkup() {
		return serviceLineMarkup;
	}
	public void setServiceLineMarkup(float serviceLineMarkup) {
		this.serviceLineMarkup = serviceLineMarkup;
	}
	public int getDisplayOrder() {
		return displayOrder;
	}
	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}
	public String getInclusions() {
		return inclusions;
	}
	public void setInclusions(String inclusions) {
		this.inclusions = inclusions;
	}
	
		
	
}