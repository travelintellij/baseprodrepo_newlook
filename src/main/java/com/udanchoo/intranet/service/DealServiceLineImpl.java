package com.udanchoo.intranet.service;


import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.udanchoo.intranet.entity.TI_Hotel_Voucher_Entity;
import com.udanchoo.intranet.entity.UdnClientEntity;
import com.udanchoo.intranet.entity.UdnIncentiveEntity;
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
import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Doc_Map_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Doc_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Visa_Master_Entity;
import com.udanchoo.intranet.entity.quotation.Tg_Quotation_Recorder_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Flight_Quotation_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.ClientObj;
import com.udanchoo.intranet.model.CruiseServiceLineVO;
import com.udanchoo.intranet.model.EmailMessageVO;
import com.udanchoo.intranet.model.FlightServiceLineVO;
import com.udanchoo.intranet.model.HotelServiceLineVO;
import com.udanchoo.intranet.model.InsuranceServiceLineVO;
import com.udanchoo.intranet.model.LandPackageServiceLineVO;
import com.udanchoo.intranet.model.Mail;
import com.udanchoo.intranet.model.OtherServiceLineVO;
import com.udanchoo.intranet.model.SearchDealObj;
import com.udanchoo.intranet.model.SightSeeingServiceLineVO;
import com.udanchoo.intranet.model.TransferServiceLineVO;
import com.udanchoo.intranet.model.Udn_Visa_Doc_SL_Obj;
import com.udanchoo.intranet.model.Udn_Visa_Master_Obj;
import com.udanchoo.intranet.model.VisaServiceLineVO;
import com.udanchoo.intranet.model.VisaServiceStatusEmailFormObj;
import com.udanchoo.intranet.model.quotation.ManualFlightQuotationVO;
import com.udanchoo.intranet.model.vouchers.HotelVoucherVO;
import com.udanchoo.intranet.repository.ClientRepository;
import com.udanchoo.intranet.repository.CommonRepository;
import com.udanchoo.intranet.repository.DealRepository;
import com.udanchoo.intranet.repository.DealServiceLineRepository;
import com.udanchoo.intranet.repository.Deal_CRS_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_FLT_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_HTL_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_INS_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_LDP_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_OTH_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_STS_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_TRN_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_VSA_Doc_ServiceLine_Repository;
import com.udanchoo.intranet.repository.Deal_VSA_ServiceLine_Repository;
import com.udanchoo.intranet.repository.TI_Hotel_Voucher_Repository;
import com.udanchoo.intranet.repository.Ti_Deals_Team_Map_Repository;
import com.udanchoo.intranet.repository.Visa_Doc_Master_Repository;
import com.udanchoo.intranet.util.UdanChooConstants;

import freemarker.template.TemplateException;



@Service
public class DealServiceLineImpl {


	@Autowired
	Deal_FLT_ServiceLine_Repository fltServiceLineRespository;

	@Autowired
	DealServiceLineRepository dealServiceLineRepository;
	
	@Autowired
	Deal_INS_ServiceLine_Repository insServiceLineRespository;
	
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	SupplierServiceImpl supplierService;
	
	@Autowired
	Deal_HTL_ServiceLine_Repository htlServiceLineRespository;
	
	@Autowired
	Deal_STS_ServiceLine_Repository stsServiceLineRespository;
	
	@Autowired
	HotelServiceImpl hotelService;
	
	@Autowired
	Deal_LDP_ServiceLine_Repository ldpServiceLineRespository;
	
	@Autowired
	Deal_OTH_ServiceLine_Repository othServiceLineRespository;

	@Autowired
	SightSeeingServiceImpl sightSeeingService;
	
	@Autowired
	Deal_TRN_ServiceLine_Repository trnServiceLineRespository;
	
	@Autowired
	Deal_CRS_ServiceLine_Repository crsServiceLineRespository;

	
	@Autowired
	Deal_VSA_ServiceLine_Repository vsaServiceLineRespository;
	
	@Autowired
	Deal_VSA_Doc_ServiceLine_Repository  vsaDocServiceLineRespository;
	
	@Autowired
	Visa_Doc_Master_Repository visaDocMasterRepository;
	
	@Autowired
	EmailServiceImpl emailService;
	
	@Autowired
	VisaServiceImpl visaService;
	
	@Autowired
	TI_Hotel_Voucher_Repository hotelVoucherRespository;

	@Autowired
	DealServiceImpl dealService;

	@Autowired
	ClientServiceImpl clientService;
	
	@Autowired
	Ti_Deals_Team_Map_Repository dealTeamMapRepository;
	
	public List<FlightServiceLineVO> find_FLT_ServiceLines_Basedon_DealId(long dealconfirmationId,long dealOwner,boolean isAdmin){
		List<Udn_Deal_FLT_SL_Entity> fltSLList ;
		//if(isAdmin) {
			fltSLList =  dealServiceLineRepository.findFLTServiceLinesBasedonDealId(dealconfirmationId);
		/*}
		else {
			fltSLList =  dealServiceLineRepository.findFLTServiceLinesBasedonDealIdAndDealOwner(dealconfirmationId,dealOwner);
		}*/
		
		List<FlightServiceLineVO> listFltSlVO = new ArrayList();
		Iterator itrFltList = fltSLList.iterator();
		while(itrFltList.hasNext()) {
			FlightServiceLineVO flightSLVO = new FlightServiceLineVO((Udn_Deal_FLT_SL_Entity)itrFltList.next());
			//System.out.println("Air Line is " + commonService.findAirlinebyId(flightSLVO.getAirlineId()));
			flightSLVO.setAirlineShortName((commonService.findAirlinebyId(flightSLVO.getAirlineId())).getAirlineShortName());
			if(flightSLVO.getSupplierId()!=0) {
				flightSLVO.setSupplierName(supplierService.findSupplierById(flightSLVO.getSupplierId()).get().getSupplierName());
			}else {
				flightSLVO.setSupplierName("Booking Pending");
			}
			flightSLVO.setOriginCity(commonService.findAirportById(flightSLVO.getDepartingFrom()).getCityName());
			flightSLVO.setDestinationCity(commonService.findAirportById(flightSLVO.getArrivingTo()).getCityName());
			flightSLVO.setCabinClassName(UdanChooConstants.CABIN_CLASS.get(flightSLVO.getCabinClass()));
			//flightSLVO.setDepartingCity(commonService.findDestinationById(flightSLVO.getDepartingFrom()).getCityName());
			//flightSLVO.setArrivalCity(commonService.findDestinationById(flightSLVO.getArrivingTo()).getCityName());
			flightSLVO.setStatusName(commonService.find_SL_Deal_Obj_Based_On_Status("FLT_SL",flightSLVO.getStatus()).getWorkloadStatusName());
			
			listFltSlVO.add(flightSLVO);
		}
		return listFltSlVO;
		
	} 

	
	
