package com.udanchoo.intranet.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import com.udanchoo.intranet.service.DocumentService;
import com.udanchoo.intranet.entity.Document;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.mail.MessagingException;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.data.domain.Page;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.udanchoo.intranet.entity.Udn_Deal_CRS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_FLT_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_HTL_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_INS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_LDP_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_OTH_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_STS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_Services_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_TRN_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_VSA_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Consulate_Master_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Doc_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Master_Entity;
import com.udanchoo.intranet.entity.supplier.Tg_Supplier_Master_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.ClientObj;
import com.udanchoo.intranet.model.CruiseServiceLineVO;
import com.udanchoo.intranet.model.EmailMessageVO;
import com.udanchoo.intranet.model.FlightServiceLineVO;
import com.udanchoo.intranet.model.HotelServiceLineVO;
import com.udanchoo.intranet.model.InsuranceServiceLineVO;
import com.udanchoo.intranet.model.LandPackageServiceLineVO;
import com.udanchoo.intranet.model.OtherServiceLineVO;
import com.udanchoo.intranet.model.SearchSightSeeingObj;
import com.udanchoo.intranet.model.SightSeeingServiceLineVO;
import com.udanchoo.intranet.model.SupplierObj;
import com.udanchoo.intranet.model.TransferServiceLineVO;
import com.udanchoo.intranet.model.UdnDealStatusVO;
import com.udanchoo.intranet.model.Udn_Deal_Services_Map_Obj;
import com.udanchoo.intranet.model.Udn_Deals_Recorder_Obj;
import com.udanchoo.intranet.model.Udn_Destinations_Master_Obj;
import com.udanchoo.intranet.model.Udn_Room_Category_Obj;
import com.udanchoo.intranet.model.Udn_SightSeeing_Master_Obj;
import com.udanchoo.intranet.model.Udn_Visa_Doc_SL_Obj;
import com.udanchoo.intranet.model.Udn_WL_FLT_Recorder_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.VisaServiceLineVO;
import com.udanchoo.intranet.model.VisaServiceStatusEmailFormObj;
import com.udanchoo.intranet.model.quotation.ManualHotelQuotationVO;
import com.udanchoo.intranet.model.supplier.SearchSupplierObj;
import com.udanchoo.intranet.model.supplier.TgSupplierMasterVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.DealServiceImpl;
import com.udanchoo.intranet.service.DealServiceLineImpl;
import com.udanchoo.intranet.service.FileStorageService;
import com.udanchoo.intranet.service.HotelServiceImpl;
import com.udanchoo.intranet.service.SightSeeingServiceImpl;
import com.udanchoo.intranet.service.SupplierServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.service.VisaServiceImpl;
import com.udanchoo.intranet.service.VoucherServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.validator.CityNameValidator;
import com.udanchoo.intranet.validator.CountryCodeValidator;
import com.udanchoo.intranet.validator.EmailAudienceValidator;
import com.udanchoo.intranet.validator.HotelQuotationValidator;

import freemarker.template.TemplateException;


