package com.udanchoo.intranet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Ticket_Comments_Entity;

@Repository
public interface Ticket_Comments_Repository extends JpaRepository<Udn_Ticket_Comments_Entity,Long>,JpaSpecificationExecutor{
	 
	
} 