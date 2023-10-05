package com.udanchoo.intranet.service;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.JoinType;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.criteria.Selection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;
import com.udanchoo.intranet.entity.UdnTeam;
import com.udanchoo.intranet.entity.Udn_Task_Comments_Entity;
import com.udanchoo.intranet.entity.leads.TI_Leads_Followup_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.entity.leads.Ti_Leads_Team_Map_Entity;
import com.udanchoo.intranet.entity.supplier.Tg_Supplier_Destinations_Map_Entity;
import com.udanchoo.intranet.model.leads.FilterLeadObj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.repository.leads.TG_Leads_Repository;
import com.udanchoo.intranet.repository.leads.TI_Leads_Followup_Repository;
import com.udanchoo.intranet.util.UdanChooConstants;



@Service
public class LeadServiceImpl {

	@Autowired
	TG_Leads_Repository leadRepository;
	
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	ClientServiceImpl clientService;
	
	@Autowired
	TgB2bPartnerServicesImpl b2bPartnerService;
	
	@Autowired
	UserDetailsServiceImpl userService;

	@Autowired
	TI_Leads_Followup_Repository leadsFollowUpRepository;
	
	public Tg_Leads_Recorder_Entity saveLead(Tg_Leads_Recorder_Entity leadEntity) {
		leadRepository.save(leadEntity);
		return leadEntity;
	}
	
	public Tg_Leads_Recorder_Entity findLeadRecordById(long leadId) {
		return leadRepository.findById(leadId).get();
		
	}

	public TgLeadsRecorderVO getLeadVoFromEntity(Tg_Leads_Recorder_Entity tgLeadEntity) {
		TgLeadsRecorderVO tgLeadVO = new TgLeadsRecorderVO(tgLeadEntity);
		tgLeadVO.setSourceName(commonService.findDestinationById(tgLeadVO.getSource()).getCityName());
		tgLeadVO.setDestinationName(commonService.findDestinationById(tgLeadVO.getDestination()).getCityName());
		tgLeadVO.setContactName(clientService.find_ClientBy_Id(tgLeadVO.getContactId()).getClientName());
		Tg_B2b_Partner_Entity b2bPartner = b2bPartnerService.findPartnerById(tgLeadVO.getLeadSource());
		tgLeadVO.setLeadSourceShortName(b2bPartner.getPartnerShortName());
		tgLeadVO.setLeadSourceName(b2bPartner.getPartnerName());
		tgLeadVO.setStatusName(commonService.find_DealStatusById(tgLeadVO.getLeadStatus()).getWorkloadStatusName());
		tgLeadVO.setLeadOwnerName(userService.findUserByID(tgLeadVO.getLeadOwner()).getUsername());
		return tgLeadVO;
	}
	
