<!DOCTYPE html>
<html lang="en">
    <jsp:include page="../menu/MenuBuilder.jsp" />
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>viewEditQuotationDetails</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
    <script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
</head>
<style>
  body::before {
            content: "";
            background-image: url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);
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



    <form:form modelAttribute="QTN_OBJ" action="edit_edit_lead_quotation">
    
    <input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
    	<form:hidden path = "quotationId" id="quotationId" />
	<form:hidden path = "version" id="version" />
    <div class="viewEditQuotationDetails">
        <div class="viewEditQuotationDetails_wrapper">
            <div class="viewEditQuotationDetails_wrapper_data">
                <div class="viewEditQuotationDetails_wrapper_data_line">
                    <div class="viewEditQuotationDetails_wrapper_dl1">
                        <label for="" class="lb">Quotation Id</label>
                        <p>${QTN_OBJ.quotationId}</p>
                    </div>
                    <div class="viewEditQuotationDetails_wrapper_dl1">
                        <label for="" class="lb">Version Id</label>
                        <p>${QTN_OBJ.version}</p>
                    </div>
                    <div class="viewEditQuotationDetails_wrapper_dl1">
                        <label for="" class="lb">Quotation Header</label>
                        <form:input path="quotationName"  />
                    </div>
                    <div class="viewEditQuotationDetails_wrapper_dl1">
                        <label for="" class="lb">Quotation Status</label>
                        <p>123</p>
                    </div>
                </div>
                <h1 class="lb" style="text-align: start;">Services to be included</h1>
                <div class="viewEditQuotationDetails_wrapper_data_line_sr">
                    <div class="q_sr">
                        <font color="red">
                            <form:errors path="tourPackage" cssClass="error" />
                        </font>
                        <label for="">package</label>      
                    <form:checkbox path="tourPackage" name="tourPackage" />
                    </div>
                    <div class="q_sr">
                            <font color="red">
                                <form:errors path="flight" cssClass="error" />
                            </font>
                         <label for="">flight</label>      
                    <form:checkbox path="flight" name="flight" />
                    </div>
                    <div class="q_sr">
                        <form:errors path="hotel" cssClass="error" />
                          <label for="">hotal</label>      
                    <form:checkbox path="hotel" name="hotel" />
                    </div>
                    <div class="q_sr">
                        <font color="red">
                            <form:errors path="transfers" cssClass="error" />
                        </font>
                           <label for="">transfers</label>      
                    <form:checkbox path="transfers" name="transfers" />
                    </div>
                    <div class="q_sr">
                            <font color="red">
                                <form:errors path="sightseeing" cssClass="error" />
                            </font>
                           <label for="">signtseeing</label>      
                    <form:checkbox path="sightseeing" name="sightseeing" />
                    </div>
                    <div class="q_sr">
                        <font color="red">
                            <form:errors path="visa" cssClass="error" />
                        </font>
                          <label for="">visa</label>      
                        <form:checkbox path="visa" name="visa" />
                    </div>
                    <div class="q_sr">
                        <font color="red">
                            <form:errors path="insurance" cssClass="error" />
                        </font>
                           <label for="">insurance</label>      
                    <form:checkbox path="insurance" name="insurance" />
                    </div>
                    <div class="q_sr">
                        <font color="red">
                            <form:errors path="cruise" cssClass="error" />
                        </font>
                        <label for="">cruise</label>
                        <form:checkbox path="cruise" name="cruise" />
                    </div>
                    <div class="q_sr">
                            <font color="red">
                                <form:errors path="others" cssClass="error" />
                            </font>
                         <label for="">others</label>    
                    <form:checkbox path="others" name="others" />
                    </div>
                </div>
                <div class="due_today_task_data_btns">
                    <input type="submit" id="createquotation" name="createquotation" value="Update Quotation Skeleton" />
                    <a href="view_lead_quotations_list?leadId=${QTN_OBJ.leadEntity.leadId}">Cancel</a>
                </div>
            </div>
        </div>
    </div>
    </form:form>
</body>
</html>