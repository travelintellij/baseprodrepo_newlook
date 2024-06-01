package com.udanchoo.intranet.model.partner;

import org.springframework.web.multipart.MultipartFile;

import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;

public class Tg_B2bPartner_Obj extends Tg_B2b_Partner_Entity{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String cityName;
	private MultipartFile logoFile;
	private String logFilePath;
	private String logoFileName;

	public Tg_B2bPartner_Obj() {}
	
	public Tg_B2bPartner_Obj(Tg_B2b_Partner_Entity agentEntity) {
		this.partnerId = agentEntity.getPartnerId();
		this.partnerName=agentEntity.getPartnerName();
		this.partnerShortName=agentEntity.getPartnerShortName();
		this.partnerBrandName=agentEntity.getPartnerBrandName();
		this.contactNumber=agentEntity.getContactNumber();
		this.address=agentEntity.getAddress();
		this.email = agentEntity.getEmail();
		this.gstNumber=agentEntity.getGstNumber();
		this.cityId=agentEntity.getCityId();
		this.website=agentEntity.getWebsite();
		this.remarks=agentEntity.getRemarks();
		this.active=agentEntity.isActive();
		this.beneficiaryName= agentEntity.getBeneficiaryName();
		this.bankName= agentEntity.getBankName();
		this.bankAccountNumber= agentEntity.getBankAccountNumber();
		this.bankIFSCCode= agentEntity.getBankIFSCCode();
		this.bankBranch= agentEntity.getBankBranch();
		this.upiId= agentEntity.getUpiId();
	}
	
	public void updateVoFromEntity(Tg_B2b_Partner_Entity agentEntity) {
		this.partnerId = agentEntity.getPartnerId();
		this.partnerName=agentEntity.getPartnerName();
		this.contactNumber=agentEntity.getContactNumber();
		this.partnerShortName=agentEntity.getPartnerShortName();
		this.partnerBrandName=agentEntity.getPartnerBrandName();
		this.contactNumber=agentEntity.getContactNumber();
		this.address=agentEntity.getAddress();
		this.email = agentEntity.getEmail();
		this.gstNumber=agentEntity.getGstNumber();
		this.cityId=agentEntity.getCityId();
		this.website=agentEntity.getWebsite();
		this.remarks=agentEntity.getRemarks();
		this.active=agentEntity.isActive();
		this.beneficiaryName= agentEntity.getBeneficiaryName();
		this.bankName= agentEntity.getBankName();
		this.bankAccountNumber= agentEntity.getBankAccountNumber();
		this.bankIFSCCode= agentEntity.getBankIFSCCode();
		this.bankBranch= agentEntity.getBankBranch();
		this.upiId= agentEntity.getUpiId();
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public MultipartFile getLogoFile() {
		return logoFile;
	}

	public void setLogoFile(MultipartFile logoFile) {
		this.logoFile = logoFile;
	}

	public String getLogFilePath() {
		return logFilePath;
	}

	public void setLogFilePath(String logFilePath) {
		this.logFilePath = logFilePath;
	}

	public String getLogoFileName() {
		return logoFileName;
	}

	public void setLogoFileName(String logoFileName) {
		this.logoFileName = logoFileName;
	}

	@Override
	public String toString() {
		return "Tg_B2bPartner_Obj [cityName=" + cityName + ", logoFile=" + logoFile + ", logFilePath=" + logFilePath
				+ ", logoFileName=" + logoFileName + "]";
	}

	
	
	
	

}