	public Udn_Deal_Services_Entity find_Service_Map_Deal(long dealConfirmationId,String dealServiceCode,int dealOwner,boolean isAdmin) {
		Udn_Deal_Services_Entity dealServiceEntity ;
		if(isAdmin) {
			dealServiceEntity =  dealServiceLineRepository.find_Service_Map_Deal(dealConfirmationId, dealServiceCode);
			
		}else {
			//return dealServiceLineRepository.find_Service_Map_DealWithOwner(dealConfirmationId, dealServiceCode, dealOwner);
			dealServiceEntity =  dealServiceLineRepository.find_Service_Map_DealWithOwner(dealConfirmationId, dealServiceCode, dealOwner);
		}
		if(dealServiceEntity==null) {
			if(dealTeamMapRepository.existsByDealConfirmationIdAndUserId(dealConfirmationId, dealOwner)){
				dealServiceEntity =  dealServiceLineRepository.find_Service_Map_Deal(dealConfirmationId, dealServiceCode);	
			}
		}
		return dealServiceEntity;
		 
	}

	/******** following section deals with all flight service line operations *********/
	
	public Udn_Deal_FLT_SL_Entity saveFlightServiceLine(Udn_Deal_FLT_SL_Entity flightSLEntity) {
		fltServiceLineRespository.save(flightSLEntity);
		return flightSLEntity;
		
	}
	
	public void deleteFlightServiceLine(String fltServiceId) throws RecordNotFoundException {
		Optional<Udn_Deal_FLT_SL_Entity> fltSLEntity = fltServiceLineRespository.findById(Long.valueOf(fltServiceId));
	    if(fltSLEntity.isPresent()) {  
	    	fltServiceLineRespository.delete(fltSLEntity.get());
	    }
	    else {
	    	throw new RecordNotFoundException("Flight Service Line doesnot exist. ");
	    }
		// .orElseThrow(() -> new ResourceNotFoundException("Flight Serviceline not found for this id :: " + fltServiceId));

	}
	
	public FlightServiceLineVO findByFLT_SL_ID(FlightServiceLineVO flightServiceLineVO) {
		Optional<Udn_Deal_FLT_SL_Entity> orgFLT_SL_Entity = fltServiceLineRespository.findById(flightServiceLineVO.getFltServiceId());
		//FlightServiceLineVO orgFltSLVo =null ;
		if(orgFLT_SL_Entity.isPresent()) {
    		//orgFltSLVo = new FlightServiceLineVO(orgFLT_SL_Entity.get());
			flightServiceLineVO.updateFlightServiceLineVOFromEntity(orgFLT_SL_Entity.get());
			flightServiceLineVO.setOriginCity(commonService.findAirportById(flightServiceLineVO.getDepartingFrom()).getCityName());
			flightServiceLineVO.setDestinationCity(commonService.findAirportById(flightServiceLineVO.getArrivingTo()).getCityName());
			flightServiceLineVO.setAirlineShortName((commonService.findAirlinebyId(flightServiceLineVO.getAirlineId())).getAirlineShortName());
    		if(flightServiceLineVO.getSupplierId()!=0) {
    			flightServiceLineVO.setSupplierName(supplierService.findSupplierById(flightServiceLineVO.getSupplierId()).get().getSupplierName());
    		}
    		else {
    			flightServiceLineVO.setSupplierName("Booking Update Pending");
    		}
    		flightServiceLineVO.setStatusName(commonService.find_SL_Deal_Obj_Based_On_Status("FLT_SL",flightServiceLineVO.getStatus()).getWorkloadStatusName());
    	}
    	
		return flightServiceLineVO;
	}
	
	public Optional<Udn_Deal_FLT_SL_Entity>  findByFLT_ENTITY_SL_ID(long fltServiceId) {
		return fltServiceLineRespository.findById(fltServiceId);
	}
	
	/***************************************HTL Service line start from here ********************************************/
	
	public List<HotelServiceLineVO> find_HTL_ServiceLines_Basedon_DealId(long dealconfirmationId,long dealOwner,boolean isAdmin) throws RecordNotFoundException{
		List<Udn_Deal_HTL_SL_Entity> htlSLList;
		if(isAdmin) {
			htlSLList =  dealServiceLineRepository.findHTLServiceLinesBasedonDealId(dealconfirmationId);
		}
		else {
			htlSLList =  dealServiceLineRepository.findHTLServiceLinesBasedonDealIdAndDealOwner(dealconfirmationId,dealOwner);
		}
		
		List<HotelServiceLineVO> listHtlSlVO = new ArrayList();
		
		Iterator itrHtlList = htlSLList.iterator();
		while(itrHtlList.hasNext()) {
			HotelServiceLineVO hotelSLVO = new HotelServiceLineVO((Udn_Deal_HTL_SL_Entity)itrHtlList.next());
			hotelSLVO.setCityName(commonService.findDestinationById(hotelSLVO.getCityId()).getCityName());
			hotelSLVO.setHotelName(hotelService.find_HotelbyId(hotelSLVO.getHotelId()).getHotelName());
			hotelSLVO.setRoomCategoryName(hotelService.find_RoomCategoryById(hotelSLVO.getRoomCategoryId()).getRoomCategoryName());
			hotelSLVO.setStatusName(commonService.find_DealStatusById(hotelSLVO.getStatus()).getWorkloadStatusName());
			hotelSLVO.setSupplierName(supplierService.findSupplierById(hotelSLVO.getSupplierId()).get().getSupplierName());
			hotelSLVO.setMealPlanName(UdanChooConstants.MEAL_PLANS_MAP.get(hotelSLVO.getMealPlan()));
			/*
			flightSLVO.setAirlineShortName((commonService.findAirlinebyId(flightSLVO.getAirlineId())).getAirlineShortName());
			flightSLVO.setSupplierName(supplierService.findSupplierById(flightSLVO.getSupplierId()).get().getSupplierName());
			flightSLVO.setDepartingCity(commonService.findDestinationById(flightSLVO.getDepartingFrom()).getCityName());
			flightSLVO.setArrivalCity(commonService.findDestinationById(flightSLVO.getArrivingTo()).getCityName());
			flightSLVO.setStatusName(commonService.find_SL_Deal_Obj_Based_On_Status("FLT_SL",flightSLVO.getStatus()).getWorkloadStatusName());
			*/
			listHtlSlVO.add(hotelSLVO);
		}
		return listHtlSlVO;
	} 
	
	public Udn_Deal_HTL_SL_Entity saveHotelServiceLine(Udn_Deal_HTL_SL_Entity hotelSLEntity) {
		htlServiceLineRespository.save(hotelSLEntity);
		return hotelSLEntity;
		
	}
	