@Controller
public class WorkloadController {


@Autowired
UserDetailsServiceImpl userDetailsService;

@Autowired
VoucherServiceImpl voucherServiceLine;
 
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		 SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(false);
		 webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	 }
	
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	ClientServiceImpl clientService;
	
	@Autowired
	DealServiceImpl dealService;
	
	@Autowired
	DealServiceLineImpl dealServiceLine;
	
	@Autowired
	SupplierServiceImpl supplierService;
	
	@Autowired
	HotelServiceImpl hotelService;
	
	@Autowired
    private CityNameValidator cityValidator;
	
	@Autowired
	SightSeeingServiceImpl sightSeeingService;

	@Autowired
    private EmailAudienceValidator emailValidator;
	
	@Autowired
	VisaServiceImpl visaService;
	
	@Autowired
	CountryCodeValidator countryCodeValidator;
	
	@Autowired
	HotelQuotationValidator hotelValidator;
	


   @Autowired
    private DocumentService documentService;
	
	
	@Value("${email.client.valid}")
	private boolean emailClientActive;
 
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
    
    //@RequestMapping("/workload/view_workloadhome")
    @RequestMapping("/view_workloadhome")
   	public ModelAndView viewWorkLoadHomePage() {
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	String username;
    	if (principal instanceof UserDetails) {
    	   username = ((UserDetails)principal).getUsername();
    	} else {
    	   username = principal.toString();
    	}
    	UserDetailsObj userObj = userDetailsService.loadUserByUsername(username);

    	//Stream stream = Stream.of( userObj.getAuthorities());
     	//stream.forEach(s -> System.out.println("Authority is " + s));
     	//System.out.println("Roles are ggg " + userObj.getRoles());
     	
     	System.out.println(userObj.getAuthorities() + " are displayed");
     	
     	//if(userObj.getAuthorities().contains("ROLE_ADMIN")) {
     		if(userObj.getAuthorities().stream()
     	      .anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
     		ModelAndView modelAdminView = new ModelAndView();
     		modelAdminView.setViewName("redirect:AdminHome");
     		return modelAdminView;
     	}
     	
     	
     	ModelAndView mapview = new ModelAndView("workload/WorkloadHome");
    	mapview.addObject("userName", username);
    	mapview.addObject("Id", userObj.getUsername());
    	//mapview.addObject("userRole", userObj.getRoles());
    	
    	ClientObj clientObj = new ClientObj();
    	mapview.addObject("client", clientObj);
    	
    	
    	return mapview;
    }
 
    
    //@RequestMapping("/workload/view_workload_createNewWorkLoadForm")
    @RequestMapping("/view_workload_createNewWorkLoadForm")
   	public ModelAndView view_workload_createNewWorkLoad(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("workloadRecorder") Udn_Deals_Recorder_Obj dealRecorder,  BindingResult result) {
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	String username;
    	if (principal instanceof UserDetails) {
    	   username = ((UserDetails)principal).getUsername();
    	} else {
    	   username = principal.toString();
    	}
     	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
     	
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}

     	
    	ModelAndView mapview = new ModelAndView("workload/form_createWokLoad");
    	mapview.addObject("userName", username);
    	mapview.addObject("Id", userObj.getUserId());
    	//mapview.addObject("userRole", userObj.getRoles());
    	mapview.addObject("dealConfirmationId", dealConfirmationId);
    	
    	ClientObj clientObj = new ClientObj();
    	mapview.addObject("client", clientObj);
    	
    	Udn_Deals_Recorder_Obj dealRecorderObj = null;
		try {
			dealRecorderObj = dealService.findDealEntityById(dealConfirmationId,userObj.getUserId(),isAdmin);
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
				List<FlightServiceLineVO> listFlightSLVO = dealServiceLine.find_FLT_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),false);
				serviceLineCountMap.put(UdanChooConstants.WORKLOAD_FLT_CODE, String.valueOf(listFlightSLVO.size()));
				allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_FLT_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_FLT_OBJ));
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_HTL_CODE)) {
				List<HotelServiceLineVO> listHotelSLVO = new ArrayList();
				try {
					listHotelSLVO = dealServiceLine.find_HTL_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
					serviceLineCountMap.put(UdanChooConstants.WORKLOAD_HTL_CODE, String.valueOf(listHotelSLVO.size()));
					allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_HTL_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_HTL_OBJ));
				} catch (RecordNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_INS_CODE)) {
				List<InsuranceServiceLineVO> listInsuranceSLVO = dealServiceLine.find_INS_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
				serviceLineCountMap.put(UdanChooConstants.WORKLOAD_INS_CODE, String.valueOf(listInsuranceSLVO.size()));
				allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_INS_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_INS_OBJ));
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_LDP_CODE)) {
				List<LandPackageServiceLineVO> landPackageSLVO = dealServiceLine.find_LDP_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
				serviceLineCountMap.put(UdanChooConstants.WORKLOAD_LDP_CODE, String.valueOf(landPackageSLVO.size()));
				allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_LDP_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_LDP_OBJ));
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_OTH_CODE)) {
				List<OtherServiceLineVO> otherPackageSLVO = dealServiceLine.find_OTH_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
				serviceLineCountMap.put(UdanChooConstants.WORKLOAD_OTH_CODE, String.valueOf(otherPackageSLVO.size()));
				allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_OTH_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_OTH_OBJ));
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_STS_CODE)) {
				List<SightSeeingServiceLineVO> stsPackageSLVO = null;
				try {
					stsPackageSLVO = dealServiceLine.find_STS_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
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
					transferSLVO = dealServiceLine.find_TRN_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
				} catch (RecordNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				serviceLineCountMap.put(UdanChooConstants.WORKLOAD_TRN_CODE, String.valueOf(transferSLVO.size()));
				allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_TRN_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_TRN_OBJ));
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_VSA_CODE)) {
				List<VisaServiceLineVO> visaSLVO = dealServiceLine.find_VSA_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
				serviceLineCountMap.put(UdanChooConstants.WORKLOAD_VSA_CODE, String.valueOf(visaSLVO.size()));
				allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_VSA_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_VSA_OBJ));
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_CRS_CODE)) {
				List<CruiseServiceLineVO> cruiseSLVOList = null;
				try {
					cruiseSLVOList = dealServiceLine.find_CRS_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
				} catch (RecordNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				serviceLineCountMap.put(UdanChooConstants.WORKLOAD_CRS_CODE, String.valueOf(cruiseSLVOList.size()));
				allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_CRS_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_CRS_OBJ));
			}
		}
		mapview.addObject("MAP_WL_ALL_STATUS",allWorkloadStatusMap);
		mapview.addObject("serviceLineCountMap",serviceLineCountMap);
		
		
		
    	
    	return mapview;
    }
    
    
    //@PostMapping(value="/workload/update_update_workload")
    @PostMapping(value="/update_update_workload")
    public ModelAndView update_update_workload(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("WL_OBJ") Udn_Deal_Services_Map_Obj udnDealServiceMapVo,  BindingResult result) {
    	ModelAndView mapview = new ModelAndView();
    	try {
			Udn_Deal_Services_Entity serviceMapEntity = dealService.find_Deal_Service_Map_ById(udnDealServiceMapVo.getServiceMapId());
			serviceMapEntity.setServiceStatus(udnDealServiceMapVo.getServiceStatus());
			dealService.update_Deal_Service_Map(serviceMapEntity);
			mapview.addObject("Success", "WorkLoad Record is updated Successfully. !!");
    	
    		
    	
    	} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
    		mapview.addObject("Error", "Error: Updating WorkLoad. Please contact administrator!! ");
			e.printStackTrace();
		}
    	
    	
    	
    	mapview.setViewName("forward:view_workload_createNewWorkLoadForm");
    	
    	return mapview;
    }
   
    
    //@RequestMapping("/workload/view_workload_FLT")
    @RequestMapping("/view_workload_FLT")
   	public ModelAndView view_workload_createNewWorkLoad_FLT(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("flightworkloadRecorder") Udn_WL_FLT_Recorder_Obj flightWlRecorder,  BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	ModelAndView mapview = view_workload_createNewWorkLoad(dealConfirmationId,null,null);

    	List fltServiceLineList ;
    	//if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		fltServiceLineList = dealServiceLine.find_FLT_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
    	/*}
    	else {
    		fltServiceLineList = dealServiceLine.find_FLT_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
    	}*/
    	Udn_Deal_Services_Entity serviceMap= dealServiceLine.find_Service_Map_Deal(dealConfirmationId,UdanChooConstants.WORKLOAD_FLT_CODE,userObj.getUserId(),isAdmin);
    	mapview.addObject("FLT_SL_LIST", fltServiceLineList);
    	mapview.addObject("dealConfirmationId",dealConfirmationId);
    	mapview.addObject("serviceMapId", serviceMap.getServiceMapId());
    	mapview.addObject("FLT_SL_ACTION", "VIEW");
    	mapview.setViewName("workload/flight/form_createWokLoad_Flight");
    	mapview.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm"));
    	//ModelAndView mapview = new ModelAndView("workload/form_createWokLoad_Flight");
    	return mapview;
    }
    

    //@PostMapping(value="/workload/view_create_workload_form_FLT")
    @PostMapping(value="/view_create_workload_form_FLT")
    public ModelAndView createWorkLoad_FLT(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("FLT_SL_OBJ") FlightServiceLineVO fltServiceLineVO,  BindingResult result) {
    	//if(result.hasErrors()) {
    	
    	
    	Map airlineMap = commonService.find_All_Airlines_Min_Map();
    	//List flightSupplierVoList = supplierService.find_Active_Service_Based_Suppliers("FLT");
    	List<TgSupplierMasterVO> flightSupplierVoList = supplierService.find_Active_Flight_Suppliers();
    	Map mapFlightSuppliersMap = new LinkedHashMap ();
    	for(TgSupplierMasterVO supplierEntity: flightSupplierVoList) {
    		mapFlightSuppliersMap.put(supplierEntity.getSupplierId(), supplierEntity.getSupplierName());
    	}
    	
    	
    	
    	List<UdnDealStatusVO> flt_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_FLT_SL_OBJ);
    	Map flightWLStatusMap = new LinkedHashMap ();
    	for(UdnDealStatusVO statusObj: flt_sl_wl_statusList) {
    		flightWLStatusMap.put(statusObj.getWorkloadStatusId(), statusObj.getWorkloadStatusName());
    	}

    	ModelAndView mapview = view_workload_createNewWorkLoad_FLT(dealConfirmationId,null,null); 
    	mapview.addObject("FLT_SL_ACTION", "ADD");
    	mapview.addObject("dealConfirmationId",dealConfirmationId);
    	mapview.addObject("AIRLINES_MAP", airlineMap);
    	mapview.addObject("FLT_SUPPLIER_MAP", mapFlightSuppliersMap);
    	mapview.addObject("FLT_SL_STATUS_MAP", flightWLStatusMap);
    	mapview.addObject("FLT_TKT_TYPE_LIST", UdanChooConstants.CABIN_CLASS);
    	mapview.addObject("NO_OF_HALTS", UdanChooConstants.NO_OF_HALTS);
    	return mapview;
    }

    
    //@PostMapping(value="/workload/view_update_workload_form_FLT")
    @PostMapping(value="/view_update_workload_form_FLT")
    public ModelAndView updateWorkLoad_FLT(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("FLT_SL_OBJ") FlightServiceLineVO fltServiceLineVO,  BindingResult result) {
    	ModelAndView mapView = createWorkLoad_FLT(dealConfirmationId,null,null);
    	mapView.addObject("FLT_SL_ACTION", "UPDATE");
    	
    	fltServiceLineVO= dealServiceLine.findByFLT_SL_ID(fltServiceLineVO);
    	fltServiceLineVO.setAirlineShortName((commonService.findAirlinebyId(fltServiceLineVO.getAirlineId())).getAirlineShortName());
		if(fltServiceLineVO.getSupplierId()!=0) {
			fltServiceLineVO.setSupplierName(supplierService.findSupplierById(fltServiceLineVO.getSupplierId()).get().getSupplierName());
		}else {
			fltServiceLineVO.setSupplierName("Booking Pending");
		}
		fltServiceLineVO.setOriginCity(commonService.findAirportById(fltServiceLineVO.getDepartingFrom()).getCityName());
		fltServiceLineVO.setDestinationCity(commonService.findAirportById(fltServiceLineVO.getArrivingTo()).getCityName());
		fltServiceLineVO.setCabinClassName(UdanChooConstants.CABIN_CLASS.get(fltServiceLineVO.getCabinClass()));
		fltServiceLineVO.setStatusName(commonService.find_SL_Deal_Obj_Based_On_Status("FLT_SL",fltServiceLineVO.getStatus()).getWorkloadStatusName());

		
    	
    	//mapView.addObject("ORG_FLT_SL_VO", fltServiceLineVO);
    	mapView.addObject("localDateTimeFormatToEdit", DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm"));
    	mapView.addObject("FLT_TKT_TYPE_LIST", UdanChooConstants.FLT_TICKET_TYPE_LIST);
    	return mapView;
    	
    }
    
    
    //@PostMapping(value="/workload/create_workload_FLT_SL")
    @PostMapping(value="/create_workload_FLT_SL")
    public ModelAndView create_workload_FLT_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("FLT_SL_OBJ") @Valid FlightServiceLineVO fltServiceLineVO,  BindingResult result) {
    	ModelAndView mapview = new ModelAndView();
    	UserDetailsObj userObj = getLoggedInUser();

    	if(!commonService.existsByAirportIdAndCityName(fltServiceLineVO.getDepartingFrom(), fltServiceLineVO.getOriginCity().trim())) {
			result.rejectValue("originCity", "city.error");
		}
    	if(!commonService.existsByAirportIdAndCityName(fltServiceLineVO.getArrivingTo(), fltServiceLineVO.getDestinationCity())) {
			result.rejectValue("destinationCity", "city.error");
		}
    	if((fltServiceLineVO.getAdults() + fltServiceLineVO.getChildren() + fltServiceLineVO.getInfants() )<=0) {
    		result.rejectValue("adults", "paxcount.error");
    	}

    	
    	if(!result.hasErrors()) {

    		Udn_Deal_FLT_SL_Entity flightSLEntity = new Udn_Deal_FLT_SL_Entity(fltServiceLineVO);
    	   dealServiceLine.saveFlightServiceLine(flightSLEntity);
    	   mapview = view_workload_createNewWorkLoad_FLT(dealConfirmationId,null,null);
    	}else {
    		mapview = createWorkLoad_FLT(dealConfirmationId,null,null);
    		mapview.addObject("localDateTimeFormatToEdit", DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm"));
    	}
    	
    	/*
    	List airlineVoList = commonService.find_All_Airlines_Min();
    	List flightSupplierVoList = supplierService.find_Active_Service_Based_Suppliers("FLT");
    	List flt_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_FLT_SL_OBJ);

    	ModelAndView mapview = view_workload_createNewWorkLoad_FLT(dealConfirmationId,null,null); 
    	mapview.addObject("FLT_SL_ACTION", "ADD");
    	
    	mapview.addObject("AirlinesVo_List", airlineVoList);
    	mapview.addObject("FLT_SUPPLIER_LIST", flightSupplierVoList);
    	mapview.addObject("FLT_SL_STATUS_LIST", flt_sl_wl_statusList);
    	*/
    	return mapview;
    }
    
    
    @PostMapping(value="/edit_edit_workload_FLT_SL")
    public ModelAndView edit_edit_workload_FLT_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("FLT_SL_OBJ") FlightServiceLineVO fltServiceLineVO,  BindingResult result) {
    	ModelAndView mapview = new ModelAndView();
    	UserDetailsObj userObj = getLoggedInUser();
    	//System.out.println("Errors are :" + result.getAllErrors());
    	if(!commonService.existsByAirportIdAndCityName(fltServiceLineVO.getDepartingFrom(), fltServiceLineVO.getOriginCity().trim())) {
			result.rejectValue("originCity", "city.error");
		}
    	if(!commonService.existsByAirportIdAndCityName(fltServiceLineVO.getArrivingTo(), fltServiceLineVO.getDestinationCity())) {
			result.rejectValue("destinationCity", "city.error");
		}
    	if((fltServiceLineVO.getAdults() + fltServiceLineVO.getChildren() + fltServiceLineVO.getInfants() )<=0) {
    		result.rejectValue("adults", "paxcount.error");
    	}
    	
    	if(!result.hasErrors()) {
    		//this db call is explicity called to ensure that when Admin updates a particular record then service line owner should not be changed.
    		//Optional<Udn_Deal_FLT_SL_Entity> fltEntityOption = dealServiceLine.findByFLT_ENTITY_SL_ID(fltServiceLineVO.getFltServiceId());
    		//fltServiceLineVO.setServiceLineOwner(orgFLTEntityVo.getServiceLineOwner());
    		Udn_Deal_FLT_SL_Entity flightSLEntity = new Udn_Deal_FLT_SL_Entity(fltServiceLineVO);
    		dealServiceLine.saveFlightServiceLine(flightSLEntity);
    		mapview = view_workload_createNewWorkLoad_FLT(dealConfirmationId,null,null);
    	}else {
    		mapview = createWorkLoad_FLT(dealConfirmationId,null,null);
    		mapview.addObject("FLT_SL_ACTION", "UPDATE");
    		mapview.addObject("localDateTimeFormatToEdit", DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm"));
    		
    	}
    	
    	return mapview;
    }
    
    
    //@PostMapping("/workload/view_delete_flt_sl_confirmation")
    @PostMapping("/view_delete_flt_sl_confirmation")
   	public ModelAndView view_delete_flt_sl_confirmation(@RequestParam(value = "fltServiceId") int fltServiceId,@RequestParam("dealConfirmationId") long dealConfirmationId) throws RecordNotFoundException
   	{
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	FlightServiceLineVO fltSLVoToDel = new FlightServiceLineVO();
    	fltSLVoToDel.setFltServiceId(fltServiceId);
    	fltSLVoToDel = dealServiceLine.findByFLT_SL_ID(fltSLVoToDel);
		modelView.addObject("fltSLObj", fltSLVoToDel);
		modelView.addObject("dealConfirmationId",dealConfirmationId);
		modelView.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm"));
        modelView.setViewName("workload/flight/form_Flight_SL_Del_Confirmation");
       	return modelView;
   	}

    
    //@PostMapping("/workload/delete_FLT_SL")
    @PostMapping("/delete_FLT_SL")
	public ModelAndView delete_FLT_SL(@RequestParam(value = "fltServiceId") String fltServiceId,@RequestParam("dealConfirmationId") long dealConfirmationId)
	{
    
    	boolean isSuccess = false;
    	try {
    		dealServiceLine.deleteFlightServiceLine(fltServiceId);
    		isSuccess=true;
		} catch (RecordNotFoundException e) {
			isSuccess = false;
		}
    	
    	ModelAndView mapview = view_workload_createNewWorkLoad_FLT(dealConfirmationId,null,null);
    	if(isSuccess) {
    		mapview.addObject("Success", "Flight Service Line Record Deleted Successfully. !!");
    	}else {
    		mapview.addObject("Error", "Error: Deleting the Flight Service Line. Please contact administrator!! ");
    	}
    	return mapview;
	}

    /********************* Hotel workload handling starts from here **************************/
    //@RequestMapping("/workload/view_workload_HTL")
    @RequestMapping("/view_workload_HTL")
   	public ModelAndView view_workload_createNewWorkLoad_HTL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("hotelworkloadRecorder") Udn_WL_FLT_Recorder_Obj hotelWlRecorder,  BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	ModelAndView mapview = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	List<HotelServiceLineVO> htlServiceLineList;
		try {
			htlServiceLineList = dealServiceLine.find_HTL_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
	    	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,"HTL",userObj.getUserId(),isAdmin);
	    	mapview.addObject("HTL_SL_LIST", htlServiceLineList);
	    	mapview.addObject("dealConfirmationId",dealConfirmationId);
	    	mapview.addObject("serviceMapId", serviceMap.getServiceMapId());
	    	Map voucherMap = loadVoucherDetails(dealConfirmationId);
	    	mapview.addObject("VOUCHER_MAP", voucherMap);
	    	mapview.addObject("HTL_SL_ACTION", "VIEW");
	    	mapview.setViewName("workload/hotel/form_createWokLoad_Hotel");
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return mapview;
    }
    
    private Map loadVoucherDetails(long dealConfirmationId) {
        List<Document> docs = documentService.getDocuments("DEAL_Hotel", String.valueOf(dealConfirmationId));
        Map<Object, Object> voucherMAP = new HashMap();
        for (Document doc : docs) {
            voucherMAP.put(doc.getFileName(), String.valueOf(doc.getId()));
        }
    	return voucherMAP;
    }
    
    private Set<File> listFilesUsingJavaIO(String dir) {
        return Stream.of(new File(dir).listFiles())
          .filter(file -> !file.isDirectory())
          .map(File::getAbsoluteFile)
          .collect(Collectors.toSet());
    }
    
    //@PostMapping(value="/workload/view_create_workload_form_HTL")
    @PostMapping(value="/view_create_workload_form_HTL")
    public ModelAndView createWorkLoad_HTL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("HTL_SL_OBJ") HotelServiceLineVO htlServiceLineVO,  BindingResult result) {
    	//List hotelSupplierVoList = supplierService.find_Active_Service_Based_Suppliers("HTL");
    	//List hotelSupplierVoList = supplierService.find_Active_Hotel_Suppliers();
    	SearchSupplierObj searchSupplierObj = new SearchSupplierObj();
    	searchSupplierObj.setConsolidator(true);
    	searchSupplierObj.setHotel(true);
    	searchSupplierObj.setSortBy("supplierName");
    	searchSupplierObj.setServiceCityId(htlServiceLineVO.getCityId());
    	
    	//System.out.println("Search Obj is " + searchSupplierObj);
    	
    	List<Tg_Supplier_Master_Entity> supplierResult =supplierService.find_filtered_suppliers(searchSupplierObj); 

    	Map mapHotelSuppliers = new LinkedHashMap ();
    	for(Tg_Supplier_Master_Entity supplierEntity: supplierResult) {
    		mapHotelSuppliers.put(supplierEntity.getSupplierId(), supplierEntity.getSupplierName());
    	}
    	
    	
    	List<UdnDealStatusVO> htl_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_HTL_SL_OBJ);
    	
    	Map hotelWLStatusMap = new LinkedHashMap ();
    	for(UdnDealStatusVO statusObj: htl_sl_wl_statusList) {
    		hotelWLStatusMap.put(statusObj.getWorkloadStatusId(), statusObj.getWorkloadStatusName());
    	}
    	ModelAndView mapview = view_workload_createNewWorkLoad_HTL(dealConfirmationId,null,null); 
    	mapview.addObject("HTL_SL_ACTION", "ADD");
    	
    	//mapview.addObject("HTL_SUPPLIER_LIST", mapHotelSuppliers);
    	mapview.addObject("HTL_SUPPLIER_MAP", mapHotelSuppliers);
    	//mapview.addObject("HTL_SL_STATUS_LIST", htl_sl_wl_statusList);
    	mapview.addObject("HTL_SL_STATUS_MAP", hotelWLStatusMap);
    	mapview.addObject("MEAL_PLANS_MAP", UdanChooConstants.MEAL_PLANS_MAP);
    	return mapview;
    }    
    
    //@PostMapping(value="/workload/create_workload_HTL_SL")
    @PostMapping(value="/create_workload_HTL_SL")
    public ModelAndView create_workload_HTL_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("HTL_SL_OBJ") @Valid HotelServiceLineVO htlServiceLineVO,  BindingResult result) {
    	//System.out.println("Control has come here to update hotel and displaying hotel obj" + htlServiceLineVO);
    	ModelAndView mapview = new ModelAndView();
    	//System.out.println("Object Received is " + htlServiceLineVO);
    	UserDetailsObj userObj = getLoggedInUser();
    	
		
    	/*Udn_Destinations_Master_Obj destinationObject = new Udn_Destinations_Master_Obj();
    	destinationObject.setCityName(htlServiceLineVO.getCityName());
    	destinationObject.setDestinationId(htlServiceLineVO.getCityId());
    	cityValidator.validate(destinationObject, result);
    	*/
    	
    	ManualHotelQuotationVO hotelTempObj = new ManualHotelQuotationVO ();
    	hotelTempObj.setAdults(htlServiceLineVO.getAdults());
    	hotelTempObj.setCheckInDate(htlServiceLineVO.getCheckInDate());
    	hotelTempObj.setCheckOutDate(htlServiceLineVO.getCheckOutDate());
    	hotelTempObj.setChildren(htlServiceLineVO.getChildren());
    	hotelTempObj.setHotelName(htlServiceLineVO.getHotelName());
    	hotelTempObj.setCityId(htlServiceLineVO.getCityId());
    	hotelTempObj.setCityName(htlServiceLineVO.getCityName());
    	hotelTempObj.setHotelId(htlServiceLineVO.getHotelId());
    	
    	hotelValidator.validate(hotelTempObj, result);
    	
    	if(!result.hasErrors()) {
    		//System.out.println("No Error Found. Create HTL Service Line here. ");
    		//htlServiceLineVO.setServiceLineOwner(userObj.getUserId());
    		Udn_Deal_HTL_SL_Entity hotelSLEntity = new Udn_Deal_HTL_SL_Entity(htlServiceLineVO);
    		
    		dealServiceLine.saveHotelServiceLine(hotelSLEntity);
    		mapview.addObject("Success", "Hotel Service Line Record Updated Successfully. !!");
    		//mapview = view_workload_createNewWorkLoad_HTL(dealConfirmationId,null,null);
        	mapview.setViewName("redirect:view_workload_HTL?dealConfirmationId="+dealConfirmationId);
    	}else {
    		mapview = createWorkLoad_HTL(dealConfirmationId,htlServiceLineVO,result);
     		List<Udn_Room_Category_Obj> hotelRoomCatList = hotelService.find_All_RoomCategoryByHotelId(htlServiceLineVO.getHotelId()); 
	    	Map mapRoomCategoryMap = new HashMap ();
	    	for(Udn_Room_Category_Obj roomCategoryObj: hotelRoomCatList) {
	    		mapRoomCategoryMap.put(roomCategoryObj.getRoomCategoryId(), roomCategoryObj.getRoomCategoryName());
	    	}
	    	mapview.addObject("ORG_HTL_ALL_RCAT_MAP", mapRoomCategoryMap);
    		//mapview = createWorkLoad_FLT(dealConfirmationId,null,null);
    	}

    	return mapview;
    }

    @PostMapping(value="/edit_edit_workload_HTL_SL")
    public ModelAndView edit_edit_workload_HTL_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("HTL_SL_OBJ") @Valid HotelServiceLineVO htlServiceLineVO,  BindingResult result) {
    	//System.out.println("Control has come here to update hotel and displaying hotel obj" + htlServiceLineVO);
    	ModelAndView mapview = new ModelAndView();
    	//System.out.println("Object Received is " + htlServiceLineVO);
    	UserDetailsObj userObj = getLoggedInUser();
    	if(!commonService.existsByDestinationIdAndCityName(htlServiceLineVO.getCityId(), htlServiceLineVO.getCityName())) {
			result.rejectValue("cityName", "city.error");
		}
    	if((htlServiceLineVO.getAdults() + htlServiceLineVO.getChildren() )<=0) {
    		result.rejectValue("adults", "paxcount.error");
    	}
    	if(htlServiceLineVO.getCheckInDate().compareTo(htlServiceLineVO.getCheckOutDate())>0) {
    		result.rejectValue("checkInDate", "travel.start.end.error");
    	}

    	if(!result.hasErrors()) {
    		Udn_Deal_HTL_SL_Entity hotelSLEntity = new Udn_Deal_HTL_SL_Entity(htlServiceLineVO);
    		dealServiceLine.saveHotelServiceLine(hotelSLEntity);
    		mapview=view_workload_createNewWorkLoad_HTL(dealConfirmationId,null,null); 
    		mapview.addObject("Success", "Hotel Service Line Record Updated Successfully. !!");
    		//mapview.setViewName("forward:view_workload_HTL");
    		//mapview = view_workload_createNewWorkLoad_HTL(dealConfirmationId,null,null);
    	}else {
    		mapview = createWorkLoad_HTL(dealConfirmationId,htlServiceLineVO,null);
    		mapview.addObject("HTL_SL_ACTION", "UPDATE");
    		List<Udn_Room_Category_Obj> hotelRoomCatList = hotelService.find_All_RoomCategoryByHotelId(htlServiceLineVO.getHotelId()); 
	    	Map mapRoomCategoryMap = new HashMap ();
	    	for(Udn_Room_Category_Obj roomCategoryObj: hotelRoomCatList) {
	    		mapRoomCategoryMap.put(roomCategoryObj.getRoomCategoryId(), roomCategoryObj.getRoomCategoryName());
	    	}
	    	mapview.addObject("ORG_HTL_ALL_RCAT_MAP", mapRoomCategoryMap);
    		/*mapview = view_workload_createNewWorkLoad_HTL(dealConfirmationId,null,null);
    		mapview.addObject("HTL_SL_ACTION", "UPDATE");
    		List<Udn_Room_Category_Obj> hotelRoomCatList = hotelService.find_All_RoomCategoryByHotelId(htlServiceLineVO.getHotelId()); 
	    	Map mapRoomCategoryMap = new HashMap ();
	    	for(Udn_Room_Category_Obj roomCategoryObj: hotelRoomCatList) {
	    		mapRoomCategoryMap.put(roomCategoryObj.getRoomCategoryId(), roomCategoryObj.getRoomCategoryName());
	    	}
	    	mapview.addObject("ORG_HTL_ALL_RCAT_MAP", mapRoomCategoryMap);
	    	*/
    		
    	}
    	
    	return mapview;
    }

    
    
    
    //@PostMapping(value="/workload/view_update_workload_form_HTL")
    @PostMapping(value="/view_update_workload_form_HTL")
    public ModelAndView view_update_workload_form_HTL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("HTL_SL_OBJ") HotelServiceLineVO htlServiceLineVO,  BindingResult result) {
    	ModelAndView mapView =null; 
    	
    	//HotelServiceLineVO orgHtlSLVo = null;
		try {
			mapView = createWorkLoad_HTL(dealConfirmationId,htlServiceLineVO,null);
	    	mapView.addObject("HTL_SL_ACTION", "UPDATE");
	    	htlServiceLineVO = dealServiceLine.findByHTL_SL_ID(htlServiceLineVO);
	    	List<Udn_Room_Category_Obj> hotelRoomCatList = hotelService.find_All_RoomCategoryByHotelId(htlServiceLineVO.getHotelId()); 
	    	Map mapRoomCategoryMap = new HashMap ();
	    	for(Udn_Room_Category_Obj roomCategoryObj: hotelRoomCatList) {
	    		mapRoomCategoryMap.put(roomCategoryObj.getRoomCategoryId(), roomCategoryObj.getRoomCategoryName());
	    	}

	    	//mapView.addObject("ORG_HTL_SL_VO", htlServiceLineVO);
			
			// While allowing the user to edit the hotel service line. By default room category will be selected on edit page
			// however, list of all hotel room categories to be provided on screen for the selected hotels so that user can change. 
			mapView.addObject("ORG_HTL_ALL_RCAT_MAP", mapRoomCategoryMap);
			//mapView.addObject("MEAL_PLANS_LIST", UdanChooConstants.MEAL_PLANS_LIST);
			//mapView.addObject("MEAL_PLANS_MAP", UdanChooConstants.MEAL_PLANS_MAP);
		
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return mapView;
    	
    }
    
    //@PostMapping("/workload/view_delete_htl_sl_confirmation")
    @PostMapping("/view_delete_htl_sl_confirmation")
   	public ModelAndView view_delete_htl_sl_confirmation(HotelServiceLineVO htlServiceLineVO,@RequestParam("dealConfirmationId") long dealConfirmationId)
   	{
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
        try {
			HotelServiceLineVO htlSLVoToDel = dealServiceLine.findByHTL_SL_ID(htlServiceLineVO);
			modelView.addObject("htlSLObj", htlSLVoToDel);
			modelView.addObject("dealConfirmationId",dealConfirmationId);
        } catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        modelView.setViewName("workload/form_Hotel_SL_Del_Confirmation");
       	return modelView;
   	}
    
    //@PostMapping("/workload/delete_HTL_SL")
    @PostMapping("/delete_HTL_SL")
  	public ModelAndView delete_HTL_SL(@RequestParam(value = "htlServiceId") int htlServiceId,@RequestParam("dealConfirmationId") long dealConfirmationId)
  	{
      
      	boolean isSuccess = false;
      	String uploadType = "Hotel";
      	try {
      		voucherServiceLine.delete_HotelVoucher_By_HotelServiceId(htlServiceId);
      		dealServiceLine.deleteHotelServiceLine(htlServiceId);
      		
    		String voucherFileName="HTL_VOUCHER_"+ htlServiceId+".pdf";
            documentService.deleteDocument("DEAL_Hotel", String.valueOf(dealConfirmationId), voucherFileName);
      		isSuccess=true;
  		} catch (RecordNotFoundException e) {
  			isSuccess = false;
  		}
      	
      	ModelAndView mapview = view_workload_createNewWorkLoad_HTL(dealConfirmationId,null,null);
      	if(isSuccess) {
      		mapview.addObject("Success", "Hotel Service Line Record Deleted Successfully. !!");
      	}else {
      		mapview.addObject("Error", "Error: Deleting the Hotel Service Line. Please contact administrator!! ");
      	}
      	return mapview;
  	}

    
    /************** Insurance Service Line Code Starts from here ******************************/
    //@RequestMapping("/workload/view_workload_INS")
    @RequestMapping("/view_workload_INS")
   	public ModelAndView view_workload_createNewWorkLoad_INS(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("flightworkloadRecorder") Udn_WL_FLT_Recorder_Obj flightWlRecorder,  BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	ModelAndView mapview = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	List<InsuranceServiceLineVO> insServiceLineList = dealServiceLine.find_INS_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
    	
    	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,"INS",userObj.getUserId(),isAdmin);
    	//System.out.println("Service Map Object is " + serviceMap.getServiceMapId() );
    	
    	mapview.addObject("INS_SL_LIST", insServiceLineList);
    	mapview.addObject("dealConfirmationId",dealConfirmationId);
    	mapview.addObject("serviceMapId", serviceMap.getServiceMapId());
    	mapview.addObject("INS_SL_ACTION", "VIEW");
    	mapview.addObject("CURRENCY_LIST", UdanChooConstants.CURRENCY_LIST);
    	mapview.setViewName("workload/insurance/form_createWokLoad_Insurance");
    	//ModelAndView mapview = new ModelAndView("workload/form_createWokLoad_Flight");
    	return mapview;
    }
    
    
    //@PostMapping(value="/workload/view_create_workload_form_INS")
    @PostMapping(value="/view_create_workload_form_INS")
    public ModelAndView createWorkLoad_INS(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("INS_SL_OBJ") InsuranceServiceLineVO fltServiceLineVO,  BindingResult result) {
    	//if(result.hasErrors()) {

    	//List<SupplierObj> insuranceSupplierVoList = supplierService.find_Active_Service_Based_Suppliers("INS");
    	//List<TgSupplierMasterVO> insuranceSupplierVoList = supplierService.find_Active_Insurance_Suppliers();

    	List<UdnDealStatusVO> ins_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_INS_SL_OBJ);
    	Map ins_sl_wl_statusMap = new LinkedHashMap<>();
    	for(UdnDealStatusVO statusVO: ins_sl_wl_statusList) {
    		ins_sl_wl_statusMap.put(statusVO.getWorkloadStatusId(), statusVO.getWorkloadStatusName());
    	}

    	SearchSupplierObj searchSupplierObj = new SearchSupplierObj();
    	searchSupplierObj.setConsolidator(true);
    	searchSupplierObj.setInsurance(true);
    	searchSupplierObj.setSortBy("supplierName");
    	
    	List<Tg_Supplier_Master_Entity> supplierResult =supplierService.find_filtered_suppliers(searchSupplierObj);
    	
    	Map supplierMap = new LinkedHashMap<>();
    	for(Tg_Supplier_Master_Entity supplierMaster:supplierResult) {
    		supplierMap.put(supplierMaster.getSupplierId(), supplierMaster.getSupplierName());
    	}
    	
    	ModelAndView mapview = view_workload_createNewWorkLoad_INS(dealConfirmationId,null,null); 
    	mapview.addObject("INS_SL_ACTION", "ADD");
    	mapview.addObject("INS_SUPPLIER_MAP", supplierMap);
    	mapview.addObject("INS_SL_STATUS_MAP", ins_sl_wl_statusMap);
    	mapview.addObject("INS_PROVIDER_MAP", UdanChooConstants.INSURANCE_PROVIDERS_MAP);
		mapview.addObject("INSURANCE_TYPE_MAP", UdanChooConstants.INSURANCE_TYPE_MAP);
    	
    	return mapview;
    }
    
    //@PostMapping(value="/workload/create_workload_INS_SL")
    @PostMapping(value="/create_workload_INS_SL")
    public ModelAndView create_workload_INS_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("INS_SL_OBJ") @Valid InsuranceServiceLineVO insServiceLineVO,  BindingResult result) {
    	ModelAndView mapview = new ModelAndView();
    	UserDetailsObj userObj = getLoggedInUser();
    	if(!commonService.existsByDestinationIdAndCityName(insServiceLineVO.getDestinationId(), insServiceLineVO.getDestinationName())) {
			result.rejectValue("destinationName", "country.error");
		}

    	
    	if(insServiceLineVO.getCoverageStartDate().compareTo(insServiceLineVO.getCoverageEndDate())>0) {
    		result.rejectValue("coverageStartDate", "coverage.start.end.error");
    	}
    	
    	if(!result.hasErrors()) {
    		//insServiceLineVO.setServiceLineOwner(userObj.getUserId());
    	   Udn_Deal_INS_SL_Entity insuranceSLEntity = new Udn_Deal_INS_SL_Entity(insServiceLineVO);
    	   dealServiceLine.saveInsuranceServiceLine(insuranceSLEntity);
    	   mapview = view_workload_createNewWorkLoad_INS(dealConfirmationId,null,null);
    	   mapview.addObject("Success", "Insurance Service Line Record Updated Successfully. !!");
    	}else {
    		mapview = createWorkLoad_INS(dealConfirmationId,null,null);
    		mapview.addObject("Error!!", "Error Updating Insurance Service Line Record. Contact Administrator!!");
    	}
    	return mapview;
    }

    @PostMapping(value="/edit_edit_workload_INS_SL")
    public ModelAndView edit_edit_workload_INS_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("INS_SL_OBJ") @Valid InsuranceServiceLineVO insServiceLineVO,  BindingResult result) {
    	ModelAndView mapview = new ModelAndView();
    	UserDetailsObj userObj = getLoggedInUser();

		if(!commonService.existsByDestinationIdAndCityName(insServiceLineVO.getDestinationId(), insServiceLineVO.getDestinationName())) {
			result.rejectValue("destinationName", "country.error");
		}

    	
    	if(insServiceLineVO.getCoverageStartDate().compareTo(insServiceLineVO.getCoverageEndDate())>0) {
    		result.rejectValue("coverageStartDate", "coverage.start.end.error");
    	}
    	
    	if(!result.hasErrors()) {
    		//insServiceLineVO.setServiceLineOwner(userObj.getUserId());
    		//InsuranceServiceLineVO insOrgEntityVo = dealServiceLine.findByINS_SL_ID(insServiceLineVO);
    		//insServiceLineVO.setServiceLineOwner(insOrgEntityVo.getServiceLineOwner());
    		Udn_Deal_INS_SL_Entity insuranceSLEntity = new Udn_Deal_INS_SL_Entity(insServiceLineVO);
    		dealServiceLine.saveInsuranceServiceLine(insuranceSLEntity);
    		mapview = view_workload_createNewWorkLoad_INS(dealConfirmationId,null,null);
    		mapview.addObject("Success", "Insurance Service Line Record Updated Successfully. !!");
    	}else {
    		mapview = createWorkLoad_INS(dealConfirmationId,null,null);
    		mapview.addObject("INS_SL_ACTION", "UPDATE");
    		mapview.addObject("Error!!", "Error Updating Insurance Service Line Record. Contact Administrator!!");
    	}
    	return mapview;
    }

    
    
    //@PostMapping(value="/workload/view_update_workload_form_INS")
    @PostMapping(value="/view_update_workload_form_INS")
    public ModelAndView updateWorkLoad_INS(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("INS_SL_OBJ") InsuranceServiceLineVO insServiceLineVO,  BindingResult result) {
    	ModelAndView mapView = createWorkLoad_INS(dealConfirmationId,null,null);
    	mapView.addObject("INS_SL_ACTION", "UPDATE");
    	insServiceLineVO= dealServiceLine.findByINS_SL_ID(insServiceLineVO);
    	//mapView.addObject("ORG_INS_SL_VO", orgInsSLVo);
    	//mapView.addObject("CURRENCY_LIST", UdanChooConstants.CURRENCY_LIST);
    	return mapView;
    	
    }
   
    //@PostMapping("/workload/view_delete_ins_sl_confirmation")
    @PostMapping("/view_delete_ins_sl_confirmation")
   	public ModelAndView view_delete_ins_sl_confirmation(@ModelAttribute("INS_SL_OBJ") InsuranceServiceLineVO insSLVO,@RequestParam("dealConfirmationId") long dealConfirmationId)
   	{
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
        
    	insSLVO= dealServiceLine.findByINS_SL_ID(insSLVO);
		//modelView.addObject("insSLObj", insSLVoToDel);
		modelView.addObject("dealConfirmationId",dealConfirmationId);
        
        modelView.setViewName("workload/form_Insurance_SL_Del_Confirmation");
       	return modelView;
   	}
  
    //@PostMapping("/workload/delete_INS_SL")
    @PostMapping("/delete_INS_SL")
   	public ModelAndView delete_INS_SL(@RequestParam(value = "insServiceId") int insServiceId,@RequestParam("dealConfirmationId") long dealConfirmationId)
   	{
       boolean isSuccess = false;
       	try {
       		dealServiceLine.delete_Insurance_ServiceLine(insServiceId);
       		isSuccess=true;
   		} catch (RecordNotFoundException e) {
   			isSuccess = false;
   		}
       	
       	ModelAndView mapview = view_workload_createNewWorkLoad_INS(dealConfirmationId,null,null);
       	if(isSuccess) {
       		mapview.addObject("Success", "Insurance Service Line Record Deleted Successfully. !!");
       	}else {
       		mapview.addObject("Error", "Error: Deleting the Insurance Service Line. Please contact administrator!! ");
       	}
       	return mapview;
   	}
      
  /*******************************************************************************************/
   //TODO update the parameter. right now UDN_FLT_RECORDER object is passed as parameter and same for other SL method.
    // this holds no significance. 
    //@RequestMapping("/workload/view_workload_LDP")
    @RequestMapping("/view_workload_LDP")
   	public ModelAndView view_workload_createNewWorkLoad_LDP(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("landpackageworkloadRecorder") Udn_WL_FLT_Recorder_Obj flightWlRecorder,  BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	
    	ModelAndView mapview = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	List ldpServiceLineList = dealServiceLine.find_LDP_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
    	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,UdanChooConstants.WORKLOAD_LDP_CODE,userObj.getUserId(),isAdmin);
    	//System.out.println("Service Map Object is " + serviceMap.getServiceMapId() );
    	mapview.addObject("LDP_SL_LIST", ldpServiceLineList);
    	mapview.addObject("LDP_SL_ACTION", "VIEW");
    	
    	mapview.addObject("dealConfirmationId",dealConfirmationId);
    	mapview.addObject("serviceMapId", serviceMap.getServiceMapId());
    	mapview.setViewName("workload/landpackage/view_list_WokLoad_LandPackage");
    	//ModelAndView mapview = new ModelAndView("workload/form_createWokLoad_Flight");
    	return mapview;
    }
    
    @RequestMapping(value = "/manage_landpackage_workload_actions", params = "Back")
    public ModelAndView manage_landpackage_workload_action_view(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("landpackageworkloadRecorder") Udn_WL_FLT_Recorder_Obj flightWlRecorder,  BindingResult result) {
    	ModelAndView modelView= new ModelAndView("forward:view_workload_LDP");
    	return modelView;
    }
    @RequestMapping(value = "/manage_landpackage_workload_actions", params = "Edit")
    public ModelAndView manage_landpackage_workload_action_edit(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("landpackageworkloadRecorder") Udn_WL_FLT_Recorder_Obj flightWlRecorder,  BindingResult result) {
    	ModelAndView modelView= new ModelAndView("forward:view_update_LDP_SL");
    	return modelView;
    }
    @RequestMapping(value = "/manage_landpackage_workload_actions", params = "Delete")
    public ModelAndView manage_landpackage_workload_action_delete(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("landpackageworkloadRecorder") Udn_WL_FLT_Recorder_Obj flightWlRecorder,  BindingResult result) {
    	ModelAndView modelView= new ModelAndView("forward:view_delete_ldp_sl_confirmation");
    	return modelView;
    }
    
    
    //@PostMapping(value="/workload/view_create_workload_form_LDP")
    @PostMapping(value="/view_create_workload_form_LDP")
    public ModelAndView view_create_workload_form_LDP(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("LDP_SL_OBJ") LandPackageServiceLineVO ldpServiceLineVO,  BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	
    	//List<SupplierObj> ldpSupplierVoList = supplierService.find_Active_Service_Based_Suppliers("LDP");
     	List<TgSupplierMasterVO> ldpSupplierVoList = supplierService.find_Active_Package_Suppliers();
     	
    	List<UdnDealStatusVO> ldp_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_LDP_SL_OBJ);
    	Map ldp_sl_wl_statusMap = new LinkedHashMap<>();
    	for(UdnDealStatusVO statusVO: ldp_sl_wl_statusList) {
    		ldp_sl_wl_statusMap.put(statusVO.getWorkloadStatusId(), statusVO.getWorkloadStatusName());
    	}
    	
    	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,UdanChooConstants.WORKLOAD_LDP_CODE,userObj.getUserId(),isAdmin);
    	
    	ModelAndView modelView = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	modelView.addObject("dealConfirmationId", dealConfirmationId);
    	modelView.addObject("serviceMapId", serviceMap.getServiceMapId());
    	modelView.addObject("LDP_SUPPLIER_LIST", ldpSupplierVoList);
    	modelView.addObject("LDP_SL_STATUS_MAP", ldp_sl_wl_statusMap);
    	modelView.addObject("LDP_TYPE", UdanChooConstants.LDP_TYPE);
    	modelView.setViewName("workload/landpackage/form_createWorkLoad_LandPackage");
    	
    	return modelView;
    }
    
    //@PostMapping(value="/workload/create_create_workload_LDP")
    @PostMapping(value="/create_create_workload_LDP")
    public ModelAndView create_create_workload_LDP(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("LDP_SL_OBJ") LandPackageServiceLineVO ldpServiceLineVO,  BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView =null;
    	ldpServiceLineVO.setServiceLineOwner(userObj.getUserId());
    	/*
    	Udn_Destinations_Master_Obj destinationObject = new Udn_Destinations_Master_Obj();
    	destinationObject.setCityName(ldpServiceLineVO.getDestinationName());
    	destinationObject.setDestinationId(ldpServiceLineVO.getDestinationId());
    	cityValidator.validate(destinationObject, result);
    	*/
    	if(!commonService.existsByDestinationIdAndCityName(ldpServiceLineVO.getDestinationId(), ldpServiceLineVO.getDestinationName())) {
			result.rejectValue("destinationName", "city.error");
		}
    	if((ldpServiceLineVO.getAdults() + ldpServiceLineVO.getChildren() )<=0) {
    		result.rejectValue("adults", "paxcount.error");
    	}
    	if(ldpServiceLineVO.getStartDate().compareTo(ldpServiceLineVO.getEndDate())>0) {
    		result.rejectValue("startDate", "travel.start.end.error");
    	}
    	
    	if(!result.hasErrors()) {
    		Udn_Deal_LDP_SL_Entity landPackageSLEntity = new Udn_Deal_LDP_SL_Entity(ldpServiceLineVO);
        	dealServiceLine.saveLandPackageServiceLine(landPackageSLEntity);
        	modelView = view_workload_createNewWorkLoad_LDP(dealConfirmationId,null,null);
        	modelView.addObject("Success", "Land-Package Service Line Record Updated Successfully. !!");
    	}else {
    		modelView = view_create_workload_form_LDP(dealConfirmationId,ldpServiceLineVO,result);
    	}
    	return modelView;
    }

    @PostMapping(value="/edit_edit_workload_LDP")
    public ModelAndView edit_edit_workload_LDP(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("LDP_SL_OBJ") LandPackageServiceLineVO ldpServiceLineVO,  BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	
    	ModelAndView modelView = null;
    	//LandPackageServiceLineVO lpOrgEntityVo = dealServiceLine.find_LDP_ServiceLine_ById(ldpServiceLineVO); 
    	//ldpServiceLineVO.setServiceLineOwner(userObj.getUserId());
    	if(!commonService.existsByDestinationIdAndCityName(ldpServiceLineVO.getDestinationId(), ldpServiceLineVO.getDestinationName())) {
			result.rejectValue("destinationName", "city.error");
		}
    	if((ldpServiceLineVO.getAdults() + ldpServiceLineVO.getChildren() )<=0) {
    		result.rejectValue("adults", "paxcount.error");
    	}
    	if(ldpServiceLineVO.getStartDate().compareTo(ldpServiceLineVO.getEndDate())>0) {
    		result.rejectValue("startDate", "travel.start.end.error");
    	}
    	
    	if(!result.hasErrors()) {
	    	Udn_Deal_LDP_SL_Entity landPackageSLEntity = new Udn_Deal_LDP_SL_Entity(ldpServiceLineVO);
	    	//ldpServiceLineVO.setServiceLineOwner(lpOrgEntityVo.getServiceLineOwner());
	    	dealServiceLine.saveLandPackageServiceLine(landPackageSLEntity);
	    	modelView = view_workload_createNewWorkLoad_LDP(dealConfirmationId,null,null);
	    	modelView.addObject("Success", "Land-Package Service Line Record Updated Successfully. !!");
    	}
    	else {
    	  	modelView = new ModelAndView();
    		List<TgSupplierMasterVO> ldpSupplierVoList = supplierService.find_Active_Package_Suppliers();
    		SearchSupplierObj searchSupplierObj = new SearchSupplierObj();
        	searchSupplierObj.setConsolidator(true);
        	searchSupplierObj.setLandPackage(true);
        	searchSupplierObj.setSortBy("supplierName");
        	searchSupplierObj.setServiceCityId(ldpServiceLineVO.getDestinationId());
        	List<Tg_Supplier_Master_Entity> supplierResult =supplierService.find_filtered_suppliers(searchSupplierObj);
        	
        	Map supplierMap = new LinkedHashMap<>();
        	for(Tg_Supplier_Master_Entity supplierMaster:supplierResult) {
        		supplierMap.put(supplierMaster.getSupplierId(), supplierMaster.getSupplierName());
        	}
         	
        	List<UdnDealStatusVO> ldp_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_LDP_SL_OBJ);
        	Map ldp_sl_wl_statusMap = new LinkedHashMap<>();
        	for(UdnDealStatusVO statusVO: ldp_sl_wl_statusList) {
        		ldp_sl_wl_statusMap.put(statusVO.getWorkloadStatusId(), statusVO.getWorkloadStatusName());
        	}
        	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,UdanChooConstants.WORKLOAD_LDP_CODE,userObj.getUserId(),isAdmin);
        	modelView.addObject("dealConfirmationId", dealConfirmationId);
        	modelView.addObject("serviceMapId", serviceMap.getServiceMapId());
        	modelView.addObject("LDP_SUPPLIER_MAP", supplierMap);
        	modelView.addObject("LDP_SL_STATUS_MAP", ldp_sl_wl_statusMap);
        	modelView.addObject("LDP_TYPE", UdanChooConstants.LDP_TYPE);	
        	modelView.setViewName("workload/landpackage/form_update_WorkLoad_LandPackage");
    	}
    	return modelView;
    }

    
    
    //@PostMapping(value="/workload/view_view_LDP_SL")
    @PostMapping(value="/view_view_LDP_SL")
    public ModelAndView view_view_LDP_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("LDP_SL_OBJ") LandPackageServiceLineVO ldpServiceLineVO,  BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	ModelAndView modelView = view_workload_createNewWorkLoad_LDP(dealConfirmationId,null,null);
    	ldpServiceLineVO = dealServiceLine.find_LDP_ServiceLine_ById(ldpServiceLineVO);
    	
    	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,UdanChooConstants.WORKLOAD_LDP_CODE,userObj.getUserId(),isAdmin);
    	modelView.addObject("dealConfirmationId",dealConfirmationId);
    	modelView.addObject("serviceMapId", serviceMap.getServiceMapId());
    	//modelView.addObject("ldpSLObj", ldpServiceLineVO);
    	
    	
    	modelView.setViewName("workload/landpackage/view_WorkLoad_LandPackage");
    	
    	return modelView;
    }
    
    //@PostMapping(value="/workload/view_update_LDP_SL")
    @PostMapping(value="/view_update_LDP_SL")
    public ModelAndView view_update_LDP_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("LDP_SL_OBJ") LandPackageServiceLineVO ldpServiceLineVO,  BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	//List<SupplierObj> ldpSupplierVoList = supplierService.find_Active_Service_Based_Suppliers("LDP");
     	//List<TgSupplierMasterVO> ldpSupplierVoList = supplierService.find_Active_Package_Suppliers();
    	SearchSupplierObj searchSupplierObj = new SearchSupplierObj();
    	searchSupplierObj.setConsolidator(true);
    	searchSupplierObj.setLandPackage(true);
    	searchSupplierObj.setSortBy("supplierName");
    	searchSupplierObj.setServiceCityId(ldpServiceLineVO.getDestinationId());
    	List<Tg_Supplier_Master_Entity> supplierResult =supplierService.find_filtered_suppliers(searchSupplierObj);
    	
    	Map supplierMap = new LinkedHashMap<>();
    	for(Tg_Supplier_Master_Entity supplierMaster:supplierResult) {
    		supplierMap.put(supplierMaster.getSupplierId(), supplierMaster.getSupplierName());
    	}
    	
    	List<UdnDealStatusVO> ldp_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_LDP_SL_OBJ);
    	Map ldp_sl_wl_statusMap = new LinkedHashMap<>();
    	for(UdnDealStatusVO statusVO: ldp_sl_wl_statusList) {
    		ldp_sl_wl_statusMap.put(statusVO.getWorkloadStatusId(), statusVO.getWorkloadStatusName());
    	}
    	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,UdanChooConstants.WORKLOAD_LDP_CODE,userObj.getUserId(),isAdmin);

    	ModelAndView modelView =view_view_LDP_SL(dealConfirmationId,ldpServiceLineVO,null);
    	modelView.addObject("LDP_SUPPLIER_MAP", supplierMap);
    	modelView.addObject("LDP_SL_STATUS_MAP", ldp_sl_wl_statusMap);
    	
    	modelView.addObject("LDP_TYPE", UdanChooConstants.LDP_TYPE); 
    	modelView.setViewName("workload/landpackage/form_update_WorkLoad_LandPackage");
    	return modelView;
    }
    
    //@PostMapping("/workload/view_delete_ldp_sl_confirmation")
    @PostMapping("/view_delete_ldp_sl_confirmation")
   	public ModelAndView view_delete_ldp_sl_confirmation(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("LDP_SL_OBJ") LandPackageServiceLineVO ldpServiceLineVO)
   	{
    	//System.out.println("LDP Vo to delete is " + ldpServiceLineVO);
    	ModelAndView modelView  = view_view_LDP_SL(dealConfirmationId,ldpServiceLineVO,null);
    	modelView.setViewName("workload/landpackage/form_LandPackage_SL_Del_Confirmation");
    	
       	return modelView;
   	}

    //@PostMapping("/workload/delete_LDP_SL")
    @PostMapping("/delete_LDP_SL")
  	public ModelAndView delete_LDP_SL(@RequestParam(value = "ldpServiceId") long ldpServiceId,@RequestParam("dealConfirmationId") long dealConfirmationId)
  	{
      
      	boolean isSuccess = false;
      	try {
      		dealServiceLine.delete_LandPackage_ServiceLine(ldpServiceId);
      		isSuccess=true;
  		} catch (RecordNotFoundException e) {
  			isSuccess = false;
  		}
      	
      	ModelAndView mapview = view_workload_createNewWorkLoad_LDP(dealConfirmationId,null,null);
      	if(isSuccess) {
      		mapview.addObject("Success", "LandPackage Service Line Record Deleted Successfully. !!");
      	}else {
      		mapview.addObject("Error", "Error: Deleting the Land Package Service Line. Please contact administrator!! ");
      	}
      	return mapview;
  	}

    /************************************* Other Service Handling Code Starts from here *****************************/ 
    //@RequestMapping("/workload/view_workload_OTH")
    @RequestMapping("/view_workload_OTH")
   	public ModelAndView view_workload_OTH(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("flightworkloadRecorder") Udn_WL_FLT_Recorder_Obj flightWlRecorder,  BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	ModelAndView mapview = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	List othServiceLineList = dealServiceLine.find_OTH_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
    	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,UdanChooConstants.WORKLOAD_OTH_CODE,userObj.getUserId(),isAdmin);
    	//System.out.println("Service Map Object is " + serviceMap.getServiceMapId() );

    	
    	mapview.addObject("OTH_SL_LIST", othServiceLineList);
    	mapview.addObject("dealConfirmationId",dealConfirmationId);
    	mapview.addObject("serviceMapId", serviceMap.getServiceMapId());
    	mapview.addObject("OTH_SL_ACTION", "VIEW");
    	mapview.setViewName("workload/other/form_createWokLoad_Other");
    	//ModelAndView mapview = new ModelAndView("workload/form_createWokLoad_Flight");
    	return mapview;
    }
    
 
    
    //@PostMapping(value="/workload/view_create_workload_form_OTH")
    @PostMapping(value="/view_create_workload_form_OTH")
    public ModelAndView createWorkLoad_OTH(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("OTH_SL_OBJ") OtherServiceLineVO othServiceLineVO,  BindingResult result) {
    	//if(result.hasErrors()) {
    	//List otherSupplierVoList = supplierService.find_Active_Service_Based_Suppliers("OTH");
    	SearchSupplierObj searchSupplierObj = new SearchSupplierObj();
    	searchSupplierObj.setConsolidator(true);
    	searchSupplierObj.setOthers(true);
    	searchSupplierObj.setSortBy("supplierName");
    	List<Tg_Supplier_Master_Entity> supplierResult =supplierService.find_filtered_suppliers(searchSupplierObj);
    	
    	Map supplierMap = new LinkedHashMap<>();
    	for(Tg_Supplier_Master_Entity supplierMaster:supplierResult) {
    		supplierMap.put(supplierMaster.getSupplierId(), supplierMaster.getSupplierName());
    	}
    	
    	List<UdnDealStatusVO> oth_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_OTH_SL_OBJ);
    	Map oth_sl_wl_statusMap = new LinkedHashMap<>();
    	for(UdnDealStatusVO statusVO: oth_sl_wl_statusList) {
    		oth_sl_wl_statusMap.put(statusVO.getWorkloadStatusId(), statusVO.getWorkloadStatusName());
    	}
    	
    	
    	
    	ModelAndView mapview = view_workload_OTH(dealConfirmationId,null,null); 
    	mapview.addObject("OTH_SL_ACTION", "ADD");
    	

    	mapview.addObject("OTH_SUPPLIER_MAP", supplierMap);
    	mapview.addObject("OTH_SL_STATUS_MAP", oth_sl_wl_statusMap);
    	return mapview;
    }
    
    //@PostMapping(value="/workload/create_workload_OTH_SL")
    @PostMapping(value="/create_workload_OTH_SL")
    public ModelAndView create_workload_OTH_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("OTH_SL_OBJ") @Valid OtherServiceLineVO othServiceLineVO,  BindingResult result,final RedirectAttributes redirectAttrib) {
    	ModelAndView mapview = new ModelAndView();
    	
    	if(!result.hasErrors()) {
    		UserDetailsObj userObj = getLoggedInUser();
    		//othServiceLineVO.setServiceLineOwner(userObj.getUserId());
    		Udn_Deal_OTH_SL_Entity otherSLEntity = new Udn_Deal_OTH_SL_Entity(othServiceLineVO);
    	   dealServiceLine.saveOtherServiceLine(otherSLEntity);
    	   //mapview = view_workload_OTH(dealConfirmationId,null,null);
    	   mapview.setViewName("redirect:view_workload_OTH?dealConfirmationId="+dealConfirmationId);
    	   redirectAttrib.addFlashAttribute("Success", "Other Service Line Record Created Successfully. !!");
    	}else {
    		mapview = createWorkLoad_OTH(dealConfirmationId,null,null);
    		redirectAttrib.addFlashAttribute("Error", "Error While Creating Other Service. Contact Administrator !!");
    	}
    	
  
    	return mapview;
    }
  
    
    @PostMapping(value="/edit_edit_workload_OTH_SL")
    public ModelAndView edit_edit_workload_OTH_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("OTH_SL_OBJ") @Valid OtherServiceLineVO othServiceLineVO,  BindingResult result,final RedirectAttributes redirectAttrib) {
    	ModelAndView mapview = new ModelAndView();
    	if(!result.hasErrors()) {
    		UserDetailsObj userObj = getLoggedInUser();
    		//othServiceLineVO.setServiceLineOwner(userObj.getUserId());
    		//OtherServiceLineVO othOrgEntityVo = dealServiceLine.findByOTH_SL_ID(othServiceLineVO);
    		//othServiceLineVO.setServiceLineOwner(othOrgEntityVo.getServiceLineOwner());
    		Udn_Deal_OTH_SL_Entity otherSLEntity = new Udn_Deal_OTH_SL_Entity(othServiceLineVO);
    		dealServiceLine.saveOtherServiceLine(otherSLEntity);
    		//mapview = view_workload_OTH(dealConfirmationId,null,null);
    		mapview.setViewName("redirect:view_workload_OTH?dealConfirmationId="+dealConfirmationId);
    		redirectAttrib.addFlashAttribute("Success", "Other Service Line Record Updated Successfully. !!");
    		
    	}else {
    		mapview = createWorkLoad_OTH(dealConfirmationId,null,null);
       		redirectAttrib.addFlashAttribute("Error", "Error: Updating the Other Service Line. Please contact administrator!! ");
    	}
    	
  
    	return mapview;
    }
  
    
    //@PostMapping(value="/workload/view_update_workload_form_OTH")
    @PostMapping(value="/view_update_workload_form_OTH")
    public ModelAndView updateWorkLoad_OTH(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("OTH_SL_OBJ") OtherServiceLineVO othServiceLineVO,  BindingResult result) {
    	ModelAndView mapView = createWorkLoad_OTH(dealConfirmationId,null,null);
    	mapView.addObject("OTH_SL_ACTION", "UPDATE");
    	OtherServiceLineVO orgFltSLVo = dealServiceLine.findByOTH_SL_ID(othServiceLineVO);
    	//mapView.addObject("ORG_OTH_SL_VO", orgFltSLVo);
    	return mapView;
    	
    }
    
    //@PostMapping("/workload/view_delete_oth_sl_confirmation")
    @PostMapping("/view_delete_oth_sl_confirmation")
   	public ModelAndView view_delete_oth_sl_confirmation(@RequestParam(value = "othServiceId") int othServiceId,@RequestParam("dealConfirmationId") long dealConfirmationId)
   	{
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	OtherServiceLineVO othSLVoToDel = new OtherServiceLineVO(); 
    	othSLVoToDel.setOthServiceId(othServiceId);
    	othSLVoToDel = dealServiceLine.findByOTH_SL_ID(othSLVoToDel);
		modelView.addObject("othSLObj", othSLVoToDel);
		modelView.addObject("dealConfirmationId",dealConfirmationId);
        
        modelView.setViewName("workload/form_Other_SL_Del_Confirmation");
       	return modelView;
   	}
  
    //@PostMapping("/workload/delete_OTH_SL")
    @PostMapping("/delete_OTH_SL")
   	public ModelAndView delete_OTH_SL(@RequestParam(value = "othServiceId") int othServiceId,@RequestParam("dealConfirmationId") long dealConfirmationId,final RedirectAttributes redirectAttrib )
   	{
       boolean isSuccess = false;
       	try {
       		dealServiceLine.delete_Other_ServiceLine(othServiceId);
       		isSuccess=true;
   		} catch (RecordNotFoundException e) {
   			isSuccess = false;
   		}
       	
       	//ModelAndView mapview = view_workload_OTH(dealConfirmationId,null,null);
       	ModelAndView modelView = new ModelAndView();
       	modelView.setViewName("redirect:view_workload_OTH?dealConfirmationId="+dealConfirmationId);
       	if(isSuccess) {
       		redirectAttrib.addFlashAttribute("Success", "Other Service Line Record Deleted Successfully. !!");
       	}else {
       		redirectAttrib.addFlashAttribute("Error", "Error: Deleting the Other Service Line. Please contact administrator!! ");
       	}
       	return modelView;
   	}
    
    /**************************** STS SightSeeing Handling starts from here ****************************************/
    //@RequestMapping("/workload/view_workload_STS")
    @RequestMapping("/view_workload_STS")
   	public ModelAndView view_workload_STS(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("sightseeingworkloadRecorder") Udn_WL_FLT_Recorder_Obj stsWlRecorder,  BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	
    	ModelAndView mapview = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	List<SightSeeingServiceLineVO> stsServiceLineList;
		try {
			stsServiceLineList = dealServiceLine.find_STS_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
	    	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,"STS",userObj.getUserId(),isAdmin);
	    	mapview.addObject("STS_SL_LIST", stsServiceLineList);
	    	mapview.addObject("dealConfirmationId",dealConfirmationId);
	    	mapview.addObject("serviceMapId", serviceMap.getServiceMapId());
	    	mapview.addObject("TRANSFER_TYPE_MAP", UdanChooConstants.TRANSFER_TYPE_MODE);
	    	mapview.addObject("STS_SL_ACTION", "VIEW");
	    	//mapview.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm"));
	    	mapview.setViewName("workload/sightseeing/form_createWokLoad_SightSeeing");
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return mapview;
    }
    
    //@PostMapping(value="/workload/view_create_workload_form_STS")
    @PostMapping(value="/view_create_workload_form_STS")
    public ModelAndView view_create_workload_form_STS(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("STS_SL_OBJ") SightSeeingServiceLineVO stsServiceLineVO,  BindingResult result) {
    	//List sightSeeingSupplierVoList = supplierService.find_Active_Service_Based_Suppliers("STS");
    	//List sightSeeingSupplierVoList = supplierService.find_Active_SightSeeing_Suppliers();
    	SearchSupplierObj searchSupplierObj = new SearchSupplierObj();
    	searchSupplierObj.setConsolidator(true);
    	searchSupplierObj.setLandPackage(true);
    	searchSupplierObj.setSightseeing(true);;
    	searchSupplierObj.setSortBy("supplierName");
    	searchSupplierObj.setServiceCityId(stsServiceLineVO.getCityId());
    	
    	List<Tg_Supplier_Master_Entity> supplierResult =supplierService.find_filtered_suppliers(searchSupplierObj);
    	
    	Map supplierMap = new LinkedHashMap<>();
    	for(Tg_Supplier_Master_Entity supplierMaster:supplierResult) {
    		supplierMap.put(supplierMaster.getSupplierId(), supplierMaster.getSupplierName());
    	}
    	
    	
    	
    	List<UdnDealStatusVO> sts_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_STS_SL_OBJ);
    	Map sts_sl_wl_statusMap = new LinkedHashMap<>();
    	for(UdnDealStatusVO statusVO: sts_sl_wl_statusList) {
    		sts_sl_wl_statusMap.put(statusVO.getWorkloadStatusId(), statusVO.getWorkloadStatusName());
    	}
    	
    	
    	ModelAndView mapview = view_workload_STS(dealConfirmationId,null,null); 
    	mapview.addObject("STS_SL_ACTION", "ADD");
    	//mapview.addObject("TRN_TYPE", UdanChooConstants.TRN_TYPE);
    	mapview.addObject("STS_SUPPLIER_MAP", supplierMap);
    	mapview.addObject("STS_SL_STATUS_MAP", sts_sl_wl_statusMap);
    	return mapview;
    }    
    
    //@PostMapping(value="/workload/create_workload_STS_SL")
    @PostMapping(value="/create_workload_STS_SL")
    public ModelAndView create_workload_STS_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("STS_SL_OBJ") @Valid SightSeeingServiceLineVO stsServiceLineVO,  BindingResult result) {
    	ModelAndView mapview = new ModelAndView();
    	UserDetailsObj userObj = getLoggedInUser();
    	if(!commonService.existsByDestinationIdAndCityName(stsServiceLineVO.getCityId(), stsServiceLineVO.getCityName())) {
			result.rejectValue("cityName", "city.error");
		}
    	if((stsServiceLineVO.getAdults() + stsServiceLineVO.getChildren() +stsServiceLineVO.getInfants())<=0) {
    		result.rejectValue("adults", "paxcount.error");
    	}
    	if(!result.hasErrors()) {
    		//System.out.println("No Error Found. Create HTL Service Line here. ");
    		//stsServiceLineVO.setServiceLineOwner(userObj.getUserId());
    		Udn_Deal_STS_SL_Entity sightSeeingSLEntity = new Udn_Deal_STS_SL_Entity(stsServiceLineVO);
    		dealServiceLine.saveSightSeeingServiceLine(sightSeeingSLEntity);
    		mapview.addObject("Success", "Sight Seeing Service Line Record Updated Successfully. !!");
    		mapview.setViewName("redirect:view_workload_STS?dealConfirmationId="+dealConfirmationId);

    	}else {
    		
    		mapview=view_create_workload_form_STS(dealConfirmationId, stsServiceLineVO, null);
    		//mapview = createWorkLoad_FLT(dealConfirmationId,null,null);
    	}

    	
    	return mapview;
    }

    
    @PostMapping(value="/edit_edit_workload_STS_SL")
    public ModelAndView edit_edit_workload_STS_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("STS_SL_OBJ") @Valid SightSeeingServiceLineVO stsServiceLineVO,  BindingResult result) {
    	ModelAndView mapview = new ModelAndView();
    	UserDetailsObj userObj = getLoggedInUser();
    	if(!commonService.existsByDestinationIdAndCityName(stsServiceLineVO.getCityId(), stsServiceLineVO.getCityName())) {
			result.rejectValue("cityName", "city.error");
		}
    	if((stsServiceLineVO.getAdults() + stsServiceLineVO.getChildren() +stsServiceLineVO.getInfants())<=0) {
    		result.rejectValue("adults", "paxcount.error");
    	}

    	
    	if(!result.hasErrors()) {
    		//System.out.println("No Error Found. Create HTL Service Line here. ");
    		//stsServiceLineVO.setServiceLineOwner(userObj.getUserId());
    		//SightSeeingServiceLineVO stsOrgEntityVo;
    		Udn_Deal_STS_SL_Entity sightSeeingSLEntity = new Udn_Deal_STS_SL_Entity(stsServiceLineVO);
    		dealServiceLine.saveSightSeeingServiceLine(sightSeeingSLEntity);
    		mapview.addObject("Success", "Sight Seeing Service Line Record Updated Successfully. !!");
    		mapview.setViewName("redirect:view_workload_STS?dealConfirmationId="+dealConfirmationId);
    	}else {
    		SightSeeingServiceLineVO slTempVO = new SightSeeingServiceLineVO();
    		slTempVO.setCityId(stsServiceLineVO.getCityId());
    		slTempVO.setStsServiceId(stsServiceLineVO.getStsServiceId());
    		mapview=view_update_workload_form_STS(dealConfirmationId, slTempVO, null)	;
    		//mapview = createWorkLoad_FLT(dealConfirmationId,null,null);
    	}
    	
    	return mapview;
    }

    
    //@PostMapping(value="/workload/view_update_workload_form_STS")
    @PostMapping(value="/view_update_workload_form_STS")
    public ModelAndView view_update_workload_form_STS(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("STS_SL_OBJ") SightSeeingServiceLineVO stsServiceLineVO,  BindingResult result) {
    	ModelAndView mapView = view_create_workload_form_STS(dealConfirmationId,stsServiceLineVO,null);
    	mapView.addObject("STS_SL_ACTION", "UPDATE");
    	//mapView.addObject("TRN_TYPE", UdanChooConstants.TRN_TYPE);
    	SightSeeingServiceLineVO orgSTSSLVo = null;
		try {
			orgSTSSLVo = dealServiceLine.findBySTS_SL_ID(stsServiceLineVO);
			//mapView.addObject("TRN_TYPE", UdanChooConstants.TRN_TYPE);
			//mapView.addObject("ORG_STS_SL_VO", orgSTSSLVo);
		
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return mapView;
    }
    
    //@PostMapping("/workload/view_delete_sts_sl_confirmation")
    @PostMapping("/view_delete_sts_sl_confirmation")
   	public ModelAndView view_delete_sts_sl_confirmation(@ModelAttribute("STS_SL_OBJ")  SightSeeingServiceLineVO stsSLVoToDel,@RequestParam("dealConfirmationId") long dealConfirmationId)
   	{
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
        
    	//SightSeeingServiceLineVO stsSLVoToDel;
		try {
			stsSLVoToDel = dealServiceLine.findBySTS_SL_ID(stsSLVoToDel);
			modelView.addObject("stsSLObj", stsSLVoToDel);
			//modelView.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm"));
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		modelView.addObject("dealConfirmationId",dealConfirmationId);
        
        modelView.setViewName("workload/form_SightSeeing_SL_Del_Confirmation");
       	return modelView;
   	}
    
    //@PostMapping("/workload/delete_STS_SL")
    @PostMapping("/delete_STS_SL")
   	public ModelAndView delete_STS_SL(@RequestParam(value = "stsServiceId") long stsServiceId,@RequestParam("dealConfirmationId") long dealConfirmationId,final RedirectAttributes redirectAttrib)
   	{
       boolean isSuccess = false;
       	try {
       		dealServiceLine.delete_SightSeeing_ServiceLine(stsServiceId);
       		isSuccess=true;
   		} catch (RecordNotFoundException e) {
   			isSuccess = false;
   		}
       	
       	//ModelAndView mapview = view_workload_STS(dealConfirmationId,null,null);
       	ModelAndView mapview = new ModelAndView(); 
       	mapview.setViewName("redirect:view_workload_STS?dealConfirmationId="+dealConfirmationId);
       	if(isSuccess) {
       		redirectAttrib.addFlashAttribute("Success", "Sight Seeing Service Line Record Deleted Successfully. !!");
       	}else {
       		redirectAttrib.addFlashAttribute("Error", "Error: Deleting the Sight Seeing Service Line. Please contact administrator!! ");
       	}
       	return mapview;
   	}

 

   	//@RequestMapping("/workload/view_search_sightseeing_master")
    @RequestMapping("/view_search_sightseeing_master")
   	public ModelAndView view_search_sight_seeing_form(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("search_sight_seeing_obj") Udn_SightSeeing_Master_Obj sightSeeingObj, BindingResult result ) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = view_workload_STS(dealConfirmationId,null,null);
    	modelView.setViewName("workload/sightseeing/form_search_SightSeeing_master");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
     	return modelView;
    }
   
    //@PostMapping(value="/workload/search_wl_sight_seeing_master")
    @PostMapping(value="/search_wl_sight_seeing_master")
    public ModelAndView search_search_sight_seeing(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("sight_seeing_search_result") SearchSightSeeingObj searchSightSeeingObj) {
    	ModelAndView mapview = new ModelAndView();
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	modelView.setViewName("workload/sightseeing/form_workload_searchSightSeeing_Result");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	List<Udn_SightSeeing_Master_Obj> filteredSightSeeingList = sightSeeingService.searchSightSeeing(searchSightSeeingObj);
    	modelView.addObject("STS_SEARCH_RESULT", filteredSightSeeingList);
    	return modelView;
    }
    
    //@PostMapping("/workload/view_view_wl_sight_seeing_details")
    @PostMapping("/view_view_wl_sight_seeing_details")
    public ModelAndView view_view_wl_sight_seeing_details(@RequestParam("sightSeeingId") long sightSeeingId,@RequestParam("dealConfirmationId") long dealConfirmationId) {
    	Udn_SightSeeing_Master_Obj sightSeeingMasterObj = null;
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	modelView.setViewName("workload/sightseeing/workload_view_SightSeeing");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	try {
    		sightSeeingMasterObj= sightSeeingService.find_SightSeeingById(sightSeeingId); 
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}
    	modelView.addObject("sightSeeingMasterObj", sightSeeingMasterObj);
    	return modelView;
    }
    
    //@PostMapping("/workload/view_add_wl_sight_seeing_itenerary")
    @PostMapping("/view_add_wl_sight_seeing_itenerary")
    public ModelAndView view_add_wl_sight_seeing_itenerary(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("STS_SL_OBJ") SightSeeingServiceLineVO stsServiceLineVO) {
    	ModelAndView mapview = new ModelAndView();
    	mapview.setViewName("forward:view_create_workload_form_STS");
    	return mapview;
    }
    
    /**************************** TRN SightSeeing Handling starts from here ****************************************/
    //@RequestMapping("/workload/view_workload_TRN")
    @RequestMapping("/view_workload_TRN")
	public ModelAndView view_workload_TRN(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("sightseeingworkloadRecorder") Udn_WL_FLT_Recorder_Obj stsWlRecorder,  BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	ModelAndView mapview = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	List<TransferServiceLineVO> trnServiceLineList;
		try {
			trnServiceLineList = dealServiceLine.find_TRN_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
	    	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,"TRN",userObj.getUserId(),isAdmin);
	    	mapview.addObject("TRN_SL_LIST", trnServiceLineList);
	    	mapview.addObject("dealConfirmationId",dealConfirmationId);
	    	mapview.addObject("serviceMapId", serviceMap.getServiceMapId());
	    	mapview.addObject("TRN_SL_ACTION", "VIEW");
	    	//mapview.addObject("TRANSFER_POINT_MAP", UdanChooConstants.TRANSFER_POINT_MAP);
	    	//mapview.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm"));
	    	mapview.setViewName("workload/transfer/form_createWokLoad_Transfer");
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return mapview;
    }
    
    //@PostMapping(value="/workload/view_create_workload_form_TRN")
    @PostMapping(value="/view_create_workload_form_TRN")
    public ModelAndView view_create_workload_form_TRN(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("TRN_SL_OBJ") TransferServiceLineVO trnServiceLineVO,  BindingResult result) {
    	//List transferSupplierVoList = supplierService.find_Active_Service_Based_Suppliers("TRN");
    	//List transferSupplierVoList = supplierService.find_Active_Transfers_Suppliers();
    	//List trn_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_TRN_SL_OBJ);
    	
    	SearchSupplierObj searchSupplierObj = new SearchSupplierObj();
    	searchSupplierObj.setConsolidator(true);
    	searchSupplierObj.setLandPackage(true);
    	searchSupplierObj.setTransfers(true);
    	searchSupplierObj.setSortBy("supplierName");
    	searchSupplierObj.setServiceCityId(trnServiceLineVO.getPickupCityId());
    	
    	List<Tg_Supplier_Master_Entity> supplierResult =supplierService.find_filtered_suppliers(searchSupplierObj);
    	
    	Map supplierMap = new LinkedHashMap<>();
    	for(Tg_Supplier_Master_Entity supplierMaster:supplierResult) {
    		supplierMap.put(supplierMaster.getSupplierId(), supplierMaster.getSupplierName());
    	}
    	
    	
    	
    	List<UdnDealStatusVO> trn_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_TRN_SL_OBJ);
    	Map trn_sl_wl_statusMap = new LinkedHashMap<>();
    	for(UdnDealStatusVO statusVO: trn_sl_wl_statusList) {
    		trn_sl_wl_statusMap.put(statusVO.getWorkloadStatusId(), statusVO.getWorkloadStatusName());
    	}

    	
    	
    	

    	ModelAndView mapview = view_workload_TRN(dealConfirmationId,null,null); 
    	mapview.addObject("TRN_SL_ACTION", "ADD");
    	mapview.addObject("TRN_TYPE", UdanChooConstants.TRN_TYPE);
    	mapview.addObject("TRN_SUPPLIER_MAP", supplierMap);
    	mapview.addObject("TRN_SL_STATUS_MAP", trn_sl_wl_statusMap);
    	mapview.addObject("TRANSFER_POINT_MAP", UdanChooConstants.TRANSFER_POINT_MAP);
    	mapview.addObject("TRANSFER_TYPE_MAP", UdanChooConstants.TRANSFER_TYPE_MODE);
    	
    	return mapview;
    }    
    
    
    
    //@PostMapping(value="/workload/create_workload_TRN_SL")
    @PostMapping(value="/create_workload_TRN_SL")
    public ModelAndView create_workload_TRN_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("TRN_SL_OBJ") @Valid TransferServiceLineVO trnServiceLineVO,  BindingResult result,final RedirectAttributes redirectAttrib) {
    	ModelAndView mapview = new ModelAndView();
    	UserDetailsObj userObj = getLoggedInUser();
    	if(!commonService.existsByDestinationIdAndCityName(trnServiceLineVO.getPickupCityId(), trnServiceLineVO.getPickupCityName())) {
			result.rejectValue("pickupCityName", "city.error");
		}
    	if(!commonService.existsByDestinationIdAndCityName(trnServiceLineVO.getDropCityId(), trnServiceLineVO.getDropCityName())) {
			result.rejectValue("dropCityName", "city.error");
		}

    	if((trnServiceLineVO.getAdults() + trnServiceLineVO.getChildren() +trnServiceLineVO.getInfants())<=0) {
    		result.rejectValue("adults", "paxcount.error");
    	}

    	
    	if(!result.hasErrors()) {
    		Udn_Deal_TRN_SL_Entity transferSLEntity = new Udn_Deal_TRN_SL_Entity(trnServiceLineVO);
    		dealServiceLine.saveTransferServiceLine(transferSLEntity);
    		redirectAttrib.addFlashAttribute("Success", "Transfer Service Line Record Updated Successfully. !!");
    		mapview.setViewName("redirect:view_workload_TRN?dealConfirmationId="+dealConfirmationId);
    	}else {
    		TransferServiceLineVO tmpServiceLineVO = new TransferServiceLineVO ();
    		tmpServiceLineVO.setTrnServiceId(trnServiceLineVO.getTrnServiceId());
    		mapview = view_create_workload_form_TRN(dealConfirmationId,tmpServiceLineVO,  null); 

    	}
    	
    	return mapview;
    }

    
    @PostMapping(value="/edit_edit_workload_TRN_SL")
    public ModelAndView edit_edit_workload_TRN_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("TRN_SL_OBJ") @Valid TransferServiceLineVO trnServiceLineVO,  BindingResult result,final RedirectAttributes redirectAttrib) {
    	ModelAndView mapview = new ModelAndView();
    	UserDetailsObj userObj = getLoggedInUser();
    	
    	if(!commonService.existsByDestinationIdAndCityName(trnServiceLineVO.getPickupCityId(), trnServiceLineVO.getPickupCityName())) {
			result.rejectValue("pickupCityName", "city.error");
		}
    	if(!commonService.existsByDestinationIdAndCityName(trnServiceLineVO.getDropCityId(), trnServiceLineVO.getDropCityName())) {
			result.rejectValue("dropCityName", "city.error");
		}

    	if((trnServiceLineVO.getAdults() + trnServiceLineVO.getChildren() +trnServiceLineVO.getInfants())<=0) {
    		result.rejectValue("adults", "paxcount.error");
    	}

    	
    	if(!result.hasErrors()) {
    		Udn_Deal_TRN_SL_Entity transferSLEntity = new Udn_Deal_TRN_SL_Entity(trnServiceLineVO);
    		dealServiceLine.saveTransferServiceLine(transferSLEntity);
    		redirectAttrib.addFlashAttribute("Success", "Transfer Service Line Record Updated Successfully. !!");
    		mapview.setViewName("redirect:view_workload_TRN?dealConfirmationId="+dealConfirmationId);
    	}else {
    		TransferServiceLineVO tmpServiceLineVO = new TransferServiceLineVO ();
    		tmpServiceLineVO.setTrnServiceId(trnServiceLineVO.getTrnServiceId());
    		mapview = view_update_workload_form_TRN(dealConfirmationId,tmpServiceLineVO,  null); 
    	}
    	
    	return mapview;
    }

    
    //@PostMapping(value="/workload/view_update_workload_form_TRN")
    @PostMapping(value="/view_update_workload_form_TRN")
    public ModelAndView view_update_workload_form_TRN(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("TRN_SL_OBJ") TransferServiceLineVO trnServiceLineVO,  BindingResult result) {
    	ModelAndView mapView = view_create_workload_form_TRN(dealConfirmationId,trnServiceLineVO,null);
    	mapView.addObject("TRN_SL_ACTION", "UPDATE");
    	//mapView.addObject("TRN_TYPE", UdanChooConstants.TRN_TYPE);
    	//TransferServiceLineVO orgTRNSLVo = null;
		try {
			trnServiceLineVO = dealServiceLine.findByTRN_SL_ID(trnServiceLineVO);
			mapView.addObject("TRANSFER_TYPE_MODE", UdanChooConstants.TRANSFER_TYPE_MODE);
			//mapView.addObject("ORG_TRN_SL_VO", orgTRNSLVo);
		
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return mapView;
    }
    
    //@PostMapping("/workload/view_delete_trn_sl_confirmation")
    @PostMapping("/view_delete_trn_sl_confirmation")
   	public ModelAndView view_delete_trn_sl_confirmation(@ModelAttribute("TRN_SL_OBJ") TransferServiceLineVO trnServiceLineVO,@RequestParam("dealConfirmationId") long dealConfirmationId)
   	{
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
        
    	TransferServiceLineVO trnSLVoToDel = new TransferServiceLineVO();
		try {
			trnSLVoToDel = dealServiceLine.findByTRN_SL_ID(trnServiceLineVO);
			modelView.addObject("trnSLObj", trnSLVoToDel);
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		modelView.addObject("dealConfirmationId",dealConfirmationId);
        
        modelView.setViewName("workload/form_Transfer_SL_Del_Confirmation");
       	return modelView;
   	}

    //@PostMapping("/workload/delete_TRN_SL")
    @PostMapping("/delete_TRN_SL")
   	public ModelAndView delete_TRN_SL(@RequestParam(value = "trnServiceId") long trnServiceId,@RequestParam("dealConfirmationId") long dealConfirmationId,final RedirectAttributes redirectAttrib)
   	{
       boolean isSuccess = false;
      try {
       		dealServiceLine.delete_Transfer_ServiceLine(trnServiceId);
       		isSuccess=true;
   		} catch (RecordNotFoundException e) {
   			isSuccess = false;
   		}
       	
       	//ModelAndView mapview = view_workload_TRN(dealConfirmationId,null,null);
      	ModelAndView mapview = new ModelAndView();  	
    	mapview.setViewName("redirect:view_workload_TRN?dealConfirmationId="+dealConfirmationId);
       	
      	if(isSuccess) {
      		redirectAttrib.addFlashAttribute("Success", "Transfer Service Line Record Deleted Successfully. !!");
       	}else {
       		redirectAttrib.addFlashAttribute("Error", "Error: Deleting the Transfer Service Line. Please contact administrator!! ");
       	}
       	return mapview;
   	}
    
    /********************************* VISA Processing Starts from here **************************************/ 
    
    
    //@RequestMapping("/workload/view_workload_VSA")
    @RequestMapping("/view_workload_VSA")
   	public ModelAndView view_workload_createNewWorkLoad_VSA(@RequestParam("dealConfirmationId") long dealConfirmationId) {
    	UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	ModelAndView mapview = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	
    	List vsaServiceLineList = dealServiceLine.find_VSA_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
    	//System.out.println("List Size REtreieved is " + vsaServiceLineList );
    	//System.out.println("Based on Deal Id is invoked and Admin Flag is " + isAdmin);
    			
    	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,UdanChooConstants.WORKLOAD_VSA_CODE,userObj.getUserId(),isAdmin);
    	mapview.addObject("VSA_SL_LIST", vsaServiceLineList);
    	mapview.addObject("dealConfirmationId",dealConfirmationId);
    	mapview.addObject("serviceMapId", serviceMap.getServiceMapId());
    	mapview.addObject("VSA_SL_LIST", vsaServiceLineList);
    	mapview.addObject("VSA_SL_ACTION", "VIEW");
    	mapview.addObject("VISA_PROFILE", UdanChooConstants.VISA_PROFILE);
    	mapview.addObject("VISA_TYPE", UdanChooConstants.VISA_TYPE);
    	mapview.addObject("VISA_PURPOSE", UdanChooConstants.VISA_PURPOSE);

    	mapview.setViewName("workload/visa/view_list_createWokLoad_Visa");
    	return mapview;
    }
   
    
    //@PostMapping(value="/workload/view_form_create_workload_VSA_SL")
    @PostMapping(value="/view_form_create_workload_VSA_SL")
    public ModelAndView view_form_create_workload_VSA_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("VSA_SL_OBJ") VisaServiceLineVO vsaServiceLineVO,  BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	ModelAndView modelView = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	//List visaSupplierVoList = supplierService.find_Active_Service_Based_Suppliers("VSA");
    	//List visaSupplierVoList = supplierService.find_Active_Visa_Suppliers();
    	SearchSupplierObj searchSupplierObj = new SearchSupplierObj();
    	searchSupplierObj.setVisa(true);
    	searchSupplierObj.setSortBy("supplierName");
    	//searchSupplierObj.setServiceCityId(ldpServiceLineVO.getDestinationId());
    	List<Tg_Supplier_Master_Entity> supplierResult =supplierService.find_filtered_suppliers(searchSupplierObj);
     	
     	//List visaSupplierVoList = supplierService.find_Active_Visa_Suppliers();
    	Map mapVisaSuppliers = new LinkedHashMap ();
    	for(Tg_Supplier_Master_Entity supplierEntity: supplierResult) {
    		mapVisaSuppliers.put(supplierEntity.getSupplierId(), supplierEntity.getSupplierName());
    	}
    	
    	//List vsa_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_VSA_SL_OBJ);
    	List<UdnDealStatusVO> vsa_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_VSA_SL_OBJ);
     	Map visaWLStatusMap = new LinkedHashMap ();
    	for(UdnDealStatusVO statusObj: vsa_sl_wl_statusList) {
    		visaWLStatusMap.put(statusObj.getWorkloadStatusId(), statusObj.getWorkloadStatusName());
    	}
    	
    	
    	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,"VSA",userObj.getUserId(),isAdmin);
    	modelView.setViewName("workload/visa/form_createWorkLoad_Visa");
    	modelView.addObject("dealConfirmationId",dealConfirmationId);
    	modelView.addObject("serviceMapId", serviceMap.getServiceMapId());
    	modelView.addObject("VISA_PROFILE", UdanChooConstants.VISA_PROFILE);
    	modelView.addObject("VISA_TYPE", UdanChooConstants.VISA_TYPE);
    	modelView.addObject("VISA_PURPOSE", UdanChooConstants.VISA_PURPOSE);
    	modelView.addObject("VSA_SUPPLIER_MAP", mapVisaSuppliers);
    	modelView.addObject("VSA_SL_STATUS_MAP", visaWLStatusMap);
    	modelView.addObject("VSA_SL_ACTION", "ADD");
    	return modelView;
    }
    
    //@PostMapping(value="/workload/view_form_update_workload_VSA_SL")
    @PostMapping(value="/view_form_update_workload_VSA_SL")
    public ModelAndView view_form_update_workload_VSA_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@RequestParam("vsaServiceId") long vsaServiceId,@ModelAttribute("VSA_SL_OBJ") VisaServiceLineVO vsaServiceLineVO,  BindingResult result) {
    	//ModelAndView modelView = view_form_create_workload_VSA_SL(dealConfirmationId,vsaServiceLineVO,result); 
    	UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	
    	//List visaSupplierVoList = supplierService.find_Active_Service_Based_Suppliers("VSA");
     	
     	SearchSupplierObj searchSupplierObj = new SearchSupplierObj();
    	searchSupplierObj.setVisa(true);
    	searchSupplierObj.setSortBy("supplierName");
    	//searchSupplierObj.setServiceCityId(ldpServiceLineVO.getDestinationId());
    	List<Tg_Supplier_Master_Entity> supplierResult =supplierService.find_filtered_suppliers(searchSupplierObj);
     	
     	//List visaSupplierVoList = supplierService.find_Active_Visa_Suppliers();
    	Map mapVisaSuppliers = new LinkedHashMap ();
    	for(Tg_Supplier_Master_Entity supplierEntity: supplierResult) {
    		mapVisaSuppliers.put(supplierEntity.getSupplierId(), supplierEntity.getSupplierName());
    	}
     	List<UdnDealStatusVO> vsa_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_VSA_SL_OBJ);
     	Map visaWLStatusMap = new LinkedHashMap ();
    	for(UdnDealStatusVO statusObj: vsa_sl_wl_statusList) {
    		visaWLStatusMap.put(statusObj.getWorkloadStatusId(), statusObj.getWorkloadStatusName());
    	}
    	
    	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,"VSA",userObj.getUserId(),isAdmin);
    	ModelAndView modelView = view_view_workload_VSA_SL(dealConfirmationId,vsaServiceLineVO);
    	modelView.addObject("VISA_PROFILE", UdanChooConstants.VISA_PROFILE);
    	modelView.addObject("VISA_TYPE", UdanChooConstants.VISA_TYPE);
    	modelView.addObject("VISA_PURPOSE", UdanChooConstants.VISA_PURPOSE);
    	modelView.addObject("VSA_SUPPLIER_MAP", mapVisaSuppliers);
    	modelView.addObject("VSA_SL_STATUS_MAP", visaWLStatusMap);
    	
    	List<Udn_Visa_Consulate_Master_Entity> consulateList = visaService.findConsulateByVisaCountryCode(vsaServiceLineVO.getCountryCode());
    	Map consulateCitiesMap = new HashMap();
    	
    	consulateCitiesMap = consulateList.stream().collect(Collectors.toMap(
    	        number -> number.getConsulateCity(),
    	        number -> commonService.findDestinationById(number.getConsulateCity()).getCityName()));
    	modelView.addObject("CONSULATE_CITIES",consulateCitiesMap);
    	
    	modelView.addObject("VSA_SL_ACTION", "UPDATE");
    	modelView.setViewName("workload/visa/form_update_workload_visa_with_docs");
    	return modelView;
    }
    
    
    //@PostMapping(value="/workload/add_add_workload_VSA_SL")
    @PostMapping(value="/add_add_workload_VSA_SL")
    public ModelAndView add_add_workload_VSA_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("VSA_SL_OBJ") VisaServiceLineVO vsaServiceLineVO,  BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	ModelAndView modelView = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,"VSA",userObj.getUserId(),isAdmin);
    	//String visaId = (vsaServiceLineVO.getCountryCode().trim()+"_"+vsaServiceLineVO.getProfile().trim()+"_"+vsaServiceLineVO.getVisaType().trim()).toLowerCase()+"_"+vsaServiceLineVO.getVisaPurpose().trim().toLowerCase();
    	
    	Udn_Destinations_Master_Obj destinationObj = new Udn_Destinations_Master_Obj();
    	destinationObj.setCountryCode(vsaServiceLineVO.getCountryCode());
    	destinationObj.setCountryName(vsaServiceLineVO.getCountryName());
    	countryCodeValidator.validate(destinationObj, result);
    	if(vsaServiceLineVO.getTravelStartDate().compareTo(vsaServiceLineVO.getTravelReturnDate())>0) {
    		result.rejectValue("travelStartDate", "travel.start.end.error");
    	}
    	Optional<Udn_Visa_Master_Entity> visaMasterOpt = visaService.findVisaEntityByCompositeUniqueKeys(vsaServiceLineVO.getCountryCode().trim(), vsaServiceLineVO.getConsulateCity(), vsaServiceLineVO.getVisaType(), vsaServiceLineVO.getVisaPurpose(),vsaServiceLineVO.getProfile());
    	if(visaMasterOpt.isPresent()) {
    		Udn_Visa_Master_Entity visaMaster =  visaMasterOpt.get();
    		vsaServiceLineVO.setVisaId(visaMaster.getVisaId());
	    	//vsaServiceLineVO.setServiceLineOwner(userObj.getUserId());
	    	if(!result.hasErrors()) {
	    		Udn_Deal_VSA_SL_Entity visaSLEntity=null;
				visaSLEntity = new Udn_Deal_VSA_SL_Entity(vsaServiceLineVO);
	    		visaSLEntity = dealServiceLine.saveVisaServiceLine(visaSLEntity);
	    		vsaServiceLineVO.setVsaServiceId(visaSLEntity.getVsaServiceId());
	    		try {
					vsaServiceLineVO = dealServiceLine.findByVSA_SL_ID(vsaServiceLineVO);
					//System.out.println("Visa document size is " + vsaServiceLineVO.getVisaDocumentEntityList().size());
					modelView.addObject("VSA_SL_ACTION", "VIEW");
					//modelView.addObject("ORG_VSA_SL_VO", vsaServiceLineVO);
		    		modelView.addObject("Success", "Visa Service Line Record Updated Successfully. !!");
		    		modelView.setViewName("redirect:view_view_workload_VSA_SL?dealConfirmationId="+dealConfirmationId+"&vsaServiceId="+vsaServiceLineVO.getVsaServiceId());
				} catch (Exception e) {
		    		modelView.addObject("Error", "Error while creating Visa Service Line Record !!");
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	    	}else {
	    		modelView = view_form_error_case_update_workload_VSA_SL(dealConfirmationId,vsaServiceLineVO,result) ;
	    		modelView.addObject("VSA_SL_ACTION", "ADD");
	    		modelView.setViewName("workload/visa/form_createWorkLoad_Visa");
	    	}
	    	modelView.addObject("serviceMapId", serviceMap.getServiceMapId());
	    	modelView.addObject("dealConfirmationId",dealConfirmationId);
	    	modelView.addObject("VISA_PROFILE", UdanChooConstants.VISA_PROFILE);
	    	modelView.addObject("VISA_TYPE", UdanChooConstants.VISA_TYPE);
	    	modelView.addObject("VISA_PURPOSE", UdanChooConstants.VISA_PURPOSE);
    	}
    	else {
    		modelView = view_form_error_case_update_workload_VSA_SL(dealConfirmationId,vsaServiceLineVO,result) ;
    		modelView.setViewName("workload/visa/form_createWorkLoad_Visa");
    		modelView.addObject("Error", "Error while Updating Visa Service Line Record !! Check Consulate Existance and other relevant fields. ");
    	}
    	return modelView;
    }
    
    //@PostMapping(value="/workload/edit_edit_workload_VSA_SL")
    @PostMapping(value="/edit_edit_workload_VSA_SL")
    public ModelAndView edit_edit_workload_VSA_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("VSA_SL_OBJ") VisaServiceLineVO vsaServiceLineVO,  BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	ModelAndView modelView = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,"VSA",userObj.getUserId(),isAdmin);
    	//String visaId = (vsaServiceLineVO.getCountryCode().trim()+"_"+vsaServiceLineVO.getProfile().trim()+"_"+vsaServiceLineVO.getVisaType().trim()).toLowerCase()+"_"+vsaServiceLineVO.getVisaPurpose().trim().toLowerCase();
    	
    	Udn_Destinations_Master_Obj destinationObj = new Udn_Destinations_Master_Obj();
    	destinationObj.setCountryCode(vsaServiceLineVO.getCountryCode());
    	destinationObj.setCountryName(vsaServiceLineVO.getCountryName());
    	countryCodeValidator.validate(destinationObj, result);
    	if(vsaServiceLineVO.getTravelStartDate().compareTo(vsaServiceLineVO.getTravelReturnDate())>0) {
    		result.rejectValue("travelStartDate", "travel.start.end.error");
    	}
    	

    	Optional<Udn_Visa_Master_Entity> visaMasterOpt = visaService.findVisaEntityByCompositeUniqueKeys(vsaServiceLineVO.getCountryCode().trim(), vsaServiceLineVO.getConsulateCity(), vsaServiceLineVO.getVisaType(), vsaServiceLineVO.getVisaPurpose(),vsaServiceLineVO.getProfile());
    	if(visaMasterOpt.isPresent()) {
    		Udn_Visa_Master_Entity visaMaster =  visaMasterOpt.get();
    		vsaServiceLineVO.setVisaId(visaMaster.getVisaId());
	    	//vsaServiceLineVO.setServiceLineOwner(userObj.getUserId());
	    	if(!result.hasErrors()) {
	    		Udn_Deal_VSA_SL_Entity visaSLEntity=null;
				try {
					visaSLEntity = dealServiceLine.findBy_VSA_SL_ID(vsaServiceLineVO.getVsaServiceId());
				} catch (RecordNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
	    		if(visaSLEntity!=null) {
	    			//vsaServiceLineVO.setServiceLineOwner(visaSLEntity.getServiceLineOwner());
	    			if(vsaServiceLineVO.getPassportExpiryDate()!=null ) {
	    				if(vsaServiceLineVO.getPassportExpiryDate().getYear()==-1899) {
	    					vsaServiceLineVO.setPassportExpiryDate(null);	
	    				}
	    			}
	    			
	    			visaSLEntity.updateFromVO(vsaServiceLineVO);
	    		}
	    		
	    		visaSLEntity = dealServiceLine.saveVisaServiceLineWithoutImport(visaSLEntity);
	    		vsaServiceLineVO.updateVOFromEntity(visaSLEntity);
	    		try {
					vsaServiceLineVO = dealServiceLine.findByVSA_SL_ID(vsaServiceLineVO);
					//System.out.println("Visa document size is " + vsaServiceLineVO.getVisaDocumentEntityList().size());
					modelView.addObject("VSA_SL_ACTION", "VIEW");
					//modelView.addObject("ORG_VSA_SL_VO", vsaServiceLineVO);
		    		modelView.addObject("Success", "Visa Service Line Record Updated Successfully. !!");
				} catch (Exception e) {
		    		modelView.addObject("Error", "Error while creating Visa Service Line Record !!");
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	    	}else {
	    		modelView = view_form_error_case_update_workload_VSA_SL(dealConfirmationId,vsaServiceLineVO,result) ;
	    		modelView.addObject("VSA_SL_ACTION", "UPDATE");
	    		System.out.println("Error Found. Form submitted have errors. ");
	    		System.out.println(result);
	    	}
	    	modelView.addObject("serviceMapId", serviceMap.getServiceMapId());
	    	modelView.addObject("dealConfirmationId",dealConfirmationId);
	    	modelView.addObject("VISA_PROFILE", UdanChooConstants.VISA_PROFILE);
	    	modelView.addObject("VISA_TYPE", UdanChooConstants.VISA_TYPE);
	    	modelView.addObject("VISA_PURPOSE", UdanChooConstants.VISA_PURPOSE);

	    	
	    	modelView.setViewName("workload/visa/form_update_workload_visa_with_docs");
    	}
    	else {
    		modelView = view_form_error_case_update_workload_VSA_SL(dealConfirmationId,vsaServiceLineVO,result) ;
    		modelView.addObject("Error", "Error while Updating Visa Service Line Record !! Check Consulate Existance and other relevant fields. ");
    	}
    	return modelView;
    }
    
    
    private ModelAndView view_form_error_case_update_workload_VSA_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,VisaServiceLineVO vsaServiceLineVO,  BindingResult result) {
    	//ModelAndView modelView = view_form_create_workload_VSA_SL(dealConfirmationId,vsaServiceLineVO,result); 
    	UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	
    	//List visaSupplierVoList = supplierService.find_Active_Service_Based_Suppliers("VSA");
     	
     	SearchSupplierObj searchSupplierObj = new SearchSupplierObj();
    	searchSupplierObj.setVisa(true);
    	searchSupplierObj.setSortBy("supplierName");
    	//searchSupplierObj.setServiceCityId(ldpServiceLineVO.getDestinationId());
    	List<Tg_Supplier_Master_Entity> supplierResult =supplierService.find_filtered_suppliers(searchSupplierObj);
     	
     	List visaSupplierVoList = supplierService.find_Active_Visa_Suppliers();
    	Map mapVisaSuppliers = new LinkedHashMap ();
    	for(Tg_Supplier_Master_Entity supplierEntity: supplierResult) {
    		mapVisaSuppliers.put(supplierEntity.getSupplierId(), supplierEntity.getSupplierName());
    	}
     	List<UdnDealStatusVO> vsa_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_VSA_SL_OBJ);
     	Map visaWLStatusMap = new LinkedHashMap ();
    	for(UdnDealStatusVO statusObj: vsa_sl_wl_statusList) {
    		visaWLStatusMap.put(statusObj.getWorkloadStatusId(), statusObj.getWorkloadStatusName());
    	}
    	
    	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,"VSA",userObj.getUserId(),isAdmin);
    	ModelAndView modelView = view_workload_createNewWorkLoad(dealConfirmationId,null, result);
    	modelView.addObject("VISA_PROFILE", UdanChooConstants.VISA_PROFILE);
    	modelView.addObject("VISA_TYPE", UdanChooConstants.VISA_TYPE);
    	modelView.addObject("VISA_PURPOSE", UdanChooConstants.VISA_PURPOSE);
    	modelView.addObject("VSA_SUPPLIER_MAP", mapVisaSuppliers);
    	modelView.addObject("VSA_SL_STATUS_MAP", visaWLStatusMap);
    	modelView.addObject("serviceMapId", serviceMap.getServiceMapId());
    	
    	List<Udn_Visa_Consulate_Master_Entity> consulateList = visaService.findConsulateByVisaCountryCode(vsaServiceLineVO.getCountryCode());
    	Map consulateCitiesMap = new HashMap();
    	
    	consulateCitiesMap = consulateList.stream().collect(Collectors.toMap(
    	        number -> number.getConsulateCity(),
    	        number -> commonService.findDestinationById(number.getConsulateCity()).getCityName()));
    	modelView.addObject("CONSULATE_CITIES",consulateCitiesMap);
    	
    	modelView.addObject("VSA_SL_ACTION", "UPDATE");
    	modelView.setViewName("workload/visa/form_update_workload_visa_with_docs");
    	return modelView;
    }
    
    
    //@RequestMapping(value="/workload/view_view_workload_VSA_SL")
    @RequestMapping(value="/view_view_workload_VSA_SL")
    public ModelAndView view_view_workload_VSA_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("VSA_SL_OBJ") VisaServiceLineVO vsaServiceLineVO) {
    	UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	ModelAndView modelView = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,"VSA",userObj.getUserId(),isAdmin);
    	try {
    		vsaServiceLineVO = dealServiceLine.findByVSA_SL_ID(vsaServiceLineVO);
    		//for(vsaServiceLineVO.getVisaDocumentEntityList())
    		vsaServiceLineVO.setConsulateCityName(commonService.findDestinationById(vsaServiceLineVO.getConsulateCity()).getCityName());
			//modelView.addObject("ORG_VSA_SL_VO", vsaServiceLineVO);
		} catch (RecordNotFoundException e) {
			modelView.addObject("Error", "Error while creating Visa Service Line Record !!");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		modelView.addObject("serviceMapId", serviceMap.getServiceMapId());
    	modelView.addObject("dealConfirmationId",dealConfirmationId);
    	modelView.addObject("VSA_SL_ACTION", "VIEW");
    	modelView.addObject("VISA_PROFILE", UdanChooConstants.VISA_PROFILE);
    	modelView.addObject("VISA_TYPE", UdanChooConstants.VISA_TYPE);
    	modelView.addObject("VISA_PURPOSE", UdanChooConstants.VISA_PURPOSE);
    	modelView.setViewName("workload/visa/form_update_workload_visa_with_docs");
    	return modelView;
    }
    
    
    //@PostMapping(value="/workload/view_view_visa_doc_sl")
    //@RequestMapping(value = "/manage_landpackage_workload_actions", params = "Back")
    @RequestMapping(value="/view_view_visa_doc_sl")
    public ModelAndView view_view_visa_doc_sl(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("VSA_DOC_SL_OBJ") Udn_Visa_Doc_SL_Obj vsaDocServiceLineVO,@ModelAttribute("VSA_SL_OBJ")VisaServiceLineVO vsaServiceLineVO, BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	ModelAndView modelView = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,"VSA",userObj.getUserId(),isAdmin);
    	try {
    		vsaDocServiceLineVO = dealServiceLine.findBy_VSA_DOC_SL_ID(vsaDocServiceLineVO);
    		
    		//modelView.addObject("ORG_VSA_DOC_SL_VO", vsaDocServiceLineVO);
			//VisaServiceLineVO vsaServiceLineVO = new VisaServiceLineVO();
			vsaServiceLineVO.updateVOFromEntity(vsaDocServiceLineVO.getVsaServiceId());
			vsaServiceLineVO = dealServiceLine.findByVSA_SL_ID(vsaServiceLineVO);
			//modelView.addObject("ORG_VSA_SL_VO", vsaServiceLineVO);
			modelView.addObject("VISA_PROFILE", UdanChooConstants.VISA_PROFILE);
			modelView.addObject("VISA_TYPE", UdanChooConstants.VISA_TYPE);
			modelView.addObject("VISA_PURPOSE", UdanChooConstants.VISA_PURPOSE);

    	
		} catch (RecordNotFoundException e) {
			modelView.addObject("Error", "Error while creating Visa Service Line Record !!");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	modelView.addObject("serviceMapId", serviceMap.getServiceMapId());
    	modelView.addObject("dealConfirmationId",dealConfirmationId);
    	modelView.addObject("VSA_SL_ACTION", "VIEW");
    	modelView.addObject("VSA_DOC_SL_ACTION", "VIEW");
    	modelView.setViewName("workload/visa/update_workload_visa_doc");
    	return modelView;
    
    }
    
    //@PostMapping(value="/workload/view_edit_visa_doc_sl")
    //@PostMapping(value="/view_edit_visa_doc_sl", params = "Edit")
    @PostMapping(value="/view_view_visa_doc_sl", params = "Edit")
    public ModelAndView view_view_visa_doc_sl_opt_edit(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("VSA_DOC_SL_OBJ") Udn_Visa_Doc_SL_Obj vsaDocServiceLineVO,@ModelAttribute("VSA_SL_OBJ")VisaServiceLineVO vsaServiceLineVO,  BindingResult result) {
    	ModelAndView modelView = new ModelAndView("forward:view_edit_visa_doc_sl");
    	return modelView;

    }
    
    
    @PostMapping(value="/view_edit_visa_doc_sl")
    public ModelAndView view_edit_visa_doc_sl(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("VSA_DOC_SL_OBJ") Udn_Visa_Doc_SL_Obj vsaDocServiceLineVO,@ModelAttribute("VSA_SL_OBJ")VisaServiceLineVO vsaServiceLineVO,  BindingResult result) {
    	ModelAndView modelView = view_view_visa_doc_sl(dealConfirmationId,vsaDocServiceLineVO,vsaServiceLineVO,result);
    	modelView.addObject("VSA_SL_ACTION", "VIEW");
    	modelView.addObject("VSA_DOC_SL_ACTION", "UPDATE");
    	modelView.addObject("VISA_DOC_CUSTODY", UdanChooConstants.VISA_DOC_CUSTODY);
    	
     	List<UdnDealStatusVO> vsa_sl_dc_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_VSA_SL_DOC_OBJ);
     	Map visaDocWLStatusMap = new LinkedHashMap ();
    	for(UdnDealStatusVO statusObj: vsa_sl_dc_wl_statusList) {
    		visaDocWLStatusMap.put(statusObj.getWorkloadStatusId(), statusObj.getWorkloadStatusName());
    	}
    	modelView.addObject("VISA_DOC_SL_STATUS_MAP", visaDocWLStatusMap);
    	//modelView.addObject("VISA_DOC_SL_STATUS", UdanChooConstants.VISA_DOC_SL_STATUS);
    	return modelView;
    }
    
    @PostMapping(value="/view_view_visa_doc_sl", params = "Back")
    public ModelAndView view_view_workload_doc_VSA_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("VSA_SL_OBJ") VisaServiceLineVO vsaServiceLineVO)
    {
    	ModelAndView modelView = new ModelAndView("forward:view_view_workload_VSA_SL");
    	return modelView;
    }
    
    //@PostMapping(value="/workload/edit_edit_visa_doc_sl")
    @PostMapping(value="/edit_edit_visa_doc_sl")
    public ModelAndView edit_edit_visa_doc_sl(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("VSA_DOC_SL_OBJ") Udn_Visa_Doc_SL_Obj vsaDocServiceLineVO,@ModelAttribute("VSA_SL_OBJ")VisaServiceLineVO vsaServiceLineVO,  BindingResult result) {
    	Udn_Visa_Doc_SL_Entity visaDocSLEntity = new Udn_Visa_Doc_SL_Entity(vsaDocServiceLineVO);
    	visaDocSLEntity = dealServiceLine.saveVisaDocServiceLine(visaDocSLEntity);
    	vsaDocServiceLineVO.setVsaDocServiceId(visaDocSLEntity.getVsaDocServiceId());
    	ModelAndView modelView = view_view_visa_doc_sl(dealConfirmationId,vsaDocServiceLineVO,vsaServiceLineVO,result);
    	modelView.addObject("Success_Doc", "Visa Doc Service Line is updated successfully!! " );
    	
    	return modelView;
    }
    
    @PostMapping(value="/view_view_visa_doc_sl", params = "Delete")
    public ModelAndView view_delete_visa_doc_lnk2(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("VSA_DOC_SL_OBJ") Udn_Visa_Doc_SL_Obj vsaDocServiceLineVO,@ModelAttribute("VSA_SL_OBJ")VisaServiceLineVO vsaServiceLineVO,  BindingResult result) {
    	ModelAndView modelView = new ModelAndView("forward:view_delete_visa_doc_sl");
    	return modelView;
    }
    
    
    //@PostMapping(value="/workload/view_delete_visa_doc_sl")
    @PostMapping(value="/view_delete_visa_doc_sl")
    public ModelAndView view_delete_visa_doc_sl(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("VSA_DOC_SL_OBJ") Udn_Visa_Doc_SL_Obj vsaDocServiceLineVO,@ModelAttribute("VSA_SL_OBJ")VisaServiceLineVO vsaServiceLineVO,  BindingResult result) {
    	ModelAndView modelView = view_view_visa_doc_sl(dealConfirmationId,vsaDocServiceLineVO,vsaServiceLineVO,result);
    	modelView.addObject("VSA_SL_ACTION", "VIEW");
    	modelView.addObject("VSA_DOC_SL_ACTION", "DELETE");
    	return modelView;
    }
    
    //@PostMapping("/workload/delete_delete_visa_doc_sl")
    
    @PostMapping(value="/del_del_visa_doc_sl_opt", params = "Confirm Delete")
    public ModelAndView del_del_visa_doc_sl_opt(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("VSA_DOC_SL_OBJ") Udn_Visa_Doc_SL_Obj vsaDocServiceLineVO,@ModelAttribute("VSA_SL_OBJ") VisaServiceLineVO vsaServiceLineVO,  BindingResult result) {
    	ModelAndView modelView = new ModelAndView("forward:delete_delete_visa_doc_sl");
    	return modelView;
    }
    
    @PostMapping(value="/del_del_visa_doc_sl_opt", params = "Cancel")
    public ModelAndView del_del_visa_doc_sl_opt2_cancel(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("VSA_DOC_SL_OBJ") Udn_Visa_Doc_SL_Obj vsaDocServiceLineVO,@ModelAttribute("VSA_SL_OBJ")VisaServiceLineVO vsaServiceLineVO, BindingResult result) {
    	ModelAndView modelView = new ModelAndView("forward:view_view_visa_doc_sl");
    	return modelView;
    }
    
    @PostMapping("/delete_delete_visa_doc_sl")
    public ModelAndView delete_delete_visa_doc_sl(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("VSA_DOC_SL_OBJ") Udn_Visa_Doc_SL_Obj vsaDocServiceLineVO,@ModelAttribute("VSA_SL_OBJ") VisaServiceLineVO vsaServiceLineVO,  BindingResult result) {
       	boolean isSuccess = false;
       	try {
       		dealServiceLine.delete_visa_doc_serviceline(vsaDocServiceLineVO.getVsaDocServiceId());
       		isSuccess=true;
   		} catch (RecordNotFoundException e) {
   			isSuccess = false;
   		}
       	
       	//VisaServiceLineVO visaServiceLineVo = new VisaServiceLineVO(vsaDocServiceLineVO.getVsaServiceId());
       	
       	ModelAndView mapview = view_view_workload_VSA_SL(dealConfirmationId,vsaServiceLineVO);
       	if(isSuccess) {
       		mapview.addObject("Success_Del", "Visa Document Record Deleted Successfully. !!");
       	}else {
       		mapview.addObject("Error", "Error: Deleting the Visa Document. Please contact administrator!! ");
       	}
       	return mapview;
	}
   
    //@PostMapping(value="/workload/view_add_workload_VSA_doc_SL")
	@PostMapping(value="/view_add_workload_VSA_doc_SL")
    public ModelAndView view_add_workload_VSA_doc_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("VSA_SL_OBJ")VisaServiceLineVO vsaServiceLineVO,@ModelAttribute("VSA_DOC_SL_OBJ") Udn_Visa_Doc_SL_Obj vsaDocServiceLineVO,  BindingResult result) {
    	ModelAndView modelView = view_view_workload_VSA_SL(dealConfirmationId,vsaServiceLineVO);
    	modelView.addObject("VSA_DOC_SL_ACTION", "ADD");
    	modelView.addObject("VSA_SL_ACTION", "VIEW");
    	modelView.addObject("VISA_DOC_CUSTODY", UdanChooConstants.VISA_DOC_CUSTODY);
    	
    	//modelView.addObject("VISA_DOC_SL_STATUS", UdanChooConstants.VISA_DOC_SL_STATUS);
    	List<UdnDealStatusVO> vsa_sl_dc_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_VSA_SL_DOC_OBJ);
     	Map visaDocWLStatusMap = new LinkedHashMap ();
    	for(UdnDealStatusVO statusObj: vsa_sl_dc_wl_statusList) {
    		visaDocWLStatusMap.put(statusObj.getWorkloadStatusId(), statusObj.getWorkloadStatusName());
    	}
    	modelView.addObject("VISA_DOC_SL_STATUS_MAP", visaDocWLStatusMap);
    	
    	modelView.setViewName("workload/visa/update_workload_visa_doc");
    	
    	return modelView;
    }
	    
	    //@PostMapping(value="/workload/view_delete_workload_VSA_SL")
    	@PostMapping(value="/view_delete_workload_VSA_SL")
	    public ModelAndView view_delete_workload_VSA_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("VSA_SL_OBJ")VisaServiceLineVO vsaServiceLineVO) {
	    	UserDetailsObj userObj = getLoggedInUser();
	    	boolean isAdmin=false;
	    	
	     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
	    		isAdmin=true;
	    	}
	    	ModelAndView modelView = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
	    	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,"VSA",userObj.getUserId(),isAdmin);
	    	try {
	    		vsaServiceLineVO = dealServiceLine.findByVSA_SL_ID(vsaServiceLineVO);
				modelView.addObject("ORG_VSA_SL_VO", vsaServiceLineVO);
			} catch (RecordNotFoundException e) {
				modelView.addObject("Error", "Error while creating Visa Service Line Record !!");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			modelView.addObject("serviceMapId", serviceMap.getServiceMapId());
	    	modelView.addObject("dealConfirmationId",dealConfirmationId);
	    	modelView.addObject("VISA_PROFILE", UdanChooConstants.VISA_PROFILE);
	    	modelView.addObject("VISA_TYPE", UdanChooConstants.VISA_TYPE);
	    	modelView.addObject("VISA_PURPOSE", UdanChooConstants.VISA_PURPOSE);
	    	modelView.addObject("VSA_SL_ACTION", "DELETE");
	    	
	    	modelView.setViewName("workload/visa/form_update_workload_visa_with_docs");
	    	return modelView;
	    }
	   
	    //@PostMapping("/workload/delete_delete_workload_VSA_SL")
	@PostMapping("/delete_delete_workload_VSA_SL")
    public ModelAndView delete_delete_workload_VSA_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@RequestParam("vsaServiceId") long vsaServiceId) {
    	boolean isSuccess = false;
    	try {
    		dealServiceLine.delete_visa_serviceline(vsaServiceId);
    		isSuccess=true;
    	} catch (RecordNotFoundException e) {
    		isSuccess = false;
    	}
	       	
    	ModelAndView mapview = view_workload_createNewWorkLoad_VSA(dealConfirmationId);
    	if(isSuccess) {
    		mapview.addObject("Success", "Visa Service Line Record Deleted Successfully. !!");
	    }else {
	    	mapview.addObject("Error", "Error: Deleting the Visa Document. Please contact administrator!! ");
	    }
    	return mapview;
    }
	
	//@ModelAttribute("VSA_DOC_SL_OBJ") Udn_Visa_Doc_SL_Obj vsaDocServiceLineVO,  BindingResult result
	//@PostMapping(value="view_form_email_workload_VSA_SL_status")
	@RequestMapping(value = "view_form_email_workload_VSA_SL_status", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView view_form_email_workload_VSA_SL_status(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("EMAIL_VISA_STATUS") VisaServiceStatusEmailFormObj visaServiceStatus,  BindingResult result) {
    	/*
		ModelAndView  modelView = view_workload_createNewWorkLoad_VSA(dealConfirmationId);	
    	modelView.setViewName("workload/visa/view_list_email_visa_details");
    	return modelView;
    	*/
		UserDetailsObj userObj = getLoggedInUser();
		
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}

		
		ModelAndView modelView = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	
		List<VisaServiceLineVO> vsaServiceLineList = dealServiceLine.find_VSA_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
    	
    	/*for(VisaServiceLineVO visaSLVO: vsaServiceLineList) {
    		System.out.println("VS Record is " + visaSLVO.getVisaDocumentEntityList());
    		for(Udn_Visa_Doc_SL_Obj visaDoc: visaSLVO.getVisaDocumentEntityList()) {
    			System.out.println("Visa Doc " + visaDoc.getDocumentTitle() + "--" + visaDoc.getStatusName());
    		}
    		
    	}*/
		
    	modelView.addObject("dealConfirmationId",dealConfirmationId);
    	visaServiceStatus.setVisaServiceListForEmail(vsaServiceLineList);
    	
    	modelView.addObject("VISA_PROFILE", UdanChooConstants.VISA_PROFILE);
    	modelView.addObject("VISA_TYPE", UdanChooConstants.VISA_TYPE);
    	modelView.addObject("VISA_PURPOSE", UdanChooConstants.VISA_PURPOSE);

    	modelView.setViewName("workload/visa/view_list_email_visa_details");
    	return modelView;
    }

	@PostMapping(value="view_send_email_workload_VSA_SL_status")
    public ModelAndView view_send_email_workload_VSA_SL_status(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("EMAIL_VISA_STATUS") VisaServiceStatusEmailFormObj visaServiceStatus,  BindingResult result,final RedirectAttributes redirectAttrib) {
    	/*
		ModelAndView  modelView = view_workload_createNewWorkLoad_VSA(dealConfirmationId);	
    	modelView.setViewName("workload/visa/view_list_email_visa_details");
    	return modelView;
    	*/
		
		ModelAndView modelView = new ModelAndView();
		if(visaServiceStatus.getVisaIdListToEmail()!=null && visaServiceStatus.getVisaIdListToEmail().size()>0) {
			modelView=view_workload_createNewWorkLoad(dealConfirmationId,null,null);
			
			List<VisaServiceLineVO> vsaServiceLineStatusListtoEmail = new ArrayList<VisaServiceLineVO>(); 
			Iterator itrVisaSL = visaServiceStatus.getVisaIdListToEmail().iterator();
			while(itrVisaSL.hasNext()) {
				long visaSLId = Long.parseLong(itrVisaSL.next().toString());
				try {
					Udn_Deal_VSA_SL_Entity visaSlEntity = dealServiceLine.findBy_VSA_SL_ID(visaSLId);
					VisaServiceLineVO visaSLVo = new VisaServiceLineVO(visaSlEntity);
					
					Udn_Visa_Master_Entity visaMasterEntity = 	visaService.findVisaEntityById(visaSLVo.getVisaId());
					visaSLVo.setVisaPurpose(visaMasterEntity.getVisaPurpose());
					visaSLVo.setVisaType(visaMasterEntity.getVisaType());
					visaSLVo.setProfile(visaMasterEntity.getProfile());
					visaSLVo.setCountryCode(visaMasterEntity.getCountryCode());
					//visaSLVo.updateVOFromEntity(visaSLEntity);
					for(Udn_Visa_Doc_SL_Entity visaDocSL:visaSlEntity.getVisaDocumentEntityList() ) {
						Udn_Visa_Doc_SL_Obj visaDocObj = new Udn_Visa_Doc_SL_Obj(visaDocSL);
						visaSLVo.getVisaDocumentEntityList().add(visaDocObj);
					}
					visaSLVo.setCountryName(commonService.findDestinationByCountryCode(visaSlEntity.getCountryCode()).getCountryName());
					visaSLVo.setStatusName(commonService.find_SL_Deal_Obj_Based_On_Status("VSA_SL",visaSlEntity.getStatus()).getWorkloadStatusName());
					vsaServiceLineStatusListtoEmail.add(visaSLVo);
				} catch (RecordNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			modelView.addObject("dealConfirmationId",dealConfirmationId);
			ClientObj client = clientService.find_ClientByDealConfirmationId(dealConfirmationId);
			
			EmailMessageVO emailMsgVo = new EmailMessageVO();
			if(visaServiceStatus.getEmailMessageVo()!=null) {
				if(visaServiceStatus.getEmailMessageVo().getEmailToList()!=null&&visaServiceStatus.getEmailMessageVo().getEmailToList().trim().length()>0) {
					emailMsgVo.setEmailToList(visaServiceStatus.getEmailMessageVo().getEmailToList());
				}else {
					emailMsgVo.setEmailToList(client.getEmail());	
				}
				if(visaServiceStatus.getEmailMessageVo().getEmailCcList()!=null&&visaServiceStatus.getEmailMessageVo().getEmailCcList().trim().length()>0) {
					emailMsgVo.setEmailCcList(visaServiceStatus.getEmailMessageVo().getEmailCcList());
				}else {
					emailMsgVo.setEmailToList(client.getEmail());	
				}
				if(visaServiceStatus.getEmailMessageVo().getEmailSubject()!=null&&visaServiceStatus.getEmailMessageVo().getEmailSubject().trim().length()>0) {
					emailMsgVo.setEmailSubject(visaServiceStatus.getEmailMessageVo().getEmailSubject());
				}else {
					emailMsgVo.setEmailSubject("Visa Status | Deal Confirmation Number: " + dealConfirmationId);	
				}
			}else {
				emailMsgVo.setEmailToList(client.getEmail());
				emailMsgVo.setEmailSubject("Visa Status | Deal Confirmation Number: " + dealConfirmationId);
			}
			
			visaServiceStatus.setEmailMessageVo(emailMsgVo);	
			
			
			//visaServiceStatus.setEmailToList(client.getEmail());
			//visaServiceStatus.setEmailSubject("Visa Status:-  Deal Confirmation Number: " + dealConfirmationId);
	    	
			
			visaServiceStatus.setVisaServiceListForEmail(vsaServiceLineStatusListtoEmail);
	    	modelView.addObject("VISA_PROFILE", UdanChooConstants.VISA_PROFILE);
	    	modelView.addObject("VISA_TYPE", UdanChooConstants.VISA_TYPE);
	    	modelView.addObject("VISA_PURPOSE", UdanChooConstants.VISA_PURPOSE);
	    	modelView.setViewName("workload/visa/form_visa_serviceline_status_emailer");
		}
		else {
			modelView.setViewName("redirect:view_form_email_workload_VSA_SL_status?dealConfirmationId="+dealConfirmationId);
    		redirectAttrib.addFlashAttribute("Error", "Please select atleast one applicant document status to email. ");
    		return modelView;
		}
    	return modelView;
    }
	
	@PostMapping("send_send_email_visa_deal_status")
   	public ModelAndView send_send_email_visa_deal_status(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("EMAIL_VISA_STATUS") VisaServiceStatusEmailFormObj visaServiceStatus,BindingResult result,final RedirectAttributes redirectAttrib ) {
    	ModelAndView modelView = new ModelAndView();
    	//System.out.println("Visa Service Email: " + visaServiceStatus.getVisaServiceListForEmail().get);
    	emailValidator.validate(visaServiceStatus.getEmailMessageVo(), result);
    	if(result.hasErrors()) {
    		modelView = view_send_email_workload_VSA_SL_status(dealConfirmationId,visaServiceStatus,result,null);
    		return modelView; 
    	}
    	else {
    		if(emailClientActive) {
    			try {
					visaServiceStatus.getVisaServiceListForEmail().forEach(k->{
						k.setVisaProfileString(UdanChooConstants.VISA_PROFILE.get(k.getProfile()));
						k.setVisaPurposeString((UdanChooConstants.VISA_PURPOSE.get(k.getVisaPurpose())));
						k.setVisaTypeString(UdanChooConstants.VISA_TYPE.get(k.getVisaType()));
						try {
							k.setVisaDocumentEntityList(dealServiceLine.findByVSA_SL_ID(k).getVisaDocumentEntityList());
						} catch (RecordNotFoundException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					});
					dealServiceLine.send_visa_deal_status(visaServiceStatus);
					
					modelView.setViewName("redirect:view_workload_VSA?dealConfirmationId="+dealConfirmationId);
					redirectAttrib.addFlashAttribute("Success","Email Visa Status Details added to the mailing queue successfully!! ");
				} catch (MessagingException | IOException | TemplateException e) {
					redirectAttrib.addFlashAttribute("Error","Error: While sending email. Recipients setting error / Template Incorrect.<br> Please send individually or contact adminstrator.");	
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
    		}
    		else {
    			modelView.setViewName("redirect:view_workload_VSA?dealConfirmationId="+dealConfirmationId);
    			redirectAttrib.addFlashAttribute("Error","Error: All Client Communication Emails are disabled by Administrator. ");
    		}
	    	return modelView;
    	}
    }

	/********************* CRUISE functionality implementation starts from here *******************************/
    @RequestMapping("/view_workload_CRS")
	public ModelAndView view_workload_CRS(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("sightseeingworkloadRecorder") Udn_WL_FLT_Recorder_Obj stsWlRecorder,  BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	ModelAndView mapview = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	List<CruiseServiceLineVO> crsServiceLineList;
		try {
			crsServiceLineList = dealServiceLine.find_CRS_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
	    	Udn_Deal_Services_Entity serviceMap = dealServiceLine.find_Service_Map_Deal(dealConfirmationId,"CRS",userObj.getUserId(),isAdmin);
	    	mapview.addObject("CRS_SL_LIST", crsServiceLineList);
	    	mapview.addObject("dealConfirmationId",dealConfirmationId);
	    	mapview.addObject("serviceMapId", serviceMap.getServiceMapId());
	    	mapview.addObject("CRS_SL_ACTION", "VIEW");
	    	//mapview.addObject("TRANSFER_POINT_MAP", UdanChooConstants.TRANSFER_POINT_MAP);
	    	//mapview.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy HH:mm"));
	    	mapview.setViewName("workload/cruise/form_createWokLoad_Cruise");
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return mapview;
    }

    @PostMapping(value="/create_workload_CRS_SL")
    public ModelAndView create_workload_CRS_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("CRS_SL_OBJ") @Valid CruiseServiceLineVO crsServiceLineVO,  BindingResult result,final RedirectAttributes redirectAttrib) {
    	ModelAndView mapview = new ModelAndView();
    	UserDetailsObj userObj = getLoggedInUser();
    	
    	if(!commonService.existsByDestinationIdAndCityName(crsServiceLineVO.getCityId(), crsServiceLineVO.getCityName())) {
			result.rejectValue("cityName", "city.error");
		}

    	if((crsServiceLineVO.getAdults() + crsServiceLineVO.getChildren() +crsServiceLineVO.getInfants())<=0) {
    		result.rejectValue("adults", "paxcount.error");
    	}
    	if(crsServiceLineVO.getCruiseStartDate().compareTo(crsServiceLineVO.getCruiseEndDate())>0) {
    		result.rejectValue("cruiseStartDate", "travel.start.end.error");
    	}
    	
    	if(!result.hasErrors()) {
    		Udn_Deal_CRS_SL_Entity cruiseSLEntity = new Udn_Deal_CRS_SL_Entity(crsServiceLineVO);
    		dealServiceLine.saveCruiseServiceLine(cruiseSLEntity);
    		redirectAttrib.addFlashAttribute("Success", "Cruise Service Line Record Created Successfully. !!");
    		mapview.setViewName("redirect:view_workload_CRS?dealConfirmationId="+dealConfirmationId);
    	}else {
    		CruiseServiceLineVO tmpServiceLineVO = new CruiseServiceLineVO();
    		tmpServiceLineVO.setCrsServiceId(tmpServiceLineVO.getCrsServiceId());
    		mapview = view_create_workload_form_CRS(dealConfirmationId,tmpServiceLineVO,  null); 
    	}
    	
    	return mapview;
    }
   
    @PostMapping(value="/view_create_workload_form_CRS")
    public ModelAndView view_create_workload_form_CRS(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("CRS_SL_OBJ") CruiseServiceLineVO crsServiceLineVO,  BindingResult result) {
    	SearchSupplierObj searchSupplierObj = new SearchSupplierObj();
    	searchSupplierObj.setConsolidator(true);
    	searchSupplierObj.setCruise(true);
    	searchSupplierObj.setSortBy("supplierName");
    	searchSupplierObj.setServiceCityId(crsServiceLineVO.getCityId());
    	
    	List<Tg_Supplier_Master_Entity> supplierResult =supplierService.find_filtered_suppliers(searchSupplierObj);
    	Map supplierMap = new LinkedHashMap<>();
    	for(Tg_Supplier_Master_Entity supplierMaster:supplierResult) {
    		supplierMap.put(supplierMaster.getSupplierId(), supplierMaster.getSupplierName());
    	}
    	List<UdnDealStatusVO> crs_sl_wl_statusList = commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_CRS_SL_OBJ);
    	Map crs_sl_wl_statusMap = new LinkedHashMap<>();
    	for(UdnDealStatusVO statusVO: crs_sl_wl_statusList) {
    		crs_sl_wl_statusMap.put(statusVO.getWorkloadStatusId(), statusVO.getWorkloadStatusName());
    	}
    	ModelAndView mapview = view_workload_CRS(dealConfirmationId,null,null); 
    	mapview.addObject("CRS_SL_ACTION", "ADD");
    	mapview.addObject("CRS_SUPPLIER_MAP", supplierMap);
    	mapview.addObject("CRS_SL_STATUS_MAP", crs_sl_wl_statusMap);
    	mapview.addObject("CRS_STATE_ROOM_TYPE_MAP", UdanChooConstants.CRUISE_STATE_ROOM_TYPE_MAP);
    	mapview.addObject("CRS_CRUISE_PROVIDER_MAP", UdanChooConstants.CRUISE_PROVIDER_NAMES_MAP);
    	
    	return mapview;
    }    
    
    //@PostMapping(value="/workload/view_update_workload_form_TRN")
    @PostMapping(value="/view_update_workload_form_CRS")
    public ModelAndView view_update_workload_form_CRS(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("CRS_SL_OBJ") CruiseServiceLineVO crsServiceLineVO,  BindingResult result) {
    	ModelAndView mapView = view_create_workload_form_CRS(dealConfirmationId,crsServiceLineVO,null);
    	mapView.addObject("CRS_SL_ACTION", "UPDATE");
		try {
			crsServiceLineVO = dealServiceLine.findByCRS_SL_ID(crsServiceLineVO);
			//mapView.addObject("ORG_TRN_SL_VO", orgTRNSLVo);
		
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return mapView;
    }
	
    @PostMapping(value="/edit_edit_workload_CRS_SL")
    public ModelAndView edit_edit_workload_CRS_SL(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("CRS_SL_OBJ") @Valid CruiseServiceLineVO crsServiceLineVO,  BindingResult result,final RedirectAttributes redirectAttrib) {
    	ModelAndView mapview = new ModelAndView();
    	UserDetailsObj userObj = getLoggedInUser();
    	
    	if(!commonService.existsByDestinationIdAndCityName(crsServiceLineVO.getCityId(), crsServiceLineVO.getCityName())) {
			result.rejectValue("cityName", "city.error");
		}

    	if((crsServiceLineVO.getAdults() + crsServiceLineVO.getChildren() +crsServiceLineVO.getInfants())<=0) {
    		result.rejectValue("adults", "paxcount.error");
    	}
    	if(crsServiceLineVO.getCruiseStartDate().compareTo(crsServiceLineVO.getCruiseEndDate())>0) {
    		result.rejectValue("cruiseStartDate", "travel.start.end.error");
    	}

    	
    	if(!result.hasErrors()) {
    		Udn_Deal_CRS_SL_Entity cruiseSLEntity = new Udn_Deal_CRS_SL_Entity(crsServiceLineVO);
    		dealServiceLine.saveCruiseServiceLine(cruiseSLEntity);
    		redirectAttrib.addFlashAttribute("Success", "Cruise Service Line Record Updated Successfully. !!");
    		mapview.setViewName("redirect:view_workload_CRS?dealConfirmationId="+dealConfirmationId);
    	}else {
    		CruiseServiceLineVO tmpServiceLineVO = new CruiseServiceLineVO ();
    		tmpServiceLineVO.setCrsServiceId(crsServiceLineVO.getCrsServiceId());
    		mapview = view_update_workload_form_CRS(dealConfirmationId,tmpServiceLineVO,  null); 
    	}
    	return mapview;
    }
    
    @PostMapping("/view_delete_crs_sl_confirmation")
   	public ModelAndView view_delete_crs_sl_confirmation(@ModelAttribute("CRS_SL_OBJ") CruiseServiceLineVO crsServiceLineVO,@RequestParam("dealConfirmationId") long dealConfirmationId)
   	{
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
        
    	CruiseServiceLineVO crsSLVoToDel = new CruiseServiceLineVO();
		try {
			crsSLVoToDel = dealServiceLine.findByCRS_SL_ID(crsServiceLineVO);
			modelView.addObject("crsSLObj", crsSLVoToDel);
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		modelView.addObject("dealConfirmationId",dealConfirmationId);
        
        modelView.setViewName("workload/cruise/form_Cruise_SL_Del_Confirmation");
       	return modelView;
   	}
    
    @PostMapping("/delete_CRS_SL")
   	public ModelAndView delete_CRS_SL(@RequestParam(value = "crsServiceId") long crsServiceId,@RequestParam("dealConfirmationId") long dealConfirmationId,final RedirectAttributes redirectAttrib)
   	{
       boolean isSuccess = false;
      try {
       		dealServiceLine.delete_Cruise_ServiceLine(crsServiceId);
       		isSuccess=true;
   		} catch (RecordNotFoundException e) {
   			isSuccess = false;
   		}
       	
       	//ModelAndView mapview = view_workload_TRN(dealConfirmationId,null,null);
      	ModelAndView mapview = new ModelAndView();  	
    	mapview.setViewName("redirect:view_workload_CRS?dealConfirmationId="+dealConfirmationId);
       	
      	if(isSuccess) {
      		redirectAttrib.addFlashAttribute("Success", "Cruise Service Line Record Deleted Successfully. !!");
       	}else {
       		redirectAttrib.addFlashAttribute("Error", "Error: Deleting the Cruise Service Line. Please contact administrator!! ");
       	}
       	return mapview;
   	}
	
}