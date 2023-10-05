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
import com.udanchoo.intranet.entity.quotation.Udn_Manual_SightSeeing_Quotation_Entity;
import com.udanchoo.intranet.model.SightSeeingServiceLineVO;


@Entity
@Table(name = "udn_sts_service_line")
public class Udn_Deal_STS_SL_Entity  extends AuditModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false,name="stsServiceId", unique = true)
	private Long stsServiceId;
	
	private String sightSeeingName;
	
	private Date tourDate;
	
	
	private long serviceMapId;
	
	
	private int supplierId;

	private String remarks;
	private int status;
	private long sightSeeingId;
	private int adults;
	private int children;
	private int infants;
	private int transferType;
	private int cityId;
	private Long dealConfirmationId;

	private float serviceLineCost;
	private float markup;
	private int displayOrder;
	private boolean savedSightSeeing;
	
	
	
	public Udn_Deal_STS_SL_Entity(){}
	
	public Udn_Deal_STS_SL_Entity(SightSeeingServiceLineVO stsSLVO) {
		this.stsServiceId =stsSLVO.getStsServiceId();
		this.sightSeeingName=stsSLVO.getSightSeeingName();
		this.serviceMapId =stsSLVO.getServiceMapId();
		this.tourDate = stsSLVO.getTourDate();
		this.supplierId=stsSLVO.getSupplierId();
		this.remarks=stsSLVO.getRemarks();
		this.status=stsSLVO.getStatus();
		this.sightSeeingId=stsSLVO.getSightSeeingId();
		this.adults=stsSLVO.getAdults();
		this.children=stsSLVO.getChildren();
		this.infants=stsSLVO.getInfants();
		this.cityId = stsSLVO.getCityId();
		this.transferType = stsSLVO.getTransferType();
		this.dealConfirmationId = stsSLVO.getDealConfirmationId();
		this.serviceLineCost = stsSLVO.getServiceLineCost();
		this.infants=stsSLVO.getInfants();
		this.markup=stsSLVO.getMarkup();
		this.displayOrder=stsSLVO.getDisplayOrder();
		this.savedSightSeeing=stsSLVO.isSavedSightSeeing();

	}
	
	public Udn_Deal_STS_SL_Entity(Udn_Manual_SightSeeing_Quotation_Entity stsQtnEntity) {
		this.tourDate = stsQtnEntity.getSightSeeingDate();
		this.remarks=stsQtnEntity.getRemarks();
		this.sightSeeingId=stsQtnEntity.getSightSeeingId();
		this.sightSeeingName=stsQtnEntity.getSightSeeingName();
		this.adults=stsQtnEntity.getAdults();
		this.children=stsQtnEntity.getChildren();
		this.infants=stsQtnEntity.getInfant();
		this.cityId = stsQtnEntity.getCityId();
		this.transferType = stsQtnEntity.getTransferType();
		this.serviceLineCost = stsQtnEntity.getSightSeeingCost();
		this.displayOrder=stsQtnEntity.getDisplayOrder();
		this.markup=stsQtnEntity.getSightSeeingMarkup();
		this.savedSightSeeing=stsQtnEntity.isSavedSightSeeing();
		this.infants=stsQtnEntity.getInfant();
		this.displayOrder=stsQtnEntity.getDisplayOrder();

	}
	
	public String toString() {
		String attrib = "stsServiceId-> " +stsServiceId + "\n";
		attrib = attrib + " supplierId-> " +supplierId + "\n";
		attrib = attrib + " serviceMapId-> " + serviceMapId+ "\n";
		attrib = attrib + " tourDate-> " +tourDate + "\n";
		attrib = attrib + " remarks-> " + remarks+ "\n";
		attrib = attrib + " status-> " + status+ "\n";
		attrib = attrib + " sightSeeingId-> " + sightSeeingId+ "\n";
		attrib = attrib + "adults -> " + adults+ "\n";
		attrib = attrib + " children-> " + children+ "\n";
		attrib = attrib + " cityId-> " + cityId + "\n";
		attrib = attrib + " dealConfirmationId -> " + dealConfirmationId + "\n";
		attrib = attrib + " serviceLineCost -> " + serviceLineCost + "\n";

		return attrib;
	}
	
	public void setChildren(String children) {
		if(children!=null && children.trim().length()>0) {
			this.children = Integer.parseInt(children);
		}
		else {
			this.children = 0;
		}
	}

	public Long getStsServiceId() {
		return stsServiceId;
	}

	public void setStsServiceId(Long stsServiceId) {
		this.stsServiceId = stsServiceId;
	}

	public long getServiceMapId() {
		return serviceMapId;
	}

	public void setServiceMapId(long serviceMapId) {
		this.serviceMapId = serviceMapId;
	}

	public Date getTourDate() {
		return tourDate;
	}

	public void setTourDate(Date tourDate) {
		this.tourDate = tourDate;
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

	public long getSightSeeingId() {
		return sightSeeingId;
	}

	public void setSightSeeingId(long sightSeeingId) {
		this.sightSeeingId = sightSeeingId;
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

	public int getCityId() {
		return cityId;
	}

	public void setCityId(int cityId) {
		this.cityId = cityId;
	}

	public int getTransferType() {
		return transferType;
	}

	public void setTransferType(int transferType) {
		this.transferType = transferType;
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

	public boolean isSavedSightSeeing() {
		return savedSightSeeing;
	}

	public void setSavedSightSeeing(boolean savedSightSeeing) {
		this.savedSightSeeing = savedSightSeeing;
	}

	public int getInfants() {
		return infants;
	}

	public void setInfants(int infants) {
		this.infants = infants;
	}

	public String getSightSeeingName() {
		return sightSeeingName;
	}

	public void setSightSeeingName(String sightSeeingName) {
		this.sightSeeingName = sightSeeingName;
	}
	
	
	
	
}