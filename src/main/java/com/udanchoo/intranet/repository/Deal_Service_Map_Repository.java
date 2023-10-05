package com.udanchoo.intranet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Deal_FLT_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_Services_Entity;

@Repository
public interface Deal_Service_Map_Repository extends JpaRepository<Udn_Deal_Services_Entity,Long>{

	
	@Query("SELECT COUNT(*)FROM Udn_Deal_Services_Entity a join Udn_Deals_Recorder_Entity b on a.parentDealRecord.dealConfirmationId = b.dealConfirmationId where a.dealServiceCode=?1 AND a.serviceStatus = ?2 and b.dealOwner=?3")
	int countServicesTotalBasedOnStatusAndUser(String dealServiceCode,int status, long dealOwner);
	
	
	@Query("SELECT COUNT(*)FROM Udn_Deal_Services_Entity a join Udn_Deals_Recorder_Entity b on a.parentDealRecord.dealConfirmationId = b.dealConfirmationId where a.dealServiceCode=?1 AND a.serviceStatus = ?2")
	int countServicesTotalBasedOnStatus(String dealServiceCode,int status);
	//long countByDealServiceCodeAndStatus(String serviceCode,int status);
	
} 
