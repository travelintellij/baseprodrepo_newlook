package com.udanchoo.intranet.service;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.client.RestTemplate;

import com.udanchoo.intranet.entity.Tg_B2b_Partner_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_CRS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_FLT_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_HTL_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_INS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_LDP_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_OTH_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_STS_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_Services_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_Status_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_TRN_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deal_VSA_SL_Entity;
import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;
import com.udanchoo.intranet.entity.deals.Ti_Deals_Team_Map_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.entity.leads.Ti_Leads_Team_Map_Entity;
import com.udanchoo.intranet.entity.quotation.Tg_Quotation_Recorder_Entity;
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
import com.udanchoo.intranet.model.DashboardLineChartObj;
import com.udanchoo.intranet.model.DashboardObj;
import com.udanchoo.intranet.model.SearchDealObj;

import com.udanchoo.intranet.model.Udn_Deal_Services_Map_Obj;
import com.udanchoo.intranet.model.Udn_Deals_Recorder_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.leads.FilterLeadObj;
import com.udanchoo.intranet.model.partner.Tg_B2bPartner_Obj;
import com.udanchoo.intranet.model.quotation.ManualFlightQuotationVO;
import com.udanchoo.intranet.model.quotation.TgQuotationRecorderVO;
import com.udanchoo.intranet.repository.DealRepository;
import com.udanchoo.intranet.repository.Deal_Service_Map_Repository;
import com.udanchoo.intranet.repository.Deal_Status_Repository;
import com.udanchoo.intranet.repository.TgB2bPartnersRepository;
import com.udanchoo.intranet.repository.Ti_Deals_Team_Map_Repository;
import com.udanchoo.intranet.repository.Udn_Services_Master_Repository;
import com.udanchoo.intranet.util.UdanChooConstants;



@Service
public class DealServiceImpl {

	@Autowired
	DealRepository dealRepository;
	
	@Autowired
	ClientServiceImpl clientService;
	
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	Udn_Services_Master_Repository serviceMasterRepository;
	
	@Autowired
	Deal_Service_Map_Repository serviceMapRepository;
	
	@Autowired
	TgB2bPartnersRepository agentRepository;
	
	@Autowired
	Deal_Status_Repository dealStatusRepository;
	
	@Autowired
	EmailServiceImpl emailService;

	@Autowired
    private QuotationServiceImpl quotationService;
    
	@Autowired
	DealServiceLineImpl dealServiceLine;
	
	@Autowired
	UserDetailsServiceImpl userService;

	@Autowired
	Ti_Deals_Team_Map_Repository dealTeamMapRepository;
	
	public Udn_Deals_Recorder_Entity createDealWithServices(Udn_Deals_Recorder_Entity entity) {
		entity = dealRepository.saveAndFlush(entity);
		
		return entity;
	}
	
	
	public Udn_Deals_Recorder_Obj findDealEntityById(Long dealId,long dealOwner,boolean isDealAdmin) throws RecordNotFoundException {
		Optional<Udn_Deals_Recorder_Entity> dealEntity ;
		if(isDealAdmin) {
			dealEntity =  dealRepository.findById(dealId);
		}
		else {
			dealEntity =  dealRepository.findByDealConfirmationIdAndDealOwner(dealId,dealOwner);
		}
		
		
		
		Udn_Deals_Recorder_Obj dealRecorderObj = null;
		if(dealEntity.isPresent()) {
			dealRecorderObj = new Udn_Deals_Recorder_Obj(dealEntity.get());
			setDealWLServicesStatasName(dealRecorderObj);
			dealRecorderObj.setClientName((clientService.getClientById(dealRecorderObj.getClientId()).getClientName()));
			dealRecorderObj.setTravelingFromCity(commonService.findDestinationById(dealRecorderObj.getTravelingFrom()).getCityName());
			dealRecorderObj.setTravelingToCity(commonService.findDestinationById(dealRecorderObj.getTravelingTo()).getCityName());
			dealRecorderObj.setStatusName(commonService.find_DealStatusById(dealRecorderObj.getDealStatus()).getWorkloadStatusName());
			dealRecorderObj.setDealSourceName(findAgentById(dealRecorderObj.getDealSource()).getPartnerShortName());
		}else {
			throw new RecordNotFoundException("Deal Id: " + dealId + " do not Exist !!");
		}
		return dealRecorderObj;
	} 
	
	public Udn_Deals_Recorder_Obj findDealEntityBy_Id(Long dealId,int dealOwner,boolean isDealAdmin,Udn_Deals_Recorder_Obj dealRecorderObj ) throws RecordNotFoundException {
		Optional<Udn_Deals_Recorder_Entity> dealEntity ;
		//if the user is admin or tagged user or deal owner then only deal access will be allowed to user. 
		if(isDealAdmin) {
			dealEntity =  dealRepository.findById(dealId);
			
		}
		else {
			dealEntity =  dealRepository.findByDealConfirmationIdAndDealOwner(dealId,dealOwner);
		}
		if(!dealEntity.isPresent()) {
			if(dealTeamMapRepository.existsByDealConfirmationIdAndUserId(dealId, dealOwner)){
				dealEntity =  dealRepository.findById(dealId);	
			}
		}
		if(dealEntity.isPresent()) {
			HashSet operatingTeam= new HashSet(); 
			dealEntity.get().getTeam().forEach(e->operatingTeam.add(String.valueOf(e.getUserId())));
			//dealRecorderObj = new Udn_Deals_Recorder_Obj(dealEntity.get());
			dealRecorderObj.updateVoFromEntity(dealEntity.get());
			setDealWLServicesStatasName(dealRecorderObj);
			dealRecorderObj.setClientName((clientService.getClientById(dealRecorderObj.getClientId()).getClientName()));
			dealRecorderObj.setTravelingFromCity(commonService.findDestinationById(dealRecorderObj.getTravelingFrom()).getCityName());
			dealRecorderObj.setTravelingToCity(commonService.findDestinationById(dealRecorderObj.getTravelingTo()).getCityName());
			dealRecorderObj.setStatusName(commonService.find_DealStatusById(dealRecorderObj.getDealStatus()).getWorkloadStatusName());
			dealRecorderObj.setDealSourceName(findAgentById(dealRecorderObj.getDealSource()).getPartnerShortName());
			dealRecorderObj.setDealOwnerName(userService.findUserByID(Integer.parseInt(String.valueOf(dealRecorderObj.getDealOwner()))).getUsername());
		}
		else {
			throw new RecordNotFoundException("Deal Id: " + dealId + " do not Exist !!");
		}
		return dealRecorderObj;
	} 
	
	public Udn_Deals_Recorder_Entity find_DealEntityBy_Id(Long dealId) throws RecordNotFoundException {
		Optional<Udn_Deals_Recorder_Entity> dealEntity =  dealRepository.findById(dealId);
		if(!dealEntity.isPresent()) {
			throw new RecordNotFoundException("Deal Id: " + dealId + " do not Exist !!");
		}
		return dealEntity.get();
	} 
	
