<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

		<c:if test="${VSA_ACTION eq 'DELETE'}">
		
		<form:form method="post" action="delete_delete_visa_manual_quotation" modelAttribute="MANUAL_VSA">
			<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
			<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
			<input type="hidden" name="visaId" value= "${VISA_OBJ.visaId}" />
			<input type="hidden" name="manualVisaQuotationId" value= "${MANUAL_VSA.manualVisaQuotationId}" />
		
		<table style="width:100%;  table-layout:fixed;" id="deleteVisaRecord">
			<tr>
				<th colspan="4" style="background-color:blue;"><font size="4"><b>Id-  ${MANUAL_VSA.manualVisaQuotationId}</b></font></th>
			</tr>
			<tr>
				<th style="background-color:red;"><font size="4"><b>Visa Country</b></font></th>
				<td>${MANUAL_VSA.visaCountry}</td>
				<th style="background-color:red;"><font size="4"><b>Visa Consulate</b></font></th>
				<td > ${MANUAL_VSA.visaConsulate}</td>
			</tr>
			<tr>	
				<th colspan="2" style="background-color:red;"><font size="4"><b>View Visa Master</b></font></th>
				<th colspan="2" style="background-color:red;"><font size="4"><b>View Documents</b></font></th>
			</tr>
			<tr>	
				<td colspan="2"><a id="myBtn[${MANUAL_VSA.visaQuotationEntity.visaId}]" onclick="myStopsDisplay(this)" data-load-url="view_visa_master_details_modal?visaId=${MANUAL_VSA.visaQuotationEntity.visaId}" data-toggle="modal" data-target="#myModal" ><input type="button" style="background-color:orange;color:black;" value="View Visa Master Details" /></a></td>
				<td colspan="2"><a id="myBtn[${MANUAL_VSA.visaQuotationEntity.visaId}]" onclick="myStopsDisplay(this)" data-load-url="view_visa_documents_details_modal?visaId=${MANUAL_VSA.visaQuotationEntity.visaId}" data-toggle="modal" data-target="#myModal" ><input type="button" style="background-color:orange;color:black;" value="View Visa Document Details" /></a></td>
				
			</tr>
			<tr>	
				<th style="background-color:red;"><font size="4"><b>Adults</b></font></th>
				<th style="background-color:red;"><font size="4"><b>Child</b></font></th>
				<th style="background-color:red;"><font size="4"><b>Infants</b></font></th>
				<th style="background-color:red;"><font size="4"><b>Display Order</b></font></th>
			</tr>
			<tr>	
				<td>${MANUAL_VSA.adults}		</td>
				<td>${MANUAL_VSA.children}		</td>
				<td>${MANUAL_VSA.infant}		</td>
				<td>${MANUAL_VSA.displayOrder}</td>
			</tr>
			<tr>	
				<th style="background-color:red;"><font size="4"><b>Total Visa Cost (System)</b></font></th>
				<th style="background-color:red;"><font size="4"><b>Total Visa Markup (System)</b></font></th>
				<th style="background-color:red;"><font size="4"><b>New Cost (Changed Current)</b></font></th>
				<th style="background-color:red;"><font size="4"><b>Quoted Markup</b></font></th>
			</tr>
			<tr>	
				<td>${MANUAL_VSA.systemVisaCost}	</td>
				<td>${MANUAL_VSA.systemVisaMarkup }		</td>
				<td>${MANUAL_VSA.visaCost}		</td>
				<td>${MANUAL_VSA.visaMarkup }		</td>
				
			</tr>
			<tr>
				<th colspan="4" style="background-color:red;">Remarks</th>
			</tr>
			<tr>
			<td colspan="4">${MANUAL_VSA.remarks }</td>
			</tr>
			<tr>
				<th colspan="4">
					<input type="submit" name="deleteVisa" id="deleteVisa" Value="Confirm Delete" style="background-color:red;" />
					<a href="form_view_visa_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
				</th>
			</tr>
		</table>	
		</form:form>
		</c:if>

		
	


<script>
$(document).ready(function () {
    // Handler for .ready() called.
    var nt = document.getElementById('deleteVisaRecord');
   	if (nt != null) {
        $('html, body').animate({
            scrollTop: $('#deleteVisaRecord').offset().top
        }, 'slow');
    	
    }
    
});
</script>
<script>

function computeb2c(){
	var totalGuests = parseInt($("#adults").val()) + parseInt($("#children").val()) + parseInt($("#infant").val());
	$('#visaCost').val(totalGuests * ${VISA_OBJ.standardCost});
	$('#visaMarkup').val(totalGuests * (${VISA_OBJ.standardB2cPrice} - ${VISA_OBJ.standardCost}));
}

function computeb2b(){
	var totalGuests = parseInt($("#adults").val()) + parseInt($("#children").val()) + parseInt($("#infant").val());
	$('#visaCost').val(totalGuests * ${VISA_OBJ.standardCost});
	$('#visaMarkup').val(totalGuests * (${VISA_OBJ.standardB2bPrice} - ${VISA_OBJ.standardCost}));
}

</script>


