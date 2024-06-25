package com.udanchoo.intranet.controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.udanchoo.intranet.entity.UdnClientEntity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.ClientObj;
import com.udanchoo.intranet.model.SearchClientObj;
import com.udanchoo.intranet.model.Tag;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.FileStorageService;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.util.UploadFileResponse;
import com.udanchoo.intranet.validator.ClientValidator;


@Controller
public class ClientController {

	 @Autowired
	 private FileStorageService fileStorageService;
	    
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
	ClientServiceImpl clientService;
 
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
    private ClientValidator clientValidator;
	
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
    
    @RequestMapping("view_form_admin_new_client")
   	public ModelAndView view_form_admin_new_client(@ModelAttribute("CLIENT_OBJ") @Valid ClientObj clientObj) {
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	String username;
    	if (principal instanceof UserDetails) {
    	   username = ((UserDetails)principal).getUsername();
    	} else {
    	   username = principal.toString();
    	}
     	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
    	ModelAndView mapview = new ModelAndView("admin/client/AddNewClient");
    	mapview.addObject("userName", username);
    	mapview.addObject("Id", userObj.getUserId());
    	//mapview.addObject("userRole", userObj.getRoles());
    	
    	return mapview;
    }
 
    
    
    
    @PostMapping(value="create_create_admin_client")
    public ModelAndView create_create_admin_client(@ModelAttribute("CLIENT_OBJ") @Valid ClientObj clientObj, BindingResult result, ModelMap model) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView modelView = new ModelAndView();
    	modelView.addObject("userName",userObj.getUsername());
    	//modelView.addObject("userRole",userObj.getRoles());
    	modelView.setViewName("admin/client/AddNewClient");
    	clientValidator.validate(clientObj, result);
    	if(result.hasErrors()) {
    		System.out.println("error is " + result);
			return modelView; 
    	}
    	else {
	    	try {
	        	UdnClientEntity clientEntity = new UdnClientEntity(clientObj);
	    		System.out.println(clientEntity);
	        	clientEntity = clientService.createOrUpdateClient(clientEntity);
	        	clientObj.setClientId(clientEntity.getClientId());
	    		modelView.addObject("message", "Success");
	    		
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				modelView.addObject("Error", "Error Creating Client. Please contact administrator !!");
			}
	    	modelView.setViewName("redirect:view_view_admin_client?clientId="+clientObj.getClientId());
    	}
		
