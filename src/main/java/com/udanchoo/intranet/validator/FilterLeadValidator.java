package com.udanchoo.intranet.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.model.leads.FilterLeadObj;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;




@Component
public class FilterLeadValidator implements Validator {
	
	@Autowired
	UdnCommonServicesImpl commonService;
	
	
	@Override
	public boolean supports(Class<?> clazz) {
		return FilterLeadObj.class.equals(clazz);	}

	@Override
	public void validate(Object target, Errors errors) {
		FilterLeadObj filterLeadVo = (FilterLeadObj)target;
		System.out.println("Filter Validation is invoked. ");
		if(filterLeadVo.getSourceName()!=null && filterLeadVo.getSourceName().trim().length()>0) {
			if(!commonService.existsByDestinationIdAndCityName(filterLeadVo.getSource(), filterLeadVo.getSourceName())) {
				errors.rejectValue("sourceName", "lead.city.error");
			}
		}else {
			filterLeadVo.setSource(0);
		}
		
		if(filterLeadVo.getDestinationName()!=null && filterLeadVo.getDestinationName().trim().length()>0) {
			if(!commonService.existsByDestinationIdAndCityName(filterLeadVo.getDestination(), filterLeadVo.getDestinationName())) {
				errors.rejectValue("destinationName", "lead.city.error");
			}
		}else {
			filterLeadVo.setDestination(0);
		}
		
		if(filterLeadVo.getDateCriteria()==0) {
			if((filterLeadVo.getStartDate()!=null) && (filterLeadVo.getStartDate().trim().length()>0) ||
					(filterLeadVo.getEndDate()!=null) && (filterLeadVo.getEndDate().trim().length()>0)) {
				errors.rejectValue("dateCriteria", "lead.invalid.date.criteria");
			}
		}else {
			if(filterLeadVo.getEndDate().compareTo(filterLeadVo.getStartDate()) <0) {
				errors.rejectValue("endDate", "lead.invalid.date.range");
			}
		}
		
		/*
		
		if(leadRecorderVO.getTravelEndDate().compareTo(leadRecorderVO.getTravelStartDate()) <0) {
			errors.rejectValue("travelEndDate", "travel.start.end.error");
		}
		
		if(filterSLVo.getClientId()==0 && ((filterSLVo.getClientName()!=null) && (filterSLVo.getClientName().trim().length()!=0))){
			errors.rejectValue("clientName", "invalid.clientName");
		}
		if((filterSLVo.getDateFrom()==null || filterSLVo.getDateFrom().trim().length()==0) && (filterSLVo.getDateTo()!=null && filterSLVo.getDateTo().trim().length()>0)) {
			errors.rejectValue("dateFrom", "invalid.dateFromRange");
		}
		if((filterSLVo.getDateTo()==null || filterSLVo.getDateTo().trim().length()==0) && (filterSLVo.getDateFrom()!=null && filterSLVo.getDateFrom().trim().length()>0)) {
			errors.rejectValue("dateFrom", "invalid.dateFromRange");
		}
		
		if((filterSLVo.getDateFrom()!=null) && (filterSLVo.getDateFrom().trim().length()>0) && (filterSLVo.getDateTo()!=null) && (filterSLVo.getDateTo().trim().length()>0)) {
			try {
				Date dateTo=new SimpleDateFormat("yyyy-MM-dd").parse(filterSLVo.getDateTo());
				Date dateFrom=new SimpleDateFormat("yyyy-MM-dd").parse(filterSLVo.getDateFrom());
				
				if(dateFrom.after(dateTo)) {
					errors.rejectValue("dateFrom", "invalid.dateFromRange");
				}
				
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			}
		
		 */	
	}
	
 
}