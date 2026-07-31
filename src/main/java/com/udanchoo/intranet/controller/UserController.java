package com.udanchoo.intranet.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.udanchoo.intranet.entity.RoleEntity;
import com.udanchoo.intranet.entity.UdnTeam;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.ClientObj;
import com.udanchoo.intranet.model.SearchUserObj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.service.DocumentService;
import com.udanchoo.intranet.entity.Document;
import org.springframework.core.io.ByteArrayResource;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.util.UploadFileResponse;


@Controller
public class UserController {

	/*
    @Autowired
    public UCILoginDAO userdao;

    @RequestMapping("/getusersinfo")
    public List<UCIUser> customerInformation() {
        List<UCIUser> listUsers = userdao.isData(); 
        return listUsers;
    }
    */
	@Autowired
	private DocumentService documentService;
	
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
    @Qualifier("userValidator")
    private Validator validator;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
     
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
  
	 @RequestMapping("createNewUser")
	  	public ModelAndView adminCreateNewUser(@ModelAttribute("USER_OBJ") @Valid UserDetailsObj userDetailsObj, BindingResult result, ModelMap model) {
	      	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	      	String username;
	      	if (principal instanceof UserDetails) {
	      	   username = ((UserDetails)principal).getUsername();
	      	} else {
	      	   username = principal.toString();
	      	}
	      	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
	      	ModelAndView mapview = new ModelAndView("welcome");
	    	//mapview.addObject("userRole", userObj.getRoles());
	    	mapview.addObject("userName", userObj.getUsername());
		      mapview.addObject("EMP_TYPE_MAP",UdanChooConstants.EMP_TYPE);
		      mapview.addObject("EMP_SHIFT_MAP",UdanChooConstants.EMP_SHIFT);
		      mapview.addObject("MARITAL_STATUS_MAP",UdanChooConstants.MARITAL_STATUS);
		      mapview.addObject("GENDER_MAP",UdanChooConstants.GENDER);
		      mapview.addObject("ACTIVE_MAP",UdanChooConstants.ACTIVE);

	    	
	      	mapview.setViewName("admin/user/AdminCreateNewUser");
	      	return mapview;
	  	}
    
	  @PostMapping("create_create_Admin_User")
	  	public ModelAndView create_create_Admin_User(@ModelAttribute("USER_OBJ") @Valid UserDetailsObj userDetailsObj, BindingResult result, ModelMap model) {
	      	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	      	String username;
	      	if (principal instanceof UserDetails) {
	      	   username = ((UserDetails)principal).getUsername();
	      	} else {
	      	   username = principal.toString();
	      	}
	      	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
	      	ModelAndView mapview = new ModelAndView();
	    	//mapview.addObject("userRole", userObj.getRoles());
	    	mapview.addObject("userName", userObj.getUsername());
	    	validator.validate(userDetailsObj, result);
	    	Optional<UdnTeam> userExist =userDetailsService.findUserByUserName(userDetailsObj.getUsername()); 
	        if(userExist.isPresent()) {
	        	result.rejectValue("username", "user.duplication.login");
	        }
	    	if(result.hasErrors()) {
	    		mapview.addObject("userName", userObj.getUsername());
			      mapview.addObject("EMP_TYPE_MAP",UdanChooConstants.EMP_TYPE);
			      mapview.addObject("EMP_SHIFT_MAP",UdanChooConstants.EMP_SHIFT);
			      mapview.addObject("MARITAL_STATUS_MAP",UdanChooConstants.MARITAL_STATUS);
			      mapview.addObject("GENDER_MAP",UdanChooConstants.GENDER);
			      mapview.addObject("ACTIVE_MAP",UdanChooConstants.ACTIVE);
			      mapview.setViewName("admin/user/AdminCreateNewUser");
	    	}
	    	else {
	    		//userDetailsObj.setPassword(passwordEncoder.encode(userDetailsObj.getPassword()));
	    		
	    		userDetailsObj.setPassword(passwordEncoder.encode(userDetailsObj.getPassword()));
	    		UdnTeam udnEntity = new UdnTeam(userDetailsObj);
	    		try {
	    			userDetailsService.createOrUpdateUser(udnEntity);
	    			userDetailsObj.setUserId(udnEntity.getUserId());
	    			mapview.addObject("userobj",userDetailsObj);
		    		mapview.addObject("message","Success");
		    		mapview.setViewName("redirect:view_view_Admin_User?userId="+userDetailsObj.getUserId());
	    		} catch (Exception e) {
	    			mapview.addObject("Error", "Error: Adding New User. Please contact Administrator !!! " );
	    			mapview.setViewName("forward:createNewUser");
	    			e.printStackTrace();
	    		}
	    	}
	    		System.out.println(userDetailsObj);
	    		return mapview;
	  	}
	  
