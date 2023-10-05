<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>

<form:form modelAttribute="MANUAL_STS" action="delete_delete_sightseeing_manual_quotation">
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualSightSeeingQuotationId" value= "${MANUAL_STS.manualSightSeeingQuotationId}" />
	
	<table style="width:100%;" id="deleteSightSeeingTable">
		<tr><th style="background-color:blue;" colspan="5"><font size="4"><b>Id-  ${MANUAL_STS.manualSightSeeingQuotationId}</b></font></th></tr>
		<tr>
			<th style="background-color:red;"><font size="4"><b>Sight Seeing City</b></font></th>
			<th style="background-color:red;" colspan="2"><font size="4"><b>Sight Seeing Selection</b></font></th>
			<th style="background-color:red;"><font size="4"><b>Transfer Type</b></font></th>
			<th style="background-color:red;"><font size="4"><b>Sight Seeing Date</b></font></th>
		</tr>
		<tr>
			<td>${MANUAL_STS.cityName}			</td>
			<td colspan="2">
				<c:if test="${MANUAL_STS.savedSightSeeing eq true}">
							System Based
				</c:if>
				<c:if test="${MANUAL_STS.savedSightSeeing eq false}">
							Customized 
				</c:if>
			
			 </td>
			<td>${MANUAL_STS.transferTypeName} </td>
			<td><fmt:formatDate value="${MANUAL_STS.sightSeeingDate}" pattern="dd-MMM-yyyy" /> </td>
		</tr>

		<tr>	
			<th style="background-color:red;" colspan="5"><font size="4"><b>Sight Seeing Id / Sight Seeing Name</b></font></th>
			
		</tr>
		<tr>
			<td colspan="5">${MANUAL_STS.sightSeeingName} </td>
		</tr>
		<tr>	
			<th style="background-color:red;"><font size="4"><b>Adults</b></font></th>
			<th style="background-color:red;"><font size="4"><b>Children</b></font></th>
			<th style="background-color:red;"><font size="4"><b>Infant</b></font></th>
			<th style="background-color:red;"><font size="4"><b>Sight Seeing Cost</b></font></th>
			<th style="background-color:red;"><font size="4"><b>Sight Seeing Markup</b></font></th>
		</tr>
		<tr>	
			<td>${MANUAL_STS.adults}</td>
			<td>${MANUAL_STS.children}	</td>
			<td>${MANUAL_STS.infant}</td>
			<td>${MANUAL_STS.sightSeeingCost}</td>
			<td>${MANUAL_STS.sightSeeingMarkup}</td>		</tr>
		<tr>	
			<th style="background-color:red;" colspan="4"><font size="4"><b>Remarks</b></font></th>
			<th style="background-color:red;"><font size="4"><b>Display Order</b></font></th>
		</tr>
		<tr>	
			<td colspan="4">${MANUAL_STS.remarks}</td>
			<td>${MANUAL_STS.displayOrder }</td>	
		</tr>
		<tr>
			<th colspan="5">
				<input type="submit" name="confirmDelete" id="confirmDelete" Value="Confirm Delete" style="background-color:red;"/>
				<a href="form_view_sightseeing_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
			</th>
		</tr>
	</table>		
</form:form>
<script>
$(document).ready(function () {
    // Handler for .ready() called.
    var nt = document.getElementById('deleteSightSeeingTable');
   	if (nt != null) {
        $('html, body').animate({
            scrollTop: $('#deleteSightSeeingTable').offset().top
        }, 'slow');
    	
    }
    
});

</script>

   