package com.udanchoo.intranet.controller;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.ClientObj;
import com.udanchoo.intranet.model.EmailMessageVO;
import com.udanchoo.intranet.model.FileUploaderListVO;
import com.udanchoo.intranet.model.FlightServiceLineVO;
import com.udanchoo.intranet.model.HotelServiceLineVO;
import com.udanchoo.intranet.model.InsuranceServiceLineVO;
import com.udanchoo.intranet.model.LandPackageServiceLineVO;
import com.udanchoo.intranet.model.OtherServiceLineVO;
import com.udanchoo.intranet.model.SightSeeingServiceLineVO;
import com.udanchoo.intranet.model.TransferServiceLineVO;
import com.udanchoo.intranet.model.Udn_Deals_Recorder_Obj;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.model.VisaServiceLineVO;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.DealServiceImpl;
import com.udanchoo.intranet.service.DealServiceLineImpl;
import com.udanchoo.intranet.service.EmailServiceImpl;
import com.udanchoo.intranet.service.FileStorageService;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.util.UploadFileResponse;
import com.udanchoo.intranet.validator.EmailAudienceValidator;


 
@RestController
public class FileController  {

	private static final Logger logger = LoggerFactory.getLogger(FileController.class);

    @Autowired
    private FileStorageService fileStorageService;
    
	@Autowired
	UserDetailsServiceImpl userDetailsService;
	
	@Autowired
	DealServiceLineImpl dealServiceLine;
	
	@Autowired
	DealServiceImpl dealService;
	
	@Autowired
	UdnCommonServicesImpl commonService;
	
	@Autowired
    private EmailServiceImpl emailService;
	
	@Autowired
	ClientServiceImpl clientService;
	
	@Autowired
    private EmailAudienceValidator validator;
     

    //@PostMapping("/workload/uploadFile")
	@PostMapping("/uploadFile")
    public ModelAndView uploadFile(@RequestParam("file") MultipartFile file,@RequestParam("dealConfirmationId") int dealConfirmationId,@RequestParam("uploadType") String uploadType) {
    	ModelAndView mapview = new ModelAndView();
    	Path directoryPath = Paths.get(fileStorageService.getFileStorageLocation() + "\\" + dealConfirmationId +"\\" + uploadType);
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
    	mapview.addObject("Success", "File is Uploaded Successfully ! ");
		
		/*
		try {
			response = download(newPath.toString() + "\\" + fileName);
			String fileDownloadUri = ServletUriComponentsBuilder.fromCurrentContextPath()
	                .path("/downloadFile/")
	                .path(newPath.toString() + "\\" + fileName)
	                .toUriString();
			uploadFileResponse =   new UploadFileResponse(fileName, fileDownloadUri,file.getContentType(), file.getSize());
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		*/
    	
    	//return uploadFileResponse;
		 
		mapview.setViewName("forward:view_upload_file");
		return mapview;
    
    }

    
    
    //@PostMapping(value="/workload/view_emailVouchers")
	@PostMapping(value="/view_emailVouchers")
    public ModelAndView  view_emailVouchers(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("FILE_UPLOADER_VO") FileUploaderListVO fileUploaderListVo) throws IOException {
    	//System.out.println("List of File is " + fileUploaderListVo);
    	UserDetailsObj user = getLoggedInUser();
    	//emailService.sendMailWithAttachment("sushil@udanchoo.com", "Your Deal Vouchers" ,"Please find attached Deal Vouchers", "C:\\uploads\\deals\\9\\Flight\\E-Ticket-DEL-AMD.pdf");
    	ClientObj client = clientService.find_ClientByDealConfirmationId(dealConfirmationId);
    	//fileUploaderListVo.setDealConfirmationId(dealConfirmationId);	
    	ModelAndView mapview = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	
    	EmailMessageVO emailMessageVo = new EmailMessageVO();
    	emailMessageVo.setEmailToList(client.getEmail());
    	emailMessageVo.setEmailSubject("Your Deal UDN-" + dealConfirmationId + " Vouchers Attached. ");
    	emailMessageVo.setEmailMessage("Dear Client \n \nThanks for considering us. \n\nPlease find attached vouchers for your reference. \n\n\n\n\n\nRegards \n" + user.getName() + "\nYour Service Advisor." );
    	mapview.addObject("EMAIL_DETAILS", emailMessageVo);
    	
    	// System.out.println("Adding Files " + Arrays.toString(fileUploaderListVo.getFlightFilesList()));
    	mapview.addObject("FILE_UPLOADER_VO", fileUploaderListVo);
    	    	
    	mapview.setViewName("files/form_fileEmailer");
    	return mapview;
    }
 
    
   @ModelAttribute(value="FILE_UPLOADER_VO")
   public FileUploaderListVO getFileLoader() {
	   return new FileUploaderListVO();
   }
   
   
       
