package com.udanchoo.intranet.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.udanchoo.intranet.entity.UdnClientEntity;
import com.udanchoo.intranet.entity.Udn_Destinations_Entity;
import com.udanchoo.intranet.entity.Udn_Hotel_Chain_Entity;
import com.udanchoo.intranet.entity.Udn_Hotel_Master_Entity;
import com.udanchoo.intranet.entity.Udn_Room_Category_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Hotel_Quotation_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.SearchClientObj;
import com.udanchoo.intranet.model.SearchHotelObj;
import com.udanchoo.intranet.model.Udn_Hotel_Chain_Obj;
import com.udanchoo.intranet.model.Udn_Hotel_Master_Obj;
import com.udanchoo.intranet.model.Udn_Room_Category_Obj;
import com.udanchoo.intranet.model.quotation.ManualHotelQuotationVO;
import com.udanchoo.intranet.repository.Deal_HTL_ServiceLine_Repository;
import com.udanchoo.intranet.repository.HotelChain_Repository;
import com.udanchoo.intranet.repository.Hotel_Master_Repository;
import com.udanchoo.intranet.repository.Hotel_Room_Category_Repository;
import com.udanchoo.intranet.repository.quotation.Udn_Manual_Hotel_Quotation_Repository;
import com.udanchoo.intranet.util.UdanChooConstants;



@Service
@Transactional
public class HotelServiceImpl {

	
	@Autowired
	HotelChain_Repository hotelChainRepository;
	
	@Autowired
	Hotel_Master_Repository hotelMasterRepository;
	
	@Autowired
	Hotel_Room_Category_Repository hotelRoomCategoryRepository;
	
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	Deal_HTL_ServiceLine_Repository htlServiceLineRepository;

	@Autowired
	Udn_Manual_Hotel_Quotation_Repository hotelQuotationRepository;
	
	
	public Udn_Hotel_Chain_Obj findbyId(int hotelChainId) throws RecordNotFoundException {
		Udn_Hotel_Chain_Obj hotelChainObj=null;
		Optional<Udn_Hotel_Chain_Entity> hotelChainEntity = hotelChainRepository.findById(hotelChainId);
		if(hotelChainEntity.isPresent()) {
			hotelChainObj = new Udn_Hotel_Chain_Obj(hotelChainEntity.get());
		}
		else {
			throw new RecordNotFoundException("Hotel Chain Id doesnot exist. ");
		}
		return hotelChainObj;
	}
	
	
	public List<Udn_Hotel_Chain_Obj> find_All_Active_HotelChain(){
		List<Udn_Hotel_Chain_Entity> activeHotelChainEntityList = hotelChainRepository.find_All_Active_HotelChain();
		List<Udn_Hotel_Chain_Obj> hotelChainObjList = new ArrayList();
		hotelChainObjList = generateHotelChainVo(activeHotelChainEntityList, hotelChainObjList);
		return hotelChainObjList;
		
	}
	
	
	public  Udn_Hotel_Chain_Entity saveOrUpdate_HotelChain(Udn_Hotel_Chain_Entity hotelChainEntity) {
		hotelChainRepository.save(hotelChainEntity);
		return hotelChainEntity;
	}
	
	
	
	public List<Udn_Hotel_Chain_Obj>  searchHotelChain(SearchHotelObj searchHotelObj ) {
		List<Udn_Hotel_Chain_Obj> hotelChainObjList = new ArrayList();
		List<Udn_Hotel_Chain_Entity> filteredHotelChainList = hotelChainRepository.findAll(new Specification<Udn_Hotel_Chain_Entity>() {
			@Override
			public Predicate toPredicate(Root<Udn_Hotel_Chain_Entity> hotelChainRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				List<Predicate> predicates = new ArrayList<>();
				
				if(searchHotelObj.getHotelChainId()!=0) {
					predicates.add(criteriaBuilder.equal(hotelChainRootEntity.get("hotelChainId"), searchHotelObj.getHotelChainId()));	
				}
				if(!searchHotelObj.isActive()) {
					predicates.add(criteriaBuilder.equal(hotelChainRootEntity.get("active"), searchHotelObj.isActive()));	
				}
				
				if ((searchHotelObj.getHotelChainName() != null) && (searchHotelObj.getHotelChainName().trim().length()>0)) {
					predicates.add(criteriaBuilder.like(criteriaBuilder.lower(hotelChainRootEntity.get("hotelChainName")),"%" + searchHotelObj.getHotelChainName().toLowerCase() + "%"));
				}

				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
			}
		});
		
		hotelChainObjList = generateHotelChainVo(filteredHotelChainList,hotelChainObjList);
		return hotelChainObjList;
	}
	
