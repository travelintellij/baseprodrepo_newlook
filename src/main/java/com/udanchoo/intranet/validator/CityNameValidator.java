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
import com.udanchoo.intranet.service.DealServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;




@Component
public class CityNameValidator implements Validator {
	 
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Override
	public boolean supports(Class<?> clazz) {
		return com.udanchoo.intranet.model.EmailMessageVO.class.equals(clazz);	}

	//following code validates if the country code (String) matches with the country name.
	@Override
	public void validate(Object target, Errors errors) {
		Udn_Destinations_Master_Obj destinationVO = (Udn_Destinations_Master_Obj)target;
		if(!commonService.existsByDestinationIdAndCityName(destinationVO.getDestinationId(), destinationVO.getCityName())) {
			errors.rejectValue("cityName", "city.error");
		}
		
	}
 
}