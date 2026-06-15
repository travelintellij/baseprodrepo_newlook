package com.udanchoo.intranet.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lowagie.text.DocumentException;
import com.udanchoo.intranet.entity.TI_Hotel_Voucher_Entity;
import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;
import com.udanchoo.intranet.entity.Udn_Hotel_Master_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.Udn_Deals_Recorder_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.vouchers.HotelVoucherVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.DealServiceImpl;
import com.udanchoo.intranet.service.DealServiceLineImpl;
import com.udanchoo.intranet.service.DocumentService;
import com.udanchoo.intranet.service.HotelServiceImpl;
import com.udanchoo.intranet.service.TgB2bPartnerServicesImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.service.VoucherServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.validator.CityNameValidator;


@Controller
public class VouchersController {


	@Autowired
	UserDetailsServiceImpl userDetailsService;

	@Autowired
    private DocumentService documentService;
	
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
	VoucherServiceImpl voucherServiceLine;

	
	@Autowired
	HotelServiceImpl hotelService;
	
	@Autowired
    private CityNameValidator cityValidator;
	
	@Autowired
	TgB2bPartnerServicesImpl b2bPartnerService;
	
	
 
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
    
    @PostMapping(value = "/manage_vouchers", params = "Manage Vouchers")
    public ModelAndView view_manage_vouchers(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("HTL_VCHR_OBJ") HotelVoucherVO hotelVoucherVO,  BindingResult result) {
    	ModelAndView modelView = new ModelAndView();
    	modelView.setViewName("forward:view_upload_file");
    	return modelView;
    }
    
