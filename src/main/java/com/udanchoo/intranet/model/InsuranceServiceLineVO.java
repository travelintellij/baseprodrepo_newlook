package com.udanchoo.intranet.model;

import java.sql.Date;

import com.udanchoo.intranet.entity.Udn_Deal_INS_SL_Entity;

public class InsuranceServiceLineVO {
	
	private long insServiceId;
	private long serviceMapId;
	private Date coverageStartDate;
	private Date coverageEndDate;
	private int destinationId;
	private int supplierId;
	private String remarks;
	private String applicantName;
	private int age;
	private int coverageAmount;
	private String coverageCurrency;
	private int status;
	
	private String supplierName;
	private String destinationName;
	private String statusName;

	private String planName;
	private int insuranceProvider;
	
	private String clientName;
	
	private java.util.Date createdAt;
	//private long serviceLineOwner;
	private Long dealConfirmationId;
	private float serviceLineCost;
	private float markup;
	private String insuranceProviderName;
	private String insuranceTypeName;
	private int insuranceType;
	private int displayOrder;
	
	private String dealOwnerName;
	
	public InsuranceServiceLineVO() {
		
	}
	
	public InsuranceServiceLineVO(Udn_Deal_INS_SL_Entity insEntity) {
		this.insServiceId = insEntity.getInsServiceId();
		this.serviceMapId= insEntity.getServiceMapId();
		this.coverageStartDate= insEntity.getCoverageStartDate();
		this.coverageEndDate= insEntity.getCoverageEndDate();
		this.destinationId= insEntity.getDestinationId();
		this.supplierId= insEntity.getSupplierId();
		this.remarks= insEntity.getRemarks();
		this.applicantName= insEntity.getApplicantName();
		this.age= insEntity.getAge();
		this.planName= insEntity.getPlanName();
		this.insuranceProvider= insEntity.getInsuranceProvider();
		this.insuranceType=insEntity.getInsuranceType();
		this.status= insEntity.getStatus();
		this.coverageAmount=insEntity.getCoverageAmount();
		this.coverageCurrency = insEntity.getCoverageCurrency();
		this.createdAt = insEntity.getCreatedAt();
		//this.serviceLineOwner =insEntity.getServiceLineOwner(); 
		this.dealConfirmationId = insEntity.getDealConfirmationId();
		this.serviceLineCost = insEntity.getServiceLineCost();
		this.markup=insEntity.getMarkup();
		this.displayOrder=insEntity.getDisplayOrder();
	}
	
	public void updateVoFromEntity(Udn_Deal_INS_SL_Entity insEntity) {
		this.insServiceId = insEntity.getInsServiceId();
		this.serviceMapId= insEntity.getServiceMapId();
		this.coverageStartDate= insEntity.getCoverageStartDate();
		this.coverageEndDate= insEntity.getCoverageEndDate();
		this.destinationId= insEntity.getDestinationId();
		this.supplierId= insEntity.getSupplierId();
		this.remarks= insEntity.getRemarks();
		this.applicantName= insEntity.getApplicantName();
		this.age= insEntity.getAge();
		this.planName= insEntity.getPlanName();
		this.insuranceProvider= insEntity.getInsuranceProvider();
		this.insuranceType=insEntity.getInsuranceType();
		this.status= insEntity.getStatus();
		this.coverageAmount=insEntity.getCoverageAmount();
		this.coverageCurrency = insEntity.getCoverageCurrency();
		this.createdAt = insEntity.getCreatedAt();
		//this.serviceLineOwner =insEntity.getServiceLineOwner(); 
		this.dealConfirmationId = insEntity.getDealConfirmationId();
		this.serviceLineCost = insEntity.getServiceLineCost();
		this.markup=insEntity.getMarkup();
		this.displayOrder=insEntity.getDisplayOrder();
		this.insuranceType=insEntity.getInsuranceType();
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

	public String getStatusName() {
		return statusName;
	}

	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public long getInsServiceId() {
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
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getDestinationName() {
		return destinationName;
	}
	public void setDestinationName(String destinationName) {
		this.destinationName = destinationName;
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
		attrib=attrib + " statusName- > " + statusName+ "\n";
		attrib=attrib + " supplierName- > " +supplierName + "\n";
		attrib=attrib + " destinationName- > " +destinationName + "\n";
		attrib=attrib + " planName- > " + planName+ "\n";
		attrib=attrib + " insuranceProvider- > " +insuranceProvider + "\n";
		attrib=attrib + " createdAt- > " +createdAt + "\n";
		//attrib=attrib + " serviceLineOwner- > " +serviceLineOwner + "\n";
		attrib=attrib + " dealConfirmationId- > " +dealConfirmationId + "\n";
		attrib=attrib + " serviceLineCost- > " +serviceLineCost + "\n";
		return attrib;
	}

	public String getClientName() {
		return clientName;
	}

	public void setClientName(String clientName) {
		this.clientName = clientName;
	}

	public java.util.Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(java.util.Date createdAt) {
		this.createdAt = createdAt;
	}


	public Long getDealConfirmationId() {
		return dealConfirmationId;
	}

	public void setDealConfirmationId(Long dealConfirmationId) {
		this.dealConfirmationId = dealConfirmationId;
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

	public String getInsuranceProviderName() {
		return insuranceProviderName;
	}

	public void setInsuranceProviderName(String insuranceProviderName) {
		this.insuranceProviderName = insuranceProviderName;
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

	public String getInsuranceTypeName() {
		return insuranceTypeName;
	}

	public void setInsuranceTypeName(String insuranceTypeName) {
		this.insuranceTypeName = insuranceTypeName;
	}

	public String getDealOwnerName() {
		return dealOwnerName;
	}

	public void setDealOwnerName(String dealOwnerName) {
		this.dealOwnerName = dealOwnerName;
	}
	
	
	
	
}
