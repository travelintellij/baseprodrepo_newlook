package com.udanchoo.intranet.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.entity.quotation.Tg_Quotation_Recorder_Entity;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.model.quotation.TgQuotationRecorderVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.QuotationServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;




@Component
public class QuotationVersionAddValidator implements Validator {
	
	@Autowired
	QuotationServiceImpl quotationService;
	
	
	@Override
	public boolean supports(Class<?> clazz) {
		return com.udanchoo.intranet.model.EmailMessageVO.class.equals(clazz);	}

	//following code validates if the country code (String) matches with the country name.
	@Override
	public void validate(Object target, Errors errors) {
		TgQuotationRecorderVO qtnRecorderObj = (TgQuotationRecorderVO)target;
		if(qtnRecorderObj.getQuotationName()==null || qtnRecorderObj.getQuotationName().trim().length()==0) {
			errors.rejectValue("quotationName", "quotation.name.not.empty");
		}
		if((!qtnRecorderObj.isTourPackage())&& (!qtnRecorderObj.isFlight())&& (!qtnRecorderObj.isHotel())&& (!qtnRecorderObj.isTransfers())&&
				(!qtnRecorderObj.isSightseeing())&& (!qtnRecorderObj.isVisa())&& (!qtnRecorderObj.isInsurance())&& (!qtnRecorderObj.isCruise())&&
				(!qtnRecorderObj.isOthers())) {
			errors.rejectValue("tourPackage", "quotation.service.not.empty");
		}
			
		
	}
 
}