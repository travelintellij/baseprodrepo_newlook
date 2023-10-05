package com.udanchoo.intranet.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Destinations_Entity;
import com.udanchoo.intranet.entity.Udn_Services_Master_Entity;

@Repository
public interface Udn_Destinations_Master_Repository extends JpaRepository<Udn_Destinations_Entity,Integer>,JpaSpecificationExecutor{
		
	public List<Udn_Destinations_Entity> findCountryNameDistinctBy();
	
	public List<Udn_Destinations_Entity>  findDistinctByCountryNameContainsAllIgnoreCase(String countryName);
	
	@Query("FROM Udn_Destinations_Entity a WHERE a.cityName=a.countryName AND a.countryCode=?1 AND a.active=true")
	public Udn_Destinations_Entity findDestinationByCountryCode(String countryCode);
	
	@Query("FROM Udn_Destinations_Entity a WHERE a.cityName!=a.countryName AND a.countryCode=?1 AND a.active=true")
	public List<Udn_Destinations_Entity> find_CountryCityList(String countryCode);
	
	boolean existsByCountryCodeAndCountryName(String countryCode, String countryName);
	
	boolean existsByDestinationIdAndCityName(int destinationId, String cityNabyme);
	
	boolean existsByDestinationIdAndCountryName(int destinationId, String countryName);
	
	@Query("FROM Udn_Destinations_Entity a WHERE a.active=true GROUP BY countryCode order by countryName")
	//public List<Udn_Destinations_Entity> findDistinctActiveDestinations();
	public List<Udn_Destinations_Entity> findDistinctRecordsByCountryCode();
	
	//public String findDistinctByCountryCode(String countryCode);
	
	boolean existsByCityNameAndCountryCodeIgnoreCase(String cityName, String countryCode);
}