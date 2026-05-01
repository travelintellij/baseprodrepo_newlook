package com.udanchoo.intranet.entity;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "campaign_form")
public class CampaignFormEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "campaignFormId")
    private Long campaignFormId;

    @Column(name = "formName", nullable = false, length = 150)
    private String formName;

    @Column(name = "formType", nullable = false, length = 50)
    private String formType; // "META" or "GOOGLE"

    @Column(name = "formId", nullable = false, length = 255)
    private String formId; // The actual Meta/Google Form ID

    @Column(name = "campaignName", length = 255)
    private String campaignName;

    @Column(name = "description", length = 500)
    private String description;

    @Column(name = "active", nullable = false)
    private Boolean active = true;

    @Column(name = "destination", length = 100)
    private String destination;

    @Column(name = "tentativeCost")
    private Integer tentativeCost = 0;

    @Column(name = "defaultService", length = 50)
    private String defaultService;

    @Transient
    private List<String> services;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_at", updatable = false)
    private Date createdAt;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated_at")
    private Date updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = new Date();
        updatedAt = new Date();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = new Date();
    }

    public CampaignFormEntity() {
    }

    public Long getCampaignFormId() { return campaignFormId; }
    public void setCampaignFormId(Long campaignFormId) { this.campaignFormId = campaignFormId; }

    public String getFormName() { return formName; }
    public void setFormName(String formName) { this.formName = formName; }

    public String getFormType() { return formType; }
    public void setFormType(String formType) { this.formType = formType; }

    public String getFormId() { return formId; }
    public void setFormId(String formId) { this.formId = formId; }

    public String getCampaignName() { return campaignName; }
    public void setCampaignName(String campaignName) { this.campaignName = campaignName; }

    public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public Boolean getActive() { return active; }
    public void setActive(Boolean active) { this.active = active; }

    public Integer getTentativeCost() { return tentativeCost; }
    public void setTentativeCost(Integer tentativeCost) { this.tentativeCost = tentativeCost; }

    public String getDefaultService() { return defaultService; }
    public void setDefaultService(String defaultService) { this.defaultService = defaultService; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }

    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }

    public List<String> getServices() {
        return services;
    }

    public void setServices(List<String> services) {
        this.services = services;
    }


    @Override
    public String toString() {
        return "CampaignFormEntity{" +
                "campaignFormId=" + campaignFormId +
                ", formName='" + formName + '\'' +
                ", destination='" + destination + '\'' +
                ", tentativeCost=" + tentativeCost +
                ", defaultService='" + defaultService + '\'' +
                ", active=" + active +
                '}';
    }
}
