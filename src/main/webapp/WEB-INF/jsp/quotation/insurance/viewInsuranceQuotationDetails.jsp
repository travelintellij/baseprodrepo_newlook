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
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
    <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
</head>

<style>
  body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/in_qu.jpg);
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
        <jsp:include page="../leadDetailsOpenNavView.jsp" />
        </div>
    </div>
    </form:form>
    <!-- ############# quick lead view ends here################## -->
</div>

<div class="afd">
<jsp:include page="../_quotationServicesMenu.jsp" />
</div>
	

    <div class="viewInsuranceQuotationDetails">
        <div class="viewInsuranceQuotationD_wrapper">
            <div class="viewInsuranceQuotationD_wr_data">
                <div class="viewInsuranceQuotationD_wr_data_line">
                    <label for="" class="lb">Quotation</label>
                    <p>${QTN_OBJ.quotationId}</p>
                </div>
                <div class="viewInsuranceQuotationD_wr_data_line">
                    <label for="" class="lb"> Version Id</label>
                    <p>${QTN_OBJ.version}</p>
                </div>
            </div>
        </div>
    </div>

    <!-- ################# service Actions ############ -->


	

		<c:if test="${INS_ACTION ne 'ADD'}">
					<div class="sa-q">
        <h1>Service Actions</h1>
        <div class="due_today_task_data_btnss">
            <c:if test="${QTN_OBJ.converted ne true }">
		  				<li><a href="form_view_add_insurance_quotation?leadId=${LEAD_OBJ.leadId }&quotationId=${QTN_OBJ.quotationId}"><input type="button"  value="Add Insurance" /></a></li>
		  			</c:if>
		  			<c:if test="${QTN_OBJ.converted eq true }">
						<li><a><input type="button"  value="Add Insurance" /></a></li>		  			
		  			</c:if>
        </div>
    </div>
		</c:if>
	
	
	
	
	
 	<div class="float-child-right">
    <div class="blue">
		<c:if test="${INS_ACTION ne 'ADD'}">
		<table style="width:10%;">
		
			
		</table>
		</c:if>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<tr><td>
		<c:if test="${INS_ACTION eq 'ADD'}">
			<jsp:include page="form_view_add_manual_insurance_quotation.jsp" />
		</c:if>
		
		<c:forEach items="${QTN_OBJ.insuranceVoList}" var="insuranceQtnObj">
			<c:choose>
				<c:when test="${insuranceQtnObj.manualInsuranceQuotationId eq MANUAL_INS.manualInsuranceQuotationId  && INS_ACTION eq 'EDIT' }">
					<jsp:include page="form_view_edit_manual_insurance_quotation.jsp" />
				</c:when>
				<c:when test="${insuranceQtnObj.manualInsuranceQuotationId eq MANUAL_INS.manualInsuranceQuotationId  && INS_ACTION eq 'DELETE' }">
					<jsp:include page="form_view_delete_manual_insurance_quotation.jsp" />
				</c:when>
				<c:otherwise>
					
				<br>
				<br>
				<br>
				<br>
					  <div class="in_mu_add container">
        <div class="in_mu_add_wrp">
            <h1 style="font-size:25px;margin:10px 0;color:#32cd32 ">Id- ${insuranceQtnObj.manualInsuranceQuotationId}</h1>
            <div class="in_mu_add_wrp_d bc-clr">
                <div class="in_mu_add_wrp_l">
                    <label for="" class="lb">Contry Name </label>
                    <p>${insuranceQtnObj.countryName }</p>
                </div>
                <div class="in_mu_add_wrp_l">
                    <label for="" class="lb">Insurance Name</label>
                    <p>${insuranceQtnObj.insuranceName}</p>
                </div>
                <div class="in_mu_add_wrp_l">
                    <label for="" class="lb">Start Date</label>
                    <p><fmt:formatDate value="${insuranceQtnObj.coverageStartDate}" pattern="dd-MM-yyyy" /></p>
                </div>
                <div class="in_mu_add_wrp_l">
                    <label for="" class="lb">End Date</label>
                    <p><fmt:formatDate value="${insuranceQtnObj.coverageEndDate}" pattern="dd-MM-yyyy" /></p>
                </div>
            </div>
            <div class="in_mu_add_wrp_d bc-clr">
                <div class="in_mu_add_wrp_l">
                    <label for="" class="lb">Insurance Provider</label>
                    <p>${insuranceQtnObj.insuranceProviderName}</p>
                </div>
                <div class="in_mu_add_wrp_l">
                    <label for="" class="lb">Coverage Amount</label>
                    <p>${insuranceQtnObj.coverageAmount }</p>
                </div>
                <div class="in_mu_add_wrp_l">
                    <label for="" class="lb">Coverage Currency</label>
                    <p>${insuranceQtnObj.coverageCurrency}</p>
                </div>
                <div class="in_mu_add_wrp_l">
                    <label for="" class="lb">Adults</label>
                    <p>${insuranceQtnObj.adults}</p>
                </div>
            </div>
            <div class="in_mu_add_wrp_d bc-clr">
                <div class="in_mu_add_wrp_l">
                    <label for="" class="lb">Children</label>
                    <p>${insuranceQtnObj.children}</p>
                </div>
                <div class="in_mu_add_wrp_l">
                    <label for="" class="lb">Infants</label>
                    <p>${insuranceQtnObj.infant}</p>
                </div>
                <div class="in_mu_add_wrp_l">
                    <label for="" class="lb">Insurance type name</label>
                    <p>${insuranceQtnObj.insuranceTypeName}</p>
                </div>
                <div class="in_mu_add_wrp_l">
                    <label for="" class="lb">Premium Cost</label>
                    <p>${insuranceQtnObj.premiumCost}</p>
                </div>
            </div>
            <div class="in_mu_add_wrp_d bc-clr">
                <div class="in_mu_add_wrp_l">
                    <label for="" class="lb">Mark up</label>
                    <p>${insuranceQtnObj.premiumMarkup}</p>
                </div>
                <div class="in_mu_add_wrp_l">
                    <label for="" class="lb">Display Order</label>
                    <p>${insuranceQtnObj.displayOrder}</p>
                </div>
            </div>
            <div class="in_mu_add_wrp_d bc-clr">
                <div class="in_mu_add_wrp_l" style="width:100%">
                    <label for="" class="lb">Remarks</label>
                    <p>${insuranceQtnObj.remarks }</p>
                </div>
            </div>
            <div class="due_today_task_data_btnss">
            <c:if test="${QTN_OBJ.converted ne true }">
                <a
                    href="form_view_edit_manual_insurance_quotation?manualInsuranceQuotationId=${insuranceQtnObj.manualInsuranceQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                        type="button" style="background-color: #32cd32;" value="Edit Insurance" /></a>
                <a
                    href="form_view_delete_manual_insurance_quotation?manualInsuranceQuotationId=${insuranceQtnObj.manualInsuranceQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                        type="button" style="background-color:red;" value="Delete Insurance" /></a>
            </c:if>
            <c:if test="${QTN_OBJ.converted eq true }">
                <a><input type="button" style="background-color:lightgray;" value="Edit Insurance" /></a>
                <a><input type="button" style="background-color:lightgray;" value="Delete Insurance" /></a>
            
            </c:if>
            </div>
        </div>
    </div>
			</c:otherwise>
			</c:choose>
		</c:forEach>

   	</div>
   	</div>
	
	

</body>
</html>