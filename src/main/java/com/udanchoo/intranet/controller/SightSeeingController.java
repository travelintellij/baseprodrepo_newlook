package com.udanchoo.intranet.controller;

import java.util.List;

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

import com.udanchoo.intranet.entity.Udn_SightSeeing_Master_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.SearchSightSeeingObj;
import com.udanchoo.intranet.model.Udn_SightSeeing_Master_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.SightSeeingServiceImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;




@Controller
public class SightSeeingController {
	
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
	ClientServiceImpl clientService;
	
	@Autowired
	SightSeeingServiceImpl sightSeeingService;
	
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
    
    
    /******************* Following Code deals with Hotel Master Services ************************************/
    @RequestMapping("view_add_sightseeing_form")
   	public ModelAndView view_add_sightseeing_form(@ModelAttribute("sightseeing_obj") @Valid Udn_SightSeeing_Master_Obj sightSeeingObj, BindingResult result ) {
    	
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/sightseeing/Admin_Add_SightSeeing");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	
    	Udn_SightSeeing_Master_Obj  sightSeeingMasterObj = new Udn_SightSeeing_Master_Obj();
    	modelView.addObject("sightseeing_obj", sightSeeingMasterObj);
    	return modelView;
    }
  
    @PostMapping(value="add_add_sightseeing")
    public ModelAndView add_add_sightseeing(@ModelAttribute("hotel_obj") @Valid Udn_SightSeeing_Master_Obj sightSeeingObj, BindingResult result,final RedirectAttributes redirectAttrib ) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView mapview = new ModelAndView();
		mapview.addObject("userName",userObj.getUsername());
		//mapview.addObject("userRole",userObj.getRoles());
		