		return modelView;
    }
    
    
    
    
    
    @RequestMapping(value = "view_view_admin_client", method = RequestMethod.GET)
    public ModelAndView view_view_admin_client(@RequestParam(defaultValue = "") String message,@RequestParam(defaultValue = "0") long clientId) {
    	
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
	    	mapview.addObject("Success", "Client Record is updated successfully !!! " );
	      }
	      
	      ClientObj clientObj = clientService.find_ClientBy_Id(clientId);
	      
	      mapview.addObject("CLIENT_OBJ",clientObj);
	      mapview.setViewName("admin/client/ViewClientDetails");
	      return mapview;
    	
    }
   
    
    @RequestMapping(value = "view_edit_admin_client", method = {RequestMethod.GET,RequestMethod.POST})
	  public ModelAndView view_edit_admin_client(@ModelAttribute("CLIENT_OBJ") ClientObj clientObj, BindingResult result) {
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
	      clientObj = clientService.find_ClientBy_Id(clientObj.getClientId());
	      mapview.addObject("CLIENT_OBJ",clientObj);
	      mapview.setViewName("admin/client/EditClientDetails");
	      return mapview;
	}
    
    @PostMapping("edit_edit_admin_client")
	  public ModelAndView edit_edit_admin_client(@ModelAttribute("CLIENT_OBJ") ClientObj clientObj, BindingResult result, ModelMap model) {
		  ModelAndView mapview = new ModelAndView(); 
	    	clientValidator.validate(clientObj, result);
	    	if(result.hasErrors()) {
	    		mapview.setViewName("admin/client/EditClientDetails");
	    	}
	    	else {
	    			mapview = create_create_admin_client(clientObj, result, model);
	    	}

	    	return mapview;
	  	}
    
    
    @RequestMapping("view_form_admin_search_client")
    public ModelAndView view_form_admin_search_client(@RequestParam(defaultValue = "0") int page,@RequestParam(defaultValue = "3") int pageSize, @RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("SEARCH_CLIENTS") SearchClientObj searchClientObj, BindingResult result ) {
    	pageSize = UdanChooConstants.DEFAULT_PAGE_SIZE;
    	UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView("admin/client/ViewSearchClient");
		modelView.addObject("userName", userObj.getUsername());
		modelView.addObject("Id", userObj.getUserId());
		//modelView.addObject("userRole", userObj.getRoles());
		UserDetailsObj user = getLoggedInUser();
		//TODO Check if some one changes the url manually then it should lead to an error page. not to a server error. 
		
		//List<UserDetailsObj> userDetailsObjList = userDetailsService.findAllUsers();
		
		Page<UdnClientEntity> pageClientList = clientService.find_all_clients(page, pageSize, sortBy, searchClientObj);
		List<ClientObj> clientObjList = generateClientObj(pageClientList);
		modelView.addObject("CLIENTS_LIST", clientObjList);
		modelView.addObject("maxPages", pageClientList.getTotalPages());
		modelView.addObject("page", page); 
		modelView.addObject("sortBy", sortBy);
		modelView.addObject("clientName", searchClientObj.getClientName());
		modelView.addObject("cityId", searchClientObj.getCityId());
		modelView.addObject("cityName", searchClientObj.getCityName());
		modelView.addObject("email", searchClientObj.getEmail());
		modelView.addObject("active", searchClientObj.isActive());
		return modelView;
	}
    
	private List<ClientObj> generateClientObj(Page<UdnClientEntity> pagedResult) {
		List<ClientObj> clientVoList = new ArrayList<ClientObj>();
		List<UdnClientEntity> clientEntityList = pagedResult.getContent();
		
		Iterator<UdnClientEntity> itrClientEntity = clientEntityList.iterator();
		while(itrClientEntity.hasNext()) {
			UdnClientEntity clientEntity = (UdnClientEntity) itrClientEntity.next();
			ClientObj clientObj;
			try {
				clientObj= new ClientObj(clientEntity);
				clientObj.setCityName(commonService.findDestinationById(clientObj.getCityId()).getCityName());
				clientObj.setCountryName(commonService.findDestinationById(clientObj.getCountryId()).getCityName());
				clientVoList.add(clientObj);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return clientVoList;
	}


	@RequestMapping("search_search_filtered_clients")
	public ModelAndView search_search_filtered_clients(@RequestParam(defaultValue = "0") int page,@RequestParam(defaultValue = "3") int pageSize, @RequestParam(defaultValue = "UpdatedAt") String sortBy,@ModelAttribute("SEARCH_CLIENTS") SearchClientObj searchClientObj, BindingResult result ) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView(); 
		modelView.setViewName("admin/client/ViewSearchClient");
		Page<UdnClientEntity> clientPageResult = clientService.find_all_clients(page, UdanChooConstants.DEFAULT_PAGE_SIZE, sortBy, searchClientObj);
		List<ClientObj> clientListObj = generateClientObj(clientPageResult);
		modelView.addObject("CLIENTS_LIST", clientListObj);
		modelView.addObject("maxPages", clientPageResult.getTotalPages());
		modelView.addObject("page", page); 
		modelView.addObject("sortBy", sortBy);
		modelView.addObject("clientName", searchClientObj.getClientName());
		modelView.addObject("cityId", searchClientObj.getCityId());
		modelView.addObject("cityName", searchClientObj.getCityName());
		modelView.addObject("email", searchClientObj.getEmail());
		modelView.addObject("active", searchClientObj.isActive());
		//modelView.addObject("SEARCH_CLIENTS", searchClientObj);
		
		return modelView;
	 }

	@RequestMapping("view_view_delete_client_confirmation")
	public ModelAndView view_view_delete_client_confirmation(@RequestParam(defaultValue = "0") long clientId,@ModelAttribute("CLIENT_OBJ") @Valid ClientObj clientObj) {
		ModelAndView modelView = view_view_admin_client("",clientId);
		modelView.setViewName("admin/client/DeleteConfirmationClient");
		return modelView;
	  }
	
	
	@PostMapping("delete_delete_admin_client")
	public ModelAndView delete_delete_admin_client(@ModelAttribute("CLIENT_OBJ") @Valid ClientObj clientObj, final RedirectAttributes redirectAttrib) {
       	boolean isSuccess = false;
       	try {
       		if(clientService.deleteClient(clientObj.getClientId())) {
       			isSuccess=true;
       		}
       		else {
       			isSuccess=false;
       		}
   		} catch (Exception e) {
   			e.printStackTrace();
   			isSuccess = false;
   		}
       	
       	ModelAndView mapview = new ModelAndView();
       	if(isSuccess) {
       		redirectAttrib.addFlashAttribute("Success", "Client Record Deleted Successfully. !!");
       		mapview.setViewName("redirect:view_form_admin_search_client");
       	}else {
       		//mapview.addObject("Error", "Error: Deleting the User. Please contact administrator!! ");
       		redirectAttrib.addFlashAttribute("Error", "Error: Deleting the User. Please ensure all dependennt items are deleted and try again else contact administrator!! ");
       		mapview.setViewName("redirect:view_view_admin_client?clientId="+clientObj.getClientId());
       	}
       	return mapview;

	  }

	
	@RequestMapping("view_view_crud_client_docs")
	public ModelAndView view_view_crud_client_docs(@RequestParam(defaultValue = "0") long clientId,@ModelAttribute("CLIENT_OBJ") @Valid ClientObj clientObj) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = view_view_admin_client("",clientId);
		modelView.setViewName("admin/client/ClientCRUDDocs");
		
		modelView.addObject("userName", userObj.getUsername());
		modelView.addObject("Id", userObj.getUserId());
		//modelView.addObject("userRole", userObj.getRoles());
    	Path directoryPath = Paths.get(fileStorageService.getClientStorageLocation() + "\\" + clientId );
    	
    	if(Files.exists(directoryPath)) {
    		Set docsSet = listFilesUsingJavaIO(directoryPath.toString());
    		modelView.addObject("DOCS_SET", docsSet);
    	}
		return modelView;
	}
	
	private Set<File> listFilesUsingJavaIO(String dir) {
	        return Stream.of(new File(dir).listFiles())
	          .filter(file -> !file.isDirectory())
	          .map(File::getAbsoluteFile)
	          .collect(Collectors.toSet());
	    }
	    
	
	@PostMapping("upload_client_docs")
    public ModelAndView upload_client_docs(@RequestParam("file") MultipartFile file,@RequestParam("clientId") long clientId,final RedirectAttributes redirectAttrib) {
    	ModelAndView mapview = new ModelAndView();
    	Path directoryPath = Paths.get(fileStorageService.getClientStorageLocation() + "\\" + clientId );
    	boolean pathExists = Files.exists(directoryPath,new LinkOption[]{ LinkOption.NOFOLLOW_LINKS});
    	UploadFileResponse uploadFileResponse = null;
    	ResponseEntity< Resource> response =null ;
    	Path newPath = null;
    	if(!pathExists) {
    		try {
				newPath = Files.createDirectories(directoryPath);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	}
    	else {
    		newPath=directoryPath;
    	}

    	String fileName = fileStorageService.storeFile(file,newPath);
    	redirectAttrib.addFlashAttribute("Success", "File is Uploaded Successfully ! ");
		mapview.setViewName("redirect:view_view_crud_client_docs?clientId=" + clientId);
		return mapview;
    
    }

	@PostMapping("download_client_doc")
	public ResponseEntity<Resource>  download_client_doc(@RequestParam("clientId") long clientId,@RequestParam("fileName") String downloadFilePath) throws IOException {
		Path downloadPath = Paths.get(downloadFilePath);
		Resource resource = new UrlResource(downloadPath.toUri());
		String  contentType = "application/octet-stream";
		return ResponseEntity.ok().contentType(MediaType.parseMediaType(contentType))
    	            .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
    	            .body(resource);
    }
	
	@PostMapping("view_client_doc")
	public ResponseEntity<Resource>  view_client_doc(@RequestParam("clientId") long clientId,@RequestParam("fileName") String downloadFilePath) throws IOException {
		Path downloadPath = Paths.get(downloadFilePath);
		Resource resource = new UrlResource(downloadPath.toUri());
		//String  contentType = "application/octet-stream";
		String  contentType = determineContentType(resource);
		
		return ResponseEntity.ok().contentType(MediaType.parseMediaType(contentType))
    	            .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + resource.getFilename() + "\"")
    	            .body(resource);
    }
	
	private final ServletContext servletContext;
	 public ClientController(ServletContext servletContext) {
	        this.servletContext = servletContext;
	    }
	private String determineContentType(Resource resource) throws IOException {
	        // Try to determine the content type
	        String contentType = servletContext.getMimeType(resource.getFile().getAbsolutePath());

	        // Fallback to octet-stream if type could not be determined
	        if (contentType == null) {
	            contentType = "application/octet-stream";
	        }

	        return contentType;
	}
	
	@PostMapping("delete_client_doc")
	public ModelAndView delete_client_doc(@RequestParam("clientId") long clientId,@RequestParam("fileName") String deleteFileName) throws IOException {
		ModelAndView mapview = new ModelAndView();
		//Path deleteFilePath = Paths.get(fileStorageService.getFileStorageLocation() + "\\" + dealConfirmationId +"\\" + fileType +"\\" + deleteFileName);
		Path deleteFilePath = Paths.get(deleteFileName);
    	if(Files.exists(deleteFilePath)) {
    		Files.delete(deleteFilePath);
    		mapview.addObject("Success", "File is deleted Successfully !! ");
    	}
    	mapview.setViewName("forward:view_view_crud_client_docs");
    	return mapview;	
	}
	    
   /* private ModelAndView fetchClientDetails(long clientId) {
    	UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView displayClientView = new ModelAndView();
    	displayClientView.setViewName("admin/AdminViewClientDetails");
    	UdnClientEntity clientEntity = null;
		try {
			clientEntity = clientService.getClientById(clientId);
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ClientObj clientObj = new ClientObj(clientEntity);
		clientObj.setCityName(commonService.findDestinationById(clientObj.getCityId()).getCityName());
		 
		displayClientView.addObject("clientId",clientId);
		displayClientView.addObject("userName",userObj.getUsername());
		displayClientView.addObject("userRole",userObj.getRoles());
		displayClientView.addObject("client",clientObj);
		
		
    	
        return displayClientView;
    }
    */
    
	@RequestMapping(value = "adminSearchClient", method = RequestMethod.GET)
	public ModelAndView getPages() {
		UserDetailsObj userObj = getLoggedInUser();
    	ModelAndView searchClientView = new ModelAndView("admin/SearchClientDetails");
    	searchClientView.addObject("userName",userObj.getUsername());
    	//searchClientView.addObject("userRole",userObj.getRoles());
		Tag tag = new Tag();
		searchClientView.addObject("tag", tag);
		return searchClientView;
	}


	@RequestMapping(value = "/getClientList", method = RequestMethod.GET)
	public @ResponseBody
	List<Tag> getTags(@RequestParam String tagName) {

		return simulateSearchResult(tagName);

	}

	private List<Tag> simulateSearchResult(String tagName) {

		List<Tag> result = new ArrayList<Tag>();
		
		
		List <UdnClientEntity> entityList = clientService.findAllClients();
	
		// iterate a list and filter by tagName
		for (UdnClientEntity entity : entityList) {
			if (entity.getClientName().toLowerCase().contains(tagName.toLowerCase())) {
				Tag tag = new Tag(entity.getClientId(),entity.getClientName());
				result.add(tag);
			}
		}

		return result;
	}

	 @PostMapping("adminCreateCustomer")
	  	public ModelAndView adminCreateCustomer(HttpServletRequest request,@ModelAttribute("tag") Tag tag, BindingResult result, ModelMap model) {
		 UserDetailsObj userObj = getLoggedInUser();
		 
		 ModelAndView mapview = new ModelAndView("redirect:/admin/AdminViewClient");
		 mapview.addObject("userName",userObj.getUsername());
		 //mapview.addObject("userRole",userObj.getRoles());
		 mapview.addObject("clientId",tag.getId());
		
		 return mapview;
	 }
	 
	 @RequestMapping(value = "adminSearchEditClient", method = RequestMethod.GET)
		public ModelAndView adminSearchEditClient() {
			
			UserDetailsObj userObj = getLoggedInUser();
	    	ModelAndView searchClientView = new ModelAndView("admin/SearchEditClientDetails");
	    	searchClientView.addObject("userName",userObj.getUsername());
	    	//searchClientView.addObject("userRole",userObj.getRoles());
			
			Tag tag = new Tag();
			searchClientView.addObject("tag", tag);
			return searchClientView;
		}
	 
	 @PostMapping("adminEditCustomer")
	  	public ModelAndView adminEditCustomer(HttpServletRequest request,@ModelAttribute("tag") Tag tag, BindingResult result, ModelMap model) {
		 UserDetailsObj userObj = getLoggedInUser();
		 
		 ModelAndView mapview = new ModelAndView("/admin/AdminEditClient");
		 mapview.addObject("userName",userObj.getUsername());
		 //mapview.addObject("userRole",userObj.getRoles());
		 mapview.addObject("clientId",tag.getId());
		
		 UdnClientEntity clientEntity;
		 try {
			clientEntity = clientService.getClientById(tag.getId());
			 if(clientEntity!=null) {
				 ClientObj clientObj =new ClientObj(clientEntity);
				 clientObj.setCityName(commonService.findDestinationById(clientObj.getCityId()).getCityName());
				 
				 mapview.addObject("client", clientObj);
			 }
			 
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 
		 return mapview;
	 }
	 
	 
	 @PostMapping(value="actionAdminUpdateClient")
	    public ModelAndView adminUpdateClient(@ModelAttribute("client") @Valid ClientObj clientObj, BindingResult result, ModelMap model) {
	    	UserDetailsObj userObj = getLoggedInUser();
	    	ModelAndView updateClientView = new ModelAndView("redirect:/admin/AdminViewClient");
	    	try {
	    		UdnClientEntity clientEntity = new UdnClientEntity(clientObj); 
	    		/*
	    		UdnClientEntity clientEntity = clientService.getClientById(clientObj.getClientId());
	    		clientEntity.setEmail(clientObj.getEmail());
	    		clientEntity.setAddress(clientObj.getAddress());
	    		clientEntity.setBankDetails(clientObj.getBankAccountDetails());
	    		clientEntity.setCityId(clientObj.getCityId());
	    		clientEntity.setClientName(clientObj.getClientName());
	    		clientEntity.setCompanyDetails(clientObj.getCompanyName());
	    		clientEntity.setGstDetails(clientObj.getGstNumber());
	    		clientEntity.setMobile(clientObj.getMobile());
	    		clientEntity.setPhone(clientObj.getPhone());
	    		clientEntity.setReferredBy(clientObj.getReferredBy());
	    		clientEntity.setRemarks(clientObj.getRemarks());
	    		*/
				clientEntity = clientService.createOrUpdateClient(clientEntity);
				
	    	} catch (RecordNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	    	updateClientView.addObject("userName", userObj.getUsername());
	    	updateClientView.addObject("Id", userObj.getUserId());
	    	//updateClientView.addObject("userRole", userObj.getRoles());
	    	updateClientView.addObject("messageDisplay", "Client is Updated Successfully!!!");
	    	updateClientView.addObject("clientId",clientObj.getClientId());
	    	return updateClientView;
	    }
	 
	 
	  
		@RequestMapping(value = "adminSearchDeleteClient", method = RequestMethod.GET)
		public ModelAndView getClientToDelete() {
			UserDetailsObj userObj = getLoggedInUser();
	    	ModelAndView searchClientView = new ModelAndView("admin/DeleteSearchClientDetails");
	    	searchClientView.addObject("userName",userObj.getUsername());
	    	//searchClientView.addObject("userRole",userObj.getRoles());
			Tag tag = new Tag();
			searchClientView.addObject("tag", tag);
			return searchClientView;
		}
		
		@PostMapping("adminViewDeleteClient")
		  	public ModelAndView adminDeleteClient(HttpServletRequest request,@ModelAttribute("tag") Tag tag, BindingResult result, ModelMap model) {
			 UserDetailsObj userObj = getLoggedInUser();
			 
			 ModelAndView mapview = new ModelAndView();
			 //mapview = fetchClientDetails(tag.getId());
			 mapview.setViewName("admin/AdminDeleteClientDetails");
			 return mapview;
		 }
	
		 @PostMapping(value="actionDeleteClient")
		    public ModelAndView adminDeleteClient(@ModelAttribute("client") @Valid ClientObj clientObj, BindingResult result, ModelMap model) {
		    	UserDetailsObj userObj = getLoggedInUser();
		    	ModelAndView updateClientView = new ModelAndView("admin/AdminMessageDisplay");
		    	long clientId = clientObj.getClientId();
		    	if(clientService.deleteClient(clientId)) {
		    		updateClientView.addObject("messageDisplay", "Client is Deleted Successfully!!!");
		    	}
		    	else {
		    		updateClientView.addObject("messageDisplay", "There are problems delete client because of dependency. Contact IT Team !!!");
		    	}
		    	updateClientView.addObject("userName", userObj.getUsername());
		    	updateClientView.addObject("Id", userObj.getUserId());
		    	//updateClientView.addObject("userRole", userObj.getRoles());
		    	updateClientView.addObject("clientId",clientId);
		    	return updateClientView;
		    }
	 

		@ResponseBody
		@RequestMapping("getClientById")
		public ClientObj findClientByID(@RequestParam("clientId") long clientId) {
			ClientObj clientObj= clientService.find_ClientBy_Id(clientId);
			if(clientObj==null) {
				return clientObj;
			}
				 
				return clientObj;
		}
}
