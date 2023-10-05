package com.udanchoo.intranet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.udanchoo.intranet.exception.FileStorageException;
import com.udanchoo.intranet.exception.MyFileNotFoundException;
import com.udanchoo.intranet.util.FileStorageProperties;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

@Service
public class FileStorageService {

    private Path fileStorageLocation;
    private Path clientStorageLocation;
    private Path userStorageLocation;

    @Autowired
    public FileStorageService(FileStorageProperties fileStorageProperties) {
        this.fileStorageLocation = Paths.get(fileStorageProperties.getUploadDir()).toAbsolutePath().normalize();
        this.clientStorageLocation = Paths.get(fileStorageProperties.getUploadClientsDir()).toAbsolutePath().normalize();
        this.userStorageLocation = Paths.get(fileStorageProperties.getUploadUsersDir()).toAbsolutePath().normalize();
        try {
            Files.createDirectories(this.fileStorageLocation);
            Files.createDirectories(this.clientStorageLocation);
            Files.createDirectories(this.userStorageLocation);
        } catch (Exception ex) {
            throw new FileStorageException("Could not create the directory where the uploaded files will be stored.", ex);
        }
    }

    public String storeFile(MultipartFile file,Path fileStorageLocation) {
        // Normalize file name
        String fileName = StringUtils.cleanPath(file.getOriginalFilename());

        try {
            // Check if the file's name contains invalid characters
            if(fileName.contains("..")) {
                throw new FileStorageException("Sorry! Filename contains invalid path sequence " + fileName);
            }

            // Copy file to the target location (Replacing existing file with the same name)
            Path targetLocation = fileStorageLocation.resolve(fileName);
            Files.copy(file.getInputStream(), targetLocation, StandardCopyOption.REPLACE_EXISTING);

            return fileName;
        } catch (IOException ex) {
            throw new FileStorageException("Could not store file " + fileName + ". Please try again!", ex);
        }
    }

    
    /***************** TEMP CODE *********************************/
    
    public Resource loadFileAsResource(String fileName,Path storagePath) {
        try {
            Path filePath = storagePath.resolve(fileName).normalize();
            Resource resource = new UrlResource(filePath.toUri());
            if(resource.exists()) {
                return resource;
            } else {
                throw new MyFileNotFoundException("File not found " + fileName);
            }
        } catch (MalformedURLException ex) {
            throw new MyFileNotFoundException("File not found " + fileName, ex);
        }
    }
    
    /***************************************************************/
    
    public Resource loadFileAsResource(String fileName) {
        try {
            Path filePath = this.fileStorageLocation.resolve(fileName).normalize();
            Resource resource = new UrlResource(filePath.toUri());
            if(resource.exists()) {
                return resource;
            } else {
                throw new MyFileNotFoundException("File not found " + fileName);
            }
        } catch (MalformedURLException ex) {
            throw new MyFileNotFoundException("File not found " + fileName, ex);
        }
    }

	public Path getFileStorageLocation() {
		return fileStorageLocation;
	}

	public void setFileStorageLocation(Path fileStorageLocation) {
		this.fileStorageLocation = fileStorageLocation;
	}
    
	public Path getClientStorageLocation() {
		return clientStorageLocation;
	}

	public void setClientStorageLocation(Path clientStorageLocation) {
		this.clientStorageLocation = clientStorageLocation;
	}

	public Path getUserStorageLocation() {
		return userStorageLocation;
	}

	public void setUserStorageLocation(Path userStorageLocation) {
		this.userStorageLocation = userStorageLocation;
	}
	
	
    
}