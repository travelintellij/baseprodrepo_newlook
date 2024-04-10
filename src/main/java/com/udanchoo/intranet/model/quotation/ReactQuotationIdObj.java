package com.udanchoo.intranet.model.quotation;

import org.springframework.stereotype.Component;

@Component
public class ReactQuotationIdObj {
        private String leadId;
        private  String quotationId;

    public String getLeadId() {
        return leadId;
    }

    public void setLeadId(String leadId) {
        this.leadId = leadId;
    }

    public String getQuotationId() {
        return quotationId;
    }

    public void setQuotationId(String quotationId) {
        this.quotationId = quotationId;
    }

    public ReactQuotationIdObj(String leadId, String quotationId, String tokenId) {
        this.leadId = leadId;
        this.quotationId = quotationId;
    }

    public ReactQuotationIdObj() {
    }
}
