package com.udanchoo.intranet.service;


import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Subquery;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.udanchoo.intranet.entity.Tg_Flt_Airport_Entity;
import com.udanchoo.intranet.entity.UdnClientEntity;
import com.udanchoo.intranet.entity.Udn_Airline_Master_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_Status_Entity;
import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;
import com.udanchoo.intranet.entity.Udn_Destinations_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.AirLineVO;
import com.udanchoo.intranet.model.UdnDealStatusVO;
import com.udanchoo.intranet.model.Udn_Deals_Recorder_Obj;
import com.udanchoo.intranet.model.Udn_Destinations_Master_Obj;
import com.udanchoo.intranet.repository.CommonRepository;
import com.udanchoo.intranet.repository.DealRepository;
import com.udanchoo.intranet.repository.Deal_Status_Repository;
import com.udanchoo.intranet.repository.Tg_Flt_Airport_Repository;
import com.udanchoo.intranet.repository.Udn_Destinations_Master_Repository;
import com.udanchoo.intranet.repository.UserRepository;
import com.udanchoo.intranet.util.UdanChooConstants;





@Service
public class UdnCommonServicesImpl {

	
	@Autowired
	UserRepository userRepository;

	@Autowired
	CommonRepository commonRepository;
	
	@Autowired
	Deal_Status_Repository dealStatusRepository;
	
	@Autowired
	Udn_Destinations_Master_Repository destinationRepository;
	
	@Autowired
	Tg_Flt_Airport_Repository fltAirportRepository;
	
	
	@Autowired
	DealServiceImpl dealService;
	
	@Autowired
	ClientServiceImpl clientService;
	
	@Autowired
	DealRepository dealRepository;
	

	
	public List<Udn_Destinations_Entity> listAllActiveDestinations()   {
		List<Udn_Destinations_Entity> listDestinations= commonRepository.findAllActiveUdnDestinations();
		return listDestinations;
	}
	
	public List<Udn_Destinations_Entity> listCountry(String countryName)   {
		List<Udn_Destinations_Entity> listDestinations= commonRepository.findAllActiveUdnCountries();
		
		return listDestinations;
	}
	
	
	public Udn_Airline_Master_Entity findAirlinebyId(long airlineId) {
		return commonRepository.findAirlinebyId(airlineId);
	}
	
	
	public Udn_Destinations_Entity findDestinationById(int destinationId) {
		return commonRepository.findDestinationById(destinationId);
	}
	
	

	public List<AirLineVO> find_All_Airlines_Min() {
		List<Udn_Airline_Master_Entity> airlineEntityList =  commonRepository.findAllAirlines();
		List<AirLineVO> airlinesMinVoList = new ArrayList();
		Iterator itrAirlinesEntity = airlineEntityList.iterator();
		
		while(itrAirlinesEntity.hasNext()) {
			Udn_Airline_Master_Entity airlineEntity = (Udn_Airline_Master_Entity)itrAirlinesEntity.next();
			AirLineVO airlineVo = new AirLineVO();
			airlineVo.setAirlineId(airlineEntity.getAirlineId());
			airlineVo.setAirlineShortName(airlineEntity.getAirlineShortName());
			airlinesMinVoList.add(airlineVo);
		}
		Collections.sort(airlinesMinVoList);
		return airlinesMinVoList ;
	}

	public Map<Long,String> find_All_Airlines_Min_Map() {
		List<Udn_Airline_Master_Entity> airlineEntityList =  commonRepository.findAllAirlines();
		Map<Long,String> airlinesMap = new LinkedHashMap<>();
		Iterator itrAirlinesEntity = airlineEntityList.iterator();
		
		while(itrAirlinesEntity.hasNext()) {
			Udn_Airline_Master_Entity airlineEntity = (Udn_Airline_Master_Entity)itrAirlinesEntity.next();
			airlinesMap.put(airlineEntity.getAirlineId(), airlineEntity.getAirlineShortName());
		}
		
		//Map<Long,String> sortedByName = airlinesMap.entrySet() .stream() .sorted(Map.Entry.comparingByValue()) .collect(Collectors.toMap(e -> e.getKey(),e -> e.getValue()));
		return airlinesMap ;
	}

	
	
