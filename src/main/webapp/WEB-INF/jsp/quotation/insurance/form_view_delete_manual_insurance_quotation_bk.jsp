<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>

<form:form modelAttribute="MANUAL_INS" action="delete_delete_insurance_manual_quotation">
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<form:hidden path = "manualInsuranceQuotationId" />
		<table style="width:100%;  table-layout:fixed;background-color: #DFE0DC; border: 3px solid #000000; border-collapse: collapse" id="deleteInsranceTable" >
					<tr><th style="background-color:blue;" colspan="5"><font size="4"><b>Id-  ${MANUAL_INS.manualInsuranceQuotationId}</b></font></th></tr>
					<tr>
						<th style="background-color:red;"><font size="4"><b>Country Name</b></font></th>
						<th style="background-color:red;"><font size="4"><b>Insurance Name</b></font></th>
						<th style="background-color:red;"><font size="4"><b>Start Date</b></font></th>
						<th style="background-color:red;"><font size="4"><b>End Date</b></font></th>
						<th style="background-color:red;"><font size="4"><b>Insurance Provider</b></font></th>
					</tr>
					<tr>
						<td>${MANUAL_INS.countryName }</td>
						<td>${MANUAL_INS.insuranceName}</td>
						<td><fmt:formatDate value="${MANUAL_INS.coverageStartDate}" pattern="dd-MM-yyyy" /></td>
						<td><fmt:formatDate value="${MANUAL_INS.coverageEndDate}" pattern="dd-MM-yyyy" /></td>
						<td>${MANUAL_INS.insuranceProviderName}</td>
					</tr>
		
					<tr>	
						<th style="background-color:red;"><font size="4"><b>Coverage Amount</b></font></th>
						<th style="background-color:red;"><font size="4"><b>Coverage Currency</b></font></th>
						<th style="background-color:red;" colspan="2"><font size="4"><b>Guest Details</b></font></th>
						<th style="background-color:red;"><font size="4"><b>Insurance Type</b></font></th>
					</tr>
					<tr>
						<td>${MANUAL_INS.coverageAmount }</td>
						<td>${MANUAL_INS.coverageCurrency}</td>
						<td colspan="2">${MANUAL_INS.adults} Adults  | ${MANUAL_INS.children} Children | ${MANUAL_INS.infant} Infants</td>
						<td>${MANUAL_INS.insuranceTypeName}</td>
					</tr>
					<tr>	
						<th  style="background-color:red;" colspan="2"><font size="4"><b>Remarks</b></font></th>
						<th style="background-color:red;"><font size="4"><b>Premium Cost</b></font></th>
						<th style="background-color:red;"><font size="4"><b>Markup</b></font></th>
						<th style="background-color:red;"><font size="4"><b>Display Order</b></font></th>
					</tr>
						<tr>
						<td colspan="2">${MANUAL_INS.remarks }</td>
						<td>${MANUAL_INS.premiumCost}</td>
						<td>${MANUAL_INS.premiumMarkup}</td>
						<td>${MANUAL_INS.displayOrder}</td>
					</tr>
					<tr>
						<th style="background-color:#DAF7A6;" colspan="5">
							<input type="submit" style="background-color:red;" value="Confirm Delete" />
							<a href="form_view_insurance_quotation_details?quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:green;" value="Cancel" /></a>
						</th>
					</tr>
				</table>	
	
</form:form>
<script>
$(document).ready(function () {
    // Handler for .ready() called.
     
    var nt = document.getElementById('deleteInsranceTable');
   	if (nt != null) {
        $('html, body').animate({
            scrollTop: $('#deleteInsranceTable').offset().top
        }, 'slow');
    	
    }
    
});

</script>
