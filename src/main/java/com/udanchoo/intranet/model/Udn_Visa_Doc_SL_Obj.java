package com.udanchoo.intranet.model;

import com.udanchoo.intranet.entity.Udn_Deal_VSA_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Doc_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Master_Entity;


public class Udn_Visa_Doc_SL_Obj  {
   	
	
	private Long vsaDocServiceId;
	private Udn_Deal_VSA_SL_Entity vsaServiceId;
	private String documentTitle;
	private String description;
	private String remarks;
	private String documentCustody;
	private String statusName;
	private int status;
	
	public Udn_Visa_Doc_SL_Obj() {}
	
	public Udn_Visa_Doc_SL_Obj(Udn_Visa_Doc_SL_Entity visaDocSLEntity) {
		this.vsaDocServiceId = visaDocSLEntity.getVsaDocServiceId();
		this.vsaServiceId= visaDocSLEntity.getVsaServiceId();
		this.documentTitle= visaDocSLEntity.getDocumentTitle();
		this.description= visaDocSLEntity.getDescription();
		this.remarks= visaDocSLEntity.getRemarks();
		this.documentCustody= visaDocSLEntity.getDocumentCustody();
		this.status= visaDocSLEntity.getStatus();
	}
	
	public void updateVoFromEntity(Udn_Visa_Doc_SL_Entity visaDocSLEntity) {
		this.vsaDocServiceId = visaDocSLEntity.getVsaDocServiceId();
		this.vsaServiceId= visaDocSLEntity.getVsaServiceId();
		this.documentTitle= visaDocSLEntity.getDocumentTitle();
		this.description= visaDocSLEntity.getDescription();
		this.remarks= visaDocSLEntity.getRemarks();
		this.documentCustody= visaDocSLEntity.getDocumentCustody();
		this.status= visaDocSLEntity.getStatus();
	}
	
	public String toString() {
		String attrib = "Displaying Udn_Visa_Doc_SL_Obj:- " + "\n" ;
		attrib = attrib + " vsaDocServiceId -> " + vsaDocServiceId + "\n";
		//attrib = attrib + " vsaServiceId -> " + vsaServiceId + "\n";
		attrib = attrib + " documentTitle -> " + documentTitle + "\n";
		attrib = attrib + " description -> " + description + "\n";
		attrib = attrib + " remarks -> " + remarks + "\n";
		attrib = attrib + " documentCustody -> " + documentCustody + "\n";
		attrib = attrib + " statusName -> " + statusName + "\n";
		return attrib; 
	}
	
	
	public Long getVsaDocServiceId() {
		return vsaDocServiceId;
	}
	public void setVsaDocServiceId(Long vsaDocServiceId) {
		this.vsaDocServiceId = vsaDocServiceId;
	}
	public Udn_Deal_VSA_SL_Entity getVsaServiceId() {
		return vsaServiceId;
	}
	public void setVsaServiceId(Udn_Deal_VSA_SL_Entity vsaServiceId) {
		this.vsaServiceId = vsaServiceId;
	}
	public String getDocumentTitle() {
		return documentTitle;
	}
	public void setDocumentTitle(String documentTitle) {
		this.documentTitle = documentTitle;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	public String getDocumentCustody() {
		return documentCustody;
	}
	public void setDocumentCustody(String documentCustody) {
		this.documentCustody = documentCustody;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}