package com.udanchoo.intranet.controller;

import java.util.List;
import java.util.Set;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.udanchoo.intranet.entity.Udn_Hotel_Chain_Entity;
import com.udanchoo.intranet.entity.Udn_Hotel_Master_Entity;
import com.udanchoo.intranet.entity.Udn_Room_Category_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.SearchHotelObj;
import com.udanchoo.intranet.model.Udn_Hotel_Chain_Obj;
import com.udanchoo.intranet.model.Udn_Hotel_Master_Obj;
import com.udanchoo.intranet.model.Udn_Room_Category_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.DealServiceImpl;
import com.udanchoo.intranet.service.HotelServiceImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;




@Controller
public class HotelController {
	
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
	ClientServiceImpl clientService;
	
	@Autowired
	DealServiceImpl dealService;
	
	@Autowired
	HotelServiceImpl hotelService;
	
	
	
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
    
    /*********** Following Section of code deals with hotel chain services ********************************/
    @RequestMapping("view_add_hotel_chain_form")
   	public ModelAndView view_add_hotel_chain_form(@ModelAttribute("hotelchain_obj") Udn_Hotel_Chain_Obj hotelChainObj, BindingResult result ) {
    	
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/hotel/Admin_Add_HotelChain");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	return modelView;
    }
    
    @PostMapping(value="add_add_hotel_chain")
    public ModelAndView add_add_hotel_chain(@ModelAttribute("hotelchain_obj") Udn_Hotel_Chain_Obj hotelChainObj, final RedirectAttributes redirectAttrib) {
    	ModelAndView mapview = new ModelAndView();
    	UserDetailsObj userObj = getLoggedInUser();
    	mapview.addObject("userName",userObj.getUsername());
		//mapview.addObject("userRole",userObj.getRoles());
		Udn_Hotel_Chain_Entity hotelChainEntity = new Udn_Hotel_Chain_Entity(hotelChainObj);
		hotelService.saveOrUpdate_HotelChain(hotelChainEntity);
   		redirectAttrib.addFlashAttribute("Success", "Hotel chain record updated Successfully. !!");
   		mapview.setViewName("redirect:view_search_hotel_chain_form");

		//mapview.addObject("confirmation", "<h2> Your new Hotel Chain is updated Successfully !!<h2>");
    	//mapview.addObject("hotelChainId", hotelChainEntity.getHotelChainId());
    	//mapview.addObject("ConfirmationFor", "Hotel-Chain");
		//mapview.setViewName("admin/AdminConfirmation");
    	
    	return mapview;
    }
    
    //	public ModelAndView view_search_hotel_chain_form(@ModelAttribute("searchhotelchain_obj") SearchHotelObj searchHotelObj, BindingResult result ) {
    @RequestMapping("view_search_hotel_chain_form")
    public ModelAndView view_search_hotel_chain_form(@ModelAttribute("SEARCH_HOTEL_CHAIN") SearchHotelObj searchHotelObj, BindingResult result ) {	
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/hotel/form_searchHotelChain");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	
    	List<Udn_Hotel_Chain_Obj> chainSearchList = hotelService.searchHotelChain(searchHotelObj);
    	
    	modelView.addObject("chainSearchList", chainSearchList);
    	//modelView.addObject("userRole", userObj.getRoles());
    	return modelView;
    }
    
    
  
    
    @PostMapping(value="search_search_hotel_chain")
    public ModelAndView search_search_hotel_chain(@ModelAttribute("hotel_chain_search_result") SearchHotelObj searchHotelObj) {
    	ModelAndView modelView = new ModelAndView("forward:view_search_hotel_chain_form");

    	/*
    	List<Udn_Hotel_Chain_Obj> hotelChainSearchResult = hotelService.searchHotelChain(searchHotelObj);
    	UserDetailsObj userObj = getLoggedInUser();
    	
    	ModelAndView modelView = new ModelAndView("admin/hotel/SearchHotelChainResult");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	modelView.addObject("chainSearchList", hotelChainSearchResult);
    	*/
    	return modelView;
    }
    
