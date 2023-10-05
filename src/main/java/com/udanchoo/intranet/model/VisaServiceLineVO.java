package com.udanchoo.intranet.model;

import java.sql.Date;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

import com.udanchoo.intranet.entity.Udn_Deal_VSA_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Doc_SL_Entity;

public class VisaServiceLineVO  {
   	
	
	private Long vsaServiceId;
	private int visaId;
	//private String visaId;
	private int profile;
	private String countryCode;
	private int consulateCity;
	private int visaType;
	private int visaPurpose;
	private Date travelStartDate;
	private Date travelReturnDate;
	private String passportNumber;
	private Date passportExpiryDate;
	private long serviceMapId;
	private String applicantName;
	private int supplierId;
	private int status;
	private float serviceLineCost;
	private float markup;
	private int displayOrder;
	
	private String remarks;
	private Set<Udn_Visa_Doc_SL_Obj> visaDocumentEntityList = new LinkedHashSet<Udn_Visa_Doc_SL_Obj>();

	
	private String statusName;
	private String supplierName;
	private String countryName;
	private Long dealConfirmationId;
	private java.util.Date createdAt;
	private String clientName;
	private String consulateCityName;
	
	private String visaTypeString;
	private String visaPurposeString;
	private String visaProfileString;
	
	private String serviceLineOwnerName;
	
	public String getServiceLineOwnerName() {
		return serviceLineOwnerName;
	}

	public void setServiceLineOwnerName(String serviceLineOwnerName) {
		this.serviceLineOwnerName = serviceLineOwnerName;
	}

	public VisaServiceLineVO() {}
	
	public VisaServiceLineVO(Udn_Deal_VSA_SL_Entity visaSLEntity) {
		this.vsaServiceId=visaSLEntity.getVsaServiceId();
		this.visaId=visaSLEntity.getVisaId();
		this.applicantName = visaSLEntity.getApplicantName();
		//this.profile=visaSLEntity.getProfile();
		this.countryCode=visaSLEntity.getCountryCode();
		//this.consulateCity = visaSLEntity.getConsulateCity();
		//this.visaType=visaSLEntity.getVisaType();
		//this.visaPurpose=visaSLEntity.getVisaPurpose();
		this.travelStartDate=visaSLEntity.getTravelStartDate();
		this.travelReturnDate=visaSLEntity.getTravelReturnDate();
		this.passportNumber = visaSLEntity.getPassportNumber();
		this.passportExpiryDate=visaSLEntity.getPassportExpiryDate();
		this.serviceMapId=visaSLEntity.getServiceMapId();
		this.supplierId=visaSLEntity.getSupplierId();
		this.remarks=visaSLEntity.getRemarks();
		this.status=visaSLEntity.getStatus();
		//this.visaDocumentEntityList = visaSLEntity.getVisaDocumentEntityList();
		this.dealConfirmationId=visaSLEntity.getDealConfirmationId();

		this.serviceLineCost = visaSLEntity.getServiceLineCost();
		this.markup = visaSLEntity.getMarkup();
		this.displayOrder=visaSLEntity.getDisplayOrder();
		this.createdAt=visaSLEntity.getCreatedAt();
	}
	
	public void updateVOFromEntity(Udn_Deal_VSA_SL_Entity visaSLEntity) {
		this.vsaServiceId=visaSLEntity.getVsaServiceId();
		this.visaId=visaSLEntity.getVisaId();
		this.applicantName = visaSLEntity.getApplicantName();
		//this.profile=visaSLEntity.getProfile();
		this.countryCode=visaSLEntity.getCountryCode();
		//this.consulateCity = visaSLEntity.getConsulateCity();
		//this.visaType=visaSLEntity.getVisaType();
		//this.visaPurpose=visaSLEntity.getVisaPurpose();
		this.travelStartDate=visaSLEntity.getTravelStartDate();
		this.travelReturnDate=visaSLEntity.getTravelReturnDate();
		this.passportNumber = visaSLEntity.getPassportNumber();
		this.passportExpiryDate=visaSLEntity.getPassportExpiryDate();
		this.serviceMapId=visaSLEntity.getServiceMapId();
		this.supplierId=visaSLEntity.getSupplierId();
		this.remarks=visaSLEntity.getRemarks();
		this.status=visaSLEntity.getStatus();
		//this.visaDocumentEntityList = visaSLEntity.getVisaDocumentEntityList();
		this.dealConfirmationId=visaSLEntity.getDealConfirmationId();

		this.serviceLineCost = visaSLEntity.getServiceLineCost();
		this.markup = visaSLEntity.getMarkup();
		this.displayOrder=visaSLEntity.getDisplayOrder();
		this.createdAt=visaSLEntity.getCreatedAt();
	}
	
