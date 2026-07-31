package com.udanchoo.intranet.entity;

import javax.persistence.*;
import java.util.Date;

/**
 * Stores Google Ads API credentials for lead sync.
 * Completely separate from Meta/Facebook config.
 */
@Entity
@Table(name = "google_ads_config")
public class GoogleAdsConfigEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /** From Google Ads API Center → API Access */
    @Column(name = "developerToken", length = 255)
    private String developerToken;

    /** OAuth2 Client ID from Google Cloud Console */
    @Column(name = "clientId", length = 255)
    private String clientId;

    /** OAuth2 Client Secret from Google Cloud Console */
    @Column(name = "clientSecret", length = 255)
    private String clientSecret;

    /** Long-lived OAuth2 Refresh Token */
    @Column(name = "refreshToken", columnDefinition = "TEXT")
    private String refreshToken;

    /** Google Ads Customer ID (format: 123-456-7890) */
    @Column(name = "customerId", length = 50)
    private String customerId;

    /** Which user receives email when a Google lead is auto-imported */
    @Column(name = "defaultLeadOwnerId")
    private Integer defaultLeadOwnerId = 1;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_at", updatable = false)
    private Date createdAt;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated_at")
    private Date updatedAt;

    @PrePersist
    protected void onCreate() { createdAt = updatedAt = new Date(); }

    @PreUpdate
    protected void onUpdate() { updatedAt = new Date(); }

    public GoogleAdsConfigEntity() {}

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getDeveloperToken() { return developerToken; }
    public void setDeveloperToken(String developerToken) { this.developerToken = developerToken; }

    public String getClientId() { return clientId; }
    public void setClientId(String clientId) { this.clientId = clientId; }

    public String getClientSecret() { return clientSecret; }
    public void setClientSecret(String clientSecret) { this.clientSecret = clientSecret; }

    public String getRefreshToken() { return refreshToken; }
    public void setRefreshToken(String refreshToken) { this.refreshToken = refreshToken; }

    public String getCustomerId() { return customerId; }
    public void setCustomerId(String customerId) { this.customerId = customerId; }

    public Integer getDefaultLeadOwnerId() { return defaultLeadOwnerId; }
    public void setDefaultLeadOwnerId(Integer defaultLeadOwnerId) { this.defaultLeadOwnerId = defaultLeadOwnerId; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }

    public Date getUpdatedAt() { return updatedAt; }
    public void setUpdatedAt(Date updatedAt) { this.updatedAt = updatedAt; }
}
