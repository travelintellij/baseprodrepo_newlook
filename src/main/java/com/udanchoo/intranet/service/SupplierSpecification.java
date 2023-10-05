package com.udanchoo.intranet.service;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Component;

import com.udanchoo.intranet.entity.supplier.Tg_Supplier_Destinations_Map_Entity;
import com.udanchoo.intranet.entity.supplier.Tg_Supplier_Master_Entity;
import com.udanchoo.intranet.model.supplier.SearchSupplierObj;
import com.udanchoo.intranet.util.UdanChooConstants;


@Component
public class SupplierSpecification {

    public Specification<Tg_Supplier_Master_Entity> getSuppliers(SearchSupplierObj filterSupplierObj) {
        return (Root<Tg_Supplier_Master_Entity> supplierRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) -> {
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
			
        };
    }

	private boolean minOneServiceSelected(SearchSupplierObj filterSupplierObj ) {
		return (filterSupplierObj.isCruise() || filterSupplierObj.isFlight() || filterSupplierObj.isHotel() || filterSupplierObj.isInsurance() || filterSupplierObj.isLandPackage()
				||  filterSupplierObj.isSightseeing()|| filterSupplierObj.isTransfers()|| filterSupplierObj.isVisa()|| filterSupplierObj.isOthers());  
	
	}
}
