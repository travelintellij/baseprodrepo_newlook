package com.udanchoo.intranet.repository.quotation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.quotation.Udn_Manual_Cruise_Quotation_Entity;

@Repository
public interface Udn_Manual_Cruise_Quotation_Repository extends JpaRepository<Udn_Manual_Cruise_Quotation_Entity,Long>,JpaSpecificationExecutor{

	
} 
