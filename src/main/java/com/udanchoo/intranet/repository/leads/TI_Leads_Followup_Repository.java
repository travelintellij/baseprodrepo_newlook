package com.udanchoo.intranet.repository.leads;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.leads.TI_Leads_Followup_Entity;

@Repository
public interface TI_Leads_Followup_Repository extends JpaRepository<TI_Leads_Followup_Entity,Long>,JpaSpecificationExecutor{
	 
	
} 