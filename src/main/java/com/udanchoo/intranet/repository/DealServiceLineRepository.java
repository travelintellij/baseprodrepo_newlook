package com.udanchoo.intranet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Deal_CRS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_FLT_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_HTL_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_INS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_LDP_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_OTH_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_STS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_Services_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_TRN_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_VSA_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;

@Repository
public interface DealServiceLineRepository extends JpaRepository<Udn_Deal_Services_Entity,Long>{

	//TODO new column of dealConfirmationId is added to UDN_FL_SL table and these joins should simply go away. remove this and test it. 
	@Query("FROM Udn_Deal_FLT_SL_Entity a join Udn_Deal_Services_Entity b on a.serviceMapId = b.serviceMapId where b.parentDealRecord.dealConfirmationId=?1 and b.parentDealRecord.dealOwner=?2")
	List<Udn_Deal_FLT_SL_Entity> findFLTServiceLinesBasedonDealIdAndDealOwner(long dealconfirmationId,long dealOwner);

	@Query("FROM Udn_Deal_FLT_SL_Entity a join Udn_Deal_Services_Entity b on a.serviceMapId = b.serviceMapId where b.parentDealRecord.dealConfirmationId=?1 order by displayOrder")
	List<Udn_Deal_FLT_SL_Entity> findFLTServiceLinesBasedonDealId(long dealconfirmationId);

	
	
	@Query("FROM Udn_Deal_Services_Entity a where a.parentDealRecord.dealConfirmationId=?1 and a.dealServiceCode=?2 and a.parentDealRecord.dealOwner=?3")
	Udn_Deal_Services_Entity find_Service_Map_DealWithOwner(long dealConfirmationId,String dealServiceCode,long dealOwner);
	
	
	@Query("FROM Udn_Deal_Services_Entity a where a.parentDealRecord.dealConfirmationId=?1 and a.dealServiceCode=?2")
	Udn_Deal_Services_Entity find_Service_Map_Deal(long dealConfirmationId,String dealServiceCode);
		
	@Query("FROM Udn_Deal_HTL_SL_Entity a join Udn_Deal_Services_Entity b on a.serviceMapId = b.serviceMapId where b.parentDealRecord.dealConfirmationId=?1 and b.parentDealRecord.dealOwner=?2 order by displayOrder")
	List<Udn_Deal_HTL_SL_Entity> findHTLServiceLinesBasedonDealIdAndDealOwner(long dealconfirmationId,long dealOwner);

	@Query("FROM Udn_Deal_HTL_SL_Entity a join Udn_Deal_Services_Entity b on a.serviceMapId = b.serviceMapId where b.parentDealRecord.dealConfirmationId=?1 order by a.displayOrder")
	List<Udn_Deal_HTL_SL_Entity> findHTLServiceLinesBasedonDealId(long dealconfirmationId);

	
	@Query("FROM Udn_Deal_INS_SL_Entity a join Udn_Deal_Services_Entity b on a.serviceMapId = b.serviceMapId where b.parentDealRecord.dealConfirmationId=?1 and b.parentDealRecord.dealOwner=?2 order by a.displayOrder")
	List<Udn_Deal_INS_SL_Entity> findINSServiceLinesBasedonDealIdAndOwner(long dealconfirmationId,long dealOwner);
	
	@Query("FROM Udn_Deal_INS_SL_Entity a join Udn_Deal_Services_Entity b on a.serviceMapId = b.serviceMapId where b.parentDealRecord.dealConfirmationId=?1 order by displayOrder")
	List<Udn_Deal_INS_SL_Entity> findINSServiceLinesBasedonDealId(long dealconfirmationId);
	
	
	
	@Query("FROM Udn_Deal_LDP_SL_Entity a join Udn_Deal_Services_Entity b on a.serviceMapId = b.serviceMapId where b.parentDealRecord.dealConfirmationId=?1 and b.parentDealRecord.dealOwner=?2 order by displayOrder")
	List<Udn_Deal_LDP_SL_Entity> findLDPServiceLinesBasedonDealIdAndOwner(long dealconfirmationId,long dealOwner);
	