    //@PostMapping(value="/workload/send_emailVouchers")
   @PostMapping(value="/send_emailVouchers")
    public ModelAndView  send_emailVouchers(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("FILE_UPLOADER_VO") FileUploaderListVO fileUploaderListVo,@ModelAttribute("EMAIL_DETAILS") EmailMessageVO emailMessageVo,BindingResult result,Model model)  {
    	
    	ArrayList<String> allAttachedFiles = new ArrayList<String>();
    	//allAttachedFiles.addAll(fileUploaderListVo.getFlight());
    	// allAttachedFiles.addAll(fileUploaderListVo.getSightSeeing());
    	Optional.ofNullable(fileUploaderListVo.getFlight()).ifPresent(allAttachedFiles::addAll);
    	Optional.ofNullable(fileUploaderListVo.getHotel()).ifPresent(allAttachedFiles::addAll);
    	Optional.ofNullable(fileUploaderListVo.getInsurance()).ifPresent(allAttachedFiles::addAll);
    	Optional.ofNullable(fileUploaderListVo.getLandPackage()).ifPresent(allAttachedFiles::addAll);
    	Optional.ofNullable(fileUploaderListVo.getOthers()).ifPresent(allAttachedFiles::addAll);
    	Optional.ofNullable(fileUploaderListVo.getSightSeeing()).ifPresent(allAttachedFiles::addAll);
    	Optional.ofNullable(fileUploaderListVo.getTransfers()).ifPresent(allAttachedFiles::addAll);
    	Optional.ofNullable(fileUploaderListVo.getVisa()).ifPresent(allAttachedFiles::addAll);
    	
    	validator.validate(emailMessageVo, result);
    	ModelAndView mapview = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
    	if(result.hasErrors()) {
    		mapview.setViewName("files/form_fileEmailer");
    		return mapview; 
    	}
    	try {
    		emailService.sendMailWithAttachment(emailMessageVo, allAttachedFiles);
    		mapview.addObject("Success","Your Email is sent Successfully!!! ");
    		mapview.setViewName("forward:view_upload_file");
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    		mapview.addObject("Error","Error Sending Email. Please contact Administrator !! ");
    	}
    	return mapview;
    } 
    
    /************************************* Temp Code **************************************/
    
    //@PostMapping(value="/workload/downloadFile")
   @PostMapping(value="/downloadFile")
    public ResponseEntity<Resource>  downloadFile(@RequestParam("dealConfirmationId") long dealConfirmationId,@RequestParam("fileName") String deleteFilePath,@RequestParam("fileType") String fileType) throws IOException {
		Path downloadFilePath = Paths.get(deleteFilePath);
		Resource resource = new UrlResource(downloadFilePath.toUri());
		String  contentType = "application/octet-stream";
		return ResponseEntity.ok().contentType(MediaType.parseMediaType(contentType))
    	            .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
    	            .body(resource);
    }
    
    @RequestMapping(path = "/download", method = RequestMethod.GET)
    public ResponseEntity<Resource> download(String downloadFile) throws IOException {
    	String  contentType = "application/octet-stream";
    	Path path = Paths.get(downloadFile);
    	Resource resource = new UrlResource(path.toUri());
    	return ResponseEntity.ok().contentType(MediaType.parseMediaType(contentType))
    	            .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
    	            .body(resource);
    }
    

       
    //@PostMapping(value="/workload/deleteFile")
    @PostMapping(value="/deleteFile")
    public ModelAndView deleteFile(@RequestParam("dealConfirmationId") long dealConfirmationId,@RequestParam("fileName") String deleteFileName,@RequestParam("fileType") String fileType) throws IOException {
		ModelAndView mapview = new ModelAndView();
		//Path deleteFilePath = Paths.get(fileStorageService.getFileStorageLocation() + "\\" + dealConfirmationId +"\\" + fileType +"\\" + deleteFileName);
		Path deleteFilePath = Paths.get(deleteFileName);
    	if(Files.exists(deleteFilePath)) {
    		Files.delete(deleteFilePath);
    		mapview.addObject("Success", "File is deleted Successfully ! ");
    	}
		mapview.setViewName("forward:view_upload_file");


    	return mapview;	
    }
    
