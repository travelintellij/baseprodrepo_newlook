package com.udanchoo.intranet.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;
import com.udanchoo.intranet.entity.Udn_Airline_Master_Entity;
import com.udanchoo.intranet.entity.quotation.Tg_Quotation_Recorder_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Configuration_Manual_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Flight_Quotation_Stop_Detail_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Cruise_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Flight_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Hotel_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Insurance_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Other_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Package_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_SightSeeing_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Transfer_Quotation_Entity;
import com.udanchoo.intranet.entity.quotation.Udn_Manual_Visa_Quotation_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.quotation.FlightStopDetailQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualCruiseQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualFlightQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualHotelQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualInsuranceQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualOtherQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualPackageQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualSightSeeingQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualTransferQuotationVO;
import com.udanchoo.intranet.model.quotation.ManualVisaQuotationVO;
import com.udanchoo.intranet.model.quotation.TgQuotationRecorderVO;
import com.udanchoo.intranet.repository.quotation.TG_Quotations_Repository;
import com.udanchoo.intranet.repository.quotation.Udn_Configuration_Manual_Quotation_Repository;
import com.udanchoo.intranet.repository.quotation.Udn_Flight_Stop_Quotation_Repository;
import com.udanchoo.intranet.repository.quotation.Udn_Manual_Cruise_Quotation_Repository;
import com.udanchoo.intranet.repository.quotation.Udn_Manual_Flight_Quotation_Repository;
import com.udanchoo.intranet.repository.quotation.Udn_Manual_Hotel_Quotation_Repository;
import com.udanchoo.intranet.repository.quotation.Udn_Manual_Insurance_Quotation_Repository;
import com.udanchoo.intranet.repository.quotation.Udn_Manual_Other_Quotation_Repository;
import com.udanchoo.intranet.repository.quotation.Udn_Manual_Package_Quotation_Repository;
import com.udanchoo.intranet.repository.quotation.Udn_Manual_SightSeeing_Quotation_Repository;
import com.udanchoo.intranet.repository.quotation.Udn_Manual_Transfer_Quotation_Repository;
import com.udanchoo.intranet.repository.quotation.Udn_Manual_Visa_Quotation_Repository;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.util.UdanChooUtil;



@Transactional
@Service
public class QuotationServiceImpl {

	@Autowired
	TG_Quotations_Repository quotationRepository;
	
	@Autowired
	Udn_Manual_Flight_Quotation_Repository manualQuotationRepository;
	
	@Autowired
	Udn_Flight_Stop_Quotation_Repository flightStopQuotationRepository;
	
	@Autowired
	Udn_Manual_Hotel_Quotation_Repository hotelQuotationRepository;
	
	@Autowired
	Udn_Manual_Cruise_Quotation_Repository cruiseQuotationRepository;
	
	
	@Autowired
	Udn_Manual_Transfer_Quotation_Repository transferQuotationRepository;

	@Autowired
	Udn_Manual_SightSeeing_Quotation_Repository sightSeeingQuotationRepository;
	
	@Autowired
	Udn_Manual_Visa_Quotation_Repository visaQuotationRepository;
	

	@Autowired
	Udn_Manual_Package_Quotation_Repository packageQuotationRepository;
	
	@Autowired
	Udn_Manual_Other_Quotation_Repository otherQuotationRepository;
	
	@Autowired
	Udn_Manual_Insurance_Quotation_Repository insuranceQuotationRepository;
	
	
	@Autowired
    private HotelServiceImpl hotelService;
	
	@Autowired
	Udn_Configuration_Manual_Quotation_Repository configurationRepository;
	
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	ClientServiceImpl clientService;
	
	@Autowired
	TgB2bPartnerServicesImpl b2bPartnerService;
	
	@Autowired
	UserDetailsServiceImpl userService;
	
	

	public Tg_Quotation_Recorder_Entity saveLead(Tg_Quotation_Recorder_Entity quotationEntity) {
		quotationRepository.save(quotationEntity);
		return quotationEntity;
	}
	
	public Tg_Quotation_Recorder_Entity findQuotationRecordById(long quotationId) {
		return quotationRepository.findById(quotationId).get();
		
	}