	/*
	public List<Udn_Hotel_Chain_Obj> searchHotelChain(SearchHotelObj searchHotelObj){
		List<Udn_Hotel_Chain_Obj> hotelChainObjList = new ArrayList();
		List<Udn_Hotel_Chain_Entity> htlChainEntityList =null;
		if(searchHotelObj.getInputSearch().equalsIgnoreCase("ALL")) {
			htlChainEntityList = hotelChainRepository.findAll();
		}
		else if(searchHotelObj.getInputSearch().equalsIgnoreCase("based_on_chain_no")) {
			Optional<Udn_Hotel_Chain_Entity> hotelChainEntity = hotelChainRepository.findById(searchHotelObj.getHotelChainId());
			if(hotelChainEntity.isPresent()) {
				Udn_Hotel_Chain_Obj hotelChainObj = new Udn_Hotel_Chain_Obj(hotelChainEntity.get());
				hotelChainObjList.add(hotelChainObj);
			}
		}
		else if(searchHotelObj.getInputSearch().equalsIgnoreCase("based_on_chain_name")) {
			htlChainEntityList = hotelChainRepository.find_HotelChain_ByNameLike(searchHotelObj.getHotelChainName());
		}
		
		hotelChainObjList = generateHotelChainVo(htlChainEntityList,hotelChainObjList);
		
		return hotelChainObjList;
	}
	*/
	
	
	private List generateHotelChainVo(List<Udn_Hotel_Chain_Entity> htlChainEntityList, List hotelChainObjList) {
		if(htlChainEntityList!=null) {
			Iterator itrHotelChainEntity = htlChainEntityList.iterator();
			while(itrHotelChainEntity.hasNext()) {
				hotelChainObjList.add(new Udn_Hotel_Chain_Obj((Udn_Hotel_Chain_Entity)itrHotelChainEntity.next()));
			}
		}
		return hotelChainObjList;
	}
	
	public List<Udn_Hotel_Master_Entity> findHotelByChainId(int hotelChainId){
		return hotelMasterRepository.findHotelsByChainId(hotelChainId);
	}
	
	public void deleteHotelChain(int hotelChainId) {
		hotelChainRepository.deleteById(hotelChainId);
	}
	
	public  Udn_Hotel_Master_Entity saveOrUpdate_Hotel(Udn_Hotel_Master_Entity hotelEntity) {
		hotelMasterRepository.save(hotelEntity);
		
		return hotelEntity;
	}
	
	public List<Udn_Hotel_Master_Obj> find_Active_Hotels_By_CityId(int cityId){
		
		List<Udn_Hotel_Master_Entity> hotelEntityList = hotelMasterRepository.find_Active_Hotels_By_CityId(cityId);
		List<Udn_Hotel_Master_Obj> hotelMasterObjList  = generateHotelVo(hotelEntityList);
		return hotelMasterObjList;
		
	}
	public List<Udn_Hotel_Master_Obj> searchHotels(SearchHotelObj filter) {

		List<Udn_Hotel_Master_Entity> filteredHotelList = hotelMasterRepository.findAll(new Specification<Udn_Hotel_Master_Entity>() {
			@Override
			public Predicate toPredicate(Root<Udn_Hotel_Master_Entity> root, CriteriaQuery< ?> query, CriteriaBuilder cb) {
				List<Predicate> predicates = new ArrayList<>();

				predicates.add(cb.equal(root.get("active"), filter.isActive()));
				// If designation is specified in filter, add equal where clause
				if (filter.getCityId() != 0) {
					predicates.add(cb.equal(root.get("cityId"), filter.getCityId()));
				}
				
				// If designation is specified in filter, add equal where clause
				if (filter.getHotelChainId() != 0) {
					predicates.add(cb.equal(root.get("hotelChainId"), filter.getHotelChainId()));
				}
				
				if (filter.getSearchPrefer()!=0) {
					if(filter.getSearchPrefer()==1) {
						filter.setPreferred(true);
					}
					else {
						filter.setPreferred(false);
					}
					predicates.add(cb.equal(root.get("preferred"), filter.isPreferred()));
				}

				// If firstName is specified in filter, add contains (lile)
				// filter to where clause with ignore case
				if ((filter.getHotelName() != null) && (filter.getHotelName().trim().length()>0)) {
					predicates.add(cb.like(cb.lower(root.get("hotelName")),"%" + filter.getHotelName().toLowerCase() + "%"));
				}

				if (filter.getHotelId() != 0) {
					predicates.add(cb.equal(root.get("hotelId"), filter.getHotelId()));
				}
				
				if (filter.getStarCategory() != 0) {
					predicates.add(cb.equal(root.get("starCategory"), filter.getStarCategory()));
				}
				
				if (filter.getUdnServiceRating() != 0) {
					predicates.add(cb.equal(root.get("udnServiceRating"), filter.getUdnServiceRating()));
				}
				
				// If lastName is specified in filter, add contains (lile)
				// filter to where clause with ignore case
				if ((filter.getLocality() != null) && (filter.getLocality().trim().length()>0)) {
					predicates.add(cb.like(cb.lower(root.get("locality")), 
                                                    "%" + filter.getLocality().toLowerCase() + "%"));
				}

				return cb.and(predicates.toArray(new Predicate[0]));
			}
		});
		
		return generateHotelVo(filteredHotelList);
	}
	