    @PostMapping("view_edit_hotel_chain_form")
   	public ModelAndView view_edit_hotel_chain_form(@RequestParam("hotelChainId") int hotelChainId,@ModelAttribute("hotelchain_obj") Udn_Hotel_Chain_Obj hotelChainObj, BindingResult result ) {
    	
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/hotel/Admin_Edit_HotelChain");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	
    	try {
    		hotelChainObj= hotelService.findbyId(hotelChainId);
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	modelView.addObject("HotelChainObj", hotelChainObj);
    	return modelView;
    }
    
    @RequestMapping("view__hotel_chain_details")
    public ModelAndView view__hotel_chain_details(@RequestParam("hotelChainId") int hotelChainId,@ModelAttribute("hotelchain_obj") Udn_Hotel_Chain_Obj hotelChainObj, BindingResult result ) {
    	
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/Admin_View_HotelChain");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	
    	try {
    		hotelChainObj= hotelService.findbyId(hotelChainId);
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	modelView.addObject("HotelChainObj", hotelChainObj);
    	return modelView;
    }
    
    @PostMapping("view_delete_hotel_chain_form")
   	public ModelAndView view_delete_hotel_chain_form(@RequestParam("hotelChainId") int hotelChainId,@ModelAttribute("hotelchain_obj") Udn_Hotel_Chain_Obj hotelChainObj, BindingResult result ) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/hotel/Admin_Delete_Confirmation_HotelChain");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	try {
    		hotelChainObj= hotelService.findbyId(hotelChainId);
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	modelView.addObject("HotelChainObj", hotelChainObj);
    	return modelView;
    }
    
    @PostMapping(value="delete_delete_hotel_chain")
    public ModelAndView delete_delete_hotel_chain(@ModelAttribute("hotelchain_obj") Udn_Hotel_Chain_Obj hotelChainObj, BindingResult result, final RedirectAttributes redirectAttrib ) {
    	ModelAndView mapview = new ModelAndView();

    	UserDetailsObj userObj = getLoggedInUser();
    	mapview.addObject("userName",userObj.getUsername());
		//mapview.addObject("userRole",userObj.getRoles());
		List<Udn_Hotel_Master_Entity> hotelMasterList = hotelService.findHotelByChainId(hotelChainObj.getHotelChainId());
		if(hotelMasterList.size()>0) {
			redirectAttrib.addFlashAttribute("Error", "Error:You must delete all hotels of this chain before deleting the hotel chain. !!");	
		}
		else {
			hotelService.deleteHotelChain(hotelChainObj.getHotelChainId());
			redirectAttrib.addFlashAttribute("Success", "Your Hotel Chain is deleted Successfully !!");
		}
    	
    	//mapview.addObject("ConfirmationFor", "Hotel-Chain-Delete");
		mapview.setViewName("redirect:view_search_hotel_chain_form"); 
    	
    	return mapview;
    }
    
    /******************* Following Code deals with Hotel Master Services ************************************/
    @RequestMapping("view_add_hotel_form")
   	public ModelAndView view_add_hotel_form(@ModelAttribute("hotel_obj") @Valid Udn_Hotel_Master_Obj hotelObj, BindingResult result ) {
    	
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/hotel/Admin_Add_Hotel");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	
    	List<Udn_Hotel_Chain_Obj> hotelChainObjList = hotelService.find_All_Active_HotelChain();
    	modelView.addObject("HotelChainObjList", hotelChainObjList);

    	Udn_Hotel_Master_Obj hotelMasterObj = new Udn_Hotel_Master_Obj();
    	modelView.addObject("hotel_obj", hotelMasterObj);
    	return modelView;
    }
  
    @PostMapping(value="add_add_hotel")
    public ModelAndView add_add_hotel(@ModelAttribute("hotel_obj") @Valid Udn_Hotel_Master_Obj hotelObj, BindingResult result ,final RedirectAttributes redirectAttrib) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView mapview = new ModelAndView();
		mapview.addObject("userName",userObj.getUsername());
		//mapview.addObject("userRole",userObj.getRoles());
		
		if(result.hasErrors()) {
			List<Udn_Hotel_Chain_Obj> hotelChainObjList = hotelService.find_All_Active_HotelChain();
			mapview.addObject("HotelChainObjList", hotelChainObjList);
			mapview.setViewName("admin/hotel/Admin_Add_Hotel");
      		return mapview; 
    	}
    	else {
    		Udn_Hotel_Master_Entity hotelEntity = new Udn_Hotel_Master_Entity(hotelObj);
    		Udn_Room_Category_Entity roomCategoryEntity = new Udn_Room_Category_Entity();
    		roomCategoryEntity.setRoomCategoryName(hotelObj.getDefaultRoomCategory());
    		roomCategoryEntity.setHigherCategory(0);
    		roomCategoryEntity.setRemarks("Default Category Room");
    		roomCategoryEntity.setRoomSize(0);
    		roomCategoryEntity.setHotelId(hotelEntity);
    		hotelEntity.getRoomCategoryEntityList().add(roomCategoryEntity);
    		hotelService.saveOrUpdate_Hotel(hotelEntity);
			//mapview.addObject("confirmation", "<h2> Your Hotel is updated Successfully !!<h2>");
	    	//mapview.addObject("ConfirmationFor", "Hotel-Add-Update");
			//mapview.setViewName("admin/AdminConfirmation");
    		redirectAttrib.addFlashAttribute("Success", "Hotel Record is updated successfully!! ");
    		mapview.setViewName("redirect:view_view_hotel_details?hotelId="+hotelEntity.getHotelId());
    	}
    	return mapview ;
    	
    }
    
