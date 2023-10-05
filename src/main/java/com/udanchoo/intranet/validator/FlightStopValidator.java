package com.udanchoo.intranet.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.model.quotation.FlightStopDetailQuotationVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;




@Component
public class FlightStopValidator implements Validator {
	 
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	ClientServiceImpl clientService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return com.udanchoo.intranet.model.quotation.FlightStopDetailQuotationVO.class.equals(clazz);	}

	//following code validates if the country code (String) matches with the country name.
	@Override
	public void validate(Object target, Errors errors) {
		FlightStopDetailQuotationVO flightStopQuotationVO = (FlightStopDetailQuotationVO)target;
		
		if(!commonService.existsByAirportIdAndCityName(flightStopQuotationVO.getAirportCodeOrigin(), flightStopQuotationVO.getOriginCity())) {
			errors.rejectValue("originCity", "city.error");
		}
		if(!commonService.existsByAirportIdAndCityName(flightStopQuotationVO.getAirportCodeDestination(), flightStopQuotationVO.getDestinationCity())) {
			errors.rejectValue("destinationCity", "city.error");
		}
		
		int sum=flightStopQuotationVO.getAdultCount() + flightStopQuotationVO.getChildCount() ;
		
		if(sum==0) {
			errors.rejectValue("adultCount", "paxcount.error");
		}
		
		if(flightStopQuotationVO.getAdultCount() < flightStopQuotationVO.getInfantCount()) {
			errors.rejectValue("adultCount", "invalid.infant.error");
		}
		
		if(flightStopQuotationVO.getArrivalDate().isBefore(flightStopQuotationVO.getDepartureDate())) {
			errors.rejectValue("dateErrorHolder", "invalidArrivalDate");
		}
	}
 
}