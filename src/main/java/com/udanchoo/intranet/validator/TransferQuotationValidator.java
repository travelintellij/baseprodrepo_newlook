package com.udanchoo.intranet.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.model.quotation.ManualHotelQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualTransferQuotationVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.HotelServiceImpl;
import com.udanchoo.intranet.service.QuotationServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;




@Component
public class TransferQuotationValidator implements Validator {
	 
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
		return com.udanchoo.intranet.model.quotation.ManualTransferQuotationVO.class.equals(clazz);	}

	//following code validates if the country code (String) matches with the country name.
	@Override
	public void validate(Object target, Errors errors) {
		ManualTransferQuotationVO manualTransferQuotationVO = (ManualTransferQuotationVO)target;
		if(!commonService.existsByDestinationIdAndCityName(manualTransferQuotationVO.getPickUpCityId(),manualTransferQuotationVO.getPickUpCityName())) {
			errors.rejectValue("pickUpCityName", "city.error");
		}
		
		if(!commonService.existsByDestinationIdAndCityName(manualTransferQuotationVO.getDropToCityId(),manualTransferQuotationVO.getDropToCityName())) {
			errors.rejectValue("dropToCityName", "city.error");
		}
		
		int sum = manualTransferQuotationVO.getAdults() + manualTransferQuotationVO.getChildren();
		if(sum<=0) {
			errors.rejectValue("adults", "paxcount.error");
		}
	
	}
 
}