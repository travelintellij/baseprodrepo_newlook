package com.udanchoo.intranet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Room_Category_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Doc_Map_Entity;

@Repository
public interface Visa_Doc_Master_Repository extends JpaRepository<Udn_Visa_Doc_Map_Entity,Integer>,JpaSpecificationExecutor{

	
	@Query("FROM Udn_Visa_Doc_Map_Entity a where a.visaId.visaId=?1")
	public List<Udn_Visa_Doc_Map_Entity> find_All_VisaDocsBy_VisaId(int visaId);
	
} 