package com.udanchoo.intranet.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.entity.Udn_SightSeeing_Master_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.quotation.ManualHotelQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualSightSeeingQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualVisaQuotationVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.HotelServiceImpl;
import com.udanchoo.intranet.service.QuotationServiceImpl;
import com.udanchoo.intranet.service.SightSeeingServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;




@Component
public class VisaQuotationValidator implements Validator {
	 
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	QuotationServiceImpl quotationService;
	
	
	@Autowired
	ClientServiceImpl clientService;
	
	
	
	@Override
	public boolean supports(Class<?> clazz) {
		return com.udanchoo.intranet.model.quotation.ManualVisaQuotationVO.class.equals(clazz);	}

	//following code validates if the country code (String) matches with the country name.
	@Override
	public void validate(Object target, Errors errors) {
		ManualVisaQuotationVO manualVisaQuotationVO = (ManualVisaQuotationVO)target;
		int sum = manualVisaQuotationVO.getAdults() + manualVisaQuotationVO.getChildren() + manualVisaQuotationVO.getInfant(); 
		if(sum<=0) {
			errors.rejectValue("adults", "paxcount.error");
		}
	
	}
 
}