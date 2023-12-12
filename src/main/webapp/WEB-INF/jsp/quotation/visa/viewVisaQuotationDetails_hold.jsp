<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>viewVisaQuotationDetails</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
   
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
</head>

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
        <jsp:include page="../leadDetailsOpenNavView.jsp" />
        </div>
    </div>
    </form:form>
    <!-- ############# quick lead view ends here################## -->
</div>


<div class="afd">
<jsp:include page="../_quotationServicesMenu.jsp" />
</div>

    <div class="viewVisaQuotationDetails container">
        <div class="viewVisaQuotationDetails_wrapper">
            <div class="viewVisaQuotationDetails_wrapper_data">
                <div class="viewVisaQuotationDetails_wrapper_data_line">
                    <div class="viewVisaQuotationDetails_wrapper_data_l1">
                        <label for="">Quotation Id</label>
                        <p>${QTN_OBJ.quotationId}</p>
                    </div>
                    <div class="viewVisaQuotationDetails_wrapper_data_l1">
                        <label for="">Version Id</label>
                        <p>${QTN_OBJ.version}</p>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="viewVisaQuotationDetails_wrapper2">
            <c:if test="${VSA_ACTION ne 'SEARCH_ADD' and VSA_ACTION ne 'ADD_VISA' and VSA_ACTION ne 'EDIT_VISA' and VSA_ACTION ne 'DELETE'}">
    <div>
		<font size="4"> <b>Add Visa to quotation.</b></font>

				<div class="due_today_task_data_btns">
		  			<c:if test="${QTN_OBJ.converted ne true }">
		  				<a href="form_view_search_visa_quotation_form?leadId=${LEAD_OBJ.leadId }&quotationId=${QTN_OBJ.quotationId}">Search & Add Visa</a>
		  			</c:if>
		  			<c:if test="${QTN_OBJ.converted eq true }">
		  				<a>Search & Add Visa</a>
		  			</c:if>
				</div>

		</div>
		</c:if>
        </div>
    </div>
</body>

</html>