package com.udanchoo.intranet.repository.incentive;


import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.UdnIncentiveEntity;

@Repository
public interface IncentiveRepository extends JpaRepository<UdnIncentiveEntity,Long>,JpaSpecificationExecutor{


	List<UdnIncentiveEntity> findAllByCreatedAtBetween(Date dateFrom,Date dateTo);
	
	/*
	//@Query("FROM udnincentive a WHERE a.requestedDate > ?1 AND a.requestedDate < ?2 AND a.status=?3 AND a.userid=?4")
	@Query("FROM UdnIncentiveEntity a WHERE a.status=?1 AND a.requestedDate>=?2 AND a.requestedDate<=?3 AND a.claimantId=?4")
	List<UdnIncentiveEntity> findIncentiveSearchRecords(String status,Date claimFromDate,Date claimToDate,long claimantId);

	@Query("FROM UdnIncentiveEntity a WHERE a.requestedDate>=?1 AND a.requestedDate<=?2 AND a.claimantId=?3")
	List<UdnIncentiveEntity> findAllUserIncentives(Date claimFromDate,Date claimToDate,long claimantId);
	
	@Query("FROM UdnIncentiveEntity a WHERE a.requestedDate>=?1 AND a.requestedDate<=?2")
	List<UdnIncentiveEntity> findAllIncentives(Date fromDate,Date toDate);
	*/
	UdnIncentiveEntity findByDealConfirmationIdAndClaimantId(long dealConfirmationId,long claimantId);
	
	boolean existsByDealConfirmationIdAndClaimantId(long dealConfirmationId, int claimantId);
	
} 