	public HashMap find_All_Airlines_map() {
		List<Udn_Airline_Master_Entity> airlineEntityList =  commonRepository.findAllAirlines();
		Iterator itrAirlinesEntity = airlineEntityList.iterator();
		HashMap airlineMap = new HashMap();
		while(itrAirlinesEntity.hasNext()) {
			Udn_Airline_Master_Entity airlineEntity = (Udn_Airline_Master_Entity)itrAirlinesEntity.next();
			airlineMap.put(airlineEntity.getAirlineId(), airlineEntity.getAirlineShortName());
		}
		
		//Collections.sort(airlineMap.keySet());
		return airlineMap ;
	}
	
	public Udn_Airline_Master_Entity findAirlineById(long airlineId) {
		return commonRepository.findAirlinebyId(airlineId);
	}
	
	public List<UdnDealStatusVO> find_All_Status_Deal_Obj(String workloadObj){
		List<Udn_Deal_Status_Entity> dealStatusEntityList = commonRepository.find_All_Status_Deal_Obj(workloadObj);
		List<UdnDealStatusVO> udnDealStatusVOList = new ArrayList();
		Iterator itrDealStatusEntity = dealStatusEntityList.iterator();
		
		while(itrDealStatusEntity.hasNext()) {
			Udn_Deal_Status_Entity dealStatusEntity = (Udn_Deal_Status_Entity)itrDealStatusEntity.next();
			if(dealStatusEntity.isActive()) {
				UdnDealStatusVO udnDealStatusVO = new UdnDealStatusVO(dealStatusEntity);
				udnDealStatusVOList.add(udnDealStatusVO);
			}
		}
		return udnDealStatusVOList;
	}
	
	public List<UdnDealStatusVO> find_All_Active_Status_Deal_Obj(String workloadObj){
		List<Udn_Deal_Status_Entity> dealStatusEntityList = commonRepository.find_All_Status_Deal_Obj(workloadObj);
		List<UdnDealStatusVO> udnDealStatusVOList = new ArrayList();
		Iterator itrDealStatusEntity = dealStatusEntityList.iterator();
		
		while(itrDealStatusEntity.hasNext()) {
			Udn_Deal_Status_Entity dealStatusEntity = (Udn_Deal_Status_Entity)itrDealStatusEntity.next();
			if(dealStatusEntity.isActive()) {
				UdnDealStatusVO udnDealStatusVO = new UdnDealStatusVO(dealStatusEntity);
				udnDealStatusVOList.add(udnDealStatusVO);
			}
		}
		return udnDealStatusVOList;
	}
	
	
	public Udn_Deal_Status_Entity find_SL_Deal_Obj_Based_On_Status(String workloadObj,int statusId) {
		return commonRepository.find_SL_Deal_Obj_Based_On_Status(workloadObj,statusId);
	}
	
	public Udn_Deal_Status_Entity find_DealStatusById(int statusId) {
		return dealStatusRepository.findById(statusId).get();
	}
	
	public Udn_Destinations_Entity findDestinationByCountryCode(String countryCode) {
		return destinationRepository.findDestinationByCountryCode(countryCode);
	}

	public List<Udn_Destinations_Entity> find_CountryCityList(String countryCode) {
		return destinationRepository.find_CountryCityList(countryCode);
	}

	
	
	public List<Udn_Deal_Status_Entity> find_DealStatusByWorkLoad(String workloadType) {
		return dealStatusRepository.findByWorkloadStatusObj(workloadType);
	}

