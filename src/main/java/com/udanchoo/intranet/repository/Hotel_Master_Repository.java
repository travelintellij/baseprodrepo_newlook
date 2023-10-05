package com.udanchoo.intranet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.udanchoo.intranet.entity.Udn_Hotel_Master_Entity;

@Repository
public interface Hotel_Master_Repository extends JpaRepository<Udn_Hotel_Master_Entity,Integer>,JpaSpecificationExecutor{

	@Query("FROM Udn_Hotel_Master_Entity a where a.hotelChainId=?1")
	public List<Udn_Hotel_Master_Entity> findHotelsByChainId(int hotelChainId);

	//@Query("FROM Udn_Hotel_Master_Entity a where a.cityId=?1 and active=true")
	@Query("FROM Udn_Hotel_Master_Entity a join Udn_Hotel_Chain_Entity b on a.hotelChainId = b.hotelChainId where a.cityId=?1 and a.active=true and b.active=true")
	public List<Udn_Hotel_Master_Entity> find_Active_Hotels_By_CityId(int cityId);
	
	boolean existsByHotelIdAndHotelName(int hotelId,String hotelName);
	
} 