	private List <Udn_Hotel_Master_Obj> generateHotelVo(List<Udn_Hotel_Master_Entity> hotelEntityList) {
		List<Udn_Hotel_Master_Obj> hotelMasterObjList = new ArrayList();
		Iterator itrHotelEntityList = hotelEntityList.iterator();
		while(itrHotelEntityList.hasNext()) {
			Udn_Hotel_Master_Obj hotelObj = new Udn_Hotel_Master_Obj((Udn_Hotel_Master_Entity)itrHotelEntityList.next());
			hotelMasterObjList.add(hotelObj);
		}
		return hotelMasterObjList;
	}
	
	public Udn_Hotel_Master_Obj findHotelbyId(int hotelId) throws RecordNotFoundException {
		Udn_Hotel_Master_Obj hotelObj=null;
		Optional<Udn_Hotel_Chain_Entity> hotelChainEntity = null;
		
		Optional<Udn_Hotel_Master_Entity> hotelEntity = hotelMasterRepository.findById(hotelId);
		if(hotelEntity.isPresent()) {
			hotelObj = new Udn_Hotel_Master_Obj(hotelEntity.get());
			
			hotelChainEntity = hotelChainRepository.findById(hotelObj.getHotelChainId());
			if(hotelChainEntity.isPresent()) {
				hotelObj.setHotelChainName(hotelChainEntity.get().getHotelChainName());
			}
			Udn_Destinations_Entity destination = commonService.findDestinationById(hotelObj.getCityId());
			hotelObj.setCityName(destination.getCityName());
			
		}
		else {
			throw new RecordNotFoundException("Hotel doesnot exist. ");
		}
		return hotelObj;
	}
	
	public Udn_Hotel_Master_Entity find_HotelbyId(int hotelId) throws RecordNotFoundException {
		Optional<Udn_Hotel_Master_Entity> hotelEntity = hotelMasterRepository.findById(hotelId);
		if(hotelEntity.isPresent()) {
			return hotelEntity.get();
		}
		else {
			throw new RecordNotFoundException("Hotel doesnot exist. ");
		}
	}
	
	public List<Udn_Room_Category_Obj> findRoomCategoryByHotelId(int hotelId){
		List<Udn_Room_Category_Entity> roomCatEntityList = hotelRoomCategoryRepository.findActiveRoomCategoryBy_HotelId(hotelId);
		return generateRoomCategoryVoList(roomCatEntityList);
	}
	public Set<Udn_Room_Category_Entity>  find_Active_RoomCategoryBy_HotelId(int hotelId){
		List<Udn_Room_Category_Entity> roomCatEntityList = hotelRoomCategoryRepository.findActiveRoomCategoryBy_HotelId(hotelId);
		 Set<Udn_Room_Category_Entity> setRoomCatList = new HashSet<Udn_Room_Category_Entity>(roomCatEntityList);
		
		return setRoomCatList;
	}
	
