package com.udanchoo.intranet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.UdnClientEntity;

@Repository
public interface ClientRepository extends JpaRepository<UdnClientEntity,Long>,JpaSpecificationExecutor{

	@Query("FROM UdnClientEntity a join Udn_Deals_Recorder_Entity b on a.clientId=b.clientId AND b.dealConfirmationId=?1")
	UdnClientEntity find_ClientByDealConfirmationId(Long dealConfirmationId);
	
	boolean existsByclientIdAndClientName(long clientId, String clientName);
} 