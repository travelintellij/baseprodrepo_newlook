package com.udanchoo.intranet.service;


import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.udanchoo.intranet.entity.UdnSupplierEntity;
import com.udanchoo.intranet.entity.supplier.Tg_Supplier_Contact_Entity;
import com.udanchoo.intranet.entity.supplier.Tg_Supplier_Destinations_Map_Entity;
import com.udanchoo.intranet.entity.supplier.Tg_Supplier_Master_Entity;
import com.udanchoo.intranet.model.SupplierObj;
import com.udanchoo.intranet.model.supplier.SearchSupplierObj;
import com.udanchoo.intranet.model.supplier.TgSupplierMasterVO;
import com.udanchoo.intranet.repository.SupplierRepository;
import com.udanchoo.intranet.repository.Tg_SupplierContactsRepository;
import com.udanchoo.intranet.util.UdanChooConstants;



@Service
public class SupplierServiceImpl {

	@Autowired
	SupplierRepository supplierRepository;
	
	@Autowired
	Tg_SupplierContactsRepository supplierContactRepository;
	
	
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	SupplierSpecification supplierSpecification;

	
	public List<TgSupplierMasterVO> find_Active_Flight_Suppliers(){
		List supplierEntity =supplierRepository.find_Active_Flight_Suppliers(); 
		List supplierObjList = new ArrayList();
		Iterator itrSupEntityList = supplierEntity.iterator();
		while(itrSupEntityList.hasNext()) {
			TgSupplierMasterVO supplierObj = new TgSupplierMasterVO((Tg_Supplier_Master_Entity)itrSupEntityList.next()); 
			supplierObjList.add(supplierObj);
		}
		return supplierObjList;
	} 
	
	public List<TgSupplierMasterVO> find_Active_Hotel_Suppliers(){
		List supplierEntity =supplierRepository.find_Active_Hotel_Suppliers(); 
		List supplierObjList = new ArrayList();
		Iterator itrSupEntityList = supplierEntity.iterator();
		while(itrSupEntityList.hasNext()) {
			TgSupplierMasterVO supplierObj = new TgSupplierMasterVO((Tg_Supplier_Master_Entity)itrSupEntityList.next()); 
			supplierObjList.add(supplierObj);
		}
		return supplierObjList;
	} 
	
	public List<TgSupplierMasterVO> find_Active_Insurance_Suppliers(){
		List supplierEntity =supplierRepository.find_Active_Insurance_Suppliers(); 
		List supplierObjList = new ArrayList();
		Iterator itrSupEntityList = supplierEntity.iterator();
		while(itrSupEntityList.hasNext()) {
			TgSupplierMasterVO supplierObj = new TgSupplierMasterVO((Tg_Supplier_Master_Entity)itrSupEntityList.next()); 
			supplierObjList.add(supplierObj);
		}
		return supplierObjList;
	} 
	
	public List<TgSupplierMasterVO> find_Active_Package_Suppliers(){
		List supplierEntity =supplierRepository.find_Active_Package_Suppliers(); 
		List supplierObjList = new ArrayList();
		Iterator itrSupEntityList = supplierEntity.iterator();
		while(itrSupEntityList.hasNext()) {
			TgSupplierMasterVO supplierObj = new TgSupplierMasterVO((Tg_Supplier_Master_Entity)itrSupEntityList.next()); 
			supplierObjList.add(supplierObj);
		}
		return supplierObjList;
	} 

	public List<TgSupplierMasterVO> find_Active_Others_Suppliers(){
		List supplierEntity =supplierRepository.find_Active_Others_Suppliers(); 
		List supplierObjList = new ArrayList();
		Iterator itrSupEntityList = supplierEntity.iterator();
		while(itrSupEntityList.hasNext()) {
			TgSupplierMasterVO supplierObj = new TgSupplierMasterVO((Tg_Supplier_Master_Entity)itrSupEntityList.next()); 
			supplierObjList.add(supplierObj);
		}
		return supplierObjList;
	}
	
	public List<TgSupplierMasterVO> find_Active_Transfers_Suppliers(){
		List supplierEntity =supplierRepository.find_Active_Transfers_Suppliers(); 
		List supplierObjList = new ArrayList();
		Iterator itrSupEntityList = supplierEntity.iterator();
		while(itrSupEntityList.hasNext()) {
			TgSupplierMasterVO supplierObj = new TgSupplierMasterVO((Tg_Supplier_Master_Entity)itrSupEntityList.next()); 
			supplierObjList.add(supplierObj);
		}
		return supplierObjList;
	}
	
