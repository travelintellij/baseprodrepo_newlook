package com.udanchoo.intranet.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.model.quotation.ManualHotelQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualPackageQuotationVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.HotelServiceImpl;
import com.udanchoo.intranet.service.QuotationServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;




@Component
public class PackageQuotationValidator implements Validator {
	 
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
		return com.udanchoo.intranet.model.quotation.ManualPackageQuotationVO.class.equals(clazz);	}

	//following code validates if the country code (String) matches with the country name.
	@Override
	public void validate(Object target, Errors errors) {
		ManualPackageQuotationVO manualPackageQuotationVO = (ManualPackageQuotationVO)target;
		if(!commonService.existsByDestinationIdAndCityName(manualPackageQuotationVO.getCityId(),manualPackageQuotationVO.getCityName())) {
			errors.rejectValue("cityName", "city.error");
		}
		
		if(manualPackageQuotationVO.getStartDate().compareTo(manualPackageQuotationVO.getEndDate())>0) {
			errors.rejectValue("startDate", "invalid.checkoutdate.earlier");
		}
		
		int sum = manualPackageQuotationVO.getAdults() + manualPackageQuotationVO.getChildren();
		if(sum<=0) {
			errors.rejectValue("adults", "paxcount.error");
		}
	}
 
}