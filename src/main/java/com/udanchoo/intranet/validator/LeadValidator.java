package com.udanchoo.intranet.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;




@Component
public class LeadValidator implements Validator {
	 
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
		TgLeadsRecorderVO leadRecorderVO = (TgLeadsRecorderVO)target;
		if(!commonService.existsByDestinationIdAndCityName(leadRecorderVO.getSource(), leadRecorderVO.getSourceName())) {
			errors.rejectValue("sourceName", "city.error");
		}
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
				leadRecorderVO.isInsurance() ||leadRecorderVO.isLandPackage() 
					||leadRecorderVO.isSightseeing()||leadRecorderVO.isTransfers()||leadRecorderVO.isVisa())) {
			errors.rejectValue("minOneserviceError", "min.one.service.error");
		}
		
		if(leadRecorderVO.getTravelEndDate().compareTo(leadRecorderVO.getTravelStartDate()) <0) {
			errors.rejectValue("travelEndDate", "travel.start.end.error");
		}
		
	}
 
}