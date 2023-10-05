package com.udanchoo.intranet.controller.quotation;


import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.tg.api.flight.request.object.FlightSearchRequest;
import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;
import com.udanchoo.intranet.entity.Tg_Flt_Airport_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.entity.quotation.Tg_Quotation_Recorder_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Flight_Quotation_Stop_Detail_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Flight_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Hotel_Quotation_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.Udn_Room_Category_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.api.flight.Tg_Flt_Airport_Obj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.model.quotation.FlightStopDetailQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualFlightQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualHotelQuotationVO;
import com.udanchoo.intranet.model.quotation.TgQuotationRecorderVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.EmailServiceImpl;
import com.udanchoo.intranet.service.HotelServiceImpl;
import com.udanchoo.intranet.service.LeadServiceImpl;
import com.udanchoo.intranet.service.QuotationServiceImpl;
import com.udanchoo.intranet.service.TgB2bPartnerServicesImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.util.UdanChooUtil;
import com.udanchoo.intranet.validator.FlightStopValidator;
import com.udanchoo.intranet.validator.HotelQuotationValidator;
import com.udanchoo.intranet.validator.ManualQuotationValidator;

@Controller
public class HotelQuotationController {
	 
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
    private HotelQuotationValidator hotelQtnValidator;
	
	@Autowired
    private HotelServiceImpl hotelService;
	
	@Autowired
	LeadServiceImpl leadService;
	
	@Autowired
	QuotationServiceImpl quotationService;
	
	@Autowired
	EmailServiceImpl emailService;

	@Autowired
	ClientServiceImpl clientService;

	@Autowired
	UserDetailsServiceImpl userService;

	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	TgB2bPartnerServicesImpl b2bPartnerService;
	
	@Value("${all.email.notify.communication.active}")
	private boolean emailNotifyActive;
	
	@Value("${email.client.valid}")
	private boolean emailClientNotifyActive;


    
	
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
	

	@RequestMapping("/form_view_hotel_quotation_details")
	public ModelAndView form_view_hotel_quotation_details(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@RequestParam(defaultValue = "1")int hotelOptionNo,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = new ModelAndView("quotation/hotel/viewHotelQuotationDetails");
		Tg_Leads_Recorder_Entity tgLeadEntity =leadService.findLeadRecordById(leadRecorderObj.getLeadId());
		
		leadRecorderObj.updateLeadVoFromEntity(tgLeadEntity);
		leadRecorderObj.setSourceName(commonService.findDestinationById(leadRecorderObj.getSource()).getCityName());
		leadRecorderObj.setDestinationName(commonService.findDestinationById(leadRecorderObj.getDestination()).getCityName());
		leadRecorderObj.setContactName(clientService.find_ClientBy_Id(leadRecorderObj.getContactId()).getClientName());
		Tg_B2b_Partner_Entity b2bPartner = b2bPartnerService.findPartnerById(leadRecorderObj.getLeadSource());
		leadRecorderObj.setLeadSourceShortName(b2bPartner.getPartnerShortName());
		leadRecorderObj.setLeadSourceName(b2bPartner.getPartnerName());
		leadRecorderObj.setStatusName(commonService.find_DealStatusById(leadRecorderObj.getLeadStatus()).getWorkloadStatusName());
		leadRecorderObj.setLeadOwnerName(userService.findUserByID(leadRecorderObj.getLeadOwner()).getUsername());
		
		Tg_Quotation_Recorder_Entity quotationEntity= quotationService.findQuotationRecordById(qtnRecorderObj.getQuotationId());
		
		qtnRecorderObj.setHotelOptionNo(hotelOptionNo);
		qtnRecorderObj.setVoFromEntity(quotationEntity);
		updateManualHotelAdditionalFields(qtnRecorderObj);
		qtnRecorderObj.setLeadEntity(tgLeadEntity);
		
		int MAX_HOTEL_OPTION_CREATED = quotationService.findMaxHotelOptionGenerated(qtnRecorderObj.getQuotationId());
		mapview.addObject("MAX_HOTEL_OPTION_CREATED", MAX_HOTEL_OPTION_CREATED);
		mapview.addObject("localDateTimeFormat", DateTimeFormatter.ofPattern("dd/MMM/yyyy"));
		
		return mapview;
	}

	private void updateManualHotelAdditionalFields(TgQuotationRecorderVO qtnRecorderObj) {
		qtnRecorderObj.getHotelVoList().forEach((e) -> { 
			try {
				e.setHotelName(hotelService.find_HotelbyId(e.getHotelId()).getHotelName());
			} catch (RecordNotFoundException e1) {
				e.setHotelName("Hotel Name Not Found" );
				e1.printStackTrace();
			}
			e.setCityName(commonService.findDestinationById(e.getCityId()).getCityName());
			e.setRoomCategoryName(hotelService.find_RoomCategoryById(e.getRoomCategoryId()).getRoomCategoryName());
			e.setMealPlanName((String) UdanChooConstants.MEAL_PLANS_MAP.get(e.getMealPlan()));
		});
		
	}
	
