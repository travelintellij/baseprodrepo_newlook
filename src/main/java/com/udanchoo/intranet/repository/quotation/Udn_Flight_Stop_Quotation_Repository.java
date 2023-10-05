package com.udanchoo.intranet.repository.quotation;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Visa_Doc_Map_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Flight_Quotation_Stop_Detail_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Flight_Quotation_Entity;

@Repository
public interface Udn_Flight_Stop_Quotation_Repository extends JpaRepository<Udn_Flight_Quotation_Stop_Detail_Entity,Long>,JpaSpecificationExecutor{

	//@Query("delete FROM Udn_Flight_Quotation_Stop_Detail_Entity a where a.manualFlightQuotationEntity.manualFlightQuotationId=?1")
	//public void deleteChildRecordsByFlightQuotationId(long manualFlightQuotationId);
	long deleteByManualFlightQuotationEntity(Udn_Manual_Flight_Quotation_Entity manualFlightEntity);
	long countByManualFlightQuotationEntity(Udn_Manual_Flight_Quotation_Entity manualFlightEntity);
} 
