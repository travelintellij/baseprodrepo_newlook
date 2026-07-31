package com.udanchoo.intranet.service;

import com.udanchoo.intranet.entity.Document;
import com.udanchoo.intranet.repository.DocumentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class DocumentServiceImpl implements DocumentService {

    @Autowired
    private DocumentRepository documentRepository;

    @Override
    public Document saveDocument(String entityType, String entityId, MultipartFile file) throws IOException {
        String fileName = org.springframework.util.StringUtils.cleanPath(file.getOriginalFilename());
        return saveDocument(entityType, entityId, fileName, file.getContentType(), file.getBytes());
    }

    @Override
    public Document saveDocument(String entityType, String entityId, String fileName, String fileType, byte[] data) {
        // If updating an existing file with the same name, we can delete the old one first or update it
        // To be safe, let's delete existing document with the exact same name for the entity
        documentRepository.deleteByEntityTypeAndEntityIdAndFileName(entityType, entityId, fileName);
        // flush to ensure delete happens before insert to avoid unique constraint if we had one
        documentRepository.flush();

        Document document = new Document();
        document.setEntityType(entityType);
        document.setEntityId(entityId);
        document.setFileName(fileName);
        document.setFileType(fileType);
        document.setFileSize((long) data.length);
        document.setUploadedDate(new Date());
        document.setFileData(data);
        return documentRepository.save(document);
    }

    @Override
    public Document getDocument(Long id) {
        return documentRepository.findById(id).orElse(null);
    }

    @Override
    public Document getDocument(String entityType, String entityId, String fileName) {
        return documentRepository.findByEntityTypeAndEntityIdAndFileName(entityType, entityId, fileName).orElse(null);
    }

    @Override
    public List<Document> getDocuments(String entityType, String entityId) {
        return documentRepository.findByEntityTypeAndEntityId(entityType, entityId);
    }

    @Override
    public List<Document> getDocumentsByPrefix(String entityId, String prefix) {
        return documentRepository.findByEntityIdAndEntityTypeStartingWith(entityId, prefix);
    }

    @Override
    public void deleteDocument(Long id) {
        documentRepository.deleteById(id);
    }

    @Override
    public void deleteDocument(String entityType, String entityId, String fileName) {
        documentRepository.deleteByEntityTypeAndEntityIdAndFileName(entityType, entityId, fileName);
    }
}
