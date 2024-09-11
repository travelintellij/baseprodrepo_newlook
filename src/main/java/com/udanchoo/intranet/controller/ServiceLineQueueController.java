package com.udanchoo.intranet.controller;


import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.data.domain.Page;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.udanchoo.intranet.entity.Product;
import com.udanchoo.intranet.entity.Tg_Flt_Airport_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_FLT_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_HTL_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_INS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_LDP_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_OTH_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_STS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_Status_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_TRN_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_VSA_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.DashboardLineChartObj;
import com.udanchoo.intranet.model.DashboardObj;
import com.udanchoo.intranet.model.FilterServiceLineObj;
import com.udanchoo.intranet.model.FlightServiceLineVO;
import com.udanchoo.intranet.model.HotelServiceLineVO;
import com.udanchoo.intranet.model.InsuranceServiceLineVO;
import com.udanchoo.intranet.model.LandPackageServiceLineVO;
import com.udanchoo.intranet.model.OtherServiceLineVO;
import com.udanchoo.intranet.model.ProductModel;
import com.udanchoo.intranet.model.SearchDealObj;
import com.udanchoo.intranet.model.SightSeeingServiceLineVO;
import com.udanchoo.intranet.model.TransferServiceLineVO;
import com.udanchoo.intranet.model.Udn_Deals_Recorder_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.VisaServiceLineVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.DealServiceImpl;
import com.udanchoo.intranet.service.HotelServiceImpl;
import com.udanchoo.intranet.service.QueueManageService;
import com.udanchoo.intranet.service.ServiceLineQueueServiceImpl;
import com.udanchoo.intranet.service.SightSeeingServiceImpl;
import com.udanchoo.intranet.service.SupplierServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.validator.EmailAudienceValidator;
import com.udanchoo.intranet.validator.FilterServiceLineValidator;




@Controller
public class ServiceLineQueueController {
	 
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
	DealServiceImpl dealService;
	
	@Autowired
	ServiceLineQueueServiceImpl serviceLineQueueService;
	
	
	@Autowired
	QueueManageService queueService;
	
	@Autowired
	ClientServiceImpl clientService;
	
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	HotelServiceImpl hotelService;
	
	@Autowired
	SightSeeingServiceImpl sightSeeingService;
	
	@Autowired
	SupplierServiceImpl supplierService;
	
	@Autowired
    private FilterServiceLineValidator validator;

	@Autowired
	UserDetailsServiceImpl userService;

