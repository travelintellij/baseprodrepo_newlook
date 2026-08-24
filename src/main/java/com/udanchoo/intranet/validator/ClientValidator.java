package com.udanchoo.intranet.validator;

import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.model.ClientObj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.repository.ClientRepository;


@Component
public class ClientValidator implements Validator {
    
	@Autowired
	private ClientRepository clientRepository;

    @Override
    public boolean supports(Class<?> aClass) {
        return com.udanchoo.intranet.model.ClientObj.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
    	ClientObj clientObj = (ClientObj) o;
    	
    	if(clientObj.getEmail()!=null && clientObj.getEmail().trim().length()>0) {
         	//ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
         	if(!isEmailValid(clientObj.getEmail())) {
         		errors.rejectValue("email", "email.error");
         	}
         }
    	if(clientObj.getCityName()==null || clientObj.getCityName().trim().length()==0) {
    		clientObj.setCityId("0");
    	}
    	if(clientObj.getCountryName()==null || clientObj.getCountryName().trim().length()==0) {
    		clientObj.setCountryId("0");
    	}
    	
    	// Mobile Validation & Duplicate Mobile Number Check
    	Long mobileObj = clientObj.getMobile();
    	if (mobileObj == null || mobileObj <= 0) {
    		errors.rejectValue("mobile", "mobile.required", "Client mobile number is required!");
    	} else {
    		long mobile = mobileObj;
    		Long clientIdObj = clientObj.getClientId();
    		boolean isDuplicate = false;
    		if (clientIdObj == null || clientIdObj <= 0L) {
    			isDuplicate = clientRepository.existsByMobile(mobile);
    		} else {
    			isDuplicate = clientRepository.existsByMobileAndClientIdNot(mobile, clientIdObj);
    		}
    		if (isDuplicate) {
    			errors.rejectValue("mobile", "mobile.duplicate", "Mobile number (" + mobile + ") already exists in the system!");
    		}
    	}
    	
        /*
        if (((user.getPassword()!=null)) && (user.getPasswordConfirm()!=null)) {
        	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "valid.password");
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "passwordConfirm", "valid.passwordConf");
            
        	if (!user.getPassword().equals(user.getPasswordConfirm())) {
        		errors.rejectValue("passwordConfirm", "valid.passwordConfDiff");
        	}
        }
        
      
        if(user.getUsername()!=null) {
        	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmpty");
        	if (user.getUsername().length() < 5 || user.getUsername().length() > 100) {
        		errors.rejectValue("username", "Size.userForm.username");
        	}
        }
       
        if(user.getName()!=null) {
        	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty");
        	if (user.getName().length() < 5 || user.getName().length() > 100) {
        		errors.rejectValue("name", "name.error");
        	}
        }
        
        if(user.getAddress()!=null) {
        	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "NotEmpty");
        	if (user.getAddress().length() < 15 || user.getAddress().length() > 200) {
        		errors.rejectValue("address", "address.error");
        	}
        }
        
        
        if(user.getShift()!=null) {
        	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "shift", "NotEmpty");
        	if (user.getShift().length() < 3 || user.getShift().length() > 10) {
        		errors.rejectValue("shift", "shift.error");
        	}
        }
        
        if(user.getDesignation()!=null) {
        	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "designation", "NotEmpty");
        	if (user.getDesignation().length() < 5 || user.getDesignation().length() > 50) {
        		errors.rejectValue("designation", "designation.error");
        	}
        }
        
        if(user.getEmail()!=null) {
        	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty");
        	if(!isEmailValid(user.getEmail())) {
        		errors.rejectValue("email", "email.error");
        	}
        }
        
        try {
        	if(user.getMobile()==0) {
        		errors.rejectValue("mobile", "mobile.info");
        	}
        	else {
        	String mobile = String.valueOf(user.getMobile());
    			if (mobile.length() < 10 || mobile.length() > 13) {
    				errors.rejectValue("mobile", "mobile.error");
    			}
        	}
        }
        catch(NumberFormatException ne) {
        	errors.rejectValue("mobile", "mobile.numeric.error");
        }
       
        
        
        if(user.getDob()!=null) {
        	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dob", "dob.error");
        	
        }
        if(user.getDoj()!=null) {
        	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "doj", "doj.error");
        	
        }
        
        */
        /*
        if (userService.loadUserByUsername(user.getUsername()) != null) {
            errors.rejectValue("username", "Duplicate.userForm.username");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty");
        if (user.getPassword().length() < 8 || user.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        if (!user.getPasswordConfirm().equals(user.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
        }*/
    }
    
    public static boolean isEmailValid(String email) 
    { 
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+ 
                            "[a-zA-Z0-9_+&*-]+)*@" + 
                            "(?:[a-zA-Z0-9-]+\\.)+[a-z" + 
                            "A-Z]{2,7}$"; 
                              
        Pattern pat = Pattern.compile(emailRegex); 
        if (email == null) 
            return false; 
        return pat.matcher(email).matches(); 
    } 
}