	@RequestMapping("/form_view_add_hotel_quotation")
	public ModelAndView form_view_add_hotel_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_HTL") ManualHotelQuotationVO manualHotelRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		manualHotelRequest.setOptionNo(qtnRecorderObj.getHotelOptionNo());
		ModelAndView mapview = form_view_hotel_quotation_details(leadRecorderObj,qtnRecorderObj,qtnRecorderObj.getHotelOptionNo(),result,redirectAttrib);
		
		mapview.addObject("HTL_STOP_ACTION", "ADD");
		mapview.addObject("MEAL_PLANS_MAP", UdanChooConstants.MEAL_PLANS_MAP);
		
		//mapview.addObject("MANUAL_HTL", manualHotelRequest);
		return mapview;
	}
	
	@RequestMapping("/form_view_add_hotel_option_quotation")
	public ModelAndView form_view_add_hotel_option_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_HTL") ManualHotelQuotationVO manualHotelRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		int MAX_HOTEL_OPTION_CREATED = quotationService.findMaxHotelOptionGenerated(qtnRecorderObj.getQuotationId()) +1;
		manualHotelRequest.setOptionNo(MAX_HOTEL_OPTION_CREATED);
		qtnRecorderObj.setHotelOptionNo(MAX_HOTEL_OPTION_CREATED);
		ModelAndView mapview = form_view_add_hotel_quotation(leadRecorderObj,qtnRecorderObj,manualHotelRequest,result,redirectAttrib);
		//int maxExistingOptionCreated = find_Max_Hotel_Option(qtnRecorderObj);
		return mapview;
	}
	
	/*
	private int find_Max_Hotel_Option(TgQuotationRecorderVO qtnRecorderObj) {
		 int maxOptionCreated=0;
		Iterator itrHotelList = qtnRecorderObj.getHotelVoList().iterator();
		while(itrHotelList.hasNext()) {
			ManualHotelQuotationVO hotelVo = (ManualHotelQuotationVO) itrHotelList.next();
			System.out.println("maxOption-" + maxOptionCreated + " -- hotel option " + hotelVo.getOptionNo()) ;
			if(maxOptionCreated<hotelVo.getOptionNo()) {
				maxOptionCreated = hotelVo.getOptionNo();
			}
		}
		
		return maxOptionCreated;
	}
	*/
	
	@Transactional
	@PostMapping("/create_create_hotel_manual_quotation")
	public ModelAndView create_create_hotel_manual_quotation(@RequestParam long quotationId,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_HTL") ManualHotelQuotationVO manualHotelRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		hotelQtnValidator.validate(manualHotelRequest, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		if(result.hasErrors()) {
			TgLeadsRecorderVO leadRecorderObj = new TgLeadsRecorderVO();
			leadRecorderObj.setLeadId(quotationEntity.getLeadEntity().getLeadId());
			modelView = form_view_add_hotel_quotation(leadRecorderObj,qtnRecorderObj,manualHotelRequest,result,redirectAttrib);
			modelView.addObject("LEAD_OBJ",leadRecorderObj);
			return modelView;
		}else {
			Udn_Manual_Hotel_Quotation_Entity manualHotelQuotationEntity = new Udn_Manual_Hotel_Quotation_Entity(manualHotelRequest); 
			manualHotelQuotationEntity.setQuotationEntity(quotationEntity);
			manualHotelRequest.setActive(true);
			quotationEntity.getHotelQuotationsList().add(manualHotelQuotationEntity);
			quotationService.saveLead(quotationEntity);
			//quotationService.saveManualFlightQuotation(manualFlightQuotationEntity);
			redirectAttrib.addFlashAttribute("Success","Manual Hotel Stay Record Added Successfully!!");
			modelView.setViewName("redirect:form_view_hotel_quotation_details?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&quotationId="+quotationId+ "&hotelOptionNo="+manualHotelRequest.getOptionNo());
			
		}
		return modelView; 
	 }
	
	@RequestMapping("/form_view_edit_manual_hotel_quotation")
	public ModelAndView form_view_edit_manual_hotel_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_HTL") ManualHotelQuotationVO manualHotelRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		manualHotelRequest.setOptionNo(qtnRecorderObj.getHotelOptionNo());
		ModelAndView mapview = form_view_hotel_quotation_details(leadRecorderObj,qtnRecorderObj,qtnRecorderObj.getHotelOptionNo(),result,redirectAttrib);
		quotationService.updateInjectedManualHotelObject(manualHotelRequest.getManualHotelQuotationId(), manualHotelRequest);
		mapview.addObject("HTL_STOP_ACTION", "EDIT");
		List<Udn_Room_Category_Obj> roomCategoryObj = hotelService.findRoomCategoryByHotelId(manualHotelRequest.getHotelId());
		/*Map<Integer, String> roomCategoryMap = new HashMap<Integer, String>();
		roomCategoryObj.forEach((category) -> { 
			roomCategoryMap.put(category.getRoomCategoryId(), category.getRoomCategoryName());
		});
		*/
		mapview.addObject("SELECTED_HOTEL_ALL_ROOM_CATEGORY", roomCategoryObj);
		mapview.addObject("MEAL_PLANS_MAP", UdanChooConstants.MEAL_PLANS_MAP);
		return mapview;
	}

	@Transactional
	@PostMapping("/edit_edit_hotel_manual_quotation")
	public ModelAndView edit_edit_hotel_manual_quotation(@RequestParam long quotationId,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_HTL") ManualHotelQuotationVO manualHotelRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		hotelQtnValidator.validate(manualHotelRequest, result);
		Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
		if(result.hasErrors()) {
			TgLeadsRecorderVO leadRecorderObj = new TgLeadsRecorderVO();
			leadRecorderObj.setLeadId(quotationEntity.getLeadEntity().getLeadId());
			modelView = form_view_edit_manual_hotel_quotation(leadRecorderObj,qtnRecorderObj,manualHotelRequest,result,redirectAttrib);
			modelView.addObject("LEAD_OBJ",leadRecorderObj);
			return modelView;
		}else {
			Udn_Manual_Hotel_Quotation_Entity manualHotelQuotationEntity = new Udn_Manual_Hotel_Quotation_Entity(manualHotelRequest); 
			manualHotelQuotationEntity.setQuotationEntity(quotationEntity);
			quotationService.saveHotelStayQuotation(manualHotelQuotationEntity);
			//quotationEntity.getHotelQuotationsList().add(manualHotelQuotationEntity);
			//quotationService.saveLead(quotationEntity);
			//quotationService.saveManualFlightQuotation(manualFlightQuotationEntity);
			redirectAttrib.addFlashAttribute("Success","Hotel Stay Record Updated Successfully!!");
			modelView.setViewName("redirect:form_view_hotel_quotation_details?leadId="+quotationEntity.getLeadEntity().getLeadId() + "&quotationId="+quotationId+ "&hotelOptionNo="+manualHotelRequest.getOptionNo());
			
		}
		return modelView; 
	 }

	@RequestMapping("/form_view_delete_manual_hotel_quotation")
	public ModelAndView form_view_delete_manual_hotel_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_HTL") ManualHotelQuotationVO manualHotelRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		manualHotelRequest.setOptionNo(qtnRecorderObj.getHotelOptionNo());
		ModelAndView mapview = form_view_hotel_quotation_details(leadRecorderObj,qtnRecorderObj,manualHotelRequest.getOptionNo(),result,redirectAttrib);
		quotationService.updateInjectedManualHotelObject(manualHotelRequest.getManualHotelQuotationId(), manualHotelRequest);
		
		mapview.addObject("HTL_STOP_ACTION", "DELETE");
		List<Udn_Room_Category_Obj> roomCategoryObj = hotelService.findRoomCategoryByHotelId(manualHotelRequest.getHotelId());

		return mapview;
	}

	@Transactional
	@PostMapping("/delete_delete_hotel_manual_quotation")
	public ModelAndView delete_delete_hotel_manual_quotation(@ModelAttribute("LEAD_OBJ") TgLeadsRecorderVO leadRecorderObj,@ModelAttribute("QTN_OBJ") TgQuotationRecorderVO qtnRecorderObj,@ModelAttribute("MANUAL_HTL") ManualHotelQuotationVO manualHotelRequest,BindingResult result,final RedirectAttributes redirectAttrib) {
		ModelAndView modelView = new ModelAndView();
		int hotelOptionNo = manualHotelRequest.getOptionNo();
		quotationService.deleteHotelStayQuotation(manualHotelRequest.getManualHotelQuotationId());
		int hotelOptionNumbersQuotation =quotationService.findHotelOptionNumbersForQuoation(qtnRecorderObj.getQuotationId(),manualHotelRequest.getOptionNo()); 
		if(hotelOptionNumbersQuotation>0) {
			modelView.setViewName("redirect:form_view_hotel_quotation_details?leadId="+leadRecorderObj.getLeadId() + "&quotationId="+qtnRecorderObj.getQuotationId()+ "&hotelOptionNo="+manualHotelRequest.getOptionNo());
		}
		else {
			quotationService.update_Rearrage_HotelOptions_For_Quotation(qtnRecorderObj.getQuotationId(),hotelOptionNo);
			modelView.setViewName("redirect:form_view_hotel_quotation_details?leadId="+leadRecorderObj.getLeadId() + "&quotationId="+qtnRecorderObj.getQuotationId());			
		}
		redirectAttrib.addFlashAttribute("Success","Hotel Stay Record Deleted Successfully!!");
		return modelView; 
	 }
	
	
	@ResponseBody
	@RequestMapping("getOptionWiseHotelMap")
	public Map<Integer,List<ManualHotelQuotationVO>> getOptionWiseHotelMap(long quotationId){
		return hotelService.findOptionWiseHotelMap(quotationId);
	}
}