    /*********************************************************************************************/
    
    @GetMapping("/downloadFile/{fileName:.+}")
    public ResponseEntity<Resource> downloadFile(@PathVariable String fileName, HttpServletRequest request) {
        // Load file as Resource
        
    	Resource resource = fileStorageService.loadFileAsResource(fileName);

        // Try to determine file's content type
        String contentType = null;
        try {
            contentType = request.getServletContext().getMimeType(resource.getFile().getAbsolutePath());
        } catch (IOException ex) {
            logger.info("Could not determine file type.");
        }

        // Fallback to the default content type if type could not be determined
        if(contentType == null) {
            contentType = "application/octet-stream";
        }

        return ResponseEntity.ok()
                .contentType(MediaType.parseMediaType(contentType))
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
    }
    @PostMapping(value="/viewFile")
    public ResponseEntity<Resource>  viewFile(@RequestParam("dealConfirmationId") long dealConfirmationId,@RequestParam("fileName") String fileName,@RequestParam("fileType") String fileType) throws IOException {
        String  contentType = "application/pdf";
        Path path = Paths.get(fileName);
        Resource resource = new UrlResource(path.toUri());
        return ResponseEntity.ok().contentType(MediaType.parseMediaType(contentType))
                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + resource.getFilename() + "\"")
                .body(resource);
    }

    
    //@RequestMapping("/workload/view_upload_file")
    @RequestMapping("/view_upload_file")
   	public ModelAndView view_upload_file(@RequestParam("dealConfirmationId") long dealConfirmationId) {
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	ClientObj clientObj = new ClientObj();


    	String username;
    	if (principal instanceof UserDetails) {
    	   username = ((UserDetails)principal).getUsername();
    	} else {
    	   username = principal.toString();
    	}
     	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
    	
     	ModelAndView mapview = view_workload_createNewWorkLoad(dealConfirmationId,null,null);
     	mapview.setViewName("files/form_fileUploader");
    	mapview.addObject("userName", username);
    	mapview.addObject("Id", userObj.getUserId());
    	//mapview.addObject("userRole", userObj.getRoles());
    	mapview.addObject("dealConfirmationId", dealConfirmationId);
    	mapview.addObject("client", clientObj);
 
    	Path directoryPath = Paths.get(fileStorageService.getFileStorageLocation() + "\\" + dealConfirmationId );
    	
    	if(Files.exists(directoryPath)) {
    		Map<Object, Object> voucherMAP =  Stream.of(new File(directoryPath.toString()).listFiles())
    	          .filter(file -> file.isDirectory()) 
    	          .collect(Collectors.toMap(map -> map.getName(), map -> listFilesUsingJavaIO(map.getPath())));
    		
    		
    		
    		mapview.addObject("VOUCHERS_MAP", voucherMAP);
    	}
    	
    	return mapview;
    }
    
    
    private Set<File> listFilesUsingJavaIO(String dir) {
        return Stream.of(new File(dir).listFiles())
          .filter(file -> !file.isDirectory())
          .map(File::getAbsoluteFile)
          .collect(Collectors.toSet());
    }
    
    
    //TODO Following code is copied from WorkController and must be moved in a service class later.
 	public ModelAndView view_workload_createNewWorkLoad(@RequestParam("dealConfirmationId") long dealConfirmationId,@ModelAttribute("workloadRecorder") Udn_Deals_Recorder_Obj dealRecorder,  BindingResult result) {
    	Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	boolean isAdmin=false;
    	
    	String username;
    	if (principal instanceof UserDetails) {
    	   username = ((UserDetails)principal).getUsername();
    	} else {
    	   username = principal.toString();
    	}
     	UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
     	if(userObj.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
    		isAdmin=true;
    	}
    	
     	ModelAndView mapview = new ModelAndView("workload/form_createWokLoad");
    	mapview.addObject("userName", username);
    	mapview.addObject("Id", userObj.getUserId());
    	//mapview.addObject("userRole", userObj.getRoles());
    	mapview.addObject("dealConfirmationId", dealConfirmationId);
    	
    	ClientObj clientObj = new ClientObj();
    	mapview.addObject("client", clientObj);
    	
    	Udn_Deals_Recorder_Obj dealRecorderObj = null;
		try {
			dealRecorderObj = dealService.findDealEntityById(dealConfirmationId,userObj.getUserId(),isAdmin);
		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	//System.out.println("Deal Record Entity is " + dealEntity);
	
		mapview.addObject("DealObject", dealRecorderObj);

		
		// Following map will contain the list of all possible status of the workload. Where user can take action to change
		//the workload status. 
		Map allWorkloadStatusMap = new HashMap();
		
		//following code will perform the services based on the number of service lines updated in each workload. 
		// for e.g. Flight SL for a particular deal, we have three rows inserted so will just provide the count. 
		//following code TODO  needs improvement to be used along with JPA Stream. 
		Map<String, String> serviceLineCountMap = new HashMap<String, String>();
		for(int i=0;i<dealRecorderObj.getServiceList().length;i++) {
			//System.out.println("Service Name is " + dealRecorderObj.getServiceList()[i]);
			if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_FLT_CODE)) {
				List<FlightServiceLineVO> 	listFlightSLVO = dealServiceLine.find_FLT_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
				serviceLineCountMap.put(UdanChooConstants.WORKLOAD_FLT_CODE, String.valueOf(listFlightSLVO.size()));
				allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_FLT_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_FLT_OBJ));
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_HTL_CODE)) {
				List<HotelServiceLineVO> listHotelSLVO = new ArrayList();
				try {
					listHotelSLVO = dealServiceLine.find_HTL_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
					serviceLineCountMap.put(UdanChooConstants.WORKLOAD_HTL_CODE, String.valueOf(listHotelSLVO.size()));
					allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_HTL_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_HTL_OBJ));
				} catch (RecordNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_INS_CODE)) {
				List<InsuranceServiceLineVO> listInsuranceSLVO = dealServiceLine.find_INS_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
				serviceLineCountMap.put(UdanChooConstants.WORKLOAD_INS_CODE, String.valueOf(listInsuranceSLVO.size()));
				allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_INS_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_INS_OBJ));
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_LDP_CODE)) {
				List<LandPackageServiceLineVO> landPackageSLVO = dealServiceLine.find_LDP_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
				serviceLineCountMap.put(UdanChooConstants.WORKLOAD_LDP_CODE, String.valueOf(landPackageSLVO.size()));
				allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_LDP_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_LDP_OBJ));
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_OTH_CODE)) {
				List<OtherServiceLineVO> otherPackageSLVO = dealServiceLine.find_OTH_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
				serviceLineCountMap.put(UdanChooConstants.WORKLOAD_OTH_CODE, String.valueOf(otherPackageSLVO.size()));
				allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_OTH_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_OTH_OBJ));
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_STS_CODE)) {
				List<SightSeeingServiceLineVO> stsPackageSLVO = null;
				try {
					stsPackageSLVO = dealServiceLine.find_STS_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
				} catch (RecordNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				serviceLineCountMap.put(UdanChooConstants.WORKLOAD_STS_CODE, String.valueOf(stsPackageSLVO.size()));
				allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_STS_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_STS_OBJ));
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_TRN_CODE)) {
				List<TransferServiceLineVO> transferSLVO = null;
				try {
					transferSLVO = dealServiceLine.find_TRN_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
				} catch (RecordNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				serviceLineCountMap.put(UdanChooConstants.WORKLOAD_TRN_CODE, String.valueOf(transferSLVO.size()));
				allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_TRN_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_TRN_OBJ));
			}
			else if(dealRecorderObj.getServiceList()[i].equalsIgnoreCase(UdanChooConstants.WORKLOAD_VSA_CODE)) {
				List<VisaServiceLineVO> visaSLVO = dealServiceLine.find_VSA_ServiceLines_Basedon_DealId(dealConfirmationId,userObj.getUserId(),isAdmin);
				serviceLineCountMap.put(UdanChooConstants.WORKLOAD_VSA_CODE, String.valueOf(visaSLVO.size()));
				allWorkloadStatusMap.put(UdanChooConstants.WORKLOAD_VSA_CODE, commonService.find_All_Status_Deal_Obj(UdanChooConstants.WORKLOAD_VSA_OBJ));
			}
		}
		mapview.addObject("MAP_WL_ALL_STATUS",allWorkloadStatusMap);
		mapview.addObject("serviceLineCountMap",serviceLineCountMap);
    	return mapview;
    }

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
    
    
}