	public List<TgSupplierMasterVO> find_Active_SightSeeing_Suppliers(){
		List supplierEntity =supplierRepository.find_Active_SightSeeing_Suppliers(); 
		List supplierObjList = new ArrayList();
		Iterator itrSupEntityList = supplierEntity.iterator();
		while(itrSupEntityList.hasNext()) {
			TgSupplierMasterVO supplierObj = new TgSupplierMasterVO((Tg_Supplier_Master_Entity)itrSupEntityList.next()); 
			supplierObjList.add(supplierObj);
		}
		return supplierObjList;
	} 
	
	public List<TgSupplierMasterVO> find_Active_Visa_Suppliers(){
		List supplierEntity =supplierRepository.find_Active_Visa_Suppliers(); 
		List supplierObjList = new ArrayList();
		Iterator itrSupEntityList = supplierEntity.iterator();
		while(itrSupEntityList.hasNext()) {
			TgSupplierMasterVO supplierObj = new TgSupplierMasterVO((Tg_Supplier_Master_Entity)itrSupEntityList.next()); 
			supplierObjList.add(supplierObj);
		}
		return supplierObjList;
	} 
	
	public List<SupplierObj> find_Active_Service_Based_Suppliers(String serviceCode){
		List supplierEntity =supplierRepository.find_Active_Service_Based_Suppliers(serviceCode); 
		List supplierObjList = new ArrayList();
		Iterator itrSupEntityList = supplierEntity.iterator();
		while(itrSupEntityList.hasNext()) {
			SupplierObj supplierObj = new SupplierObj((UdnSupplierEntity)itrSupEntityList.next());
			supplierObjList.add(supplierObj);
		}
		return supplierObjList;
	}
	
	/*
	public Optional<UdnSupplierEntity> findSupplierById(long supplierId) {
		return supplierRepository.findById(supplierId);
	}
	*/
	public Optional<Tg_Supplier_Master_Entity> findSupplierById(long supplierId) {
		return supplierRepository.findById(supplierId);
	}
	
	public Tg_Supplier_Contact_Entity findSupplierContactById(long supplierContactId) {
		return supplierContactRepository.findById(supplierContactId).get();
	}
	
	public Tg_Supplier_Master_Entity saveSupplier(Tg_Supplier_Master_Entity supplierEntity) {
		supplierRepository.save(supplierEntity);
		return supplierEntity;
	}

	public TgSupplierMasterVO getSupplierVoFromEntity(Tg_Supplier_Master_Entity tgLeadEntity) {
		TgSupplierMasterVO supplierVo = new TgSupplierMasterVO(tgLeadEntity);
		supplierVo.setCityName(commonService.findDestinationById(supplierVo.getCityId()).getCityName());
		supplierVo.setCountryName(commonService.findDestinationById(supplierVo.getCountryId()).getCountryName());
		return supplierVo;
	}

