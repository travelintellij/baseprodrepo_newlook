package com.udanchoo.intranet.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.udanchoo.intranet.entity.Tg_Flt_Airport_Entity;
import com.udanchoo.intranet.entity.UdnClientEntity;
import com.udanchoo.intranet.entity.UdnTeam;
import com.udanchoo.intranet.entity.Udn_Airline_Master_Entity;
import com.udanchoo.intranet.entity.Udn_Deals_Recorder_Entity;
import com.udanchoo.intranet.entity.Udn_Destinations_Entity;
import com.udanchoo.intranet.entity.Udn_Hotel_Master_Entity;
import com.udanchoo.intranet.entity.Udn_Room_Category_Entity;
import com.udanchoo.intranet.entity.leads.Tg_Leads_Recorder_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.AirLineVO;
import com.udanchoo.intranet.model.Tag;
import com.udanchoo.intranet.model.Udn_Deals_Recorder_Obj;
import com.udanchoo.intranet.model.Udn_Destinations_Master_Obj;
import com.udanchoo.intranet.model.Udn_Hotel_Master_Obj;
import com.udanchoo.intranet.model.Udn_SightSeeing_Master_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.leads.TgLeadsRecorderVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.HotelServiceImpl;
import com.udanchoo.intranet.service.SightSeeingServiceImpl;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;

import javassist.bytecode.Descriptor.Iterator;


@Controller
public class CommonServicesController {

	
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
	ClientServiceImpl clientService;
	
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
	HotelServiceImpl hotelService;
	
	@Autowired
	SightSeeingServiceImpl sightSeeingService;
	
