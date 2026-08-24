package com.udanchoo.intranet.service;


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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.udanchoo.intranet.entity.UdnClientEntity;
import com.udanchoo.intranet.entity.UdnIncentiveEntity;
import com.udanchoo.intranet.entity.Udn_Deal_FLT_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;
import com.udanchoo.intranet.entity.Udn_Destinations_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.ClientObj;
import com.udanchoo.intranet.model.ExportClientFilterObj;
import com.udanchoo.intranet.model.FilterServiceLineObj;
import com.udanchoo.intranet.model.SearchClientObj;
import com.udanchoo.intranet.repository.ClientRepository;



@Service
public class ClientServiceImpl {

	@Autowired
	ClientRepository clientRepository;

	@Autowired
	UdnCommonServicesImpl commonService;


	   public UdnClientEntity createOrUpdateClient(UdnClientEntity entity) throws RecordNotFoundException 
	    {
		   entity = clientRepository.save(entity);
		   return entity;
		   //Optional<UdnIncentiveEntity> incentive = incentiveRepository.findById((long) entity.getIncentiveId());
		   //if(incentive.isPresent()) 
	            //entity = incentiveRepository.save(entity);
	    } 
	   
	   public UdnClientEntity getClientById(long id) throws RecordNotFoundException 
	    {
	        Optional<UdnClientEntity> client = clientRepository.findById(id);
	        if(client.isPresent()) {
	            return client.get();
	        } else {
	            throw new RecordNotFoundException("No Client record exist for given id");
	        }
	    }
	   
	   public List<UdnClientEntity> findAllClients() {
		   return clientRepository.findAll();
	   }
	   
	   
	   public boolean deleteClient(long clientId) {
		  try {
			  clientRepository.deleteById(clientId);	
			  if(getClientById(clientId)!=null) {
					return false;
				}
		  } 
		  catch (RecordNotFoundException e) {
			return true;
		  }
		  catch(org.springframework.dao.DataIntegrityViolationException diEx) {
			  return false;
		  }
		  return true;
	   }
	  
	   
	   
	   public ClientObj find_ClientByDealConfirmationId(Long dealConfirmationId) {
		   UdnClientEntity clientEntity = clientRepository.find_ClientByDealConfirmationId(dealConfirmationId);
		   ClientObj clientObj = null;
		   if(clientEntity!=null) {
			   clientObj = new ClientObj(clientEntity);
		   }
		   return clientObj;
	   }
	   
