package com.udanchoo.intranet.repository;

import java.time.ZonedDateTime;
import java.util.Date;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Deal_FLT_SL_Entity;

@Repository
public interface Deal_FLT_ServiceLine_Repository extends JpaRepository<Udn_Deal_FLT_SL_Entity,Long>,JpaSpecificationExecutor{

	 boolean existsByServiceMapId(long serviceMapId);
	 
	 
	 //Page<Udn_Deal_FLT_SL_Entity> findByCreatedAtAfterAndServiceLineOwner(Date  currentDate,long serviceLineOwner, Pageable pageable);
	 
	 Page<Udn_Deal_FLT_SL_Entity> findByCreatedAtAfter(Date  currentDate, Pageable pageable);
	 
	// @Query("FROM Udn_Deal_FLT_SL_Entity a join Udn_Deals_Recorder_Entity b join UdnClientEntity c on a.dealConfirmationId = b.dealConfirmationId where b.clientId=c.clientId and a.createdAt > ?1 and a.serviceLineOwner=?2 order by c.clientName")
	 //@Query("FROM Udn_Deal_FLT_SL_Entity a join Udn_Deals_Recorder_Entity b on a.dealConfirmationId = b.dealConfirmationId")
	 //Page<Udn_Deal_FLT_SL_Entity> findBy_CreatedAtAfter_And_ServiceLineOwner_SortBy_ClientName(Date currentDate,long serviceLineOwner, Pageable pageable);
	 
	 @Query("SELECT SUM(serviceLineCost) FROM Udn_Deal_FLT_SL_Entity a where a.dealConfirmationId=?1")
	 Float sum_FLT_SL_Cost_By_DealId(long dealConfirmationId); 
	 
	
} 