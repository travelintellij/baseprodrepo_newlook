package com.udanchoo.intranet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Deal_FLT_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Hotel_Chain_Entity;

@Repository
public interface HotelChain_Repository extends JpaRepository<Udn_Hotel_Chain_Entity,Integer>,JpaSpecificationExecutor{

	@Query("FROM Udn_Hotel_Chain_Entity a where a.hotelChainName like %?1%")
	List<Udn_Hotel_Chain_Entity> find_HotelChain_ByNameLike(String hotelChainName);
	
	@Query("FROM Udn_Hotel_Chain_Entity a where a.active=true order by a.hotelChainName")
	List<Udn_Hotel_Chain_Entity> find_All_Active_HotelChain();
	
} 