	public HotelServiceLineVO findByHTL_SL_ID(HotelServiceLineVO htlServiceLineVO) throws RecordNotFoundException {
		Optional<Udn_Deal_HTL_SL_Entity> orgHTL_SL_Entity = htlServiceLineRespository.findById(htlServiceLineVO.getHtlServiceId());
		//HotelServiceLineVO orgHtlSLVo =null ;
		if(orgHTL_SL_Entity.isPresent()) {
			//orgHtlSLVo = new HotelServiceLineVO(orgHTL_SL_Entity.get());
			htlServiceLineVO.updateHTLSLVoFrmEntity(orgHTL_SL_Entity.get());
			htlServiceLineVO.setCityName(commonService.findDestinationById(orgHTL_SL_Entity.get().getCityId()).getCityName());
			htlServiceLineVO.setHotelName(hotelService.find_HotelbyId(orgHTL_SL_Entity.get().getHotelId()).getHotelName());
			htlServiceLineVO.setStatusName(commonService.find_DealStatusById(htlServiceLineVO.getStatus()).getWorkloadStatusName());
			htlServiceLineVO.setSupplierName(supplierService.findSupplierById(htlServiceLineVO.getSupplierId()).get().getSupplierName());
			htlServiceLineVO.setRoomCategoryName(hotelService.find_RoomCategoryById(htlServiceLineVO.getRoomCategoryId()).getRoomCategoryName());
			htlServiceLineVO.setMealPlanName(UdanChooConstants.MEAL_PLANS_MAP.get(htlServiceLineVO.getMealPlan()));
			//orgHtlSLVo.setArrivalCity(commonService.findDestinationById(orgFLT_SL_Entity.get().getArrivingTo()).getCityName());
    	}
    	
		return htlServiceLineVO;
	}
	
	public HotelVoucherVO find_HTLVCHR_By_HTL_SL_ID(HotelVoucherVO htlVoucherVO) throws RecordNotFoundException {
		Optional<Udn_Deal_HTL_SL_Entity> orgHTL_SL_Entity = htlServiceLineRespository.findById(htlVoucherVO.getHtlServiceId());
		//HotelServiceLineVO orgHtlSLVo =null ;
		if(orgHTL_SL_Entity.isPresent()) {
			//orgHtlSLVo = new HotelServiceLineVO(orgHTL_SL_Entity.get());
			htlVoucherVO.updateHTLSLVoFrmEntity(orgHTL_SL_Entity.get());
			htlVoucherVO.setCityName(commonService.findDestinationById(orgHTL_SL_Entity.get().getCityId()).getCityName());
			htlVoucherVO.setHotelName(hotelService.find_HotelbyId(orgHTL_SL_Entity.get().getHotelId()).getHotelName());
			htlVoucherVO.setStatusName(commonService.find_DealStatusById(htlVoucherVO.getStatus()).getWorkloadStatusName());
			htlVoucherVO.setSupplierName(supplierService.findSupplierById(htlVoucherVO.getSupplierId()).get().getSupplierName());
			htlVoucherVO.setRoomCategoryName(hotelService.find_RoomCategoryById(htlVoucherVO.getRoomCategoryId()).getRoomCategoryName());
			htlVoucherVO.setMealPlanName(UdanChooConstants.MEAL_PLANS_MAP.get(htlVoucherVO.getMealPlan()));
			ClientObj clientObj = clientService.find_ClientBy_Id(dealService.find_DealEntityBy_Id(orgHTL_SL_Entity.get().getDealConfirmationId()).getClientId());
			htlVoucherVO.setClientName(clientObj.getClientName());
			htlVoucherVO.setPhoneNumber(clientObj.getMobile().toString());
			//orgHtlSLVo.setArrivalCity(commonService.findDestinationById(orgFLT_SL_Entity.get().getArrivingTo()).getCityName());
    	}
    	
		return htlVoucherVO;
	}
	
	public void deleteHotelServiceLine(int htlServiceId) throws RecordNotFoundException {
		Optional<Udn_Deal_HTL_SL_Entity> htlSLEntity = htlServiceLineRespository.findById((long) htlServiceId);
	    if(htlSLEntity.isPresent()) {  
	    	htlServiceLineRespository.delete(htlSLEntity.get());
	    }
	    else {
	    	throw new RecordNotFoundException("Hotel Service Line doesnot exist. ");
	    }
		// .orElseThrow(() -> new ResourceNotFoundException("Flight Serviceline not found for this id :: " + fltServiceId));

	}

	/**************************************Insurance Service Line Code ***************************************************/
	
	public List<InsuranceServiceLineVO> find_INS_ServiceLines_Basedon_DealId(long dealconfirmationId,long dealOwner,boolean isAdmin){
		List<Udn_Deal_INS_SL_Entity> insSLList;
		
		if(isAdmin) {
			insSLList =  dealServiceLineRepository.findINSServiceLinesBasedonDealId(dealconfirmationId);
		}
		else {
			insSLList =  dealServiceLineRepository.findINSServiceLinesBasedonDealIdAndOwner(dealconfirmationId,dealOwner);
		}
		List<InsuranceServiceLineVO> listInsSlVO = new ArrayList<InsuranceServiceLineVO>();
		
		Iterator<Udn_Deal_INS_SL_Entity> itrInsList = insSLList.iterator();
		while(itrInsList.hasNext()) {
			InsuranceServiceLineVO insuranceSLVO = new InsuranceServiceLineVO((Udn_Deal_INS_SL_Entity)itrInsList.next());
			//System.out.println("Air Line is " + commonService.findAirlinebyId(flightSLVO.getAirlineId()));
			insuranceSLVO.setSupplierName(supplierService.findSupplierById(insuranceSLVO.getSupplierId()).get().getSupplierName());
			insuranceSLVO.setDestinationName(commonService.findDestinationById(insuranceSLVO.getDestinationId()).getCityName());
			insuranceSLVO.setStatusName(commonService.find_SL_Deal_Obj_Based_On_Status("INS_SL",insuranceSLVO.getStatus()).getWorkloadStatusName());
			insuranceSLVO.setInsuranceProviderName(UdanChooConstants.INSURANCE_PROVIDERS_MAP.get(insuranceSLVO.getInsuranceProvider()));
			insuranceSLVO.setInsuranceTypeName(UdanChooConstants.INSURANCE_TYPE_MAP.get(insuranceSLVO.getInsuranceType()));
			listInsSlVO.add(insuranceSLVO);
		}
		return listInsSlVO;
		
	} 
	
	public Udn_Deal_INS_SL_Entity saveInsuranceServiceLine(Udn_Deal_INS_SL_Entity insuranceSLEntity) {
		insServiceLineRespository.save(insuranceSLEntity);
		return insuranceSLEntity;
		
	}
	public InsuranceServiceLineVO findByINS_SL_ID(InsuranceServiceLineVO orgInsSLVo) {
		Optional<Udn_Deal_INS_SL_Entity> orgINS_SL_Entity = insServiceLineRespository.findById(orgInsSLVo.getInsServiceId());
		//InsuranceServiceLineVO orgInsSLVo =null ;
		if(orgINS_SL_Entity.isPresent()) {
			//orgInsSLVo = new InsuranceServiceLineVO(orgINS_SL_Entity.get());
			orgInsSLVo.updateVoFromEntity(orgINS_SL_Entity.get());
			orgInsSLVo.setDestinationName(commonService.findDestinationById(orgINS_SL_Entity.get().getDestinationId()).getCityName());
			orgInsSLVo.setStatusName(commonService.find_SL_Deal_Obj_Based_On_Status("INS_SL",orgInsSLVo.getStatus()).getWorkloadStatusName());
			orgInsSLVo.setSupplierName(supplierService.findSupplierById(orgInsSLVo.getSupplierId()).get().getSupplierName());
			orgInsSLVo.setInsuranceProviderName(UdanChooConstants.INSURANCE_PROVIDERS_MAP.get(orgInsSLVo.getInsuranceProvider()));
			orgInsSLVo.setInsuranceTypeName(UdanChooConstants.INSURANCE_TYPE_MAP.get(orgInsSLVo.getInsuranceType()));
    	}
    	
		return orgInsSLVo;
	}
	
