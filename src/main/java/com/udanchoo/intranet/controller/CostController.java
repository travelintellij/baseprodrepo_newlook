package com.udanchoo.intranet.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.udanchoo.intranet.entity.Udn_Deal_Expense_Recorder_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.FlightServiceLineVO;
import com.udanchoo.intranet.model.Udn_Deal_Expense_Recorder_Obj;
import com.udanchoo.intranet.model.Udn_Deals_Recorder_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.repository.Deal_Expense_Recorder_Repository;
import com.udanchoo.intranet.repository.Deal_FLT_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_HTL_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_INS_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_LDP_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_OTH_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_STS_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_TRN_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_VSA_ServiceLine_Repository;
import com.udanchoo.intranet.service.DealServiceImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;




@Controller
public class CostController {
	 
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
	DealServiceImpl dealService;
	
	@Autowired
	Deal_FLT_ServiceLine_Repository fltRepository;
	
	@Autowired
	Deal_HTL_ServiceLine_Repository htlRepository;
	
	@Autowired
	Deal_LDP_ServiceLine_Repository ldpRepository;
	
	@Autowired
	Deal_INS_ServiceLine_Repository insRepository;
	
	@Autowired
	Deal_STS_ServiceLine_Repository stsRepository;
	
	@Autowired
	Deal_OTH_ServiceLine_Repository othRepository;
	
	@Autowired
	Deal_TRN_ServiceLine_Repository trnRepository;
	

	@Autowired
	Deal_VSA_ServiceLine_Repository vsaRepository;
	
	@Autowired
	Deal_Expense_Recorder_Repository dealExpenseRepository;
	
	
	
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
	
	 //@RequestMapping("/workload/view_workload_costmanagement")
	 @RequestMapping("/view_workload_costmanagement")
	 public ModelAndView view_workload_costmanagement(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("workloadCostRecorder") Udn_Deals_Recorder_Obj dealRecorder,  BindingResult result) {
		UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}

		ModelAndView mapview = new ModelAndView(); 
		mapview.setViewName("workload/form_workload_cost_management");
    	mapview.addObject("Id", userObj.getUserId());
    	//mapview.addObject("userRole", userObj.getRoles());
    	mapview.addObject("dealConfirmationId", dealConfirmationId);