	public TgQuotationRecorderVO getQuotationVoFromEntity(Tg_Quotation_Recorder_Entity tgQuotationEntity) {
		TgQuotationRecorderVO tgQuotationVO = new TgQuotationRecorderVO(tgQuotationEntity);
		
		return tgQuotationVO;
	}
	
	public int fetchMax_QuotationVersion(long quotationId) {
		return quotationRepository.max_QuotationVersionGenerated(quotationId);
	}

	public void deleteQuotationById(long quotationId) {
		quotationRepository.deleteById(quotationId);
	}
	
	
	public Udn_Manual_Flight_Quotation_Entity saveManualFlightQuotation(Udn_Manual_Flight_Quotation_Entity  manualFlightQuotationEntity) {
		manualQuotationRepository.save(manualFlightQuotationEntity);
		return manualFlightQuotationEntity;
	}
	
	
	public Udn_Flight_Quotation_Stop_Detail_Entity saveFlightStopQuotation(Udn_Flight_Quotation_Stop_Detail_Entity  flightStopQuotationEntity) {
		flightStopQuotationRepository.save(flightStopQuotationEntity);
		return flightStopQuotationEntity;
	}

	public ManualFlightQuotationVO findManualFlightQuotationById(long manualQuotationId) {
		Udn_Manual_Flight_Quotation_Entity manualFlightEntity = manualQuotationRepository.findById(manualQuotationId).get();
		ManualFlightQuotationVO manualFlightVo = new ManualFlightQuotationVO();
		manualFlightVo.updateManualFlightVoFromEntity(manualFlightEntity);
		manualFlightVo.setOriginCity(commonService.findAirportById(manualFlightEntity.getAirportCodeOrigin()).getCityName());
		manualFlightVo.setDestinationCity(commonService.findAirportById(manualFlightEntity.getAirportCodeDestination()).getCityName());
		return manualFlightVo;
	}
	
	public Udn_Manual_Flight_Quotation_Entity findManualFlightQuotationEntityById(long manualQuotationId) {
		Udn_Manual_Flight_Quotation_Entity manualFlightEntity = manualQuotationRepository.findById(manualQuotationId).get();
		return manualFlightEntity;
	}
	

	public Udn_Flight_Quotation_Stop_Detail_Entity findFlightStopEntityById(long flightStopId) {
		Udn_Flight_Quotation_Stop_Detail_Entity flightStopEntity = flightStopQuotationRepository.findById(flightStopId).get();
		return flightStopEntity;
	}

	
	public ManualFlightQuotationVO updateInjectedManualFlightObject(long manualQuotationId,ManualFlightQuotationVO manualFlightVo) {
		Udn_Manual_Flight_Quotation_Entity manualFlightEntity = manualQuotationRepository.findById(manualQuotationId).get();
		manualFlightVo.updateManualFlightVoFromEntity(manualFlightEntity);
		manualFlightVo.setOriginCity(commonService.findAirportById(manualFlightEntity.getAirportCodeOrigin()).getCityName());
		manualFlightVo.setDestinationCity(commonService.findAirportById(manualFlightEntity.getAirportCodeDestination()).getCityName());
		manualFlightVo.setAirlineName(commonService.findAirlinebyId(manualFlightVo.getAirlineId()).getAirlineShortName());
		manualFlightVo.setCabinClassName(UdanChooConstants.CABIN_CLASS.get(manualFlightVo.getCabinClass()));
		manualFlightVo.getFlightStopsQuotationsVoList().forEach((e) -> { 
			e.setOriginCity(commonService.findAirportById(e.getAirportCodeOrigin()).getCityName());
			e.setDestinationCity(commonService.findAirportById(e.getAirportCodeDestination()).getCityName());
			e.setAirlineName(commonService.findAirlinebyId(e.getAirlineId()).getAirlineShortName());
			e.setCabinClassName(UdanChooConstants.CABIN_CLASS.get(e.getCabinClass()));
		});
		return manualFlightVo;
		
	}
	