	@Autowired
	UserDetailsServiceImpl userService;

 
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
    
   
	@RequestMapping(value = "/getDestinationList", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<Tag> getDestinationList(@RequestParam String query) {
		List<Tag> result = new ArrayList<Tag>();
		List <Udn_Destinations_Entity> entityList = commonService.listAllActiveDestinations();
		// iterate a list and filter by tagName
		for (Udn_Destinations_Entity entity : entityList) {
			if (entity.getCityName().toLowerCase().contains(query.toLowerCase())) {
				//Udn_Destinations_Master_Obj destinationObj = new Udn_Destinations_Master_Obj(entity);
				Tag tag = new Tag();
				tag.setId((long)entity.getDestinationId());
				tag.setTagName(entity.getCityName());
				result.add(tag);
			}
		}
		
		return result;
	}
    
	@RequestMapping(value = "/getTeamList", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<Tag> getTeamList(@RequestParam String query) {
		List<Tag> result = new ArrayList<Tag>();
		List <UserDetailsObj> userActiveList = userService.findAllActiveUsers();
		// iterate a list and filter by tagName
		for (UserDetailsObj entity : userActiveList) {
			if (entity.getUsername().toLowerCase().contains(query.toLowerCase())) {
				//Udn_Destinations_Master_Obj destinationObj = new Udn_Destinations_Master_Obj(entity);
				Tag tag = new Tag();
				tag.setId((long)entity.getUserId());
				tag.setTagName(entity.getUsername() + "--" + entity.getName());
				result.add(tag);
			}
		}
		
		return result;
	}
    
	@RequestMapping(value = "/getCityList", method= {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody
	List<Udn_Destinations_Master_Obj> getTags(@RequestParam String cityName) {
		List<Udn_Destinations_Master_Obj> result = new ArrayList<Udn_Destinations_Master_Obj>();
		List <Udn_Destinations_Entity> entityList = commonService.listAllActiveDestinations();
		// iterate a list and filter by tagName
		for (Udn_Destinations_Entity entity : entityList) {
			if (entity.getCityName().toLowerCase().contains(cityName.toLowerCase())) {
				Udn_Destinations_Master_Obj destinationObj = new Udn_Destinations_Master_Obj(entity);
				result.add(destinationObj);
			}
		}
		
		return result;
	}
	
	
	@RequestMapping(value = "/getCountryList", method = RequestMethod.GET)
	public @ResponseBody
	List<Udn_Destinations_Master_Obj> getCountryList(@RequestParam String countryName) {
		List<Udn_Destinations_Master_Obj> result = new ArrayList<Udn_Destinations_Master_Obj>();
		List <Udn_Destinations_Entity> entityList = commonService.listCountry(countryName);
		// iterate a list and filter by tagName
		for (Udn_Destinations_Entity entity : entityList) {
			if (entity.getCountryName().toLowerCase().contains(countryName.toLowerCase())) {
				Udn_Destinations_Master_Obj destinationObj = new Udn_Destinations_Master_Obj(entity);
				if(!result.contains(destinationObj))
				result.add(destinationObj);
			}
		}
		
		return result;
	}
	

	@RequestMapping(value = "/getCityHotelList",method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	List<Tag> getCityActiveHotels(@RequestParam String hotelName,@RequestParam int cityId) {
		List<Tag> result = new ArrayList<Tag>();
		List <Udn_Hotel_Master_Obj> broadHotelList = hotelService.find_Active_Hotels_By_CityId(cityId);
		// iterate a list and filter by tagName
		for (Udn_Hotel_Master_Obj hotelObj : broadHotelList) {
			if (hotelObj.getHotelName().toLowerCase().contains(hotelName.toLowerCase())) {
				Tag hotelTag= new Tag();
				Map<Integer, String> mapRoomCategory = new HashMap();
				hotelTag.setId((long) hotelObj.getHotelId());
				hotelTag.setTagName(hotelObj.getHotelName() + " -- " + hotelObj.getLocality());
				java.util.Iterator<Udn_Room_Category_Entity> itrRoomCatList = hotelObj.getRoomCategoryEntityList().iterator();
				mapRoomCategory.clear();
				while(itrRoomCatList.hasNext()) {
					 Udn_Room_Category_Entity roomCatEntity =  (Udn_Room_Category_Entity)itrRoomCatList.next();
					 mapRoomCategory.put(roomCatEntity.getRoomCategoryId(), roomCatEntity.getRoomCategoryName());
				}
				hotelTag.setKeyValueList(mapRoomCategory);
				result.add(hotelTag);
			}
		}
		return result;
	}

	@RequestMapping(value = "/getCountryCityList", method = RequestMethod.GET)
	public @ResponseBody
	List<Udn_Destinations_Master_Obj> getCountryCityList(@RequestParam String countryName) {
		List<Udn_Destinations_Master_Obj> result = new ArrayList<Udn_Destinations_Master_Obj>();
		List <Udn_Destinations_Entity> entityList = commonService.listCountry(countryName);
		// iterate a list and filter by tagName
		for (Udn_Destinations_Entity entity : entityList) {
			if (entity.getCountryName().toLowerCase().contains(countryName.toLowerCase())) {
				Udn_Destinations_Master_Obj destinationObj = new Udn_Destinations_Master_Obj(entity);
				
				if(!result.contains(destinationObj)) {
					List<Udn_Destinations_Entity> cityList = commonService.find_CountryCityList(destinationObj.getCountryCode());
					Map<Integer, String> cityMap = cityList.stream().collect(
			                Collectors.toMap(Udn_Destinations_Entity::getDestinationId, Udn_Destinations_Entity::getCityName));
					destinationObj.setCityKeyValue(cityMap);
					result.add(destinationObj);
				}
			}
		}
		
		return result;
	}
	
	
	
	@RequestMapping(value = "/getCitySightSeeingList",method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody
	List<Tag> getCityActiveSightSeeing(@RequestParam String sightSeeingName,@RequestParam int cityId) {
		List<Tag> result = new ArrayList<Tag>();
		List <Udn_SightSeeing_Master_Obj> sightSeeingList = sightSeeingService.find_Active_SightSeeing_By_CityId(cityId);
		// iterate a list and filter by tagName
		for (Udn_SightSeeing_Master_Obj stsObj : sightSeeingList) {
			if (stsObj.getSightSeeingName().toLowerCase().contains(sightSeeingName.toLowerCase())) {
				Tag stsTag= new Tag();
				stsTag.setId((long) stsObj.getSightSeeingId());
				stsTag.setTagName(stsObj.getSightSeeingName());
				 result.add(stsTag);
			}
		}
		return result;
	}
	
	@RequestMapping(value = "/getDealInfo", method = RequestMethod.GET)
	public @ResponseBody
	List<Tag> getDealInfo(@RequestParam String dealKeyword) {
		UserDetailsObj user = getLoggedInUser();
    	boolean isAdmin=false;
    	
     	if(user.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}

		List<Tag> result = new ArrayList<Tag>();
		List<Udn_Deals_Recorder_Obj> dealListResult;
		try {
			dealListResult = commonService.find_Relevant_Deals(dealKeyword,user.getUserId(),isAdmin);
			// iterate a list and filter by tagName
			for (Udn_Deals_Recorder_Obj dealObj : dealListResult) {
				Tag dealTag= new Tag();
				dealTag.setId((long) dealObj.getDealConfirmationId());
				dealTag.setTagName(dealObj.getDealConfirmationId() + "   |   " + dealObj.getClientName() + "   |   " + dealObj.getTravelingFromCity() + "   |   " + dealObj.getTravelingToCity() + "   |   TravDate - " + dealObj.getTravelStartDate());
				result.add(dealTag);
			}
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping("getCityById")
    public Udn_Destinations_Master_Obj findCityByID(@RequestParam("cityId") int cityId) {
		
		Udn_Destinations_Entity cityEntity = commonService.findDestinationById(cityId);
		Udn_Destinations_Master_Obj cityObj = new Udn_Destinations_Master_Obj();
		if(cityEntity==null) {
			return cityObj;
		}
		cityObj.updateCityVOFromEntity(cityEntity);
		return cityObj;
	}

	@ResponseBody
	@RequestMapping("getCountryByCode")
    public Udn_Destinations_Master_Obj findCityByID(@RequestParam("countryCode") String countryCode) {
		
		Udn_Destinations_Entity countryEntity = commonService.findDestinationByCountryCode(countryCode);
		Udn_Destinations_Master_Obj countryObj = new Udn_Destinations_Master_Obj();
		if(countryEntity==null) {
			return countryObj;
		}
		countryObj.updateCityVOFromEntity(countryEntity);
		return countryObj;
	}
	
	
	
	@ResponseBody
	@RequestMapping("getAirlineById")
    public Udn_Airline_Master_Entity findAirlineByID(@RequestParam("airlineId") long airlineId) {
		Udn_Airline_Master_Entity airlineEntity = commonService.findAirlinebyId(airlineId);
		return airlineEntity;
	}

	@ResponseBody
	@RequestMapping("getAirportById")
    public Tg_Flt_Airport_Entity  findAirportByID(@RequestParam("airportId") int airportId) {
		Tg_Flt_Airport_Entity airportEntity = commonService.findAirportById(airportId);
		return airportEntity ;
	}

	

}
