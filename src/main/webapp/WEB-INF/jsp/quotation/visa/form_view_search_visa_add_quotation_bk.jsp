<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<center>
		<h2>
			Search Visa Master
		</h2>
</center>
	<form:form method="post" action="search_search_visa_master_quotation" modelAttribute="visa_obj">
		<input type="hidden" id="countryCode" name="countryCode" />
		<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
		<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
		<table style="width:100%;  table-layout:fixed;background-color: #DFE0DC; border: 3px solid #000000; border-collapse: collapse" >
					<tr><td style="border:0px;"> <input style="width:600px;height: 50px; border-color: blue !important;" type="text" id="countryName"  name="countryName" placeholder="country name" required /> </td></tr>
					<tr>
					<td style="border:0px;">
						<input type="submit" name="submit" value="Search Visa Details" />
						<a href="form_view_visa_quotation_details?quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:blue;" value="Cancel" /></a></li>
					</td></tr>
		</table>	
	</form:form>
		
		<div align="center">${VISA_COUNT_MSG}</div> 
		
		<c:if test="${not empty VISA_RESULT_SET}">
				<input type="hidden" id="countryName" name="countryName" value="${COUNTRY_NAME}" />
				<input type="hidden" id="countryCode" name="countryCode" value="${COUNTRY_CODE}" />
				<table style="width:100%;  table-layout:fixed;background-color: #DFE0DC; border: 3px solid #000000; border-collapse: collapse" >
					<tr>
						<th style="width:9%;">Country Name</th>
						<th style="width:9%;">Consulate City</th>
						<th style="width:9%;">Visa Profile</th>
						<th style="width:9%;">Visa Type</th>
						<th style="width:9%;">Visa Purpose</th>
						<th style="width:9%;">Processing Time</th>
						<th style="width:46%;">Action</th>
					</tr>
					<c:forEach var="visaMasterObj" items="${VISA_RESULT_SET}">
					<tr>
						<td style="width:9%;">${visaMasterObj.countryName}</td>
						<td style="width:9%;">${visaMasterObj.cityName}</td>
						<td style="width:9%;">${VISA_PROFILE.get(visaMasterObj.profile)}</td>
						<td style="width:9%;">${VISA_TYPE.get(visaMasterObj.visaType)}</td>
						<td style="width:9%;">${VISA_PURPOSE.get(visaMasterObj.visaPurpose)}</td>
						<td style="width:9%;">${visaMasterObj.processingTime} Days</td>
						<td style="width:46%;border:0;display:inline;">
							<a id="myBtn[${visaMasterObj.visaId}]" onclick="myStopsDisplay(this)" data-load-url="view_visa_master_details_modal?visaId=${visaMasterObj.visaId}" data-toggle="modal" data-target="#myModal" ><input type="button" style="background-color:orange;color:black;" value="View Details" /></a>
							<a id="myBtn[${visaMasterObj.visaId}]" onclick="myStopsDisplay(this)" data-load-url="view_visa_documents_details_modal?visaId=${visaMasterObj.visaId}" data-toggle="modal" data-target="#myModal" ><input type="button" style="background-color:orange;color:black;" value="View Visa Document" /></a>
							<a href="form_view_add_visa_quotation_form?visaId=${visaMasterObj.visaId}&leadId=${LEAD_OBJ.leadId }&quotationId=${QTN_OBJ.quotationId}" ><input type="button" style="background-color:green;" value="Add To Quotation" /></a>
						</td>
					</tr>
					</c:forEach>
				</table>
				
		</c:if>
		<c:if test="${VSA_ACTION eq 'ADD_VISA'}">
		
		<form:form method="post" action="create_create_visa_manual_quotation" modelAttribute="MANUAL_VSA">
			<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
			<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
			<input type="hidden" name="visaId" value= "${VISA_OBJ.visaId}" />
		
		<table style="width:100%;  table-layout:fixed;" >
			<tr>
				<th style="width:25%;background-color:blue;"><font size="4"><b>Visa Country</b></font></th>
				<td style="width:25%;background-color:blue;">${VISA_OBJ.countryName}</td>
				<th style="width:25%;background-color:blue;"><font size="4"><b>Visa Consulate</b></font></th>
				<td style="width:25%;background-color:blue;" > ${VISA_OBJ.cityName}</td>
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
				<th style="width:25%;"><font size="4"><b>Adults</b></font></th>
				<th style="width:25%;"><font size="4"><b>Child</b></font></th>
				<th style="width:25%;"><font size="4"><b>Infants</b></font></th>
				<th style="width:25%;"><font size="4"><b>Display Order</b></font></th>
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
				<th style="width:25%;"><font size="4"><b>System Cost PP (B2C)</b></font></th>
				<th style="width:25%;"><font size="4"><b>B2C S.Price PP | B2B S.Price PP </b></font></th>
				<th style="width:25%;"><font size="4"><b>Total Updated Cost </b></font></th>
				<th style="width:25%;"><font size="4"><b>Total Markup</b></font></th>
			</tr>
			<tr>	
				<td style="width:25%;">${VISA_OBJ.standardCost}	</td>
				<td style="width:25%;">${VISA_OBJ.standardB2cPrice } | 	${VISA_OBJ.standardB2bPrice }	</td>
				<td style="width:25%;"><form:input path="visaCost" type="number" min="0" style="height:30px;width:120px;margin: auto;"/>		</td>
				<td style="width:25%;"><form:input path="visaMarkup" type="number" min="0" style="height:30px;width:120px;margin: auto;"/>		</td>
				
			</tr>
			<tr>
				<th colspan="4">Remarks</th>
			</tr>
			<tr>
			<td colspan="4"><form:textarea path="remarks" rows="3" cols="120" maxlength="1450"/></td>
			</tr>
			<tr>
				<th style="text-align:left;"><input type="button" value="Compute B2C" style="background-color:#008080" onclick="computeb2c();"/><input type="button" style="background-color:#008080" value="Compute B2B" onclick="computeb2b();"/></th>
				<th colspan="3"><input type="submit" name="addVisa" id="addVisa" Value="Add Visa" />
				<a href="form_view_visa_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
		
			</tr>
		</table>
		</form:form>
		</c:if>

		
	


<script>
$('#countryName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCountryList',
	paramName: "countryName",
	delimiter: ",",
	onSelect: function(suggestion) {
        cityID = suggestion.data;
        id=cityID;
        jQuery("#countryCode").val(cityID);
        $('input[name=countryCode]').val(id);
        return false;
    },
	transformResult: function(response) {
        return {
            suggestions: $.map($.parseJSON(response), function(item) {
            	return { value: item.countryName, data: item.countryCode };
            })
            
        };
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


