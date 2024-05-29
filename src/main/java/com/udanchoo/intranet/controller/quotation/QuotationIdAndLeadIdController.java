package com.udanchoo.intranet.controller.quotation;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class QuotationIdAndLeadIdController {

    @Value("${redirect.url}")
    private String redirectUrl;

    @PostMapping("/storeIds")
    public RedirectView storeIds(@RequestParam String leadId, @RequestParam String quotationId) {
        String fragment = "#leadId=" + leadId + "&quotationId=" + quotationId;
        return new RedirectView(redirectUrl + fragment);
    }
}