	public @Valid TgSupplierMasterVO updateVoFromEntity(Tg_Supplier_Master_Entity tgSupplierEntity,TgSupplierMasterVO supplierVo) {
		supplierVo.setSupplierId(tgSupplierEntity.getSupplierId());
		supplierVo.setSupplierName(tgSupplierEntity.getSupplierName());
		supplierVo.setCompanyDetails(tgSupplierEntity.getCompanyDetails());
		supplierVo.setAddress(tgSupplierEntity.getAddress());
		supplierVo.setCityId(tgSupplierEntity.getCityId());
		supplierVo.setCityName(commonService.findDestinationById(supplierVo.getCityId()).getCityName());
		supplierVo.setCountryId(tgSupplierEntity.getCountryId());
		supplierVo.setCountryName(commonService.findDestinationById(supplierVo.getCountryId()).getCountryName());
		supplierVo.setMobile(tgSupplierEntity.getMobile());
		supplierVo.setPhone(tgSupplierEntity.getPhone());
		supplierVo.setEmail(tgSupplierEntity.getEmail());
		supplierVo.setGstDetails(tgSupplierEntity.getGstDetails());
		supplierVo.setBankDetails(tgSupplierEntity.getBankDetails());
		supplierVo.setRemarks(tgSupplierEntity.getRemarks());
		supplierVo.setReferredBy(tgSupplierEntity.getReferredBy());
		supplierVo.setConsolidator(tgSupplierEntity.isConsolidator());
		
		supplierVo.setLandPackage(tgSupplierEntity.isLandPackage());
		/*supplierVo.setPackageWithFlight(tgSupplierEntity.isPackageWithFlight());
		supplierVo.setPackageWithoutFlight(tgSupplierEntity.isPackageWithoutFlight());
		*/
		supplierVo.setFlight(tgSupplierEntity.isFlight());
		supplierVo.setHotel(tgSupplierEntity.isHotel());
		supplierVo.setTransfers(tgSupplierEntity.isTransfers());
		supplierVo.setSightseeing(tgSupplierEntity.isSightseeing());
		supplierVo.setVisa(tgSupplierEntity.isVisa());
		supplierVo.setInsurance(tgSupplierEntity.isInsurance());
		supplierVo.setCruise(tgSupplierEntity.isCruise());
		supplierVo.setOthers(tgSupplierEntity.isOthers());
		supplierVo.setNegotiates(tgSupplierEntity.isNegotiates());
		supplierVo.setSupplierRating(tgSupplierEntity.getSupplierRating());
		supplierVo.setLastUpdatedBy(tgSupplierEntity.getLastUpdatedBy());
		supplierVo.setDestinations(tgSupplierEntity.getDestinations());
		HashSet operatingDestinations = new HashSet(); 
		tgSupplierEntity.getDestinations().forEach(e->operatingDestinations.add(String.valueOf(e.getDestinationId())));
		supplierVo.setOperatingDestinations(operatingDestinations);
		supplierVo.setSupplierContactsList(tgSupplierEntity.getSupplierContactsList());
		supplierVo.setDeleted(tgSupplierEntity.isDeleted());
		
		return supplierVo;
	}
	
	
	
