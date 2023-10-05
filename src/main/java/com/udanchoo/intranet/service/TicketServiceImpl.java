package com.udanchoo.intranet.service;


import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
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

import com.udanchoo.intranet.entity.Udn_Ticket_Comments_Entity;
import com.udanchoo.intranet.entity.Udn_Ticket_Recorder_Entity;
import com.udanchoo.intranet.model.FilterTicketObj;
import com.udanchoo.intranet.repository.Deal_Ticket_Recorder_Repository;
import com.udanchoo.intranet.repository.Ticket_Comments_Repository;
import com.udanchoo.intranet.util.UdanChooConstants;



@Service
public class TicketServiceImpl {

	@Autowired
	Deal_Ticket_Recorder_Repository ticketRepository;
	
	@Autowired
	Ticket_Comments_Repository ticketCommentsRepository;

	public Udn_Ticket_Recorder_Entity saveTicket(Udn_Ticket_Recorder_Entity ticketEntity) {
		ticketRepository.save(ticketEntity);
		return ticketEntity;
		
	}
	
	
	public Page<Udn_Ticket_Recorder_Entity>  searchTickets(int pageNo, int pageSize,long ticketOwner,String sorting,FilterTicketObj filterTicketVo ) {
		//Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
		Pageable paging = null;
		if(sorting.equalsIgnoreCase("UpdatedAt")) {
			paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting).descending());	
		}
		else {
			paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
		}
		Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
				
		Date criteriaDate = cal.getTime();
		
		
		Page<Udn_Ticket_Recorder_Entity> filteredTicketList = ticketRepository.findAll(new Specification<Udn_Ticket_Recorder_Entity>() {
			@Override
			public Predicate toPredicate(Root<Udn_Ticket_Recorder_Entity> ticketRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				//CriteriaQuery<Udn_Deals_Recorder_Entity> criteriaQueryDeal = criteriaBuilder.createQuery(Udn_Deals_Recorder_Entity.class);
				List<Predicate> predicates = new ArrayList<>();
				criteriaBuilder.desc(ticketRootEntity.get("updatedAt"));	
				
				/************** Following predicate implements OR operator. where it will show all tickets irrespective of logged in user as creator or owner ************/
				Predicate ticketOwnerPredcate =criteriaBuilder.equal(ticketRootEntity.get("ticketOwner"), ticketOwner); 
				Predicate ticketCreatorPredcate =criteriaBuilder.equal(ticketRootEntity.get("ticketCreator"), ticketOwner);
				Predicate userPredicate = criteriaBuilder.or(ticketOwnerPredcate,ticketCreatorPredcate);
				/************** ********************************************************************************************************** ************/
				Predicate ticketStatus ;
				if(! filterTicketVo.isCompletedTicketOnly()) {
					ticketStatus =criteriaBuilder.equal(ticketRootEntity.get("ticketStatus"), UdanChooConstants.TASK_OPEN_STATUS);
				}
				else {
					ticketStatus =criteriaBuilder.equal(ticketRootEntity.get("ticketStatus"), UdanChooConstants.TASK_CLOSED_STATUS);
				}
				
				if(filterTicketVo.getTicketOwner()!=0) {
					Predicate ticketOwnerFilter =criteriaBuilder.equal(ticketRootEntity.get("ticketOwner"), filterTicketVo.getTicketOwner());
					predicates.add(ticketOwnerFilter);
				}
				if(filterTicketVo.getDealConfirmationId()!=0) {
					Predicate dealTicketFilter =criteriaBuilder.equal(ticketRootEntity.get("dealConfirmationId"), filterTicketVo.getDealConfirmationId());
					predicates.add(dealTicketFilter);
				}
				if(filterTicketVo.getTicketId()!=0) {
					Predicate ticketIdFilter =criteriaBuilder.equal(ticketRootEntity.get("ticketId"), filterTicketVo.getTicketId());
					predicates.add(ticketIdFilter);
				}
				if(filterTicketVo.getTicketPriority()!=null && filterTicketVo.getTicketPriority().trim().length()>0) {
					Predicate dealTicketFilter =criteriaBuilder.equal(ticketRootEntity.get("ticketPriority"), filterTicketVo.getTicketPriority());
					predicates.add(dealTicketFilter);
				}
				
				predicates.add(ticketStatus);
				predicates.add(userPredicate);
				predicates.add(criteriaBuilder.greaterThanOrEqualTo(ticketRootEntity.get("createdAt"),criteriaDate));

				if((filterTicketVo.getDateFrom()!=null) && (filterTicketVo.getDateFrom().trim().length()>0) && (filterTicketVo.getDateTo()!=null) && (filterTicketVo.getDateTo().trim().length()>0)) {
					try {
						//Date dateTo=new SimpleDateFormat("yyyy-MM-dd").parse(filterTicketVo.getDateTo());
						//Date dateFrom=new SimpleDateFormat("yyyy-MM-dd").parse(filterTicketVo.getDateFrom());
						LocalDateTime ldtFrom = LocalDate.parse(filterTicketVo.getDateFrom()).atTime(LocalTime.parse("00:00"));
						LocalDateTime ldtTo = LocalDate.parse(filterTicketVo.getDateTo()).atTime(LocalTime.parse("23:59"));
						
						predicates.add(criteriaBuilder.between(ticketRootEntity.get("ticketDueDate"),ldtFrom,ldtTo));
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if(filterTicketVo.isOverDueTickets()) {

					LocalDateTime now = LocalDateTime.now();
					predicates.add(criteriaBuilder.lessThan(ticketRootEntity.get("ticketDueDate"),now));
				}
				if(filterTicketVo.isMyCreatedTicketOnly()) {
					//ticketowner is nothing but the user who is logged in. dont get confused with this filter that why ticketcreator is
					// filtered with ticketOwner value.
					Predicate myCreatedTicketFilter =criteriaBuilder.equal(ticketRootEntity.get("ticketCreator"), ticketOwner);
					predicates.add(myCreatedTicketFilter);
				}
				if(filterTicketVo.isMyAssignedTicketOnly()) {
					Predicate myAssignedTicketFilter =criteriaBuilder.equal(ticketRootEntity.get("ticketOwner"), ticketOwner);
					predicates.add(myAssignedTicketFilter);
				}
				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
			}
		},paging);
		
		return filteredTicketList;
	}
	
	public Optional<Udn_Ticket_Recorder_Entity> find_ticket_ById(long ticketId) {
		
			return ticketRepository.findById(ticketId);
	}
	
	public Page<Udn_Ticket_Comments_Entity>  searchTicketComments(int pageNo, int pageSize,long ticketId,String sortBy) {
		Sort sort = Sort.by(sortBy).descending();
		Pageable paging = PageRequest.of(pageNo, pageSize,sort);
		Page<Udn_Ticket_Comments_Entity> filteredTicketList = ticketCommentsRepository.findAll(new Specification<Udn_Ticket_Comments_Entity>() {
			@Override
			public Predicate toPredicate(Root<Udn_Ticket_Comments_Entity> ticketCommentsRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				//CriteriaQuery<Udn_Deals_Recorder_Entity> criteriaQueryDeal = criteriaBuilder.createQuery(Udn_Deals_Recorder_Entity.class);
				List<Predicate> predicates = new ArrayList<>();
				criteriaBuilder.desc(ticketCommentsRootEntity.get("updatedAt"));	
				Predicate ticketIdPredcate =criteriaBuilder.equal(ticketCommentsRootEntity.get("ticketEntity").get("ticketId"), ticketId);
				predicates.add(ticketIdPredcate);
				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
			}
		},paging);
		
		return filteredTicketList;
	}
	 
}
