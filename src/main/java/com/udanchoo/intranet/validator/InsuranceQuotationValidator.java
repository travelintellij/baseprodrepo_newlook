package com.udanchoo.intranet.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.model.quotation.ManualHotelQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualInsuranceQuotationVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.HotelServiceImpl;
import com.udanchoo.intranet.service.QuotationServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;




@Component
public class InsuranceQuotationValidator implements Validator {
	 
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
		return com.udanchoo.intranet.model.quotation.ManualInsuranceQuotationVO.class.equals(clazz);	}

	//following code validates if the country code (String) matches with the country name.
	@Override
	public void validate(Object target, Errors errors) {
		ManualInsuranceQuotationVO manualInsuranceQuotationVO = (ManualInsuranceQuotationVO)target;
		if(!commonService.existsByDestinationIdAndCityName(manualInsuranceQuotationVO.getCountryId(),manualInsuranceQuotationVO.getCountryName())) {
			errors.rejectValue("countryName", "city.error");
		}
		
		
		if(manualInsuranceQuotationVO.getCoverageStartDate().compareTo(manualInsuranceQuotationVO.getCoverageEndDate())>0) {
			errors.rejectValue("coverageStartDate", "lead.invalid.date.criteria");
		}
		
		int sum = manualInsuranceQuotationVO.getAdults() + manualInsuranceQuotationVO.getChildren() + manualInsuranceQuotationVO.getInfant();
		if(sum<=0) {
			errors.rejectValue("adults", "paxcount.error");
		}
	
	
	}
 
}