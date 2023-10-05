package com.udanchoo.intranet.util;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties(prefix = "file")
public class FileStorageProperties {
    private String uploadDir;
    private String uploadClientsDir;
    private String uploadUsersDir;
    
    public String getUploadDir() {
        return uploadDir;
    }

    public void setUploadDir(String uploadDir) {
        this.uploadDir = uploadDir;
    }

	public String getUploadClientsDir() {
		return uploadClientsDir;
	}

	public void setUploadClientsDir(String uploadClientsDir) {
		this.uploadClientsDir = uploadClientsDir;
	}

	public String getUploadUsersDir() {
		return uploadUsersDir;
	}

	public void setUploadUsersDir(String uploadUsersDir) {
		this.uploadUsersDir = uploadUsersDir;
	}
    
    
    
    
}