package com.travelgovernor.test;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tg.api.security.request.AuthenticateRequest;
import com.tg.api.security.response.AuthenticateResponse;

public class TBOApiClient {

	@Autowired
    RestTemplate restTemplate;
	
	private final ObjectMapper objectMapper = new ObjectMapper();

	public void displayTemplate() {
		System.out.println("Rest Template is " + restTemplate);
	}
	
	
	private static void checkWorkingWay() {
		String tboAuthUrl = "http://api.tektravels.com/SharedServices/SharedData.svc/rest/Authenticate";
		RestTemplate restTemplate = new RestTemplate(); 
		
		final MappingJackson2HttpMessageConverter mappingJackson2HttpMessageConverter = new MappingJackson2HttpMessageConverter();
		mappingJackson2HttpMessageConverter.setSupportedMediaTypes(Arrays.asList(MediaType.APPLICATION_JSON, MediaType.APPLICATION_OCTET_STREAM));
		restTemplate.getMessageConverters().add(mappingJackson2HttpMessageConverter);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(new MediaType[] { MediaType.APPLICATION_JSON }));
        // Request to return JSON format
        headers.setContentType(MediaType.APPLICATION_JSON);
	    
        /*
        JSONObject map = new JSONObject();
	    map.put("ClientId", "ApiIntegrationNew");
	    map.put("UserName", "udanchoo");
	    map.put("Password", "mycareer@123");
	    map.put("EndUserIp", "125.63.104.53");
	    //map.put("TokenId", "42a56865-a2ba-4cc8-b8b6-248e41ddc076");
	    
	    
	    HttpEntity<String> request = new HttpEntity<String>(map.toString(), headers);
	    */
	    AuthenticateRequest authRequest = new AuthenticateRequest();
	    HttpEntity<AuthenticateRequest> request = new HttpEntity<>(authRequest, headers);
	    
	    
	    AuthenticateResponse authResponse = restTemplate.postForObject(tboAuthUrl, request, AuthenticateResponse.class);
	    //String authResponse = restTemplate.postForObject(tboAuthUrl, request, String.class);
	    System.out.println(authResponse);
	    System.out.println("Hello Sush ");
	}
	
	
	public static void main(String[] args) {
		
		//checkNewWay();
		checkWorkingWay();
		//JsonNode root = objectMapper.readTree(personResultAsJsonStr);
		/*
		 // Set the request factory. 
	    // IMPORTANT: This section I had to add for POST request. Not needed for GET
	    restTemplate.setRequestFactory(new HttpComponentsClientHttpRequestFactory());
	    // Add converters
	    // Note I use the Jackson Converter, I removed the http form converter 
	    // because it is not needed when posting String, used for multipart forms.
	    restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
		
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(new MediaType[] { MediaType.APPLICATION_JSON }));
        // Request to return JSON format
        headers.setContentType(MediaType.APPLICATION_JSON);
        
	    AuthenticateRequest authRequest = new AuthenticateRequest();
	    HttpEntity<AuthenticateRequest> requestBody = new HttpEntity<>(authRequest, headers);
	      
	    
	    
	    MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
	    map.add("ClientId", "ApiIntegrationNew");
	    map.add("UserName", "udanchoo");
	    map.add("Password", "mycareer@123");
	    map.add("EndUserIp", "125.63.104.53");
	    

	    HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);

		AuthenticateResponse response = restTemplate.postForObject("http://api.tektravels.com/SharedServices/SharedData.svc/rest/Authenticate", request,AuthenticateResponse.class);
		System.out.println(response);
		*/
 
        

	}
	
	private static void checkNewWay() {
		RestTemplate restTemplate = new RestTemplate();
		String url = "http://api.tektravels.com/SharedServices/SharedData.svc/rest/Authenticate";
		 

		    // create headers
		    HttpHeaders headers = new HttpHeaders();
		    // set `content-type` header
		    headers.setContentType(MediaType.APPLICATION_JSON);
		    // set `accept` header
		    headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));

		    // create a map for post parameters
		    Map<String, Object> map = new HashMap<>();
		    map.put("ClientId", "ApiIntegrationNew");
		    map.put("UserName", "udanchoo");
		    map.put("Password", "mycareer@123");
		    map.put("EndUserIp", "125.63.104.53");

		    // build the request
		    HttpEntity<Map<String, Object>> entity = new HttpEntity<>(map, headers);


			
		    /*String jsonResponse = "{\"Status\":1,\"TokenId\":\"606a021d-8042-46c0-a22c-afc6ed41d2e0\",\"Error\":{\"ErrorCode\":0,\"ErrorMessage\":\"\"},\"Member\":{\"FirstName\":\"SUSHIL\",\"LastName\":\"CHUGH\",\"Email\":\"test@gmail.com\",\"MemberId\":51643,\"AgencyId\":50713,\"LoginName\":\"udanchoo\",\"LoginDetails\":\"Login Success at#@  8:47:24 PM #@ IPAddress: 182.68.108.20\",\"isPrimaryAgent\":false}}";
		    ObjectMapper mapper = new ObjectMapper();
		    try {
				AuthenticateResponse response = mapper.readValue(jsonResponse, AuthenticateResponse.class);
				System.out.println(response);
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
	}

}
