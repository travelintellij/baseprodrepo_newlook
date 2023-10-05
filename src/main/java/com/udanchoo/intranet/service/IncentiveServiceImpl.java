package com.udanchoo.intranet.service;



import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Optional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.udanchoo.intranet.entity.UdnClientEntity;
import com.udanchoo.intranet.entity.UdnIncentiveEntity;
import com.udanchoo.intranet.entity.Udn_Airline_Master_Entity;
import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;
import com.udanchoo.intranet.entity.Udn_Destinations_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.entity.supplier.Tg_Supplier_Destinations_Map_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.SearchIncentiveObj;
import com.udanchoo.intranet.model.Udn_Deals_Recorder_Obj;
import com.udanchoo.intranet.model.leads.FilterLeadObj;
import com.udanchoo.intranet.repository.CommonRepository;
import com.udanchoo.intranet.repository.DealRepository;
import com.udanchoo.intranet.repository.IncentiveRepository;
import com.udanchoo.intranet.util.UdanChooConstants;



@Service
public class IncentiveServiceImpl {

	@Autowired
	IncentiveRepository incentiveRepository;
	
	@Autowired
	DealServiceImpl dealService;
	
	@Autowired
	CommonRepository commonRepository;
	
	@Autowired
	ClientServiceImpl clientService;
	
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	DealRepository dealRepository;

		public List<UdnIncentiveEntity> listAll() throws RecordNotFoundException  {
			List listIncentives = incentiveRepository.findAll();
			if (listIncentives.size()==0)
				throw new RecordNotFoundException("Incentive table is Empty, no record Exist !! " );
			else
				System.out.println("Total Incentive Records are " + listIncentives.size());
			
			return listIncentives;
		}
	
	   public Optional<UdnIncentiveEntity> getIncentiveById(long id) throws RecordNotFoundException 
	    {
	        Optional<UdnIncentiveEntity> incentive = incentiveRepository.findById(id);
	        if(incentive.isPresent()) {
	            return incentive;
	        } else {
	            throw new RecordNotFoundException("No Incentive record exist for given id");
	        }
	    }
	     
	   public UdnIncentiveEntity createOrUpdateIncentive(UdnIncentiveEntity entity) throws RecordNotFoundException 
	    {
		   entity = incentiveRepository.save(entity);
		   return entity;
		 
	    } 
	
	   public List<UdnIncentiveEntity> findDefaultIncentiveSearchRecords(Date dateFrom,Date dateTo){
		   //List<UdnIncentiveEntity> incentiveEntityList = incentiveRepository.findAllByCreatedAtBetween(searchIncentiveObj.getClaimFromDate(), searchIncentiveObj.getClaimToDate());
		   List<UdnIncentiveEntity> incentiveEntityList = incentiveRepository.findAllByCreatedAtBetween(dateFrom,dateTo);
		   return incentiveEntityList;
	   }
	   
