package com.udanchoo.intranet.repository;

import java.util.Date;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Deal_CRS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_STS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_TRN_SL_Entity;

@Repository
public interface Deal_CRS_ServiceLine_Repository extends JpaRepository<Udn_Deal_CRS_SL_Entity,Long>,JpaSpecificationExecutor{


	boolean existsByServiceMapId(long serviceMapId);
	
	//Page<Udn_Deal_TRN_SL_Entity> findByCreatedAtAfterAndServiceLineOwner(Date  currentDate,long serviceLineOwner, Pageable pageable);
	Page<Udn_Deal_CRS_SL_Entity> findByCreatedAtAfter(Date  currentDate,Pageable pageable);
	
	
	@Query("SELECT SUM(serviceLineCost) FROM Udn_Deal_CRS_SL_Entity a where a.dealConfirmationId=?1")
	Float sum_CRS_SL_Cost_By_DealId(long dealConfirmationId); 
	 
} 