package com.udanchoo.intranet.validator;

import java.util.regex.Pattern;

import javax.validation.constraints.Size;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.udanchoo.intranet.entity.RoleEntity;
import com.udanchoo.intranet.entity.UdnTeam;
import com.udanchoo.intranet.model.RoleObj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;


@Component
public class PasswordValidator implements Validator {
    @Autowired
    private UserDetailsServiceImpl userService;
    
    @Autowired
	private PasswordEncoder passwordEncoder;

    @Override
    public boolean supports(Class<?> aClass) {
        return com.udanchoo.intranet.model.UserDetailsObj.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
      	String username;
      	if (principal instanceof UserDetails) {
      	   username = ((UserDetails)principal).getUsername();
      	} else {
      	   username = principal.toString();
      	}
    	//UserDetailsObj orgObj = (UserDetailsObj) userService.loadUserByUsername(username);
    	UdnTeam orgObj = userService.findUserByUserName(username).get();
    	
    	UserDetailsObj user = (UserDetailsObj) o;
        
    	/*if (!orgObj.getPassword().trim().equals(passwordEncoder.encode(user.getCurrentPassword().trim()))) {
    		errors.rejectValue("currentPassword", "valid.currentPasswordInvalid","Invalid Current Password");
    	}*/
    	if (!passwordEncoder.matches(user.getCurrentPassword().trim(), orgObj.getPassword())) {
    		errors.rejectValue("currentPassword", "valid.currentPasswordInvalid","Invalid Current Password");
    	}
    	if (!user.getChangedPassword().equals(user.getPasswordConfirm())) {
    		errors.rejectValue("changedPassword", "valid.passwordConfDiff","Invalid Changed Password");
    	}
    	System.out.println("Original Password is " + orgObj.getPassword());
    	System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
        System.out.println("Typed Current Password is " + user.getCurrentPassword());
        System.out.println("Encrupted Current Password is " + passwordEncoder.encode(user.getCurrentPassword()));
        
        System.out.println("******************************************************");
        System.out.println("Typed new Password is " + user.getChangedPassword());
        System.out.println("Encrypted new Password is " + passwordEncoder.encode(user.getChangedPassword()));
        
        
        
        /*if (((user.getCurrentPassword()!=null)) && (user.getPasswordConfirm()!=null) && (user.getChangedPassword()!=null)) {
        	ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "valid.password");
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "passwordConfirm", "valid.passwordConf");
            ValidationUtils.rejectIfEmptyOrWhitespace(errors, "passwordConfirm", "valid.passwordConf");
            
        	if (!user.getPassword().equals(user.getPasswordConfirm())) {
        		errors.rejectValue("passwordConfirm", "valid.passwordConfDiff");
        	}
        }*/
        
     
    }
    
  
}