	@Query("FROM Udn_Deal_LDP_SL_Entity a join Udn_Deal_Services_Entity b on a.serviceMapId = b.serviceMapId where b.parentDealRecord.dealConfirmationId=?1 order by displayOrder")
	List<Udn_Deal_LDP_SL_Entity> findLDPServiceLinesBasedonDealId(long dealconfirmationId);
	
	@Query("FROM Udn_Deal_OTH_SL_Entity a join Udn_Deal_Services_Entity b on a.serviceMapId = b.serviceMapId where b.parentDealRecord.dealConfirmationId=?1 and b.parentDealRecord.dealOwner=?2")
	List<Udn_Deal_OTH_SL_Entity> findOTHServiceLinesBasedonDealIdAndOwner(long dealconfirmationId,long dealOwner);
	
	@Query("FROM Udn_Deal_OTH_SL_Entity a join Udn_Deal_Services_Entity b on a.serviceMapId = b.serviceMapId where b.parentDealRecord.dealConfirmationId=?1")
	List<Udn_Deal_OTH_SL_Entity> findOTHServiceLinesBasedonDealId(long dealconfirmationId);
	
	
	@Query("FROM Udn_Deal_STS_SL_Entity a join Udn_Deal_Services_Entity b on a.serviceMapId = b.serviceMapId where b.parentDealRecord.dealConfirmationId=?1 and b.parentDealRecord.dealOwner=?2 order by displayOrder")
	List<Udn_Deal_STS_SL_Entity> findSTSServiceLinesBasedonDealIdAndOwner(long dealconfirmationId,long dealOwner);
	
	@Query("FROM Udn_Deal_STS_SL_Entity a join Udn_Deal_Services_Entity b on a.serviceMapId = b.serviceMapId where b.parentDealRecord.dealConfirmationId=?1 order by displayOrder")
	List<Udn_Deal_STS_SL_Entity> findSTSServiceLinesBasedonDealId(long dealconfirmationId);

	
	
	@Query("FROM Udn_Deal_TRN_SL_Entity a join Udn_Deal_Services_Entity b on a.serviceMapId = b.serviceMapId where b.parentDealRecord.dealConfirmationId=?1 and b.parentDealRecord.dealOwner=?2 order by displayOrder")
	List<Udn_Deal_TRN_SL_Entity> findTRNServiceLinesBasedonDealIdAndOwner(long dealconfirmationId,long dealOwner);
	
	@Query("FROM Udn_Deal_TRN_SL_Entity a join Udn_Deal_Services_Entity b on a.serviceMapId = b.serviceMapId where b.parentDealRecord.dealConfirmationId=?1 order by displayOrder")
	List<Udn_Deal_TRN_SL_Entity> findTRNServiceLinesBasedonDealId(long dealconfirmationId);
	
	
	@Query("FROM Udn_Deal_VSA_SL_Entity a join Udn_Deal_Services_Entity b on a.serviceMapId = b.serviceMapId where b.parentDealRecord.dealConfirmationId=?1 and b.parentDealRecord.dealOwner=?2")
	List<Udn_Deal_VSA_SL_Entity> findVSAServiceLinesBasedonDealIdAndOwner(long dealconfirmationId,long dealOwner);

	@Query("FROM Udn_Deal_VSA_SL_Entity a join Udn_Deal_Services_Entity b on a.serviceMapId = b.serviceMapId where b.parentDealRecord.dealConfirmationId=?1")
	List<Udn_Deal_VSA_SL_Entity> findVSAServiceLinesBasedonDealId(long dealconfirmationId);

	
	@Query("FROM Udn_Deal_CRS_SL_Entity a join Udn_Deal_Services_Entity b on a.serviceMapId = b.serviceMapId where b.parentDealRecord.dealConfirmationId=?1 and b.parentDealRecord.dealOwner=?2 order by displayOrder")
	List<Udn_Deal_CRS_SL_Entity> findCRSServiceLinesBasedonDealIdAndOwner(long dealconfirmationId,long dealOwner);
	
	@Query("FROM Udn_Deal_CRS_SL_Entity a join Udn_Deal_Services_Entity b on a.serviceMapId = b.serviceMapId where b.parentDealRecord.dealConfirmationId=?1 order by displayOrder")
	List<Udn_Deal_CRS_SL_Entity> findCRSServiceLinesBasedonDealId(long dealconfirmationId);

	
} 