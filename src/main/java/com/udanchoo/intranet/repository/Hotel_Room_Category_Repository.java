package com.udanchoo.intranet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.udanchoo.intranet.entity.Udn_Deal_FLT_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_Services_Entity;
import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;
import com.udanchoo.intranet.entity.Udn_Hotel_Master_Entity;
import com.udanchoo.intranet.entity.Udn_Room_Category_Entity;

@Repository
public interface Hotel_Room_Category_Repository extends JpaRepository<Udn_Room_Category_Entity,Integer>{

	@Query("FROM Udn_Room_Category_Entity a where a.hotelId.hotelId=?1 AND a.active=true AND a.deleted=false")
	public List<Udn_Room_Category_Entity> findActiveRoomCategoryBy_HotelId(int hotelId);

	@Query("FROM Udn_Room_Category_Entity a where a.hotelId.hotelId=?1")
	public List<Udn_Room_Category_Entity> find_All_RoomCategoryBy_HotelId(int hotelId);
	
	 
} 