	private DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd MMM yyyy HH:mm");
	
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
	 
	 
	@RequestMapping("/get_deals_service_line_queue_user")
	public ModelAndView get_deals_service_line_queue_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "TravelEndDate") String sortBy,@ModelAttribute("FILTER_SL") SearchDealObj filterObj,BindingResult result) {
		//System.out.println("Filtered Object is " + filterObj);
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String username;
	    	if (principal instanceof UserDetails) {
	    	   username = ((UserDetails)principal).getUsername();
	    	} else {
	    	   username = principal.toString();
	    	}
	     	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
		int pageSize = 2;//UdanChooConstants.DEFAULT_PAGE_SIZE;
		ModelAndView modelView = new ModelAndView("serviceline/view_deal_serviceline");
		UserDetailsObj user = getLoggedInUser();
    	boolean isAdmin=false;
     	if(user.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    		List<UserDetailsObj> activeUsersList = userDetailsService.findAllActiveUsers();
    		Map<Integer, String> activeUsersMap = (Map<Integer, String>) activeUsersList.stream().collect(
                    Collectors.toMap(UserDetailsObj::getUserId, UserDetailsObj::getUsername));
    		modelView.addObject("ACTIVE_USERS_MAP", activeUsersMap);
    	}
        if((!isAdmin) && filterObj.getDealOwner()==0) {
	    	filterObj.setDealOwner((user.getUserId()))  ;
	    }
     	
		//TODO Check if some one changes the url manually then it should lead to an error page. not to a server error. 
     	int pageNum = Integer.parseInt(page);
		
		Page<Udn_Deals_Recorder_Entity> pageDealsFilteredRecords = serviceLineQueueService.filterServiceLineQueueDeals(pageNum, pageSize, filterObj.getDealOwner(), sortBy, filterObj, isAdmin);
		//modelView.addObject("dealSearchList",pageDealsFilteredRecords);
		List<Udn_Deals_Recorder_Obj> filteredDealsVoList = generateFilteredDealsVo(pageDealsFilteredRecords);
		modelView.addObject("userName", username);
		modelView.addObject("FILTERED_DEAL_RECORDS",filteredDealsVoList);
		modelView.addObject("maxPages", pageDealsFilteredRecords.getTotalPages());
		modelView.addObject("page", pageNum);
		modelView.addObject("sortBy", sortBy);
		modelView.addObject("dealOwner", filterObj.getDealOwner());
		modelView.addObject("upcomingDeal", filterObj.isUpcomingDeal());
		
		return modelView; 
	}

	private List<Udn_Deals_Recorder_Obj> generateFilteredDealsVo(Page<Udn_Deals_Recorder_Entity> pagedResult) {
		List<Udn_Deals_Recorder_Obj> filteredDealsVoList = new ArrayList<Udn_Deals_Recorder_Obj>();
		List<Udn_Deals_Recorder_Entity> dealsEntityList = pagedResult.getContent();
		Iterator filteredDealsIterator = dealsEntityList.iterator();
		while(filteredDealsIterator.hasNext()) {
			Udn_Deals_Recorder_Entity dealEntity = (Udn_Deals_Recorder_Entity) filteredDealsIterator.next();
			Udn_Deals_Recorder_Obj dealsVO =new Udn_Deals_Recorder_Obj(dealEntity);
			try {
				dealsVO.setClientName((clientService.getClientById(dealsVO.getClientId()).getClientName()));
				dealsVO.setStatusName(commonService.find_DealStatusById(dealsVO.getDealStatus()).getWorkloadStatusName());
				dealsVO.setDealOwnerName(userService.findUserByID(Integer.parseInt(String.valueOf(dealsVO.getDealOwner()))).getUsername());
			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			filteredDealsVoList.add(dealsVO);
		}
		return filteredDealsVoList;
	}
	
	//@RequestMapping("/workload/get_flight_service_line_queue_user")
	 @RequestMapping("/get_flight_service_line_queue_user")
	public ModelAndView get_flight_service_line_queue_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "10") Integer pageSize, @RequestParam(defaultValue = "CreatedAt") String sortBy,@RequestParam(defaultValue = "") String dateFrom,@RequestParam(defaultValue = "") String dateTo,@ModelAttribute("FILTER_SL") FilterServiceLineObj filterObj,BindingResult result) {
		//System.out.println("Filtered Object is " + filterObj);
		 Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			String username;
	    	if (principal instanceof UserDetails) {
	    	   username = ((UserDetails)principal).getUsername();
	    	} else {
	    	   username = principal.toString();
	    	}
	     	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
		 ModelAndView modelView = new ModelAndView("serviceline/view_flt_service_line_queue");
		validator.validate(filterObj, result);
		if(dateFrom!=null && dateFrom.trim().length()>0 && dateTo!=null && dateTo.trim().length()>0) {
			filterObj.setDateFrom(dateFrom);
			filterObj.setDateTo(dateTo);
		}
		if(result.hasErrors()) {
    		System.out.println("error is " + result);
			return modelView; 
    	}
		UserDetailsObj user = getLoggedInUser();
    	boolean isAdmin=false;
     	if(user.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    		List<UserDetailsObj> activeUsersList = userDetailsService.findAllActiveUsers();
    		Map<Integer, String> activeUsersMap = (Map<Integer, String>) activeUsersList.stream().collect(
                    Collectors.toMap(UserDetailsObj::getUserId, UserDetailsObj::getUsername));
    		modelView.addObject("ACTIVE_USERS_MAP", activeUsersMap);
    	}
        if((!isAdmin) && filterObj.getDealOwner()==0) {
	    	filterObj.setDealOwner((user.getUserId()))  ;
	    }
     	
		//TODO Check if some one changes the url manually then it should lead to an error page. not to a server error. 
		int pageNum = Integer.parseInt(page);
		Page<Udn_Deal_FLT_SL_Entity> pageFlightServiceLine = null;
		/*if(filterObj.getClientId()==0 && filterObj.getStatusId()==0 && (filterObj.getDateFrom()==null || filterObj.getDateFrom().trim().length()==0) && (filterObj.getDateTo()==null || filterObj.getDateTo().trim().length()==0)  ) {
				pageFlightServiceLine = queueService.findByCreatedAtAfter_BasedOn_Owner(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, user.getUserId(),sortBy,isAdmin);
		}else {
			pageFlightServiceLine = queueService.searchFlightSLSortByCNameBySLOwner(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, user.getUserId(),sortBy,filterObj.getClientId(),filterObj.getStatusId(),filterObj,isAdmin);
		}*/
		pageFlightServiceLine = queueService.filterServiceLineFlightQueue(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE,sortBy,filterObj,isAdmin);
		
		System.out.println("Flight Size is before " + pageFlightServiceLine.getNumberOfElements());
		List flt_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_FLT_SL_OBJ);
		List<FlightServiceLineVO> fltSlVo = generateFLT_SL_Vo(pageFlightServiceLine);
		System.out.println("Flight Size is After " + fltSlVo.size());
		//PagedListHolder<Udn_Deal_FLT_SL_Entity> pagedListHolder = new PagedListHolder<Udn_Deal_FLT_SL_Entity>(listFlightServiceLine);
		//pagedListHolder.setPageSize(2);
		modelView.addObject("userName", username);
		modelView.addObject("FLT_PAGE_LIST", fltSlVo);
		modelView.addObject("FLT_SL_STATUS_LIST", flt_sl_wl_statusList);
		modelView.addObject("maxPages", pageFlightServiceLine.getTotalPages());
		modelView.addObject("page", pageNum);
		modelView.addObject("sortBy", sortBy);
		modelView.addObject("clientId", filterObj.getClientId());
		modelView.addObject("statusId", filterObj.getStatusId());
		modelView.addObject("dateFrom", filterObj.getDateFrom());
		modelView.addObject("dateTo", filterObj.getDateTo());
		return modelView;
	}
	
	private List<FlightServiceLineVO> generateFLT_SL_Vo(Page<Udn_Deal_FLT_SL_Entity> pagedResult) {
		List<FlightServiceLineVO> fltSLVoList = new ArrayList<FlightServiceLineVO>();
		List<Udn_Deal_FLT_SL_Entity> fltEntityList = pagedResult.getContent();
		
		Iterator<Udn_Deal_FLT_SL_Entity> itrFLTEntity = fltEntityList.iterator();
		while(itrFLTEntity.hasNext()) {
			Udn_Deal_FLT_SL_Entity fltSLEntity = (Udn_Deal_FLT_SL_Entity) itrFLTEntity.next();
			Udn_Deals_Recorder_Entity dealObj;
			try {
				dealObj = dealService.find_DealEntityBy_Id(fltSLEntity.getDealConfirmationId());
				FlightServiceLineVO fltSLVo = new FlightServiceLineVO(fltSLEntity);
				Tg_Flt_Airport_Entity airportEntity = commonService.findAirportById(fltSLVo.getDepartingFrom());
				if(airportEntity!=null)
					fltSLVo.setOriginCity(airportEntity.getCityName());
				else
					fltSLVo.setOriginCity("Unavailable");
				
				airportEntity = commonService.findAirportById(fltSLVo.getArrivingTo());
				if(airportEntity!=null)
					fltSLVo.setDestinationCity(airportEntity.getCityName());    
				else
					fltSLVo.setDestinationCity("Unavailable");

				//airportEntity = commonService.findAirportById(fltSLVo.getArrivingTo()).getCityName()
				//fltSLVo.setDestinationCity(commonService.findAirportById(fltSLVo.getArrivingTo()).getCityName());
				fltSLVo.setClientName(clientService.getClientById(dealObj.getClientId()).getClientName());
				fltSLVo.setStatusName(commonService.find_DealStatusById(fltSLVo.getStatus()).getWorkloadStatusName());
				fltSLVo.setDealOwnerName(userService.findUserByID((int)dealObj.getDealOwner()).getUsername());
				fltSLVo.setFormattedDepartureDate(fltSLEntity.getDepartureDate().format(formatter));
				fltSLVo.setFormattedArrivalDate(fltSLEntity.getArrivalDate().format(formatter));
				//fltSLVo.setDepartingCity(commonService.findDestinationById(fltSLVo.getde).getCityName());
				//fltSLVo.setArrivalCity(commonService.findDestinationById(fltSLVo.getArrivingTo()).getCityName());
				fltSLVoList.add(fltSLVo);

			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return fltSLVoList;
	}


	/************************ Hotel Queue Handling Part Starts from here *********************/
	
	//@RequestMapping("/workload/get_hotel_service_line_queue_user")
	@RequestMapping("/get_hotel_service_line_queue_user")
	public ModelAndView get_hotel_service_line_queue_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "10") Integer pageSize, @RequestParam(defaultValue = "CreatedAt") String sortBy,@RequestParam(defaultValue = "") String dateFrom,@RequestParam(defaultValue = "") String dateTo,@ModelAttribute("FILTER_SL") FilterServiceLineObj filterObj,BindingResult result) {
		ModelAndView modelView = new ModelAndView("serviceline/view_htl_service_line_queue");
		validator.validate(filterObj, result);
		if(dateFrom!=null && dateFrom.trim().length()>0 && dateTo!=null && dateTo.trim().length()>0) {
			filterObj.setDateFrom(dateFrom);
			filterObj.setDateTo(dateTo);
		}
		if(result.hasErrors()) {
    		System.out.println("error is " + result);
			return modelView; 
    	}
		
		UserDetailsObj user = getLoggedInUser();
    	boolean isAdmin=false;
     	if(user.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}

     	//TODO Check if some one changes the url manually then it should lead to an error page. not to a server error. 
		int pageNum = Integer.parseInt(page);
		
		Page<Udn_Deal_HTL_SL_Entity> pageHotelServiceLine = null;
		if(filterObj.getClientId()==0 && filterObj.getStatusId()==0 && (filterObj.getDateFrom()==null || filterObj.getDateFrom().trim().length()==0) && (filterObj.getDateTo()==null || filterObj.getDateTo().trim().length()==0)  ) {
			pageHotelServiceLine = queueService.find_Hotel_SL_ByCreatedAtAfter_BasedOn_Owner(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, user.getUserId(),sortBy,isAdmin);
		}else {
			pageHotelServiceLine = queueService.searchHotelSLSortByCNameBySLOwner(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, user.getUserId(),sortBy,filterObj.getClientId(),filterObj.getStatusId(),filterObj,isAdmin);
		}
		
		List htl_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_HTL_SL_OBJ);
		
		List<HotelServiceLineVO> htlSlVo = generateHTL_SL_Vo(pageHotelServiceLine);
		modelView.addObject("HTL_PAGE_LIST", htlSlVo );
		modelView.addObject("HTL_SL_STATUS_LIST", htl_sl_wl_statusList);
		modelView.addObject("maxPages", pageHotelServiceLine.getTotalPages());
		modelView.addObject("page", pageNum);
		modelView.addObject("sortBy", sortBy);
		modelView.addObject("clientId", filterObj.getClientId());
		modelView.addObject("statusId", filterObj.getStatusId());
		modelView.addObject("dateFrom", filterObj.getDateFrom());
		modelView.addObject("dateTo", filterObj.getDateTo());

		return modelView;
	}
	
	private List<HotelServiceLineVO> generateHTL_SL_Vo(Page<Udn_Deal_HTL_SL_Entity> pagedResult) {
		List<HotelServiceLineVO> htlSLVoList = new ArrayList<HotelServiceLineVO>();
		List<Udn_Deal_HTL_SL_Entity> htlEntityList = pagedResult.getContent();
		
		Iterator<Udn_Deal_HTL_SL_Entity> itrHTLEntity = htlEntityList.iterator();
		while(itrHTLEntity.hasNext()) {
			Udn_Deal_HTL_SL_Entity htlSLEntity = (Udn_Deal_HTL_SL_Entity) itrHTLEntity.next();
			Udn_Deals_Recorder_Entity dealObj;
			try {
				dealObj = dealService.find_DealEntityBy_Id(htlSLEntity.getDealConfirmationId());
				HotelServiceLineVO htlSLVo = new HotelServiceLineVO(htlSLEntity);
				htlSLVo.setClientName(clientService.getClientById(dealObj.getClientId()).getClientName());
				htlSLVo.setCityName(commonService.findDestinationById(htlSLVo.getCityId()).getCityName());
				htlSLVo.setStatusName(commonService.find_DealStatusById(htlSLVo.getStatus()).getWorkloadStatusName());
				htlSLVo.setHotelName(hotelService.find_HotelbyId(htlSLVo.getHotelId()).getHotelName());
				
				
				htlSLVoList.add(htlSLVo);
			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return htlSLVoList;
	}
	
	/************************ Insurance Queue Handling Part Starts from here *********************/
	
	//@RequestMapping("/workload/get_insurance_service_line_queue_user")
	@RequestMapping("/get_insurance_service_line_queue_user")
	public ModelAndView get_insurance_service_line_queue_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "10") Integer pageSize, @RequestParam(defaultValue = "CreatedAt") String sortBy,@RequestParam(defaultValue = "") String dateFrom,@RequestParam(defaultValue = "") String dateTo,@ModelAttribute("FILTER_SL") FilterServiceLineObj filterObj,BindingResult result) {
		ModelAndView modelView = new ModelAndView("serviceline/view_ins_service_line_queue");
		validator.validate(filterObj, result);
		if(dateFrom!=null && dateFrom.trim().length()>0 && dateTo!=null && dateTo.trim().length()>0) {
			filterObj.setDateFrom(dateFrom);
			filterObj.setDateTo(dateTo);
		}
		if(result.hasErrors()) {
    		System.out.println("error is " + result);
			return modelView; 
    	}
		
		UserDetailsObj user = getLoggedInUser();
		boolean isAdmin=false;
     	if(user.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
		
	
		
		//TODO Check if some one changes the url manually then it should lead to an error page. not to a server error. 
		int pageNum = Integer.parseInt(page);
		
		Page<Udn_Deal_INS_SL_Entity> pageInsuranceServiceLine = null;
		if(filterObj.getClientId()==0 && filterObj.getStatusId()==0 && (filterObj.getDateFrom()==null || filterObj.getDateFrom().trim().length()==0) && (filterObj.getDateTo()==null || filterObj.getDateTo().trim().length()==0)  ) {
			pageInsuranceServiceLine = queueService.find_Insurance_SL_ByCreatedAtAfter_BasedOn_Owner(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, user.getUserId(),sortBy,isAdmin);
		}else {
			pageInsuranceServiceLine = queueService.searchInsuranceSLSortByCNameBySLOwner(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, user.getUserId(),sortBy,filterObj.getClientId(),filterObj.getStatusId(),filterObj,isAdmin);
		}
		
		List ins_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_INS_SL_OBJ);
		
		List<InsuranceServiceLineVO> insSlVo = generateINS_SL_Vo(pageInsuranceServiceLine);
		modelView.addObject("INS_PAGE_LIST", insSlVo );
		modelView.addObject("INS_SL_STATUS_LIST", ins_sl_wl_statusList);
		modelView.addObject("maxPages", pageInsuranceServiceLine.getTotalPages());
		modelView.addObject("page", pageNum);
		modelView.addObject("sortBy", sortBy);
		modelView.addObject("clientId", filterObj.getClientId());
		modelView.addObject("statusId", filterObj.getStatusId());
		modelView.addObject("dateFrom", filterObj.getDateFrom());
		modelView.addObject("dateTo", filterObj.getDateTo());

		return modelView;
	}
	private List<InsuranceServiceLineVO> generateINS_SL_Vo(Page<Udn_Deal_INS_SL_Entity> pagedResult) {
		List<InsuranceServiceLineVO> insSLVoList = new ArrayList<InsuranceServiceLineVO>();
		List<Udn_Deal_INS_SL_Entity> insEntityList = pagedResult.getContent();
		
		Iterator<Udn_Deal_INS_SL_Entity> itrINSEntity = insEntityList.iterator();
		while(itrINSEntity.hasNext()) {
			Udn_Deal_INS_SL_Entity insSLEntity = (Udn_Deal_INS_SL_Entity) itrINSEntity.next();
			Udn_Deals_Recorder_Entity dealObj;
			try {
				dealObj = dealService.find_DealEntityBy_Id(insSLEntity.getDealConfirmationId());
				InsuranceServiceLineVO insSLVo = new InsuranceServiceLineVO(insSLEntity);
				insSLVo.setClientName(clientService.getClientById(dealObj.getClientId()).getClientName());
				insSLVo.setDestinationName(commonService.findDestinationById(insSLVo.getDestinationId()).getCityName());
				insSLVo.setStatusName(commonService.find_DealStatusById(insSLVo.getStatus()).getWorkloadStatusName());
				
				insSLVoList.add(insSLVo);
			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return insSLVoList;
	}
	
	/************************ LandPackage Queue Handling Part Starts from here *********************/

	//@RequestMapping("/workload/get_landpackage_service_line_queue_user")
	@RequestMapping("/get_landpackage_service_line_queue_user")
	public ModelAndView get_landpackage_service_line_queue_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "10") Integer pageSize, @RequestParam(defaultValue = "CreatedAt") String sortBy,@RequestParam(defaultValue = "") String dateFrom,@RequestParam(defaultValue = "") String dateTo,@ModelAttribute("FILTER_SL") FilterServiceLineObj filterObj,BindingResult result) {
		ModelAndView modelView = new ModelAndView("serviceline/view_ldp_service_line_queue");
		validator.validate(filterObj, result);
		if(dateFrom!=null && dateFrom.trim().length()>0 && dateTo!=null && dateTo.trim().length()>0) {
			filterObj.setDateFrom(dateFrom);
			filterObj.setDateTo(dateTo);
		}
		if(result.hasErrors()) {
    		System.out.println("error is " + result);
			return modelView; 
    	}
		
		UserDetailsObj user = getLoggedInUser();
    	boolean isAdmin=false;
     	if(user.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
		
		//TODO Check if some one changes the url manually then it should lead to an error page. not to a server error. 
		int pageNum = Integer.parseInt(page);
		
		Page<Udn_Deal_LDP_SL_Entity> pageLandPackageServiceLine = null;
		if(filterObj.getClientId()==0 && filterObj.getStatusId()==0 && (filterObj.getDateFrom()==null || filterObj.getDateFrom().trim().length()==0) && (filterObj.getDateTo()==null || filterObj.getDateTo().trim().length()==0)  ) {
			pageLandPackageServiceLine = queueService.find_LandPacakage_SL_ByCreatedAtAfter_BasedOn_Owner(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, user.getUserId(),sortBy,isAdmin);
		}else {
			pageLandPackageServiceLine = queueService.searchLandPackageSLSortByCNameBySLOwner(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, user.getUserId(),sortBy,filterObj.getClientId(),filterObj.getStatusId(),filterObj,isAdmin);
		}
		
		List ldp_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_LDP_SL_OBJ);
		
		List<LandPackageServiceLineVO> ldpSlVo = generateLDP_SL_Vo(pageLandPackageServiceLine);
		modelView.addObject("LDP_PAGE_LIST", ldpSlVo );
		modelView.addObject("LDP_SL_STATUS_LIST", ldp_sl_wl_statusList);
		modelView.addObject("maxPages", pageLandPackageServiceLine.getTotalPages());
		modelView.addObject("page", pageNum);
		modelView.addObject("sortBy", sortBy);
		modelView.addObject("clientId", filterObj.getClientId());
		modelView.addObject("statusId", filterObj.getStatusId());
		modelView.addObject("dateFrom", filterObj.getDateFrom());
		modelView.addObject("dateTo", filterObj.getDateTo());

		return modelView;
	}

	private List<LandPackageServiceLineVO> generateLDP_SL_Vo(Page<Udn_Deal_LDP_SL_Entity> pagedResult) {
		List<LandPackageServiceLineVO> ldpSLVoList = new ArrayList<LandPackageServiceLineVO>();
		List<Udn_Deal_LDP_SL_Entity> ldpEntityList = pagedResult.getContent();
		
		Iterator<Udn_Deal_LDP_SL_Entity> itrLDPEntity = ldpEntityList.iterator();
		while(itrLDPEntity.hasNext()) {
			Udn_Deal_LDP_SL_Entity ldpSLEntity = (Udn_Deal_LDP_SL_Entity) itrLDPEntity.next();
			Udn_Deals_Recorder_Entity dealObj;
			try {
				dealObj = dealService.find_DealEntityBy_Id(ldpSLEntity.getDealConfirmationId());
				LandPackageServiceLineVO ldpSLVo = new LandPackageServiceLineVO(ldpSLEntity);
				ldpSLVo.setClientName(clientService.getClientById(dealObj.getClientId()).getClientName());
				ldpSLVo.setDestinationName(commonService.findDestinationById(ldpSLVo.getDestinationId()).getCityName());
				ldpSLVo.setStatusName(commonService.find_DealStatusById(ldpSLVo.getStatus()).getWorkloadStatusName());
				ldpSLVoList.add(ldpSLVo);
			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return ldpSLVoList;
	}
	
	
	
	/************************ LandPackage Queue Handling Part Starts from here *********************/
	//@RequestMapping("/workload/get_other_service_line_queue_user")
	@RequestMapping("/get_other_service_line_queue_user")
	public ModelAndView get_other_service_line_queue_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "10") Integer pageSize, @RequestParam(defaultValue = "CreatedAt") String sortBy,@RequestParam(defaultValue = "") String dateFrom,@RequestParam(defaultValue = "") String dateTo,@ModelAttribute("FILTER_SL") FilterServiceLineObj filterObj,BindingResult result) {
		ModelAndView modelView = new ModelAndView("serviceline/view_oth_service_line_queue");
		validator.validate(filterObj, result);
		if(dateFrom!=null && dateFrom.trim().length()>0 && dateTo!=null && dateTo.trim().length()>0) {
			filterObj.setDateFrom(dateFrom);
			filterObj.setDateTo(dateTo);
		}
		
		if(result.hasErrors()) {
    		System.out.println("error is " + result);
			return modelView; 
    	}
		
		UserDetailsObj user = getLoggedInUser();
    	boolean isAdmin=false;
     	if(user.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}

		
		//TODO Check if some one changes the url manually then it should lead to an error page. not to a server error. 
		int pageNum = Integer.parseInt(page);
		
		Page<Udn_Deal_OTH_SL_Entity> pageOtherServiceLine = null;
		if(filterObj.getClientId()==0 && filterObj.getStatusId()==0 && (filterObj.getDateFrom()==null || filterObj.getDateFrom().trim().length()==0) && (filterObj.getDateTo()==null || filterObj.getDateTo().trim().length()==0)  ) {
			pageOtherServiceLine = queueService.find_Other_SL_ByCreatedAtAfter_BasedOn_Owner(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, user.getUserId(),sortBy,isAdmin);
		}else {
			pageOtherServiceLine = queueService.searchOtherSLSortByCNameBySLOwner(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, user.getUserId(),sortBy,filterObj.getClientId(),filterObj.getStatusId(),filterObj,isAdmin);
		}
		
		List oth_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_OTH_SL_OBJ);
		
		List<OtherServiceLineVO> othSlVo = generateOTH_SL_Vo(pageOtherServiceLine);
		//PagedListHolder<Udn_Deal_FLT_SL_Entity> pagedListHolder = new PagedListHolder<Udn_Deal_FLT_SL_Entity>(listFlightServiceLine);
		//pagedListHolder.setPageSize(2);
		modelView.addObject("OTH_PAGE_LIST", othSlVo);
		modelView.addObject("OTH_SL_STATUS_LIST", oth_sl_wl_statusList);
		modelView.addObject("maxPages", pageOtherServiceLine.getTotalPages());
		modelView.addObject("page", pageNum);
		modelView.addObject("sortBy", sortBy);
		modelView.addObject("clientId", filterObj.getClientId());
		modelView.addObject("statusId", filterObj.getStatusId());
		modelView.addObject("dateFrom", filterObj.getDateFrom());
		modelView.addObject("dateTo", filterObj.getDateTo());
		
		return modelView;
	}

	private List<OtherServiceLineVO> generateOTH_SL_Vo(Page<Udn_Deal_OTH_SL_Entity> pagedResult) {
		List<OtherServiceLineVO> othSLVoList = new ArrayList<OtherServiceLineVO>();
		List<Udn_Deal_OTH_SL_Entity> othEntityList = pagedResult.getContent();
		
		Iterator<Udn_Deal_OTH_SL_Entity> itrOTHEntity = othEntityList.iterator();
		while(itrOTHEntity.hasNext()) {
			Udn_Deal_OTH_SL_Entity othSLEntity = (Udn_Deal_OTH_SL_Entity) itrOTHEntity.next();
			Udn_Deals_Recorder_Entity dealObj;
			try {
				dealObj = dealService.find_DealEntityBy_Id(othSLEntity.getDealConfirmationId());
				OtherServiceLineVO othSLVo = new OtherServiceLineVO(othSLEntity);
				othSLVo.setClientName(clientService.getClientById(dealObj.getClientId()).getClientName());
				othSLVo.setStatusName(commonService.find_DealStatusById(othSLVo.getStatus()).getWorkloadStatusName());
				othSLVoList.add(othSLVo);
			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return othSLVoList;
	}

	
	/************************ SightSeeing Queue Handling Part Starts from here *********************/
	
	//@RequestMapping("/workload/get_sightseeing_service_line_queue_user")
	@RequestMapping("/get_sightseeing_service_line_queue_user")
	public ModelAndView get_sightseeing_service_line_queue_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "10") Integer pageSize, @RequestParam(defaultValue = "CreatedAt") String sortBy,@RequestParam(defaultValue = "") String dateFrom,@RequestParam(defaultValue = "") String dateTo,@ModelAttribute("FILTER_SL") FilterServiceLineObj filterObj,BindingResult result) {
		ModelAndView modelView = new ModelAndView("serviceline/view_sts_service_line_queue");
		validator.validate(filterObj, result);
		if(dateFrom!=null && dateFrom.trim().length()>0 && dateTo!=null && dateTo.trim().length()>0) {
			filterObj.setDateFrom(dateFrom);
			filterObj.setDateTo(dateTo);
		}
		
		if(result.hasErrors()) {
    		System.out.println("error is " + result);
			return modelView; 
    	}
		
		UserDetailsObj user = getLoggedInUser();
    	boolean isAdmin=false;
     	if(user.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}

		
		//TODO Check if some one changes the url manually then it should lead to an error page. not to a server error. 
		int pageNum = Integer.parseInt(page);
		
		Page<Udn_Deal_STS_SL_Entity> pageSightSeeingServiceLine = null;
		if(filterObj.getClientId()==0 && filterObj.getStatusId()==0 && (filterObj.getDateFrom()==null || filterObj.getDateFrom().trim().length()==0) && (filterObj.getDateTo()==null || filterObj.getDateTo().trim().length()==0)  ) {
			pageSightSeeingServiceLine = queueService.find_SightSeeing_SL_ByCreatedAtAfter_BasedOn_Owner(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, user.getUserId(),sortBy,isAdmin);
		}else {
			pageSightSeeingServiceLine = queueService.searchSightSeeingSLSortByCNameBySLOwner(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, user.getUserId(),sortBy,filterObj.getClientId(),filterObj.getStatusId(),filterObj,isAdmin);
		}
		
		List flt_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_STS_SL_OBJ);
		
		List<SightSeeingServiceLineVO> stsSlVo = generateSTS_SL_Vo(pageSightSeeingServiceLine);
		//PagedListHolder<Udn_Deal_FLT_SL_Entity> pagedListHolder = new PagedListHolder<Udn_Deal_FLT_SL_Entity>(listFlightServiceLine);
		//pagedListHolder.setPageSize(2);
		modelView.addObject("STS_PAGE_LIST", stsSlVo);
		modelView.addObject("STS_SL_STATUS_LIST", flt_sl_wl_statusList);
		modelView.addObject("maxPages", pageSightSeeingServiceLine.getTotalPages());
		modelView.addObject("page", pageNum);
		modelView.addObject("sortBy", sortBy);
		modelView.addObject("clientId", filterObj.getClientId());
		modelView.addObject("statusId", filterObj.getStatusId());
		modelView.addObject("dateFrom", filterObj.getDateFrom());
		modelView.addObject("dateTo", filterObj.getDateTo());
		modelView.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm"));
		
		return modelView;
	}
	
	private List<SightSeeingServiceLineVO> generateSTS_SL_Vo(Page<Udn_Deal_STS_SL_Entity> pagedResult) {
		List<SightSeeingServiceLineVO> stsSLVoList = new ArrayList<SightSeeingServiceLineVO>();
		List<Udn_Deal_STS_SL_Entity> stsEntityList = pagedResult.getContent();
		
		Iterator<Udn_Deal_STS_SL_Entity> itrSTSEntity = stsEntityList.iterator();
		while(itrSTSEntity.hasNext()) {
			Udn_Deal_STS_SL_Entity stsSLEntity = (Udn_Deal_STS_SL_Entity) itrSTSEntity.next();
			Udn_Deals_Recorder_Entity dealObj;
			try {
				dealObj = dealService.find_DealEntityBy_Id(stsSLEntity.getDealConfirmationId());
				SightSeeingServiceLineVO stsSLVo = new SightSeeingServiceLineVO(stsSLEntity);
				stsSLVo.setClientName(clientService.getClientById(dealObj.getClientId()).getClientName());
				stsSLVo.setCityName(commonService.findDestinationById(stsSLVo.getCityId()).getCityName());
				stsSLVo.setStatusName(commonService.find_DealStatusById(stsSLVo.getStatus()).getWorkloadStatusName());
				stsSLVo.setSightSeeingName(sightSeeingService.find_SightSeeingById(stsSLVo.getSightSeeingId()).getSightSeeingName());
				stsSLVoList.add(stsSLVo);
			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return stsSLVoList;
	}

	
	/************************ Transfers Queue Handling Part Starts from here *********************/
	
	//@RequestMapping("/workload/get_transfers_service_line_queue_user")
	@RequestMapping("/get_transfers_service_line_queue_user")
	public ModelAndView get_transfers_service_line_queue_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "10") Integer pageSize, @RequestParam(defaultValue = "CreatedAt") String sortBy,@RequestParam(defaultValue = "") String dateFrom,@RequestParam(defaultValue = "") String dateTo,@ModelAttribute("FILTER_SL") FilterServiceLineObj filterObj,BindingResult result) {
		ModelAndView modelView = new ModelAndView("serviceline/view_trn_service_line_queue");
		validator.validate(filterObj, result);
		if(dateFrom!=null && dateFrom.trim().length()>0 && dateTo!=null && dateTo.trim().length()>0) {
			filterObj.setDateFrom(dateFrom);
			filterObj.setDateTo(dateTo);
		}
		
		if(result.hasErrors()) {
    		System.out.println("error is " + result);
			return modelView; 
    	}
		
		UserDetailsObj user = getLoggedInUser();
    	boolean isAdmin=false;
     	if(user.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}

		
		//TODO Check if some one changes the url manually then it should lead to an error page. not to a server error. 
		int pageNum = Integer.parseInt(page);
		
		Page<Udn_Deal_TRN_SL_Entity> pageTransfersServiceLine = null;
		if(filterObj.getClientId()==0 && filterObj.getStatusId()==0 && (filterObj.getDateFrom()==null || filterObj.getDateFrom().trim().length()==0) && (filterObj.getDateTo()==null || filterObj.getDateTo().trim().length()==0)  ) {
			pageTransfersServiceLine = queueService.find_Transfers_SL_ByCreatedAtAfter_BasedOn_Owner(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, user.getUserId(),sortBy,isAdmin);
		}else {
			pageTransfersServiceLine = queueService.searchTransfersSLSortByCNameBySLOwner(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, user.getUserId(),sortBy,filterObj.getClientId(),filterObj.getStatusId(),filterObj,isAdmin);
		}
		
		List trn_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_TRN_SL_OBJ);
		
		List<TransferServiceLineVO> trnSlVo = generateTRN_SL_Vo(pageTransfersServiceLine);
		//PagedListHolder<Udn_Deal_FLT_SL_Entity> pagedListHolder = new PagedListHolder<Udn_Deal_FLT_SL_Entity>(listFlightServiceLine);
		//pagedListHolder.setPageSize(2);
		modelView.addObject("TRN_PAGE_LIST", trnSlVo);
		modelView.addObject("TRN_SL_STATUS_LIST", trn_sl_wl_statusList);
		modelView.addObject("maxPages", pageTransfersServiceLine.getTotalPages());
		modelView.addObject("page", pageNum);
		modelView.addObject("sortBy", sortBy);
		modelView.addObject("clientId", filterObj.getClientId());
		modelView.addObject("statusId", filterObj.getStatusId());
		modelView.addObject("dateFrom", filterObj.getDateFrom());
		modelView.addObject("dateTo", filterObj.getDateTo());
		modelView.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm"));
		
		return modelView;
	}
	
	private List<TransferServiceLineVO> generateTRN_SL_Vo(Page<Udn_Deal_TRN_SL_Entity> pagedResult) {
		List<TransferServiceLineVO> trnSLVoList = new ArrayList<TransferServiceLineVO>();
		List<Udn_Deal_TRN_SL_Entity> trnEntityList = pagedResult.getContent();
		
		Iterator<Udn_Deal_TRN_SL_Entity> itrTRNEntity = trnEntityList.iterator();
		while(itrTRNEntity.hasNext()) {
			Udn_Deal_TRN_SL_Entity trnSLEntity = (Udn_Deal_TRN_SL_Entity) itrTRNEntity.next();
			Udn_Deals_Recorder_Entity dealObj;
			try {
				dealObj = dealService.find_DealEntityBy_Id(trnSLEntity.getDealConfirmationId());
				TransferServiceLineVO trnSLVo = new TransferServiceLineVO(trnSLEntity);
				trnSLVo.setClientName(clientService.getClientById(dealObj.getClientId()).getClientName());
				trnSLVo.setPickupCityName(commonService.findDestinationById(trnSLVo.getPickupCityId()).getCityName());
				trnSLVo.setStatusName(commonService.find_DealStatusById(trnSLVo.getStatus()).getWorkloadStatusName());
				//trnSLVo.setSightSeeingName(sightSeeingService.find_SightSeeingById(trnSLVo.getSightSeeingId()).getSightSeeingName());
				trnSLVoList.add(trnSLVo);
			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return trnSLVoList;
	}
	
	/************************ Visa Queue Handling Part Starts from here *********************/
	
	//@RequestMapping("/workload/get_visa_service_line_queue_user")
	@RequestMapping("/get_visa_service_line_queue_user")
	public ModelAndView get_visa_service_line_queue_user( @RequestParam(defaultValue = "0") String page,@RequestParam(defaultValue = "10") Integer pageSize, @RequestParam(defaultValue = "CreatedAt") String sortBy,@RequestParam(defaultValue = "") String dateFrom,@RequestParam(defaultValue = "") String dateTo,@ModelAttribute("FILTER_SL") FilterServiceLineObj filterObj,BindingResult result) {
		
		ModelAndView modelView = new ModelAndView("serviceline/view_vsa_service_line_queue");
		validator.validate(filterObj, result);
		if(dateFrom!=null && dateFrom.trim().length()>0 && dateTo!=null && dateTo.trim().length()>0) {
			filterObj.setDateFrom(dateFrom);
			filterObj.setDateTo(dateTo);
		}
		
		if(result.hasErrors()) {
    		System.out.println("error is " + result);
			return modelView; 
    	}
		
		UserDetailsObj user = getLoggedInUser();
    	boolean isAdmin=false;
     	if(user.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}

		
		//TODO Check if some one changes the url manually then it should lead to an error page. not to a server error. 
		int pageNum = Integer.parseInt(page);
		
		Page<Udn_Deal_VSA_SL_Entity> pageVisaServiceLine = null;
		if(filterObj.getClientId()==0 && filterObj.getStatusId()==0 && (filterObj.getDateFrom()==null || filterObj.getDateFrom().trim().length()==0) && (filterObj.getDateTo()==null || filterObj.getDateTo().trim().length()==0)  ) {
			pageVisaServiceLine = queueService.find_Visa_SL_ByCreatedAtAfter_BasedOn_Owner(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, user.getUserId(),sortBy,isAdmin);
		}else {
			pageVisaServiceLine = queueService.searchVisaSLSortByCNameBySLOwner(pageNum, UdanChooConstants.DEFAULT_PAGE_SIZE, user.getUserId(),sortBy,filterObj.getClientId(),filterObj.getStatusId(),filterObj,isAdmin);
		}
		
		List vsa_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_VSA_SL_OBJ);
		
		List<VisaServiceLineVO> vsaSlVo = generateVSA_SL_Vo(pageVisaServiceLine);
		//PagedListHolder<Udn_Deal_FLT_SL_Entity> pagedListHolder = new PagedListHolder<Udn_Deal_FLT_SL_Entity>(listFlightServiceLine);
		//pagedListHolder.setPageSize(2);
		modelView.addObject("VSA_PAGE_LIST", vsaSlVo);
		modelView.addObject("VSA_SL_STATUS_LIST", vsa_sl_wl_statusList);
		modelView.addObject("maxPages", pageVisaServiceLine.getTotalPages());
		modelView.addObject("page", pageNum);
		modelView.addObject("sortBy", sortBy);
		modelView.addObject("clientId", filterObj.getClientId());
		modelView.addObject("statusId", filterObj.getStatusId());
		modelView.addObject("dateFrom", filterObj.getDateFrom());
		modelView.addObject("dateTo", filterObj.getDateTo());
		
		return modelView;
	}
	
	private List<VisaServiceLineVO> generateVSA_SL_Vo(Page<Udn_Deal_VSA_SL_Entity> pagedResult) {
		List<VisaServiceLineVO> vsaSLVoList = new ArrayList<VisaServiceLineVO>();
		List<Udn_Deal_VSA_SL_Entity> vsaEntityList = pagedResult.getContent();
		
		Iterator<Udn_Deal_VSA_SL_Entity> itrVSAEntity = vsaEntityList.iterator();
		while(itrVSAEntity.hasNext()) {
			Udn_Deal_VSA_SL_Entity vsaSLEntity = (Udn_Deal_VSA_SL_Entity) itrVSAEntity.next();
			Udn_Deals_Recorder_Entity dealObj;
			try {
				dealObj = dealService.find_DealEntityBy_Id(vsaSLEntity.getDealConfirmationId());
				VisaServiceLineVO vsaSLVo = new VisaServiceLineVO(vsaSLEntity);
				vsaSLVo.setClientName(clientService.getClientById(dealObj.getClientId()).getClientName());
				vsaSLVo.setSupplierName(supplierService.findSupplierById(vsaSLVo.getSupplierId()).get().getSupplierName());
				vsaSLVo.setCountryName(commonService.findDestinationByCountryCode(vsaSLVo.getCountryCode()).getCountryName());
				vsaSLVo.setStatusName(commonService.find_DealStatusById(vsaSLVo.getStatus()).getWorkloadStatusName());
				//vsaSLVo.setServiceLineOwnerName(userDetailsService.findUserByID(vsaSLVo.getServiceLineOwner()).getUsername());
				vsaSLVoList.add(vsaSLVo);
			} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return vsaSLVoList;
	}
}