	@Transactional
	public void deleteManualFlight(Udn_Manual_Flight_Quotation_Entity manualFlightEntity) {
		flightStopQuotationRepository.deleteByManualFlightQuotationEntity(manualFlightEntity);
		manualQuotationRepository.delete(manualFlightEntity);
	}
	
	public long countFlightStopsByManualFlightQuoationId(long manualFlightQuotationId){
		Udn_Manual_Flight_Quotation_Entity manualFlightEntity = manualQuotationRepository.findById(manualFlightQuotationId).get();
		return flightStopQuotationRepository.countByManualFlightQuotationEntity(manualFlightEntity);
	}
	
	@Transactional
	public void deleteFlightStop(long flightStopId) {
		flightStopQuotationRepository.deleteById(flightStopId);
		
	}

	public ManualHotelQuotationVO updateInjectedManualHotelObject(long hotelQuotationId,ManualHotelQuotationVO manualHotelVo) {
		Udn_Manual_Hotel_Quotation_Entity manualHotelEntity = hotelQuotationRepository.findById(hotelQuotationId).get();
		manualHotelVo.updateManualHotelVoFromEntity(manualHotelEntity);
		try {
			manualHotelVo.setHotelName(hotelService.find_HotelbyId(manualHotelVo.getHotelId()).getHotelName());
			
		} catch (RecordNotFoundException e) {
			manualHotelVo.setHotelName("Hotel Unknown----");
			e.printStackTrace();
		}
		manualHotelVo.setCityName(commonService.findDestinationById(manualHotelVo.getCityId()).getCityName());
		manualHotelVo.setRoomCategoryName(hotelService.find_RoomCategoryById(manualHotelVo.getRoomCategoryId()).getRoomCategoryName());
		manualHotelVo.setMealPlanName(UdanChooConstants.MEAL_PLANS_MAP.get(manualHotelVo.getMealPlan()));
		return manualHotelVo;
		
	}
	
	public ManualCruiseQuotationVO updateInjectedManualCruiseObject(long cruiseQuotationId,ManualCruiseQuotationVO manualCruiseVo) {
		Udn_Manual_Cruise_Quotation_Entity manualCruiseEntity = cruiseQuotationRepository.findById(cruiseQuotationId).get();
		manualCruiseVo.updateManualCruiseVoFromEntity(manualCruiseEntity);
		
		manualCruiseVo.setCityName(commonService.findDestinationById(manualCruiseVo.getCityId()).getCityName());
		manualCruiseVo.setStateRoomName(UdanChooConstants.CRUISE_STATE_ROOM_TYPE_MAP.get(manualCruiseVo.getStateRoomType()));
		manualCruiseVo.setCruiseProviderName(UdanChooConstants.CRUISE_PROVIDER_NAMES_MAP.get(manualCruiseVo.getCruiseProvider()));
		return manualCruiseVo;
		
	}
	
	
	
	public ManualTransferQuotationVO updateInjectedManualTransferObject(long transferQuotationId,ManualTransferQuotationVO manualTransferVo) {
		Udn_Manual_Transfer_Quotation_Entity manualTransferEntity = transferQuotationRepository.findById(transferQuotationId).get();
		manualTransferVo.updateManualTransferVoFromEntity(manualTransferEntity);
		manualTransferVo.setPickUpCityName(commonService.findDestinationById(manualTransferVo.getPickUpCityId()).getCityName());
		manualTransferVo.setDropToCityName(commonService.findDestinationById(manualTransferVo.getDropToCityId()).getCityName());
		manualTransferVo.setPickUpFromDesc(UdanChooConstants.TRANSFER_POINT_MAP.get(manualTransferVo.getPickUpFrom()));
		manualTransferVo.setDropToDesc(UdanChooConstants.TRANSFER_POINT_MAP.get(manualTransferVo.getDropTo()));
		manualTransferVo.setTransferTypeName(UdanChooConstants.TRANSFER_TYPE_MODE.get(manualTransferVo.getTransferType()));
		return manualTransferVo;
	}
	
