<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>

<form:form modelAttribute="MANUAL_OTH" action="delete_delete_other_manual_quotation">
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<form:hidden path = "manualOtherQuotationId" />
	<table style="width:100%;  table-layout:fixed;background-color: #DFE0DC; border: 3px solid #000000; border-collapse: collapse" id="deleteServiceTable"  >
		<tr><th style="background-color:blue;" colspan="6"><font size="4"><b>Id-  ${MANUAL_OTH.manualOtherQuotationId}</b></font></th></tr>
		<tr>
			<th style="background-color:red;"><font size="4"><b>Service Name</b></font></th>
			<th style="background-color:red;" colspan="4"><font size="4"><b>Service Details</b></font></th>
			<th style="background-color:red;"><font size="4"><b>Service Date</b></font></th>
		</tr>
		<tr>
			<td>${MANUAL_OTH.serviceName }</td>
			<td colspan="4">${MANUAL_OTH.serviceDetails}</td>
			<td><fmt:formatDate value="${MANUAL_OTH.serviceDate}" pattern="dd-MM-yyyy" /></td>
		</tr>
		<tr>	
			<th style="background-color:red;"><font size="4"><b>Service Cost</b></font></th>
			<td>${MANUAL_OTH.serviceCost}</td>
			<th style="background-color:red;"><font size="4"><b>Service Markup</b></font></th>
			<td>${MANUAL_OTH.serviceMarkup}</td>
			<th style="background-color:red;"><font size="4"><b>Display Order</b></font></th>
			<td>${MANUAL_OTH.displayOrder}</td>
		</tr>
		<tr>
			<th colspan="6">
				<input type="submit" style="background-color:red;" value="Confirm Delete" /></a>
				<a href="form_view_other_quotation_details?quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
			</th>
		</tr>
	</table>	
</form:form>

<script>
$(document).ready(function () {
    // Handler for .ready() called.
     
    var nt = document.getElementById('deleteServiceTable');
   	if (nt != null) {
        $('html, body').animate({
            scrollTop: $('#deleteServiceTable').offset().top
        }, 'slow');
    	
    }
    
});

</script>