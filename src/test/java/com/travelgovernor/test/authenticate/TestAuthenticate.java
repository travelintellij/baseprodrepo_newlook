package com.travelgovernor.test.authenticate;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.Arrays;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.tg.api.security.request.AuthenticateRequest;
import com.tg.api.security.response.AuthenticateResponse;

@SpringBootApplication
public class TestAuthenticate{

	private String tokenId="e83d7e26-57d9-4b95-8063-594a79c6e725";

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	  
	@Test
	public void authenticate() throws Exception {
		String tboAuthUrl = "http://api.tektravels.com/SharedServices/SharedData.svc/rest/Authenticate";
		RestTemplate restTemplate = new RestTemplate(); 
		final MappingJackson2HttpMessageConverter mappingJackson2HttpMessageConverter = new MappingJackson2HttpMessageConverter();
		mappingJackson2HttpMessageConverter.setSupportedMediaTypes(Arrays.asList(MediaType.APPLICATION_JSON, MediaType.APPLICATION_OCTET_STREAM));
		restTemplate.getMessageConverters().add(mappingJackson2HttpMessageConverter);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(new MediaType[] { MediaType.APPLICATION_JSON }));
        // Request to return JSON format
        headers.setContentType(MediaType.APPLICATION_JSON);
	    
	    AuthenticateRequest authRequest = new AuthenticateRequest();
	    HttpEntity<AuthenticateRequest> request = new HttpEntity<>(authRequest, headers);
	    AuthenticateResponse authResponse = restTemplate.postForObject(tboAuthUrl, request, AuthenticateResponse.class);
	    //String authResponse = restTemplate.postForObject(tboAuthUrl, request, String.class);
	    
	    ObjectMapper Obj = new ObjectMapper();
	    String jsonStr = Obj.writeValueAsString(request);
	    System.out.println("Request is " + jsonStr );
	    System.out.println("************************************************");
	    assertThat(authResponse.getStatus()==1);
	    
	    
	    String jsonStrResponse = Obj.writeValueAsString(authResponse);
	    System.out.println("Response is " + jsonStrResponse);
	    System.out.println("Hello Sush ");
	}
}