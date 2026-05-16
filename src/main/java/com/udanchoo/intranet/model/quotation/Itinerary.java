package com.udanchoo.intranet.model.quotation;

import java.util.ArrayList;
import java.util.List;

public class Itinerary {

    private Long itineraryId;
    private Long leadId;
    private String title;
    private String description;
    private Long quotationId;
    private List<ItineraryDay> days = new ArrayList<>();
    private List<java.util.Map<String, Object>> linkedQuotations;
    private Integer totalDays;

    // ===== GETTERS & SETTERS =====

    public Long getQuotationId() {
        return quotationId;
    }

    public void setQuotationId(Long quotationId) {
        this.quotationId = quotationId;
    }

    public Long getItineraryId() {
        return itineraryId;
    }

    public void setItineraryId(Long itineraryId) {
        this.itineraryId = itineraryId;
    }

    // Keep getId for backward compatibility in case some code uses it
    public Long getId() {
        return itineraryId;
    }

    public void setId(Long id) {
        this.itineraryId = id;
    }

    public Long getLeadId() {
        return leadId;
    }

    public void setLeadId(Long leadId) {
        this.leadId = leadId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<ItineraryDay> getDays() {
        return days;
    }

    public void setDays(List<ItineraryDay> days) {
        this.days = days;
    }

    public List<java.util.Map<String, Object>> getLinkedQuotations() {
        return linkedQuotations;
    }

    public void setLinkedQuotations(List<java.util.Map<String, Object>> linkedQuotations) {
        this.linkedQuotations = linkedQuotations;
    }

    public Integer getTotalDays() {
        return totalDays;
    }

    public void setTotalDays(Integer totalDays) {
        this.totalDays = totalDays;
    }
}
