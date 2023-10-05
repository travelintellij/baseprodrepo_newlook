package com.udanchoo.intranet.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.model.Udn_Destinations_Master_Obj;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.util.UdanChooConstants;




@Component
public class CityManagementValidator implements Validator {
	 
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return com.udanchoo.intranet.model.Udn_Destinations_Master_Obj.class.equals(clazz);	}

	//following code validates if the country code (String) matches with the country name.
	@Override
	public void validate(Object target, Errors errors) {
		Udn_Destinations_Master_Obj destinationVO = (Udn_Destinations_Master_Obj)target;
		
		if(destinationVO.getCityName()==null || destinationVO.getCityName().trim().length()==0) {
			errors.rejectValue("cityName", "city.error");
		}
		if(destinationVO.getCountryCode().trim().equalsIgnoreCase(UdanChooConstants.DESTINATION_ALL_CTRY_CODE)) {
			errors.rejectValue("countryCode", "country.error");
		}
		if(commonService.existsByCityNameAndCountryCode(destinationVO.getCityName(),destinationVO.getCountryCode())) {
			errors.rejectValue("cityName", "city.error");
		}
		
	}
 
}