package com.udanchoo.intranet.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.model.quotation.ManualCruiseQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualHotelQuotationVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.HotelServiceImpl;
import com.udanchoo.intranet.service.QuotationServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;




@Component
public class CruiseQuotationValidator implements Validator {
	 
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	QuotationServiceImpl quotationService;
	
	@Autowired
	HotelServiceImpl hotelService;
	
	@Autowired
	ClientServiceImpl clientService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return com.udanchoo.intranet.model.quotation.ManualCruiseQuotationVO.class.equals(clazz);	}

	//following code validates if the country code (String) matches with the country name.
	@Override
	public void validate(Object target, Errors errors) {
		ManualCruiseQuotationVO manualCruiseQuotationVO = (ManualCruiseQuotationVO)target;
		if(!commonService.existsByDestinationIdAndCityName(manualCruiseQuotationVO.getCityId(),manualCruiseQuotationVO.getCityName())) {
			errors.rejectValue("cityName", "city.error");
		}
		
		
		
		if(manualCruiseQuotationVO.getSailingStartDate().compareTo(manualCruiseQuotationVO.getSailingEndDate())>0) {
			errors.rejectValue("sailingStartDate", "lead.invalid.date.criteria");
		}
		
		int sum = manualCruiseQuotationVO.getAdults() + manualCruiseQuotationVO.getChildren();
		if(sum<=0) {
			errors.rejectValue("adults", "paxcount.error");
		}
	
	
	}
 
}