	public void delete_Insurance_ServiceLine(int insServiceId) throws RecordNotFoundException {
		Optional<Udn_Deal_INS_SL_Entity> insSLEntity = insServiceLineRespository.findById((long) insServiceId);
	    if(insSLEntity.isPresent()) {  
	    	insServiceLineRespository.delete(insSLEntity.get());
	    }
	    else {
	    	throw new RecordNotFoundException("Insurance Service Line doesnot exist. ");
	    }
		// .orElseThrow(() -> new ResourceNotFoundException("Flight Serviceline not found for this id :: " + fltServiceId));

	}

	/********************************************************************************************************************/
	public List<LandPackageServiceLineVO> find_LDP_ServiceLines_Basedon_DealId(long dealconfirmationId,long dealOwner,boolean isAdmin){
		List<Udn_Deal_LDP_SL_Entity> ldpSLList; 
		if(isAdmin) {
			ldpSLList =  dealServiceLineRepository.findLDPServiceLinesBasedonDealId(dealconfirmationId);
		}
		else {
			ldpSLList =  dealServiceLineRepository.findLDPServiceLinesBasedonDealIdAndOwner(dealconfirmationId,dealOwner);
		}
		List<LandPackageServiceLineVO> listLdpSlVO = new ArrayList<LandPackageServiceLineVO>();
		Iterator<Udn_Deal_LDP_SL_Entity> itrLdpList = ldpSLList.iterator();
		while(itrLdpList.hasNext()) {
			LandPackageServiceLineVO landPackageSLVO = new LandPackageServiceLineVO((Udn_Deal_LDP_SL_Entity)itrLdpList.next());
			landPackageSLVO.setSupplierName(supplierService.findSupplierById(landPackageSLVO.getSupplierId()).get().getSupplierName());
			landPackageSLVO.setDestinationName(commonService.findDestinationById(landPackageSLVO.getDestinationId()).getCityName());
			if(landPackageSLVO.getStatus()==0) {
				landPackageSLVO.setStatusName("Supplier Selection Pending");
			}
			else {
				landPackageSLVO.setStatusName(commonService.find_SL_Deal_Obj_Based_On_Status(UdanChooConstants.WORKLOAD_LDP_SL_OBJ,landPackageSLVO.getStatus()).getWorkloadStatusName());
			}
			listLdpSlVO.add(landPackageSLVO);
		}
		return listLdpSlVO;
	}
	

	public Udn_Deal_LDP_SL_Entity saveLandPackageServiceLine(Udn_Deal_LDP_SL_Entity landPackageSLEntity) {
		ldpServiceLineRespository.save(landPackageSLEntity);
		return landPackageSLEntity;
		
	}
	
	public LandPackageServiceLineVO find_LDP_ServiceLine_ById(LandPackageServiceLineVO landPackageSLVO) {
		Udn_Deal_LDP_SL_Entity  landPackageSLEntity = ldpServiceLineRespository.findById(landPackageSLVO.getLdpServiceId()).get();
		//LandPackageServiceLineVO landPackageSLVO = new LandPackageServiceLineVO(landPackageSLEntity);
		landPackageSLVO.updateLandPackageVoFromEntity(landPackageSLEntity);
		landPackageSLVO.setDestinationName(commonService.findDestinationById(landPackageSLVO.getDestinationId()).getCityName());
		if(landPackageSLVO.getStatus()!=0) {
			landPackageSLVO.setStatusName(commonService.find_SL_Deal_Obj_Based_On_Status(UdanChooConstants.WORKLOAD_LDP_SL_OBJ,landPackageSLVO.getStatus()).getWorkloadStatusName());
		}
		landPackageSLVO.setSupplierName(supplierService.findSupplierById(landPackageSLVO.getSupplierId()).get().getSupplierName());
		return landPackageSLVO;
		
	}
	public void delete_LandPackage_ServiceLine(long ldpServiceId) throws RecordNotFoundException {
		Optional<Udn_Deal_LDP_SL_Entity> ldpSLEntity = ldpServiceLineRespository.findById(ldpServiceId);
	    if(ldpSLEntity.isPresent()) {  
	    	ldpServiceLineRespository.delete(ldpSLEntity.get());
	    }
	    else {
	    	throw new RecordNotFoundException("Land Package Service Line doesnot exist. ");
	    }
		// .orElseThrow(() -> new ResourceNotFoundException("Flight Serviceline not found for this id :: " + fltServiceId));

	}
	
	/****************************** OTHER SERVICE LINE STARTS HERE ***************************************/
	public List<OtherServiceLineVO> find_OTH_ServiceLines_Basedon_DealId(long dealconfirmationId,long dealOwner,boolean isAdmin){
		List<Udn_Deal_OTH_SL_Entity> othSLList; 
		if(isAdmin) {
			othSLList =  dealServiceLineRepository.findOTHServiceLinesBasedonDealId(dealconfirmationId);
		}else {
			othSLList =  dealServiceLineRepository.findOTHServiceLinesBasedonDealIdAndOwner(dealconfirmationId,dealOwner);
		}

		List<OtherServiceLineVO> listOthSlVO = new ArrayList();
		
		Iterator itrOthList = othSLList.iterator();
		while(itrOthList.hasNext()) {
			OtherServiceLineVO otherSLVO = new OtherServiceLineVO((Udn_Deal_OTH_SL_Entity)itrOthList.next());
			//System.out.println("Air Line is " + commonService.findAirlinebyId(flightSLVO.getAirlineId()));
			otherSLVO.setSupplierName(supplierService.findSupplierById(otherSLVO.getSupplierId()).get().getSupplierName());
			otherSLVO.setStatusName(commonService.find_SL_Deal_Obj_Based_On_Status("OTH_SL",otherSLVO.getStatus()).getWorkloadStatusName());
			listOthSlVO.add(otherSLVO);
		}
		return listOthSlVO;
		
	} 
	public Udn_Deal_OTH_SL_Entity saveOtherServiceLine(Udn_Deal_OTH_SL_Entity otherSLEntity) {
		othServiceLineRespository.save(otherSLEntity);
		return otherSLEntity;
		
	}
	
	public OtherServiceLineVO findByOTH_SL_ID(OtherServiceLineVO othServiceLineVO) {
		Optional<Udn_Deal_OTH_SL_Entity> orgOTH_SL_Entity = othServiceLineRespository.findById(othServiceLineVO.getOthServiceId());
		//OtherServiceLineVO otherSLVO =null ;
		if(orgOTH_SL_Entity.isPresent()) {
			//otherSLVO = new OtherServiceLineVO(orgFLT_SL_Entity.get());
			othServiceLineVO.updateVOFromEntity(orgOTH_SL_Entity.get());
			othServiceLineVO.setSupplierName(supplierService.findSupplierById(othServiceLineVO.getSupplierId()).get().getSupplierName());
			othServiceLineVO.setStatusName(commonService.find_SL_Deal_Obj_Based_On_Status("OTH_SL",othServiceLineVO.getStatus()).getWorkloadStatusName());

    	}
    	
		return othServiceLineVO;
	}
	
