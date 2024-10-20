package com.udanchoo.intranet.service;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.client.RestTemplate;

import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_CRS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_FLT_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_HTL_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_INS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_LDP_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_OTH_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_STS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_Services_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_Status_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_TRN_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_VSA_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;
import com.udanchoo.intranet.entity.deals.Ti_Deals_Team_Map_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.entity.leads.Ti_Leads_Team_Map_Entity;
import com.udanchoo.intranet.entity.quotation.Tg_Quotation_Recorder_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Cruise_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Flight_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Hotel_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Insurance_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Other_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Package_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_SightSeeing_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Transfer_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Visa_Quotation_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.DashboardLineChartObj;
import com.udanchoo.intranet.model.DashboardObj;
import com.udanchoo.intranet.model.SearchDealObj;

import com.udanchoo.intranet.model.Udn_Deal_Services_Map_Obj;
import com.udanchoo.intranet.model.Udn_Deals_Recorder_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.leads.FilterLeadObj;
import com.udanchoo.intranet.model.partner.Tg_B2bPartner_Obj;
import com.udanchoo.intranet.model.quotation.ManualFlightQuotationVO;
import com.udanchoo.intranet.model.quotation.TgQuotationRecorderVO;
import com.udanchoo.intranet.repository.DealRepository;
import com.udanchoo.intranet.repository.Deal_Service_Map_Repository;
import com.udanchoo.intranet.repository.Deal_Status_Repository;
import com.udanchoo.intranet.repository.TgB2bPartnersRepository;
import com.udanchoo.intranet.repository.Ti_Deals_Team_Map_Repository;
import com.udanchoo.intranet.repository.Udn_Services_Master_Repository;
import com.udanchoo.intranet.util.UdanChooConstants;



@Service
public class ServiceLineQueueServiceImpl {

	@Autowired
	DealRepository dealRepository;
	
	@Autowired
	ClientServiceImpl clientService;
	
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	Udn_Services_Master_Repository serviceMasterRepository;
	
	@Autowired
	Deal_Service_Map_Repository serviceMapRepository;
	
	@Autowired
	TgB2bPartnersRepository agentRepository;
	
	@Autowired
	Deal_Status_Repository dealStatusRepository;
	
   
	@Autowired
	DealServiceLineImpl dealServiceLine;
	
	@Autowired
	UserDetailsServiceImpl userService;

	@Autowired
	Ti_Deals_Team_Map_Repository dealTeamMapRepository;
	
	
	public Page<Udn_Deals_Recorder_Entity>  filterServiceLineQueueDeals(int pageNo, int pageSize,long dealOwner,String sorting,SearchDealObj filterDealObj,boolean isAdmin ) {
		boolean dateCheckFilterNeeded = true;
		String searchCriteria = filterDealObj.getSearchCriteria();
		//System.out.println("Filtered Object is " + filterDealObj);
		
		if(filterDealObj.getDealConfirmationId()!=0) {
			dateCheckFilterNeeded = false;
		}
		filterDealObj.setDateCheckFilterNeeded(dateCheckFilterNeeded);
		
		Sort sort = Sort.by(sorting).ascending(); 
		if(!filterDealObj.isUpcomingDeal()) {
			sorting ="travelEndDate";
			sort = Sort.by(sorting).descending();
		}
		
		Pageable paging = PageRequest.of(pageNo, pageSize,sort);
		Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
		Date criteriaDate = cal.getTime();
		boolean isDealAdmin=false;
		
		Page<Udn_Deals_Recorder_Entity> filtereDealsList = dealRepository.findAll(new Specification<Udn_Deals_Recorder_Entity>() {
			private static final long serialVersionUID = 1L;
			@Override
			public Predicate toPredicate(Root<Udn_Deals_Recorder_Entity> dealsRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				List<Predicate> predicates = new ArrayList<>();
				query.distinct(true);
				if(dealOwner!=0) {
					Root<Ti_Deals_Team_Map_Entity> rootDealsTeamMapEntity = query.from(Ti_Deals_Team_Map_Entity.class);
					List<Predicate> teamListPredicatesList = new ArrayList<>();
					Predicate notNullPredicate = criteriaBuilder.isNotNull(rootDealsTeamMapEntity.get("dealConfirmationId"));
					Predicate serviceCityPredcate =criteriaBuilder.equal( rootDealsTeamMapEntity.get("userId"),dealOwner);
					Predicate supplierPredcate =criteriaBuilder.equal(dealsRootEntity.get("dealConfirmationId"), rootDealsTeamMapEntity.get("dealConfirmationId"));
					Predicate finalJoinPredicate = criteriaBuilder.and(serviceCityPredcate,supplierPredcate,notNullPredicate);
					Predicate dealOwnerPredicate = criteriaBuilder.equal(dealsRootEntity.get("dealOwner"), dealOwner);
					Predicate finalUltimatePredicate = criteriaBuilder.or(dealOwnerPredicate,finalJoinPredicate);
					teamListPredicatesList.add(finalUltimatePredicate);
					predicates.addAll(teamListPredicatesList);
				}
				if(filterDealObj.getDealConfirmationId()!=0) {
					predicates.add(criteriaBuilder.equal(dealsRootEntity.get("dealConfirmationId"), filterDealObj.getDealConfirmationId()));
				}
				if(filterDealObj.getDealStatus()!=0) {
					predicates.add(criteriaBuilder.equal(dealsRootEntity.get("dealStatus"), filterDealObj.getDealStatus()));
				}
				if(filterDealObj.isUpcomingDeal() && filterDealObj.isDateCheckFilterNeeded()) {
					predicates.add(criteriaBuilder.greaterThanOrEqualTo(dealsRootEntity.get("travelEndDate"),currentDate));
				}
				else if((!filterDealObj.isUpcomingDeal()) && filterDealObj.isDateCheckFilterNeeded()) {
					predicates.add(criteriaBuilder.lessThanOrEqualTo(dealsRootEntity.get("travelEndDate"),currentDate));
				}
				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
				
			}
		},paging);
		
		return filtereDealsList;
	}
	
	
}
