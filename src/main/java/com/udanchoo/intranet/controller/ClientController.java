package com.udanchoo.intranet.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
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

import java.io.ByteArrayOutputStream;
import java.util.HashSet;
import java.util.Set;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.springframework.http.HttpStatus;
import com.udanchoo.intranet.model.ExportClientFilterObj;

import com.udanchoo.intranet.entity.Document;
import com.udanchoo.intranet.entity.UdnClientEntity;
import com.udanchoo.intranet.entity.Udn_Destinations_Entity;
import com.udanchoo.intranet.exception.RecordNotFoundException;
import com.udanchoo.intranet.model.ClientObj;
import com.udanchoo.intranet.model.SearchClientObj;
import com.udanchoo.intranet.model.Tag;
import com.udanchoo.intranet.model.UserDetailsObj;
import com.udanchoo.intranet.service.ClientServiceImpl;
import com.udanchoo.intranet.service.DocumentService;
import com.udanchoo.intranet.service.UdnCommonServicesImpl;
import com.udanchoo.intranet.service.UserDetailsServiceImpl;
import com.udanchoo.intranet.util.UdanChooConstants;
import com.udanchoo.intranet.validator.ClientValidator;

@Controller
public class ClientController {

	@Autowired
	private DocumentService documentService;

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
			username = ((UserDetails) principal).getUsername();
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
			username = ((UserDetails) principal).getUsername();
		} else {
			username = principal.toString();
		}
		UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
		ModelAndView mapview = new ModelAndView("admin/client/AddNewClient");
		mapview.addObject("userName", username);
		mapview.addObject("Id", userObj.getUserId());
		// mapview.addObject("userRole", userObj.getRoles());

		return mapview;
	}

	@PostMapping(value = "create_create_admin_client")
	public ModelAndView create_create_admin_client(@ModelAttribute("CLIENT_OBJ") @Valid ClientObj clientObj,
			BindingResult result, ModelMap model) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		modelView.addObject("userName", userObj.getUsername());
		// modelView.addObject("userRole",userObj.getRoles());
		modelView.setViewName("admin/client/AddNewClient");
		clientValidator.validate(clientObj, result);
		if (result.hasErrors()) {
			System.out.println("error is " + result);
			return modelView;
		} else {
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
			modelView.setViewName("redirect:view_view_admin_client?clientId=" + clientObj.getClientId());
		}

		return modelView;
	}

	@RequestMapping(value = "view_view_admin_client", method = RequestMethod.GET)
	public ModelAndView view_view_admin_client(@RequestParam(defaultValue = "") String message,
			@RequestParam(defaultValue = "0") long clientId) {

		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username;
		if (principal instanceof UserDetails) {
			username = ((UserDetails) principal).getUsername();
		} else {
			username = principal.toString();
		}
		UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
		ModelAndView mapview = new ModelAndView();
		// mapview.addObject("userRole", userObj.getRoles());
		mapview.addObject("userName", userObj.getUsername());
		if (message.trim().equalsIgnoreCase("Success")) {
			mapview.addObject("Success", "Client Record is updated successfully !!! ");
		}

		ClientObj clientObj = clientService.find_ClientBy_Id(clientId);

		mapview.addObject("CLIENT_OBJ", clientObj);
		mapview.setViewName("admin/client/ViewClientDetails");
		return mapview;

	}

	@RequestMapping(value = "view_edit_admin_client", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView view_edit_admin_client(@ModelAttribute("CLIENT_OBJ") ClientObj clientObj,
			BindingResult result) {
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String username;
		if (principal instanceof UserDetails) {
			username = ((UserDetails) principal).getUsername();
		} else {
			username = principal.toString();
		}
		UserDetailsObj userObj = (UserDetailsObj) userDetailsService.loadUserByUsername(username);
		ModelAndView mapview = new ModelAndView();
		// mapview.addObject("userRole", userObj.getRoles());
		mapview.addObject("userName", userObj.getUsername());
		clientObj = clientService.find_ClientBy_Id(clientObj.getClientId());
		mapview.addObject("CLIENT_OBJ", clientObj);
		mapview.setViewName("admin/client/EditClientDetails");
		return mapview;
	}

	@PostMapping("edit_edit_admin_client")
	public ModelAndView edit_edit_admin_client(@ModelAttribute("CLIENT_OBJ") ClientObj clientObj, BindingResult result,
			ModelMap model) {
		ModelAndView mapview = new ModelAndView();
		clientValidator.validate(clientObj, result);
		if (result.hasErrors()) {
			mapview.setViewName("admin/client/EditClientDetails");
		} else {
			mapview = create_create_admin_client(clientObj, result, model);
		}

		return mapview;
	}

	@RequestMapping("view_form_admin_search_client")
	public ModelAndView view_form_admin_search_client(@RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "3") int pageSize, @RequestParam(defaultValue = "UpdatedAt") String sortBy,
			@ModelAttribute("SEARCH_CLIENTS") SearchClientObj searchClientObj, BindingResult result,
			HttpServletRequest request) {
		pageSize = UdanChooConstants.DEFAULT_PAGE_SIZE;
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView("admin/client/ViewSearchClient");
		modelView.addObject("userName", userObj.getUsername());
		modelView.addObject("Id", userObj.getUserId());

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
		if (request != null && request.getSession() != null) {
			modelView.addObject("LAST_EXPORT_DATE", request.getSession().getAttribute("LAST_CLIENT_EXPORT_DATE"));
			modelView.addObject("LAST_EXPORT_PURPOSE", request.getSession().getAttribute("LAST_CLIENT_EXPORT_PURPOSE"));
		}
		return modelView;
	}

	private List<ClientObj> generateClientObj(Page<UdnClientEntity> pagedResult) {
		List<ClientObj> clientVoList = new ArrayList<ClientObj>();
		List<UdnClientEntity> clientEntityList = pagedResult.getContent();

		Iterator<UdnClientEntity> itrClientEntity = clientEntityList.iterator();
		while (itrClientEntity.hasNext()) {
			UdnClientEntity clientEntity = (UdnClientEntity) itrClientEntity.next();
			ClientObj clientObj;
			try {
				clientObj = new ClientObj(clientEntity);
				if (clientObj.getCityId() != null && clientObj.getCityId() != 0) {
					Udn_Destinations_Entity dest = commonService.findDestinationById(clientObj.getCityId());
					if (dest != null) {
						clientObj.setCityName(dest.getCityName());
					}
				}
				if (clientObj.getCountryId() != 0) {
					Udn_Destinations_Entity countryDest = commonService.findDestinationById(clientObj.getCountryId());
					if (countryDest != null) {
						clientObj.setCountryName(
								countryDest.getCountryName() != null && !countryDest.getCountryName().trim().isEmpty()
										? countryDest.getCountryName()
										: countryDest.getCityName());
					}
				}
				clientVoList.add(clientObj);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return clientVoList;
	}

	@RequestMapping("search_search_filtered_clients")
	public ModelAndView search_search_filtered_clients(@RequestParam(defaultValue = "0") int page,
			@RequestParam(defaultValue = "3") int pageSize, @RequestParam(defaultValue = "UpdatedAt") String sortBy,
			@ModelAttribute("SEARCH_CLIENTS") SearchClientObj searchClientObj, BindingResult result,
			HttpServletRequest request) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = new ModelAndView();
		modelView.setViewName("admin/client/ViewSearchClient");
		Page<UdnClientEntity> clientPageResult = clientService.find_all_clients(page,
				UdanChooConstants.DEFAULT_PAGE_SIZE, sortBy, searchClientObj);
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
		if (request != null && request.getSession() != null) {
			modelView.addObject("LAST_EXPORT_DATE", request.getSession().getAttribute("LAST_CLIENT_EXPORT_DATE"));
			modelView.addObject("LAST_EXPORT_PURPOSE", request.getSession().getAttribute("LAST_CLIENT_EXPORT_PURPOSE"));
		}

		return modelView;
	}

	@RequestMapping("view_view_delete_client_confirmation")
	public ModelAndView view_view_delete_client_confirmation(@RequestParam(defaultValue = "0") long clientId,
			@ModelAttribute("CLIENT_OBJ") @Valid ClientObj clientObj) {
		ModelAndView modelView = view_view_admin_client("", clientId);
		modelView.setViewName("admin/client/DeleteConfirmationClient");
		return modelView;
	}

	@PostMapping("delete_delete_admin_client")
	public ModelAndView delete_delete_admin_client(@ModelAttribute("CLIENT_OBJ") @Valid ClientObj clientObj,
			final RedirectAttributes redirectAttrib) {
		boolean isSuccess = false;
		try {
			if (clientService.deleteClient(clientObj.getClientId())) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			isSuccess = false;
		}

		ModelAndView mapview = new ModelAndView();
		if (isSuccess) {
			redirectAttrib.addFlashAttribute("Success", "Client Record Deleted Successfully. !!");
			mapview.setViewName("redirect:view_form_admin_search_client");
		} else {
			// mapview.addObject("Error", "Error: Deleting the User. Please contact
			// administrator!! ");
			redirectAttrib.addFlashAttribute("Error",
					"Error: Deleting the User. Please ensure all dependennt items are deleted and try again else contact administrator!! ");
			mapview.setViewName("redirect:view_view_admin_client?clientId=" + clientObj.getClientId());
		}
		return mapview;

	}

	@RequestMapping("view_view_crud_client_docs")
	public ModelAndView view_view_crud_client_docs(@RequestParam(defaultValue = "0") long clientId,
			@ModelAttribute("CLIENT_OBJ") @Valid ClientObj clientObj) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView modelView = view_view_admin_client("", clientId);
		modelView.setViewName("admin/client/ClientCRUDDocs");

		modelView.addObject("userName", userObj.getUsername());
		modelView.addObject("Id", userObj.getUserId());
		// modelView.addObject("userRole", userObj.getRoles());
		List<Document> docsSet = documentService.getDocuments("CLIENT", String.valueOf(clientId));
		modelView.addObject("DOCS_SET", docsSet);
		return modelView;
	}

	@PostMapping("upload_client_docs")
	public ModelAndView upload_client_docs(@RequestParam("file") MultipartFile file,
			@RequestParam("clientId") long clientId, final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = new ModelAndView();
		try {
			documentService.saveDocument("CLIENT", String.valueOf(clientId), file);
		} catch (IOException e) {
			e.printStackTrace();
		}
		redirectAttrib.addFlashAttribute("Success", "File is Uploaded Successfully ! ");
		mapview.setViewName("redirect:view_view_crud_client_docs?clientId=" + clientId);
		return mapview;
	}

	@PostMapping("download_client_doc")
	public ResponseEntity<Resource> download_client_doc(@RequestParam("clientId") long clientId,
			@RequestParam("fileName") String fileName) throws IOException {
		Document doc = documentService.getDocument(Long.parseLong(fileName));
		ByteArrayResource resource = new ByteArrayResource(doc.getFileData());
		String contentType = doc.getFileType() != null ? doc.getFileType() : "application/octet-stream";
		return ResponseEntity.ok()
				.contentType(MediaType.parseMediaType(contentType))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + doc.getFileName() + "\"")
				.contentLength(doc.getFileData().length)
				.body(resource);
	}

	@PostMapping("view_client_doc")
	public ResponseEntity<Resource> view_client_doc(@RequestParam("clientId") long clientId,
			@RequestParam("fileName") String fileName) throws IOException {
		Document doc = documentService.getDocument(Long.parseLong(fileName));
		ByteArrayResource resource = new ByteArrayResource(doc.getFileData());
		String contentType = doc.getFileType() != null ? doc.getFileType() : "application/octet-stream";
		return ResponseEntity.ok()
				.contentType(MediaType.parseMediaType(contentType))
				.header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + doc.getFileName() + "\"")
				.contentLength(doc.getFileData().length)
				.body(resource);
	}

	@PostMapping("delete_client_doc")
	public ModelAndView delete_client_doc(@RequestParam("clientId") long clientId,
			@RequestParam("fileName") String deleteFileName) throws IOException {
		ModelAndView mapview = new ModelAndView();
		documentService.deleteDocument(Long.parseLong(deleteFileName));
		mapview.addObject("Success", "File is deleted Successfully !! ");
		mapview.setViewName("forward:view_view_crud_client_docs");
		return mapview;
	}

	/*
	 * private ModelAndView fetchClientDetails(long clientId) {
	 * UserDetailsObj userObj = getLoggedInUser();
	 * ModelAndView displayClientView = new ModelAndView();
	 * displayClientView.setViewName("admin/AdminViewClientDetails");
	 * UdnClientEntity clientEntity = null;
	 * try {
	 * clientEntity = clientService.getClientById(clientId);
	 * } catch (RecordNotFoundException e) {
	 * // TODO Auto-generated catch block
	 * e.printStackTrace();
	 * }
	 * ClientObj clientObj = new ClientObj(clientEntity);
	 * clientObj.setCityName(commonService.findDestinationById(clientObj.getCityId()
	 * ).getCityName());
	 * 
	 * displayClientView.addObject("clientId",clientId);
	 * displayClientView.addObject("userName",userObj.getUsername());
	 * displayClientView.addObject("userRole",userObj.getRoles());
	 * displayClientView.addObject("client",clientObj);
	 * 
	 * 
	 * 
	 * return displayClientView;
	 * }
	 */

	@RequestMapping(value = "adminSearchClient", method = RequestMethod.GET)
	public ModelAndView getPages() {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView searchClientView = new ModelAndView("admin/SearchClientDetails");
		searchClientView.addObject("userName", userObj.getUsername());
		// searchClientView.addObject("userRole",userObj.getRoles());
		Tag tag = new Tag();
		searchClientView.addObject("tag", tag);
		return searchClientView;
	}

	@RequestMapping(value = "/getClientList", method = RequestMethod.GET)
	public @ResponseBody List<Tag> getTags(@RequestParam String tagName) {

		return simulateSearchResult(tagName);

	}

	private List<Tag> simulateSearchResult(String tagName) {

		List<Tag> result = new ArrayList<Tag>();

		List<UdnClientEntity> entityList = clientService.findAllClients();

		// iterate a list and filter by tagName
		for (UdnClientEntity entity : entityList) {
			if (entity.getClientName().toLowerCase().contains(tagName.toLowerCase())) {
				Tag tag = new Tag(entity.getClientId(), entity.getClientName());
				result.add(tag);
			}
		}

		return result;
	}

	@PostMapping("adminCreateCustomer")
	public ModelAndView adminCreateCustomer(HttpServletRequest request, @ModelAttribute("tag") Tag tag,
			BindingResult result, ModelMap model) {
		UserDetailsObj userObj = getLoggedInUser();

		ModelAndView mapview = new ModelAndView("redirect:/admin/AdminViewClient");
		mapview.addObject("userName", userObj.getUsername());
		// mapview.addObject("userRole",userObj.getRoles());
		mapview.addObject("clientId", tag.getId());

		return mapview;
	}

	@RequestMapping(value = "adminSearchEditClient", method = RequestMethod.GET)
	public ModelAndView adminSearchEditClient() {

		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView searchClientView = new ModelAndView("admin/SearchEditClientDetails");
		searchClientView.addObject("userName", userObj.getUsername());
		// searchClientView.addObject("userRole",userObj.getRoles());

		Tag tag = new Tag();
		searchClientView.addObject("tag", tag);
		return searchClientView;
	}

	@PostMapping("adminEditCustomer")
	public ModelAndView adminEditCustomer(HttpServletRequest request, @ModelAttribute("tag") Tag tag,
			BindingResult result, ModelMap model) {
		UserDetailsObj userObj = getLoggedInUser();

		ModelAndView mapview = new ModelAndView("/admin/AdminEditClient");
		mapview.addObject("userName", userObj.getUsername());
		// mapview.addObject("userRole",userObj.getRoles());
		mapview.addObject("clientId", tag.getId());

		UdnClientEntity clientEntity;
		try {
			clientEntity = clientService.getClientById(tag.getId());
			if (clientEntity != null) {
				ClientObj clientObj = new ClientObj(clientEntity);
				clientObj.setCityName(commonService.findDestinationById(clientObj.getCityId()).getCityName());

				mapview.addObject("client", clientObj);
			}

		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return mapview;
	}

	@PostMapping(value = "actionAdminUpdateClient")
	public ModelAndView adminUpdateClient(@ModelAttribute("client") @Valid ClientObj clientObj, BindingResult result,
			ModelMap model) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView updateClientView = new ModelAndView("redirect:/admin/AdminViewClient");
		try {
			UdnClientEntity clientEntity = new UdnClientEntity(clientObj);
			/*
			 * UdnClientEntity clientEntity =
			 * clientService.getClientById(clientObj.getClientId());
			 * clientEntity.setEmail(clientObj.getEmail());
			 * clientEntity.setAddress(clientObj.getAddress());
			 * clientEntity.setBankDetails(clientObj.getBankAccountDetails());
			 * clientEntity.setCityId(clientObj.getCityId());
			 * clientEntity.setClientName(clientObj.getClientName());
			 * clientEntity.setCompanyDetails(clientObj.getCompanyName());
			 * clientEntity.setGstDetails(clientObj.getGstNumber());
			 * clientEntity.setMobile(clientObj.getMobile());
			 * clientEntity.setPhone(clientObj.getPhone());
			 * clientEntity.setReferredBy(clientObj.getReferredBy());
			 * clientEntity.setRemarks(clientObj.getRemarks());
			 */
			clientEntity = clientService.createOrUpdateClient(clientEntity);

		} catch (RecordNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		updateClientView.addObject("userName", userObj.getUsername());
		updateClientView.addObject("Id", userObj.getUserId());
		// updateClientView.addObject("userRole", userObj.getRoles());
		updateClientView.addObject("messageDisplay", "Client is Updated Successfully!!!");
		updateClientView.addObject("clientId", clientObj.getClientId());
		return updateClientView;
	}

	@RequestMapping(value = "adminSearchDeleteClient", method = RequestMethod.GET)
	public ModelAndView getClientToDelete() {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView searchClientView = new ModelAndView("admin/DeleteSearchClientDetails");
		searchClientView.addObject("userName", userObj.getUsername());
		// searchClientView.addObject("userRole",userObj.getRoles());
		Tag tag = new Tag();
		searchClientView.addObject("tag", tag);
		return searchClientView;
	}

	@PostMapping("adminViewDeleteClient")
	public ModelAndView adminDeleteClient(HttpServletRequest request, @ModelAttribute("tag") Tag tag,
			BindingResult result, ModelMap model) {
		UserDetailsObj userObj = getLoggedInUser();

		ModelAndView mapview = new ModelAndView();
		// mapview = fetchClientDetails(tag.getId());
		mapview.setViewName("admin/AdminDeleteClientDetails");
		return mapview;
	}

	@PostMapping(value = "actionDeleteClient")
	public ModelAndView adminDeleteClient(@ModelAttribute("client") @Valid ClientObj clientObj, BindingResult result,
			ModelMap model) {
		UserDetailsObj userObj = getLoggedInUser();
		ModelAndView updateClientView = new ModelAndView("admin/AdminMessageDisplay");
		long clientId = clientObj.getClientId();
		if (clientService.deleteClient(clientId)) {
			updateClientView.addObject("messageDisplay", "Client is Deleted Successfully!!!");
		} else {
			updateClientView.addObject("messageDisplay",
					"There are problems delete client because of dependency. Contact IT Team !!!");
		}
		updateClientView.addObject("userName", userObj.getUsername());
		updateClientView.addObject("Id", userObj.getUserId());
		// updateClientView.addObject("userRole", userObj.getRoles());
		updateClientView.addObject("clientId", clientId);
		return updateClientView;
	}

	@ResponseBody
	@RequestMapping("getClientById")
	public ClientObj findClientByID(@RequestParam("clientId") long clientId) {
		ClientObj clientObj = clientService.find_ClientBy_Id(clientId);
		if (clientObj == null) {
			return clientObj;
		}

		return clientObj;
	}

	private boolean hasClientCreatePermission() {
		try {
			UserDetailsObj userObj = getLoggedInUser();
			if (userObj == null)
				return false;
			return userObj.getAuthorities().stream().anyMatch(auth -> {
				String a = auth.getAuthority();
				return "ROLE_ADMIN".equalsIgnoreCase(a) ||
						"ROLE_CLIENT_CREATE".equalsIgnoreCase(a) ||
						"CLIENT_CREATE".equalsIgnoreCase(a);
			});
		} catch (Exception e) {
			return false;
		}
	}

	@RequestMapping(value = "download_client_import_template", method = RequestMethod.GET)
	public ResponseEntity<Resource> download_client_import_template() throws IOException {
		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("Client Import Template");

		CellStyle headerStyle = workbook.createCellStyle();
		Font font = workbook.createFont();
		font.setBold(true);
		headerStyle.setFont(font);

		Row headerRow = sheet.createRow(0);
		String[] headers = { "Client Name", "Mobile Number", "Email", "City", "Reference", "Address", "Remarks" };
		for (int i = 0; i < headers.length; i++) {
			Cell cell = headerRow.createCell(i);
			cell.setCellValue(headers[i]);
			cell.setCellStyle(headerStyle);
			sheet.setColumnWidth(i, 20 * 256);
		}

		Row sampleRow = sheet.createRow(1);
		sampleRow.createCell(0).setCellValue("John Doe");
		sampleRow.createCell(1).setCellValue("9876543210");
		sampleRow.createCell(2).setCellValue("john@example.com");
		sampleRow.createCell(3).setCellValue("Mumbai");
		sampleRow.createCell(4).setCellValue("Direct Lead");
		sampleRow.createCell(5).setCellValue("123 Main Street");
		sampleRow.createCell(6).setCellValue("Sample Import");

		ByteArrayOutputStream out = new ByteArrayOutputStream();
		workbook.write(out);
		workbook.close();

		ByteArrayResource resource = new ByteArrayResource(out.toByteArray());
		return ResponseEntity.ok()
				.contentType(
						MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"Client_Import_Template.xlsx\"")
				.contentLength(out.toByteArray().length)
				.body(resource);
	}

	@PostMapping("import_clients")
	public ModelAndView import_clients(@RequestParam("file") MultipartFile file, HttpServletRequest request,
			final RedirectAttributes redirectAttrib) {
		ModelAndView mapview = new ModelAndView("redirect:view_form_admin_search_client");

		if (!hasClientCreatePermission()) {
			redirectAttrib.addFlashAttribute("Error", "Access Denied: You do not have permission to import clients.");
			return mapview;
		}

		if (file == null || file.isEmpty()) {
			redirectAttrib.addFlashAttribute("Error", "Please select a valid Excel file to import.");
			return mapview;
		}

		String filename = file.getOriginalFilename();
		if (filename == null
				|| (!filename.toLowerCase().endsWith(".xlsx") && !filename.toLowerCase().endsWith(".xls"))) {
			redirectAttrib.addFlashAttribute("Error",
					"Invalid file format. Please upload an Excel file (.xlsx or .xls).");
			return mapview;
		}

		List<Udn_Destinations_Entity> destinationsList = null;
		try {
			destinationsList = commonService.listAllActiveDestinations();
		} catch (Exception e) {
			destinationsList = new ArrayList<>();
		}
		if (destinationsList == null) {
			destinationsList = new ArrayList<>();
		}

		int defaultIndiaCountryId = 0;
		if (destinationsList != null) {
			for (Udn_Destinations_Entity dest : destinationsList) {
				if (dest != null && dest.getCityName() != null && "India".equalsIgnoreCase(dest.getCityName().trim())) {
					defaultIndiaCountryId = dest.getDestinationId();
					break;
				}
			}
			if (defaultIndiaCountryId == 0) {
				for (Udn_Destinations_Entity dest : destinationsList) {
					if (dest != null && ((dest.getCountryName() != null
							&& "India".equalsIgnoreCase(dest.getCountryName().trim())) ||
							(dest.getCountryCode() != null && "IND".equalsIgnoreCase(dest.getCountryCode().trim())))) {
						defaultIndiaCountryId = dest.getDestinationId();
						break;
					}
				}
			}
			if (defaultIndiaCountryId == 0 && !destinationsList.isEmpty()) {
				defaultIndiaCountryId = destinationsList.get(0).getDestinationId();
			}
		}

		int successCount = 0;
		int failureCount = 0;

		Set<Long> batchMobiles = new HashSet<>();
		List<FailedClientRecord> failedRecords = new ArrayList<>();

		try (Workbook workbook = WorkbookFactory.create(file.getInputStream())) {
			if (workbook == null || workbook.getNumberOfSheets() == 0) {
				redirectAttrib.addFlashAttribute("Error", "Uploaded Excel file contains no worksheets.");
				return mapview;
			}

			Sheet sheet = workbook.getSheetAt(0);
			if (sheet == null) {
				redirectAttrib.addFlashAttribute("Error", "Uploaded Excel sheet is invalid.");
				return mapview;
			}

			int totalRows = sheet.getLastRowNum();

			for (int i = 1; i <= totalRows; i++) {
				Row row = sheet.getRow(i);
				if (row == null)
					continue;

				String clientName = getCellValueAsString(row.getCell(0));
				String mobileStr = getCellValueAsString(row.getCell(1));
				String email = getCellValueAsString(row.getCell(2));
				String cityName = getCellValueAsString(row.getCell(3));
				String reference = getCellValueAsString(row.getCell(4));
				String address = getCellValueAsString(row.getCell(5));
				String remarks = getCellValueAsString(row.getCell(6));

				if (clientName.isEmpty() && mobileStr.isEmpty() && email.isEmpty() && cityName.isEmpty()
						&& reference.isEmpty() && address.isEmpty() && remarks.isEmpty()) {
					continue;
				}

				String failureReason = null;
				Long mobileNumber = null;

				if (clientName.isEmpty()) {
					failureReason = "Client Name is mandatory";
				} else {
					mobileNumber = parseMobileNumber(mobileStr);
					if (mobileNumber == null || mobileNumber <= 0) {
						failureReason = "Mobile Number is mandatory or invalid format";
					} else if (batchMobiles.contains(mobileNumber)) {
						failureReason = "Duplicate mobile number in import file (" + mobileNumber + ")";
					} else if (clientService.existsByMobile(mobileNumber)) {
						failureReason = "Mobile number already exists in database (" + mobileNumber + ")";
					}
				}

				if (failureReason != null) {
					failureCount++;
					failedRecords.add(new FailedClientRecord(
							i + 1,
							clientName != null ? clientName : "",
							mobileStr != null ? mobileStr : "",
							email != null ? email : "",
							cityName != null ? cityName : "",
							reference != null ? reference : "",
							failureReason));
				} else {
					UdnClientEntity clientEntity = new UdnClientEntity();
					clientEntity.setClientName(clientName != null ? clientName : "");
					clientEntity.setMobile(mobileNumber != null ? mobileNumber : 0L);
					clientEntity.setEmail(email != null ? email : "");
					clientEntity.setReferredBy(reference != null ? reference : "");
					clientEntity.setAddress(address != null ? address : "");
					clientEntity.setRemarks(remarks != null ? remarks : "");

					if (cityName != null && !cityName.trim().isEmpty() && destinationsList != null) {
						for (Udn_Destinations_Entity dest : destinationsList) {
							if (dest != null && dest.getCityName() != null) {
								if (cityName.trim().equalsIgnoreCase(dest.getCityName().trim())) {
									clientEntity.setCityId(dest.getDestinationId());
									clientEntity.setCountryId(dest.getDestinationId());
									break;
								}
							}
						}
					}
					if (clientEntity.getCountryId() == 0) {
						clientEntity.setCountryId(defaultIndiaCountryId);
					}

					clientEntity.setPhone(0L);
					clientEntity.setCompanyDetails("");
					clientEntity.setGstDetails("");
					clientEntity.setBankDetails("");
					clientEntity.setPassportNumber("");
					clientEntity.setPassportExpiry(null);
					clientEntity.setBirthDate(null);
					clientEntity.setAnniversaryDate(null);
					clientEntity.setHotelPref(0);
					clientEntity.setCostSavvy(0);
					clientEntity.setServiceSavvy(0);
					clientEntity.setFoodPref("");
					clientEntity.setAggressiveness(0);
					clientEntity.setPaymentRating(0);
					clientEntity.setActive(true);

					Date now = new Date();
					clientEntity.setCreatedAt(now);
					clientEntity.setUpdatedAt(now);

					clientService.createOrUpdateClient(clientEntity);
					batchMobiles.add(mobileNumber);
					successCount++;
				}
			}

			if (!failedRecords.isEmpty()) {
				byte[] errorExcel = generateErrorLogExcel(failedRecords);
				request.getSession().setAttribute("CLIENT_IMPORT_ERROR_LOG", errorExcel);
				redirectAttrib.addFlashAttribute("Success",
						"Import Completed: " + successCount + " client(s) imported successfully.");
				redirectAttrib.addFlashAttribute("Error", failureCount + " record(s) failed to import.");
				redirectAttrib.addFlashAttribute("hasErrorLog", true);
			} else {
				request.getSession().removeAttribute("CLIENT_IMPORT_ERROR_LOG");
				redirectAttrib.addFlashAttribute("Success",
						"Successfully imported all " + successCount + " client(s) with zero errors!");
			}

		} catch (Exception e) {
			e.printStackTrace();
			redirectAttrib.addFlashAttribute("Error", "Failed to process Excel file: " + e.getMessage());
		}

		return mapview;
	}

	@RequestMapping(value = "download_client_import_error_log", method = RequestMethod.GET)
	public ResponseEntity<Resource> download_client_import_error_log(HttpServletRequest request) {
		byte[] logData = (byte[]) request.getSession().getAttribute("CLIENT_IMPORT_ERROR_LOG");
		if (logData == null || logData.length == 0) {
			return ResponseEntity.notFound().build();
		}
		ByteArrayResource resource = new ByteArrayResource(logData);
		return ResponseEntity.ok()
				.contentType(
						MediaType.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"Client_Import_Error_Log.xlsx\"")
				.contentLength(logData.length)
				.body(resource);
	}

	private String getCellValueAsString(Cell cell) {
		if (cell == null)
			return "";
		try {
			CellType type = cell.getCellType();
			if (type == CellType.STRING) {
				String str = cell.getStringCellValue();
				return str != null ? str.trim() : "";
			} else if (type == CellType.NUMERIC) {
				if (DateUtil.isCellDateFormatted(cell)) {
					Date d = cell.getDateCellValue();
					return d != null ? d.toString() : "";
				}
				double num = cell.getNumericCellValue();
				long longVal = (long) num;
				if ((double) longVal == num) {
					return String.valueOf(longVal);
				} else {
					return String.valueOf(num);
				}
			} else if (type == CellType.BOOLEAN) {
				return String.valueOf(cell.getBooleanCellValue());
			} else if (type == CellType.FORMULA) {
				try {
					String str = cell.getStringCellValue();
					return str != null ? str.trim() : "";
				} catch (Exception e) {
					try {
						return String.valueOf((long) cell.getNumericCellValue());
					} catch (Exception ex) {
						return "";
					}
				}
			}
		} catch (Exception e) {
			return "";
		}
		return "";
	}

	private Long parseMobileNumber(String raw) {
		if (raw == null || raw.trim().isEmpty())
			return null;
		String cleaned = raw.replaceAll("[^0-9]", "");
		if (cleaned.isEmpty())
			return null;

		// Normalize Indian numbers (+91 prefix when 12 digits, or leading 0 when 11
		// digits)
		if (cleaned.length() == 12 && cleaned.startsWith("91")) {
			cleaned = cleaned.substring(2);
		} else if (cleaned.length() == 11 && cleaned.startsWith("0")) {
			cleaned = cleaned.substring(1);
		}

		if (cleaned.length() < 10 || cleaned.length() > 13) {
			return null;
		}

		try {
			return Long.parseLong(cleaned);
		} catch (NumberFormatException e) {
			return null;
		}
	}

	private byte[] generateErrorLogExcel(List<FailedClientRecord> failedRecords) throws IOException {
		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("Failed Client Imports");

		CellStyle headerStyle = workbook.createCellStyle();
		Font font = workbook.createFont();
		font.setBold(true);
		headerStyle.setFont(font);

		Row headerRow = sheet.createRow(0);
		String[] headers = { "Row No", "Client Name", "Mobile Number", "Email", "City", "Reference", "Failure Reason" };
		for (int i = 0; i < headers.length; i++) {
			Cell cell = headerRow.createCell(i);
			cell.setCellValue(headers[i]);
			cell.setCellStyle(headerStyle);
			sheet.setColumnWidth(i, 20 * 256);
		}

		int rowIdx = 1;
		for (FailedClientRecord record : failedRecords) {
			Row row = sheet.createRow(rowIdx++);
			row.createCell(0).setCellValue(record.rowNo);
			row.createCell(1).setCellValue(record.clientName);
			row.createCell(2).setCellValue(record.mobileStr);
			row.createCell(3).setCellValue(record.email);
			row.createCell(4).setCellValue(record.city);
			row.createCell(5).setCellValue(record.reference);
			row.createCell(6).setCellValue(record.reason);
		}

		ByteArrayOutputStream out = new ByteArrayOutputStream();
		workbook.write(out);
		workbook.close();
		return out.toByteArray();
	}

	private static class FailedClientRecord {
		int rowNo;
		String clientName;
		String mobileStr;
		String email;
		String city;
		String reference;
		String reason;

		FailedClientRecord(int rowNo, String clientName, String mobileStr, String email, String city, String reference,
				String reason) {
			this.rowNo = rowNo;
			this.clientName = clientName;
			this.mobileStr = mobileStr;
			this.email = email;
			this.city = city;
			this.reference = reference;
			this.reason = reason;
		}
	}

	// ============================================================
	// CLIENT EXPORT
	// ============================================================

	@RequestMapping(value = "export_clients", method = { RequestMethod.GET, RequestMethod.POST })
	public ResponseEntity<Resource> export_clients(
			@RequestParam(value = "exportPurpose", defaultValue = "") String exportPurpose,
			@RequestParam(value = "cityId", defaultValue = "0") int cityId,
			@RequestParam(value = "cityName", defaultValue = "") String cityName,
			@RequestParam(value = "dateFilterType", defaultValue = "ALL") String dateFilterType,
			@RequestParam(value = "createdAfterDate", defaultValue = "") String createdAfterDate,
			@RequestParam(value = "startDate", defaultValue = "") String startDate,
			@RequestParam(value = "endDate", defaultValue = "") String endDate,
			@RequestParam(value = "reference", defaultValue = "") String reference,
			HttpServletRequest request) {

		try {
			// Build filter object
			ExportClientFilterObj filter = new ExportClientFilterObj();
			filter.setCityId(cityId);
			filter.setCityName(cityName);
			filter.setDateFilterType(dateFilterType);
			filter.setCreatedAfterDate(createdAfterDate);
			filter.setStartDate(startDate);
			filter.setEndDate(endDate);
			filter.setReference(reference);
			filter.setExportPurpose(exportPurpose);

			// Fetch clients
			List<UdnClientEntity> clients = clientService.exportClients(filter);

			// Build Excel workbook
			XSSFWorkbook workbook = new XSSFWorkbook();
			Sheet sheet = workbook.createSheet("Clients");

			// Header style
			CellStyle headerStyle = workbook.createCellStyle();
			headerStyle.setFillForegroundColor(IndexedColors.DARK_BLUE.getIndex());
			headerStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			headerStyle.setAlignment(HorizontalAlignment.CENTER);
			Font headerFont = workbook.createFont();
			headerFont.setColor(IndexedColors.WHITE.getIndex());
			headerFont.setBold(true);
			headerStyle.setFont(headerFont);

			// Data style
			CellStyle dataStyle = workbook.createCellStyle();
			dataStyle.setAlignment(HorizontalAlignment.LEFT);

			// Header row
			String[] headers = { "Client Name", "Client Mobile number", "Client Email id", "City", "Reference",
					"Address", "Remarks" };
			Row headerRow = sheet.createRow(0);
			for (int i = 0; i < headers.length; i++) {
				Cell cell = headerRow.createCell(i);
				cell.setCellValue(headers[i]);
				cell.setCellStyle(headerStyle);
				sheet.setColumnWidth(i, 6000);
			}

			// Data rows
			int rowNum = 1;
			for (UdnClientEntity client : clients) {
				Row row = sheet.createRow(rowNum++);

				// Client Name
				Cell c0 = row.createCell(0);
				c0.setCellValue(client.getClientName() != null ? client.getClientName() : "");
				c0.setCellStyle(dataStyle);

				// Mobile
				Cell c1 = row.createCell(1);
				c1.setCellValue(client.getMobile() > 0 ? String.valueOf(client.getMobile()) : "");
				c1.setCellStyle(dataStyle);

				// Email
				Cell c2 = row.createCell(2);
				c2.setCellValue(client.getEmail() != null ? client.getEmail() : "");
				c2.setCellStyle(dataStyle);

				// City name lookup
				Cell c3 = row.createCell(3);
				String resolvedCity = "";
				if (client.getCityId() != null && client.getCityId() > 0) {
					try {
						Udn_Destinations_Entity dest = commonService.findDestinationById(client.getCityId());
						if (dest != null && dest.getCityName() != null) {
							resolvedCity = dest.getCityName();
						}
					} catch (Exception ex) {
						// Destination ID not found in database, safe fallback
					}
				}
				c3.setCellValue(resolvedCity);
				c3.setCellStyle(dataStyle);

				// Reference
				Cell c4 = row.createCell(4);
				c4.setCellValue(client.getReferredBy() != null ? client.getReferredBy() : "");
				c4.setCellStyle(dataStyle);

				// Address
				Cell c5 = row.createCell(5);
				c5.setCellValue(client.getAddress() != null ? client.getAddress() : "");
				c5.setCellStyle(dataStyle);

				// Remarks
				Cell c6 = row.createCell(6);
				c6.setCellValue(client.getRemarks() != null ? client.getRemarks() : "");
				c6.setCellStyle(dataStyle);
			}

			// Write to byte array
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			workbook.write(out);
			workbook.close();

			// Store export metadata in session for Last Exported display
			java.text.SimpleDateFormat exportSdf = new java.text.SimpleDateFormat("dd-MMM-yyyy hh:mm a");
			String exportDateStr = exportSdf.format(new Date());
			if (request != null && request.getSession() != null) {
				request.getSession().setAttribute("LAST_CLIENT_EXPORT_DATE", exportDateStr);
				request.getSession().setAttribute("LAST_CLIENT_EXPORT_PURPOSE",
						(exportPurpose != null && !exportPurpose.trim().isEmpty()) ? exportPurpose.trim()
								: "Not Specified");
			}

			// Generate filename
			java.text.SimpleDateFormat fileSdf = new java.text.SimpleDateFormat("yyyyMMdd_HHmmss");
			String fileName = "Clients_Export_" + fileSdf.format(new Date()) + ".xlsx";

			byte[] bytes = out.toByteArray();
			ByteArrayResource resource = new ByteArrayResource(bytes);

			return ResponseEntity.ok()
					.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"")
					.contentType(MediaType
							.parseMediaType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"))
					.contentLength(bytes.length)
					.body(resource);

		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
		}
	}
}