	public void delete_Other_ServiceLine(long othServiceId) throws RecordNotFoundException {
		Optional<Udn_Deal_OTH_SL_Entity> othSLEntity = othServiceLineRespository.findById(othServiceId);
	    if(othSLEntity.isPresent()) {  
	    	othServiceLineRespository.delete(othSLEntity.get());
	    }
	    else {
	    	throw new RecordNotFoundException("Other Service Line doesnot exist. ");
	    }
		// .orElseThrow(() -> new ResourceNotFoundException("Flight Serviceline not found for this id :: " + fltServiceId));

	}
	
	/*********************************** STS Service Line Starts from here ***********************/
	
	public List<SightSeeingServiceLineVO> find_STS_ServiceLines_Basedon_DealId(long dealconfirmationId,long dealOwner,boolean isAdmin) throws RecordNotFoundException{
		List<Udn_Deal_STS_SL_Entity> stsSLList; 
		if(isAdmin) {
			stsSLList=  dealServiceLineRepository.findSTSServiceLinesBasedonDealId(dealconfirmationId);
		}
		else {
			stsSLList=  dealServiceLineRepository.findSTSServiceLinesBasedonDealIdAndOwner(dealconfirmationId,dealOwner);
		}
		List<SightSeeingServiceLineVO> listStsSlVO = new ArrayList();
		
		Iterator itrStsList = stsSLList.iterator();
		while(itrStsList.hasNext()) {
			SightSeeingServiceLineVO stsSLVO = new SightSeeingServiceLineVO((Udn_Deal_STS_SL_Entity)itrStsList.next());
			stsSLVO.setCityName(commonService.findDestinationById(stsSLVO.getCityId()).getCityName());
			//stsSLVO.setSightSeeingName(sightSeeingService.find_SightSeeingById(stsSLVO.getSightSeeingId()).getSightSeeingName());
			stsSLVO.setSightSeeingName(stsSLVO.getSightSeeingName());
			stsSLVO.setStatusName(commonService.find_DealStatusById(stsSLVO.getStatus()).getWorkloadStatusName());
			stsSLVO.setSupplierName(supplierService.findSupplierById(stsSLVO.getSupplierId()).get().getSupplierName());
			stsSLVO.setTransferTypeName(UdanChooConstants.TRANSFER_TYPE_MODE.get(stsSLVO.getTransferType()));
			listStsSlVO.add(stsSLVO);
		}
		return listStsSlVO;
	} 
	
	public Udn_Deal_STS_SL_Entity saveSightSeeingServiceLine(Udn_Deal_STS_SL_Entity sightSeeingSLEntity) {
		stsServiceLineRespository.save(sightSeeingSLEntity);
		return sightSeeingSLEntity;
	}
	
	public SightSeeingServiceLineVO findBySTS_SL_ID(SightSeeingServiceLineVO orgStsSLVo) throws RecordNotFoundException {
		Optional<Udn_Deal_STS_SL_Entity> orgSTS_SL_Entity = stsServiceLineRespository.findById(orgStsSLVo.getStsServiceId());
		//SightSeeingServiceLineVO orgStsSLVo =null ;
		if(orgSTS_SL_Entity.isPresent()) {
			orgStsSLVo.updateVoFromEntity(orgSTS_SL_Entity.get());
			//orgStsSLVo = new SightSeeingServiceLineVO(orgSTS_SL_Entity.get());
			orgStsSLVo.setCityName(commonService.findDestinationById(orgSTS_SL_Entity.get().getCityId()).getCityName());
			//orgStsSLVo.setSightSeeingName(sightSeeingService.find_SightSeeingById(orgStsSLVo.getSightSeeingId()).getSightSeeingName());
			orgStsSLVo.setStatusName(commonService.find_DealStatusById(orgStsSLVo.getStatus()).getWorkloadStatusName());
			orgStsSLVo.setSupplierName(supplierService.findSupplierById(orgStsSLVo.getSupplierId()).get().getSupplierName());
			orgStsSLVo.setTransferTypeName(UdanChooConstants.TRANSFER_TYPE_MODE.get(orgStsSLVo.getTransferType()));
    	}
		return orgStsSLVo;
	}
	
	public void delete_SightSeeing_ServiceLine(long stsServiceId) throws RecordNotFoundException {
		Optional<Udn_Deal_STS_SL_Entity> stsSLEntity = stsServiceLineRespository.findById(stsServiceId);
	    if(stsSLEntity.isPresent()) {  
	    	stsServiceLineRespository.delete(stsSLEntity.get());
	    }
	    else {
	    	throw new RecordNotFoundException("Sight Seeing Service Line doesnot exist. ");
	    }
	}
	
	/*********************************** TRN Service Line Starts from here ***********************/
	
	public List<TransferServiceLineVO> find_TRN_ServiceLines_Basedon_DealId(long dealconfirmationId,long dealOwner,boolean isAdmin) throws RecordNotFoundException{
		List<Udn_Deal_TRN_SL_Entity> trnSLList;
		if(isAdmin) {
			trnSLList =  dealServiceLineRepository.findTRNServiceLinesBasedonDealId(dealconfirmationId);
		}
		else {
			trnSLList =  dealServiceLineRepository.findTRNServiceLinesBasedonDealIdAndOwner(dealconfirmationId,dealOwner);
		}
		List<TransferServiceLineVO> listTrnSlVO = new ArrayList();
		
		Iterator itrTrnList = trnSLList.iterator();
		while(itrTrnList.hasNext()) {
			TransferServiceLineVO trnSLVO = new TransferServiceLineVO((Udn_Deal_TRN_SL_Entity)itrTrnList.next());
			trnSLVO.setPickupCityName(commonService.findDestinationById(trnSLVO.getPickupCityId()).getCityName());
			trnSLVO.setPickupTransferPointName(UdanChooConstants.TRANSFER_POINT_MAP.get(trnSLVO.getPickUpFrom()));
			trnSLVO.setDropTransferPointName(UdanChooConstants.TRANSFER_POINT_MAP.get(trnSLVO.getDropTo()));
			trnSLVO.setTransferTypeName(UdanChooConstants.TRANSFER_TYPE_MODE.get(trnSLVO.getTransferType()));
			trnSLVO.setDropCityName(commonService.findDestinationById(trnSLVO.getDropCityId()).getCityName());
			trnSLVO.setStatusName(commonService.find_DealStatusById(trnSLVO.getStatus()).getWorkloadStatusName());
			trnSLVO.setSupplierName(supplierService.findSupplierById(trnSLVO.getSupplierId()).get().getSupplierName());
			listTrnSlVO.add(trnSLVO);
		}
		return listTrnSlVO;
	} 
	
	public Udn_Deal_TRN_SL_Entity saveTransferServiceLine(Udn_Deal_TRN_SL_Entity transferSLEntity) {
		trnServiceLineRespository.save(transferSLEntity);
		return transferSLEntity;
	}
	
