package com.udanchoo.intranet.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.model.incentive.IncentiveObj;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.DealServiceImpl;
import com.udanchoo.intranet.service.IncentiveServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;




@Component
public class IncentiveValidator implements Validator {
	 
	@Autowired
	IncentiveServiceImpl incentiveService;
	
	
	@Override
	public boolean supports(Class<?> clazz) {
		return com.udanchoo.intranet.model.EmailMessageVO.class.equals(clazz);	}

	//following code validates if the country code (String) matches with the country name.
	@Override
	public void validate(Object target, Errors errors) {
		IncentiveObj incentiveRecorderVO = (IncentiveObj)target;
		boolean errorFound = false;
		if(incentiveRecorderVO.getClaimOption()==null) {
			errorFound=true;
			errors.rejectValue("claimOption", "incentive.type.error");
		}
		if(incentiveRecorderVO.getDealConfirmationId()==0) {
			errorFound=true;
			errors.rejectValue("dealConfirmationId", "deal.missing.error");
		}
		else if (incentiveRecorderVO.getDealName()==null || (!isInteger(incentiveRecorderVO.getDealName()))){
			System.out.println("Control is coming here" + incentiveRecorderVO.getDealName());
			errorFound=true;
			errors.rejectValue("dealConfirmationId", "invalid.dealName");
		}
		else if (incentiveRecorderVO.getDealConfirmationId()!=Integer.parseInt(incentiveRecorderVO.getDealName())) {
			System.out.println("Not sure why deal confirmation id is zero");
			errorFound=true;
			errors.rejectValue("dealConfirmationId", "invalid.dealName");
		}
         if(!errorFound) {
			if(!incentiveService.checkIncentiveReclaimAllowed(incentiveRecorderVO.getDealConfirmationId(), incentiveRecorderVO.getClaimantId(),incentiveRecorderVO.getClaimOption())) {
				errors.rejectValue("claimantId", "incentive.duplicate.error");
			}
		}
	}
 
	public static boolean isInteger(String str) {
        try {
            Integer.parseInt(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }
}