package com.udanchoo.intranet.validator;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.model.EmailMessageVO;
import com.udanchoo.intranet.model.FilterServiceLineObj;




@Component
public class FilterServiceLineValidator implements Validator {
	 
	final private Pattern emailPattern = Pattern.compile("^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$");
	
	@Override
	public boolean supports(Class<?> clazz) {
		return com.udanchoo.intranet.model.EmailMessageVO.class.equals(clazz);	}

	@Override
	public void validate(Object target, Errors errors) {
		FilterServiceLineObj filterSLVo = (FilterServiceLineObj)target;
		System.out.println("Filtered object is " + filterSLVo);
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
		/*
		EmailMessageVO emailMessageVO = (EmailMessageVO)target;
		StringTokenizer emailToTokens = new StringTokenizer(emailMessageVO.getEmailToList(),";,");
		ArrayList value = new ArrayList();
		while(emailToTokens.hasMoreTokens()) {
			value.add(emailToTokens.nextToken()); 
		}
		boolean valid = !(value == null || value.isEmpty()) && value.stream().filter(e -> !StringUtils.isEmpty(e)).filter(e -> emailPattern.matcher((CharSequence) e).matches()).count() == value.size();
		//boolean valid  = !(value == null || value.isEmpty()) && value.stream().filter(e -> !StringUtils.isEmpty(e)).filter(e -> emailPattern.matches((String)e)).count() == value.size();
    
		if(!valid) {
			errors.rejectValue("emailToList", "invalid.emailToList");
		}else {
			ArrayList toList = new ArrayList();
			toList.addAll(value);
			emailMessageVO.setEmailToValidatedList(toList);
		}
		value.clear();
		
		emailToTokens = new StringTokenizer(emailMessageVO.getEmailCcList(),";,");
		while(emailToTokens.hasMoreTokens()) {
			value.add(emailToTokens.nextToken());
		}
		valid=true;
		valid = (value.stream().filter(e -> !StringUtils.isEmpty(e)).filter(e -> emailPattern.matcher((CharSequence) e).matches()).count() == value.size());
		if(!valid) {
			errors.rejectValue("emailCcList", "invalid.emailCcList");
		}else {
			ArrayList ccList = new ArrayList();
			ccList.addAll(value);
			emailMessageVO.setEmailCcValidatedList(ccList);
		}
		*/
		
		
	}
 
}