package com.udanchoo.intranet.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.udanchoo.intranet.entity.Udn_Deal_FLT_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_HTL_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_INS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_LDP_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_OTH_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_STS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_Services_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_TRN_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_VSA_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Doc_SL_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.ClientObj;
import com.udanchoo.intranet.model.FlightServiceLineVO;
import com.udanchoo.intranet.model.HotelServiceLineVO;
import com.udanchoo.intranet.model.InsuranceServiceLineVO;
import com.udanchoo.intranet.model.LandPackageServiceLineVO;
import com.udanchoo.intranet.model.OtherServiceLineVO;
import com.udanchoo.intranet.model.SearchSightSeeingObj;
import com.udanchoo.intranet.model.SightSeeingServiceLineVO;
import com.udanchoo.intranet.model.SupplierObj;
import com.udanchoo.intranet.model.Tag;
import com.udanchoo.intranet.model.TransferServiceLineVO;
import com.udanchoo.intranet.model.UdnDealStatusVO;
import com.udanchoo.intranet.model.Udn_Deal_Services_Map_Obj;
import com.udanchoo.intranet.model.Udn_Deals_Recorder_Obj;
import com.udanchoo.intranet.model.Udn_Room_Category_Obj;
import com.udanchoo.intranet.model.Udn_Services_Master_Obj;
import com.udanchoo.intranet.model.Udn_SightSeeing_Master_Obj;
import com.udanchoo.intranet.model.Udn_Visa_Doc_SL_Obj;
import com.udanchoo.intranet.model.Udn_WL_FLT_Recorder_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.VisaServiceLineVO;
import com.udanchoo.intranet.repository.Visa_Doc_Master_Repository;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.DealServiceImpl;
import com.udanchoo.intranet.service.DealServiceLineImpl;
import com.udanchoo.intranet.service.HotelServiceImpl;
import com.udanchoo.intranet.service.SightSeeingServiceImpl;
import com.udanchoo.intranet.service.SupplierServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;


@Controller
public abstract class AbstractController {

@Autowired
UserDetailsServiceImpl userDetailsService;

@Autowired
UdnCommonServicesImpl commonService;


@Autowired
DealServiceImpl dealService;

@Autowired
DealServiceLineImpl dealServiceLine;


/*
@RequestMapping("/workload/view_workload_createNewWorkLoadForm")
	public ModelAndView view_workload_createNewWorkLoad(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("workloadRecorder") Udn_Deals_Recorder_Obj dealRecorder,  BindingResult result) {
	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	String username;
	if (principal instanceof UserDetails) {
	   username = ((UserDetails)principal).getUsername();
	} else {
	   username = principal.toString();
	}
 	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
	ModelAndView mapview = new ModelAndView("workload/form_createWokLoad");
	mapview.addObject("userName", username);
	mapview.addObject("Id", userObj.getUserId());
	//mapview.addObject("userRole", userObj.getRoles());
	mapview.addObject("dealConfirmationId", dealConfirmationId);
	
	ClientObj clientObj = new ClientObj();
	mapview.addObject("client", clientObj);
	
	Udn_Deals_Recorder_Obj dealRecorderObj = null;
	try {
		dealRecorderObj = dealService.findDealEntityById(dealConfirmationId);
	} catch (RecordNotFoundException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	//System.out.println("Deal Record Entity is " + dealEntity);

	mapview.addObject("DealObject", dealRecorderObj);

	
	// Following map will contain the list of all possible status of the workload. Where user can take action to change
	//the workload status. 
	Map allWorkloadStatusMap = new HashMap();
	
	//following code will perform the services based on the number of service lines updated in each workload. 
	// for e.g. Flight SL for a particular deal, we have three rows inserted so will just provide the count. 
	//following code TODO  needs improvement to be used along with JPA Stream. 
	Map<String, String> serviceLineCountMap = new HashMap<String, String>();
	for(int i=0;i<dealRecorderObj.getServiceList().length;i++) {
		//System.out.println("Service Name is " + dealRecorderObj.getServiceList()[i]);
		if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_FLT_CODE)) {
			List<FlightServiceLineVO> listFlightSLVO = dealServiceLine.find_FLT_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId());
			serviceLineCountMap.put(UdanChooConstants.WORKLOAD_FLT_CODE, String.valueOf(listFlightSLVO.size()));
			allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_FLT_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_FLT_OBJ));
		}
		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_HTL_CODE)) {
			List<HotelServiceLineVO> listHotelSLVO = new ArrayList();
			try {
				listHotelSLVO = dealServiceLine.find_HTL_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId());
				serviceLineCountMap.put(UdanChooConstants.WORKLOAD_HTL_CODE, String.valueOf(listHotelSLVO.size()));
				allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_HTL_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_HTL_OBJ));
			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_INS_CODE)) {
			List<InsuranceServiceLineVO> listInsuranceSLVO = dealServiceLine.find_INS_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId());
			serviceLineCountMap.put(UdanChooConstants.WORKLOAD_INS_CODE, String.valueOf(listInsuranceSLVO.size()));
			allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_INS_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_INS_OBJ));
		}
		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_LDP_CODE)) {
			List<LandPackageServiceLineVO> landPackageSLVO = dealServiceLine.find_LDP_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId());
			serviceLineCountMap.put(UdanChooConstants.WORKLOAD_LDP_CODE, String.valueOf(landPackageSLVO.size()));
			allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_LDP_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_LDP_OBJ));
		}
		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_OTH_CODE)) {
			List<OtherServiceLineVO> otherPackageSLVO = dealServiceLine.find_OTH_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId());
			serviceLineCountMap.put(UdanChooConstants.WORKLOAD_OTH_CODE, String.valueOf(otherPackageSLVO.size()));
			allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_OTH_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_OTH_OBJ));
		}
		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_STS_CODE)) {
			List<SightSeeingServiceLineVO> stsPackageSLVO = null;
			try {
				stsPackageSLVO = dealServiceLine.find_STS_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId());
			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			serviceLineCountMap.put(UdanChooConstants.WORKLOAD_STS_CODE, String.valueOf(stsPackageSLVO.size()));
			allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_STS_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_STS_OBJ));
		}
		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_TRN_CODE)) {
			List<TransferServiceLineVO> transferSLVO = null;
			try {
				transferSLVO = dealServiceLine.find_TRN_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId());
			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			serviceLineCountMap.put(UdanChooConstants.WORKLOAD_TRN_CODE, String.valueOf(transferSLVO.size()));
			allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_TRN_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_TRN_OBJ));
		}
		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_VSA_CODE)) {
			List<VisaServiceLineVO> visaSLVO = dealServiceLine.find_VSA_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId());
			serviceLineCountMap.put(UdanChooConstants.WORKLOAD_VSA_CODE, String.valueOf(visaSLVO.size()));
			allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_VSA_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_VSA_OBJ));
		}
	}
	mapview.addObject("MAP_WL_ALL_STATUS",allWorkloadStatusMap);
	mapview.addObject("serviceLineCountMap",serviceLineCountMap);

	
	return mapview;
}

*/
	

   
}