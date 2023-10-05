package com.udanchoo.intranet.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.udanchoo.intranet.entity.quotation.Udn_Manual_Other_Quotation_Entity;
import com.udanchoo.intranet.model.OtherServiceLineVO;

@Entity
@Table(name = "udn_oth_service_line")
public class Udn_Deal_OTH_SL_Entity extends AuditModel {
   
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false,name="othServiceId", unique = true)
	private long othServiceId;
	
	private long serviceMapId;
	private long dealConfirmationId;
	private long supplierId;

	private String serviceName;
	private String serviceType;
	private String serviceDetails;
	private Date serviceDate;
	private String remarks;
	private int status;
	//private long serviceLineOwner;
	private float serviceLineCost;
	private float markup;
	private int displayOrder;

	public String toString() {
		String attrib = " Other Serrvice VO " + "\n";
		attrib = attrib + " othServiceId -> " + this.othServiceId +"\n"; 
		attrib = attrib + " serviceMapId -> " + this.serviceMapId +"\n";
		attrib = attrib + "dealConfirmationId -> " + this.dealConfirmationId +"\n";
		attrib = attrib + "supplierId -> " + this.supplierId +"\n";
		attrib = attrib + "serviceName -> " + this.serviceName +"\n";
		attrib = attrib + "serviceType -> " + this.serviceType +"\n";
		attrib = attrib + "serviceDetails -> " + this.serviceDetails +"\n";
		attrib = attrib + " serviceDate -> " + this.serviceDate +"\n";
		attrib = attrib + " remarks -> " + this.remarks +"\n";
		attrib = attrib + "status " + this.status +"\n";

		attrib = attrib + "serviceLineCost " + this.serviceLineCost+"\n";
		
		return attrib;
	}

	public Udn_Deal_OTH_SL_Entity() {}
	
	public Udn_Deal_OTH_SL_Entity(OtherServiceLineVO othSLVO){
		this.othServiceId = othSLVO.getOthServiceId();
		this.serviceMapId= othSLVO.getServiceMapId();
		this.dealConfirmationId= othSLVO.getDealConfirmationId();
		this.supplierId= othSLVO.getSupplierId();
		this.serviceName= othSLVO.getServiceName();
		this.serviceType= othSLVO.getServiceType();
		this.serviceDetails= othSLVO.getServiceDetails();
		this.serviceDate= othSLVO.getServiceDate();
		this.remarks= othSLVO.getRemarks();
		this.status= othSLVO.getStatus();
		this.markup=othSLVO.getMarkup();
		this.serviceLineCost =  othSLVO.getServiceLineCost();
		this.displayOrder=othSLVO.getDisplayOrder();

	}
	
	public Udn_Deal_OTH_SL_Entity(Udn_Manual_Other_Quotation_Entity othersEntity) {
		this.serviceName= othersEntity.getServiceName();
		this.serviceType= othersEntity.getServiceDetails();
		this.serviceDetails= othersEntity.getServiceDetails();
		this.serviceDate= othersEntity.getServiceDate();
		this.serviceLineCost =  othersEntity.getServiceCost();
		this.markup=othersEntity.getServiceMarkup();
		this.displayOrder=othersEntity.getDisplayOrder();
	}

	public long getOthServiceId() {
		return othServiceId;
	}

	public void setOthServiceId(long othServiceId) {
		this.othServiceId = othServiceId;
	}

	public long getServiceMapId() {
		return serviceMapId;
	}

	public void setServiceMapId(long serviceMapId) {
		this.serviceMapId = serviceMapId;
	}

	public long getDealConfirmationId() {
		return dealConfirmationId;
	}

	public void setDealConfirmationId(long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}

	public long getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(long supplierId) {
		this.supplierId = supplierId;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getServiceType() {
		return serviceType;
	}

	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}

	public String getServiceDetails() {
		return serviceDetails;
	}

	public void setServiceDetails(String serviceDetails) {
		this.serviceDetails = serviceDetails;
	}

	public Date getServiceDate() {
		return serviceDate;
	}

	public void setServiceDate(Date serviceDate) {
		this.serviceDate = serviceDate;
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
	

	

	
}