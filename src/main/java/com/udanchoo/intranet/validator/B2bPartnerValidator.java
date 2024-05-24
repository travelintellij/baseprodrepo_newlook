package com.udanchoo.intranet.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.multipart.MultipartFile;

import com.udanchoo.intranet.model.Tg_B2bPartner_Obj;
import com.udanchoo.intranet.service.TgB2bPartnerServicesImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;




@Component
public class B2bPartnerValidator implements Validator {
	 
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	TgB2bPartnerServicesImpl b2bPartnerService;
	
	
	//following code validates if the country code (String) matches with the country name.
	@Override
	public void validate(Object target, Errors errors) {
		Tg_B2bPartner_Obj partnerVO = (Tg_B2bPartner_Obj)target;
		System.out.println("Valid type is " + isValidImageFile(partnerVO.getLogoFile()));
		if(!isValidImageFile(partnerVO.getLogoFile())) {
			errors.rejectValue("logoFile", "logo.file.type.error");
		}
		if(partnerVO.getPartnerShortName()==null || partnerVO.getPartnerShortName().trim().length()==0) {
			errors.rejectValue("partnerShortName", "parnter.shortname.error");
		}
		if(b2bPartnerService.checkPartnerExistByShortName(partnerVO.getPartnerShortName())){
			errors.rejectValue("partnerShortName", "parnter.shortname.duplicate.error");
		}
		if(!commonService.existsByDestinationIdAndCityName(partnerVO.getCityId(), partnerVO.getCityName())) {
			errors.rejectValue("cityName", "city.error");
		}

			
		
	}
 
	
	
	
	private boolean isValidImageFile(MultipartFile file) {
        boolean isValidFile = true;
        if (file == null || file.isEmpty()) {
        	System.out.println("As per this file upload is empty");
        	return isValidFile;
        }
        	
        isValidFile = file.getContentType() != null && (file.getContentType().equals(MediaType.IMAGE_JPEG_VALUE)
                || file.getContentType().equals(MediaType.IMAGE_PNG_VALUE));
		
		System.out.println("As per this file status is " + isValidFile);
        return isValidFile;
    }


	@Override
	public boolean supports(Class<?> clazz) {
		// TODO Auto-generated method stub
		return false;
	}
}