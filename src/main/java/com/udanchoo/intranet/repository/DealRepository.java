package com.udanchoo.intranet.repository;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Deal_HTL_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;

@Repository
public interface DealRepository extends JpaRepository<Udn_Deals_Recorder_Entity,Long>,JpaSpecificationExecutor{

	@Query("FROM Udn_Deals_Recorder_Entity a WHERE a.clientId=?1 AND a.dealOwner=2")
	List<Udn_Deals_Recorder_Entity> findDealEntityByClientId(long clientId,long dealOwner);

	@Query("FROM Udn_Deals_Recorder_Entity a WHERE a.queryId=?1 AND a.dealOwner=2")
	List<Udn_Deals_Recorder_Entity> findDealEntityByQueryId(long queryId, long dealOwner);

	@Query("FROM Udn_Deals_Recorder_Entity a WHERE a.bookingDate>=?1 AND a.bookingDate<=?2 AND a.dealStatus = ?3 AND a.dealOwner=?4")
	List<Udn_Deals_Recorder_Entity> findDealEntityBy_BookingDate_n_Status_n_owner(Date startDate,Date endDate,int dealStatus, long dealOwner);
	
	@Query("FROM Udn_Deals_Recorder_Entity a WHERE a.bookingDate>=?1 AND a.bookingDate<=?2 AND a.dealStatus = ?3 ")
	List<Udn_Deals_Recorder_Entity> findDealEntityBy_BookingDate_n_Status(Date startDate,Date endDate,int dealStatus);
	
	
	@Query("FROM Udn_Deals_Recorder_Entity a WHERE a.bookingDate>=?1 AND a.bookingDate<=?2 AND a.dealOwner=?3")
	List<Udn_Deals_Recorder_Entity> findDealEntityBy_BookingDate_n_Owner(Date startDate,Date endDate, long dealOwner);
	
	@Query("FROM Udn_Deals_Recorder_Entity a WHERE a.bookingDate>=?1 AND a.bookingDate<=?2")
	List<Udn_Deals_Recorder_Entity> findDealEntityBy_BookingDate(Date startDate,Date endDate);
	
	
	
	@Query("FROM Udn_Deals_Recorder_Entity a WHERE a.travelStartDate>=?1 AND a.travelStartDate<=?2 AND a.dealStatus = ?3 AND a.dealOwner=?4")
	List<Udn_Deals_Recorder_Entity> findDealEntityBy_TravelDate_n_Status_n_Owner(Date startDate,Date endDate,int dealStatus, long dealOwner);
	
	@Query("FROM Udn_Deals_Recorder_Entity a WHERE a.travelStartDate>=?1 AND a.travelStartDate<=?2 AND a.dealStatus = ?3")
	List<Udn_Deals_Recorder_Entity> findDealEntityBy_TravelDate_n_Status(Date startDate,Date endDate,int dealStatus);
	
	
	@Query("FROM Udn_Deals_Recorder_Entity a WHERE a.travelStartDate>=?1 AND a.travelStartDate<=?2 AND a.dealOwner=?3")
	List<Udn_Deals_Recorder_Entity> findDealEntityBy_TravelDate_n_Owner(Date startDate,Date endDate, long dealOwner);
	
	@Query("FROM Udn_Deals_Recorder_Entity a WHERE a.travelStartDate>=?1 AND a.travelStartDate<=?2")
	List<Udn_Deals_Recorder_Entity> findDealEntityBy_TravelDate(Date startDate,Date endDate);
	
	
	Optional<Udn_Deals_Recorder_Entity> findByDealConfirmationIdAndDealOwner(long dealConfirmationId,long dealOwner);
	
		
	boolean existsByclientId(long clientId);
	
	long countByDealStatusAndDealOwner(int status,long dealOwner);
	
	long countByDealStatus(int status);
} 