	  @PostMapping("edit_edit_Admin_User")
	  public ModelAndView edit_edit_Admin_User(@ModelAttribute("USER_OBJ") @Valid UserDetailsObj userDetailsObj, BindingResult result, ModelMap model) {
		  ModelAndView mapview = new ModelAndView(); 
		  validator.validate(userDetailsObj, result);
		  UdnTeam orgUserEntity = userDetailsService.findUserByID(userDetailsObj.getUserId());

		  if(result.hasErrors()) {
	    		System.out.println("Errors are" + result);
		  	      mapview.addObject("EMP_TYPE_MAP",UdanChooConstants.EMP_TYPE);
			      mapview.addObject("EMP_SHIFT_MAP",UdanChooConstants.EMP_SHIFT);
			      mapview.addObject("MARITAL_STATUS_MAP",UdanChooConstants.MARITAL_STATUS);
			      mapview.addObject("GENDER_MAP",UdanChooConstants.GENDER);
			      mapview.addObject("ACTIVE_MAP",UdanChooConstants.ACTIVE);
			      userDetailsObj.setRoles(orgUserEntity.getRoles());
	    		  mapview.setViewName("admin/user/AdminEditUser");
	    	}
	    	else {
	    		
	    		if(!userDetailsObj.getPassword().equals(orgUserEntity.getPassword())) {
	    			userDetailsObj.setPassword(passwordEncoder.encode(userDetailsObj.getPassword().trim()));
	    		}
	    		orgUserEntity.updateUserEntityFromVoExcludingRoles(userDetailsObj);
	    		//Set<RoleEntity> existingTargetRoles = orgUserEntity.getRoles().stream().filter(role -> role.getRoleTarget().equalsIgnoreCase("PRIV"))
	              //      .collect(Collectors.toSet());
	    		
	    		Optional <RoleEntity> existingPrivRoleOpt = orgUserEntity.getRoles().stream().filter(role -> role.getRoleTarget().equalsIgnoreCase("PRIV"))
	                    .findFirst();
	    		
	    		if(existingPrivRoleOpt.isPresent()) {
	    			RoleEntity existingPrivRole = existingPrivRoleOpt.get();
	    			if(existingPrivRole.getRoleId()!=userDetailsObj.getRoleId()) {
	    				RoleEntity newPrivRole = userDetailsService.findRoleById(userDetailsObj.getRoleId());
	    				orgUserEntity.getRoles().remove(existingPrivRole);
	    				orgUserEntity.getRoles().add(newPrivRole);
	    			}
	    		}
	    		try {
					userDetailsService.createOrUpdateUser(orgUserEntity);
				} catch (RecordNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	    		/*if(existingTargetRoles.size()>1) {
	    			System.out.println("Invalid Role Mapping Existing for User Role  PRIV, please get this corrected. ");
	    		}else {
	    			RoleEntity orgRole = existingTargetRoles.
	    		}*/
	    		
	    		mapview.setViewName("redirect:view_view_Admin_User?userId="+userDetailsObj.getUserId());
	    		//mapview = create_create_Admin_User(userDetailsObj, result, model) ;
	    	}
	    	return mapview;
	  	}
	  
	  
	  //@PostMapping("/admin/view_edit_Admin_User")
	  @RequestMapping(value = "view_edit_Admin_User", method = {RequestMethod.GET,RequestMethod.POST})
	  public ModelAndView view_edit_Admin_User(@ModelAttribute("USER_OBJ") @Valid UserDetailsObj userDetailsObj, BindingResult result) {
		  Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	      String username;
	      if (principal instanceof UserDetails) {
	    	  username = ((UserDetails)principal).getUsername();
	      } else {
	    	  username = principal.toString();
	      }
	      UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
	      
	      ModelAndView mapview = new ModelAndView();
	      //mapview.addObject("userRole", userObj.getRoles());
	      mapview.addObject("userName", userObj.getUsername());
	      UdnTeam userEntity = userDetailsService.findUserByID(userDetailsObj.getUserId());
	      userDetailsObj.updateUserVoFromEntity(userEntity);
	      userDetailsObj.setPasswordConfirm(userDetailsObj.getPassword());
	      //userDetailsObj = new UserDetailsObj(userEntity);
	      //mapview.addObject("userobj",userDetailsObj);
	      mapview.addObject("EMP_TYPE_MAP",UdanChooConstants.EMP_TYPE);
	      mapview.addObject("EMP_SHIFT_MAP",UdanChooConstants.EMP_SHIFT);
	      mapview.addObject("MARITAL_STATUS_MAP",UdanChooConstants.MARITAL_STATUS);
	      mapview.addObject("GENDER_MAP",UdanChooConstants.GENDER);
	      mapview.addObject("ACTIVE_MAP",UdanChooConstants.ACTIVE);
	      mapview.setViewName("admin/user/AdminEditUser");
	      return mapview;
	}
	  
	  
	  @RequestMapping("view_view_Admin_User")
	  public ModelAndView view_view_Admin_User(@RequestParam(defaultValue = "") String message,@RequestParam(defaultValue = "0") int userId) {
		  Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	      String username;
	      if (principal instanceof UserDetails) {
	    	  username = ((UserDetails)principal).getUsername();
	      } else {
	    	  username = principal.toString();
	      }
	      UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
	      ModelAndView mapview = new ModelAndView();
	      //mapview.addObject("userRole", userObj.getRoles());
	      mapview.addObject("userName", userObj.getUsername());
	      if(message.trim().equalsIgnoreCase("Success")) {
	    	mapview.addObject("Success", "User Record is updated successfully !!! " );
	      }
	      
	      UdnTeam userEntity = userDetailsService.findUserByID(userId);
	      UserDetailsObj userDetailsObj = new UserDetailsObj(userEntity);
	      mapview.addObject("userobj",userDetailsObj);
	      mapview.setViewName("admin/user/AdminDisplayUser");
	      return mapview;
	}
	  
	@RequestMapping("view_search_admin_user")
	public ModelAndView view_search_admin_user(@ModelAttribute("SEARCH_USER") SearchUserObj searchUserObj, BindingResult result ) {
		UserDetailsObj userObj = getLoggedInUser();
		
		//BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		//System.out.println("EncryptedPasswordIs:"+passwordEncoder.encode("myuserid"));
		
		ModelAndView modelView = new ModelAndView("admin/user/AdminSearchUser");
		
		/*modelView.addObject("userName", userObj.getUsername());
		modelView.addObject("userId", userObj.getUserId());
		*/
		modelView.addObject("LOGGED_USER", userObj);
		
		
		//modelView.addObject("userRole", userObj.getRoles());
		UserDetailsObj user = getLoggedInUser();
		//TODO Check if some one changes the url manually then it should lead to an error page. not to a server error. 
		List<UserDetailsObj> userDetailsObjList = userDetailsService.findAllUsers();
		modelView.addObject("USERS_LIST", userDetailsObjList);
		return modelView;
	}

	
	  @PostMapping("search_search_filtered_User")
	  public ModelAndView search_search_filtered_User(@ModelAttribute("SEARCH_USER") SearchUserObj searchUserObj, BindingResult result) {
		  UserDetailsObj userObj = getLoggedInUser();
		   
		  List udnEntityList = userDetailsService.search_Filtered_Users(searchUserObj);
		  List userObjList = generateVo(udnEntityList);
		  ModelAndView modelView = new ModelAndView("admin/user/AdminSearchUser");
		  modelView.addObject("userName", userObj.getUsername());
		  modelView.addObject("userId", userObj.getUserId());
		  //modelView.addObject("userRole", userObj.getRoles());
		  modelView.addObject("USERS_LIST", userObjList);
		  return modelView;
	  }
	  
	  private List<UserDetailsObj> generateVo(List udnEntityList) {
		 List<UserDetailsObj> userObjList = new ArrayList<UserDetailsObj>();
		 Iterator itrUserEntityList = udnEntityList.iterator();
		 while(itrUserEntityList.hasNext()){
			 UserDetailsObj userObj = new UserDetailsObj ((UdnTeam)itrUserEntityList.next());
			 userObjList.add(userObj);
		}
		return userObjList; 
	}

	@RequestMapping("view_view_delete_User_confirmation")
	public ModelAndView view_view_delete_User_confirmation(@RequestParam(defaultValue = "0") int userId) {
		ModelAndView modelView = view_view_Admin_User("", userId);
		modelView.setViewName("admin/user/AdminDeleteConfirmationUser");
		return modelView;
	  }

	@PostMapping("delete_delete_admin_user")
	public ModelAndView delete_delete_admin_user(@ModelAttribute("userobj") @Valid UserDetailsObj userDetailsObj, BindingResult result) {
       	boolean isSuccess = false;
       	try {
       		//userDetailsService.deleteUser(userDetailsObj.getUserId());
       		UdnTeam deleteUserEntity = userDetailsService.findUserByID(userDetailsObj.getUserId());
       		deleteUserEntity.setDeleted(true);
       		deleteUserEntity.setActive(false);
       		userDetailsService.createOrUpdateUser(deleteUserEntity);
       		isSuccess=true;
   		} catch (Exception e) {
   			e.printStackTrace();
   			isSuccess = false;
   		}
       	
       	ModelAndView mapview = new ModelAndView("forward:view_search_admin_user");
       	if(isSuccess) {
       		mapview.addObject("Success", "User Record Deleted Successfully. !!");
       	}else {
       		mapview.addObject("Error", "Error: Deleting the User. Please contact administrator!! ");
       	}
       	return mapview;

	  }

	
	@RequestMapping("view_view_crud_user_docs")
	public ModelAndView view_view_crud_user_docs(@RequestParam(defaultValue = "0") int userId,@ModelAttribute("userobj") UserDetailsObj user) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = view_view_Admin_User("", userId);
		modelView.setViewName("admin/user/UserCRUDDocs");
		
		modelView.addObject("userName", userObj.getUsername());
		modelView.addObject("userId", userObj.getUserId());
		//modelView.addObject("userRole", userObj.getRoles());
    	List<Document> docsSet = documentService.getDocuments("USER", String.valueOf(userId));
    	modelView.addObject("DOCS_SET", docsSet);
		return modelView;
	}
	

