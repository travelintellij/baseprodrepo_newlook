package com.udanchoo.intranet.validator;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.Udn_Deals_Recorder_Obj;
import com.udanchoo.intranet.model.Udn_Ticket_Recorder_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.DealServiceImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;




@Component
public class TicketValidator implements Validator {
	 
	@Autowired
	DealServiceImpl dealService;

	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
	ClientServiceImpl clientService;
				
	@Override
	public boolean supports(Class<?> clazz) {
		return Udn_Ticket_Recorder_Obj.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {

		UserDetailsObj userObj = getLoggedInUser();
		boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}

		Udn_Ticket_Recorder_Obj ticketVO = (Udn_Ticket_Recorder_Obj)target;

				
		/*if((ticketVO.getDealName()==null) || (ticketVO.getDealName().trim().length()==0) && (ticketVO.getDealConfirmationId()!=0)) {
			errors.reject("dealName", "invalid.dealName" );
		}
		else if (ticketVO.getDealConfirmationId()==null || ticketVO.getDealConfirmationId()==0) {
			errors.reject("dealName", "invalid.dealName" );
		}
		else {*/
			try {
				boolean clientExists =false ;
				if(ticketVO.getClientName()==null || ticketVO.getClientName().trim().length()==0) {
					ticketVO.setClientId(0);
				}
				
				if((ticketVO.getClientName()!=null) && (ticketVO.getClientId()!=0)){
					System.out.println(ticketVO);
					clientExists =clientService.existsByClientIdAndClientName(ticketVO.getClientId(), ticketVO.getClientName()); 
					if(!clientExists) {
						errors.rejectValue("clientName", "invalid.clientName" );
					}
				}
				if(StringUtils.isNumeric(ticketVO.getDealName()) && (ticketVO.getDealConfirmationId()!=0) && (!clientExists)){
					Udn_Deals_Recorder_Obj dealEntity = dealService.findDealEntityById(Long.parseLong(ticketVO.getDealName()),userObj.getUserId(),isAdmin);
					ticketVO.setClientId(dealEntity.getClientId());
				}
			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				errors.rejectValue("dealName", "invalid.dealName" );
				e.printStackTrace();
			}	
		//}
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