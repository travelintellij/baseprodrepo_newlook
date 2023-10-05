package com.udanchoo.intranet.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.entity.quotation.Tg_Quotation_Recorder_Entity;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.model.quotation.TgQuotationRecorderVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.QuotationServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;




@Component
public class QuotationEditValidator implements Validator {
	
	@Autowired
	QuotationServiceImpl quotationService;
	
	
	@Override
	public boolean supports(Class<?> clazz) {
		return com.udanchoo.intranet.model.EmailMessageVO.class.equals(clazz);	}

	//following code validates if the country code (String) matches with the country name.
	@Override
	public void validate(Object target, Errors errors) {
		TgQuotationRecorderVO qtnRecorderObj = (TgQuotationRecorderVO)target;
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(qtnRecorderObj.getQuotationId());
		if(qtnRecorderObj.isFlight()==false) {
			if(quotationEntity.getManualQuotationsList().size()>0) {
				errors.rejectValue("flight", "flight.not.empty");
			}
		}
		if(qtnRecorderObj.isHotel()==false) {
			if(quotationEntity.getHotelQuotationsList().size()>0) {
				errors.rejectValue("hotel", "hotel.not.empty");
			}
		}
		if(qtnRecorderObj.isInsurance()==false) {
			if(quotationEntity.getInsuranceQuotationsList().size()>0) {
				errors.rejectValue("insurance", "insurance.not.empty");
			}
		}
		if(qtnRecorderObj.isOthers()==false) {
			if(quotationEntity.getOtherQuotationsList().size()>0) {
				errors.rejectValue("others", "others.not.empty");
			}
		}
		if(qtnRecorderObj.isSightseeing()==false) {
			if(quotationEntity.getSightSeeingQuotationList().size()>0) {
				errors.rejectValue("sightseeing", "sightseeing.not.empty");
			}
		}
		if(qtnRecorderObj.isTourPackage()==false) {
			if(quotationEntity.getPackageQuotationsList().size()>0) {
				errors.rejectValue("tourPackage", "tourpackage.not.empty");
			}
		}
		if(qtnRecorderObj.isTransfers()==false) {
			if(quotationEntity.getTransferQuotationList().size()>0) {
				errors.rejectValue("transfers", "transfers.not.empty");
			}
		}
		if(qtnRecorderObj.isVisa()==false) {
			if(quotationEntity.getVisaQuotationList().size()>0) {
				errors.rejectValue("visa", "visa.not.empty");
			}
		}
		if(qtnRecorderObj.isCruise()==false) {
			if(quotationEntity.getCruiseQuotationsList().size()>0) {
				errors.rejectValue("cruise", "cruise.not.empty");
			}
		}
	}
 
}