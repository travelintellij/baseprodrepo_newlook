package com.udanchoo.intranet.repository.quotation;

import java.util.Date;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Deal_FLT_SL_Entity;
import com.udanchoo.intranet.entity.quotation.Tg_Quotation_Recorder_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Configuration_Manual_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Hotel_Quotation_Entity;

@Repository
public interface Udn_Configuration_Manual_Quotation_Repository extends JpaRepository<Udn_Configuration_Manual_Quotation_Entity,Long>,JpaSpecificationExecutor{

	Udn_Configuration_Manual_Quotation_Entity findByQuotationEntity(Tg_Quotation_Recorder_Entity quotationEntity);
	boolean existsByQuotationEntity(Tg_Quotation_Recorder_Entity quotationEntity);
	
	
	 
} 