    //@PostMapping("/view_form_create_hotel_voucher")
    @PostMapping(value = "/manage_vouchers", params = "Re / Generate Voucher")
    public ModelAndView view_form_create_hotel_voucher(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("HTL_VCHR_OBJ") HotelVoucherVO hotelVoucherVO,  BindingResult result) {
    	ModelAndView mapview = new ModelAndView();
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
     	Udn_Deals_Recorder_Obj dealRecorderObj = null;
     	try {
			dealRecorderObj = dealService.findDealEntityById(dealConfirmationId,userObj.getUserId(),isAdmin);
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mapview.addObject("DealObject", dealRecorderObj);
 		try {
 			if(voucherServiceLine.checkVoucherHtlServiceLineExist(hotelVoucherVO.getHtlServiceId())) {
 				TI_Hotel_Voucher_Entity hotelVoucherEntity= voucherServiceLine.find_HotelVoucher_By_HotelServiceId(hotelVoucherVO.getHtlServiceId());
 				hotelVoucherVO.updateVOFromEntity(hotelVoucherEntity);
 				hotelVoucherVO.setCityName(commonService.findDestinationById(hotelVoucherVO.getCityId()).getCityName());
 				hotelVoucherVO.setHotelName(hotelService.find_HotelbyId(hotelVoucherVO.getHotelId()).getHotelName());
 				hotelVoucherVO.setRoomCategoryName(hotelService.find_RoomCategoryById(hotelVoucherVO.getRoomCategoryId()).getRoomCategoryName());
 				hotelVoucherVO.setMealPlanName(UdanChooConstants.MEAL_PLANS_MAP.get(hotelVoucherVO.getMealPlan()).toString());
 			}
 			else {
 				hotelVoucherVO = dealServiceLine.find_HTLVCHR_By_HTL_SL_ID(hotelVoucherVO);
 				long millis=System.currentTimeMillis();
 				java.sql.Date voucherDate=new java.sql.Date(millis);
 				hotelVoucherVO.setVoucherDate(voucherDate);
 				
 				
 			}
 		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		List<Tg_B2b_Partner_Entity> b2bActivePartnerList = b2bPartnerService.findAllActivePartners();
    	Map<Integer, String> partersMap = (Map<Integer, String>) b2bActivePartnerList.stream().collect(
                 Collectors.toMap(Tg_B2b_Partner_Entity::getPartnerId, Tg_B2b_Partner_Entity::getPartnerName));
    	 mapview.addObject("PARTNERS_MAP", partersMap);
    	 mapview.addObject("HOTEL_BKNG_PMT_STATUS_MAP", UdanChooConstants.HOTEL_BKNG_PMT_STATUS_MAP);
 		mapview.setViewName("workload/hotel/form_createHotel_Voucher");
    	return mapview;
    }
    
    @PostMapping("/create_create_hotel_voucher")
    public ModelAndView create_create_hotel_voucher(@ModelAttribute("HTL_VCHR_OBJ") HotelVoucherVO hotelVoucherVO,  BindingResult result,final RedirectAttributes redirectAttrib) {
    	ModelAndView modelView= new ModelAndView();
    	modelView.setViewName("redirect:view_workload_HTL?dealConfirmationId="+hotelVoucherVO.getDealConfirmationId());
    	Map<String, Object> voucherInputDataMap = new HashMap<>();
    	boolean isSuccess=true;
    	if(!result.hasErrors()){
    		TI_Hotel_Voucher_Entity hotelVoucherEntity = new TI_Hotel_Voucher_Entity(hotelVoucherVO);
    		if(hotelVoucherVO.getHtlVoucherId()!=0) {
    			hotelVoucherEntity.setHtlVoucherId(hotelVoucherVO.getHtlVoucherId());
    		}
    		dealServiceLine.saveHotelVoucher(hotelVoucherEntity);
			hotelVoucherVO.setCityName(commonService.findDestinationById(hotelVoucherVO.getCityId()).getCityName());
			hotelVoucherVO.setRoomCategoryName(hotelService.find_RoomCategoryById(hotelVoucherVO.getRoomCategoryId()).getRoomCategoryName());
			hotelVoucherVO.setMealPlanName(UdanChooConstants.MEAL_PLANS_MAP.get(hotelVoucherVO.getMealPlan()).toString());
			hotelVoucherVO.setHtlVoucherId(hotelVoucherEntity.getHtlVoucherId());
			hotelVoucherVO.setStatusName(UdanChooConstants.HOTEL_BKNG_PMT_STATUS_MAP.get(hotelVoucherVO.getStatus()));
			voucherInputDataMap.put("hotelVoucherEntity",hotelVoucherVO);
    		
    		Tg_B2b_Partner_Entity b2bPartnersDTO = b2bPartnerService.findPartnerById(hotelVoucherVO.getB2bPartnerId());
    		voucherInputDataMap.put("b2bPartnersDTO",b2bPartnersDTO);
    		
    		Udn_Hotel_Master_Entity hotelMasterEntity=null;
			try {
				hotelMasterEntity = hotelService.find_HotelbyId(hotelVoucherVO.getHotelId());
				
			} catch (RecordNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
    		voucherInputDataMap.put("hotelMasterEntity",hotelMasterEntity);
    		Path tempLogoPath = null;
    		try {
                String tempDir = System.getProperty("java.io.tmpdir");
                Path tempPath = Paths.get(tempDir, "vouchers_temp");
                if (!Files.exists(tempPath)) Files.createDirectories(tempPath);

                String logoUrl = null;
                if (b2bPartnersDTO != null && b2bPartnersDTO.getLogoImage() != null && b2bPartnersDTO.getLogoImage().length > 0) {
                    tempLogoPath = tempPath.resolve("logo_" + b2bPartnersDTO.getPartnerId() + "_" + System.currentTimeMillis() + ".jpg");
                    Files.write(tempLogoPath, b2bPartnersDTO.getLogoImage());
                    logoUrl = tempLogoPath.toUri().toString();
                }
                voucherInputDataMap.put("LOGO_URL", logoUrl);

                String uploadType="Hotel";
                String voucherFileName="HTL_VOUCHER_"+ hotelVoucherVO.getHtlServiceId()+".pdf";

                String partnerBrand = (b2bPartnersDTO != null) ? b2bPartnersDTO.getPartnerBrandName() : "UdanChoo";
				voucherServiceLine.generatePdfFile("Hotel-Voucher-Templates/HotelVoucher", voucherInputDataMap, tempPath.toString(), voucherFileName, partnerBrand);
                
                Path generatedPdfPath = tempPath.resolve(voucherFileName);
                byte[] pdfBytes = Files.readAllBytes(generatedPdfPath);
                
                documentService.saveDocument("DEAL_Hotel", String.valueOf(hotelVoucherVO.getDealConfirmationId()), voucherFileName, "application/pdf", pdfBytes);

                Files.deleteIfExists(generatedPdfPath);
			} catch (Exception e) {
				e.printStackTrace();
                isSuccess=false;
			} finally {
                if (tempLogoPath != null) {
                    try {
                        Files.deleteIfExists(tempLogoPath);
                    } catch (Exception ex) {
                        ex.printStackTrace();
                    }
                }
            }
    		isSuccess=true;
    	}
    	else {
    		System.out.println("Error is " + result.getAllErrors());
    		isSuccess=false;
    	}
    	if(isSuccess) {
    		redirectAttrib.addFlashAttribute("Success", "Hotel Voucher Record is generated Successfully. !!");
    		
    	}else {
    		redirectAttrib.addFlashAttribute("Error", "Error: Creating Hotel Voucher Record. Please contact administrator!! ");
    	}

    	return modelView;
    }
    
    @Transactional
    @PostMapping(value="/deleteVoucher")
    public ModelAndView deleteVoucher(@RequestParam("dealConfirmationId") long dealConfirmationId,@RequestParam("htlServiceId") long htlServiceLineId,@RequestParam("fileName") String deleteFileName,@RequestParam("fileType") String fileType,final RedirectAttributes redirectAttrib) throws IOException {
		ModelAndView mapview = new ModelAndView();
		voucherServiceLine.delete_HotelVoucher_By_HotelServiceId(htlServiceLineId);
        try {
            documentService.deleteDocument(Long.parseLong(deleteFileName));
    		redirectAttrib.addFlashAttribute("Success", "Voucher is deleted Successfully ! ");
        } catch (Exception e) {
            e.printStackTrace();
        }
		mapview.setViewName("redirect:view_workload_HTL?dealConfirmationId="+dealConfirmationId);
    	return mapview;	
    }
  
}