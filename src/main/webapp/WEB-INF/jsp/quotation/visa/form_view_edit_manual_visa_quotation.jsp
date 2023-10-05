<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

		<c:if test="${VSA_ACTION eq 'EDIT_VISA'}">
		
		<form:form method="post" action="edit_edit_visa_manual_quotation" modelAttribute="MANUAL_VSA">
			<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
			<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
			<input type="hidden" name="visaId" value= "${VISA_OBJ.visaId}" />
			<input type="hidden" name="manualVisaQuotationId" value= "${MANUAL_VSA.manualVisaQuotationId}" />
		
			<table style="width:100%;  table-layout:fixed;" id="editVisaRecord">
			<tr>
				<th style="width:25%;background-color:pale;"><font size="4"><b>Visa Country</b></font></th>
				<td style="width:25%;">${VISA_OBJ.countryName}</td>
				<th style="width:25%;background-color:blue;"><font size="4"><b>Visa Consulate</b></font></th>
				<td style="width:25%;" > ${VISA_OBJ.cityName}</td>
			</tr>
			<tr>	
				<th colspan="2"><font size="4"><b>View Visa Master</b></font></th>
				<th colspan="2"><font size="4"><b>View Documents</b></font></th>
			</tr>
			<tr>	
				<td colspan="2"><a id="myBtn[${VISA_OBJ.visaId}]" onclick="myStopsDisplay(this)" data-load-url="view_visa_master_details_modal?visaId=${VISA_OBJ.visaId}" data-toggle="modal" data-target="#myModal" ><input type="button" style="background-color:orange;color:black;" value="View Visa Master Details" /></a></td>
				<td colspan="2"><a id="myBtn[${VISA_OBJ.visaId}]" onclick="myStopsDisplay(this)" data-load-url="view_visa_documents_details_modal?visaId=${VISA_OBJ.visaId}" data-toggle="modal" data-target="#myModal" ><input type="button" style="background-color:orange;color:black;" value="View Visa Document Details" /></a></td>
				
			</tr>
			<tr>	
				<th style="width:25%;background-color:blue;"><font size="4"><b>Adults</b></font></th>
				<th style="width:25%;background-color:blue;"><font size="4"><b>Child</b></font></th>
				<th style="width:25%;background-color:blue;"><font size="4"><b>Infants</b></font></th>
				<th style="width:25%;background-color:blue;"><font size="4"><b>Display Order</b></font></th>
			</tr>
			<tr>	
				<td style="width:25%;">
					<font color="red"><form:errors path="adults" cssClass="error" /></font>
					<form:input path="adults" type="number" min="0" style="height:30px;width:50px;margin: auto;"/>	
				</td>
				<td style="width:25%;"><form:input path="children" type="number" min="0" style="height:30px;width:50px;margin: auto;"/>		</td>
				<td style="width:25%;"><form:input path="infant" type="number" min="0" style="height:30px;width:50px;margin: auto;"/>	</td>
				<td style="width:25%;"><form:input path="displayOrder" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
			</tr>
			<tr>	
				<th style="width:25%;background-color:blue;"><font size="4"><b>System Cost PP (B2C)</b></font></th>
				<th style="width:25%;background-color:blue;"><font size="4"><b>B2C S.Price PP | B2B S.Price PP </b></font></th>
				<th style="width:25%;background-color:blue;"><font size="4"><b>Total Updated Cost </b></font></th>
				<th style="width:25%;background-color:blue;"><font size="4"><b>Total Markup</b></font></th>
			</tr>
			<tr>	
				<td style="width:25%;">${VISA_OBJ.standardCost}	</td>
				<td style="width:25%;">${VISA_OBJ.standardB2cPrice } | 	${VISA_OBJ.standardB2bPrice }	</td>
				<td style="width:25%;"><form:input path="visaCost" type="number" min="0" style="height:30px;width:120px;margin: auto;"/>		</td>
				<td style="width:25%;"><form:input path="visaMarkup" type="number" min="0" style="height:30px;width:120px;margin: auto;"/>		</td>
				
			</tr>
			<tr>
				<th colspan="4" style="background-color:blue;">Remarks</th>
			</tr>
			<tr>
			<td colspan="4"><form:textarea path="remarks" rows="3" cols="120" maxlength="1450"/></td>
			</tr>
			<tr>
				<th style="text-align:left;background-color:blue;"><input type="button" value="Compute B2C" style="background-color:#008080" onclick="computeb2c();"/><input type="button" style="background-color:#008080" value="Compute B2B" onclick="computeb2b();"/></th>
				<th colspan="3" style="background-color:blue;"><input type="submit" name="updateVisa" id="updateVisa" Value="Update Visa" />
				<a href="form_view_visa_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:green;" value="Cancel" /></a>
		
			</tr>
		</table>
		</form:form>
		</c:if>

		
	


<script>
$(document).ready(function () {
    // Handler for .ready() called.
    var nt = document.getElementById('editVisaRecord');
   	if (nt != null) {
        $('html, body').animate({
            scrollTop: $('#editVisaRecord').offset().top
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