    	Udn_Deals_Recorder_Obj dealRecorderObj = null;
		try {
			dealRecorderObj = dealService.findDealEntityById(dealConfirmationId,userObj.getUserId(),isAdmin);
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mapview.addObject("DealObject", dealRecorderObj);
    	
		Map<String, Float> sumServiceLineCost = new HashMap<String, Float>();
		for(int i=0;i<dealRecorderObj.getServiceList().length;i++) {
			//System.out.println("Service Name is " + dealRecorderObj.getServiceList()[i]);
			if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_FLT_CODE)) {
				Float totalFLTCost =  fltRepository.sum_FLT_SL_Cost_By_DealId(dealConfirmationId);
				if(totalFLTCost==null) {
					totalFLTCost = (float) 0;
				}
				sumServiceLineCost.put(UdanChooConstants.WORKLOAD_FLT_CODE, totalFLTCost);
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_HTL_CODE)) {
				Float totalHTLCost =  htlRepository.sum_HTL_SL_Cost_By_DealId(dealConfirmationId);
				if(totalHTLCost==null) {
					totalHTLCost = (float) 0;
				}
				sumServiceLineCost.put(UdanChooConstants.WORKLOAD_HTL_CODE, totalHTLCost);
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_INS_CODE)) {
				Float totalINSCost =  insRepository.sum_INS_SL_Cost_By_DealId(dealConfirmationId);
				if(totalINSCost==null) {
					totalINSCost = (float) 0;
				}
				sumServiceLineCost.put(UdanChooConstants.WORKLOAD_INS_CODE, totalINSCost);
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_LDP_CODE)) {
				Float totalLDPCost =  ldpRepository.sum_LDP_SL_Cost_By_DealId(dealConfirmationId);
				if(totalLDPCost==null) {
					totalLDPCost = (float) 0;
				}
				sumServiceLineCost.put(UdanChooConstants.WORKLOAD_LDP_CODE, totalLDPCost);
			
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_OTH_CODE)) {
				Float totalOTHCost =  othRepository.sum_OTH_SL_Cost_By_DealId(dealConfirmationId);
				if(totalOTHCost==null) {
					totalOTHCost = (float) 0;
				}
				sumServiceLineCost.put(UdanChooConstants.WORKLOAD_OTH_CODE, totalOTHCost);
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_STS_CODE)) {
				Float totalSTSCost =  stsRepository.sum_STS_SL_Cost_By_DealId(dealConfirmationId);
				if(totalSTSCost==null) {
					totalSTSCost = (float) 0;
				}
				sumServiceLineCost.put(UdanChooConstants.WORKLOAD_STS_CODE, totalSTSCost);
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_TRN_CODE)) {
				Float totalTRNCost =  trnRepository.sum_TRN_SL_Cost_By_DealId(dealConfirmationId);
				if(totalTRNCost==null) {
					totalTRNCost = (float) 0;
				}
				sumServiceLineCost.put(UdanChooConstants.WORKLOAD_TRN_CODE, totalTRNCost);
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_VSA_CODE)) {
				Float totalVSACost =  vsaRepository.sum_VSA_SL_Cost_By_DealId(dealConfirmationId);
				if(totalVSACost==null) {
					totalVSACost = (float) 0;
				}
				sumServiceLineCost.put(UdanChooConstants.WORKLOAD_VSA_CODE, totalVSACost);
			}
		}
		mapview.addObject("MAP_SERVICE_LINE_COST_SUM",sumServiceLineCost);
		
		List<Udn_Deal_Expense_Recorder_Entity> expenseEntityList = dealExpenseRepository.find_Expenses_By_DealId(dealConfirmationId);
		ArrayList expensesVoList = convertExpenseVO(expenseEntityList);
		mapview.addObject("ADDITIONAL_EXPENSES_LIST",expensesVoList);
		return mapview;
	 }
	 
	 private ArrayList<Udn_Deal_Expense_Recorder_Obj> convertExpenseVO(List<Udn_Deal_Expense_Recorder_Entity> expenseEntityList) {
		 ArrayList<Udn_Deal_Expense_Recorder_Obj> expenseVo = new ArrayList<Udn_Deal_Expense_Recorder_Obj>();
		 Iterator<Udn_Deal_Expense_Recorder_Entity> itrExpenseEntity = expenseEntityList.iterator();
		 while(itrExpenseEntity.hasNext()) {
			 Udn_Deal_Expense_Recorder_Obj expenseObj = new Udn_Deal_Expense_Recorder_Obj((Udn_Deal_Expense_Recorder_Entity) itrExpenseEntity.next());
			 expenseVo.add(expenseObj);
		 }
		 return expenseVo;
		 
	 }
	 
	  //@PostMapping(value="/workload/add_additional_expense_deal")
	 @PostMapping(value="/add_additional_expense_deal")
	    public ModelAndView add_additional_expense_deal(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("Additon_Exp_obj") Udn_Deal_Expense_Recorder_Obj expenseObj,  BindingResult result) {
	    	ModelAndView mapview = new ModelAndView();
			Udn_Deal_Expense_Recorder_Entity expenseEntity = new Udn_Deal_Expense_Recorder_Entity(expenseObj); 
			dealExpenseRepository.save(expenseEntity);
			mapview.addObject("Success", "Additional Expense Record is updated Successfully. !!");
	    	mapview.setViewName("forward:view_workload_costmanagement");
	    	
	    	return mapview;
	    }
	   
	  //@RequestMapping("/workload/delete_additional_deal_expense")
	 @RequestMapping("/delete_additional_deal_expense")
	   	public ModelAndView delete_additional_deal_expense(@RequestParam(value = "expenseId") long expenseId,@RequestParam("dealConfirmationId") long dealConfirmationId) throws RecordNotFoundException
	   	{
	    	UserDetailsObj userObj = getLoggedInUser();
	    	ModelAndView modelView = new ModelAndView();
	    	boolean isSuccess = false;
	    	try {
	    		dealExpenseRepository.deleteById(expenseId);
	    		isSuccess=true;
			} catch (Exception e) {
				isSuccess = false;
			}
	    	if(isSuccess) {
	    		modelView.addObject("Success", "Additional Expense Record is DELETED Successfully. !!");
	    	}
	    	else {
	    		modelView.addObject("Error", "Additional Expense Record Updation Failed !! Please Contact Administrator. ");	
	    	}
	    	modelView.setViewName("forward:view_workload_costmanagement");
	       	return modelView;
	   	}
	 
}

