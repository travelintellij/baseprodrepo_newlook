package com.udanchoo.intranet.controller;


import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.udanchoo.intranet.entity.Product;
import com.udanchoo.intranet.entity.Udn_Deal_Status_Entity;
import com.udanchoo.intranet.model.DashboardLineChartObj;
import com.udanchoo.intranet.model.DashboardObj;
import com.udanchoo.intranet.model.ProductModel;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.service.DealServiceImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;




@Controller
public class DashboardController {
	 
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
	DealServiceImpl dealService;
	
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
	
	@RequestMapping("/get_deals_dashboard_data_user")
	@ResponseBody
	public List<DashboardObj> get_deals_dashboard_data_user() {
		UserDetailsObj user = getLoggedInUser();
		List dashBoardDealsList = dealService.processDealDashboardUser(user.getUserId());
		return dashBoardDealsList;
	}
	
	@RequestMapping("/get_workload_dashboard_data_user")
	@ResponseBody
	public List<DashboardLineChartObj> get_workload_dashboard_data_user() {
		UserDetailsObj user = getLoggedInUser();
		List dashBoardDealsList = dealService.processWorkloadDashboardUser(user.getUserId());
		//System.out.println("Returning object size is " + dashBoardDealsList.size());
		return dashBoardDealsList;
		
		/*ProductModel productModel = new ProductModel();
		return productModel.findAll();
		*/
	}
	
	@RequestMapping("/get_deals_dashboard_data_admin")
	@ResponseBody
	public List<DashboardObj> get_deals_dashboard_data_admin() {
		UserDetailsObj user = getLoggedInUser();
		List dashBoardDealsList = dealService.processDealDashboardAdmin();
		return dashBoardDealsList;
	}
	
	@RequestMapping("/get_workload_dashboard_data_admin")
	@ResponseBody
	public List<DashboardLineChartObj> get_workload_dashboard_data_admin() {
		UserDetailsObj user = getLoggedInUser();
		List dashBoardDealsList = dealService.processWorkloadDashboardAdmin();
		return dashBoardDealsList;
		
		/*ProductModel productModel = new ProductModel();
		return productModel.findAll();
		*/
	}
	
}