	public Page<Tg_Supplier_Master_Entity>  find_all_suppliers(int pageNo, int pageSize,String sorting,SearchSupplierObj filterSupplierObj ) {
		Pageable paging = null; 
		if(sorting.equalsIgnoreCase("UpdatedAt")) {
			paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting).descending());	
		}
		else {
			paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
		}
		Page<Tg_Supplier_Master_Entity> filteredSupplierList = supplierRepository.findAll(new Specification<Tg_Supplier_Master_Entity>() {
			@Override
			public Predicate toPredicate(Root<Tg_Supplier_Master_Entity> supplierRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				
				List<Predicate> predicates = new ArrayList<>();
				List<Predicate> servicePredicates = new ArrayList<>();
				
				if(filterSupplierObj.getSupplierId()!=0) {
					predicates.add(criteriaBuilder.equal(supplierRootEntity.get("supplierId"), filterSupplierObj.getSupplierId()));	
				}

				if ((filterSupplierObj.getSupplierName()!= null) && (filterSupplierObj.getSupplierName().trim().length()>0)) {
					predicates.add(criteriaBuilder.like(criteriaBuilder.lower(supplierRootEntity.get("supplierName")),"%" + filterSupplierObj.getSupplierName().toLowerCase() + "%"));
				}

				//following code ensures that if none service selected then all records must be returned else only selected service records will be returned. 
				if(filterSupplierObj.getCityId()!=0) {
					Predicate cityPredicate =criteriaBuilder.equal(supplierRootEntity.get("cityId"), filterSupplierObj.getCityId());
					predicates.add(cityPredicate);
				
				}
	
				predicates.add(criteriaBuilder.equal(supplierRootEntity.get("deleted"), filterSupplierObj.isDeleted()));
				
				
				if(filterSupplierObj.getServiceCityId()!=0) {
					Root<Tg_Supplier_Destinations_Map_Entity> rootDestinationMapEntity = query.from(Tg_Supplier_Destinations_Map_Entity.class);
					List<Predicate> servicePredicatesList = new ArrayList<>();
					Predicate serviceCityPredcate =criteriaBuilder.equal( rootDestinationMapEntity.get("destinationId"),filterSupplierObj.getServiceCityId());
					
					Predicate allCitiesPredicate = criteriaBuilder.equal( rootDestinationMapEntity.get("destinationId"),UdanChooConstants.DESTINATION_ALL_CITIES);
					Predicate cityFinalPredicate = criteriaBuilder.or(serviceCityPredcate,allCitiesPredicate);
					
					Predicate supplierPredcate =criteriaBuilder.equal(supplierRootEntity.get("supplierId"), rootDestinationMapEntity.get("supplierId"));

					//servicePredicatesList.add(serviceCityPredcate);
					servicePredicatesList.add(cityFinalPredicate);
					servicePredicatesList.add(supplierPredcate);
					predicates.addAll(servicePredicatesList);
				}
				
				
				
				
				if(minOneServiceSelected(filterSupplierObj)){
					
					if(filterSupplierObj.isLandPackage()) {
						servicePredicates.add(criteriaBuilder.equal(supplierRootEntity.get("landPackage"), filterSupplierObj.isLandPackage()));	
					}
					/*if(filterSupplierObj.isPackageWithFlight()) {
						servicePredicates.add(criteriaBuilder.equal(supplierRootEntity.get("packageWithFlight"), filterSupplierObj.isPackageWithFlight()));	
					}
					if(filterSupplierObj.isPackageWithoutFlight()) {
						servicePredicates.add(criteriaBuilder.equal(supplierRootEntity.get("packageWithoutFlight"), filterSupplierObj.isPackageWithoutFlight()));	
					}
					*/
					
					
					if(filterSupplierObj.isFlight()) {
						servicePredicates.add(criteriaBuilder.equal(supplierRootEntity.get("flight"), filterSupplierObj.isFlight()));	
					}
	
					if(filterSupplierObj.isHotel()) {
						servicePredicates.add(criteriaBuilder.equal(supplierRootEntity.get("hotel"), filterSupplierObj.isHotel()));	
					}
					
					if(filterSupplierObj.isTransfers()) {
						servicePredicates.add(criteriaBuilder.equal(supplierRootEntity.get("transfers"), filterSupplierObj.isTransfers()));	
					}
	
					if(filterSupplierObj.isSightseeing()) {
						servicePredicates.add(criteriaBuilder.equal(supplierRootEntity.get("sightseeing"), filterSupplierObj.isSightseeing()));	
					}
	
					if(filterSupplierObj.isVisa()) {
						servicePredicates.add(criteriaBuilder.equal(supplierRootEntity.get("visa"), filterSupplierObj.isVisa()));	
					}
	
					if(filterSupplierObj.isInsurance()) {
						servicePredicates.add(criteriaBuilder.equal(supplierRootEntity.get("insurance"), filterSupplierObj.isInsurance()));	
					}
	
					if(filterSupplierObj.isCruise()) {
						servicePredicates.add(criteriaBuilder.equal(supplierRootEntity.get("cruise"), filterSupplierObj.isCruise()));	
					}
					if(filterSupplierObj.isOthers()) {
						servicePredicates.add(criteriaBuilder.equal(supplierRootEntity.get("others"), filterSupplierObj.isOthers()));	
					}
					Predicate orPredicate = criteriaBuilder.or(servicePredicates.toArray(new Predicate[0]));
					Predicate andPredicate = criteriaBuilder.and(predicates.toArray(new Predicate[0]));
					return criteriaBuilder.and(andPredicate,orPredicate);
				}
				else {
					return criteriaBuilder.and(predicates.toArray(new Predicate[0]));	
				}
				
				/************** Following predicate implements OR operator. where it will show search based on city it / country id ************/
				
			}
		},paging);
		return filteredSupplierList;
	}
	
	
	
	
	private boolean minOneServiceSelected(SearchSupplierObj filterSupplierObj ) {
		return (filterSupplierObj.isCruise() || filterSupplierObj.isFlight() || filterSupplierObj.isHotel() || filterSupplierObj.isInsurance() || filterSupplierObj.isLandPackage()
				||  filterSupplierObj.isSightseeing()|| filterSupplierObj.isTransfers()|| filterSupplierObj.isVisa()|| filterSupplierObj.isOthers());  
	
	}
	
	
	public List<Tg_Supplier_Master_Entity>  find_filtered_suppliers(SearchSupplierObj filterSupplierObj ) {
	   List<Tg_Supplier_Master_Entity> pagesSupplier = supplierRepository.findAll(supplierSpecification.getSuppliers(filterSupplierObj),Sort.by("supplierName"));
		return pagesSupplier;
	}
	
		
}