	public ManualSightSeeingQuotationVO updateInjectedManualSightSeeingObject(long transferQuotationId,ManualSightSeeingQuotationVO manualSightSeeingVo) {
		Udn_Manual_SightSeeing_Quotation_Entity manualSightSeeingEntity = sightSeeingQuotationRepository.findById(transferQuotationId).get();
		manualSightSeeingVo.updateManualSightSeeingVoFromEntity(manualSightSeeingEntity);
		manualSightSeeingVo.setTransferTypeName(UdanChooConstants.TRANSFER_TYPE_MODE.get(manualSightSeeingVo.getTransferType()));
		manualSightSeeingVo.setCityName(commonService.findDestinationById(manualSightSeeingVo.getCityId()).getCityName());
		/*
		manualTransferVo.setDropToCityName(commonService.findDestinationById(manualTransferVo.getDropToCityId()).getCityName());
		manualTransferVo.setPickUpFromDesc(UdanChooConstants.TRANSFER_POINT_MAP.get(manualTransferVo.getPickUpFrom()));
		manualTransferVo.setDropToDesc(UdanChooConstants.TRANSFER_POINT_MAP.get(manualTransferVo.getDropTo()));
		
		*/
		return manualSightSeeingVo;
	}
	
	public ManualPackageQuotationVO updateInjectedManualPackageObject(long packageQuotationId,ManualPackageQuotationVO manualPackageVo) {
		Udn_Manual_Package_Quotation_Entity manualPackageEntity = packageQuotationRepository.findById(packageQuotationId).get();
		manualPackageVo.updateManualPackageVoFromEntity(manualPackageEntity);
		
		manualPackageVo.setCityName(commonService.findDestinationById(manualPackageVo.getCityId()).getCityName());
		
		return manualPackageVo;
		
	}
	
	public ManualInsuranceQuotationVO updateInjectedManualInsuranceObject(long insuranceQuotationId,ManualInsuranceQuotationVO manualInsuranceVo) {
		Udn_Manual_Insurance_Quotation_Entity manualInsuranceEntity = insuranceQuotationRepository.findById(insuranceQuotationId).get();
		manualInsuranceVo.updateManualInsuranceVoFromEntity(manualInsuranceEntity);
		
		manualInsuranceVo.setCountryName(commonService.findDestinationById(manualInsuranceVo.getCountryId()).getCountryName());
		manualInsuranceVo.setInsuranceProviderName(UdanChooConstants.INSURANCE_PROVIDERS_MAP.get(manualInsuranceVo.getInsuranceProvider()).toString());
		manualInsuranceVo.setInsuranceTypeName(UdanChooConstants.INSURANCE_TYPE_MAP.get(manualInsuranceVo.getInsuranceType()));
		return manualInsuranceVo;
		
	}
	
	
	public Udn_Manual_Hotel_Quotation_Entity saveHotelStayQuotation(Udn_Manual_Hotel_Quotation_Entity  hotelQuotationEntity) {
		hotelQuotationRepository.save(hotelQuotationEntity);
		return hotelQuotationEntity;
	}
	
	@Transactional
	public void deleteHotelStayQuotation(long hotelQuotationId) {
		hotelQuotationRepository.deleteById(hotelQuotationId);
		
	}
	
	
	public Udn_Manual_Cruise_Quotation_Entity saveCruiseStayQuotation(Udn_Manual_Cruise_Quotation_Entity  cruiseQuotationEntity) {
		cruiseQuotationRepository.save(cruiseQuotationEntity);
		return cruiseQuotationEntity;
	}
	
	@Transactional
	public void deleteCruiseStayQuotation(long cruiseQuotationId) {
		cruiseQuotationRepository.deleteById(cruiseQuotationId);
		
	}
	
	public Udn_Manual_Transfer_Quotation_Entity saveTransferStayQuotation(Udn_Manual_Transfer_Quotation_Entity  transferQuotationEntity) {
		transferQuotationRepository.save(transferQuotationEntity);
		return transferQuotationEntity;
	}

	public Udn_Manual_Transfer_Quotation_Entity findManualTransferQuotationEntityById(long transferQuotationId) {
		Udn_Manual_Transfer_Quotation_Entity manualTransferEntity = transferQuotationRepository.findById(transferQuotationId).get();
		return manualTransferEntity;
	}
	
