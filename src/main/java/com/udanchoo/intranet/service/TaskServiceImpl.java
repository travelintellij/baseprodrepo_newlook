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

import com.udanchoo.intranet.entity.Udn_Task_Comments_Entity;
import com.udanchoo.intranet.entity.Udn_Task_Recorder_Entity;
import com.udanchoo.intranet.model.FilterTaskObj;
import com.udanchoo.intranet.repository.Deal_Task_Recorder_Repository;
import com.udanchoo.intranet.repository.Task_Comments_Repository;
import com.udanchoo.intranet.util.UdanChooConstants;



@Service
public class TaskServiceImpl {

	@Autowired
	Deal_Task_Recorder_Repository taskRepository;

	@Autowired
	Task_Comments_Repository taskCommentsRepository;
	
	public Udn_Task_Recorder_Entity saveTask(Udn_Task_Recorder_Entity taskEntity) {
		taskRepository.save(taskEntity);
		return taskEntity;
		
	}
	
	
	public Page<Udn_Task_Recorder_Entity>  searchTasks(int pageNo, int pageSize,long taskOwner,String sorting,FilterTaskObj filterTaskVo ) {
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
		
		
		Page<Udn_Task_Recorder_Entity> filteredTaskList = taskRepository.findAll(new Specification<Udn_Task_Recorder_Entity>() {
			@Override
			public Predicate toPredicate(Root<Udn_Task_Recorder_Entity> taskRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				//CriteriaQuery<Udn_Deals_Recorder_Entity> criteriaQueryDeal = criteriaBuilder.createQuery(Udn_Deals_Recorder_Entity.class);
				List<Predicate> predicates = new ArrayList<>();
				criteriaBuilder.desc(taskRootEntity.get("updatedAt"));	
				
				/************** Following predicate implements OR operator. where it will show all tasks irrespective of logged in user as creator or owner ************/
				Predicate taskOwnerPredcate =criteriaBuilder.equal(taskRootEntity.get("taskOwner"), taskOwner); 
				Predicate taskCreatorPredcate =criteriaBuilder.equal(taskRootEntity.get("taskCreator"), taskOwner);
				Predicate userPredicate = criteriaBuilder.or(taskOwnerPredcate,taskCreatorPredcate);
				/************** ********************************************************************************************************** ************/
				Predicate taskStatus ;
				if(! filterTaskVo.isCompletedTaskOnly()) {
					taskStatus =criteriaBuilder.equal(taskRootEntity.get("taskStatus"), UdanChooConstants.TASK_OPEN_STATUS);
				}
				else {
					taskStatus =criteriaBuilder.equal(taskRootEntity.get("taskStatus"), UdanChooConstants.TASK_CLOSED_STATUS);
				}
				
				if(filterTaskVo.getTaskOwner()!=0) {
					Predicate taskOwnerFilter =criteriaBuilder.equal(taskRootEntity.get("taskOwner"), filterTaskVo.getTaskOwner());
					predicates.add(taskOwnerFilter);
				}
				if(filterTaskVo.getDealConfirmationId()!=0) {
					Predicate dealTaskFilter =criteriaBuilder.equal(taskRootEntity.get("dealConfirmationId"), filterTaskVo.getDealConfirmationId());
					predicates.add(dealTaskFilter);
				}
				if(filterTaskVo.getTaskId()!=0) {
					Predicate taskIdFilter =criteriaBuilder.equal(taskRootEntity.get("taskId"), filterTaskVo.getTaskId());
					predicates.add(taskIdFilter);
				}
				if(filterTaskVo.getTaskPriority()!=null && filterTaskVo.getTaskPriority().trim().length()>0) {
					Predicate dealTaskFilter =criteriaBuilder.equal(taskRootEntity.get("taskPriority"), filterTaskVo.getTaskPriority());
					predicates.add(dealTaskFilter);
				}
				
				predicates.add(taskStatus);
				predicates.add(userPredicate);
				predicates.add(criteriaBuilder.greaterThanOrEqualTo(taskRootEntity.get("createdAt"),criteriaDate));

				if((filterTaskVo.getDateFrom()!=null) && (filterTaskVo.getDateFrom().trim().length()>0) && (filterTaskVo.getDateTo()!=null) && (filterTaskVo.getDateTo().trim().length()>0)) {
					try {
						//Date dateTo=new SimpleDateFormat("yyyy-MM-dd").parse(filterTaskVo.getDateTo());
						//Date dateFrom=new SimpleDateFormat("yyyy-MM-dd").parse(filterTaskVo.getDateFrom());
						LocalDateTime ldtFrom = LocalDate.parse(filterTaskVo.getDateFrom()).atTime(LocalTime.parse("00:00"));
						LocalDateTime ldtTo = LocalDate.parse(filterTaskVo.getDateTo()).atTime(LocalTime.parse("23:59"));
						
						predicates.add(criteriaBuilder.between(taskRootEntity.get("taskDueDate"),ldtFrom,ldtTo));
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				
				if(filterTaskVo.isOverDueTasks()) {

					LocalDateTime now = LocalDateTime.now();
					predicates.add(criteriaBuilder.lessThan(taskRootEntity.get("taskDueDate"),now));
				}
				if(filterTaskVo.isMyCreatedTaskOnly()) {
					//taskowner is nothing but the user who is logged in. dont get confused with this filter that why taskcreator is
					// filtered with taskOwner value.
					Predicate myCreatedTaskFilter =criteriaBuilder.equal(taskRootEntity.get("taskCreator"), taskOwner);
					predicates.add(myCreatedTaskFilter);
				}
				if(filterTaskVo.isMyAssignedTaskOnly()) {
					Predicate myAssignedTaskFilter =criteriaBuilder.equal(taskRootEntity.get("taskOwner"), taskOwner);
					predicates.add(myAssignedTaskFilter);
				}
				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
			}
		},paging);
		
		return filteredTaskList;
	}
	
	public Optional<Udn_Task_Recorder_Entity> find_task_ById(long taskId) {
		
			return taskRepository.findById(taskId);
	}
	
	public void deleteTaskById(long taskId) {
		taskRepository.deleteById(taskId);
	}
	
	
	
	public Page<Udn_Task_Comments_Entity>  searchTasksComments(int pageNo, int pageSize,long taskId,String sortBy) {
		Sort sort = Sort.by(sortBy).descending();
		Pageable paging = PageRequest.of(pageNo, pageSize,sort);
		Page<Udn_Task_Comments_Entity> filteredTaskList = taskCommentsRepository.findAll(new Specification<Udn_Task_Comments_Entity>() {
			@Override
			public Predicate toPredicate(Root<Udn_Task_Comments_Entity> taskCommentsRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				//CriteriaQuery<Udn_Deals_Recorder_Entity> criteriaQueryDeal = criteriaBuilder.createQuery(Udn_Deals_Recorder_Entity.class);
				List<Predicate> predicates = new ArrayList<>();
				criteriaBuilder.desc(taskCommentsRootEntity.get("updatedAt"));	
				Predicate taskIdPredcate =criteriaBuilder.equal(taskCommentsRootEntity.get("taskEntity").get("taskId"), taskId);
				predicates.add(taskIdPredcate);
				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
			}
		},paging);
		
		return filteredTaskList;
	}
	
	 
}