	public List<Udn_Deals_Recorder_Obj> find_Relevant_Deals(String dealKeyword,long dealOwner,boolean isAdmin) throws RecordNotFoundException {
		List<Udn_Deals_Recorder_Obj> dealSearchList = new ArrayList();
		if(StringUtils.isNumeric(dealKeyword)) {
			try {
				//Udn_Deals_Recorder_Entity dealEntity = dealService.findBy_DealConfirmationId_And_DealOwner(Long.parseLong(dealKeyword),dealOwner,isAdmin);
				Udn_Deals_Recorder_Entity dealEntity = dealService.findByDealConfirmationId_DealOwner_TaggedTeam(Long.parseLong(dealKeyword),dealOwner,isAdmin);
				if(dealEntity!=null) {
					Udn_Deals_Recorder_Obj dealObj = new Udn_Deals_Recorder_Obj(dealEntity);
					dealObj.setClientName((clientService.getClientById(dealObj.getClientId()).getClientName()));
					dealObj.setTravelingFromCity(findDestinationById(dealObj.getTravelingFrom()).getCityName());
					dealObj.setTravelingToCity(findDestinationById(dealObj.getTravelingTo()).getCityName());
					dealSearchList.add(dealObj);
				}
			
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			List<Udn_Deals_Recorder_Entity> dealList = searchDealsBasedOnClient(dealOwner, dealKeyword,isAdmin);
			List<Udn_Deals_Recorder_Obj> dealObjList = convertDealListToObj(dealList);
			dealSearchList.addAll(dealObjList);
		}
		return dealSearchList;
	}
	
	
	public List<Udn_Deals_Recorder_Obj> convertDealListToObj(List dealList) {
		Iterator itrDealList = dealList.iterator();
		List dealObjList = new ArrayList();
		while(itrDealList.hasNext()) {
			Udn_Deals_Recorder_Obj dealObj = new Udn_Deals_Recorder_Obj((Udn_Deals_Recorder_Entity)itrDealList.next()); 
			try {
				dealObj.setClientName((clientService.getClientById(dealObj.getClientId()).getClientName()));
				dealObj.setTravelingFromCity(findDestinationById(dealObj.getTravelingFrom()).getCityName());
				dealObj.setTravelingToCity(findDestinationById(dealObj.getTravelingTo()).getCityName());

			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			dealObjList.add(dealObj);
		}
		return dealObjList;
	}

	/************************************* Custom Logic Built for client based name deal elastic search ************/
	public List<Udn_Deals_Recorder_Entity>  searchDealsBasedOnClient(long dealOwner,String clientName,boolean isAdmin) {	
	    Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
		Date criteriaDate = cal.getTime();
		List<Udn_Deals_Recorder_Entity> filteredDealsRecorderEntity = dealRepository.findAll(new Specification<Udn_Deals_Recorder_Entity>() {
			@Override
			public Predicate toPredicate(Root<Udn_Deals_Recorder_Entity> dealRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				List<Predicate> predicates = new ArrayList<>();
				
				if(!isAdmin) {
					predicates.add(criteriaBuilder.equal(dealRootEntity.get("dealOwner"), dealOwner));
					
/*
					// Add condition for team members using a subquery
			        Subquery<Long> subquery = query.subquery(Long.class);
			        Root<Udn_Deals_Recorder_Entity> subqueryRoot = subquery.from(Udn_Deals_Recorder_Entity.class);
			        subquery.select(subqueryRoot.get("dealOwner"));
			        subquery.where(criteriaBuilder.equal(subqueryRoot.join("teamMembers").get("id"), dealOwner));
			        */

					
				}
				
				predicates.add(criteriaBuilder.greaterThanOrEqualTo(dealRootEntity.get("createdAt"),criteriaDate));
				if(clientName!=null && clientName.trim().length()>0) {
					Root<UdnClientEntity> clientRootEntity = query.from(UdnClientEntity.class);
					List<Predicate> clientPredicateList = new ArrayList<>();
					Predicate clientIdPredicate = criteriaBuilder.equal(clientRootEntity.get("clientId"),dealRootEntity.get("clientId"));
					Predicate clientNamePredicate = criteriaBuilder.like(clientRootEntity.get("clientName"), clientName+"%");
					clientPredicateList.add(clientNamePredicate);
					clientPredicateList.add(clientIdPredicate);
					predicates.addAll(clientPredicateList);
				}
				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
			}
		});
		return filteredDealsRecorderEntity;
	}
	
	public boolean existsByCountryCodeAndCountryName(String countryCode, String countryName) {
		return destinationRepository.existsByCountryCodeAndCountryName(countryCode, countryName);
	}
	
	public boolean existsByDestinationIdAndCityName(int destinationId, String cityName) {
		return destinationRepository.existsByDestinationIdAndCityName(destinationId, cityName);
	}
	
	public boolean existsByDestinationIdAndCountryName(int destinationId, String countryName) {
		return destinationRepository.existsByDestinationIdAndCountryName(destinationId, countryName);
	}
	
	public boolean existsByAirportIdAndCityName(int airportId, String cityName) {
		return fltAirportRepository.existsByAirportIdAndCityName(airportId, cityName);
	}
	

	public boolean existsByCityNameAndCountryCode(String cityName, String countryCode) {
		return destinationRepository.existsByCityNameAndCountryCodeIgnoreCase(cityName, countryCode);
	}

	/*
	public String findDistinct_CountryName_BasedOn_CountryCode(String countryCode) {
		return destinationRepository.findDistinctByCountryCode(countryCode);
	}*/
	
	public Tg_Flt_Airport_Entity findAirportById(int airportId) {
		return fltAirportRepository.findById(airportId).get();
	}
	
	public List<Udn_Destinations_Entity> findDistinctActiveDestinationList(){
		return destinationRepository.findDistinctRecordsByCountryCode();
	}
	
	public Udn_Destinations_Entity saveCity(Udn_Destinations_Entity cityEntity) {
		destinationRepository.save(cityEntity);
		return cityEntity;
	}
	

	public Page<Udn_Destinations_Entity>  filterCities(int pageNo,int pageSize,String sortBy,Udn_Destinations_Master_Obj searchCityObj) {
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sortBy));
		Page<Udn_Destinations_Entity> filteredCityList = destinationRepository.findAll(new Specification<Udn_Destinations_Entity>() {
			/**
			 * 
			 */
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Udn_Destinations_Entity> cityRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				List<Predicate> predicates = new ArrayList<>();
				if(!(searchCityObj.getDestinationId()==UdanChooConstants.DESTINATION_ALL_CITIES || searchCityObj.getDestinationId()==0)) {
					predicates.add(criteriaBuilder.equal(cityRootEntity.get("destinationId"), searchCityObj.getDestinationId()));
				}
				if(!searchCityObj.getCountryCode().equalsIgnoreCase(UdanChooConstants.DESTINATION_ALL_CTRY_CODE)) {
					predicates.add(criteriaBuilder.equal(cityRootEntity.get("countryCode"), searchCityObj.getCountryCode()));
				}
				if ((searchCityObj.getCityName()!= null) && (searchCityObj.getCityName().trim().length()>0)) {
					predicates.add(criteriaBuilder.like(criteriaBuilder.lower(cityRootEntity.get("cityName")),"%" + searchCityObj.getCityName().toLowerCase() + "%"));
				}


				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
			}
		},paging);
		
