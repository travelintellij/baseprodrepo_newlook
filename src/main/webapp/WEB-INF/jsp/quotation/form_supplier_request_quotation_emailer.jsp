<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../menu/MenuBuilder.jsp" />
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>form_supplier_request_quotation_emailer</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
</head>
<style>
        body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            background-attachment: fixed;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0.5; /* Adjust the opacity value as needed (0.0 to 1.0) */
            z-index: -1;
        }
</style>
<body>
    <form:form name="reqQuotationEmailForm" id="reqQuotationEmailForm" action="send_send_email_req_quote_supplier"
        style="display:inline;" modelAttribute="EMAIL_QUOTE_OBJ">
    <div class="form_supplier_request_quotation_emailer container">
        <div align="center"><b>
                <font color="green"> ${Success} </font>
                <font color="red"> ${Error}</font>
            </b></div>
        <div class="form_supplier_request_quotation_emailer_wrapper bs">
            <h1 style="font-size: 25px;margin-bottom:10px;color:#32cd32  ;">Request Quotation</h1>
            <div class="form_supplier_request_quotation_emailer_wrapper_data">
                <div class="form_supplier_request_quotation_emailer_wrapper_dline">
                    <div class="form_supplier_request_quotation_emailer_wrapper_dl1">
                        <label for="" class="lb">Lead Reference</label>
                        <p style="color:gray">${EMAIL_QUOTE_OBJ.leadReferenceNumber }</p>
                    </div>
                    <div class="form_supplier_request_quotation_emailer_wrapper_dl1">
                        <label for="" class="lb">Client Name</label>
                        <p style="color:gray">${LEAD_OBJ.contactName }</p>
                    </div>
                    <div class="form_supplier_request_quotation_emailer_wrapper_dl1">
                        <label for="" class="lb">Supplier Name</label>
                        <p style="color:gray">${EMAIL_QUOTE_OBJ.supplierName }</p>
                    </div>
                </div>
            </div>
            <form:hidden path="leadReferenceNumber" />
            <form:hidden path="leadId" />
            <form:hidden path="supplierId" />
        </div>
        <div class="form_supplier_request_quotation_e bs">
            <i class="fa-solid fa-envelope fa-xl" style="color:#32cd32  "></i>
            <div class="form_supplier_request_quotation_e_wr_d">
                <div class="form_supplier_request_quotation_e_w">
                    <label for="" class="lb">To : </label> <br>
                <input type="text" name="emailToList" !important;"
                    value="${EMAIL_QUOTE_OBJ.emailToList}" />
                <font color="red">
                    <form:errors path="emailToList" cssClass="error" />
                </font>
                </div>
                <div class="form_supplier_request_quotation_e_w">
                    <label for="" class="lb">Cc : </label> <br>
                <input type="text" name="emailCcList" !important;"
                    value="${EMAIL_QUOTE_OBJ.emailCcList}" />
                <font color="red">
                    <form:errors path="emailCcList" cssClass="error" />
                </font>
                </div>
                <div class="form_supplier_request_quotation_e_w">
                    <label for="" class="lb">Subject : </label> <br>
                <input type="text" name="emailSubject" !important;"
                    value="${EMAIL_QUOTE_OBJ.emailSubject}" />
                </div>
            </div>
            <div class="form_supplier_request_quotation_e_wr_d">
                <div class="form_supplier_request_quotation_e_m">
                    <label for="" class="lb">Massage: </label> <br>
                    <p>Request Content - Please verify service details before requesting from supplier.</p>
                </div>
            </div>
            <p class="bc-clr" style="color:black;font-weight:bold;margin:10px 0">Check and Modify content <span>(As you may be requesting multiple suppliers for multiple
                    request against one lead)</span> </p>
            <div class="form_supplier_request_quotation_e_wr_d">
                <form:textarea path="emailMessage" rows="7" cols="150" maxlength="1450" />
            </div>
            <div class="due_today_task_data_btns">
            <input type="submit" name="emailRequestQuote" value="Send Quote Request" />
            <a href="view_supplier_contacts_listing?supplierId=${EMAIL_QUOTE_OBJ.supplierId }&leadId=${EMAIL_QUOTE_OBJ.leadId }">Cancel</a>
            </div>
        </div>
    </div>
    </form:form>
</body>

</html>