package com.udanchoo.intranet.validator;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.model.EmailMessageVO;




@Component
public class EmailAudienceValidator implements Validator {
	 
	final private Pattern emailPattern = Pattern.compile("^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$");
	
	@Override
	public boolean supports(Class<?> clazz) {
		return com.udanchoo.intranet.model.EmailMessageVO.class.equals(clazz);	}

	@Override
	public void validate(Object target, Errors errors) {
		EmailMessageVO emailMessageVO = (EmailMessageVO)target;
        String emailToList = emailMessageVO.getEmailToList();

        if (emailToList == null || emailToList.trim().isEmpty()) {
            errors.rejectValue("emailMessageVo.emailToList", "invalid.emailToList");
            return;   // STOP HERE → prevents crash
        }

        StringTokenizer emailToTokens =
                new StringTokenizer(emailToList, ";,");
		ArrayList value = new ArrayList();
		while(emailToTokens.hasMoreTokens()) {
			value.add(emailToTokens.nextToken()); 
		}
		boolean valid = !(value == null || value.isEmpty()) && value.stream().filter(e -> !StringUtils.isEmpty(e)).filter(e -> emailPattern.matcher((CharSequence) e).matches()).count() == value.size();
		//boolean valid  = !(value == null || value.isEmpty()) && value.stream().filter(e -> !StringUtils.isEmpty(e)).filter(e -> emailPattern.matches((String)e)).count() == value.size();
    
		if(!valid) {
			if(emailMessageVO.isReminderServiceMessage()) {
				errors.rejectValue("emailMessageVo.emailToList", "invalid.emailToList");
			}
			else {
				errors.rejectValue("emailMessageVo.emailToList", "invalid.emailToList");
			}
		}else {
			ArrayList toList = new ArrayList();
			toList.addAll(value);
			emailMessageVO.setEmailToValidatedList(toList);
		}
		value.clear();

        String emailCcList = emailMessageVO.getEmailCcList();

        value.clear();

        if (emailCcList != null && !emailCcList.trim().isEmpty()) {
            emailToTokens = new StringTokenizer(emailCcList, ";,");
            while (emailToTokens.hasMoreTokens()) {
                value.add(emailToTokens.nextToken());
            }
        }
		while(emailToTokens.hasMoreTokens()) {
			value.add(emailToTokens.nextToken());
		}
		valid=true;
		valid = (value.stream().filter(e -> !StringUtils.isEmpty(e)).filter(e -> emailPattern.matcher((CharSequence) e).matches()).count() == value.size());
		if(!valid) {
			if(emailMessageVO.isReminderServiceMessage()) {
				errors.rejectValue("emailMessageVo.emailCcList", "invalid.emailCcList");
			}
			else {	
				errors.rejectValue("emailMessageVo.emailCcList", "invalid.emailCcList");
			}
		}else {
			ArrayList ccList = new ArrayList();
			ccList.addAll(value);
			emailMessageVO.setEmailCcValidatedList(ccList);
		}
		
		
	}
 
}