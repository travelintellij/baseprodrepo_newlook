package com.udanchoo.intranet.controller.quotation;

import com.udanchoo.intranet.model.quotation.ReactQuotationIdObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.view.RedirectView;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@Controller
@RestController

public class QuotationIdAndLeadIdController {
    @Autowired
    private ReactQuotationIdObj reactQuotationIdObj;


    @PostMapping("/storeIds")
    public RedirectView storeIds(@RequestParam String leadId, @RequestParam String quotationId) {
        reactQuotationIdObj.setLeadId(leadId);
        reactQuotationIdObj.setQuotationId(quotationId);

        return new RedirectView("http://localhost:5173"); // Redirect to the specified URL
    }

    @GetMapping("/api/getIds")
    @ResponseBody
    public ReactQuotationIdObj getIds() {
        return reactQuotationIdObj;
    }
}
