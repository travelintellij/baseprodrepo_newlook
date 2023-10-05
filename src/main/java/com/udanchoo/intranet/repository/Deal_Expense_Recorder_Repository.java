package com.udanchoo.intranet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Deal_Expense_Recorder_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_FLT_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;

@Repository
public interface Deal_Expense_Recorder_Repository extends JpaRepository<Udn_Deal_Expense_Recorder_Entity,Long>{
	 
	@Query("FROM Udn_Deal_Expense_Recorder_Entity a WHERE a.dealConfirmationId=?1")
	List<Udn_Deal_Expense_Recorder_Entity> find_Expenses_By_DealId(long dealConfirmationId);
	
} 