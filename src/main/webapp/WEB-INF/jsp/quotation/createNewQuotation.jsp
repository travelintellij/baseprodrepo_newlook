<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>createNewQuotation</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
    <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
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

<jsp:include page="viewLeadDetailsSide.jsp" />

    <div class="createNewQuotation_form container">
        <form:form modelAttribute="QTN_OBJ" action="create_create_lead_quotation">

            <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
            <div class="createNewQuotation_form_wrapper bs">
                <div class="createNewQuotation_form_wrapper_data">
                    <div class="createNewQuotation_form_wrapper_data_line">
                        <div class="createNewQuotation_form_wrapper_data_l1">
                            <label for="">Quotation Id</label>
                            <p style="color:#32cd32;font-weight:bold">Auto Generated</p>
                        </div>
                        <div class="createNewQuotation_form_wrapper_data_l1">
                            <label for="">Version Id</label>
                            <p style="color:#32cd32;font-weight:bold">Auto Generated</p>
                        </div>
                        <div class="createNewQuotation_form_wrapper_data_l1">
                            <label for="">Quotation Header</label>
                            <form:input path="quotationName" />
                            <b>
                                <font color="red">
                                    <form:errors path="quotationName" cssClass="error" />
                                </font>
                            </b>
                        </div>
                        <div class="createNewQuotation_form_wrapper_data_l1">
                            <label for="">Quotation status</label>
                            <p>sasas</p>
                        </div>
                    </div>
                    <p style="color: black;text-align: start;">Services to be included</p>
                    <div class="createNewQuotation_wrapper_data_line">
                        <div class="createNewQuotation_ser">
                            <div class="createNewQuotation_ser_box">
                                <span for="">Package</span>
                                <form:checkbox path="tourPackage" name="tourPackage" style="width:18px;height:18px"/>
                            </div>
                            <div class="createNewQuotation_ser_box">
                                <span for="">Flight</span>
                                <form:checkbox path="flight" name="flight" style="width:18px;height:18px"/>
                            </div>
                            <div class="createNewQuotation_ser_box">
                                <span for="">Hotel</span>
                                <form:checkbox path="hotel" name="hotel" style="width:18px;height:18px"/><span class="checkmark">
                            </div>
                            <div class="createNewQuotation_ser_box">
                                <span for="">Transfers</span>
                                <form:checkbox path="transfers" name="transfers" style="width:18px;height:18px"/>
                            </div>
                            <div class="createNewQuotation_ser_box">
                                <span for="">Sightseeing</span>
                                <form:checkbox path="sightseeing" name="sightseeing" style="width:18px;height:18px"/>
                            </div>
                            <div class="createNewQuotation_ser_box">
                                <span for="">Visa</span>
                                <form:checkbox path="visa" name="visa" style="width:18px;height:18px"/><span class="checkmark">
                            </div>
                            <div class="createNewQuotation_ser_box">
                                <span for="">Insurance</span>
                                <form:checkbox path="insurance" name="insurance" style="width:18px;height:18px"/>
                            </div>
                            <div class="createNewQuotation_ser_box">
                                <span for="">Cruise</span>
                                <form:checkbox path="cruise" name="cruise" style="width:18px;height:18px"/>
                            </div>
                            <div class="createNewQuotation_ser_box">
                                <span for="">Others</span>
                                <form:checkbox path="others" name="others" style="width:18px;height:18px"/>
                            </div>
                        </div>
                    </div>
                    <p style="margin-top: 10px;color:#FB8500">( Please select all applicable services for this quotation. )</p>
                    <div class="due_today_task_data_btns">
                        <input type="submit" id="createquotation"  name="createquotation" value="Create Quotation Skeleton" />  
				         <a href="view_lead_quotations_list?leadId=${QTN_OBJ.leadEntity.leadId}">Cancel</a>
                    </div>
                </div>
            </div>
        </form:form>
    </div>

    </div>
</body>

</html>