	//following code will iterate through all the services booked under the deal and set the status of the workload.
	public void setDealWLServicesStatasName(Udn_Deals_Recorder_Obj dealRecorderObj) {
		
		Iterator itr = dealRecorderObj.getServiceWorkLoadList().iterator();
		while(itr.hasNext()) {
			Udn_Deal_Services_Map_Obj serviceMapObj = (Udn_Deal_Services_Map_Obj) itr.next();
			serviceMapObj.setServiceName(serviceMasterRepository.findById(serviceMapObj.getDealServiceCode()).get().getServiceName());
			//System.out.println("Looking For " + serviceMapObj.getServiceStatus());
			serviceMapObj.setStatusName(commonService.find_DealStatusById(serviceMapObj.getServiceStatus()).getWorkloadStatusName());
		}
	}
	
	public List<Udn_Deals_Recorder_Entity> findDealsByClientnOwnerId(long clientId,long dealOwner){
		return dealRepository.findDealEntityByClientId(clientId, dealOwner);
	}

	public boolean existAnyDealByClientId(long clientId){
		return dealRepository.existsByclientId(clientId);
	}
	
	public List<Udn_Deals_Recorder_Entity> findDealsByQuerynOwnerId(long queryId,long dealOwner){
		return dealRepository.findDealEntityByQueryId(queryId, dealOwner);
	}
	
	public List<Udn_Deals_Recorder_Entity> findDealsByStatusAndDate(SearchDealObj searchObj,long dealOwner,boolean isAdmin){
		List entityList = new ArrayList();
		// following check is done to get the specific status deal. 
		if(searchObj.getSearchOnBookingDate() && searchObj.getDealStatus()>0) {
			if(isAdmin) {
				entityList = dealRepository.findDealEntityBy_BookingDate_n_Status(searchObj.getStartDate(),searchObj.getEndDate(),searchObj.getDealStatus());
			}
			else {
				entityList = dealRepository.findDealEntityBy_BookingDate_n_Status_n_owner(searchObj.getStartDate(),searchObj.getEndDate(),searchObj.getDealStatus(),dealOwner);
			}
		}
		else if(searchObj.getSearchOnBookingDate() && searchObj.getDealStatus()==0) { // this check will search all bookings based on date irrespective of deal status. 
			System.out.println("Searching based on all Status");
			//System.out.println("search obj is " + searchObj);
			
			if(isAdmin) {
				entityList = dealRepository.findDealEntityBy_BookingDate(searchObj.getStartDate(),searchObj.getEndDate());
			}
			else {
				entityList = dealRepository.findDealEntityBy_BookingDate_n_Owner(searchObj.getStartDate(),searchObj.getEndDate(),dealOwner);
			}
			System.out.println("Size of ResultSet is " + entityList.size());
		}
		else if((!searchObj.getSearchOnBookingDate()) && searchObj.getDealStatus()>0) {
			if(isAdmin) {
				entityList = dealRepository.findDealEntityBy_TravelDate_n_Status(searchObj.getStartDate(),searchObj.getEndDate(),searchObj.getDealStatus());
			}
			else {
				entityList = dealRepository.findDealEntityBy_TravelDate_n_Status_n_Owner(searchObj.getStartDate(),searchObj.getEndDate(),searchObj.getDealStatus(),dealOwner);
			}
		}
		else if((!searchObj.getSearchOnBookingDate()) && searchObj.getDealStatus()==0) { // this check will search all bookings based on date irrespective of deal status. 
			System.out.println("Searching based on all Status - travel Date");
			//System.out.println("search obj is " + searchObj);
			if(isAdmin) {
				entityList = dealRepository.findDealEntityBy_TravelDate_n_Owner(searchObj.getStartDate(),searchObj.getEndDate(),dealOwner);
			}
			else {
				entityList = dealRepository.findDealEntityBy_TravelDate(searchObj.getStartDate(),searchObj.getEndDate());
			}
			System.out.println("Size of ResultSet is " + entityList.size());
		}
		return entityList;
	}
	
	public Udn_Deal_Services_Entity find_Deal_Service_Map_ById(Long dealServiceMapId) throws RecordNotFoundException {
		Optional<Udn_Deal_Services_Entity> dealServiceMapEntity =  serviceMapRepository.findById(dealServiceMapId);
		
		return dealServiceMapEntity.get();
	}
	public Udn_Deal_Services_Entity update_Deal_Service_Map(Udn_Deal_Services_Entity serviceMapEntity) {
		serviceMapRepository.save(serviceMapEntity);
		return serviceMapEntity;
	}
	
	public List<Tg_B2bPartner_Obj> findAllActiveAgents(){
		List<Tg_B2bPartner_Obj> listAgentsVo = new ArrayList<Tg_B2bPartner_Obj>();
		List<Tg_B2b_Partner_Entity> listAgents = agentRepository.find_All_Active_Agents();
		Iterator<Tg_B2b_Partner_Entity> itrAgentsEntity = listAgents.iterator();
		while(itrAgentsEntity.hasNext()) {
			Tg_B2bPartner_Obj agentVo = new Tg_B2bPartner_Obj((Tg_B2b_Partner_Entity) itrAgentsEntity.next());
			listAgentsVo.add(agentVo);
		}
		return listAgentsVo;
	}

