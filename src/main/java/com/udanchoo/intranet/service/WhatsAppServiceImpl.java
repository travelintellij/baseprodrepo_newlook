package com.udanchoo.intranet.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class WhatsAppServiceImpl {

    @Autowired
    private RestTemplate restTemplate;

    @Value("${whatsapp.api.url}")
    private String whatsappApiUrl;

    @Value("${whatsapp.api.key}")
    private String apiKey;

    @Value("${whatsapp.notify.active:false}")
    private boolean whatsappActive;

    public boolean sendTemplateMessage(String mobile, String wid, Map<Integer, String> params) {

        // 1. Global switch check
        if (!whatsappActive) {
            System.out.println("WhatsApp disabled via config");
            return false;
        }

        // 2. Basic validation
        if (mobile == null || mobile.trim().isEmpty()) {
            System.out.println("Mobile is null/empty");
            return false;
        }

        if (wid == null || wid.trim().isEmpty()) {
            System.out.println("Template ID (wid) is null/empty");
            return false;
        }

        try {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            // IMPORTANT: adjust this if your API expects Bearer token
            headers.set("Authorization", "Basic " + apiKey);

            Map<String, Object> body = new HashMap<>();
            body.put("country_code", "91");
            body.put("mobile", formatMobile(mobile));
            body.put("wid", wid);
            body.put("type", "template");

            // Template variables
            if (params != null && !params.isEmpty()) {
                Map<String, String> bodyValues = new HashMap<>();

                for (Map.Entry<Integer, String> entry : params.entrySet()) {
                    if (entry.getValue() != null) {
                        bodyValues.put(String.valueOf(entry.getKey()), entry.getValue());
                    }
                }

                body.put("bodyValues", bodyValues);
            }

            HttpEntity<Map<String, Object>> entity = new HttpEntity<>(body, headers);

            System.out.println("WhatsApp Request: " + body);

            String response = restTemplate.postForObject(
                    whatsappApiUrl,
                    entity,
                    String.class
            );

            System.out.println("WhatsApp Response: " + response);

            // safer success check
            return response != null &&
                    (response.toLowerCase().contains("success")
                            || response.toLowerCase().contains("sent")
                            || response.toLowerCase().contains("\"status\":true"));

        } catch (Exception e) {
            System.err.println("WhatsApp Error: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Ensures valid 91XXXXXXXXXX format
     */
    private String formatMobile(String mobile) {

        if (mobile == null) {
            throw new IllegalArgumentException("Mobile cannot be null");
        }

        mobile = mobile.trim().replaceAll("[^0-9]", "");

        // remove 91 if already present
        if (mobile.startsWith("91") && mobile.length() == 12) {
            mobile = mobile.substring(2);
        }

        if (mobile.length() != 10) {
            throw new IllegalArgumentException("Invalid mobile number: " + mobile);
        }

        return mobile;   // ✅ ONLY 10 DIGITS
    }
}