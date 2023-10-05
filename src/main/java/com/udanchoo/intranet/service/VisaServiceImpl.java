package com.udanchoo.intranet.service;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.udanchoo.intranet.entity.Udn_Destinations_Entity;
import com.udanchoo.intranet.entity.Udn_Hotel_Chain_Entity;
import com.udanchoo.intranet.entity.Udn_Hotel_Master_Entity;
import com.udanchoo.intranet.entity.Udn_Room_Category_Entity;
import com.udanchoo.intranet.entity.Udn_SightSeeing_Master_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Consulate_Master_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Doc_Map_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Master_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.SearchHotelObj;
import com.udanchoo.intranet.model.SearchSightSeeingObj;
import com.udanchoo.intranet.model.Udn_Hotel_Chain_Obj;
import com.udanchoo.intranet.model.Udn_Hotel_Master_Obj;
import com.udanchoo.intranet.model.Udn_Room_Category_Obj;
import com.udanchoo.intranet.model.Udn_SightSeeing_Master_Obj;
import com.udanchoo.intranet.model.Udn_Visa_Doc_Map_Obj;
import com.udanchoo.intranet.repository.HotelChain_Repository;
import com.udanchoo.intranet.repository.Hotel_Master_Repository;
import com.udanchoo.intranet.repository.Hotel_Room_Category_Repository;
import com.udanchoo.intranet.repository.SightSeeing_Master_Repository;
import com.udanchoo.intranet.repository.Visa_Consulate_Master_Repository;
import com.udanchoo.intranet.repository.Visa_Doc_Master_Repository;
import com.udanchoo.intranet.repository.Visa_Master_Repository;



@Service
@Transactional
public class VisaServiceImpl {

	

	@Autowired
	Visa_Master_Repository visaMasterRepository;
	
	@Autowired
	Visa_Doc_Master_Repository visaDocMasterRepository;
	
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	Visa_Consulate_Master_Repository visaConsulateRepository;
	
	public  Udn_Visa_Master_Entity saveOrUpdate_Visa(Udn_Visa_Master_Entity visaEntity) {
		visaMasterRepository.save(visaEntity);
		return visaEntity;
	}
	
	public  Udn_Visa_Doc_Map_Entity saveOrUpdate_VisaDoc(Udn_Visa_Doc_Map_Entity visaDocEntity) {
		visaDocMasterRepository.save(visaDocEntity);
		return visaDocEntity;
	}
	
	
	public  boolean visaRecodExists(String countryCode,int consulateCity,int profile,int visaType,int visaPurpose) {
		return visaMasterRepository.existsByCountryCodeAndConsulateCityAndProfileAndVisaTypeAndVisaPurpose(countryCode,consulateCity, profile, visaType, visaPurpose);
		
	}
	
	
	public List<Udn_Visa_Doc_Map_Obj> findVisaDocsByVisaId(int visaId){
		List<Udn_Visa_Doc_Map_Obj> visaDocList = new ArrayList<Udn_Visa_Doc_Map_Obj>();
		if(visaMasterRepository.findById(visaId).isPresent()) {
			Udn_Visa_Master_Entity visaEntity = visaMasterRepository.findById(visaId).get();
			Iterator itrVisaDoc = visaEntity.getVisaDocumentEntityList().iterator();
			while(itrVisaDoc.hasNext()) {
				Udn_Visa_Doc_Map_Obj visaDocObj = new Udn_Visa_Doc_Map_Obj((Udn_Visa_Doc_Map_Entity) itrVisaDoc.next());
				visaDocList.add(visaDocObj);
			}
		}
		return visaDocList;
	}
	
	public Udn_Visa_Master_Entity findVisaEntityById(int visaId) {
		return visaMasterRepository.findById(visaId).get();
	}
	
	
	public Udn_Visa_Doc_Map_Entity findVisaDocEntityById(int visaDocId) {
		return visaDocMasterRepository.findById(visaDocId).get();
	}
	
	public void deleteVisaDocument(int visaDocId) {
		visaDocMasterRepository.deleteById(visaDocId);
	}
	
	public List<Udn_Visa_Master_Entity> findVisaEntityByCountryCode(String countryCode) {
		return visaMasterRepository.findByCountryCode(countryCode);
	}
	
	public  Udn_Visa_Consulate_Master_Entity saveVisaConsulate(Udn_Visa_Consulate_Master_Entity visaConsulateEntity) {
		visaConsulateEntity = visaConsulateRepository.save(visaConsulateEntity);
		return visaConsulateEntity;
	}

	public Optional<Udn_Visa_Consulate_Master_Entity> findVisaConsulateById(int consulateId) {
		return visaConsulateRepository.findById(consulateId);
	}

	public boolean checkVisaConsulateExists(String countryCode,int counsulateCity) {
		return visaConsulateRepository.existsByVisaCountryCodeAndConsulateCity(countryCode,counsulateCity);
	}
	
	
	public List<Udn_Visa_Consulate_Master_Entity> findConsulateByVisaCountryCode(String visaCountryCode){
		return visaConsulateRepository.findByVisaCountryCode(visaCountryCode);
	}

	public List<Udn_Destinations_Entity> findDestination_List_By_ConsulateList(List<Udn_Visa_Consulate_Master_Entity> consulateEntityList) {
		List<Udn_Destinations_Entity> consulateCityList = new ArrayList();
		consulateEntityList.forEach((Udn_Visa_Consulate_Master_Entity consulateEntity) -> {
			consulateCityList.add(commonService.findDestinationById(consulateEntity.getConsulateCity()));    
	        });
		
		return consulateCityList;
	}

	public Optional<Udn_Visa_Master_Entity> findVisaEntityByCompositeUniqueKeys(String countryCode,int consulateCity,int visaType,int visaPurpose,int visaProfile) {
		return visaMasterRepository.findByCountryCodeAndConsulateCityAndVisaTypeAndVisaPurposeAndProfile(countryCode, consulateCity, visaType, visaPurpose,visaProfile);
	}

}
