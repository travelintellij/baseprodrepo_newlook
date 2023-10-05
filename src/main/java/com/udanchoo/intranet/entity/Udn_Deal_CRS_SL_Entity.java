package com.udanchoo.intranet.entity;

import java.sql.Date;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.udanchoo.intranet.entity.Udn_Deal_HTL_SL_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Cruise_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Transfer_Quotation_Entity;
import com.udanchoo.intranet.model.CruiseServiceLineVO;
import com.udanchoo.intranet.model.SightSeeingServiceLineVO;
import com.udanchoo.intranet.model.TransferServiceLineVO;


@Entity
@Table(name = "udn_crs_service_line")
public class Udn_Deal_CRS_SL_Entity  extends AuditModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false,name="crsServiceId", unique = true)
	private Long crsServiceId;
	
	private Date cruiseStartDate;
	private Date cruiseEndDate;
	private long serviceMapId;
	private int supplierId;
	private String remarks;
	private int status;
	private int adults;
	private int children;
	private int infants;
	private int cityId;
	private Long dealConfirmationId;
	private float serviceLineCost;
	private float markup;
	private int displayOrder;


	private int cruiseProvider;
	private String childrenAgeInfo;
	private int noOfDecks;	
	private int stateRoomType;
	private String cruiseName;
	
	public Udn_Deal_CRS_SL_Entity(){}
	
	public Udn_Deal_CRS_SL_Entity(CruiseServiceLineVO crsSLVO) {
		this.crsServiceId = crsSLVO.getCrsServiceId();
		this.cruiseStartDate=crsSLVO.getCruiseStartDate();
		this.cruiseEndDate=crsSLVO.getCruiseEndDate();
		this.serviceMapId=crsSLVO.getServiceMapId();
		this.supplierId=crsSLVO.getSupplierId();
		this.remarks=crsSLVO.getRemarks();
		this.status=crsSLVO.getStatus();
		this.adults=crsSLVO.getAdults();
		this.children=crsSLVO.getChildren();
		this.infants=crsSLVO.getInfants();
		this.cityId=crsSLVO.getCityId();
		this.dealConfirmationId = crsSLVO.getDealConfirmationId();
		this.serviceLineCost=crsSLVO.getServiceLineCost();
		this.markup=crsSLVO.getMarkup();
		this.displayOrder=crsSLVO.getDisplayOrder();
		this.cruiseProvider=crsSLVO.getCruiseProvider();
		this.childrenAgeInfo=crsSLVO.getChildrenAgeInfo();
		this.noOfDecks=crsSLVO.getNoOfDecks();	
		this.stateRoomType=crsSLVO.getStateRoomType();
		this.cruiseName=crsSLVO.getCruiseName();
	}
	
	public Udn_Deal_CRS_SL_Entity(Udn_Manual_Cruise_Quotation_Entity cruiseQtnEntity) {
		this.cruiseStartDate=cruiseQtnEntity.getSailingStartDate();
		this.cruiseEndDate=cruiseQtnEntity.getSailingEndDate();
		this.cruiseProvider=cruiseQtnEntity.getCruiseProvider();
		this.remarks=cruiseQtnEntity.getRemarks();
		this.adults=cruiseQtnEntity.getAdults();
		this.children=cruiseQtnEntity.getChildren();
		this.cityId=cruiseQtnEntity.getCityId();
		this.serviceLineCost=cruiseQtnEntity.getCruiseStayCost();
		this.markup=cruiseQtnEntity.getCruiseStayMarkup();
		this.displayOrder=cruiseQtnEntity.getDisplayOrder();
		this.childrenAgeInfo=cruiseQtnEntity.getChildrenAgeInfo();
		this.cruiseName= cruiseQtnEntity.getCruiseName();
		this.stateRoomType=cruiseQtnEntity.getStateRoomType();
		this.displayOrder=cruiseQtnEntity.getDisplayOrder();
		this.cruiseProvider=cruiseQtnEntity.getCruiseProvider();
		this.noOfDecks=cruiseQtnEntity.getNoOfDecks();
	}

	public Long getCrsServiceId() {
		return crsServiceId;
	}

	public void setCrsServiceId(Long crsServiceId) {
		this.crsServiceId = crsServiceId;
	}

	public Date getCruiseStartDate() {
		return cruiseStartDate;
	}

	public void setCruiseStartDate(Date cruiseStartDate) {
		this.cruiseStartDate = cruiseStartDate;
	}

	public Date getCruiseEndDate() {
		return cruiseEndDate;
	}

	public void setCruiseEndDate(Date cruiseEndDate) {
		this.cruiseEndDate = cruiseEndDate;
	}

	public long getServiceMapId() {
		return serviceMapId;
	}

	public void setServiceMapId(long serviceMapId) {
		this.serviceMapId = serviceMapId;
	}

	public int getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(int supplierId) {
		this.supplierId = supplierId;
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

	public int getInfants() {
		return infants;
	}

	public void setInfants(int infants) {
		this.infants = infants;
	}

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public Long getDealConfirmationId() {
		return dealConfirmationId;
	}

	public void setDealConfirmationId(Long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}

	public float getServiceLineCost() {
		return serviceLineCost;
	}

	public void setServiceLineCost(float serviceLineCost) {
		this.serviceLineCost = serviceLineCost;
	}

	public float getMarkup() {
		return markup;
	}

	public void setMarkup(float markup) {
		this.markup = markup;
	}

	public int getDisplayOrder() {
		return displayOrder;
	}

	public void setDisplayOrder(int displayOrder) {
		this.displayOrder = displayOrder;
	}

	public int getCruiseProvider() {
		return cruiseProvider;
	}

	public void setCruiseProvider(int cruiseProvider) {
		this.cruiseProvider = cruiseProvider;
	}

	public String getChildrenAgeInfo() {
		return childrenAgeInfo;
	}

	public void setChildrenAgeInfo(String childrenAgeInfo) {
		this.childrenAgeInfo = childrenAgeInfo;
	}

	public int getNoOfDecks() {
		return noOfDecks;
	}

	public void setNoOfDecks(int noOfDecks) {
		this.noOfDecks = noOfDecks;
	}

	public int getStateRoomType() {
		return stateRoomType;
	}

	public void setStateRoomType(int stateRoomType) {
		this.stateRoomType = stateRoomType;
	}

	public String getCruiseName() {
		return cruiseName;
	}

	public void setCruiseName(String cruiseName) {
		this.cruiseName = cruiseName;
	}

	@Override
	public String toString() {
		return "Udn_Deal_CRS_SL_Entity [crsServiceId=" + crsServiceId + ", cruiseStartDate=" + cruiseStartDate
				+ ", cruiseEndDate=" + cruiseEndDate + ", serviceMapId=" + serviceMapId + ", supplierId=" + supplierId
				+ ", remarks=" + remarks + ", status=" + status + ", adults=" + adults + ", children=" + children
				+ ", infants=" + infants + ", cityId=" + cityId + ", dealConfirmationId=" + dealConfirmationId
				+ ", serviceLineCost=" + serviceLineCost + ", markup=" + markup + ", displayOrder=" + displayOrder
				+ ", cruiseProvider=" + cruiseProvider + ", childrenAgeInfo=" + childrenAgeInfo + ", noOfDecks="
				+ noOfDecks + ", stateRoomType=" + stateRoomType + ", cruiseName=" + cruiseName + "]";
	}

	
	
	
	
	
	
	
}