	@Transactional
	public void deleteTranferQuotationRecord(long transferQuotationId) {
		transferQuotationRepository.deleteById(transferQuotationId);
		
	}

	public Udn_Manual_SightSeeing_Quotation_Entity saveSightSeeingStayQuotation(Udn_Manual_SightSeeing_Quotation_Entity  sightSeeingQuotationEntity) {
		sightSeeingQuotationRepository.save(sightSeeingQuotationEntity);
		return sightSeeingQuotationEntity;
	}

	@Transactional
	public void deleteSightSeeingQuotationRecord(long sightSeeingQuotationId) {
		sightSeeingQuotationRepository.deleteById(sightSeeingQuotationId);
		
	}
	
	public Udn_Manual_Visa_Quotation_Entity findManualVisaQuotationEntityById(long visaQuotationId) {
		Udn_Manual_Visa_Quotation_Entity manualVisaEntity = visaQuotationRepository.findById(visaQuotationId).get();
		return manualVisaEntity;
	}
	
	public Udn_Manual_Visa_Quotation_Entity saveVisaQuotation(Udn_Manual_Visa_Quotation_Entity  visaQuotationEntity) {
		visaQuotationRepository.save(visaQuotationEntity);
		return visaQuotationEntity;
	}
	
	public ManualVisaQuotationVO updateInjectedManualVisaObject(long visaQuotationId,ManualVisaQuotationVO manualVisaVo) {
		Udn_Manual_Visa_Quotation_Entity manualVisaEntity = visaQuotationRepository.findById(visaQuotationId).get();
		manualVisaVo.updateManualVisaVoFromEntity(manualVisaEntity);
		manualVisaVo.setVisaCountry(commonService.findDestinationByCountryCode(manualVisaEntity.getVisaQuotationEntity().getCountryCode()).getCountryName());
		manualVisaVo.setVisaConsulate(commonService.findDestinationById(manualVisaEntity.getVisaQuotationEntity().getConsulateCity()).getCityName());


		/*
		manualTransferVo.setDropToCityName(commonService.findDestinationById(manualTransferVo.getDropToCityId()).getCityName());
		manualTransferVo.setPickUpFromDesc(UdanChooConstants.TRANSFER_POINT_MAP.get(manualTransferVo.getPickUpFrom()));
		manualTransferVo.setDropToDesc(UdanChooConstants.TRANSFER_POINT_MAP.get(manualTransferVo.getDropTo()));
		
		*/
		return manualVisaVo;
	}
	
	
	
	public void deleteVisaQuotationRecord(long visaQuotationId) {
		visaQuotationRepository.deleteById(visaQuotationId);
		
	}
	
	public Udn_Manual_Package_Quotation_Entity savePackageQuotation(Udn_Manual_Package_Quotation_Entity  packageQuotationEntity) {
		packageQuotationRepository.save(packageQuotationEntity);
		return packageQuotationEntity;
	}
	
	public void deletePackageStayQuotation(long packageQuotationId) {
		packageQuotationRepository.deleteById(packageQuotationId);
		
	}
	
	public ManualOtherQuotationVO updateInjectedManualOtherObject(long otherQuotationId,ManualOtherQuotationVO manualOtherVo) {
		Udn_Manual_Other_Quotation_Entity manualOtherEntity = otherQuotationRepository.findById(otherQuotationId).get();
		manualOtherVo.updateManualOtherVoFromEntity(manualOtherEntity);
		return manualOtherVo;
		
	}
	
	public Udn_Manual_Other_Quotation_Entity saveOtherQuotation(Udn_Manual_Other_Quotation_Entity  otherQuotationEntity) {
		otherQuotationRepository.save(otherQuotationEntity);
		return otherQuotationEntity;
	}
	
	public void deleteOtherStayQuotation(long otherQuotationId) {
		otherQuotationRepository.deleteById(otherQuotationId);
		
	}
	
	public Udn_Manual_Insurance_Quotation_Entity saveInsuranceQuotation(Udn_Manual_Insurance_Quotation_Entity  insuranceQuotationEntity) {
		insuranceQuotationRepository.save(insuranceQuotationEntity);
		return insuranceQuotationEntity;
	}
	
