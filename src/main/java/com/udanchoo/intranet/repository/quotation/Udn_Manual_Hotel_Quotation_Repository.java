package com.udanchoo.intranet.repository.quotation;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Hotel_Master_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Hotel_Quotation_Entity;

@Repository
public interface Udn_Manual_Hotel_Quotation_Repository extends JpaRepository<Udn_Manual_Hotel_Quotation_Entity,Long>,JpaSpecificationExecutor{

	@Query("SELECT COALESCE(Max(optionNo),0) FROM Udn_Manual_Hotel_Quotation_Entity a where a.quotationEntity.quotationId=?1")
	int max_HotelOptionGenerated(long quotationId); 
	
	@Query("SELECT count(*) FROM Udn_Manual_Hotel_Quotation_Entity a where a.quotationEntity.quotationId=?1 and a.optionNo=?2")
	int count_Numberof_HotelOptions_For_Quotation(long quotationId, int optionNo);
	
	@Modifying
	@Query("update Udn_Manual_Hotel_Quotation_Entity a set a.optionNo = a.optionNo-1 where a.quotationEntity.quotationId = ?1 and a.optionNo>?2")
	int update_Rearrange_HotelOptionNoForQuotation(long quotationId,int optionNo); 
	
	
	@Query("select distinct a.optionNo FROM Udn_Manual_Hotel_Quotation_Entity a where a.quotationEntity.quotationId=?1 and a.optionNo>0")
	public List<Integer> findDistinctHotelsOptionByQuotation(long quotationId);
	
	
	@Query("FROM Udn_Manual_Hotel_Quotation_Entity a where a.quotationEntity.quotationId=?1 and optionNo=?2 order by a.displayOrder")
	public List<Udn_Manual_Hotel_Quotation_Entity> findHotelsByQuotationIdAndOptionNo(long quotationId,int optionNo);
	
} 
