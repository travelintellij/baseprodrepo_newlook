package com.udanchoo.intranet.service;

import com.udanchoo.intranet.entity.Document;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.util.List;

public interface DocumentService {
    Document saveDocument(String entityType, String entityId, MultipartFile file) throws IOException;
    Document saveDocument(String entityType, String entityId, String fileName, String fileType, byte[] data);
    Document getDocument(Long id);
    Document getDocument(String entityType, String entityId, String fileName);
    List<Document> getDocuments(String entityType, String entityId);
    List<Document> getDocumentsByPrefix(String entityId, String prefix);
    void deleteDocument(Long id);
    void deleteDocument(String entityType, String entityId, String fileName);
}
