package com.udanchoo.intranet.service;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.ParameterExpression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.mapping.Join;
import org.hibernate.sql.JoinType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.udanchoo.intranet.entity.UdnClientEntity;
import com.udanchoo.intranet.entity.Udn_Deal_FLT_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_HTL_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_INS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_LDP_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_OTH_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_STS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_TRN_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_VSA_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;
import com.udanchoo.intranet.entity.Udn_Hotel_Master_Entity;
import com.udanchoo.intranet.entity.deals.Ti_Deals_Team_Map_Entity;
import com.udanchoo.intranet.model.FilterServiceLineObj;
import com.udanchoo.intranet.model.SearchDealObj;
import com.udanchoo.intranet.model.SearchHotelObj;
import com.udanchoo.intranet.model.Udn_Hotel_Master_Obj;
import com.udanchoo.intranet.repository.Deal_FLT_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_HTL_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_INS_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_LDP_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_OTH_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_STS_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_TRN_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_VSA_ServiceLine_Repository;
import com.udanchoo.intranet.util.SearchCriteria;

import specifications.DealSpecifications;



@Service
public class QueueManageService {

	@Autowired
	Deal_FLT_ServiceLine_Repository fltServiceLineRespository;
	
	@Autowired
	Deal_HTL_ServiceLine_Repository htlServiceLineRespository;
	
	@Autowired
	Deal_INS_ServiceLine_Repository insServiceLineRespository;

	@Autowired
	Deal_LDP_ServiceLine_Repository ldpServiceLineRespository;

	@Autowired
	Deal_OTH_ServiceLine_Repository othServiceLineRespository;
	
	@Autowired
	Deal_STS_ServiceLine_Repository stsServiceLineRespository;

	@Autowired
	Deal_TRN_ServiceLine_Repository trnServiceLineRespository;

	@Autowired
	Deal_VSA_ServiceLine_Repository vsaServiceLineRespository;

	//system will support only one year past data to be fetched from here. 
	public Page<Udn_Deal_FLT_SL_Entity> findByCreatedAtAfter_BasedOn_Owner(int pageNo, int pageSize,long serviceLineOwner,String sorting,boolean isAdmin){
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
	    
	    Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
			
		Date criteriaDate = cal.getTime();
		//System.out.println("criteriaDate Date is " + criteriaDate);
		Page<Udn_Deal_FLT_SL_Entity> pagedResult;
		//if(isAdmin) {
			pagedResult = fltServiceLineRespository.findByCreatedAtAfter(criteriaDate,paging);
		/*}
		else {
			pagedResult = fltServiceLineRespository.findByCreatedAtAfterAndServiceLineOwner(criteriaDate, serviceLineOwner,paging);
			
		}*/

		//System.out.println("Result Obtained is " + pagedResult.getNumberOfElements());
        return pagedResult;
	}
	
	
	
	
	
	/*
	public Page<Udn_Deal_FLT_SL_Entity> findBy_CreatedAtAfter_And_ServiceLineOwner_SortBy_ClientName(int pageNo, int pageSize,long serviceLineOwner,String sorting){
		Pageable paging = PageRequest.of(pageNo, pageSize);
	    
	    Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
			
		Date criteriaDate = cal.getTime();
		//System.out.println("criteriaDate Date is " + criteriaDate);
		Page<Udn_Deal_FLT_SL_Entity> pagedResult = fltServiceLineRespository.findBy_CreatedAtAfter_And_ServiceLineOwner_SortBy_ClientName(criteriaDate, serviceLineOwner, paging);
		//System.out.println("Result Obtained is " + pagedResult.getNumberOfElements());
        return pagedResult;
	}
	*/
	