	public TransferServiceLineVO findByTRN_SL_ID(TransferServiceLineVO orgTrnSLVo) throws RecordNotFoundException {
		Optional<Udn_Deal_TRN_SL_Entity> orgTRN_SL_Entity = trnServiceLineRespository.findById(orgTrnSLVo.getTrnServiceId());
		//TransferServiceLineVO orgTrnSLVo =null ;
		if(orgTRN_SL_Entity.isPresent()) {
			//orgTrnSLVo = new TransferServiceLineVO(orgTRN_SL_Entity.get());
			orgTrnSLVo.updateTransferFromEntity(orgTRN_SL_Entity.get());
			orgTrnSLVo.setPickupTransferPointName(UdanChooConstants.TRANSFER_POINT_MAP.get(orgTrnSLVo.getPickUpFrom()));
			orgTrnSLVo.setDropTransferPointName(UdanChooConstants.TRANSFER_POINT_MAP.get(orgTrnSLVo.getDropTo()));
			orgTrnSLVo.setPickupCityName(commonService.findDestinationById(orgTRN_SL_Entity.get().getPickupCityId()).getCityName());
			orgTrnSLVo.setDropCityName(commonService.findDestinationById(orgTRN_SL_Entity.get().getDropCityId()).getCityName());
			orgTrnSLVo.setStatusName(commonService.find_DealStatusById(orgTrnSLVo.getStatus()).getWorkloadStatusName());
			orgTrnSLVo.setSupplierName(supplierService.findSupplierById(orgTrnSLVo.getSupplierId()).get().getSupplierName());
    	}
		return orgTrnSLVo;
	}
	
	public void delete_Transfer_ServiceLine(long trnServiceId) throws RecordNotFoundException {
		Optional<Udn_Deal_TRN_SL_Entity> trnSLEntity = trnServiceLineRespository.findById(trnServiceId);
	    if(trnSLEntity.isPresent()) {  
	    	trnServiceLineRespository.delete(trnSLEntity.get());
	    }
	    else {
	    	throw new RecordNotFoundException("Transfer Service Line doesnot exist. ");
	    }
	}
	
	/***************************** VSA Service Line Code Starts from here *******************************/
	
	
	public List<VisaServiceLineVO> find_VSA_ServiceLines_Basedon_DealId(long dealconfirmationId,long dealOwner,boolean isAdmin) {
		List<Udn_Deal_VSA_SL_Entity> vsaSLList; 
		if(isAdmin)
			vsaSLList =  dealServiceLineRepository.findVSAServiceLinesBasedonDealId(dealconfirmationId);
			
		else {
			vsaSLList =  dealServiceLineRepository.findVSAServiceLinesBasedonDealIdAndOwner(dealconfirmationId,dealOwner);
		}
		
		
		List<VisaServiceLineVO> listVsaSlVO = new ArrayList();
		
		Iterator itrVsaList = vsaSLList.iterator();
		while(itrVsaList.hasNext()) {
			Udn_Deal_VSA_SL_Entity visaSLEntity = (Udn_Deal_VSA_SL_Entity)itrVsaList.next();
			VisaServiceLineVO visaSLVO = new VisaServiceLineVO(visaSLEntity);
			Udn_Visa_Master_Entity visaMasterEntity = 	visaService.findVisaEntityById(visaSLVO.getVisaId());
			visaSLVO.setVisaPurpose(visaMasterEntity.getVisaPurpose());
			visaSLVO.setVisaType(visaMasterEntity.getVisaType());
			visaSLVO.setProfile(visaMasterEntity.getProfile());
			visaSLVO.setCountryCode(visaMasterEntity.getCountryCode());
			visaSLVO.setSupplierName(supplierService.findSupplierById(visaSLVO.getSupplierId()).get().getSupplierName());
			visaSLVO.setCountryName(commonService.findDestinationByCountryCode(visaSLVO.getCountryCode()).getCountryName());
			for(Udn_Visa_Doc_SL_Entity visaDocEntity:visaSLEntity.getVisaDocumentEntityList()) {
				Udn_Visa_Doc_SL_Obj visaDocSLOvj = new Udn_Visa_Doc_SL_Obj(visaDocEntity);
				visaDocSLOvj.setStatusName(commonService.find_SL_Deal_Obj_Based_On_Status("VSA_SL_DOC",visaDocSLOvj.getStatus()).getWorkloadStatusName());
				visaSLVO.getVisaDocumentEntityList().add(visaDocSLOvj);
			}
			
			if(visaSLVO.getStatus()!=0) {
				visaSLVO.setStatusName(commonService.find_SL_Deal_Obj_Based_On_Status("VSA_SL",visaSLVO.getStatus()).getWorkloadStatusName());
			}
			else {
				visaSLVO.setStatusName("Workload Created");
			}
			listVsaSlVO.add(visaSLVO);
		}
		return listVsaSlVO;
	}
	
	
	public Udn_Deal_VSA_SL_Entity saveVisaServiceLineWithoutImport(Udn_Deal_VSA_SL_Entity visaSLEntity) {
		visaSLEntity = vsaServiceLineRespository.save(visaSLEntity);
		return visaSLEntity;
	}
	
	
	@Transactional
	public Udn_Deal_VSA_SL_Entity saveVisaServiceLine(Udn_Deal_VSA_SL_Entity visaSLEntity) {
		//visaSLEntity = vsaServiceLineRespository.save(visaSLEntity);
		List VisaDocMasterList = visaDocMasterRepository.find_All_VisaDocsBy_VisaId(visaSLEntity.getVisaId());
		Iterator itrVisaDocList = VisaDocMasterList.iterator();
		List<Udn_Visa_Doc_SL_Entity> visaDocServicLineImportList = new ArrayList();
		while(itrVisaDocList.hasNext()) {
			Udn_Visa_Doc_Map_Entity visaDocMasterEntity = (Udn_Visa_Doc_Map_Entity) itrVisaDocList.next(); 
			Udn_Visa_Doc_SL_Entity visaDocSlEntityImport = new Udn_Visa_Doc_SL_Entity();
			visaDocSlEntityImport.setDescription(visaDocMasterEntity.getDescription());
			visaDocSlEntityImport.setDocumentCustody(UdanChooConstants.VISA_DOC_CUSTODY_CLIENT);
			visaDocSlEntityImport.setDocumentTitle(visaDocMasterEntity.getDocumentTitle());
			visaDocSlEntityImport.setRemarks("DEFAULT REMARKS: FRESH-IMPORTED");
			visaDocSlEntityImport.setStatus(UdanChooConstants.UDN_DEFAULT_VSA_DOC_STATUS_PENDING);
			visaDocSlEntityImport.setVsaServiceId(visaSLEntity);
			visaDocServicLineImportList.add(visaDocSlEntityImport);
		}
		Set docSet = new HashSet();
		docSet.addAll(visaDocServicLineImportList);
		visaSLEntity.setVisaDocumentEntityList(docSet);
		//System.out.println("Visa SL Entity created is " + visaSLEntity);
		visaSLEntity = vsaServiceLineRespository.save(visaSLEntity);
		//vsaDocServiceLineRespository.saveAll(visaDocServicLineImportList);
		return visaSLEntity;
	}
	
	
	public Udn_Deal_VSA_SL_Entity findBy_VSA_SL_ID(long vsaSLId) throws RecordNotFoundException {
		Udn_Deal_VSA_SL_Entity orgVSA_SL_Entity = vsaServiceLineRespository.findById(vsaSLId).get();
		//System.out.println(orgVSA_SL_Entity);
		return orgVSA_SL_Entity;
	}
	