	   public List<UdnIncentiveEntity> findIncentiveSearchRecords(SearchIncentiveObj searchIncentiveObj){
		   /*String fromDate = searchIncentiveObj.getClaimFromDate();
		   String toDate = searchIncentiveObj.getClaimToDate();
		   String status = searchIncentiveObj.getClaimStatus().trim();
		   long userId = searchIncentiveObj.getUserId();
		   */
		   List<UdnIncentiveEntity> incentiveEntityList = null;
		
		  
		   //TODO
		   /*if(status!=null && status.trim().equalsIgnoreCase("ALL")) {
			   incentiveEntityList=incentiveRepository.findAllUserIncentives(fromDate,toDate,userId);
		   }else {
				incentiveEntityList = incentiveRepository.findIncentiveSearchRecords(status,fromDate,toDate,userId);
		   }*/
		 return incentiveEntityList;
	   }
	   
	   
	   public Page<UdnIncentiveEntity>  filterIncentiveRecord(int pageNo, int pageSize,String sorting,SearchIncentiveObj searchIncentiveObj,boolean isAdmin ) {
			Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
			Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
		    GregorianCalendar cal = new GregorianCalendar();
			cal.setTime(currentDate);
			cal.add(Calendar.DATE, -365);
			Date criteriaDate = cal.getTime();
			boolean isLeadAdmin=false;
			Page<UdnIncentiveEntity> filteredIncentiveList = incentiveRepository.findAll(new Specification<UdnIncentiveEntity>() {
				
				private static final long serialVersionUID = 1L;

				@Override
				public Predicate toPredicate(Root<UdnIncentiveEntity> incentiveRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
					//CriteriaQuery<Udn_Deals_Recorder_Entity> criteriaQueryDeal = criteriaBuilder.createQuery(Udn_Deals_Recorder_Entity.class);
					List<Predicate> predicates = new ArrayList<>();
					if(searchIncentiveObj.getClaimantId()!=0) {
						predicates.add(criteriaBuilder.equal(incentiveRootEntity.get("claimantId"), searchIncentiveObj.getClaimantId()));
					}
					
					if(searchIncentiveObj.getDealConfirmationId()!=0) {
						predicates.add(criteriaBuilder.equal(incentiveRootEntity.get("dealConfirmationId"), searchIncentiveObj.getDealConfirmationId()));
					}

					if(searchIncentiveObj.getIncentiveId()!=0) {
						predicates.add(criteriaBuilder.equal(incentiveRootEntity.get("incentiveId"), searchIncentiveObj.getIncentiveId()));
					}
					if(searchIncentiveObj.getClaimStatus()!=0) {
						predicates.add(criteriaBuilder.equal(incentiveRootEntity.get("status"), searchIncentiveObj.getClaimStatus()));
					}
					
					
					if(searchIncentiveObj.getIncentiveId()==0 && searchIncentiveObj.getDealConfirmationId()==0) {
						if(searchIncentiveObj.getClaimFromDate()!=null && searchIncentiveObj.getClaimToDate()!=null) {
							try {
								if(searchIncentiveObj.isBlnSearchOnClaimDate()) {
									Date dateFrom=new SimpleDateFormat("yyyy-MM-dd").parse(searchIncentiveObj.getClaimFromDate());
									Date dateTo = new SimpleDateFormat("yyyy-MM-dd").parse(searchIncentiveObj.getClaimToDate());
									// By default if user selects only one date in from and to date , CB between tag is not returning result. so had to increment it by one day. Need fix later but it works. 
									cal.setTime(dateTo); 
									cal.add(Calendar.DATE, 1);
									dateTo = cal.getTime();
									Predicate predicateDateDiff =criteriaBuilder.between(incentiveRootEntity.get("createdAt"),dateFrom,dateTo);
									predicates.add(predicateDateDiff);
								}
								else {
									java.sql.Date travelDateFrom= java.sql.Date.valueOf(searchIncentiveObj.getClaimFromDate());
									java.sql.Date travelDateTo = java.sql.Date.valueOf(searchIncentiveObj.getClaimToDate());
									Root<Udn_Deals_Recorder_Entity> rootDealsEntity = query.from(Udn_Deals_Recorder_Entity.class);
									Predicate predicateEndDateLesser =criteriaBuilder.between(rootDealsEntity.get("travelEndDate"),travelDateFrom,travelDateTo);
									Predicate predicateCommonDeal =criteriaBuilder.equal(rootDealsEntity.get("dealConfirmationId"),incentiveRootEntity.get("dealConfirmationId"));
									Predicate finalDealEndDatePredicate = criteriaBuilder.and(predicateEndDateLesser,predicateCommonDeal);
									predicates.add(finalDealEndDatePredicate);
								}
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
						
					}
					return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
				}
			},paging);
			
			return filteredIncentiveList;
		}
	   
	   
	   public List<UdnIncentiveEntity> findAdminIncentiveSearchRecordsByUser(SearchIncentiveObj searchIncentiveObj){
		 System.out.println("Displaying Final Object Values " + searchIncentiveObj);
		 List<UdnIncentiveEntity> incentiveEntityList = null;
		 /*
		 String fromDate = searchIncentiveObj.getClaimFromDate();
		 String toDate = searchIncentiveObj.getClaimToDate();
		   String status = searchIncentiveObj.getClaimStatus().trim();
		   long userId = searchIncentiveObj.getReportOfUser();
		   
		
		   if((status!=null && status.trim().equalsIgnoreCase("ALL")) && (userId==0)){ // Here checking if status is selected all and user id is also selected all.
			   System.out.println("Chugggghhh size is " );
			   //TODO
			   //incentiveEntityList=incentiveRepository.findAllIncentives(fromDate,toDate);
			  
		   }
		   else if((status!=null && status.trim().equalsIgnoreCase("ALL")) && (userId!=0)) {
			 //TODO
			   //incentiveEntityList=incentiveRepository.findAllUserIncentives(fromDate,toDate,userId);
		   }else {
			 //TODO
			   //incentiveEntityList = incentiveRepository.findIncentiveSearchRecords(status,fromDate,toDate,userId);
		   }
		   */
		 return incentiveEntityList;
	   }

	
	   
	   public List<Udn_Deals_Recorder_Obj> find_claimant_eligible_deals(String dealKeyword, int dealOwner, boolean isAdmin) throws RecordNotFoundException {
		   List<Udn_Deals_Recorder_Obj> dealSearchList = new ArrayList();
			if(StringUtils.isNumeric(dealKeyword)) {
				try {
					//Udn_Deals_Recorder_Entity dealEntity = dealService.findBy_DealConfirmationId_And_DealOwner(Long.parseLong(dealKeyword),dealOwner,isAdmin);
					Udn_Deals_Recorder_Entity dealEntity=null;
					if(isAdmin) {
						dealEntity = dealService.find_DealEntityBy_Id(Long.parseLong(dealKeyword));
					}
					else {
						if(dealService.findBy_DealConfirmationId_DealOwner(Long.parseLong(dealKeyword),dealOwner).isPresent()) {
							dealEntity = dealService.findBy_DealConfirmationId_DealOwner(Long.parseLong(dealKeyword),dealOwner).get();
						}else {
							//There can be a case when admin creates an incentive for employee where deal owner is not employee. This case will be checked here and will look incentive table for deal instead of dealowner.
							if(incentiveRepository.existsByDealConfirmationIdAndClaimantId(Long.parseLong(dealKeyword), dealOwner)) {
								dealEntity = dealService.find_DealEntityBy_Id(Long.parseLong(dealKeyword));
							}
						}
					}
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
				List<Udn_Deals_Recorder_Entity> dealList = searchIncentiveDealsBasedOnClient(dealOwner, dealKeyword,isAdmin);
				List<Udn_Deals_Recorder_Obj> dealObjList = commonService.convertDealListToObj(dealList);
				dealSearchList.addAll(dealObjList);
			}
			return dealSearchList;
		
	}
	   
	   public Udn_Airline_Master_Entity findAirlinebyId(long airlineId) {
			return commonRepository.findAirlinebyId(airlineId);
		}
		
		
		public Udn_Destinations_Entity findDestinationById(int destinationId) {
			return commonRepository.findDestinationById(destinationId);
		}
	   
		
		/************************************* Custom Logic Built for client based name deal elastic search ************/
		public List<Udn_Deals_Recorder_Entity>  searchIncentiveDealsBasedOnClient(long dealOwner,String clientName,boolean isAdmin) {	
		    Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
		    GregorianCalendar cal = new GregorianCalendar();
			cal.setTime(currentDate);
			cal.add(Calendar.DATE, -365);
			Date criteriaDate = cal.getTime();
			List<Udn_Deals_Recorder_Entity> filteredDealsRecorderEntity = dealRepository.findAll(new Specification<Udn_Deals_Recorder_Entity>() {
				@Override
				public Predicate toPredicate(Root<Udn_Deals_Recorder_Entity> dealRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
					List<Predicate> finalIncentivePredicate = new ArrayList<>();
					Predicate dealOwnerPredicate =null;
					Predicate incentiveAssignedPredicate =null;
					query.distinct(true);
					Root<UdnIncentiveEntity> incentiveRootEntity= query.from(UdnIncentiveEntity.class);
					Predicate criteriaDatePredicate = criteriaBuilder.greaterThanOrEqualTo(dealRootEntity.get("createdAt"),criteriaDate);
					//finalIncentivePredicate.add(criteriaDatePredicate);
					
					if(clientName!=null && clientName.trim().length()>0) {
						Root<UdnClientEntity> clientRootEntity = query.from(UdnClientEntity.class);
						List<Predicate> clientPredicateList = new ArrayList<>();
						Predicate clientIdPredicate = criteriaBuilder.equal(clientRootEntity.get("clientId"),dealRootEntity.get("clientId"));
						Predicate clientNamePredicate = criteriaBuilder.like(clientRootEntity.get("clientName"), clientName+"%");
						if(!isAdmin) {
							//predicates.add(criteriaBuilder.equal(dealRootEntity.get("dealOwner"), dealOwner));
							dealOwnerPredicate = criteriaBuilder.equal(dealRootEntity.get("dealOwner"), dealOwner);
							
							incentiveAssignedPredicate = criteriaBuilder.equal(incentiveRootEntity.get("claimantId"), dealOwner);
							Predicate dealIncentive = criteriaBuilder.equal(incentiveRootEntity.get("dealConfirmationId"),dealRootEntity.get("dealConfirmationId"));
							Predicate combineDealOwner = criteriaBuilder.and(dealOwnerPredicate,clientIdPredicate,clientNamePredicate,criteriaDatePredicate);
							Predicate combineIncentiveOwner = criteriaBuilder.and(incentiveAssignedPredicate,clientIdPredicate,clientNamePredicate,criteriaDatePredicate,dealIncentive);
							finalIncentivePredicate.add(criteriaBuilder.or(combineDealOwner,combineIncentiveOwner));
							//finalIncentivePredicate.add(combineIncentiveOwner);
						}
						else {
							finalIncentivePredicate.add(criteriaDatePredicate);
							finalIncentivePredicate.add(clientIdPredicate);
							finalIncentivePredicate.add(clientNamePredicate);
						}
						
						
						//predicates.add(clientNamePredicate);
					}
					return criteriaBuilder.and(finalIncentivePredicate.toArray(new Predicate[0]));
				}
			});
			System.out.println("Returned Deal Size is " + filteredDealsRecorderEntity.size());
			return filteredDealsRecorderEntity;
		}
}
