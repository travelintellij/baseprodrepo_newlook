package com.udanchoo.intranet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Task_Comments_Entity;
import com.udanchoo.intranet.entity.Udn_Task_Recorder_Entity;

@Repository
public interface Task_Comments_Repository extends JpaRepository<Udn_Task_Comments_Entity,Long>,JpaSpecificationExecutor{
	 
	
} 