	public VisaServiceLineVO findByVSA_SL_ID(VisaServiceLineVO orgVsaSLVo) throws RecordNotFoundException {
		Optional<Udn_Deal_VSA_SL_Entity> orgVSA_SL_Entity = vsaServiceLineRespository.findById(orgVsaSLVo.getVsaServiceId());
		if(orgVSA_SL_Entity.isPresent()) {
			orgVsaSLVo.updateVOFromEntity(orgVSA_SL_Entity.get());
			for(Udn_Visa_Doc_SL_Entity visaDocSLEntity: orgVSA_SL_Entity.get().getVisaDocumentEntityList()) {
				Udn_Visa_Doc_SL_Obj visaDocSLVO = new Udn_Visa_Doc_SL_Obj(visaDocSLEntity); 
				visaDocSLVO.setStatusName(commonService.find_DealStatusById(visaDocSLVO.getStatus()).getWorkloadStatusName());
				/*if(visaDocSLVO.getStatus()!=0) {
					visaDocSLVO.setStatusName(commonService.find_DealStatusById(visaDocSLVO.getStatus()).getWorkloadStatusName());
				}*/
				orgVsaSLVo.getVisaDocumentEntityList().add(visaDocSLVO);
			}
			
			Udn_Visa_Master_Entity visaMasterEntity = 	visaService.findVisaEntityById(orgVsaSLVo.getVisaId());
			orgVsaSLVo.setVisaPurpose(visaMasterEntity.getVisaPurpose());
			orgVsaSLVo.setVisaType(visaMasterEntity.getVisaType());
			orgVsaSLVo.setProfile(visaMasterEntity.getProfile());
			orgVsaSLVo.setCountryCode(visaMasterEntity.getCountryCode());
			orgVsaSLVo.setConsulateCity(visaMasterEntity.getConsulateCity());
			
			orgVsaSLVo.setCountryName(commonService.findDestinationByCountryCode(orgVSA_SL_Entity.get().getCountryCode()).getCountryName());
			orgVsaSLVo.setConsulateCityName(commonService.findDestinationById(orgVsaSLVo.getConsulateCity()).getCityName());
			orgVsaSLVo.setStatusName(commonService.find_DealStatusById(orgVsaSLVo.getStatus()).getWorkloadStatusName());
			orgVsaSLVo.setSupplierName(supplierService.findSupplierById(orgVsaSLVo.getSupplierId()).get().getSupplierName());
    	}
		return orgVsaSLVo;
	}
	
	public Udn_Visa_Doc_SL_Obj findBy_VSA_DOC_SL_ID(Udn_Visa_Doc_SL_Obj orgVsaDocSLVo) throws RecordNotFoundException {
		Optional<Udn_Visa_Doc_SL_Entity> orgVSA_Doc_SL_Entity = vsaDocServiceLineRespository.findById(orgVsaDocSLVo.getVsaDocServiceId());
		//Udn_Visa_Doc_SL_Obj orgVsaDocSLVo =null ;
		if(orgVSA_Doc_SL_Entity.isPresent()) {
			orgVsaDocSLVo.updateVoFromEntity(orgVSA_Doc_SL_Entity.get());
			//orgVsaDocSLVo = new Udn_Visa_Doc_SL_Obj(orgVSA_Doc_SL_Entity.get());
			if(orgVsaDocSLVo.getStatus()!=0) {
				orgVsaDocSLVo.setStatusName(commonService.find_DealStatusById(orgVsaDocSLVo.getStatus()).getWorkloadStatusName());
			}
    	}
		return orgVsaDocSLVo;
	}
	
	public Udn_Visa_Doc_SL_Entity saveVisaDocServiceLine(Udn_Visa_Doc_SL_Entity visaDocSLEntity) {
		vsaDocServiceLineRespository.save(visaDocSLEntity);
		return visaDocSLEntity;
	}
	
	public void delete_visa_doc_serviceline(long vsaDocServiceId) throws RecordNotFoundException {
		Optional<Udn_Visa_Doc_SL_Entity> vsaDocSLEntity = vsaDocServiceLineRespository.findById(vsaDocServiceId);
	    if(vsaDocSLEntity.isPresent()) {  
	    	vsaDocServiceLineRespository.delete(vsaDocSLEntity.get());
	    }
	    else {
	    	throw new RecordNotFoundException("Visa Doc Service Line does not exist. ");
	    }
		// .orElseThrow(() -> new ResourceNotFoundException("Flight Serviceline not found for this id :: " + fltServiceId));

	}
	
	public void delete_visa_serviceline(long vsaServiceId) throws RecordNotFoundException {
		Optional<Udn_Deal_VSA_SL_Entity> vsaSLEntity = vsaServiceLineRespository.findById(vsaServiceId);
	    if(vsaSLEntity.isPresent()) {  
	    	vsaServiceLineRespository.delete(vsaSLEntity.get());
	    }
	    else {
	    	throw new RecordNotFoundException("Visa Doc Service Line does not exist. ");
	    }
		// .orElseThrow(() -> new ResourceNotFoundException("Flight Serviceline not found for this id :: " + fltServiceId));

	}
	
	public boolean check_FLT_SL_Existance_By_ServiceMapID(long serviceMapId) {
		return fltServiceLineRespository.existsByServiceMapId(serviceMapId);
	}
	
	public boolean check_HTL_SL_Existance_By_ServiceMapID(long serviceMapId) {
		return htlServiceLineRespository.existsByServiceMapId(serviceMapId);
	}
	
	public boolean check_INS_SL_Existance_By_ServiceMapID(long serviceMapId) {
		return insServiceLineRespository.existsByServiceMapId(serviceMapId);
	}
	
	public boolean check_LDP_SL_Existance_By_ServiceMapID(long serviceMapId) {
		return ldpServiceLineRespository.existsByServiceMapId(serviceMapId);
	}
	
	public boolean check_OTH_SL_Existance_By_ServiceMapID(long serviceMapId) {
		return othServiceLineRespository.existsByServiceMapId(serviceMapId);
	}
	
	public boolean check_STS_SL_Existance_By_ServiceMapID(long serviceMapId) {
		return stsServiceLineRespository.existsByServiceMapId(serviceMapId);
	}
	
	public boolean check_TRN_SL_Existance_By_ServiceMapID(long serviceMapId) {
		return trnServiceLineRespository.existsByServiceMapId(serviceMapId);
	}
	
