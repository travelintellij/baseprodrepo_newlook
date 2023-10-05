package com.udanchoo.intranet.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.udanchoo.intranet.entity.quotation.Udn_Manual_Insurance_Quotation_Entity;
import com.udanchoo.intranet.model.InsuranceServiceLineVO;

@Entity
@Table(name = "udn_ins_service_line")
public class Udn_Deal_INS_SL_Entity extends AuditModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false,name="insServiceId", unique = true)
	private Long insServiceId;
	
	private long serviceMapId;
	private Date coverageStartDate;
	private Date coverageEndDate;
	private int destinationId;
	private int supplierId;
	private String remarks;
	private String  applicantName;
	private int age;
	private String planName;
	private int insuranceProvider;
	private int insuranceType;
	private int status;
	private int coverageAmount;
	private String coverageCurrency;
	private Long dealConfirmationId;
	private float serviceLineCost;
	private float markup;
	private int displayOrder;
	
	public Udn_Deal_INS_SL_Entity() {}
	
	public Udn_Deal_INS_SL_Entity(InsuranceServiceLineVO insSLVo) {
		this.insServiceId = insSLVo.getInsServiceId();
		this.serviceMapId= insSLVo.getServiceMapId();
		this.coverageStartDate= insSLVo.getCoverageStartDate();
		this.coverageEndDate= insSLVo.getCoverageEndDate();
		this.destinationId= insSLVo.getDestinationId();
		this.supplierId= insSLVo.getSupplierId();
		this.remarks= insSLVo.getRemarks();
		this.applicantName= insSLVo.getApplicantName();
		this.age= insSLVo.getAge();
		this.planName= insSLVo.getPlanName();
		this.insuranceProvider= insSLVo.getInsuranceProvider();
		this.insuranceType=insSLVo.getInsuranceType();
		this.status= insSLVo.getStatus();
		this.coverageAmount=insSLVo.getCoverageAmount();
		this.coverageCurrency = insSLVo.getCoverageCurrency();
		//this.serviceLineOwner = insSLVo.getServiceLineOwner();
		this.dealConfirmationId = insSLVo.getDealConfirmationId();
		this.serviceLineCost = insSLVo.getServiceLineCost();
		this.markup=insSLVo.getMarkup();
		this.displayOrder=insSLVo.getDisplayOrder();
	}
	
	
	
	public Udn_Deal_INS_SL_Entity(Udn_Manual_Insurance_Quotation_Entity insQtnEntity) {
		//this.insServiceId = insSLVo.getInsServiceId();
		//this.serviceMapId= insSLVo.getServiceMapId();
		this.coverageStartDate= insQtnEntity.getCoverageStartDate();
		this.coverageEndDate= insQtnEntity.getCoverageEndDate();
		this.destinationId= insQtnEntity.getCountryId();
		//this.supplierId= insSLVo.getSupplierId();
		this.remarks= insQtnEntity.getRemarks();
		//this.applicantName= insuranceEntity.get
		//this.age= insSLVo.getAge();
		this.planName= insQtnEntity.getInsuranceName();
		this.insuranceProvider= insQtnEntity.getInsuranceProvider();
		this.insuranceType=insQtnEntity.getInsuranceType();
		//this.status= insSLVo.getStatus();
		this.coverageAmount=insQtnEntity.getCoverageAmount();
		this.coverageCurrency = insQtnEntity.getCoverageCurrency();
		//this.serviceLineOwner = insSLVo.getServiceLineOwner();
		//this.dealConfirmationId = insuranceEntity.getDealConfirmationId();
		//this.serviceLineCost = insQtnEntity.getPremiumCost();
		//this.markup=insQtnEntity.getPremiumMarkup();
		this.displayOrder=insQtnEntity.getDisplayOrder();
	}

	public int getCoverageAmount() {
		return coverageAmount;
	}

	public void setCoverageAmount(int coverageAmount) {
		this.coverageAmount = coverageAmount;
	}

	public String getCoverageCurrency() {
		return coverageCurrency;
	}

	public void setCoverageCurrency(String coverageCurrency) {
		this.coverageCurrency = coverageCurrency;
	}

	public void setInsServiceId(Long insServiceId) {
		this.insServiceId = insServiceId;
	}

	public Long getInsServiceId() {
		return insServiceId;
	}
	public void setInsServiceId(long insServiceId) {
		this.insServiceId = insServiceId;
	}
	public long getServiceMapId() {
		return serviceMapId;
	}
	public void setServiceMapId(long serviceMapId) {
		this.serviceMapId = serviceMapId;
	}
	public Date getCoverageStartDate() {
		return coverageStartDate;
	}
	public void setCoverageStartDate(Date coverageStartDate) {
		this.coverageStartDate = coverageStartDate;
	}
	public Date getCoverageEndDate() {
		return coverageEndDate;
	}
	public void setCoverageEndDate(Date coverageEndDate) {
		this.coverageEndDate = coverageEndDate;
	}
	public int getDestinationId() {
		return destinationId;
	}
	public void setDestinationId(int destinationId) {
		this.destinationId = destinationId;
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
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getPlanName() {
		return planName;
	}
	public void setPlanName(String planName) {
		this.planName = planName;
	}
	public int getInsuranceProvider() {
		return insuranceProvider;
	}
	public void setInsuranceProvider(int insuranceProvider) {
		this.insuranceProvider = insuranceProvider;
	}
	
	
	public Long getDealConfirmationId() {
		return dealConfirmationId;
	}

	public void setDealConfirmationId(Long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
	}

	public String toString() {
		String attrib = " insServiceId -> " + insServiceId+ "\n";
		attrib=attrib + " serviceMapId- > " + serviceMapId+ "\n";
		attrib=attrib + " coverageStartDate- > " +coverageStartDate + "\n";
		attrib=attrib + " coverageEndDate- > " + coverageEndDate+ "\n";
		attrib=attrib + " destinationId- > " +destinationId + "\n";
		attrib=attrib + " supplierId- > " +supplierId + "\n";
		attrib=attrib + "remarks - > " + remarks+ "\n";
		attrib=attrib + " applicantName- > " +applicantName+ "\n";
		attrib=attrib + " age- > " +age+ "\n";
		attrib=attrib + " status- > " + status+ "\n";
		attrib=attrib + " planName- > " + planName+ "\n";
		attrib=attrib + " insuranceProvider- > " +insuranceProvider + "\n";
		//attrib=attrib + " serviceLineOwner- > " +serviceLineOwner + "\n";
		attrib=attrib + " dealConfirmationId- > " +dealConfirmationId + "\n";
		return attrib;
	}

	public String getApplicantName() {
		return applicantName;
	}

	public void setApplicantName(String applicantName) {
		this.applicantName = applicantName;
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

	public int getInsuranceType() {
		return insuranceType;
	}

	public void setInsuranceType(int insuranceType) {
		this.insuranceType = insuranceType;
	}
	
	
	
}
