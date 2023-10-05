package com.udanchoo.intranet.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Hotel_Master_Entity;
import com.udanchoo.intranet.entity.Udn_SightSeeing_Master_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Master_Entity;

@Repository
public interface Visa_Master_Repository extends JpaRepository<Udn_Visa_Master_Entity,Integer>,JpaSpecificationExecutor{

	List<Udn_Visa_Master_Entity> findByCountryCode(String countryCode);
	
	boolean existsByCountryCodeAndConsulateCityAndProfileAndVisaTypeAndVisaPurpose(String countryCode,int consulateCity,int profile,int visaType, int visaPurpose);
	
	
	Optional<Udn_Visa_Master_Entity> findByCountryCodeAndConsulateCityAndVisaTypeAndVisaPurposeAndProfile(String countryCode,int consulateCity,int visaType,int visaPurpose,int visaProfile);
	
	
} 