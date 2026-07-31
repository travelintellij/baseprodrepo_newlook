package com.udanchoo.intranet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.udanchoo.intranet.entity.Document;
import java.util.List;
import java.util.Optional;

@Repository
public interface DocumentRepository extends JpaRepository<Document, Long> {
    List<Document> findByEntityTypeAndEntityId(String entityType, String entityId);
    List<Document> findByEntityIdAndEntityTypeStartingWith(String entityId, String prefix);
    Optional<Document> findByEntityTypeAndEntityIdAndFileName(String entityType, String entityId, String fileName);
    void deleteByEntityTypeAndEntityIdAndFileName(String entityType, String entityId, String fileName);
}
