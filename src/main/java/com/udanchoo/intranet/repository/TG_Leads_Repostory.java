package com.udanchoo.intranet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;

@Repository
public interface TG_Leads_Repostory extends JpaRepository<Tg_Leads_Recorder_Entity,Long>,JpaSpecificationExecutor{

	
} 