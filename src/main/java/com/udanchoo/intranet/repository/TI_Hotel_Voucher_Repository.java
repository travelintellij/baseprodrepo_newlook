package com.udanchoo.intranet.repository;

import java.util.Date;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.TI_Hotel_Voucher_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_FLT_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_HTL_SL_Entity;

@Repository
public interface TI_Hotel_Voucher_Repository extends JpaRepository<TI_Hotel_Voucher_Entity,Long>,JpaSpecificationExecutor{

	boolean existsByHtlServiceId(long htlServiceId);
	TI_Hotel_Voucher_Entity findByHtlServiceId(long htlServiceId);
	int deleteByHtlServiceId(long htlServiceId);
	/*
	boolean existsUdn_Deal_HTL_SL_EntityByHotelId(int hotelId);
	
	boolean existsByServiceMapId(long serviceMapId);
	
	 //Page<Udn_Deal_HTL_SL_Entity> findByCreatedAtAfterAndServiceLineOwner(Date  currentDate,long serviceLineOwner, Pageable pageable);
	 
	
	 Page<Udn_Deal_HTL_SL_Entity> findByCreatedAtAfter(Date  currentDate,Pageable pageable);
	
	 @Query("SELECT SUM(serviceLineCost) FROM Udn_Deal_HTL_SL_Entity a where a.dealConfirmationId=?1")
	 Float sum_HTL_SL_Cost_By_DealId(long dealConfirmationId); 
	*/ 
	 
	 
} 