	public String toString() {
		String attrib = " vsaServiceId -> " + vsaServiceId + "\n";
		attrib = attrib + " visaId -> " + visaId + "\n";
		attrib = attrib + " applicantName -> " + applicantName + "\n";
		attrib = attrib + " profile  -> " + profile + "\n";
		attrib = attrib + " countryCode -> " + countryCode + "\n";
		attrib = attrib + " consulateCity -> " + consulateCity + "\n";
		
		attrib = attrib + " countryName -> " + countryName + "\n";
		attrib = attrib + " visaType -> " + visaType + "\n";
		attrib = attrib + " visaPurpose -> " + visaPurpose + "\n";
		attrib = attrib + " travelStartDate -> " + travelStartDate + "\n";
		attrib = attrib + " travelReturnDate -> " + travelReturnDate + "\n";
		attrib = attrib + " passportNumber -> " + passportNumber + "\n";
		attrib = attrib + " passportExpiryDate -> " + passportExpiryDate + "\n";
		attrib = attrib + " serviceMapId -> " + serviceMapId + "\n";
		attrib = attrib + " supplierId -> " + supplierId + "\n";
		attrib = attrib + " supplierName -> " + supplierName + "\n";
		attrib = attrib + " remarks -> " + remarks + "\n";
		attrib = attrib + " status -> " + status + "\n";
		attrib = attrib + " statusName -> " + statusName + "\n";
		attrib = attrib + " visaDocumentEntityList -> " + visaDocumentEntityList + "\n";

		attrib = attrib + " dealConfirmationId -> " + dealConfirmationId + "\n";
		attrib = attrib + " serviceLineCost -> " + serviceLineCost + "\n";
		attrib = attrib + " createdAt -> " + createdAt + "\n";
		return attrib;
	}
	
	
	
	
	
	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public Long getVsaServiceId() {
		return vsaServiceId;
	}

	public void setVsaServiceId(Long vsaServiceId) {
		this.vsaServiceId = vsaServiceId;
	}

	public int getVisaId() {
		return visaId;
	}

	public void setVisaId(int visaId) {
		this.visaId = visaId;
	}

	

	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	
	

	public Date getTravelReturnDate() {
		return travelReturnDate;
	}

	public void setTravelReturnDate(Date travelReturnDate) {
		this.travelReturnDate = travelReturnDate;
	}

	public Date getPassportExpiryDate() {
		return passportExpiryDate;
	}

	public void setPassportExpiryDate(Date passportExpiryDate) {
		this.passportExpiryDate = passportExpiryDate;
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

	public Set<Udn_Visa_Doc_SL_Obj> getVisaDocumentEntityList() {
		return visaDocumentEntityList;
	}

	public void setVisaDocumentEntityList(Set<Udn_Visa_Doc_SL_Obj> visaDocumentEntityList) {
		this.visaDocumentEntityList = visaDocumentEntityList;
	}

	public String getApplicantName() {
		return applicantName;
	}

	public void setApplicantName(String applicantName) {
		this.applicantName = applicantName;
	}

	public String getPassportNumber() {
		return passportNumber;
	}

	public void setPassportNumber(String passportNumber) {
		this.passportNumber = passportNumber;
	}

	public String getCountryName() {
		return countryName;
	}

	public void setCountryName(String countryName) {
		this.countryName = countryName;
	}

	public Long getDealConfirmationId() {
		return dealConfirmationId;
	}

	public void setDealConfirmationId(Long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}


	public java.util.Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(java.util.Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public Date getTravelStartDate() {
		return travelStartDate;
	}

	public void setTravelStartDate(Date travelStartDate) {
		this.travelStartDate = travelStartDate;
	}

	public float getServiceLineCost() {
		return serviceLineCost;
	}

	public void setServiceLineCost(float serviceLineCost) {
		this.serviceLineCost = serviceLineCost;
	}

	public int getConsulateCity() {
		return consulateCity;
	}

	public void setConsulateCity(int consulateCity) {
		this.consulateCity = consulateCity;
	}

	public int getProfile() {
		return profile;
	}

	public void setProfile(int profile) {
		this.profile = profile;
	}

	public int getVisaType() {
		return visaType;
	}

	public void setVisaType(int visaType) {
		this.visaType = visaType;
	}

	public int getVisaPurpose() {
		return visaPurpose;
	}

	public void setVisaPurpose(int visaPurpose) {
		this.visaPurpose = visaPurpose;
	}

	public String getConsulateCityName() {
		return consulateCityName;
	}

	public void setConsulateCityName(String consulateCityName) {
		this.consulateCityName = consulateCityName;
	}

	public String getVisaTypeString() {
		return visaTypeString;
	}

	public void setVisaTypeString(String visaTypeString) {
		this.visaTypeString = visaTypeString;
	}

	public String getVisaPurposeString() {
		return visaPurposeString;
	}

	public void setVisaPurposeString(String visaPurposeString) {
		this.visaPurposeString = visaPurposeString;
	}

	public String getVisaProfileString() {
		return visaProfileString;
	}

	public void setVisaProfileString(String visaProfileString) {
		this.visaProfileString = visaProfileString;
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