	   public ClientObj find_ClientBy_Id(long clientId) {
		   UdnClientEntity clientEntity = clientRepository.findById(clientId).get();
		   ClientObj clientObj = null;
		   if(clientEntity!=null) {
			   clientObj = new ClientObj(clientEntity);
			   if(clientObj.getCityId()!=null && clientObj.getCityId()!=0) {
				   Udn_Destinations_Entity dest = commonService.findDestinationById(clientObj.getCityId());
				   if(dest != null) {
					   clientObj.setCityName(dest.getCityName());
				   }
			   }
			   
			   if(clientObj.getCountryId()!=0) {
				   Udn_Destinations_Entity countryDest = commonService.findDestinationById(clientObj.getCountryId());
				   if(countryDest != null) {
					   clientObj.setCountryName(countryDest.getCountryName() != null && !countryDest.getCountryName().trim().isEmpty() ? countryDest.getCountryName() : countryDest.getCityName());
				   }
			   }
		   }
		   return clientObj;
	   }
	   
	   
		public Page<UdnClientEntity>  find_all_clients(int pageNo, int pageSize,String sorting,SearchClientObj filterClientObj ) {
			Pageable paging = null; 
			if(sorting.equalsIgnoreCase("UpdatedAt")) {
				paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting).descending());	
			}
			else {
				paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
			}

			
			//Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));

			Page<UdnClientEntity> filteredClientsList = clientRepository.findAll(new Specification<UdnClientEntity>() {
				@Override
				public Predicate toPredicate(Root<UdnClientEntity> clientRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
					List<Predicate> predicates = new ArrayList<>();
					
					if(filterClientObj.getClientId()!=0) {
						predicates.add(criteriaBuilder.equal(clientRootEntity.get("clientId"), filterClientObj.getClientId()));	
					}
					
					
					
					if(!filterClientObj.isActive()) {
						predicates.add(criteriaBuilder.equal(clientRootEntity.get("active"), filterClientObj.isActive()));	
					}
					if(filterClientObj.getContactNumber()!=0) { 
						Predicate mobilePredcate =criteriaBuilder.equal(clientRootEntity.get("mobile"), filterClientObj.getContactNumber());
						Predicate phonePredcate =criteriaBuilder.equal(clientRootEntity.get("phone"), filterClientObj.getContactNumber());
						Predicate contactNumberMatchPredicate = criteriaBuilder.or(mobilePredcate,phonePredcate);
						predicates.add(contactNumberMatchPredicate);
					}
					if ((filterClientObj.getClientName() != null) && (filterClientObj.getClientName().trim().length()>0)) {
						predicates.add(criteriaBuilder.like(criteriaBuilder.lower(clientRootEntity.get("clientName")),"%" + filterClientObj.getClientName().toLowerCase() + "%"));
					}
					if ((filterClientObj.getEmail() != null) && (filterClientObj.getEmail().trim().length()>0)) {
						predicates.add(criteriaBuilder.like(criteriaBuilder.lower(clientRootEntity.get("email")),"%" + filterClientObj.getEmail().toLowerCase() + "%"));
					}
					/************** Following predicate implements OR operator. where it will show search based on city it / country id ************/
					if(filterClientObj.getCityId()!=0) {
						Udn_Destinations_Entity destinationEntity = commonService.findDestinationById(filterClientObj.getCityId());
						if(destinationEntity.getCityName().equalsIgnoreCase(destinationEntity.getCountryName())) {
							Root<Udn_Destinations_Entity> rootDestinationEntity = query.from(Udn_Destinations_Entity.class);
							List<Predicate> countryPredicateList = new ArrayList<>();
							Predicate cityPredcate =criteriaBuilder.equal(clientRootEntity.get("cityId"), rootDestinationEntity.get("destinationId"));
							
							Predicate countryPredcate =criteriaBuilder.equal(clientRootEntity.get("countryId"), rootDestinationEntity.get("destinationId"));
							
							Predicate filteredCityIdPredicate =criteriaBuilder.equal(rootDestinationEntity.get("countryCode"),destinationEntity.getCountryCode());
							
							Predicate cityOptionMatchPredicate = criteriaBuilder.or(cityPredcate,countryPredcate);
						
							countryPredicateList.add(cityOptionMatchPredicate);
							countryPredicateList.add(filteredCityIdPredicate);
							predicates.addAll(countryPredicateList);
						}
						else {
							Predicate cityPredicate =criteriaBuilder.equal(clientRootEntity.get("cityId"), filterClientObj.getCityId());
							predicates.add(cityPredicate);
						}
					}
					return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
				}
			},paging);
			return filteredClientsList;
		}

		
		public boolean existsByClientIdAndClientName(long clientId, String clientName) {
			return clientRepository.existsByclientIdAndClientName(clientId, clientName);
		}
		
		public boolean existsByMobile(long mobile) {
			return clientRepository.existsByMobile(mobile);
		}
		
	   
	/*
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
		   //Optional<UdnIncentiveEntity> incentive = incentiveRepository.findById((long) entity.getIncentiveId());
		   //if(incentive.isPresent()) 
	            //entity = incentiveRepository.save(entity);
	    } 
	
	   
	   public List<UdnIncentiveEntity> findIncentiveSearchRecords(SearchIncentiveObj searchIncentiveObj){
		   Date fromDate = searchIncentiveObj.getClaimFromDate();
		   Date toDate = searchIncentiveObj.getClaimToDate();
		   String status = searchIncentiveObj.getClaimStatus().trim();
		   long userId = searchIncentiveObj.getUserId();
		   List<UdnIncentiveEntity> incentiveEntityList = null;
		   if(status!=null && status.trim().equalsIgnoreCase("ALL")) {
			   incentiveEntityList=incentiveRepository.findAllUserIncentives(fromDate,toDate,userId);
		   }else {
				incentiveEntityList = incentiveRepository.findIncentiveSearchRecords(status,fromDate,toDate,userId);
		   }
		 return incentiveEntityList;
	   }
	   
	   
	   public List<UdnIncentiveEntity> findAdminIncentiveSearchRecordsByUser(SearchIncentiveObj searchIncentiveObj){
		 System.out.println("Displaying Final Object Values " + searchIncentiveObj);
		   Date fromDate = searchIncentiveObj.getClaimFromDate();
		   Date toDate = searchIncentiveObj.getClaimToDate();
		   String status = searchIncentiveObj.getClaimStatus().trim();
		   long userId = searchIncentiveObj.getReportOfUser();
		   List<UdnIncentiveEntity> incentiveEntityList = null;
		
		   if((status!=null && status.trim().equalsIgnoreCase("ALL")) && (userId==0)){ // Here checking if status is selected all and user id is also selected all.
			   System.out.println("Chugggghhh size is " );
			   incentiveEntityList=incentiveRepository.findAllIncentives(fromDate,toDate);
			  
		   }
		   else if((status!=null && status.trim().equalsIgnoreCase("ALL")) && (userId!=0)) {
			   incentiveEntityList=incentiveRepository.findAllUserIncentives(fromDate,toDate,userId);
		   }else {
				incentiveEntityList = incentiveRepository.findIncentiveSearchRecords(status,fromDate,toDate,userId);
		   }
		 return incentiveEntityList;
	   }
	   */

	public List<UdnClientEntity> exportClients(ExportClientFilterObj filter) {
		try {
			Specification<UdnClientEntity> spec = new Specification<UdnClientEntity>() {
				@Override
				public Predicate toPredicate(Root<UdnClientEntity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
					List<Predicate> predicates = new ArrayList<>();

					if (filter != null) {
						// 1. City Filter
						if (filter.getCityId() > 0) {
							predicates.add(cb.equal(root.get("cityId"), filter.getCityId()));
						}

						// 2. Reference Filter
						if (filter.getReference() != null && !filter.getReference().trim().isEmpty()) {
							predicates.add(cb.like(cb.lower(root.get("referredBy")), "%" + filter.getReference().trim().toLowerCase() + "%"));
						}

						// 3. Date Filter
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						String dateType = filter.getDateFilterType() != null ? filter.getDateFilterType().toUpperCase() : "ALL";

						if ("TODAY".equals(dateType)) {
							Calendar cal = Calendar.getInstance();
							cal.set(Calendar.HOUR_OF_DAY, 0);
							cal.set(Calendar.MINUTE, 0);
							cal.set(Calendar.SECOND, 0);
							cal.set(Calendar.MILLISECOND, 0);
							Date startOfDay = cal.getTime();

							cal.set(Calendar.HOUR_OF_DAY, 23);
							cal.set(Calendar.MINUTE, 59);
							cal.set(Calendar.SECOND, 59);
							cal.set(Calendar.MILLISECOND, 999);
							Date endOfDay = cal.getTime();

							predicates.add(cb.between(root.get("createdAt"), startOfDay, endOfDay));

						} else if ("AFTER".equals(dateType)) {
							if (filter.getCreatedAfterDate() != null && !filter.getCreatedAfterDate().trim().isEmpty()) {
								try {
									Date afterDate = sdf.parse(filter.getCreatedAfterDate().trim());
									Calendar cal = Calendar.getInstance();
									cal.setTime(afterDate);
									cal.set(Calendar.HOUR_OF_DAY, 0);
									cal.set(Calendar.MINUTE, 0);
									cal.set(Calendar.SECOND, 0);
									cal.set(Calendar.MILLISECOND, 0);
									predicates.add(cb.greaterThanOrEqualTo(root.get("createdAt"), cal.getTime()));
								} catch (Exception e) {
									// ignore invalid date parse
								}
							}

						} else if ("RANGE".equals(dateType)) {
							Date startDate = null;
							Date endDate = null;
							if (filter.getStartDate() != null && !filter.getStartDate().trim().isEmpty()) {
								try {
									startDate = sdf.parse(filter.getStartDate().trim());
									Calendar cal = Calendar.getInstance();
									cal.setTime(startDate);
									cal.set(Calendar.HOUR_OF_DAY, 0);
									cal.set(Calendar.MINUTE, 0);
									cal.set(Calendar.SECOND, 0);
									cal.set(Calendar.MILLISECOND, 0);
									startDate = cal.getTime();
								} catch (Exception e) {
									startDate = null;
								}
							}
							if (filter.getEndDate() != null && !filter.getEndDate().trim().isEmpty()) {
								try {
									endDate = sdf.parse(filter.getEndDate().trim());
									Calendar cal = Calendar.getInstance();
									cal.setTime(endDate);
									cal.set(Calendar.HOUR_OF_DAY, 23);
									cal.set(Calendar.MINUTE, 59);
									cal.set(Calendar.SECOND, 59);
									cal.set(Calendar.MILLISECOND, 999);
									endDate = cal.getTime();
								} catch (Exception e) {
									endDate = null;
								}
							}

							if (startDate != null && endDate != null) {
								predicates.add(cb.between(root.get("createdAt"), startDate, endDate));
							} else if (startDate != null) {
								predicates.add(cb.greaterThanOrEqualTo(root.get("createdAt"), startDate));
							} else if (endDate != null) {
								predicates.add(cb.lessThanOrEqualTo(root.get("createdAt"), endDate));
							}
						}
					}

					return cb.and(predicates.toArray(new Predicate[0]));
				}
			};

			return clientRepository.findAll(spec, Sort.by(Sort.Direction.DESC, "clientId"));
		} catch (Exception e) {
			e.printStackTrace();
			return clientRepository.findAll();
		}
	}
}