	public Tg_B2b_Partner_Entity findAgentById(int agentId){
		return agentRepository.findById(agentId).get();
	}
	
	
	@Transactional
	public Udn_Deals_Recorder_Entity updateDealMainRecord(Udn_Deals_Recorder_Obj dealRecorderObj) throws RecordNotFoundException {
		Udn_Deals_Recorder_Entity dealRecorderObjToUpdate = find_DealEntityBy_Id(dealRecorderObj.getDealConfirmationId());
		dealRecorderObjToUpdate.updateEntityFromVo(dealRecorderObj);
		ArrayList<String> existingServiceCodes = getExistingServices(dealRecorderObjToUpdate);
        List<String> changedServices =  Arrays.asList(dealRecorderObj.getServiceList());
        
		// Following loop will ensure updating the additional services requesed to be added in a deal. 
        for (int i=0;i<dealRecorderObj.getServiceList().length;i++) {
	    	//dealRecorderObjToUpdate.getDealServicesEntityList().forEach((element) -> { System.out.println("Element is " + element.getDealServiceCode()); });
	    	if(!existingServiceCodes.contains(dealRecorderObj.getServiceList()[i])) {
        		Udn_Deal_Services_Entity serviceMapEntity = new Udn_Deal_Services_Entity();
	    		serviceMapEntity.setDealServiceCode(dealRecorderObj.getServiceList()[i]);
        		if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_FLT_CODE)) {
	    			System.out.println("Setting flight status");
	    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_FLT_WL_STATUS);
	    		}
	    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_HTL_CODE)) {
	    			System.out.println("Setting Hotel status");
	    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_HTL_WL_STATUS);
	    		}
	    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_INS_CODE)) {
	    			System.out.println("Setting Insurance status");
	    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_INS_WL_STATUS);
	    		} 
	    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_LDP_CODE)) {
	    			System.out.println("Setting LandPackage status");
	    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_LDP_WL_STATUS);
	    		}
	    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_TRN_CODE)) {
	    			System.out.println("Setting Transfers status");
	    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_TRN_WL_STATUS);
	    		}
	    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_STS_CODE)) {
	    			System.out.println("Setting SightSeeing status");
	    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_STS_WL_STATUS);
	    		}
	    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_OTH_CODE)) {
	    			System.out.println("Setting Others status");
	    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_OTH_WL_STATUS);
	    		}
	    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_VSA_CODE)) {
	    			System.out.println("Setting Visa status");
	    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_VSA_WL_STATUS);
	    		}
	    		serviceMapEntity.setParentDealRecord(dealRecorderObjToUpdate);
	    		dealRecorderObjToUpdate.getDealServicesEntityList().add(serviceMapEntity);
	    	}
	    }
        //following code will ensure the services which were existing earlier but now needs to be deleted from the deal. 
        Iterator<String> itrRemoveService = existingServiceCodes.iterator();
        while(itrRemoveService.hasNext()) {
        	String serviceToRemove = (String) itrRemoveService.next();
        	if(!changedServices.contains(serviceToRemove)) {
        		boolean deleted = dealRecorderObjToUpdate.getDealServicesEntityList().removeIf(e->e.getDealServiceCode().equalsIgnoreCase(serviceToRemove));
        	}
        }
		dealRecorderObjToUpdate = createDealWithServices(dealRecorderObjToUpdate);
		return dealRecorderObjToUpdate;
	}
	
	private ArrayList getExistingServices(Udn_Deals_Recorder_Entity dealRecorderObjToUpdate){
		ArrayList existingServicesList = new ArrayList();
		Iterator<Udn_Deal_Services_Entity> itrServiceSet=  dealRecorderObjToUpdate.getDealServicesEntityList().iterator();
		while(itrServiceSet.hasNext()) {
			existingServicesList.add(((Udn_Deal_Services_Entity)itrServiceSet.next()).getDealServiceCode());
		}
		return existingServicesList;
		
	}
	 
	public List<DashboardObj> processDealDashboardUser(long dealOwner) {
		List<DashboardObj> dashboardDealsList = new ArrayList<DashboardObj>();
		List dealStatus = commonService.find_DealStatusByWorkLoad(UdanChooConstants.DEAL_OBJECT_STATUS_TYPE);
		Iterator itrStatus = dealStatus.iterator();
		while(itrStatus.hasNext()) {
			Udn_Deal_Status_Entity statusEntity = (Udn_Deal_Status_Entity)itrStatus.next();
			if(statusEntity.getWorkloadStatusId()!=UdanChooConstants.DEAL_OBJECT_CLOSED_STATUS) {
				long count = dealRepository.countByDealStatusAndDealOwner(statusEntity.getWorkloadStatusId(), dealOwner);
				DashboardObj dashboardDeals = new DashboardObj();
				dashboardDeals.setName(statusEntity.getWorkloadStatusShortName());
				dashboardDeals.setValue(count);
				dashboardDealsList.add(dashboardDeals);
			}
		}
		return dashboardDealsList;
	}
	
	
	public List<Udn_Deal_Status_Entity> getUniqueWorkLoadObjStatusListBasedOnType(String workLoadType){
		return dealStatusRepository.findDistinctByworkloadStatusObjType(workLoadType);
	}
	
	public List<String> getUniqueWorkLoadObjBasedOnType(String workLoadType){
		return dealStatusRepository.findUniqueShortStatusBasedOnObjectType(workLoadType);
	}
	
	public int countServicesTotalBasedOnStatusAndUser(String dealServiceCode,int status, long dealOwner) {
		return serviceMapRepository.countServicesTotalBasedOnStatusAndUser(dealServiceCode, status, dealOwner);
	}
	
	
	
	public List<DashboardLineChartObj> processWorkloadDashboardUser(long dealOwner){
		//List possibleWorkLoadStatusList = getUniqueWorkLoadObjBasedOnType("workload");
		//Iterator itrPossibleWorkLoad = possibleWorkLoadStatusList.iterator();
		
		List workLoadStatusList = getUniqueWorkLoadObjStatusListBasedOnType("workload");
		Iterator itrWorkLoad = workLoadStatusList.iterator();
		Map dashBoardMap = new HashMap();
		List<DashboardLineChartObj> listWlDbData = new ArrayList();
		DashboardLineChartObj lineChartFlight = new DashboardLineChartObj();
		DashboardLineChartObj lineChartHotel = new DashboardLineChartObj();
		DashboardLineChartObj lineChartInsurance = new DashboardLineChartObj();
		DashboardLineChartObj lineChartLandPackage = new DashboardLineChartObj();
		DashboardLineChartObj lineChartOthers = new DashboardLineChartObj();
		DashboardLineChartObj lineChartTransfers = new DashboardLineChartObj();
		DashboardLineChartObj lineChartSightSeeing = new DashboardLineChartObj();
		DashboardLineChartObj lineChartVisa = new DashboardLineChartObj();
		
		while(itrWorkLoad.hasNext()) {
			Udn_Deal_Status_Entity dealStatus = (Udn_Deal_Status_Entity) itrWorkLoad.next();
			String serviceType = UdanChooConstants.WORKLOAD_SERVICE_MAP.get(dealStatus.getWorkloadStatusObj());
			if(serviceType!=null && (!dealStatus.getWorkloadStatusShortName().equalsIgnoreCase("Completed")) && (!dealStatus.getWorkloadStatusShortName().equalsIgnoreCase("Canc-Comp"))) { 
				int number = countServicesTotalBasedOnStatusAndUser(serviceType,dealStatus.getWorkloadStatusId(),dealOwner);
				if(serviceType.equalsIgnoreCase(UdanChooConstants.WORKLOAD_FLT_CODE)) {
					lineChartFlight.setServiceName("Flight");
					handleServiceWlDashboard(lineChartFlight,dealStatus,serviceType,number); 
				}
				else if(serviceType.equalsIgnoreCase(UdanChooConstants.WORKLOAD_HTL_CODE)) {
					lineChartHotel.setServiceName("Hotel");
					handleServiceWlDashboard(lineChartHotel,dealStatus,serviceType,number); 
				}
				else if(serviceType.equalsIgnoreCase(UdanChooConstants.WORKLOAD_INS_CODE)) {
					lineChartInsurance.setServiceName("Insurance");
					handleServiceWlDashboard(lineChartInsurance,dealStatus,serviceType,number); 
				}
				else if(serviceType.equalsIgnoreCase(UdanChooConstants.WORKLOAD_LDP_CODE)) {
					lineChartLandPackage.setServiceName("LandPackage");
					handleServiceWlDashboard(lineChartLandPackage,dealStatus,serviceType,number); 
				}
				else if(serviceType.equalsIgnoreCase(UdanChooConstants.WORKLOAD_OTH_CODE)) {
					lineChartOthers.setServiceName("Others");
					handleServiceWlDashboard(lineChartOthers,dealStatus,serviceType,number); 
				}
				else if(serviceType.equalsIgnoreCase(UdanChooConstants.WORKLOAD_TRN_CODE)) {
					lineChartTransfers.setServiceName("Transfers");
					handleServiceWlDashboard(lineChartTransfers,dealStatus,serviceType,number); 
				}
				else if(serviceType.equalsIgnoreCase(UdanChooConstants.WORKLOAD_STS_CODE)) {
					lineChartSightSeeing.setServiceName("SightSeeing");
					handleServiceWlDashboard(lineChartSightSeeing,dealStatus,serviceType,number); 
				}
				else if(serviceType.equalsIgnoreCase(UdanChooConstants.WORKLOAD_VSA_CODE)) {
					lineChartVisa.setServiceName("Visa");
					handleServiceWlDashboard(lineChartVisa,dealStatus,serviceType,number); 
				}
				//System.out.println("serviceType  - > " + serviceType + " -- Status " + dealStatus.getWorkloadStatusId() + "-- Status Name -> " + dealStatus.getWorkloadStatusShortName() + " - Numbers " + number);
			}
		}
		
		listWlDbData.add(lineChartFlight);
		listWlDbData.add(lineChartHotel);
		listWlDbData.add(lineChartInsurance);
		listWlDbData.add(lineChartLandPackage);
		listWlDbData.add(lineChartOthers);
		listWlDbData.add(lineChartTransfers);
		listWlDbData.add(lineChartSightSeeing);
		listWlDbData.add(lineChartVisa);
		
		//System.out.println("Total Status list size is " + listWlDbData.size());
		/*List workLoadStatusList = getUniqueWorkLoadObjStatusListBasedOnType("workload");
		System.out.println("List size is" + workLoadStatusList.size());
		Iterator itr =workLoadStatusList.iterator();
		while(itr.hasNext()) {
			System.out.println("Status Name is " + itr.next());
		}*/
		return listWlDbData;
	}
	
	private void handleServiceWlDashboard(DashboardLineChartObj lineChartService,Udn_Deal_Status_Entity dealStatus,String serviceType,int number ) {
		if(dealStatus.getWorkloadStatusShortName().equalsIgnoreCase("Pending")) {
			lineChartService.setPending(number);
		}
		else if(dealStatus.getWorkloadStatusShortName().equalsIgnoreCase("Created")) {
			lineChartService.setCreated(number);
		}
		else if(dealStatus.getWorkloadStatusShortName().equalsIgnoreCase("WIP")) {
			lineChartService.setWip(number);;
		}
		else if(dealStatus.getWorkloadStatusShortName().equalsIgnoreCase("Pen-Client")) {
			lineChartService.setPendingClient(number);
		}
		else if(dealStatus.getWorkloadStatusShortName().equalsIgnoreCase("Pen-Supp")) {
			lineChartService.setPendingSupplier(number);
		}
		else if(dealStatus.getWorkloadStatusShortName().equalsIgnoreCase("Vouchered")) {
			lineChartService.setVouchered(number);
		}
		else if(dealStatus.getWorkloadStatusShortName().equalsIgnoreCase("Can-Req")) {
			lineChartService.setCancellationRequested(number);
		}
	}
	
	public List<DashboardObj> processDealDashboardAdmin() {
		List<DashboardObj> dashboardDealsList = new ArrayList<DashboardObj>();
		List dealStatus = commonService.find_DealStatusByWorkLoad(UdanChooConstants.DEAL_OBJECT_STATUS_TYPE);
		Iterator itrStatus = dealStatus.iterator();
		while(itrStatus.hasNext()) {
			Udn_Deal_Status_Entity statusEntity = (Udn_Deal_Status_Entity)itrStatus.next();
			if(statusEntity.getWorkloadStatusId()!=UdanChooConstants.DEAL_OBJECT_CLOSED_STATUS) {
				long count = dealRepository.countByDealStatus(statusEntity.getWorkloadStatusId());
				DashboardObj dashboardDeals = new DashboardObj();
				dashboardDeals.setName(statusEntity.getWorkloadStatusShortName());
				dashboardDeals.setValue(count);
				dashboardDealsList.add(dashboardDeals);
			}
		}
		return dashboardDealsList;
	}
	
	
	public int countServicesTotalBasedOnStatus(String dealServiceCode,int status) {
		return serviceMapRepository.countServicesTotalBasedOnStatus(dealServiceCode, status);
	}

	public List<DashboardLineChartObj> processWorkloadDashboardAdmin(){
		//List possibleWorkLoadStatusList = getUniqueWorkLoadObjBasedOnType("workload");
		//Iterator itrPossibleWorkLoad = possibleWorkLoadStatusList.iterator();
		
		List workLoadStatusList = getUniqueWorkLoadObjStatusListBasedOnType("workload");
		Iterator itrWorkLoad = workLoadStatusList.iterator();
		Map dashBoardMap = new HashMap();
		List<DashboardLineChartObj> listWlDbData = new ArrayList();
		DashboardLineChartObj lineChartFlight = new DashboardLineChartObj();
		DashboardLineChartObj lineChartHotel = new DashboardLineChartObj();
		DashboardLineChartObj lineChartInsurance = new DashboardLineChartObj();
		DashboardLineChartObj lineChartLandPackage = new DashboardLineChartObj();
		DashboardLineChartObj lineChartOthers = new DashboardLineChartObj();
		DashboardLineChartObj lineChartTransfers = new DashboardLineChartObj();
		DashboardLineChartObj lineChartSightSeeing = new DashboardLineChartObj();
		DashboardLineChartObj lineChartVisa = new DashboardLineChartObj();
		
		while(itrWorkLoad.hasNext()) {
			Udn_Deal_Status_Entity dealStatus = (Udn_Deal_Status_Entity) itrWorkLoad.next();
			String serviceType = UdanChooConstants.WORKLOAD_SERVICE_MAP.get(dealStatus.getWorkloadStatusObj());
			if(serviceType!=null && (!dealStatus.getWorkloadStatusShortName().equalsIgnoreCase("Completed")) && (!dealStatus.getWorkloadStatusShortName().equalsIgnoreCase("Canc-Comp"))) { 
				int number = countServicesTotalBasedOnStatus(serviceType,dealStatus.getWorkloadStatusId());
				if(serviceType.equalsIgnoreCase(UdanChooConstants.WORKLOAD_FLT_CODE)) {
					lineChartFlight.setServiceName("Flight");
					handleServiceWlDashboard(lineChartFlight,dealStatus,serviceType,number); 
				}
				else if(serviceType.equalsIgnoreCase(UdanChooConstants.WORKLOAD_HTL_CODE)) {
					lineChartHotel.setServiceName("Hotel");
					handleServiceWlDashboard(lineChartHotel,dealStatus,serviceType,number); 
				}
				else if(serviceType.equalsIgnoreCase(UdanChooConstants.WORKLOAD_INS_CODE)) {
					lineChartInsurance.setServiceName("Insurance");
					handleServiceWlDashboard(lineChartInsurance,dealStatus,serviceType,number); 
				}
				else if(serviceType.equalsIgnoreCase(UdanChooConstants.WORKLOAD_LDP_CODE)) {
					lineChartLandPackage.setServiceName("LandPackage");
					handleServiceWlDashboard(lineChartLandPackage,dealStatus,serviceType,number); 
				}
				else if(serviceType.equalsIgnoreCase(UdanChooConstants.WORKLOAD_OTH_CODE)) {
					lineChartOthers.setServiceName("Others");
					handleServiceWlDashboard(lineChartOthers,dealStatus,serviceType,number); 
				}
				else if(serviceType.equalsIgnoreCase(UdanChooConstants.WORKLOAD_TRN_CODE)) {
					lineChartTransfers.setServiceName("Transfers");
					handleServiceWlDashboard(lineChartTransfers,dealStatus,serviceType,number); 
				}
				else if(serviceType.equalsIgnoreCase(UdanChooConstants.WORKLOAD_STS_CODE)) {
					lineChartSightSeeing.setServiceName("SightSeeing");
					handleServiceWlDashboard(lineChartSightSeeing,dealStatus,serviceType,number); 
				}
				else if(serviceType.equalsIgnoreCase(UdanChooConstants.WORKLOAD_VSA_CODE)) {
					lineChartVisa.setServiceName("Visa");
					handleServiceWlDashboard(lineChartVisa,dealStatus,serviceType,number); 
				}
				//System.out.println("serviceType  - > " + serviceType + " -- Status " + dealStatus.getWorkloadStatusId() + "-- Status Name -> " + dealStatus.getWorkloadStatusShortName() + " - Numbers " + number);
			}
		}
		
		listWlDbData.add(lineChartFlight);
		listWlDbData.add(lineChartHotel);
		listWlDbData.add(lineChartInsurance);
		listWlDbData.add(lineChartLandPackage);
		listWlDbData.add(lineChartOthers);
		listWlDbData.add(lineChartTransfers);
		listWlDbData.add(lineChartSightSeeing);
		listWlDbData.add(lineChartVisa);
		
		//System.out.println("Total Status list size is " + listWlDbData.size());
		/*List workLoadStatusList = getUniqueWorkLoadObjStatusListBasedOnType("workload");
		System.out.println("List size is" + workLoadStatusList.size());
		Iterator itr =workLoadStatusList.iterator();
		while(itr.hasNext()) {
			System.out.println("Status Name is " + itr.next());
		}*/
		return listWlDbData;
	}


	public Udn_Deals_Recorder_Entity findBy_DealConfirmationId_And_DealOwner(long dealConfirmationId, long dealOwner,boolean isAdmin) {
		if(isAdmin) {
			return dealRepository.findById(dealConfirmationId).get();
		}
		return dealRepository.findByDealConfirmationIdAndDealOwner(dealConfirmationId, dealOwner).get() ;
	}
	
	public Udn_Deals_Recorder_Entity findByDealConfirmationId_DealOwner_TaggedTeam(long dealConfirmationId, long dealOwner,boolean isAdmin) {
		Optional<Udn_Deals_Recorder_Entity> optionalDealEntity =  dealRepository.findById(dealConfirmationId);
		Udn_Deals_Recorder_Entity dealEntity = null;
		boolean isDealPresent = optionalDealEntity.isPresent();
		if(isDealPresent) {
			dealEntity = dealRepository.findById(dealConfirmationId).get();
		}
		if(isDealPresent && isAdmin) {
			return dealEntity; 
		}
		else if(isDealPresent && dealEntity.getDealOwner()==dealOwner) {
			return dealEntity;
		}
		else if(isDealPresent && dealEntity.getTeam().stream().anyMatch(udnTeam -> udnTeam.getUserId() == dealOwner)) {
			return dealEntity;
		}
		return null;
	}
	
	
	public boolean isDealRelevantForAccessingUser(long dealConfirmationId, long dealOwner,boolean isAdmin) {
		Optional<Udn_Deals_Recorder_Entity> optionalDealEntity =  dealRepository.findById(dealConfirmationId);
		Udn_Deals_Recorder_Entity dealEntity = null;
		boolean isDealPresent = optionalDealEntity.isPresent();
		if(isDealPresent) {
			dealEntity = dealRepository.findById(dealConfirmationId).get();
		}
		if(isDealPresent && isAdmin) {
			return true; 
		}
		else if(isDealPresent && dealEntity.getDealOwner()==dealOwner) {
			return true;
		}
		else if(isDealPresent && dealEntity.getTeam().stream().anyMatch(udnTeam -> udnTeam.getUserId() == dealOwner)) {
			return true;
		}
		return false;
	}
	
	public Optional<Udn_Deals_Recorder_Entity> findBy_DealConfirmationId_DealOwner(long dealConfirmationId,long dealOwner){
		return dealRepository.findByDealConfirmationIdAndDealOwner(dealConfirmationId, dealOwner);
	}

	
	public List<Udn_Deals_Recorder_Entity> findAll() {
		return dealRepository.findAll();
	}
	
	
	@Transactional
	public boolean convertQuotationToDealRecord(Udn_Deals_Recorder_Obj dealRecorderObj,long quotationId,UserDetailsObj userObj) {
		Udn_Deals_Recorder_Entity dealRecordEntity = new Udn_Deals_Recorder_Entity(dealRecorderObj);
        dealRecordEntity.setDealOwner(dealRecorderObj.getDealOwner());
        Tg_Quotation_Recorder_Entity quotationEntity = quotationService.findQuotationRecordById(quotationId);
        
        String serviceEmailList="";
        for (int i=0;i<dealRecorderObj.getServiceList().length;i++) {
    		Udn_Deal_Services_Entity serviceMapEntity = new Udn_Deal_Services_Entity();
    		serviceMapEntity.setDealServiceCode(dealRecorderObj.getServiceList()[i]);
    		if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_FLT_CODE)) {
    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_FLT_WL_STATUS);
    			serviceEmailList = serviceEmailList + "<li>" + UdanChooConstants.UDN_FLT_SRV_SUPP_NAME;
    		}
    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_HTL_CODE)) {
    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_HTL_WL_STATUS);
    			serviceEmailList = serviceEmailList + "<li>" + UdanChooConstants.UDN_HTL_SRV_SUPP_NAME;
    		}
    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_INS_CODE)) {
    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_INS_WL_STATUS);
    			serviceEmailList = serviceEmailList + "<li>" + UdanChooConstants.UDN_INS_SRV_SUPP_NAME;
    		} 
    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_LDP_CODE)) {
    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_LDP_WL_STATUS);
    			serviceEmailList = serviceEmailList + "<li>" + UdanChooConstants.UDN_LDP_SRV_SUPP_NAME;
    		}
    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_OTH_CODE)) {
    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_OTH_WL_STATUS);
    			serviceEmailList = serviceEmailList + "<li>" + UdanChooConstants.UDN_OTH_SRV_SUPP_NAME;
    		}
    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_STS_CODE)) {
    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_STS_WL_STATUS);
    			serviceEmailList = serviceEmailList + "<li>" + UdanChooConstants.UDN_STS_SRV_SUPP_NAME;
    		}
    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_TRN_CODE)) {
    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_TRN_WL_STATUS);
    			serviceEmailList = serviceEmailList + "<li>" + UdanChooConstants.UDN_TRN_SRV_SUPP_NAME;
    		}
    		else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_VSA_CODE)) {
    			serviceMapEntity.setServiceStatus(UdanChooConstants.DEAL_FRESH_CREATED_VSA_WL_STATUS);
    			serviceEmailList = serviceEmailList + "<li>" + UdanChooConstants.UDN_VSA_SRV_SUPP_NAME;
    		}
    		serviceMapEntity.setParentDealRecord(dealRecordEntity);
    		dealRecordEntity.getDealServicesEntityList().add(serviceMapEntity);
    	}
        System.out.println("Deal Entity is " + dealRecordEntity);
        for(Udn_Deal_Services_Entity serviceEntity: dealRecordEntity.getDealServicesEntityList()) {
        	System.out.println("*****************************************************");
        	System.out.println("Service Map Id is " + serviceEntity.getServiceMapId());
        	System.out.println("Service Map Code is " + serviceEntity.getDealServiceCode());
        	System.out.println("*****************************************************");
        }
        
        
        Udn_Deals_Recorder_Entity newDealEntity= createDealWithServices(dealRecordEntity);
        dealRecorderObj.setDealConfirmationId(newDealEntity.getDealConfirmationId());
    	boolean isAdmin=false;
        if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
        	isAdmin = true;
    	}

        for (int i=0;i<dealRecorderObj.getServiceList().length;i++) {
        	if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_FLT_CODE)) {
        		Udn_Deal_Services_Entity serviceMap= dealServiceLine.find_Service_Map_Deal(newDealEntity.getDealConfirmationId(),UdanChooConstants.WORKLOAD_FLT_CODE,userObj.getUserId(),isAdmin);
        		for(Udn_Manual_Flight_Quotation_Entity flightEntity: quotationEntity.getManualQuotationsList()) {
					Udn_Deal_FLT_SL_Entity flightSLEntity = new Udn_Deal_FLT_SL_Entity(flightEntity);
					flightSLEntity.setDealConfirmationId(newDealEntity.getDealConfirmationId());
					flightSLEntity.setServiceMapId(serviceMap.getServiceMapId());
					dealServiceLine.saveFlightServiceLine(flightSLEntity);
				}
        		

        	}
        	if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_HTL_CODE)) {
        		Udn_Deal_Services_Entity serviceMap= dealServiceLine.find_Service_Map_Deal(newDealEntity.getDealConfirmationId(),UdanChooConstants.WORKLOAD_HTL_CODE,userObj.getUserId(),isAdmin);
        		for(Udn_Manual_Hotel_Quotation_Entity hotelEntity: quotationEntity.getHotelQuotationsList()) {
					Udn_Deal_HTL_SL_Entity hotelSLEntity = new Udn_Deal_HTL_SL_Entity(hotelEntity);
					hotelSLEntity.setDealConfirmationId(newDealEntity.getDealConfirmationId());
					hotelSLEntity.setServiceMapId(serviceMap.getServiceMapId());
					dealServiceLine.saveHotelServiceLine(hotelSLEntity);
				}
        	}
        	if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_LDP_CODE)) {
        		Udn_Deal_Services_Entity serviceMap= dealServiceLine.find_Service_Map_Deal(newDealEntity.getDealConfirmationId(),UdanChooConstants.WORKLOAD_LDP_CODE,userObj.getUserId(),isAdmin);
        		for(Udn_Manual_Package_Quotation_Entity packageEntity: quotationEntity.getPackageQuotationsList()) {
        			Udn_Deal_LDP_SL_Entity ldpSLEntity = new Udn_Deal_LDP_SL_Entity(packageEntity);
        			ldpSLEntity.setDealConfirmationId(newDealEntity.getDealConfirmationId());
					ldpSLEntity.setServiceMapId(serviceMap.getServiceMapId());
					dealServiceLine.saveLandPackageServiceLine(ldpSLEntity);
				}
        	}
        	if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_VSA_CODE)) {
        		Udn_Deal_Services_Entity serviceMap= dealServiceLine.find_Service_Map_Deal(newDealEntity.getDealConfirmationId(),UdanChooConstants.WORKLOAD_VSA_CODE,userObj.getUserId(),isAdmin);
        		for(Udn_Manual_Visa_Quotation_Entity visaQtnEntity: quotationEntity.getVisaQuotationList()) {
        			boolean costupdated=false;
        			for(int adultCtr=1;adultCtr<=visaQtnEntity.getAdults();adultCtr++) {
        				Udn_Deal_VSA_SL_Entity visaSLEntity = new Udn_Deal_VSA_SL_Entity(visaQtnEntity); 
        				visaSLEntity.setApplicantName("Adult " + adultCtr);
        				visaSLEntity. setDealConfirmationId(newDealEntity.getDealConfirmationId());
        				visaSLEntity.setServiceMapId(serviceMap.getServiceMapId());
        				if(!costupdated) {
        					visaSLEntity.setServiceLineCost(visaQtnEntity.getVisaCost());
        					visaSLEntity.setMarkup(visaQtnEntity.getVisaMarkup());
        					costupdated=true;
        				}
        				dealServiceLine.saveVisaServiceLine(visaSLEntity);
        			}
        			for(int childCtr=1;childCtr<=visaQtnEntity.getChildren();childCtr++) {
        				Udn_Deal_VSA_SL_Entity visaSLEntity = new Udn_Deal_VSA_SL_Entity(visaQtnEntity); 
        				visaSLEntity.setApplicantName("Child " + childCtr);
        				visaSLEntity. setDealConfirmationId(newDealEntity.getDealConfirmationId());
        				visaSLEntity.setServiceMapId(serviceMap.getServiceMapId());
        				if(!costupdated) {
        					visaSLEntity.setServiceLineCost(visaQtnEntity.getVisaCost());
        					visaSLEntity.setMarkup(visaQtnEntity.getVisaMarkup());
        					costupdated=true;
        				}
        				dealServiceLine.saveVisaServiceLine(visaSLEntity);
        			}
        			for(int infantCtr=1;infantCtr<=visaQtnEntity.getInfant();infantCtr++) {
        				Udn_Deal_VSA_SL_Entity visaSLEntity = new Udn_Deal_VSA_SL_Entity(visaQtnEntity); 
        				visaSLEntity.setApplicantName("Infant " + infantCtr);
        				visaSLEntity. setDealConfirmationId(newDealEntity.getDealConfirmationId());
        				visaSLEntity.setServiceMapId(serviceMap.getServiceMapId());
        				if(!costupdated) {
        					visaSLEntity.setServiceLineCost(visaQtnEntity.getVisaCost());
        					visaSLEntity.setMarkup(visaQtnEntity.getVisaMarkup());
        					costupdated=true;
        				}
        				dealServiceLine.saveVisaServiceLine(visaSLEntity);
        				
        			}
				}
        	}
        	if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_INS_CODE)) {
        		convertInsuranceQtnToDeal(newDealEntity,quotationEntity, userObj.getUserId(),isAdmin);
        	}
        	if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_STS_CODE)) {
        		convertSightSeeingQtnToDeal(newDealEntity,quotationEntity, userObj.getUserId(),isAdmin);
        	}
        	if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_TRN_CODE)) {
        		convertTransfersQtnToDeal(newDealEntity,quotationEntity, userObj.getUserId(),isAdmin);
        	}
        	if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_CRS_CODE)) {
        		convertCruiseQtnToDeal(newDealEntity,quotationEntity, userObj.getUserId(),isAdmin);
        	}
        	if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_OTH_CODE)) {
        		convertOthersQtnToDeal(newDealEntity,quotationEntity, userObj.getUserId(),isAdmin);
        	}


        }        
        /*
        if(dealRecorderObj.isClientInformed() && emailClientOn) {
        	ClientObj client = clientService.find_ClientByDealConfirmationId(newDealEntity.getDealConfirmationId());
        	informClientDealConfirmation(client,dealRecordEntity.getDealConfirmationId(),serviceEmailList,user);
        }

        dealMapView.addObject("Success", "Deal Record is created Successfully!! ");
        
        dealMapView.setViewName("forward:view_view_deal_form?dealConfirmationId="+newDealEntity.getDealConfirmationId());
        */

        return true;
	}
	
	private void convertOthersQtnToDeal(Udn_Deals_Recorder_Entity newDealEntity,Tg_Quotation_Recorder_Entity quotationEntity, int userId, boolean isAdmin) {
		Udn_Deal_Services_Entity serviceMap= dealServiceLine.find_Service_Map_Deal(newDealEntity.getDealConfirmationId(),UdanChooConstants.WORKLOAD_OTH_CODE,userId,isAdmin);
		for(Udn_Manual_Other_Quotation_Entity othersEntity: quotationEntity.getOtherQuotationsList()) {
			Udn_Deal_OTH_SL_Entity othSLEntity = new Udn_Deal_OTH_SL_Entity(othersEntity);
			othSLEntity.setDealConfirmationId(newDealEntity.getDealConfirmationId());
			othSLEntity.setServiceMapId(serviceMap.getServiceMapId());
			dealServiceLine.saveOtherServiceLine(othSLEntity);
		}
	}


	private void convertCruiseQtnToDeal(Udn_Deals_Recorder_Entity newDealEntity,Tg_Quotation_Recorder_Entity quotationEntity, int userId, boolean isAdmin) {
		Udn_Deal_Services_Entity serviceMap= dealServiceLine.find_Service_Map_Deal(newDealEntity.getDealConfirmationId(),UdanChooConstants.WORKLOAD_CRS_CODE,userId,isAdmin);
		for(Udn_Manual_Cruise_Quotation_Entity cruiseEntity: quotationEntity.getCruiseQuotationsList()) {
			Udn_Deal_CRS_SL_Entity crsSLEntity = new Udn_Deal_CRS_SL_Entity(cruiseEntity);
			crsSLEntity.setDealConfirmationId(newDealEntity.getDealConfirmationId());
			crsSLEntity.setServiceMapId(serviceMap.getServiceMapId());
			dealServiceLine.saveCruiseServiceLine(crsSLEntity);
		}
	
	}


	private void convertTransfersQtnToDeal(Udn_Deals_Recorder_Entity newDealEntity,Tg_Quotation_Recorder_Entity quotationEntity, int userId, boolean isAdmin) {
		Udn_Deal_Services_Entity serviceMap= dealServiceLine.find_Service_Map_Deal(newDealEntity.getDealConfirmationId(),UdanChooConstants.WORKLOAD_TRN_CODE,userId,isAdmin);
		for(Udn_Manual_Transfer_Quotation_Entity transfersEntity: quotationEntity.getTransferQuotationList()) {
			Udn_Deal_TRN_SL_Entity trnSLEntity = new Udn_Deal_TRN_SL_Entity(transfersEntity);
			trnSLEntity.setDealConfirmationId(newDealEntity.getDealConfirmationId());
			trnSLEntity.setServiceMapId(serviceMap.getServiceMapId());
			dealServiceLine.saveTransferServiceLine(trnSLEntity);
		}
	}


	private void convertSightSeeingQtnToDeal(Udn_Deals_Recorder_Entity newDealEntity,Tg_Quotation_Recorder_Entity quotationEntity, int userId, boolean isAdmin) {
		Udn_Deal_Services_Entity serviceMap= dealServiceLine.find_Service_Map_Deal(newDealEntity.getDealConfirmationId(),UdanChooConstants.WORKLOAD_STS_CODE,userId,isAdmin);
		for(Udn_Manual_SightSeeing_Quotation_Entity sightSeeingEntity: quotationEntity.getSightSeeingQuotationList()) {
			Udn_Deal_STS_SL_Entity stsSLEntity = new Udn_Deal_STS_SL_Entity(sightSeeingEntity);
			stsSLEntity.setDealConfirmationId(newDealEntity.getDealConfirmationId());
			stsSLEntity.setServiceMapId(serviceMap.getServiceMapId());
			dealServiceLine.saveSightSeeingServiceLine(stsSLEntity);
		}
		
	}


	private void convertInsuranceQtnToDeal(Udn_Deals_Recorder_Entity newDealEntity,Tg_Quotation_Recorder_Entity quotationEntity, long userId,boolean isAdmin) {
		Udn_Deal_Services_Entity serviceMap= dealServiceLine.find_Service_Map_Deal(newDealEntity.getDealConfirmationId(),UdanChooConstants.WORKLOAD_INS_CODE,userId,isAdmin);
		for(Udn_Manual_Insurance_Quotation_Entity insQtnEntity: quotationEntity.getInsuranceQuotationsList()) {
			boolean costupdated=false;
			for(int adultCtr=1;adultCtr<=insQtnEntity.getAdults();adultCtr++) {
				Udn_Deal_INS_SL_Entity insSLEntity = new Udn_Deal_INS_SL_Entity(insQtnEntity); 
				insSLEntity.setApplicantName("Adult " + adultCtr);
				insSLEntity.setDealConfirmationId(newDealEntity.getDealConfirmationId());
				insSLEntity.setServiceMapId(serviceMap.getServiceMapId());
				if(!costupdated) {
					insSLEntity.setServiceLineCost(insQtnEntity.getPremiumCost());
					insSLEntity.setMarkup(insQtnEntity.getPremiumMarkup());
					costupdated=true;
				}
				System.out.println("Service Line Entity is " + insSLEntity);
				dealServiceLine.saveInsuranceServiceLine(insSLEntity);
			}
			for(int childCtr=1;childCtr<=insQtnEntity.getChildren();childCtr++) {
				Udn_Deal_INS_SL_Entity insSLEntity = new Udn_Deal_INS_SL_Entity(insQtnEntity); 
				insSLEntity.setApplicantName("Child " + childCtr);
				insSLEntity.setDealConfirmationId(newDealEntity.getDealConfirmationId());
				insSLEntity.setServiceMapId(serviceMap.getServiceMapId());
				if(!costupdated) {
					insSLEntity.setServiceLineCost(insQtnEntity.getPremiumCost());
					insSLEntity.setMarkup(insQtnEntity.getPremiumMarkup());
					costupdated=true;
				}
				dealServiceLine.saveInsuranceServiceLine(insSLEntity);
			}
			for(int infantCtr=1;infantCtr<=insQtnEntity.getInfant();infantCtr++) {
				Udn_Deal_INS_SL_Entity insSLEntity = new Udn_Deal_INS_SL_Entity(insQtnEntity); 
				insSLEntity.setApplicantName("Infant " + infantCtr);
				insSLEntity. setDealConfirmationId(newDealEntity.getDealConfirmationId());
				insSLEntity.setServiceMapId(serviceMap.getServiceMapId());
				if(!costupdated) {
					insSLEntity.setServiceLineCost(insQtnEntity.getPremiumCost());
					insSLEntity.setMarkup(insQtnEntity.getPremiumMarkup());
					costupdated=true;
				}
				dealServiceLine.saveInsuranceServiceLine(insSLEntity);
			}
		}
	}
	
	
	public Page<Udn_Deals_Recorder_Entity>  filterDeals(int pageNo, int pageSize,long dealOwner,String sorting,SearchDealObj filterDealObj,boolean isAdmin ) {
		boolean dateCheckFilterNeeded = true;
		String searchCriteria = filterDealObj.getSearchCriteria();
		System.out.println("Filtered Object is " + filterDealObj);
		
		if(filterDealObj.getDealConfirmationId()!=0) {
			dateCheckFilterNeeded = false;
		}
		if(filterDealObj.getQueryId()!=0) {
			dateCheckFilterNeeded = false;
		}
		filterDealObj.setDateCheckFilterNeeded(dateCheckFilterNeeded);
		Pageable paging = PageRequest.of(pageNo, pageSize,Sort.by(sorting));
		Date currentDate = Date.from(java.time.ZonedDateTime.now().toInstant());
	    GregorianCalendar cal = new GregorianCalendar();
		cal.setTime(currentDate);
		cal.add(Calendar.DATE, -365);
		Date criteriaDate = cal.getTime();
		boolean isDealAdmin=false;
		
		Page<Udn_Deals_Recorder_Entity> filtereDealsList = dealRepository.findAll(new Specification<Udn_Deals_Recorder_Entity>() {
			private static final long serialVersionUID = 1L;
			@Override
			public Predicate toPredicate(Root<Udn_Deals_Recorder_Entity> dealsRootEntity, CriteriaQuery< ?> query, CriteriaBuilder criteriaBuilder) {
				List<Predicate> predicates = new ArrayList<>();
				query.distinct(true);
				if(dealOwner!=0) {
					Root<Ti_Deals_Team_Map_Entity> rootDealsTeamMapEntity = query.from(Ti_Deals_Team_Map_Entity.class);
					List<Predicate> teamListPredicatesList = new ArrayList<>();
					Predicate notNullPredicate = criteriaBuilder.isNotNull(rootDealsTeamMapEntity.get("dealConfirmationId"));
					Predicate serviceCityPredcate =criteriaBuilder.equal( rootDealsTeamMapEntity.get("userId"),dealOwner);
					Predicate supplierPredcate =criteriaBuilder.equal(dealsRootEntity.get("dealConfirmationId"), rootDealsTeamMapEntity.get("dealConfirmationId"));
					Predicate finalJoinPredicate = criteriaBuilder.and(serviceCityPredcate,supplierPredcate,notNullPredicate);
					Predicate dealOwnerPredicate = criteriaBuilder.equal(dealsRootEntity.get("dealOwner"), dealOwner);
					Predicate finalUltimatePredicate = criteriaBuilder.or(dealOwnerPredicate,finalJoinPredicate);
					teamListPredicatesList.add(finalUltimatePredicate);
					predicates.addAll(teamListPredicatesList);
				}
				if(filterDealObj.getDealConfirmationId()!=0) {
					predicates.add(criteriaBuilder.equal(dealsRootEntity.get("dealConfirmationId"), filterDealObj.getDealConfirmationId()));
				}
				if(filterDealObj.getClientId()!=0) {
					predicates.add(criteriaBuilder.equal(dealsRootEntity.get("clientId"), filterDealObj.getClientId()));
				}
				if(filterDealObj.getQueryId()!=0){
					predicates.add(criteriaBuilder.equal(dealsRootEntity.get("queryId"), filterDealObj.getQueryId()));
				}
				if(filterDealObj.getDealStatus()!=0) {
					predicates.add(criteriaBuilder.equal(dealsRootEntity.get("dealStatus"), filterDealObj.getDealStatus()));
				}
				if(filterDealObj.getSearchOnBookingDate() && filterDealObj.isDateCheckFilterNeeded()) {
					processDateCriteria(filterDealObj);
					predicates.add(criteriaBuilder.between(dealsRootEntity.get("bookingDate"),filterDealObj.getStartDate(),filterDealObj.getEndDate()));
				}
				if(!filterDealObj.getSearchOnBookingDate() && filterDealObj.isDateCheckFilterNeeded()) {
					processDateCriteria(filterDealObj);
					predicates.add(criteriaBuilder.between(dealsRootEntity.get("travelStartDate"),filterDealObj.getStartDate(),filterDealObj.getEndDate()));
				}
				return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
			}
		},paging);
		
		return filtereDealsList;
	}
	
	private void processDateCriteria(SearchDealObj filterDealObj) {
		LocalDate currentDate = LocalDate.now();
		LocalDate sdateFrom = null;
		LocalDate sdateTo = null ;
		
		if(filterDealObj.getDealSearchPeriodType()!=UdanChooConstants.DEALS_DATE_RANGE) {
			if(filterDealObj.getDealSearchPeriodType()==UdanChooConstants.DEALS_CURRENT_MONTH) {
				sdateFrom = currentDate.withDayOfMonth(1);
	            sdateTo = currentDate.withDayOfMonth(currentDate.lengthOfMonth());
			}
			if(filterDealObj.getDealSearchPeriodType()==UdanChooConstants.DEALS_PREV_MONTH) {
				sdateFrom = currentDate.minusMonths(1).withDayOfMonth(1);
	            sdateTo = currentDate.minusMonths(1).withDayOfMonth(currentDate.minusMonths(1).lengthOfMonth());
			}
			if(filterDealObj.getDealSearchPeriodType()==UdanChooConstants.DEALS_CURRENT_FIN_YEAR) {
				if (currentDate.getMonthValue() >= 4) {
		            // If yes, set dateFrom to April 1st of the current year
					sdateFrom = LocalDate.of(currentDate.getYear(), 4, 1);
		            // Set dateTo to March 31st of the next year
					sdateTo = LocalDate.of(currentDate.getYear() + 1, 3, 31);
		        } else {
		            // If no, set dateFrom to April 1st of the last year
		        	sdateFrom = LocalDate.of(currentDate.getYear() - 1, 4, 1);
		            // Set dateTo to March 31st of the current year
		        	sdateTo = LocalDate.of(currentDate.getYear(), 3, 31);
		        }
			}
			if(filterDealObj.getDealSearchPeriodType()==UdanChooConstants.DEALS_PREV_FIN_YEAR) {
				 // Check if the current month is on or after April
		        if (currentDate.getMonthValue() >= 4) {
		            // If yes, set dateFrom to April 1st of the last year
		        	sdateFrom = LocalDate.of(currentDate.getYear() - 1, 4, 1);
		            // Set dateTo to March 31st of the current year
		        	sdateTo = LocalDate.of(currentDate.getYear(), 3, 31);
		        } else {
		            // If no, set dateFrom to April 1st of the year before last year
		        	sdateFrom = LocalDate.of(currentDate.getYear() - 2, 4, 1);
		            // Set dateTo to March 31st of the last year
		        	sdateTo = LocalDate.of(currentDate.getYear() - 1, 3, 31);
		        }
			}
			filterDealObj.setStartDate(java.sql.Date.valueOf(sdateFrom));
	        filterDealObj.setEndDate(java.sql.Date.valueOf(sdateTo));	
		}
	}
}
