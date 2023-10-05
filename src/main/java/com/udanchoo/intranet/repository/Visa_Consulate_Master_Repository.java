package com.udanchoo.intranet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import com.udanchoo.intranet.entity.Udn_Visa_Consulate_Master_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Master_Entity;

@Repository
public interface Visa_Consulate_Master_Repository extends JpaRepository<Udn_Visa_Consulate_Master_Entity,Integer>,JpaSpecificationExecutor{

	boolean existsByVisaCountryCodeAndConsulateCity(String countryCode,int consulateCity);
	List<Udn_Visa_Consulate_Master_Entity> findByVisaCountryCode(String visaCountryCode);
} 