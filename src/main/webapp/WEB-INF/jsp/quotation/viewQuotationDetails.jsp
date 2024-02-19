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
    <title>viewQuotationDetails</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
    <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<style>

        body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/viewQuotationDetails.jpg);
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
<body >


<div class="my-ki">
    <!-- ############# quick lead view starts here################## -->
    <form:form modelAttribute="LEAD_OBJ" action="create_create_lead_quotation">
    <div class="sep_quick_lead_view">
        <input type="checkbox" name="" id="" class="ch_quick_lead_view">
        <div class="hamburgur_menu_quick_lead_view">
            <span class="sep_line1"></span>
            <span class="sep_line2"></span>
            <span class="sep_line3"></span>
        </div>
        <h2 style="display:inline-block;font-size:20px;;">Quick lead view</h2>
        <div class="lead_view_sep">
        <jsp:include page="leadDetailsOpenNavView.jsp" />
        </div>
    </div>
    </form:form>
    <!-- ############# quick lead view ends here################## -->
</div>

<div class="afd">
<jsp:include page="_quotationServicesMenu.jsp" />
</div>


<form:form modelAttribute="QTN_OBJ" action="form_view_edit_quotation_details">

	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<form:hidden path = "quotationId" id="quotationId" />
    <div class="viewQuotationDetails container" style="margin-top:10px">
        <div class="viewQuotationDetails_wrapper bs">
        <h1 style="font-size:25px;margin:10px 0;color:#32cd32">	Quotation Summary </h1>
            <div class="viewQuotationDetails_wrapper_data">
                <div class="viewQuotationDetails_wrapper_data_line a">
                    <div class="viewQuotationDetails_wrapper_data_l1">
                        <label for="">Quotation Id</label>
                        <p>${QTN_OBJ.quotationId}</p>
                    </div>
                    <div class="viewQuotationDetails_wrapper_data_l1">
                        <label for="">Version Id</label>
                        <p>${QTN_OBJ.version}</p>
                    </div>
                    <div class="viewQuotationDetails_wrapper_data_l1">
                        <label for="">Quotation Header</label>
                        <p>${QTN_OBJ.quotationName}</p>
                    </div>
                    <div class="viewQuotationDetails_wrapper_data_l1">
                        <label for="">Quotation Status</label>
                        <p>Created</p>
                    </div>
                </div>
                <p class="viewQuotationDetails_wrapper_data_line_ser_hd">Services to be included</p>
                <div class="viewQuotationDetails_wrapper_data_line_ser">
                    <div class="viewQuotationDetails_wrapper_data_ser">
                        <label for="">Package</label>
                        <form:checkbox class="ch_c" path="tourPackage" name="tourPackage" disabled="true" style="width:18px;height:18px"/>
                    </div>
                    <div class="viewQuotationDetails_wrapper_data_ser">
                        <label for="">Flight</label>
                       <form:checkbox class="ch_c" path="flight" name="flight"  disabled="true" style="width:18px;height:18px"/>
                    </div>
                    <div class="viewQuotationDetails_wrapper_data_ser">
                        <label for="">Hotal</label>
                       <form:checkbox class="ch_c" path="hotel" name="hotel" disabled="true" style="width:18px;height:18px"/>
                    </div>
                    <div class="viewQuotationDetails_wrapper_data_ser">
                        <label for="">Transfers</label>
                       <form:checkbox class="ch_c" path="transfers" name="transfers" disabled="true" style="width:18px;height:18px"/>
                    </div>
                    <div class="viewQuotationDetails_wrapper_data_ser">
                        <label for="">Sightseeing</label>
                       <form:checkbox class="ch_c" path="sightseeing" name="sightseeing" disabled="true" style="width:18px;height:18px"/>
                    </div>
                    <div class="viewQuotationDetails_wrapper_data_ser">
                        <label for="">Visa</label>
                        <form:checkbox class="ch_c" path="visa" name="visa" disabled="true" style="width:18px;height:18px"/>
                    </div>
                    <div class="viewQuotationDetails_wrapper_data_ser">
                        <label for="">Insurance</label>
                       <form:checkbox class="ch_c" path="insurance" name="insurance" disabled="true" style="width:18px;height:18px"/>
                    </div>
                    <div class="viewQuotationDetails_wrapper_data_ser">
                        <label for="">Cruise</label>
                      <form:checkbox class="ch_c" path="cruise" name="cruise"  disabled="true" style="width:18px;height:18px"/>
                    </div>
                    <div class="viewQuotationDetails_wrapper_data_ser">
                        <label for="">Others</label>
                        <form:checkbox class="ch_c" path="others" name="others"  disabled="true" style="width:18px;height:18px"/>
                    </div>
                </div>
                <div class="due_today_task_data_btns">
                   <c:if test="${ QTN_OBJ.converted eq true }">
					<input type="button" id="createquotation"   name="createquotation" value="Edit Quotation Skeleton" />
				</c:if>
				<c:if test="${ QTN_OBJ.converted ne true }">
					<input type="submit" id="createquotation"  name="createquotation" value="Edit Quotation Skeleton" />
				</c:if>

					  
				<a href="view_lead_quotations_list?leadId=${QTN_OBJ.leadEntity.leadId}">Cancel</a>
                </div>
            </div>
        </div>
    </div>
        </form:form> 
</body>

</html>