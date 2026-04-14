package com.udanchoo.intranet.repository;

import com.udanchoo.intranet.entity.CampaignFormEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CampaignFormRepository extends JpaRepository<CampaignFormEntity, Long> {

    List<CampaignFormEntity> findByActiveTrue();

    List<CampaignFormEntity> findByFormType(String formType);
}
