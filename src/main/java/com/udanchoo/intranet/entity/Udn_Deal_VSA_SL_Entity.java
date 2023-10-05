package com.udanchoo.intranet.entity;

import java.sql.Date;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.validation.Valid;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Visa_Quotation_Entity;
import com.udanchoo.intranet.model.FlightServiceLineVO;
import com.udanchoo.intranet.model.HotelServiceLineVO;
import com.udanchoo.intranet.model.VisaServiceLineVO;

@Entity
@Table(name = "udn_vsa_service_line")
public class Udn_Deal_VSA_SL_Entity extends AuditModel {
   	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false,name="vsaServiceId", unique = true)
	private Long vsaServiceId;
	
	private int visaId;
	//private String visaId;
	private String applicantName;
	//private String profile;
	private String countryCode;
	//private int consulateCity;
	//private String visaType;
	//private String visaPurpose;
	private Date travelStartDate;
	private Date travelReturnDate;
	private String passportNumber;
	private Date passportExpiryDate;
	private long serviceMapId;
	private int supplierId;
	private String remarks;
	private int status;
	private Long dealConfirmationId;
	//private int serviceLineOwner;
	private float serviceLineCost;
	private float markup;
	private int displayOrder;
	
	
	@OneToMany(cascade = CascadeType.ALL,fetch = FetchType.LAZY,mappedBy = "vsaServiceId")
	@JsonBackReference
	@OrderBy("vsaDocServiceId ASC")
    private Set<Udn_Visa_Doc_SL_Entity> visaDocumentEntityList = new HashSet<Udn_Visa_Doc_SL_Entity>();

	
    public Udn_Deal_VSA_SL_Entity() {}
    
    public void updateFromVO(VisaServiceLineVO visaSLObj) {
    	this.vsaServiceId=visaSLObj.getVsaServiceId();
		this.visaId=visaSLObj.getVisaId();
		this.applicantName = visaSLObj.getApplicantName();
		//this.profile=visaSLObj.getProfile();
		this.countryCode=visaSLObj.getCountryCode();
		//this.consulateCity =visaSLObj.getConsulateCity(); 
		//this.visaType=visaSLObj.getVisaType();
		//this.visaPurpose=visaSLObj.getVisaPurpose();
		this.travelStartDate=visaSLObj.getTravelStartDate();
		this.travelReturnDate=visaSLObj.getTravelReturnDate();
		this.passportNumber = visaSLObj.getPassportNumber();
		this.passportExpiryDate=visaSLObj.getPassportExpiryDate();
		this.serviceMapId=visaSLObj.getServiceMapId();
		this.supplierId=visaSLObj.getSupplierId();
		this.remarks=visaSLObj.getRemarks();
		this.status=visaSLObj.getStatus();
		this.dealConfirmationId=visaSLObj.getDealConfirmationId();
		//this.serviceLineOwner = visaSLObj.getServiceLineOwner();
		this.serviceLineCost = visaSLObj.getServiceLineCost();
		this.markup=visaSLObj.getMarkup();
		this.displayOrder=visaSLObj.getDisplayOrder();
		//this.visaDocumentEntityList = visaSLObj.getVisaDocumentEntityList();
		
	}
	public Udn_Deal_VSA_SL_Entity(VisaServiceLineVO visaSLObj) {
		this.vsaServiceId=visaSLObj.getVsaServiceId();
		this.visaId=visaSLObj.getVisaId();
		this.applicantName = visaSLObj.getApplicantName();
		//this.profile=visaSLObj.getProfile();
		this.countryCode=visaSLObj.getCountryCode();
		//this.consulateCity = visaSLObj.getConsulateCity();
		//this.visaType=visaSLObj.getVisaType();
		//this.visaPurpose=visaSLObj.getVisaPurpose();
		this.travelStartDate=visaSLObj.getTravelStartDate();
		this.travelReturnDate=visaSLObj.getTravelReturnDate();
		this.passportNumber = visaSLObj.getPassportNumber();
		this.passportExpiryDate=visaSLObj.getPassportExpiryDate();
		this.serviceMapId=visaSLObj.getServiceMapId();
		this.supplierId=visaSLObj.getSupplierId();
		this.remarks=visaSLObj.getRemarks();
		this.status=visaSLObj.getStatus();
		this.dealConfirmationId=visaSLObj.getDealConfirmationId();
		//this.serviceLineOwner = visaSLObj.getServiceLineOwner();
		this.serviceLineCost = visaSLObj.getServiceLineCost();
		this.markup=visaSLObj.getMarkup();
		this.displayOrder=visaSLObj.getDisplayOrder();

		//this.visaDocumentEntityList = visaSLObj.getVisaDocumentEntityList();
		
	}
	
	
	public Udn_Deal_VSA_SL_Entity(Udn_Manual_Visa_Quotation_Entity visaQtnEntity) {
		this.visaId=visaQtnEntity.getVisaQuotationEntity().getVisaId();
		//this.applicantName = visaQtnEntity.getApplicantName();
		//this.profile=visaSLObj.getProfile();
		this.countryCode=visaQtnEntity.getVisaQuotationEntity().getCountryCode();
		//this.consulateCity =visaSLObj.getConsulateCity(); 
		//this.visaType=visaSLObj.getVisaType();
		//this.visaPurpose=visaSLObj.getVisaPurpose();
		this.travelStartDate=visaQtnEntity.getQuotationEntity().getLeadEntity().getTravelStartDate();
		this.travelReturnDate=visaQtnEntity.getQuotationEntity().getLeadEntity().getTravelEndDate();
		//this.passportNumber = visaQtnEntity.getQuotationEntity().getLeadEntity().getContactId().
		//this.passportExpiryDate=visaQtnEntity.getPassportExpiryDate();
		//this.serviceMapId=visaQtnEntity.getServiceMapId();
		//this.supplierId=visaQtnEntity.getSupplierId();
		this.remarks=visaQtnEntity.getRemarks();
		//this.status=visaQtnEntity.getStatus();
		//this.dealConfirmationId=visaQtnEntity.get
		//this.serviceLineCost = visaQtnEntity.getVisaCost();
		//this.markup=visaQtnEntity.getVisaMarkup();
		//this.visaDocumentEntityList = visaSLObj.getVisaDocumentEntityList();
	}

	public String toString() {
		String attrib = "Displaying DEAL_VSA_SL_ENTITY : " + "\n";
		attrib = attrib + " vsaServiceId -> " + vsaServiceId + "\n";
		attrib = attrib + " visaId -> " + visaId + "\n";
		attrib = attrib + " applicantName -> " + applicantName + "\n";
		//attrib = attrib + " profile  -> " + profile + "\n";
		attrib = attrib + " countryCode -> " + countryCode + "\n";
		//attrib = attrib + " consulateCity -> " + consulateCity + "\n";
		//attrib = attrib + " visaType -> " + visaType + "\n";
		//attrib = attrib + " visaPurpose -> " + visaPurpose + "\n";
		attrib = attrib + " travelStartDate -> " + travelStartDate + "\n";
		attrib = attrib + " travelReturnDate -> " + travelReturnDate + "\n";
		attrib = attrib + " passportNumber -> " + passportNumber + "\n";
		attrib = attrib + " passportExpiryDate -> " + passportExpiryDate + "\n";
		attrib = attrib + " serviceMapId -> " + serviceMapId + "\n";
		attrib = attrib + " supplierId -> " + supplierId + "\n";
		attrib = attrib + " remarks -> " + remarks + "\n";
		attrib = attrib + " status -> " + status + "\n";
		attrib = attrib + " visaDocumentEntityList -> " + visaDocumentEntityList.size() + "\n";
		attrib = attrib + " dealConfirmationId -> " + dealConfirmationId + "\n";
		attrib = attrib + " serviceLineCost -> " + serviceLineCost + "\n";
		
		return attrib;
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

	public Set<Udn_Visa_Doc_SL_Entity> getVisaDocumentEntityList() {
		return visaDocumentEntityList;
	}

	public void setVisaDocumentEntityList(Set<Udn_Visa_Doc_SL_Entity> visaDocumentEntityList) {
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

	public Long getDealConfirmationId() {
		return dealConfirmationId;
	}

	public void setDealConfirmationId(Long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
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

	
	
}