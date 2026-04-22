package com.udanchoo.intranet.repository;

import com.udanchoo.intranet.entity.GoogleAdsConfigEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GoogleAdsConfigRepository extends JpaRepository<GoogleAdsConfigEntity, Long> {
    GoogleAdsConfigEntity findTopByOrderByIdAsc();
}
