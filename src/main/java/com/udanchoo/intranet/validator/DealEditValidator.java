package com.udanchoo.intranet.validator;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.StringTokenizer;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.entity.Udn_Deal_Services_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.EmailMessageVO;
import com.udanchoo.intranet.model.Udn_Deals_Recorder_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.service.DealServiceImpl;
import com.udanchoo.intranet.service.DealServiceLineImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;




@Component
public class DealEditValidator implements Validator {
	 
	@Autowired
	DealServiceImpl dealService;

	@Autowired
	DealServiceLineImpl dealServiceLine;
	
	
	@Autowired
	UserDetailsServiceImpl userDetailsService;
		
	@Override
	public boolean supports(Class<?> clazz) {
		return com.udanchoo.intranet.model.Udn_Deals_Recorder_Obj.class.equals(clazz);	}

	@Override
	public void validate(Object target, Errors errors) {
		
    	UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}

		
		Udn_Deals_Recorder_Obj updatedDealVo = (Udn_Deals_Recorder_Obj)target;
		
		try {
			Udn_Deals_Recorder_Obj dealRecorderObj = dealService.findDealEntityById(updatedDealVo.getDealConfirmationId(),userObj.getUserId(),isAdmin);
			//System.out.println("Updated Deals Record Vo is " + dealRecorderObj.getServiceWorkLoadList());
			
			  for (int i=0;i<dealRecorderObj.getServiceList().length;i++) {
				  if(!Arrays.asList(updatedDealVo.getServiceList()).contains(dealRecorderObj.getServiceList()[i])) {
					  if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_FLT_CODE)) {
						  Udn_Deal_Services_Entity serviceMapEntity =  dealServiceLine.find_Service_Map_Deal(updatedDealVo.getDealConfirmationId(), UdanChooConstants.WORKLOAD_FLT_CODE, getLoggedInUser().getUserId(),isAdmin);
						  boolean flightSLExists = dealServiceLine.check_FLT_SL_Existance_By_ServiceMapID(serviceMapEntity.getServiceMapId());
						  if(flightSLExists) {
							  errors.reject("FLT_SL_EXSTS", "Error: Flight Service Line record/s exists. " );
						  }
						  //System.out.println("Flight Service Line existance is " + flightSLExists);
					  }
					  else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_HTL_CODE)) {
						  Udn_Deal_Services_Entity serviceMapEntity =  dealServiceLine.find_Service_Map_Deal(updatedDealVo.getDealConfirmationId(), UdanChooConstants.WORKLOAD_HTL_CODE, getLoggedInUser().getUserId(),isAdmin);
						  boolean hotelSLExists = dealServiceLine.check_HTL_SL_Existance_By_ServiceMapID(serviceMapEntity.getServiceMapId());
						  if(hotelSLExists) {
							  errors.reject("HTL_SL_EXSTS", "Error: Hotel Service Line record/s exists. " );
						  }
						  //System.out.println("Hotel Service Line existance is " + hotelSLExists);

					  }
					  else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_INS_CODE)) {
						  Udn_Deal_Services_Entity serviceMapEntity =  dealServiceLine.find_Service_Map_Deal(updatedDealVo.getDealConfirmationId(), UdanChooConstants.WORKLOAD_INS_CODE, getLoggedInUser().getUserId(),isAdmin);
						  boolean insuranceSLExists = dealServiceLine.check_INS_SL_Existance_By_ServiceMapID(serviceMapEntity.getServiceMapId());
						  if(insuranceSLExists) {
							  errors.reject("INS_SL_EXSTS", "Error: Insurance Service Line record/s exists. " );
						  }

					  }
					  else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_LDP_CODE)) {
						  Udn_Deal_Services_Entity serviceMapEntity =  dealServiceLine.find_Service_Map_Deal(updatedDealVo.getDealConfirmationId(), UdanChooConstants.WORKLOAD_LDP_CODE, getLoggedInUser().getUserId(),isAdmin);
						  boolean landPackageSLExists = dealServiceLine.check_LDP_SL_Existance_By_ServiceMapID(serviceMapEntity.getServiceMapId());
						  if(landPackageSLExists) {
							  errors.reject("LDP_SL_EXSTS", "Error: Land Package Service Line record/s exists. " );
						  }

					  }
					  else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_OTH_CODE)) {
						  Udn_Deal_Services_Entity serviceMapEntity =  dealServiceLine.find_Service_Map_Deal(updatedDealVo.getDealConfirmationId(), UdanChooConstants.WORKLOAD_OTH_CODE, getLoggedInUser().getUserId(),isAdmin);
						  boolean othersSLExists = dealServiceLine.check_OTH_SL_Existance_By_ServiceMapID(serviceMapEntity.getServiceMapId());
						  if(othersSLExists) {
							  errors.reject("OTH_SL_EXSTS", "Error: Others Service Line record/s exists. " );
						  }
					  }
					  else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_STS_CODE)) {
						  Udn_Deal_Services_Entity serviceMapEntity =  dealServiceLine.find_Service_Map_Deal(updatedDealVo.getDealConfirmationId(), UdanChooConstants.WORKLOAD_STS_CODE, getLoggedInUser().getUserId(),isAdmin);
						  boolean stsSLExists = dealServiceLine.check_STS_SL_Existance_By_ServiceMapID(serviceMapEntity.getServiceMapId());
						  if(stsSLExists) {
							  errors.reject("STS_SL_EXSTS", "Error: Sight Seeings Service Line record/s exists. " );
						  }

					  }
					  else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_TRN_CODE)) {
						  Udn_Deal_Services_Entity serviceMapEntity =  dealServiceLine.find_Service_Map_Deal(updatedDealVo.getDealConfirmationId(), UdanChooConstants.WORKLOAD_TRN_CODE, getLoggedInUser().getUserId(),isAdmin);
						  boolean transfersSLExists = dealServiceLine.check_TRN_SL_Existance_By_ServiceMapID(serviceMapEntity.getServiceMapId());
						  if(transfersSLExists) {
							  errors.reject("TRN_SL_EXSTS", "Error: Transfers Service Line record/s exists. " );
						  }


					  }
					  else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_VSA_CODE)) {
						  Udn_Deal_Services_Entity serviceMapEntity =  dealServiceLine.find_Service_Map_Deal(updatedDealVo.getDealConfirmationId(), UdanChooConstants.WORKLOAD_VSA_CODE, getLoggedInUser().getUserId(),isAdmin);
						  boolean visaSLExists = dealServiceLine.check_VSA_SL_Existance_By_ServiceMapID(serviceMapEntity.getServiceMapId());
						  if(visaSLExists) {
							  errors.reject("VSA_SL_EXSTS", "Error: Visa Service Line record/s exists. " );
						  }

					  }
				  }
			  }
		
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//errors.rejectValue("emailToList", "invalid.emailToList");
	
	}
 
	 	private UserDetailsObj getLoggedInUser() {
	    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	    	String username;
	    	if (principal instanceof UserDetails) {
	    	   username = ((UserDetails)principal).getUsername();
	    	} else {
	    	   username = principal.toString();
	    	}
	     	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
	     	
	     	return userObj;
	    }
}