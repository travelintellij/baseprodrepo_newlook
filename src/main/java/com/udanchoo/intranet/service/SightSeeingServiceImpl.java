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
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.SearchHotelObj;
import com.udanchoo.intranet.model.SearchSightSeeingObj;
import com.udanchoo.intranet.model.Udn_Hotel_Chain_Obj;
import com.udanchoo.intranet.model.Udn_Hotel_Master_Obj;
import com.udanchoo.intranet.model.Udn_Room_Category_Obj;
import com.udanchoo.intranet.model.Udn_SightSeeing_Master_Obj;
import com.udanchoo.intranet.repository.HotelChain_Repository;
import com.udanchoo.intranet.repository.Hotel_Master_Repository;
import com.udanchoo.intranet.repository.Hotel_Room_Category_Repository;
import com.udanchoo.intranet.repository.SightSeeing_Master_Repository;



@Service
@Transactional
public class SightSeeingServiceImpl {

	

	@Autowired
	SightSeeing_Master_Repository sightSeeingMasterRepository;
	
	@Autowired
	UdnCommonServicesImpl commonService;
	
	
	public  Udn_SightSeeing_Master_Entity saveOrUpdate_SightSeeing(Udn_SightSeeing_Master_Entity sightSeeingEntity) {
		sightSeeingMasterRepository.save(sightSeeingEntity);
		return sightSeeingEntity;
	}
	
	
	public List<Udn_SightSeeing_Master_Obj> searchSightSeeing(SearchSightSeeingObj filter) {

		List<Udn_SightSeeing_Master_Entity> filteredSightSeeingList = sightSeeingMasterRepository.findAll(new Specification<Udn_SightSeeing_Master_Entity>() {
			@Override
			public Predicate toPredicate(Root<Udn_SightSeeing_Master_Entity> root, CriteriaQuery< ?> query, CriteriaBuilder cb) {
				List<Predicate> predicates = new ArrayList<>();

			
				// If designation is specified in filter, add equal where clause
				if (filter.getCityId() != 0) {
					predicates.add(cb.equal(root.get("cityId"), filter.getCityId()));
				}
				
				// If firstName is specified in filter, add contains (lile)
				// filter to where clause with ignore case
				if ((filter.getSightSeeingName() != null) && (filter.getSightSeeingName().trim().length()>0)) {
					System.out.println("Checking with name " + root.get("sightSeeingName"));
					predicates.add(cb.like(cb.lower(root.get("sightSeeingName")),"%" + filter.getSightSeeingName().toLowerCase() + "%"));
				}
				
				if (filter.getMinDuration() != 0) {
					predicates.add(cb.greaterThanOrEqualTo(root.get("duration"), filter.getMinDuration()));
				}
				
				if (filter.getMaxDuration() != 0) {
					predicates.add(cb.lessThanOrEqualTo(root.get("duration"), filter.getMaxDuration()));
				}

				if (filter.getTourRating() != 0) {
					predicates.add(cb.greaterThanOrEqualTo(root.get("tourRating"), filter.getTourRating()));
				}
				
				if (filter.getSightSeeingId() != 0) {
					predicates.add(cb.equal(root.get("sightSeeingId"), filter.getSightSeeingId()));
				}
				
				predicates.add(cb.equal(root.get("active"), filter.isActive()));
				
				predicates.add(cb.equal(root.get("deleted"),false));
				return cb.and(predicates.toArray(new Predicate[0]));
			}
		});
		
		return generateSightSeeingVo(filteredSightSeeingList);
	}
	
	private List <Udn_SightSeeing_Master_Obj> generateSightSeeingVo(List<Udn_SightSeeing_Master_Entity> sightSeeingEntityList) {
		List<Udn_SightSeeing_Master_Obj> sightSeeingMasterObjList = new ArrayList();
		Iterator itrSightSeeingEntityList = sightSeeingEntityList.iterator();
		while(itrSightSeeingEntityList.hasNext()) {
			Udn_SightSeeing_Master_Obj sightSeeingObj = new Udn_SightSeeing_Master_Obj((Udn_SightSeeing_Master_Entity)itrSightSeeingEntityList.next());
			sightSeeingObj.setCityName(commonService.findDestinationById(sightSeeingObj.getCityId()).getCityName());
			sightSeeingMasterObjList.add(sightSeeingObj);
		}
		return sightSeeingMasterObjList;
	}
	
	public Udn_SightSeeing_Master_Obj find_SightSeeingById(long sightSeeingId) throws RecordNotFoundException {
		Udn_SightSeeing_Master_Obj sightSeeingObj=null;
		Optional<Udn_SightSeeing_Master_Entity> sightSeeingEntity = sightSeeingMasterRepository.findById(sightSeeingId);
		if(sightSeeingEntity.isPresent()) {
			sightSeeingObj = new Udn_SightSeeing_Master_Obj(sightSeeingEntity.get());
			sightSeeingObj.setCityName(commonService.findDestinationById(sightSeeingObj.getCityId()).getCityName());
		}
		else {
			throw new RecordNotFoundException("SightSeeing doesnot exist. ");
		}
		return sightSeeingObj;
	}
	
	public Udn_SightSeeing_Master_Entity find_SightSeeing_Entity_ById(long sightSeeingId) throws RecordNotFoundException {
		Optional<Udn_SightSeeing_Master_Entity> sightSeeingEntity = sightSeeingMasterRepository.findById(sightSeeingId);
		if(sightSeeingEntity.isPresent()) {
			return sightSeeingEntity.get();	
		}
		else {
			throw new RecordNotFoundException("SightSeeing doesnot exist. ");
		}
		
	}
	

	public List<Udn_SightSeeing_Master_Obj> find_Active_SightSeeing_By_CityId(int cityId){
		List<Udn_SightSeeing_Master_Entity> stsEntityList = sightSeeingMasterRepository.find_Active_SightSeeing_By_CityId(cityId);
		List<Udn_SightSeeing_Master_Obj> stsMasterObjList  = generateSightSeeingVo(stsEntityList);
		return stsMasterObjList;
		
	}
	
	
	
}
