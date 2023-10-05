package com.udanchoo.intranet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Services_Master_Entity;

@Repository
public interface Udn_Services_Master_Repository extends JpaRepository<Udn_Services_Master_Entity,String>{
		
		
}