	public TgLeadsRecorderVO updateLeadVoFromEntity(Tg_Leads_Recorder_Entity tgLeadEntity,TgLeadsRecorderVO tgLeadVO ) {
		tgLeadVO.setSourceName(commonService.findDestinationById(tgLeadVO.getSource()).getCityName());
		tgLeadVO.setDestinationName(commonService.findDestinationById(tgLeadVO.getDestination()).getCityName());
		tgLeadVO.setContactName(clientService.find_ClientBy_Id(tgLeadVO.getContactId()).getClientName());
		Tg_B2b_Partner_Entity b2bPartner = b2bPartnerService.findPartnerById(tgLeadVO.getLeadSource());
		tgLeadVO.setLeadSourceShortName(b2bPartner.getPartnerShortName());
		tgLeadVO.setLeadSourceName(b2bPartner.getPartnerName());
		tgLeadVO.setStatusName(commonService.find_DealStatusById(tgLeadVO.getLeadStatus()).getWorkloadStatusName());
		tgLeadVO.setLeadOwnerName(userService.findUserByID(tgLeadVO.getLeadOwner()).getUsername());
		return tgLeadVO;
	}
	
	
	public Page<Tg_Leads_Recorder_Entity>  filterLeads(int pageNo, int pageSize,long leadOwner,String sorting,FilterLeadObj filterLeadObj,boolean isAdmin ) {
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
		Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
		Date criteriaDate = cal.getTime();
		boolean isLeadAdmin=false;
		
		
		Page<Tg_Leads_Recorder_Entity> filteredLeadsList = leadRepository.findAll(new Specification<Tg_Leads_Recorder_Entity>() {
			/**
			 * 
			 */
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Tg_Leads_Recorder_Entity> leadsRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				//CriteriaQuery<Udn_Deals_Recorder_Entity> criteriaQueryDeal = criteriaBuilder.createQuery(Udn_Deals_Recorder_Entity.class);
				
				List<Predicate> predicates = new ArrayList<>();
				//if(!(isAdmin||isLeadAdmin)) {
				query.distinct(true);
				if(leadOwner!=0) {
					if(filterLeadObj.isOnlyLeadOwner()) {
						predicates.add(criteriaBuilder.equal(leadsRootEntity.get("leadOwner"), leadOwner));
					}
					else {
						Root<Ti_Leads_Team_Map_Entity> rootLeadsTeamMapEntity = query.from(Ti_Leads_Team_Map_Entity.class);
						List<Predicate> teamListPredicatesList = new ArrayList<>();
						Predicate notNullPredicate = criteriaBuilder.isNotNull(rootLeadsTeamMapEntity.get("leadId"));
						Predicate serviceCityPredcate =criteriaBuilder.equal( rootLeadsTeamMapEntity.get("userId"),leadOwner);
						Predicate supplierPredcate =criteriaBuilder.equal(leadsRootEntity.get("leadId"), rootLeadsTeamMapEntity.get("leadId"));
						Predicate finalJoinPredicate = criteriaBuilder.and(serviceCityPredcate,supplierPredcate,notNullPredicate);
						Predicate leadOwnerPredicatee = criteriaBuilder.equal(leadsRootEntity.get("leadOwner"), leadOwner);
						Predicate finalUltimatePredicate = criteriaBuilder.or(leadOwnerPredicatee,finalJoinPredicate);
						//teamListPredicatesList.add(leadOwnerPredicatee);
						teamListPredicatesList.add(finalUltimatePredicate);
						predicates.addAll(teamListPredicatesList);
					}
				}
				//}
				if(filterLeadObj.getLeadId()==0) {
					if(filterLeadObj.getDateCriteria()!=0) {
						String dateCriteria="";
						if(filterLeadObj.getDateCriteria()==1) {
							dateCriteria="createdAt";
						}
						else {
							dateCriteria="travelStartDate";
						}
						Date dateTo;
						Date dateFrom;
						try {
							dateTo = new SimpleDateFormat("yyyy-MM-dd").parse(filterLeadObj.getEndDate());
							dateFrom=new SimpleDateFormat("yyyy-MM-dd").parse(filterLeadObj.getStartDate());
							predicates.add(criteriaBuilder.between(leadsRootEntity.get(dateCriteria),dateFrom,dateTo));
						} catch (ParseException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
						
					}else {
						predicates.add(criteriaBuilder.greaterThanOrEqualTo(leadsRootEntity.get("createdAt"),criteriaDate));
					}
					
					if(filterLeadObj.getContactId()!=0) {
						predicates.add(criteriaBuilder.equal(leadsRootEntity.get("contactId"), filterLeadObj.getContactId()));
					}
					
					if(filterLeadObj.getSource()!=0) {
						predicates.add(criteriaBuilder.equal(leadsRootEntity.get("source"), filterLeadObj.getSource()));
					}
					if(filterLeadObj.getDestination()!=0) {
						predicates.add(criteriaBuilder.equal(leadsRootEntity.get("destination"), filterLeadObj.getDestination()));
					}
	
					
					if((filterLeadObj.getLeadStatus()!=0)&&(filterLeadObj.getLeadStatus()!=UdanChooConstants.VIEW_ALL_CLOSED_LEADS_WL_STATUS)&&(filterLeadObj.getLeadStatus()!=UdanChooConstants.VIEW_ALL_OPEN_LEADS_WL_STATUS)) {	
						predicates.add(criteriaBuilder.equal(leadsRootEntity.get("leadStatus"), filterLeadObj.getLeadStatus()));
					}else if(filterLeadObj.getLeadStatus()==UdanChooConstants.VIEW_ALL_CLOSED_LEADS_WL_STATUS){
						predicates.add(criteriaBuilder.greaterThan(leadsRootEntity.get("leadStatus"), UdanChooConstants.LEAD_WL_STATUS_THRESHOLD_OPEN));
					}
					/*else if(filterLeadObj.getLeadStatus()==UdanChooConstants.DEAL_FRESH_CREATED_LEAD_WL_STATUS){
						predicates.add(criteriaBuilder.equal(leadsRootEntity.get("leadStatus"), UdanChooConstants.LEAD_WL_STATUS_THRESHOLD_OPEN));
					}*/
					else if(filterLeadObj.getLeadStatus()==UdanChooConstants.VIEW_ALL_OPEN_LEADS_WL_STATUS){
						predicates.add(criteriaBuilder.lessThanOrEqualTo(leadsRootEntity.get("leadStatus"), UdanChooConstants.LEAD_WL_STATUS_THRESHOLD_OPEN));
					}
					
					if(filterLeadObj.getLeadSource()!=0) {
						predicates.add(criteriaBuilder.equal(leadsRootEntity.get("leadSource"), filterLeadObj.getLeadSource()));
					}
					
					 if(filterLeadObj.isQualified()) {
						 predicates.add(criteriaBuilder.equal(leadsRootEntity.get("isQualified"), filterLeadObj.isQualified()));
					 }
					 if(filterLeadObj.isFlagged()) {
						 predicates.add(criteriaBuilder.equal(leadsRootEntity.get("isFlagged"), filterLeadObj.isFlagged()));
					 }
					 
					 
				}
				else {
					predicates.add(criteriaBuilder.equal(leadsRootEntity.get("leadId"), filterLeadObj.getLeadId()));
				}
				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
			}
		},paging);
		
		return filteredLeadsList;
	}
	
	
	public Page<TI_Leads_Followup_Entity> filterLeadFollowupDetails(int pageNo, int pageSize, Long leadId, String sortBy,String sortOrder) {
		Sort sort = null;
		if(sortOrder.equalsIgnoreCase("ASC")) {
			sort = Sort.by(sortBy).ascending();
		}else {
			sort = Sort.by(sortBy).descending();
		}
		Pageable paging = PageRequest.of(pageNo, pageSize,sort);
		Page<TI_Leads_Followup_Entity> filteredLeadsFollowUpList = leadsFollowUpRepository.findAll(new Specification<TI_Leads_Followup_Entity>() {
			@Override
			public Predicate toPredicate(Root<TI_Leads_Followup_Entity> leadsFollowUpRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				//CriteriaQuery<Udn_Deals_Recorder_Entity> criteriaQueryDeal = criteriaBuilder.createQuery(Udn_Deals_Recorder_Entity.class);
				List<Predicate> predicates = new ArrayList<>();
				//criteriaBuilder.desc(taskCommentsRootEntity.get("updatedAt"));	
				Predicate taskIdPredcate =criteriaBuilder.equal(leadsFollowUpRootEntity.get("leadEntity").get("leadId"), leadId);
				predicates.add(taskIdPredcate);
				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
			}
		},paging);
		
		return filteredLeadsFollowUpList;
		}
	}