	public List<Udn_Room_Category_Obj> find_All_RoomCategoryByHotelId(int hotelId){
		List<Udn_Room_Category_Entity> roomCatEntityList = hotelRoomCategoryRepository.findActiveRoomCategoryBy_HotelId(hotelId);
		return generateRoomCategoryVoList(roomCatEntityList);
	}
	public Set<Udn_Room_Category_Entity>  find_All_RoomCategoryBy_HotelId(int hotelId){
		List<Udn_Room_Category_Entity> roomCatEntityList = hotelRoomCategoryRepository.findActiveRoomCategoryBy_HotelId(hotelId);
		 Set<Udn_Room_Category_Entity> setRoomCatList = new HashSet<Udn_Room_Category_Entity>(roomCatEntityList);
		
		return setRoomCatList;
	}
	
	private List<Udn_Room_Category_Obj> generateRoomCategoryVoList(List<Udn_Room_Category_Entity> roomCatEntityList){
		List<Udn_Room_Category_Obj> roomCateObjList = new ArrayList();
		Iterator itrRoomCatList = roomCatEntityList.iterator();
		while(itrRoomCatList.hasNext()) {
			Udn_Room_Category_Obj roomCatObj = new Udn_Room_Category_Obj((Udn_Room_Category_Entity)itrRoomCatList.next());
			roomCateObjList.add(roomCatObj);
		}
		return roomCateObjList;
	}
	
	public  Udn_Room_Category_Entity saveOrUpdate_Hotel_Room_Category(Udn_Room_Category_Entity roomCategoryEntity) {
		hotelRoomCategoryRepository.save(roomCategoryEntity);
		return roomCategoryEntity;
	}
	
	public Udn_Room_Category_Entity find_RoomCategoryById(int roomCategoryId) {
		return hotelRoomCategoryRepository.findById(roomCategoryId).get();
	}
	
	public boolean checkServiceLineHotelExists(int hotelId) {
		return htlServiceLineRepository.existsUdn_Deal_HTL_SL_EntityByHotelId(hotelId);
	}
	
	public void deleteHotel(int hotelId) {
		hotelMasterRepository.deleteById(hotelId);
	}
	
	public boolean existHotelIdWithHotelName(int hotelId,String hotelName) {
		return hotelMasterRepository.existsByHotelIdAndHotelName(hotelId, hotelName);
	}
	
	
	
	public Map<Integer,List<ManualHotelQuotationVO>> findOptionWiseHotelMap(long quotationId){
		List<Integer> distinctHotelOptions = hotelQuotationRepository.findDistinctHotelsOptionByQuotation(quotationId);
		Map<Integer,List<ManualHotelQuotationVO>> hotelOptionWiseMap = new HashMap<Integer, List<ManualHotelQuotationVO>>();
		
		for(int i=0;i<distinctHotelOptions.size();i++) {
			List<Udn_Manual_Hotel_Quotation_Entity> listHotelQtnOption = hotelQuotationRepository.findHotelsByQuotationIdAndOptionNo(quotationId, distinctHotelOptions.get(i));
			List<ManualHotelQuotationVO> hotelOptionsWiseList = new ArrayList<ManualHotelQuotationVO>();
			listHotelQtnOption.forEach(manualHotelEntity -> {
				ManualHotelQuotationVO hotelQuotationVo = new ManualHotelQuotationVO();
				hotelQuotationVo.updateManualHotelVoFromEntity(manualHotelEntity);
				updateManualHotelAdditionalFields(hotelQuotationVo);
				hotelOptionsWiseList.add(hotelQuotationVo);
			});
			hotelOptionWiseMap.put(distinctHotelOptions.get(i), hotelOptionsWiseList);
		}
		return hotelOptionWiseMap;
	}
 
	private void updateManualHotelAdditionalFields(ManualHotelQuotationVO hotelQuotationVo) {
		try {
			hotelQuotationVo.setHotelName(find_HotelbyId(hotelQuotationVo.getHotelId()).getHotelName());
		} catch (RecordNotFoundException e1) {
			hotelQuotationVo.setHotelName("Hotel Name Not Found" );
			e1.printStackTrace();
		}	
		hotelQuotationVo.setCityName(commonService.findDestinationById(hotelQuotationVo.getCityId()).getCityName());
		hotelQuotationVo.setRoomCategoryName(find_RoomCategoryById(hotelQuotationVo.getRoomCategoryId()).getRoomCategoryName());
		hotelQuotationVo.setMealPlanName((String) UdanChooConstants.MEAL_PLANS_MAP.get(hotelQuotationVo.getMealPlan()));
	}
}
