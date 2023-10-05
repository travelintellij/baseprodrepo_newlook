package com.udanchoo.intranet.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Deal_FLT_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_HTL_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_Services_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_Status_Entity;
import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;
import com.udanchoo.intranet.entity.Udn_Destinations_Entity;

@Repository
public interface Deal_Status_Repository extends JpaRepository<Udn_Deal_Status_Entity,Integer>{

	List <Udn_Deal_Status_Entity> findByWorkloadStatusObj(String workLoadStatus);
	
	
	List<Udn_Deal_Status_Entity> findDistinctByworkloadStatusObjType(String workloadType);
	
	//Following method is used to populate the dashboard and considers the unique workload names. workload object status is kept
	//uniform across all workload obj types. 
	@Query("SELECT DISTINCT a.workloadStatusShortName FROM Udn_Deal_Status_Entity a where a.workloadStatusObjType=?1 order by workloadStatusShortName asc")
	List<String>  findUniqueShortStatusBasedOnObjectType(String workLoadObjType);
	
	@Query("FROM Udn_Deal_Status_Entity a order by workloadStatusObj")
	public List<Udn_Deal_Status_Entity> findStatusRecordsGroupBy();
	
	/*
	@Query("SELECT DISTINCT a.workloadStatusObj FROM Udn_Deal_Status_Entity a where a.workloadStatusObjType=?1 order by workloadStatusObj asc")
	List<String>  findUniqueWorkLoadObjBasedOnType(String workloadType);
	*/
	
} 