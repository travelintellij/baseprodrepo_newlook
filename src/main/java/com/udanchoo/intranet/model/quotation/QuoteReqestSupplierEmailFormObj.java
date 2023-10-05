package com.udanchoo.intranet.model.quotation;

import com.udanchoo.intranet.model.EmailMessageVO;

public class QuoteReqestSupplierEmailFormObj extends EmailMessageVO{
	
	
	// following list will get populated when the user selects the number of visa to be forwards to the client for status. 
	
	private long leadId=0;
	private String leadReferenceNumber;
	private String supplierName;
	private long supplierId=0;
	
	
	public long getLeadId() {
		return leadId;
	}

	public void setLeadId(long leadId) {
		this.leadId = leadId;
	}

	public long getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(long supplierId) {
		this.supplierId = supplierId;
	}

	public String getLeadReferenceNumber() {
		return leadReferenceNumber;
	}

	public void setLeadReferenceNumber(String leadReferenceNumber) {
		this.leadReferenceNumber = leadReferenceNumber;
	}

	public String getSupplierName() {
		return supplierName;
	}

	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}

	
	


	

			
}