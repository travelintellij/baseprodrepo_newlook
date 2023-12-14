<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>

<form:form modelAttribute="MANUAL_CRS" action="delete_delete_cruise_manual_quotation">
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualCruiseQuotationId" value= "${MANUAL_CRS.manualCruiseQuotationId}" />
	
	<table style="width:100%;  table-layout:fixed;background-color: #DFE0DC; border: 3px solid #000000; border-collapse: collapse" id="deleteCruise">
					<tr><th style="background-color:blue;" colspan="5"><font size="4"><b>Id-  ${MANUAL_CRS.manualCruiseQuotationId}</b></font></th></tr>
					<tr>
						
						<th style="background-color:red;" colspan="1"><font size="4"><b>City</b></font></th>
						<th style="background-color:red;" colspan="2"><font size="4"><b>Cruise Name</b></font></th>
						<th style="background-color:red;" ><font size="4"><b>State Room Type</b></font></th>
						<th style="background-color:red;" ><font size="4"><b>Cruise Provider</b></font></th>
					</tr>
					<tr>
						<td>${MANUAL_CRS.cityName }</td>
						<td colspan="2">${MANUAL_CRS.cruiseName}</td>
						<td>${MANUAL_CRS.stateRoomName}</td>
						<td>${MANUAL_CRS.cruiseProviderName}</td>
					</tr>
		
					<tr>	
						<th style="background-color:red;" ><font size="4"><b>Sailing Start Date</b></font></th>
						<th style="background-color:red;" ><font size="4"><b>Sailing End Date</b></font></th>
						<th style="background-color:red;" ><font size="4"><b>Adults</b></font></th>
						<th style="background-color:red;" ><font size="4"><b>Children</b></font></th>
						<th style="background-color:red;" ><font size="4"><b>Children Age Info</b></font></th>
					</tr>
					<tr>
						<td><fmt:formatDate value="${MANUAL_CRS.sailingStartDate}" pattern="dd-MM-yyyy" /> </td>
						<td><fmt:formatDate value="${MANUAL_CRS.sailingEndDate}" pattern="dd-MM-yyyy" /></td>
						<td>${MANUAL_CRS.adults}</td>
						<td>${MANUAL_CRS.children}</td>
						<td>${MANUAL_CRS.childrenAgeInfo}</td>
					</tr>
					
					
					<tr>	
						<th style="background-color:red;" ><font size="4"><b>No. of Decks </b></font></th>
						<th style="background-color:red;" colspan="2"><font size="4"><b>Total Cost</b></font></th>
						<th style="background-color:red;" ><font size="4"><b>Total Markup</b></font></th>
						<th style="background-color:red;" ><font size="4"><b>Display Order</b></font></th>
					</tr>
					<tr>	
						<td>${MANUAL_CRS.noOfDecks}</td>
						<td colspan="2">${MANUAL_CRS.cruiseStayCost}	</td>
						<td>${MANUAL_CRS.cruiseStayMarkup}</td>
						<td>${MANUAL_CRS.displayOrder }		</td>
					</tr>
					<tr>	
						<th style="background-color:red;" colspan="5"><font size="4"><b>Remarks</b></font></th>
					</tr>
					<tr>	
						<td colspan="5">${MANUAL_CRS.remarks}</td>
					</tr>
					<tr>
						<th colspan="5">
							<input type="submit" name="deleteCruise" id="deleteCruise" style="background-color:red;" Value="Confirm Delete" />
							<a href="form_view_cruise_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
						</th>
					</tr>
				</table>	
</form:form>
<script>
$(document).ready(function () {
    // Handler for .ready() called.
     
    var nt = document.getElementById('deleteCruise');
   	if (nt != null) {
        $('html, body').animate({
            scrollTop: $('#deleteCruise').offset().top
        }, 'slow');
    	
    }
    
});

</script>
