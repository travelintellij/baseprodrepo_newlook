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
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Transfer_Quotation_Entity;
import com.udanchoo.intranet.model.SightSeeingServiceLineVO;
import com.udanchoo.intranet.model.TransferServiceLineVO;


@Entity
@Table(name = "udn_trn_service_line")
public class Udn_Deal_TRN_SL_Entity  extends AuditModel {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false,name="trnServiceId", unique = true)
	private Long trnServiceId;
	
	private Date transferDate;
	private long serviceMapId;
	private int supplierId;
	private String remarks;
	private int status;
	private int adults;
	private int children;
	private int infants;
	private int transferType;
	private int pickupCityId;
	private int dropCityId;
	private int pickUpFrom;
	private String pickUpFromName;
	private int dropTo;
	private String dropToName;
	private Long dealConfirmationId;
	private float serviceLineCost;
	private float markup;
	private int displayOrder;

	
	
	public Udn_Deal_TRN_SL_Entity(){}
	
	public Udn_Deal_TRN_SL_Entity(TransferServiceLineVO trnSLVO) {
		this.trnServiceId = trnSLVO.getTrnServiceId();
		this.transferDate=trnSLVO.getTransferDate();
		this.serviceMapId=trnSLVO.getServiceMapId();
		this.supplierId=trnSLVO.getSupplierId();
		this.remarks=trnSLVO.getRemarks();
		this.status=trnSLVO.getStatus();
		this.adults=trnSLVO.getAdults();
		this.children=trnSLVO.getChildren();
		this.transferType=trnSLVO.getTransferType();
		this.pickupCityId=trnSLVO.getPickupCityId();
		this.dropCityId=trnSLVO.getDropCityId();
		this.pickUpFrom=trnSLVO.getPickUpFrom();
		this.pickUpFromName=trnSLVO.getPickUpFromName();
		this.dropTo=trnSLVO.getDropTo();
		this.dropToName=trnSLVO.getDropToName();
		this.dealConfirmationId = trnSLVO.getDealConfirmationId();
		this.serviceLineCost=trnSLVO.getServiceLineCost();
		this.markup=trnSLVO.getMarkup();
		this.infants=trnSLVO.getInfants();
		this.displayOrder=trnSLVO.getDisplayOrder();
	}
	
	public Udn_Deal_TRN_SL_Entity(Udn_Manual_Transfer_Quotation_Entity transfersQtnEntity) {
		this.transferDate=transfersQtnEntity.getTransferDate();
		this.remarks=transfersQtnEntity.getRemarks();
		this.adults=transfersQtnEntity.getAdults();
		this.children=transfersQtnEntity.getChildren();
		this.transferType=transfersQtnEntity.getTransferType();
		this.pickupCityId=transfersQtnEntity.getPickUpCityId();
		this.dropCityId=transfersQtnEntity.getDropToCityId();
		this.pickUpFrom=transfersQtnEntity.getPickUpFrom();
		this.pickUpFromName=transfersQtnEntity.getPickUpFromName();
		this.dropTo=transfersQtnEntity.getDropTo();
		this.dropToName=transfersQtnEntity.getDropToName();
		//this.serviceLineOwner = trnSLVO.getServiceLineOwner();
		this.serviceLineCost=transfersQtnEntity.getTransferCost();
		this.markup=transfersQtnEntity.getTransferMarkup();
		this.infants=transfersQtnEntity.getInfant();
		this.displayOrder=transfersQtnEntity.getDisplayOrder();
	}

	public String toString() {
		String attrib = "trnServiceId-> " +trnServiceId + "\n";
		attrib = attrib + " tourDate-> " +transferDate + "\n";
		attrib = attrib + " serviceMapId-> " + serviceMapId+ "\n";
		attrib = attrib + " supplierId-> " +supplierId + "\n";
		attrib = attrib + " remarks-> " + remarks+ "\n";
		attrib = attrib + " status-> " + status+ "\n";
		attrib = attrib + "adults -> " + adults+ "\n";
		attrib = attrib + " children-> " + children+ "\n";
		attrib = attrib + " pickupCityId-> " + pickupCityId + "\n";
		attrib = attrib + " dropCityId-> " + dropCityId + "\n";
		attrib = attrib + " transferType-> " + transferType + "\n";
		attrib = attrib + "pickUpFrom -> " + pickUpFrom+ "\n";
		attrib = attrib + " pickUpFromName-> " + pickUpFromName+ "\n";
		attrib = attrib + " dropTo-> " + dropTo + "\n";
		attrib = attrib + " dropToName-> " + dropToName + "\n";
		attrib = attrib + " dealConfirmationId-> " + dealConfirmationId + "\n";
		attrib = attrib + " serviceLineCost-> " + serviceLineCost+ "\n";
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

	public Long getTrnServiceId() {
		return trnServiceId;
	}

	public void setTrnServiceId(Long trnServiceId) {
		this.trnServiceId = trnServiceId;
	}

	public Date getTransferDate() {
		return transferDate;
	}

	public void setTransferDate(Date transferDate) {
		this.transferDate = transferDate;
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

	public int getTransferType() {
		return transferType;
	}

	public void setTransferType(int transferType) {
		this.transferType = transferType;
	}

	
	public int getPickUpFrom() {
		return pickUpFrom;
	}

	public void setPickUpFrom(int pickUpFrom) {
		this.pickUpFrom = pickUpFrom;
	}

	public String getPickUpFromName() {
		return pickUpFromName;
	}

	public void setPickUpFromName(String pickUpFromName) {
		this.pickUpFromName = pickUpFromName;
	}

	public int getDropTo() {
		return dropTo;
	}

	public void setDropTo(int dropTo) {
		this.dropTo = dropTo;
	}

	public String getDropToName() {
		return dropToName;
	}

	public void setDropToName(String dropToName) {
		this.dropToName = dropToName;
	}

	public int getPickupCityId() {
		return pickupCityId;
	}

	public void setPickupCityId(int pickupCityId) {
		this.pickupCityId = pickupCityId;
	}

	public int getDropCityId() {
		return dropCityId;
	}

	public void setDropCityId(int dropCityId) {
		this.dropCityId = dropCityId;
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

	public int getInfants() {
		return infants;
	}

	public void setInfants(int infants) {
		this.infants = infants;
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

	public void setChildren(int children) {
		this.children = children;
	}


	
	
	
	
}