	public void deleteInsuranceQuotation(long insuranceQuotationId) {
		insuranceQuotationRepository.deleteById(insuranceQuotationId);
	}

	public Udn_Configuration_Manual_Quotation_Entity findConfigurationBasedOnQuotationId(Tg_Quotation_Recorder_Entity quotationEntity){
		return configurationRepository.findByQuotationEntity(quotationEntity);
		
	}
	public boolean configurationQuotationExists(Tg_Quotation_Recorder_Entity quotationEntity){
		return configurationRepository.existsByQuotationEntity(quotationEntity);
		
	}
	
	public Udn_Configuration_Manual_Quotation_Entity findQuotationConfigurationRecordById(long quotationConfigurationId) {
		return configurationRepository.findById(quotationConfigurationId).get();
		
	}
	
	public Udn_Configuration_Manual_Quotation_Entity saveConfigurationQuotation(Udn_Configuration_Manual_Quotation_Entity  configurationQuotationEntity) {
		configurationRepository.save(configurationQuotationEntity);
		return configurationQuotationEntity;
	}
	
	public void deleteConfigurationQuotation(long configurationQuotationId) {
		if (configurationRepository.existsById(configurationQuotationId)) {
			configurationRepository.deleteById(configurationQuotationId);
		}
		
	}
	public int findMaxHotelOptionGenerated(long quotationId){
		return hotelQuotationRepository.max_HotelOptionGenerated(quotationId);
	}
	
	public int findHotelOptionNumbersForQuoation(long quotationId,int optionNo) {
		return hotelQuotationRepository.count_Numberof_HotelOptions_For_Quotation(quotationId,optionNo);
	}
	
	public int update_Rearrage_HotelOptions_For_Quotation(long quotationId,int hotelOptionNo) {
		return hotelQuotationRepository.update_Rearrange_HotelOptionNoForQuotation(quotationId,hotelOptionNo);
	}
	
	public Map<Integer,List<ManualHotelQuotationVO>> findOptionWiseHotelMap(long quotationId){
		List<Integer> distinctHotelOptions = hotelQuotationRepository.findDistinctHotelsOptionByQuotation(quotationId);
		Map<Integer,List<ManualHotelQuotationVO>> hotelOptionWiseMap = new HashMap<Integer, List<ManualHotelQuotationVO>>();
		
		for(int i=0;i<distinctHotelOptions.size();i++) {
			List<Udn_Manual_Hotel_Quotation_Entity> listHotelQtnOption = hotelQuotationRepository.findHotelsByQuotationIdAndOptionNo(quotationId, distinctHotelOptions.get(i));
			List<ManualHotelQuotationVO> hotelOptionsWiseList = new ArrayList<ManualHotelQuotationVO>();
			listHotelQtnOption.forEach(manualHotelEntity -> {
				ManualHotelQuotationVO hotelQuotationVo = new ManualHotelQuotationVO();
				hotelQuotationVo.updateManualHotelVoFromEntity(manualHotelEntity);
				updateManualHotelAdditionalFields(hotelQuotationVo);
				hotelOptionsWiseList.add(hotelQuotationVo);
			});
			hotelOptionWiseMap.put(distinctHotelOptions.get(i), hotelOptionsWiseList);
		}
		return hotelOptionWiseMap;
	}

	private void updateManualHotelAdditionalFields(ManualHotelQuotationVO hotelQuotationVo) {
		try {
			hotelQuotationVo.setHotelName(hotelService.find_HotelbyId(hotelQuotationVo.getHotelId()).getHotelName());
		} catch (RecordNotFoundException e1) {
			hotelQuotationVo.setHotelName("Hotel Name Not Found" );
			e1.printStackTrace();
		}	
		hotelQuotationVo.setCityName(commonService.findDestinationById(hotelQuotationVo.getCityId()).getCityName());
		hotelQuotationVo.setRoomCategoryName(hotelService.find_RoomCategoryById(hotelQuotationVo.getRoomCategoryId()).getRoomCategoryName());
		hotelQuotationVo.setMealPlanName((String) UdanChooConstants.MEAL_PLANS_MAP.get(hotelQuotationVo.getMealPlan()));
	}
	
}
