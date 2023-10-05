package com.udanchoo.intranet.validator;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.model.EmailMessageVO;
import com.udanchoo.intranet.model.Udn_Destinations_Master_Obj;
import com.udanchoo.intranet.model.Udn_Visa_Consulate_Master_Obj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.model.quotation.ManualFlightQuotationVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.DealServiceImpl;
import com.udanchoo.intranet.service.QuotationServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;




@Component
public class ManualQuotationValidator implements Validator {
	 
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	QuotationServiceImpl quotationService;
	
	@Autowired
	ClientServiceImpl clientService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return com.udanchoo.intranet.model.quotation.ManualFlightQuotationVO.class.equals(clazz);	}

	//following code validates if the country code (String) matches with the country name.
	@Override
	public void validate(Object target, Errors errors) {
		ManualFlightQuotationVO manualFlightQuotationVO = (ManualFlightQuotationVO)target;
		if(!commonService.existsByAirportIdAndCityName(manualFlightQuotationVO.getAirportCodeOrigin(), manualFlightQuotationVO.getOriginCity())) {
			errors.rejectValue("originCity", "city.error");
		}
		if(!commonService.existsByAirportIdAndCityName(manualFlightQuotationVO.getAirportCodeDestination(), manualFlightQuotationVO.getDestinationCity())) {
			errors.rejectValue("destinationCity", "city.error");
		}
		
		int sum=manualFlightQuotationVO.getAdultCount() + manualFlightQuotationVO.getChildCount() ;
		
		if(sum==0) {
			errors.rejectValue("adultCount", "paxcount.error");
		}
		
		if(manualFlightQuotationVO.getAdultCount() < manualFlightQuotationVO.getInfantCount()) {
			errors.rejectValue("adultCount", "invalid.infant.error");
		}
		
		if(manualFlightQuotationVO.getManualFlightQuotationId()!=0) {
			if((manualFlightQuotationVO.getNoOfStops() +1) < quotationService.countFlightStopsByManualFlightQuoationId(manualFlightQuotationVO.getManualFlightQuotationId())) {
				errors.rejectValue("noOfStops", "invalid.less.stops");
			}
		}
		/*
		if(!commonService.existsByDestinationIdAndCityName(leadRecorderVO.getDestination(), leadRecorderVO.getDestinationName())) {
			errors.rejectValue("destinationName", "city.error");
		}
		if(!clientService.existsByClientIdAndClientName(leadRecorderVO.getContactId(), leadRecorderVO.getContactName())) {
			errors.rejectValue("contactName", "contact.error");
		}
		if(leadRecorderVO.getChildren()==0 && leadRecorderVO.getAdults()==0) {
			errors.rejectValue("adults", "min.traveler.error");
		}
		if(!(leadRecorderVO.isFlight() || leadRecorderVO.isHotel()|| leadRecorderVO.isCruise() ||
				leadRecorderVO.isInsurance() ||leadRecorderVO.isPackageWithFlight() ||leadRecorderVO.isPackageWithoutFlight() 
					||leadRecorderVO.isSightseeing()||leadRecorderVO.isTransfers()||leadRecorderVO.isVisa())) {
			errors.rejectValue("minOneserviceError", "min.one.service.error");
		}
		
		if(leadRecorderVO.getTravelEndDate().compareTo(leadRecorderVO.getTravelStartDate()) <0) {
			errors.rejectValue("travelEndDate", "travel.start.end.error");
		}
		*/
	}
 
}