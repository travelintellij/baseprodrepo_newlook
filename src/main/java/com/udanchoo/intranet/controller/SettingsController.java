package com.udanchoo.intranet.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.validation.Valid;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Validator;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.x.protobuf.MysqlxCrud.Collection;
import com.udanchoo.intranet.entity.RoleEntity;
import com.udanchoo.intranet.entity.UdnTeam;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.ClientObj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.validator.PasswordValidator;


@Controller
public class SettingsController {
	
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
    private PasswordValidator validator;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
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
	    
	@RequestMapping("view_form_my_profile")
   	public ModelAndView view_form_my_profile() {
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	String username;
    	if (principal instanceof UserDetails) {
    	   username = ((UserDetails)principal).getUsername();
    	} else {
    	   username = principal.toString();
    	}
     	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
    	ModelAndView modelView = new ModelAndView("admin/settings/view_myprofile");
    	modelView.addObject("USER_OBJ",userObj);
    	return modelView;
    }

	@RequestMapping("view_form_change_password")
   	public ModelAndView view_form_change_password(@ModelAttribute("USER_OBJ") UserDetailsObj userDetailsObj) {
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	String username;
    	if (principal instanceof UserDetails) {
    	   username = ((UserDetails)principal).getUsername();
    	} else {
    	   username = principal.toString();
    	}
     	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
    	ModelAndView modelView = new ModelAndView("admin/settings/view_changepassword");
    	modelView.addObject("USER_OBJ",userObj);
    	return modelView;
    }


	@RequestMapping("update_update_password")
   	public ModelAndView update_update_password(@ModelAttribute("USER_OBJ") UserDetailsObj userDetailsObj, BindingResult result,ModelMap model) {
		ModelAndView modelView = new ModelAndView("admin/settings/view_changepassword");
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	String username;
    	if (principal instanceof UserDetails) {
    	   username = ((UserDetails)principal).getUsername();
    	} else {
    	   username = principal.toString();
    	}
    	validator.validate(userDetailsObj, result);
    	try {
	    	if(result.hasErrors()) {
	    		modelView.addObject("Error","Error: While updating password. ");
	    	}else {
	         	UdnTeam userEntity = userDetailsService.findUserByID(getLoggedInUser().getUserId());
	         	//userEntity.setPassword(userDetailsObj.getPasswordConfirm());
	         	userEntity.setPassword(passwordEncoder.encode(userDetailsObj.getChangedPassword().trim()));
	         	userDetailsService.createOrUpdateUser(userEntity);
	    		modelView.addObject("Success","Your password is updated Successfully!!");
	    	}
    	}
    	catch(RecordNotFoundException rnfe) {
    		rnfe.printStackTrace();
    	}
     	//UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
    	return modelView;
    }

	
	@RequestMapping("view_form_manage_permissions")
   	public ModelAndView view_form_manage_permissions(@ModelAttribute("USER_OBJ") UserDetailsObj userDetailsObj, BindingResult result) {
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	String username;
    	if (principal instanceof UserDetails) {
    	   username = ((UserDetails)principal).getUsername();
    	} else {
    	   username = principal.toString();
    	}
     	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
    	ModelAndView modelView = new ModelAndView("admin/settings/view_user_permissions");
    	
    	Map<String, List<RoleEntity>> roleEntityMap= userDetailsService.find_All_Roles();
    	List<UserDetailsObj> userList = userDetailsService.findAllActiveUsers();
    	
    	modelView.addObject("ROLE_OBJ",roleEntityMap);
    	System.out.println("Active Users List is " + userList);
    	modelView.addObject("ACTIVE_USERS_LIST",userList);
    	
    	return modelView;
    }

	
	@RequestMapping("update_update_user_permissions")
   	public ModelAndView update_update_user_permissions(@ModelAttribute("USER_OBJ") UserDetailsObj userDetailsObj, BindingResult result) {
		ModelAndView modelView = view_form_manage_permissions(userDetailsObj,result);
		try {
			userDetailsService.updateUserPermissions(userDetailsObj);
			modelView.addObject("Success", "Permission Records are updated successfully.");
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			modelView.addObject("Error", "Error: while updating permissions. Please contact support.");
		}
		/*List<RoleEntity> intersectElements = existingTargetRoles.stream()
				.filter(rolesToUpdate :: contains)
				.collect(Collectors.toList());
		*/
	
		
	
		return modelView;
    }

	
}