	public Page<Udn_Deal_FLT_SL_Entity>  searchFlightSLSortByCNameBySLOwner(int pageNo, int pageSize,long serviceLineOwner,String sorting,Integer clientId, Integer statusId,FilterServiceLineObj filterSLVo,boolean isAdmin ) {
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
		Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
				
		Date criteriaDate = cal.getTime();
		
		
		Page<Udn_Deal_FLT_SL_Entity> filteredFlightList = fltServiceLineRespository.findAll(new Specification<Udn_Deal_FLT_SL_Entity>() {
			@Override
			public Predicate toPredicate(Root<Udn_Deal_FLT_SL_Entity> fltRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				//CriteriaQuery<Udn_Deals_Recorder_Entity> criteriaQueryDeal = criteriaBuilder.createQuery(Udn_Deals_Recorder_Entity.class);
				
				List<Predicate> predicates = new ArrayList<>();
				
				if(!isAdmin) {
					predicates.add(criteriaBuilder.equal(fltRootEntity.get("serviceLineOwner"), serviceLineOwner));
				}
				
				predicates.add(criteriaBuilder.greaterThanOrEqualTo(fltRootEntity.get("createdAt"),criteriaDate));
				
				if((filterSLVo.getDateFrom()!=null) && (filterSLVo.getDateFrom().trim().length()>0) && (filterSLVo.getDateTo()!=null) && (filterSLVo.getDateTo().trim().length()>0)) {
					try {
						Date dateTo=new SimpleDateFormat("yyyy-MM-dd").parse(filterSLVo.getDateTo());
						Date dateFrom=new SimpleDateFormat("yyyy-MM-dd").parse(filterSLVo.getDateFrom());
						predicates.add(criteriaBuilder.between(fltRootEntity.get("departureDate"),dateFrom,dateTo));
						System.out.println("Date Between Added for filter.");
						
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if(clientId!=0) {
					Root<Udn_Deals_Recorder_Entity> rootDealEntity = query.from(Udn_Deals_Recorder_Entity.class);
					
					
					/*query.where(criteriaBuilder.and(
							criteriaBuilder.equal(fltRootEntity.get("dealConfirmationId"), rootDealEntity.get("dealConfirmationId")),
							criteriaBuilder.equal(rootDealEntity.get("clientId"), clientId)
					    ));
					    */
					//ParameterExpression<Long> dealLongExpression = criteriaBuilder.parameter(Long.class);
					List<Predicate> clientPredicateList = new ArrayList<>();
					Predicate dealIdPredicate = criteriaBuilder.equal(fltRootEntity.get("dealConfirmationId"),rootDealEntity.get("dealConfirmationId"));
					Predicate clientIdPredicate = criteriaBuilder.equal(rootDealEntity.get("clientId"),clientId);
					clientPredicateList.add(dealIdPredicate);
					clientPredicateList.add(clientIdPredicate);
					predicates.addAll(clientPredicateList);
					//predicates.add(criteriaBuilder.equal(fltRootEntity.get("dealConfirmationId"), rootDealEntity.get("dealConfirmationId")));
					//predicates.add(criteriaBuilder.equal(rootDealEntity.get("clientId"), clientId));
				}
				if(statusId!=0) {
					predicates.add(criteriaBuilder.equal(fltRootEntity.get("status"), statusId));
				}
				
				
				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
			}
		},paging);
		
		return filteredFlightList;
	}

	
	public Page<Udn_Deal_FLT_SL_Entity>  filterServiceLineFlightQueue(int pageNo, int pageSize,long dealOwner,String sorting,FilterServiceLineObj filterDealObj,boolean isAdmin ) {
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
		
		/*Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
		Date criteriaDate = cal.getTime();
		*/
		LocalDateTime currentDate = LocalDateTime.now();
		
		boolean isDealAdmin=false;
		
		Page<Udn_Deal_FLT_SL_Entity> filtereDealsList = fltServiceLineRespository.findAll(new Specification<Udn_Deal_FLT_SL_Entity>() {
			private static final long serialVersionUID = 1L;
			@Override
			public Predicate toPredicate(Root<Udn_Deal_FLT_SL_Entity> flightRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				List<Predicate> predicates = new ArrayList<>();
				query.distinct(true);
				if(dealOwner!=0) {
					Root<Ti_Deals_Team_Map_Entity> rootDealsTeamMapEntity = query.from(Ti_Deals_Team_Map_Entity.class);
					Root<Udn_Deals_Recorder_Entity> dealRootEntity = query.from(Udn_Deals_Recorder_Entity.class);
					
					List<Predicate> teamListPredicatesList = new ArrayList<>();
					Predicate notNullPredicate = criteriaBuilder.isNotNull(rootDealsTeamMapEntity.get("dealConfirmationId"));
					Predicate serviceCityPredcate =criteriaBuilder.equal( rootDealsTeamMapEntity.get("userId"),dealOwner);
					Predicate supplierPredcate =criteriaBuilder.equal(flightRootEntity.get("dealConfirmationId"), rootDealsTeamMapEntity.get("dealConfirmationId"));
					Predicate finalJoinPredicate = criteriaBuilder.and(serviceCityPredcate,supplierPredcate,notNullPredicate);
					Predicate dealOwnerPredicate = criteriaBuilder.equal(dealRootEntity.get("dealOwner"), dealOwner);
					Predicate finalUltimatePredicate = criteriaBuilder.or(dealOwnerPredicate,finalJoinPredicate);
					teamListPredicatesList.add(finalUltimatePredicate);
					predicates.addAll(teamListPredicatesList);
				}
				if(filterDealObj.isUpcomingDeal()) {
					predicates.add(criteriaBuilder.greaterThanOrEqualTo(flightRootEntity.get("arrivalDate"),currentDate));
				}
				else if((!filterDealObj.isUpcomingDeal())) {
					predicates.add(criteriaBuilder.lessThanOrEqualTo(flightRootEntity.get("departureDate"),currentDate));
				}
				/*if(filterDealObj.getDealConfirmationId()!=0) {
				predicates.add(criteriaBuilder.equal(flightRootEntity.get("dealConfirmationId"), filterDealObj.getDealConfirmationId()));
				}*/

				
				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
				
			}
		},paging);
		
		return filtereDealsList;
	}
	
	
	
	/*************************** Hotel SL Queue Starts from here ***************************************************/
	
	public Page<Udn_Deal_HTL_SL_Entity> find_Hotel_SL_ByCreatedAtAfter_BasedOn_Owner(int pageNo, int pageSize,long serviceLineOwner,String sorting,boolean isAdmin){
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
	    
	    Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
			
		Date criteriaDate = cal.getTime();
		//System.out.println("criteriaDate Date is " + criteriaDate);
		Page<Udn_Deal_HTL_SL_Entity> pagedResult; 
		//if(isAdmin) {
			pagedResult= htlServiceLineRespository.findByCreatedAtAfter(criteriaDate, paging);
		/*}else {
			pagedResult= htlServiceLineRespository.findByCreatedAtAfterAndServiceLineOwner(criteriaDate, serviceLineOwner,paging);
		}*/
		//System.out.println("Result Obtained is " + pagedResult.getNumberOfElements());
        return pagedResult;
	}
	
	public Page<Udn_Deal_HTL_SL_Entity>  searchHotelSLSortByCNameBySLOwner(int pageNo, int pageSize,long serviceLineOwner,String sorting,Integer clientId, Integer statusId,FilterServiceLineObj filterSLVo,boolean isAdmin) {
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
		Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
				
		Date criteriaDate = cal.getTime();
		
		
		Page<Udn_Deal_HTL_SL_Entity> filteredHotelList = htlServiceLineRespository.findAll(new Specification<Udn_Deal_HTL_SL_Entity>() {
			@Override
			public Predicate toPredicate(Root<Udn_Deal_HTL_SL_Entity> htlRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				//CriteriaQuery<Udn_Deals_Recorder_Entity> criteriaQueryDeal = criteriaBuilder.createQuery(Udn_Deals_Recorder_Entity.class);
				
				List<Predicate> predicates = new ArrayList<>();
				if(!isAdmin) {
					predicates.add(criteriaBuilder.equal(htlRootEntity.get("serviceLineOwner"), serviceLineOwner));
				}
				
				predicates.add(criteriaBuilder.greaterThanOrEqualTo(htlRootEntity.get("createdAt"),criteriaDate));
				
				if((filterSLVo.getDateFrom()!=null) && (filterSLVo.getDateFrom().trim().length()>0) && (filterSLVo.getDateTo()!=null) && (filterSLVo.getDateTo().trim().length()>0)) {
					try {
						Date dateTo=new SimpleDateFormat("yyyy-MM-dd").parse(filterSLVo.getDateTo());
						Date dateFrom=new SimpleDateFormat("yyyy-MM-dd").parse(filterSLVo.getDateFrom());
						predicates.add(criteriaBuilder.between(htlRootEntity.get("checkInDate"),dateFrom,dateTo));
						
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

				
				
				if(clientId!=0) {
					Root<Udn_Deals_Recorder_Entity> rootDealEntity = query.from(Udn_Deals_Recorder_Entity.class);
					List<Predicate> clientPredicateList = new ArrayList<>();
					Predicate dealIdPredicate = criteriaBuilder.equal(htlRootEntity.get("dealConfirmationId"),rootDealEntity.get("dealConfirmationId"));
					Predicate clientIdPredicate = criteriaBuilder.equal(rootDealEntity.get("clientId"),clientId);
					clientPredicateList.add(dealIdPredicate);
					clientPredicateList.add(clientIdPredicate);
					predicates.addAll(clientPredicateList);
				}
				if(statusId!=0) {
					predicates.add(criteriaBuilder.equal(htlRootEntity.get("status"), statusId));
				}
				
				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
			}
		},paging);
		
		return filteredHotelList;
	}
	
	/*************************** Insurance SL Queue Starts from here ***************************************************/
	
	public Page<Udn_Deal_INS_SL_Entity> find_Insurance_SL_ByCreatedAtAfter_BasedOn_Owner(int pageNo, int pageSize,long serviceLineOwner,String sorting,boolean isAdmin){
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
	    
	    Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
			
		Date criteriaDate = cal.getTime();
		//System.out.println("criteriaDate Date is " + criteriaDate);
		Page<Udn_Deal_INS_SL_Entity> pagedResult; 
		//if(isAdmin) {
			pagedResult = insServiceLineRespository.findByCreatedAtAfter(criteriaDate, paging);
		/*}
		else {
			pagedResult = insServiceLineRespository.findByCreatedAtAfterAndServiceLineOwner(criteriaDate, serviceLineOwner,paging);
		}*/
		//System.out.println("Result Obtained is " + pagedResult.getNumberOfElements());
        return pagedResult;
	}
	
	public Page<Udn_Deal_INS_SL_Entity>  searchInsuranceSLSortByCNameBySLOwner(int pageNo, int pageSize,long serviceLineOwner,String sorting,Integer clientId, Integer statusId,FilterServiceLineObj filterSLVo,boolean isAdmin) {
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
		Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
				
		Date criteriaDate = cal.getTime();
		
		
		Page<Udn_Deal_INS_SL_Entity> filteredInsuranceList = insServiceLineRespository.findAll(new Specification<Udn_Deal_INS_SL_Entity>() {
			@Override
			public Predicate toPredicate(Root<Udn_Deal_INS_SL_Entity> insRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				//CriteriaQuery<Udn_Deals_Recorder_Entity> criteriaQueryDeal = criteriaBuilder.createQuery(Udn_Deals_Recorder_Entity.class);
				
				List<Predicate> predicates = new ArrayList<>();
				
				if(!isAdmin) {
					predicates.add(criteriaBuilder.equal(insRootEntity.get("serviceLineOwner"), serviceLineOwner));
				}
				
				
				predicates.add(criteriaBuilder.greaterThanOrEqualTo(insRootEntity.get("createdAt"),criteriaDate));
				
				if((filterSLVo.getDateFrom()!=null) && (filterSLVo.getDateFrom().trim().length()>0) && (filterSLVo.getDateTo()!=null) && (filterSLVo.getDateTo().trim().length()>0)) {
					try {
						Date dateTo=new SimpleDateFormat("yyyy-MM-dd").parse(filterSLVo.getDateTo());
						Date dateFrom=new SimpleDateFormat("yyyy-MM-dd").parse(filterSLVo.getDateFrom());
						predicates.add(criteriaBuilder.between(insRootEntity.get("coverageStartDate"),dateFrom,dateTo));
						
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

				
				
				if(clientId!=0) {
					Root<Udn_Deals_Recorder_Entity> rootDealEntity = query.from(Udn_Deals_Recorder_Entity.class);
					List<Predicate> clientPredicateList = new ArrayList<>();
					Predicate dealIdPredicate = criteriaBuilder.equal(insRootEntity.get("dealConfirmationId"),rootDealEntity.get("dealConfirmationId"));
					Predicate clientIdPredicate = criteriaBuilder.equal(rootDealEntity.get("clientId"),clientId);
					clientPredicateList.add(dealIdPredicate);
					clientPredicateList.add(clientIdPredicate);
					predicates.addAll(clientPredicateList);
				}
				if(statusId!=0) {
					predicates.add(criteriaBuilder.equal(insRootEntity.get("status"), statusId));
				}
				
				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
			}
		},paging);
		
		return filteredInsuranceList;
	}
	
	/*************************** LandPackage SL Queue Starts from here ***************************************************/
	public Page<Udn_Deal_LDP_SL_Entity> find_LandPacakage_SL_ByCreatedAtAfter_BasedOn_Owner(int pageNo, int pageSize,long serviceLineOwner,String sorting,boolean isAdmin){
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
	    
	    Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
			
		Date criteriaDate = cal.getTime();
		//System.out.println("criteriaDate Date is " + criteriaDate);
		Page<Udn_Deal_LDP_SL_Entity> pagedResult; 
		//if(isAdmin) {
			pagedResult = ldpServiceLineRespository.findByCreatedAtAfter(criteriaDate, paging);
		/*}
		else {
			pagedResult = ldpServiceLineRespository.findByCreatedAtAfterAndServiceLineOwner(criteriaDate, serviceLineOwner,paging);
		}*/
		//System.out.println("Result Obtained is " + pagedResult.getNumberOfElements());
        return pagedResult;
	}
	
	public Page<Udn_Deal_LDP_SL_Entity>  searchLandPackageSLSortByCNameBySLOwner(int pageNo, int pageSize,long serviceLineOwner,String sorting,Integer clientId, Integer statusId,FilterServiceLineObj filterSLVo,boolean isAdmin) {
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
		Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
				
		Date criteriaDate = cal.getTime();
		
		
		Page<Udn_Deal_LDP_SL_Entity> filteredLandPackageList = ldpServiceLineRespository.findAll(new Specification<Udn_Deal_LDP_SL_Entity>() {
			@Override
			public Predicate toPredicate(Root<Udn_Deal_LDP_SL_Entity> ldpRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				//CriteriaQuery<Udn_Deals_Recorder_Entity> criteriaQueryDeal = criteriaBuilder.createQuery(Udn_Deals_Recorder_Entity.class);
				
				List<Predicate> predicates = new ArrayList<>();
				
				if(!isAdmin) {
					predicates.add(criteriaBuilder.equal(ldpRootEntity.get("serviceLineOwner"), serviceLineOwner));
				}
				
				
				predicates.add(criteriaBuilder.greaterThanOrEqualTo(ldpRootEntity.get("createdAt"),criteriaDate));
				
				if((filterSLVo.getDateFrom()!=null) && (filterSLVo.getDateFrom().trim().length()>0) && (filterSLVo.getDateTo()!=null) && (filterSLVo.getDateTo().trim().length()>0)) {
					try {
						Date dateTo=new SimpleDateFormat("yyyy-MM-dd").parse(filterSLVo.getDateTo());
						Date dateFrom=new SimpleDateFormat("yyyy-MM-dd").parse(filterSLVo.getDateFrom());
						predicates.add(criteriaBuilder.between(ldpRootEntity.get("startDate"),dateFrom,dateTo));
						
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}

				
				
				if(clientId!=0) {
					Root<Udn_Deals_Recorder_Entity> rootDealEntity = query.from(Udn_Deals_Recorder_Entity.class);
					List<Predicate> clientPredicateList = new ArrayList<>();
					Predicate dealIdPredicate = criteriaBuilder.equal(ldpRootEntity.get("dealConfirmationId"),rootDealEntity.get("dealConfirmationId"));
					Predicate clientIdPredicate = criteriaBuilder.equal(rootDealEntity.get("clientId"),clientId);
					clientPredicateList.add(dealIdPredicate);
					clientPredicateList.add(clientIdPredicate);
					predicates.addAll(clientPredicateList);
				}
				if(statusId!=0) {
					predicates.add(criteriaBuilder.equal(ldpRootEntity.get("status"), statusId));
				}
				
				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
			}
		},paging);
		
		return filteredLandPackageList;
	}

	
	
	/*************************** Other SL Queue Starts from here ***************************************************/	
	public Page<Udn_Deal_OTH_SL_Entity> find_Other_SL_ByCreatedAtAfter_BasedOn_Owner(int pageNo, int pageSize,long serviceLineOwner,String sorting,boolean isAdmin){
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
	    
	    Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
			
		Date criteriaDate = cal.getTime();
		//System.out.println("criteriaDate Date is " + criteriaDate);
		Page<Udn_Deal_OTH_SL_Entity> pagedResult; 
		//if(isAdmin) {
			pagedResult= othServiceLineRespository.findByCreatedAtAfter(criteriaDate, paging);
		/*}
		else {
			pagedResult= othServiceLineRespository.findByCreatedAtAfterAndServiceLineOwner(criteriaDate, serviceLineOwner,paging);
		}*/
		//System.out.println("Result Obtained is " + pagedResult.getNumberOfElements());
        return pagedResult;
	}

	public Page<Udn_Deal_OTH_SL_Entity>  searchOtherSLSortByCNameBySLOwner(int pageNo, int pageSize,long serviceLineOwner,String sorting,Integer clientId, Integer statusId,FilterServiceLineObj filterSLVo,boolean isAdmin ) {
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
		Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
				
		Date criteriaDate = cal.getTime();
		
		
		Page<Udn_Deal_OTH_SL_Entity> filteredOtherList = othServiceLineRespository.findAll(new Specification<Udn_Deal_OTH_SL_Entity>() {
			@Override
			public Predicate toPredicate(Root<Udn_Deal_OTH_SL_Entity> othRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				List<Predicate> predicates = new ArrayList<>();
				
				if(!isAdmin) {
					predicates.add(criteriaBuilder.equal(othRootEntity.get("serviceLineOwner"), serviceLineOwner));
				}
				predicates.add(criteriaBuilder.greaterThanOrEqualTo(othRootEntity.get("createdAt"),criteriaDate));
				if((filterSLVo.getDateFrom()!=null) && (filterSLVo.getDateFrom().trim().length()>0) && (filterSLVo.getDateTo()!=null) && (filterSLVo.getDateTo().trim().length()>0)) {
					try {
						Date dateTo=new SimpleDateFormat("yyyy-MM-dd").parse(filterSLVo.getDateTo());
						Date dateFrom=new SimpleDateFormat("yyyy-MM-dd").parse(filterSLVo.getDateFrom());
						predicates.add(criteriaBuilder.between(othRootEntity.get("serviceDate"),dateFrom,dateTo));
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if(clientId!=0) {
					Root<Udn_Deals_Recorder_Entity> rootDealEntity = query.from(Udn_Deals_Recorder_Entity.class);
					List<Predicate> clientPredicateList = new ArrayList<>();
					Predicate dealIdPredicate = criteriaBuilder.equal(othRootEntity.get("dealConfirmationId"),rootDealEntity.get("dealConfirmationId"));
					Predicate clientIdPredicate = criteriaBuilder.equal(rootDealEntity.get("clientId"),clientId);
					clientPredicateList.add(dealIdPredicate);
					clientPredicateList.add(clientIdPredicate);
					predicates.addAll(clientPredicateList);
					//predicates.add(criteriaBuilder.equal(fltRootEntity.get("dealConfirmationId"), rootDealEntity.get("dealConfirmationId")));
					//predicates.add(criteriaBuilder.equal(rootDealEntity.get("clientId"), clientId));
				}
				if(statusId!=0) {
					predicates.add(criteriaBuilder.equal(othRootEntity.get("status"), statusId));
				}
				
				
				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
			}
		},paging);
		
		return filteredOtherList;
	}
	

	/*************************** SightSeeing SL Queue Starts from here ***************************************************/
	
	public Page<Udn_Deal_STS_SL_Entity> find_SightSeeing_SL_ByCreatedAtAfter_BasedOn_Owner(int pageNo, int pageSize,long serviceLineOwner,String sorting,boolean isAdmin){
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
	    
	    Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
			
		Date criteriaDate = cal.getTime();
		//System.out.println("criteriaDate Date is " + criteriaDate);
		Page<Udn_Deal_STS_SL_Entity> pagedResult; 
		//if(isAdmin) {
			pagedResult= stsServiceLineRespository.findByCreatedAtAfter(criteriaDate, paging);
		/*}
		else {
			pagedResult= stsServiceLineRespository.findByCreatedAtAfterAndServiceLineOwner(criteriaDate, serviceLineOwner,paging);
		}*/
		//System.out.println("Result Obtained is " + pagedResult.getNumberOfElements());
        return pagedResult;
	}
	
	public Page<Udn_Deal_STS_SL_Entity>  searchSightSeeingSLSortByCNameBySLOwner(int pageNo, int pageSize,long serviceLineOwner,String sorting,Integer clientId, Integer statusId,FilterServiceLineObj filterSLVo,boolean isAdmin ) {
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
		Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
				
		Date criteriaDate = cal.getTime();
		
		
		Page<Udn_Deal_STS_SL_Entity> filteredSightSeeingList = stsServiceLineRespository.findAll(new Specification<Udn_Deal_STS_SL_Entity>() {
			@Override
			public Predicate toPredicate(Root<Udn_Deal_STS_SL_Entity> stsRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				List<Predicate> predicates = new ArrayList<>();
				if(!isAdmin) {
					predicates.add(criteriaBuilder.equal(stsRootEntity.get("serviceLineOwner"), serviceLineOwner));
				}
				predicates.add(criteriaBuilder.greaterThanOrEqualTo(stsRootEntity.get("createdAt"),criteriaDate));
				if((filterSLVo.getDateFrom()!=null) && (filterSLVo.getDateFrom().trim().length()>0) && (filterSLVo.getDateTo()!=null) && (filterSLVo.getDateTo().trim().length()>0)) {
					try {
						//Date dateTo=new SimpleDateFormat("yyyy-MM-dd").parse(filterSLVo.getDateTo());
						//Date dateFrom=new SimpleDateFormat("yyyy-MM-dd").parse(filterSLVo.getDateFrom());
						
						
						LocalDateTime dateFrom = LocalDate.parse(filterSLVo.getDateFrom()).atTime(LocalTime.parse("00:00"));
						LocalDateTime dateTo = LocalDate.parse(filterSLVo.getDateTo()).atTime(LocalTime.parse("23:59"));

						
						predicates.add(criteriaBuilder.between(stsRootEntity.get("tourDate"),dateFrom,dateTo));
						System.out.println("Date Between Added for filter.");
						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(clientId!=0) {
					Root<Udn_Deals_Recorder_Entity> rootDealEntity = query.from(Udn_Deals_Recorder_Entity.class);
					List<Predicate> clientPredicateList = new ArrayList<>();
					Predicate dealIdPredicate = criteriaBuilder.equal(stsRootEntity.get("dealConfirmationId"),rootDealEntity.get("dealConfirmationId"));
					Predicate clientIdPredicate = criteriaBuilder.equal(rootDealEntity.get("clientId"),clientId);
					clientPredicateList.add(dealIdPredicate);
					clientPredicateList.add(clientIdPredicate);
					predicates.addAll(clientPredicateList);
				}
				if(statusId!=0) {
					predicates.add(criteriaBuilder.equal(stsRootEntity.get("status"), statusId));
				}
				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
			}
		},paging);
		
		return filteredSightSeeingList;
	}

	/*************************** Transfers SL Queue Starts from here ***************************************************/
	public Page<Udn_Deal_TRN_SL_Entity> find_Transfers_SL_ByCreatedAtAfter_BasedOn_Owner(int pageNo, int pageSize,long serviceLineOwner,String sorting,boolean isAdmin){
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
	    
	    Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
			
		Date criteriaDate = cal.getTime();
		//System.out.println("criteriaDate Date is " + criteriaDate);
		Page<Udn_Deal_TRN_SL_Entity> pagedResult;
		//if(isAdmin) {
			pagedResult = trnServiceLineRespository.findByCreatedAtAfter(criteriaDate,paging);
		/*}
		else {
			pagedResult = trnServiceLineRespository.findByCreatedAtAfterAndServiceLineOwner(criteriaDate, serviceLineOwner,paging);
		}*/
		//System.out.println("Result Obtained is " + pagedResult.getNumberOfElements());
        return pagedResult;
	}
	
	public Page<Udn_Deal_TRN_SL_Entity>  searchTransfersSLSortByCNameBySLOwner(int pageNo, int pageSize,long serviceLineOwner,String sorting,Integer clientId, Integer statusId,FilterServiceLineObj filterSLVo,boolean isAdmin ) {
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
		Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
				
		Date criteriaDate = cal.getTime();
		
		
		Page<Udn_Deal_TRN_SL_Entity> filteredTransfersList = trnServiceLineRespository.findAll(new Specification<Udn_Deal_TRN_SL_Entity>() {
			@Override
			public Predicate toPredicate(Root<Udn_Deal_TRN_SL_Entity> trnRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				List<Predicate> predicates = new ArrayList<>();
				if(!isAdmin) {
					predicates.add(criteriaBuilder.equal(trnRootEntity.get("serviceLineOwner"), serviceLineOwner));
				}
				predicates.add(criteriaBuilder.greaterThanOrEqualTo(trnRootEntity.get("createdAt"),criteriaDate));
				if((filterSLVo.getDateFrom()!=null) && (filterSLVo.getDateFrom().trim().length()>0) && (filterSLVo.getDateTo()!=null) && (filterSLVo.getDateTo().trim().length()>0)) {
					try {
						Date dateTo=new SimpleDateFormat("yyyy-MM-dd").parse(filterSLVo.getDateTo());
						Date dateFrom=new SimpleDateFormat("yyyy-MM-dd").parse(filterSLVo.getDateFrom());
						predicates.add(criteriaBuilder.between(trnRootEntity.get("tourDate"),dateFrom,dateTo));
						System.out.println("Date Between Added for filter.");
						
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(clientId!=0) {
					Root<Udn_Deals_Recorder_Entity> rootDealEntity = query.from(Udn_Deals_Recorder_Entity.class);
					List<Predicate> clientPredicateList = new ArrayList<>();
					Predicate dealIdPredicate = criteriaBuilder.equal(trnRootEntity.get("dealConfirmationId"),rootDealEntity.get("dealConfirmationId"));
					Predicate clientIdPredicate = criteriaBuilder.equal(rootDealEntity.get("clientId"),clientId);
					clientPredicateList.add(dealIdPredicate);
					clientPredicateList.add(clientIdPredicate);
					predicates.addAll(clientPredicateList);
				}
				if(statusId!=0) {
					predicates.add(criteriaBuilder.equal(trnRootEntity.get("status"), statusId));
				}
				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
			}
		},paging);
		
		return filteredTransfersList;
	}

	/*************************** Visa SL Queue Starts from here ***************************************************/
	public Page<Udn_Deal_VSA_SL_Entity> find_Visa_SL_ByCreatedAtAfter_BasedOn_Owner(int pageNo, int pageSize,int serviceLineOwner,String sorting,boolean isAdmin){
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
	    
	    Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
			
		Date criteriaDate = cal.getTime();
		//System.out.println("criteriaDate Date is " + criteriaDate);
		Page<Udn_Deal_VSA_SL_Entity> pagedResult; 
		//if(isAdmin) {
			pagedResult= vsaServiceLineRespository.findByCreatedAtAfter(criteriaDate, paging);
		/*}
		else {
			pagedResult= vsaServiceLineRespository.findByCreatedAtAfterAndServiceLineOwner(criteriaDate, serviceLineOwner,paging);
		}*/
		//System.out.println("Result Obtained is " + pagedResult.getNumberOfElements());
        return pagedResult;
	}
	
	public Page<Udn_Deal_VSA_SL_Entity>  searchVisaSLSortByCNameBySLOwner(int pageNo, int pageSize,long serviceLineOwner,String sorting,Integer clientId, Integer statusId,FilterServiceLineObj filterSLVo,boolean isAdmin ) {
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
		Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
				
		Date criteriaDate = cal.getTime();
		
		
		Page<Udn_Deal_VSA_SL_Entity> filteredVisaList = vsaServiceLineRespository.findAll(new Specification<Udn_Deal_VSA_SL_Entity>() {
			@Override
			public Predicate toPredicate(Root<Udn_Deal_VSA_SL_Entity> vsaRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				List<Predicate> predicates = new ArrayList<>();
				if(!isAdmin) {
					predicates.add(criteriaBuilder.equal(vsaRootEntity.get("serviceLineOwner"), serviceLineOwner));
				}
				
				predicates.add(criteriaBuilder.greaterThanOrEqualTo(vsaRootEntity.get("createdAt"),criteriaDate));
				if((filterSLVo.getDateFrom()!=null) && (filterSLVo.getDateFrom().trim().length()>0) && (filterSLVo.getDateTo()!=null) && (filterSLVo.getDateTo().trim().length()>0)) {
					try {
						Date dateTo=new SimpleDateFormat("yyyy-MM-dd").parse(filterSLVo.getDateTo());
						Date dateFrom=new SimpleDateFormat("yyyy-MM-dd").parse(filterSLVo.getDateFrom());
						predicates.add(criteriaBuilder.between(vsaRootEntity.get("travelStartDate"),dateFrom,dateTo));
						System.out.println("Date Between Added for filter.");
						
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				if(clientId!=0) {
					Root<Udn_Deals_Recorder_Entity> rootDealEntity = query.from(Udn_Deals_Recorder_Entity.class);
					List<Predicate> clientPredicateList = new ArrayList<>();
					Predicate dealIdPredicate = criteriaBuilder.equal(vsaRootEntity.get("dealConfirmationId"),rootDealEntity.get("dealConfirmationId"));
					Predicate clientIdPredicate = criteriaBuilder.equal(rootDealEntity.get("clientId"),clientId);
					clientPredicateList.add(dealIdPredicate);
					clientPredicateList.add(clientIdPredicate);
					predicates.addAll(clientPredicateList);
				}
				System.out.println("Adding Status id as " + statusId);
				if(statusId!=0) {
					predicates.add(criteriaBuilder.equal(vsaRootEntity.get("status"), statusId));
				}
				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
			}
		},paging);
		
		return filteredVisaList;
	}
}
