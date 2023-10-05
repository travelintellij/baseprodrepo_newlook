package com.udanchoo.intranet.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.entity.Udn_SightSeeing_Master_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.quotation.ManualHotelQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualSightSeeingQuotationVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.HotelServiceImpl;
import com.udanchoo.intranet.service.QuotationServiceImpl;
import com.udanchoo.intranet.service.SightSeeingServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;




@Component
public class SightSeeingQuotationValidator implements Validator {
	 
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	QuotationServiceImpl quotationService;
	
	@Autowired
	HotelServiceImpl hotelService;
	
	@Autowired
	ClientServiceImpl clientService;
	
	@Autowired
	SightSeeingServiceImpl sightSeeingService;
	
	
	@Override
	public boolean supports(Class<?> clazz) {
		return com.udanchoo.intranet.model.quotation.ManualSightSeeingQuotationVO.class.equals(clazz);	}

	//following code validates if the country code (String) matches with the country name.
	@Override
	public void validate(Object target, Errors errors) {
		ManualSightSeeingQuotationVO manualSightSeeingQuotationVO = (ManualSightSeeingQuotationVO)target;
		if(!commonService.existsByDestinationIdAndCityName(manualSightSeeingQuotationVO.getCityId(),manualSightSeeingQuotationVO.getCityName())) {
			errors.rejectValue("cityName", "city.error");
		}
		
		int sum = manualSightSeeingQuotationVO.getAdults() + manualSightSeeingQuotationVO.getChildren();
		if(sum<=0) {
			errors.rejectValue("adults", "paxcount.error");
		}
		
		if(manualSightSeeingQuotationVO.isSavedSightSeeing()) {
			if(manualSightSeeingQuotationVO.getSightSeeingId()==0) {
				errors.rejectValue("sightSeeingName", "invalid.sightseeing");
			}
			else {
				try {
					Udn_SightSeeing_Master_Entity sightSeeingEntity = sightSeeingService.find_SightSeeing_Entity_ById(manualSightSeeingQuotationVO.getSightSeeingId());
					if(!sightSeeingEntity.getSightSeeingName().trim().equalsIgnoreCase(manualSightSeeingQuotationVO.getSightSeeingName())) {
						errors.rejectValue("sightSeeingName", "invalid.sightseeing");
					}
					
				} catch (RecordNotFoundException e) {
					
					// TODO Auto-generated catch block
					errors.rejectValue("sightSeeingName", "invalid.sightseeing");
					e.printStackTrace();
				}
				
			}
		}
		
		/*	
		if(manualHotelQuotationVO.getHotelId()==0) {
			errors.rejectValue("hotelName", "invalid.hotel.name");
		}
		
		if(manualHotelQuotationVO.getCheckInDate().compareTo(manualHotelQuotationVO.getCheckOutDate())>0) {
			errors.rejectValue("checkInDate", "invalid.checkoutdate.earlier");
		}
		
		int sum = manualHotelQuotationVO.getAdults() + manualHotelQuotationVO.getChildren();
		if(sum<=0) {
			errors.rejectValue("adults", "paxcount.error");
		}
	
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
			if(manualFlightQuotationVO.getNoOfStops()<quotationService.countFlightStopsByManualFlightQuoationId(manualFlightQuotationVO.getManualFlightQuotationId())) {
				errors.rejectValue("noOfStops", "invalid.less.stops");
			}
		}
		*/
	
	}
 
}