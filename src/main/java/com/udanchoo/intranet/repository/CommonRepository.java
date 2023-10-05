package com.udanchoo.intranet.repository;

import java.util.LinkedList;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Tg_Flt_Airport_Entity;
import com.udanchoo.intranet.entity.UdnIncentiveEntity;
import com.udanchoo.intranet.entity.Udn_Airline_Master_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_Status_Entity;
import com.udanchoo.intranet.entity.Udn_Destinations_Entity;

@Repository
public interface CommonRepository extends JpaRepository<UdnIncentiveEntity,Long>{

	@Query("FROM Udn_Destinations_Entity a WHERE a.active=true")
	List <Udn_Destinations_Entity>findAllActiveUdnDestinations();
	
	@Query("FROM Udn_Airline_Master_Entity a WHERE a.airlineId=?1")
	Udn_Airline_Master_Entity findAirlinebyId(long airlineId);
	
	@Query("FROM Udn_Destinations_Entity a WHERE a.destinationId=?1")
	Udn_Destinations_Entity findDestinationById(int destinationId);
	
	@Query("FROM Udn_Airline_Master_Entity a order by a.airlineShortName")
	List<Udn_Airline_Master_Entity> findAllAirlines();
	
	
	@Query("FROM Udn_Deal_Status_Entity a where a.workloadStatusObj=?1 order by a.workloadStatusId")
	List<Udn_Deal_Status_Entity> find_All_Status_Deal_Obj(String workloadObj);
	
	@Query("FROM Udn_Deal_Status_Entity a where a.workloadStatusObj=?1 AND a.workloadStatusId=?2")
	Udn_Deal_Status_Entity find_SL_Deal_Obj_Based_On_Status(String workloadObj,int statusId);
	
	@Query("FROM Udn_Destinations_Entity a WHERE a.cityName=a.countryName AND a.active=true")
	List <Udn_Destinations_Entity>findAllActiveUdnCountries();
	
	
	@Query("FROM Tg_Flt_Airport_Entity a WHERE a.active=true")
	List <Tg_Flt_Airport_Entity>findAllActiveAirportCities();

} 