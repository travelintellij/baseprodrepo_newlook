package com.udanchoo.intranet.repository.quotation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.quotation.Tg_Quotation_Recorder_Entity;

@Repository
public interface TG_Quotations_Repository extends JpaRepository<Tg_Quotation_Recorder_Entity,Long>,JpaSpecificationExecutor{

	@Query("SELECT COALESCE(Max(version),0) FROM Tg_Quotation_Recorder_Entity a where a.leadEntity.leadId=?1")
	int max_QuotationVersionGenerated(long leadId); 
	
	
	
} 
