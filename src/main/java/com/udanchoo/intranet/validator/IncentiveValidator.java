package com.udanchoo.intranet.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.model.IncentiveObj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;




@Component
public class IncentiveValidator implements Validator {
	 
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	ClientServiceImpl clientService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return com.udanchoo.intranet.model.EmailMessageVO.class.equals(clazz);	}

	//following code validates if the country code (String) matches with the country name.
	@Override
	public void validate(Object target, Errors errors) {
		IncentiveObj incentiveRecorderVO = (IncentiveObj)target;
		if(incentiveRecorderVO.getClaimOption()==null) {
			errors.rejectValue("claimOption", "incentive.type.error");
		}
	}
 
}