	private Set<File> listFilesUsingJavaIO(String dir) {
	        return Stream.of(new File(dir).listFiles())
	          .filter(file -> !file.isDirectory())
	          .map(File::getAbsoluteFile)
	          .collect(Collectors.toSet());
	}
	 
	
	@PostMapping("upload_user_docs")
    public ModelAndView upload_user_docs(@RequestParam("file") MultipartFile file,@RequestParam("userId") long userId,final RedirectAttributes redirectAttrib) {
    	ModelAndView mapview = new ModelAndView();
    	try {
            documentService.saveDocument("USER", String.valueOf(userId), file);
        } catch (IOException e) {
            e.printStackTrace();
        }
    	redirectAttrib.addFlashAttribute("Success", "File is Uploaded Successfully ! ");
		mapview.setViewName("redirect:view_view_crud_user_docs?userId=" + userId);
		return mapview;
    
    }
	
	@PostMapping("download_user_doc")
	public ResponseEntity<Resource>  download_user_doc(@RequestParam("userId") int userId,@RequestParam("fileName") String downloadFilePath) throws IOException {
		Document doc = documentService.getDocument(Long.parseLong(downloadFilePath));
		ByteArrayResource resource = new ByteArrayResource(doc.getFileData());
		String contentType = doc.getFileType() != null ? doc.getFileType() : "application/octet-stream";
		return ResponseEntity.ok()
				.contentType(MediaType.parseMediaType(contentType))
    			.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + doc.getFileName() + "\"")
    			.contentLength(doc.getFileData().length)
    			.body(resource);
    }
	
	@PostMapping("delete_user_doc")
	public ModelAndView delete_user_doc(@RequestParam("userId") long userId,@RequestParam("fileName") String deleteFileName) throws IOException {
		ModelAndView mapview = new ModelAndView();
		documentService.deleteDocument(Long.parseLong(deleteFileName));
    	mapview.addObject("Success", "File is deleted Successfully !! ");
    	mapview.setViewName("forward:view_view_crud_user_docs");
    	return mapview;	
	}
}
