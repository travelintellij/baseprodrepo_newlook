package com.udanchoo.intranet.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.udanchoo.intranet.model.Udn_Visa_Doc_SL_Obj;

@Entity
@Table(name = "udn_vsa_doc_service_line")
public class Udn_Visa_Doc_SL_Entity extends AuditModel {
   	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(nullable = false,name="vsaDocServiceId", unique = true)
	private Long vsaDocServiceId;
	

	@ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="vsaServiceId", nullable=false)
	@JsonManagedReference
    private Udn_Deal_VSA_SL_Entity vsaServiceId;
	
	private String documentTitle;
	private String description;
	private String remarks;
	private String documentCustody;
	private int status;
	
	public Udn_Visa_Doc_SL_Entity() {}
	
	public Udn_Visa_Doc_SL_Entity(Udn_Visa_Doc_SL_Obj visaDocSLObj) {
		this.vsaDocServiceId = visaDocSLObj.getVsaDocServiceId();
		this.vsaServiceId= visaDocSLObj.getVsaServiceId();
		this.documentTitle= visaDocSLObj.getDocumentTitle();
		this.description= visaDocSLObj.getDescription();
		this.remarks= visaDocSLObj.getRemarks();
		this.documentCustody= visaDocSLObj.getDocumentCustody();
		this.status= visaDocSLObj.getStatus();
	}
	
	public String toString() {
		String attrib = "Displaying Udn_Visa_Doc_SL_Obj:- " + "\n" ;
		attrib = attrib + " vsaDocServiceId -> " + vsaDocServiceId + "\n";
		//attrib = attrib + " vsaServiceId -> " + vsaServiceId + "\n";
		attrib = attrib + " documentTitle -> " + documentTitle + "\n";
		attrib = attrib + " description -> " + description + "\n";
		attrib = attrib + " remarks -> " + remarks + "\n";
		attrib = attrib + " documentCustody -> " + documentCustody + "\n";
		attrib = attrib + " statusName -> " + status + "\n";
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status= status;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}