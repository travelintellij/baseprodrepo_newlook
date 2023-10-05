package com.udanchoo.intranet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Hotel_Master_Entity;
import com.udanchoo.intranet.entity.Udn_SightSeeing_Master_Entity;

@Repository
public interface SightSeeing_Master_Repository extends JpaRepository<Udn_SightSeeing_Master_Entity,Long>,JpaSpecificationExecutor{

	@Query("FROM Udn_SightSeeing_Master_Entity a where a.cityId=?1 and a.active=true")
	public List<Udn_SightSeeing_Master_Entity> find_Active_SightSeeing_By_CityId(int cityId);
	
} 