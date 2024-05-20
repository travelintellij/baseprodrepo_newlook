package com.udanchoo.intranet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.deals.Ti_Deals_Team_Map_Entity;

@Repository
public interface Ti_Deals_Team_Map_Repository extends JpaRepository<Ti_Deals_Team_Map_Entity, Long> {

    boolean existsByDealConfirmationIdAndUserId(Long dealConfirmationId, int userId);
}