		if(result.hasErrors()) {
			mapview.addObject("Error", "Error: while adding Sight Seeing !! please contact Administrator !!");	
			mapview.setViewName("admin/sightseeing/Admin_Add_SightSeeing");
      		return mapview; 
    	}
    	else {
    		Udn_SightSeeing_Master_Entity sightSeeingEntity = new Udn_SightSeeing_Master_Entity(sightSeeingObj);
    		sightSeeingService.saveOrUpdate_SightSeeing(sightSeeingEntity);
    		//mapview=view_view_sight_seeing_details(sightSeeingEntity.getSightSeeingId());

    		redirectAttrib.addFlashAttribute("Success", "Your Sight Seeing is updated Successfully !!");
    		mapview.setViewName("redirect:view_view_sight_seeing_details?sightSeeingId="+sightSeeingEntity.getSightSeeingId());
    		// Add code here to add sight seeing in to the database.
			//mapview.addObject("confirmation", "Your Sight Seeing is updated Successfully !!");
    	}
    	return mapview ;
    }
    
    @RequestMapping("view_search_sight_seeing_form")
   	public ModelAndView view_search_sight_seeing_form(@ModelAttribute("search_sight_seeing_obj") Udn_SightSeeing_Master_Obj sightSeeingObj, BindingResult result ) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/sightseeing/form_searchSightSeeing");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
     	return modelView;
    }
    
    @PostMapping(value="search_search_sight_seeing")
    public ModelAndView search_search_sight_seeing(@ModelAttribute("sight_seeing_search_result") SearchSightSeeingObj searchSightSeeingObj) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/sightseeing/form_searchSightSeeing_Result");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	List<Udn_SightSeeing_Master_Obj> filteredSightSeeingList = sightSeeingService.searchSightSeeing(searchSightSeeingObj);
    	modelView.addObject("STS_SEARCH_RESULT", filteredSightSeeingList);
    	return modelView;
    }

    //@PostMapping("view_view_sight_seeing_details")
    @RequestMapping(value = "view_view_sight_seeing_details", method = { RequestMethod.GET, RequestMethod.POST })
    public ModelAndView view_view_sight_seeing_details(@RequestParam("sightSeeingId") long sightSeeingId) {
    	Udn_SightSeeing_Master_Obj sightSeeingMasterObj = null;
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/sightseeing/Admin_View_SightSeeing");
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
    
    //@PostMapping("view_edit_sight_seeing_form")
    @RequestMapping(value = "view_edit_sight_seeing_form", method = { RequestMethod.GET, RequestMethod.POST })
   	public ModelAndView view_edit_hotel_form(@RequestParam("sightSeeingId") int sightSeeingId,@ModelAttribute("sight_seeing_obj") Udn_SightSeeing_Master_Obj sightSeeingMasterObj,  BindingResult result) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/sightseeing/Admin_Edit_SightSeeing");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	

    	try {
    		sightSeeingMasterObj = sightSeeingService.find_SightSeeingById(sightSeeingId);
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}    	
    	modelView.addObject("sightSeeingMasterObj", sightSeeingMasterObj);
    	return modelView;
    }
    
    
    @PostMapping("view_delete_confirmation_sight_seeing")
   	public ModelAndView view_delete_confirmation_sight_seeing(@RequestParam("sightSeeingId") int sightSeeingId) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView("admin/sightseeing/Admin_Delete_Confirmation_SightSeeing");
    	modelView.addObject("userName", userObj.getUsername());
    	modelView.addObject("Id", userObj.getUserId());
    	//modelView.addObject("userRole", userObj.getRoles());
    	try {
    		Udn_SightSeeing_Master_Obj sightSeeingObj= sightSeeingService.find_SightSeeingById(sightSeeingId);
    		modelView.addObject("SIGHT_SEEING_OBJ", sightSeeingObj);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return modelView;
    }

    @PostMapping(value="delete_delete_sight_seeing")
    public ModelAndView delete_delete_sight_seeing(@ModelAttribute("SIGHT_SEEING") Udn_SightSeeing_Master_Obj sightSeeingObj, BindingResult result, final RedirectAttributes redirectAttrib ) {
    	ModelAndView mapview = new ModelAndView();

    	UserDetailsObj userObj = getLoggedInUser();
    	mapview.addObject("userName",userObj.getUsername());
		//mapview.addObject("userRole",userObj.getRoles());
    	Udn_SightSeeing_Master_Entity sightSeeingEntity;
    	ModelAndView modelView = new ModelAndView();
    	modelView.setViewName("redirect:confirmation_page");
    	try {
			sightSeeingEntity = sightSeeingService.find_SightSeeing_Entity_ById(sightSeeingObj.getSightSeeingId());
			sightSeeingEntity.setDeleted(true);
			sightSeeingService.saveOrUpdate_SightSeeing(sightSeeingEntity);
			redirectAttrib.addFlashAttribute("confirmation", "<h2> Sight Seeing Record is deleted successfully. !!<h2>");
			redirectAttrib.addFlashAttribute("ConfirmationFor", "SightSeeing-Delete");
			
    	}
    	catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
    		redirectAttrib.addFlashAttribute("confirmation", "<h2> <font color=\"red\">Error: Error Deleting Sight Seeing. Please ensure no dependency exists else contact administrator.  </font><h2>");
			redirectAttrib.addFlashAttribute("ConfirmationFor", "SightSeeing-Delete");
			e.printStackTrace();
			
		}
		
		
		
		return modelView;
    }
    
    @RequestMapping(value="ss_confirmation_page")
    public ModelAndView ss_confirmation_page() {
    	//@RequestParam("confirmation") String confirmation,@RequestParam("ConfirmationFor") String confirmationFor
    	ModelAndView mapview = new ModelAndView() ;
    	mapview.setViewName("admin/AdminConfirmation");
    	return mapview;
    }
    
    /*
    @PostMapping(value="/admin/edit_edit_sight_seeing")
    public ModelAndView edit_edit_hotel(@ModelAttribute("sight_seeing_obj") @Valid Udn_SightSeeing_Master_Obj sightSeeingObj, BindingResult result ) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView mapview = new ModelAndView();
		mapview.addObject("userName",userObj.getUsername());
		mapview.addObject("userRole",userObj.getRoles());
		
		if(result.hasErrors()) {
			mapview.addObject("Error", "Error: Updating Sight Seeing.");
			mapview.setViewName("admin/Admin_Edit_SightSeeing");
      		return mapview; 
    	}
    	else {
    		Udn_SightSeeing_Master_Entity sightSeeingEntity = new Udn_SightSeeing_Master_Entity(sightSeeingObj);
    		sightSeeingService.saveOrUpdate_SightSeeing(sightSeeingEntity);
    		mapview=view_view_sight_seeing_details(sightSeeingObj.getSightSeeingId());
    		mapview.addObject("confirmation", "<h3 style=\"color:red;\"> Your Sight Seeing is updated Successfully !!<h3>");
    		//mapview.setViewName("redirect:view_view_hotel_details?hotelId="+hotelObj.getHotelId());
    	}
    	return mapview ;
    	
    }
    */
    /********************************************************************************************************/
 
}