		return filteredCityList;
	}

	
	/**************************************************************************************************************/
	
	public List<Tg_Flt_Airport_Entity> listAllAirportCities()   {
		List<Tg_Flt_Airport_Entity> listDestinations= commonRepository.findAllActiveAirportCities();
		return listDestinations;
	}
	
	
	public Map<String, List<Udn_Deal_Status_Entity>> findGroupOfStatusRecords(){
		List<Udn_Deal_Status_Entity> listRecords = dealStatusRepository.findStatusRecordsGroupBy();
		Map<String, List<Udn_Deal_Status_Entity>> mapStatusPerType = listRecords.stream()
				  .collect(Collectors.groupingBy(Udn_Deal_Status_Entity::getWorkloadStatusObjType));
		
		/*for(String keys: mapStatusPerType.keySet()) {
    		System.out.println("Key is " + keys + " List Size is : " + mapStatusPerType.get(keys).size());
    	}*/
		
		return mapStatusPerType;
		
	}
	
	
	public Udn_Deal_Status_Entity saveObjectStatus(Udn_Deal_Status_Entity statusEntity) {
		dealStatusRepository.save(statusEntity);
		statusEntity.setWorkloadStatusId(statusEntity.getId());
		dealStatusRepository.save(statusEntity);
		return statusEntity;
	}
	
	public Udn_Deal_Status_Entity findStatusById(int id) {
		return dealStatusRepository.findById(id).get();
	}

	
	
	
}
