package com.travelgovernor.test.api.flight;

import static org.junit.Assert.assertNotNull;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.Month;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;

import org.junit.Before;
import org.junit.jupiter.api.Test;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.Jackson2ObjectMapperBuilder;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.tg.api.flight.request.object.FlightSearchRequest;
import com.tg.api.flight.request.object.Segments;
import com.tg.api.flight.response.object.FlightSearchResponse;
import com.tg.api.flight.response.object.FlightSearchResponseRoot;

@SpringBootApplication
public class TestSearchFlight{

	private String tokenId="8048724e-6c3f-435c-830c-a60b98253a60";
	private String endUserIp = "192.168.1.2";
	private String flightSearchUrl = "http://api.tektravels.com/BookingEngineService_Air/AirService.svc/rest/Search/";
	private ObjectMapper objectMapper;

	 @Before
	    public void init() {
	     System.out.println("Sushil Init called ");   
		 JavaTimeModule module = new JavaTimeModule();
	        LocalDateTimeDeserializer localDateTimeDeserializer =  new LocalDateTimeDeserializer(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
	        module.addDeserializer(LocalDateTime.class, localDateTimeDeserializer);
	        objectMapper = Jackson2ObjectMapperBuilder.json()
	                .modules(module)
	                .featuresToDisable(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS)
	                .build();
	    }
	
	@Test
	public void testFlightOneWay() throws Exception {
		init();
		FlightSearchRequest flightRequest = new FlightSearchRequest();
		flightRequest.setTokenId(tokenId);
		flightRequest.setEndUserIp(endUserIp);
		flightRequest.setAdultCount(2);
		flightRequest.setChildCount(1);
		flightRequest.setInfantCount(1);
		flightRequest.setDirectFlight(false);
		flightRequest.setOneStopFlight(false);
		flightRequest.setJourneyType(1);
		flightRequest.setPreferredAirlines(null); // array
		
		Segments segment = new Segments();
		segment.setOrigin("DEL");
		segment.setDestination("BOM");
		segment.setFlightCabinClass(1);
		LocalDateTime depTime = LocalDateTime.of(2021,Month.NOVEMBER, 06, 00, 00, 00);
		LocalDateTime arrTime = LocalDateTime.of(2021,Month.NOVEMBER, 06, 00, 00, 00);
		segment.setPreferredDepartureTime(depTime);
		segment.setPreferredArrivalTime(arrTime);
		flightRequest.setSegments(new Segments[] {segment});// array
		
		//flightRequest.setSources(null);// array
		
		RestTemplate restTemplate = getRestTemplate();	
		
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(new MediaType[] { MediaType.APPLICATION_JSON }));
	    // Request to return JSON format
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    
	    HttpEntity<FlightSearchRequest> request = new HttpEntity<>(flightRequest, headers);
	   
	    ObjectMapper Obj = new ObjectMapper();
	    String jsonStr = Obj.writeValueAsString(request);
	    System.out.println("Request is " + jsonStr );
	    
	    //ResponseEntity<String> searchFlightResponse  = restTemplate.exchange(flightSearchUrl, HttpMethod.POST, request, String.class);
	    //String searchFlightResponse = restTemplate.postForObject(flightSearchUrl, request, String.class);
	    
	    //FlightSearchResponseRoot searchFlightResponse = restTemplate.postForObject(flightSearchUrl, request, FlightSearchResponseRoot.class);
	    //String searchFlightResponse = getOneWayStaticFlightSearch();
	    FlightSearchResponseRoot searchFlightResponse = Obj.readValue(new FileInputStream("D:\\UdanChoo\\TravelGovernor\\Technical\\TG-Development-Update\\WIP\\Static-Search-Results\\OWFlightSearchResult_Short.txt"), FlightSearchResponseRoot.class);
	    System.out.println("Trace Response is " + searchFlightResponse);
		
	}
	
	private RestTemplate getRestTemplate() {
		RestTemplate restTemplate = new RestTemplate(); 
		final MappingJackson2HttpMessageConverter mappingJackson2HttpMessageConverter = new MappingJackson2HttpMessageConverter();
		mappingJackson2HttpMessageConverter.setSupportedMediaTypes(Arrays.asList(MediaType.APPLICATION_JSON, MediaType.APPLICATION_OCTET_STREAM));
		restTemplate.getMessageConverters().add(mappingJackson2HttpMessageConverter);
		return restTemplate;	
	}

	public static void main(String[] arg) {
		TestSearchFlight testFlight = new TestSearchFlight();
		try {
			testFlight.testFlightOneWay();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
