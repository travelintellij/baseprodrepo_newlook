package com.udanchoo.intranet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Tg_Flt_Airport_Entity;
import com.udanchoo.intranet.entity.UdnClientEntity;
import com.udanchoo.intranet.entity.supplier.Tg_Supplier_Contact_Entity;
import com.udanchoo.intranet.entity.supplier.Tg_Supplier_Master_Entity;

@Repository
public interface Tg_Flt_Airport_Repository extends JpaRepository<Tg_Flt_Airport_Entity,Integer>,JpaSpecificationExecutor{

	
	boolean existsByAirportIdAndCityName(int airportId, String cityName);
	

} 