    @RequestMapping("view_search_hotel_form")
   	public ModelAndView view_search_hotel_form(@ModelAttribute("searchhotel_obj") SearchHotelObj searchHotelObj, BindingResult result ) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/hotel/form_searchHotel");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	
    	List<Udn_Hotel_Chain_Obj> hotelChainObjList = hotelService.find_All_Active_HotelChain();
    	modelView.addObject("HotelChainObjList", hotelChainObjList);
		
    	return modelView;
    }
    
    @PostMapping(value="search_search_hotel")
    public ModelAndView search_search_hotel(@ModelAttribute("hotel_search_result") SearchHotelObj searchHotelObj) {
    	ModelAndView mapview = new ModelAndView();
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/hotel/form_searchHotel_Result");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	
    	List<Udn_Hotel_Chain_Obj> hotelChainObjList = hotelService.find_All_Active_HotelChain();
    	modelView.addObject("HotelChainObjList", hotelChainObjList);
		
    	List<Udn_Hotel_Master_Obj> filteredHotelList = hotelService.searchHotels(searchHotelObj);
    	modelView.addObject("HTL_SEARCH_RESULT", filteredHotelList);

    	return modelView;
    }

    @RequestMapping("view_view_hotel_details")
    public ModelAndView view_view_hotel_details(@RequestParam("hotelId") int hotelId) {
    	Udn_Hotel_Master_Obj hotelMasterObj = null;
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/hotel/Admin_View_Hotel");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	
    	try {
    		hotelMasterObj= hotelService.findHotelbyId(hotelId);
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	modelView.addObject("hotelMasterObj", hotelMasterObj);
    	return modelView;
    }
    
    @PostMapping("view_edit_hotel_form")
   	public ModelAndView view_edit_hotel_form(@ModelAttribute("hotel_obj") Udn_Hotel_Master_Obj hotelMasterObj,  BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/hotel/Admin_Edit_Hotel");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	
    	List<Udn_Hotel_Chain_Obj> hotelChainObjList = hotelService.find_All_Active_HotelChain();
    	modelView.addObject("HotelChainObjList", hotelChainObjList);

    	try {
			hotelMasterObj = hotelService.findHotelbyId(hotelMasterObj.getHotelId());
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}    	
    	modelView.addObject("hotel_obj", hotelMasterObj);
    	return modelView;
    }
    
    //@PostMapping(value="edit_edit_hotel")
    @RequestMapping(value = "edit_edit_hotel", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView edit_edit_hotel(@RequestParam("action") String action, @ModelAttribute("hotel_obj") @Valid Udn_Hotel_Master_Obj hotelObj, BindingResult result,final RedirectAttributes redirectAttributes ) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView mapview = new ModelAndView();
		mapview.addObject("userName",userObj.getUsername());
		//mapview.addObject("userRole",userObj.getRoles());
		
		
		if(action.equals("EditRoomCategory")){
			mapview.setViewName("redirect:view_hotel_room_category_list?hotelId="+hotelObj.getHotelId());
			return mapview;
		}
		
		if(result.hasErrors()) {
			List<Udn_Hotel_Chain_Obj> hotelChainObjList = hotelService.find_All_Active_HotelChain();
			mapview.addObject("HotelChainObjList", hotelChainObjList);
			mapview.setViewName("admin/hotel/Admin_Edit_Hotel");
      		return mapview; 
    	}
    	else {
    		Udn_Hotel_Master_Entity hotelEntity = new Udn_Hotel_Master_Entity(hotelObj);
    		Set<Udn_Room_Category_Entity> roomCategoryEntity = hotelService.find_All_RoomCategoryBy_HotelId(hotelObj.getHotelId());
    		hotelEntity.setRoomCategoryEntityList(roomCategoryEntity);
    		
    		hotelService.saveOrUpdate_Hotel(hotelEntity);
    		//mapview=view_view_hotel_details(hotelObj.getHotelId());
    		//mapview.addObject("confirmation", "<h3 style=\"color:red;\"> Your Hotel is updated Successfully !!<h3>");
    		//mapview.setViewName("redirect:view_view_hotel_details?hotelId="+hotelObj.getHotelId());
    		redirectAttributes.addFlashAttribute("Success", "Hotel Record is updated successfully!! ");
    		mapview.setViewName("redirect:view_view_hotel_details?hotelId="+hotelEntity.getHotelId());
    	}
    	return mapview ;
    	
    }
    
    //@PostMapping("view_hotel_room_category_list")
    @RequestMapping(value = "view_hotel_room_category_list", method = { RequestMethod.GET, RequestMethod.POST })
   	public ModelAndView view_hotel_room_category_list(@RequestParam("hotelId") int hotelId,@ModelAttribute("hotel_room_caetgory_obj") Udn_Room_Category_Obj roomCategoryObj,  BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/hotel/Hotel_Room_Category_Update");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	
    	List<Udn_Room_Category_Obj> roomCatObjList = hotelService.find_All_RoomCategoryByHotelId(hotelId);
    	modelView.addObject("Room_Cat_Obj_List", roomCatObjList);
    	
    	Udn_Hotel_Master_Obj hotelMasterObj=null;
    	try {
    		hotelMasterObj= hotelService.findHotelbyId(hotelId);
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	modelView.addObject("hotelId", hotelMasterObj.getHotelId());
    	modelView.addObject("hotelName", hotelMasterObj.getHotelName());
    	modelView.addObject("address", hotelMasterObj.getAddress());
    	modelView.addObject("city", hotelMasterObj.getCityName());
    	
    	modelView.addObject("Room_Cat_Obj_List", roomCatObjList);
    	
    	return modelView;
    }
    
    
    @PostMapping(value="view_edit_hotel_room_category_form")
    public ModelAndView view_edit_hotel_room_category_form(@ModelAttribute("HTL_ROOM_CAT") Udn_Room_Category_Obj roomCategoryObj,  BindingResult result) {
    	ModelAndView mapView =view_hotel_room_category_list(roomCategoryObj.getHotelId(),null,null);
    	mapView.addObject("ROOM_CAT_ACT", "UPDATE");
    	mapView.addObject("ORG_ROOM_CAT_VO", roomCategoryObj);
    	return mapView;
    	
    }
    @PostMapping(value="edit_edit_hotel_room_category")
    public ModelAndView edit_edit_hotel_room_category(@ModelAttribute("HTL_ROOM_CAT") Udn_Room_Category_Obj roomCategoryObj,  BindingResult result) {
    	
    	try {
			Udn_Hotel_Master_Entity parentEntity = hotelService.find_HotelbyId(roomCategoryObj.getHotelId());
			roomCategoryObj.setParentEntity(parentEntity);
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    	Udn_Room_Category_Entity roomCategoryEntity = new Udn_Room_Category_Entity(roomCategoryObj);
    	hotelService.saveOrUpdate_Hotel_Room_Category(roomCategoryEntity);
    	
    	ModelAndView mapview = new ModelAndView("forward:view_hotel_room_category_list");
    	
    	return mapview;
    	
    }
    
    @PostMapping(value="view_add_hotel_room_category_form")
    public ModelAndView view_add_hotel_room_category_form(@ModelAttribute("HTL_ROOM_CAT") Udn_Room_Category_Obj roomCategoryObj,  BindingResult result) {
    	ModelAndView mapView =view_hotel_room_category_list(roomCategoryObj.getHotelId(),null,null);
    	mapView.addObject("ROOM_CAT_ACT", "ADD");
    	mapView.addObject("ORG_ROOM_CAT_VO", roomCategoryObj);
    	return mapView;
    	
    }
    @PostMapping(value="add_add_hotel_room_category_form")
    public ModelAndView add_add_hotel_room_category_form(@ModelAttribute("HTL_ROOM_CAT") Udn_Room_Category_Obj roomCategoryObj,  BindingResult result) {
    	ModelAndView mapview = new ModelAndView("forward:edit_edit_hotel_room_category");
    	return mapview;
    	/*ModelAndView mapView =view_hotel_room_category_list(roomCategoryObj.getHotelId(),null,null);
    	mapView.addObject("ROOM_CAT_ACT", "ADD");
    	mapView.addObject("ORG_ROOM_CAT_VO", roomCategoryObj);
    	return mapView;
    	*/
    	
    }
    
    @PostMapping(value="view_delete_hotel")
    public ModelAndView view_delete_hotel(@RequestParam("hotelId") int hotelId) {
    	ModelAndView mapview = view_view_hotel_details(hotelId) ;
    	mapview.setViewName("admin/hotel/Admin_Delete_Confirmation_Hotel");
    	return mapview;
    }
    
    @RequestMapping(value="confirmation_page")
    public ModelAndView confirmation_page() {
    	//@RequestParam("confirmation") String confirmation,@RequestParam("ConfirmationFor") String confirmationFor
    	ModelAndView mapview = new ModelAndView() ;
    	mapview.setViewName("admin/AdminConfirmation");
    	return mapview;
    }

    
    @PostMapping(value="delete_delete_hotel")
    public ModelAndView delete_delete_hotel(@RequestParam("hotelId") int hotelId,final RedirectAttributes redirectAttrib) {
    	ModelAndView mapview = view_view_hotel_details(hotelId) ;
    	if(hotelService.checkServiceLineHotelExists(hotelId)) {
    		mapview.addObject("Error", "Service Line Record Exist. Hotel Can not be deleted. Please consider to deactive. ");
    	}
    	else {
    		hotelService.deleteHotel(hotelId);
    		ModelAndView modelView = new ModelAndView();
    		redirectAttrib.addFlashAttribute("confirmation", "<h2> Your Hotel is deleted Successfully !!<h2>");
    		redirectAttrib.addFlashAttribute("ConfirmationFor", "Hotel-Delete");
    		
    		System.out.println("Flash Attributes are set. ");
    		modelView.setViewName("redirect:confirmation_page");
    		return modelView;
    		//mapview.setViewName("forward:search_search_hotel");
    	}
    	return mapview;
    	
    	/*
    	 * ModelAndView modelView = new ModelAndView();
    	modelView.setViewName("redirect:search_search_hotel");
    	return modelView;
    	 */
    }
    
    
    @PostMapping("view_delete_confirmation_room_category")
   	public ModelAndView view_delete_confirmation_room_category(@RequestParam("roomCategoryId") int roomCategoryId) {
    	UserDetailsObj userObj = getLoggedInUser();
    	System.out.println("Delete Confirmation is called munna");
    	ModelAndView modelView = new ModelAndView("admin/hotel/Admin_Delete_Confirmation_RoomCategory");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	try {
    		Udn_Room_Category_Entity roomCategoryEntity= hotelService.find_RoomCategoryById(roomCategoryId);
    		Udn_Room_Category_Obj roomCategoryObj = new Udn_Room_Category_Obj(roomCategoryEntity);
    		modelView.addObject("ROOM_CATEGORY_OBJ", roomCategoryObj);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return modelView;
    }
    
    
    @PostMapping(value="delete_delete_room_category")
    public ModelAndView delete_delete_room_category(@ModelAttribute("ROOM_CAT") Udn_Room_Category_Obj roomCategoryObj, BindingResult result, final RedirectAttributes redirectAttrib ) {
    	ModelAndView mapview = new ModelAndView();

    	UserDetailsObj userObj = getLoggedInUser();
    	mapview.addObject("userName",userObj.getUsername());
		//mapview.addObject("userRole",userObj.getRoles());
		Udn_Room_Category_Entity roomCategoryEntity= hotelService.find_RoomCategoryById(roomCategoryObj.getRoomCategoryId());
		roomCategoryEntity.setDeleted(true);
		hotelService.saveOrUpdate_Hotel_Room_Category(roomCategoryEntity);
		redirectAttrib.addFlashAttribute("Success", "Room Category Record is deleted successfully. ");	
    	//mapview.addObject("ConfirmationFor", "Hotel-Chain-Delete");
		mapview.setViewName("redirect:view_hotel_room_category_list?hotelId="+roomCategoryEntity.getHotelId().getHotelId());
		//mapview.setViewName("redirect:view_search_hotel_chain_form"); 
    	
    	return mapview;
    }
    /********************************************************************************************************/
 
}
