package com.udanchoo.intranet.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Central configuration entity for storing system-wide settings,
 * including Meta (Facebook/Instagram) API credentials.
 */
@Entity
@Table(name = "udn_central_config")
public class UdnCentralConfigEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * Meta (Facebook/Instagram) Page Access Token.
     * Use a permanent (never-expiring) token for production.
     */
    @Column(name = "metaPageAccessToken", columnDefinition = "TEXT")
    private String metaPageAccessToken;

    @Column(name = "metaAppId", length = 255)
    private String metaAppId;

    @Column(name = "metaAppSecret", length = 255)
    private String metaAppSecret;

    @Column(name = "metaLeadFormId", length = 255)
    private String metaLeadFormId;

    @Column(name = "metaGraphApiVersion", length = 20)
    private String metaGraphApiVersion = "v19.0";

    @Column(name = "defaultLeadOwnerId")
    private Integer defaultLeadOwnerId = 1;

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

    public UdnCentralConfigEntity() {}

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getMetaPageAccessToken() { return metaPageAccessToken; }
    public void setMetaPageAccessToken(String metaPageAccessToken) { this.metaPageAccessToken = metaPageAccessToken; }

    public String getMetaAppId() { return metaAppId; }
    public void setMetaAppId(String metaAppId) { this.metaAppId = metaAppId; }

    public String getMetaAppSecret() { return metaAppSecret; }
    public void setMetaAppSecret(String metaAppSecret) { this.metaAppSecret = metaAppSecret; }

    public String getMetaLeadFormId() { return metaLeadFormId; }
    public void setMetaLeadFormId(String metaLeadFormId) { this.metaLeadFormId = metaLeadFormId; }

    public String getMetaGraphApiVersion() { return metaGraphApiVersion; }
    public void setMetaGraphApiVersion(String metaGraphApiVersion) { this.metaGraphApiVersion = metaGraphApiVersion; }

    public Integer getDefaultLeadOwnerId() { return defaultLeadOwnerId; }
    public void setDefaultLeadOwnerId(Integer defaultLeadOwnerId) { this.defaultLeadOwnerId = defaultLeadOwnerId; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }

    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
}
