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
import com.udanchoo.intranet.model.supplier.TgSupplierMasterVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.DealServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;




@Component
public class SupplierValidator implements Validator {
	 
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
		TgSupplierMasterVO supplierRecorderVO = (TgSupplierMasterVO)target;
		System.out.println("City id is " + supplierRecorderVO.getCityId());
		System.out.println("City Name is " + supplierRecorderVO.getCityName());
		if(!commonService.existsByDestinationIdAndCityName(supplierRecorderVO.getCityId(), supplierRecorderVO.getCityName())) {
			errors.rejectValue("cityName", "city.error");
		}
		if(!commonService.existsByDestinationIdAndCityName(supplierRecorderVO.getCountryId(), supplierRecorderVO.getCountryName())) {
			errors.rejectValue("countryName", "country.error");
		}
		if(!(supplierRecorderVO.isFlight() || supplierRecorderVO.isHotel()|| supplierRecorderVO.isCruise() ||
				supplierRecorderVO.isInsurance() ||supplierRecorderVO.isLandPackage()  
					||supplierRecorderVO.isSightseeing()||supplierRecorderVO.isTransfers()||supplierRecorderVO.isVisa())) {
			errors.rejectValue("minOneserviceError", "min.one.service.error");
		}
		if(supplierRecorderVO.getOperatingDestinations().size()==0) {
			errors.rejectValue("destinationNames", "min.one.service.dest.error");
		}
		
	}
 
}