	public boolean check_VSA_SL_Existance_By_ServiceMapID(long serviceMapId) {
		return vsaServiceLineRespository.existsByServiceMapId(serviceMapId);
	}
	
	
	public boolean send_visa_deal_status(VisaServiceStatusEmailFormObj visaServiceEmailObj) throws MessagingException, IOException, TemplateException {
    	//modelView.setViewName("forward:view_email_visa_master_docs_form");
		EmailMessageVO visaEmailObj = visaServiceEmailObj.getEmailMessageVo();
		Mail mail = new Mail();
		mail.setSubject(visaEmailObj.getEmailSubject());
		
		InternetAddress[] emailToList = new InternetAddress[visaEmailObj.getEmailToValidatedList().size()];
		InternetAddress[] emailCcList = new InternetAddress[visaEmailObj.getEmailCcValidatedList().size()];
    	for (int i = 0; i < visaEmailObj.getEmailToValidatedList().size(); i++) {
			emailToList[i] = new InternetAddress((String) visaEmailObj.getEmailToValidatedList().get(i));
			//redirectAttrib.addFlashAttribute("Error","Error: While sending email. Recipients setting error.<br> Please send individually or contact adminstrator.");
    	}
    	for (int i = 0; i < visaEmailObj.getEmailCcValidatedList().size(); i++) {
			emailCcList[i] = new InternetAddress((String) visaEmailObj.getEmailCcValidatedList().get(i));
			//redirectAttrib.addFlashAttribute("Error","Error: While sending email. Recipients setting error.<br> Please send individually or contact adminstrator.");
    	}
		mail.setToList(emailToList);
		mail.setCcList(emailCcList);
        Map<String, Object> model = new HashMap<String, Object>();
        //System.out.println("Visa Email Obj is " + visaEmailObj);
        
        model.put("VISA_STATUS_LIST", visaServiceEmailObj.getVisaServiceListForEmail());
        model.put("COUNTRY_NAME", "CORRECT - THIS COUNTRY NAME" );
        //model.put("VISA_INFO_MAILER",visaEmailObj);
        
        mail.setModel(model);
		emailService.sendEmailMessageUsingTemplate_MultipleRecipients(mail,"Visa-Docs-Deal-Status.ftl");
		//redirectAttrib.addFlashAttribute("Success","Email Document Checklist added to the mailing queue successfully!! ");
		
		return true;
	}
	
	public boolean create_create_workload_from_quotation(Tg_Quotation_Recorder_Entity quotationEntity) {
		
		if(quotationEntity.isFlight()) {
    		for (Udn_Manual_Flight_Quotation_Entity qtnFlightEntity : quotationEntity.getManualQuotationsList()) {
    			FlightServiceLineVO flightSLVO = new FlightServiceLineVO();
    		}

			
			/*
			flightSLVO.setAirlineId();
			flightSLVO.setArrivingTo();
			flightSLVO.setDepartingFrom();
			flightSLVO.setNoOfHalt();
			flightSLVO.setStatus();
			flightSLVO.setSupplierId();
			flightSLVO.setArrivalDate();
			flightSLVO.setDepartureDate();
			flightSLVO.setHoldingDate();
			flightSLVO.setFlightNumber();
			flightSLVO.setRemarks();
			flightSLVO.setServiceMapId();
			flightSLVO.setFltServiceId();
			flightSLVO.setAdults();
			flightSLVO.setChildren();
			flightSLVO.setTicketType();
			flightSLVO.setDealConfirmationId();
			flightSLVO.setServiceLineOwner();
			flightSLVO.setServiceLineCost();
			*/
		}
		
		return true;
	}



	public Udn_Deal_CRS_SL_Entity saveCruiseServiceLine(Udn_Deal_CRS_SL_Entity crsSLEntity) {
		crsServiceLineRespository.save(crsSLEntity);
		return crsSLEntity;
		
	}
	
	public List<CruiseServiceLineVO> find_CRS_ServiceLines_Basedon_DealId(long dealconfirmationId,long dealOwner,boolean isAdmin) throws RecordNotFoundException{
		List<Udn_Deal_CRS_SL_Entity> crsSLList;
		if(isAdmin) {
			crsSLList =  dealServiceLineRepository.findCRSServiceLinesBasedonDealId(dealconfirmationId);
		}
		else {
			crsSLList =  dealServiceLineRepository.findCRSServiceLinesBasedonDealIdAndOwner(dealconfirmationId,dealOwner);
		}
		List<CruiseServiceLineVO> listCrsSlVO = new ArrayList();
		
		Iterator itrCrsList = crsSLList.iterator();
		while(itrCrsList.hasNext()) {
			CruiseServiceLineVO crsSLVO = new CruiseServiceLineVO((Udn_Deal_CRS_SL_Entity)itrCrsList.next());
			crsSLVO.setCityName(commonService.findDestinationById(crsSLVO.getCityId()).getCityName());
			crsSLVO.setStatusName(commonService.find_DealStatusById(crsSLVO.getStatus()).getWorkloadStatusName());
			crsSLVO.setSupplierName(supplierService.findSupplierById(crsSLVO.getSupplierId()).get().getSupplierName());
			crsSLVO.setStateRoomTypeName(UdanChooConstants.CRUISE_STATE_ROOM_TYPE_MAP.get(crsSLVO.getStateRoomType()));
			crsSLVO.setCruiseProviderName(UdanChooConstants.CRUISE_PROVIDER_NAMES_MAP.get(crsSLVO.getCruiseProvider()));
			listCrsSlVO.add(crsSLVO);
		}
		return listCrsSlVO;
	} 

	public CruiseServiceLineVO findByCRS_SL_ID(CruiseServiceLineVO orgCRSSLVo) throws RecordNotFoundException {
		Optional<Udn_Deal_CRS_SL_Entity> orgCRS_SL_Entity = crsServiceLineRespository.findById(orgCRSSLVo.getCrsServiceId());
		//TransferServiceLineVO orgTrnSLVo =null ;
		if(orgCRS_SL_Entity.isPresent()) {
			//orgTrnSLVo = new TransferServiceLineVO(orgTRN_SL_Entity.get());
			orgCRSSLVo.updateVOFromEntity(orgCRS_SL_Entity.get());
			orgCRSSLVo.setCityName(commonService.findDestinationById(orgCRSSLVo.getCityId()).getCityName());
			orgCRSSLVo.setStatusName(commonService.find_DealStatusById(orgCRSSLVo.getStatus()).getWorkloadStatusName());
			orgCRSSLVo.setSupplierName(supplierService.findSupplierById(orgCRSSLVo.getSupplierId()).get().getSupplierName());
			orgCRSSLVo.setStateRoomTypeName(UdanChooConstants.CRUISE_STATE_ROOM_TYPE_MAP.get(orgCRSSLVo.getStateRoomType()));
			orgCRSSLVo.setCruiseProviderName(UdanChooConstants.CRUISE_PROVIDER_NAMES_MAP.get(orgCRSSLVo.getCruiseProvider()));
    	}
		return orgCRSSLVo;
	}
	
	public void delete_Cruise_ServiceLine(long crsServiceId) throws RecordNotFoundException {
		Optional<Udn_Deal_CRS_SL_Entity> crsSLEntity = crsServiceLineRespository.findById(crsServiceId);
	    if(crsSLEntity.isPresent()) {  
	    	crsServiceLineRespository.delete(crsSLEntity.get());
	    }
	    else {
	    	throw new RecordNotFoundException("Cruise Service Line doesnot exist. ");
	    }
	}
	
	public TI_Hotel_Voucher_Entity saveHotelVoucher(TI_Hotel_Voucher_Entity htlVoucherEntity) {
		hotelVoucherRespository.save(htlVoucherEntity);
		return htlVoucherEntity;
		
	}
	
}
