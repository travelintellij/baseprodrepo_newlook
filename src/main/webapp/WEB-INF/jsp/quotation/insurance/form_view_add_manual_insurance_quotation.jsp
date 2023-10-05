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

<form:form modelAttribute="MANUAL_INS" action="create_create_insurance_manual_quotation">
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
		<table style="width:100%;  table-layout:fixed;background-color: #DFE0DC; border: 3px solid #000000; border-collapse: collapse" >
					<tr><th style="background-color:blue;" colspan="5"><font size="4"><b>Id-  ${insuranceQtnObj.manualInsuranceQuotationId}</b></font></th></tr>
					<tr>
						<th style="background-color:#FF5733;"><font size="4"><b>Country Name</b></font></th>
						<th style="background-color:#FF5733;"><font size="4"><b>Insurance Name</b></font></th>
						<th style="background-color:#FF5733;"><font size="4"><b>Start Date</b></font></th>
						<th style="background-color:#FF5733;"><font size="4"><b>End Date</b></font></th>
						<th style="background-color:#FF5733;"><font size="4"><b>Insurance Provider</b></font></th>
					</tr>
					<tr>
						<td>
							<font color="red"><form:errors path="countryName" cssClass="error" /></font>
							<form:input path="countryName" style="width: 200px;height:40px;" type="text" id="countryName" required="required"/>
							<form:input path="countryId" type="hidden" />
						</td>
						<td><form:input path="insuranceName" style="width: 200px;height:40px;" type="text" id="insuranceName" required="required"/></td>
						<td>
						<font color="red"><form:errors path="coverageStartDate" cssClass="error" /></font>
						<form:input type="date" path="coverageStartDate" required="required" /></td>
						<td><form:input type="date" path="coverageEndDate" required="required" /></td>
						<td>
							<div class="select">
								<form:select path="insuranceProvider" required="required" style="width: 200px;">  
									<option class="service-small" value="" selected>Please Select</option>
									<form:options items = "${INSURANCE_PROVIDERS_MAP}" class="service-small"/>
								</form:select>  
							</div>
						 </td>
					</tr>
		
					<tr>	
						<th style="background-color:#FF5733;"><font size="4"><b>Coverage Amount</b></font></th>
						<th style="background-color:#FF5733;"><font size="4"><b>Coverage Currency</b></font></th>
						<th style="background-color:#FF5733;" colspan="2"><font size="4"><b>Guest Details</b></font></th>
						<th style="background-color:#FF5733;"><font size="4"><b>Insurance Type</b></font></th>
					</tr>
					<tr>
						<td><form:input path="coverageAmount" type="number" min="0" style="height:30px;width:100px;margin: auto;"/></td>
						<td>
							<div class="select">
								<form:select path="coverageCurrency" required="required" style="width: 100px;">  
									<option class="service-small" value="" selected>Please Select</option>
									<form:options items = "${CURRENCY_LIST}" class="service-small"/>
								</form:select>  
							</div>
						</td>
						<td colspan="2">
							<font color="red"><form:errors path="adults" cssClass="error" /></font>
							<form:input path="adults" type="number" min="0" style="height:30px;width:50px;margin: auto;"/> Adults |
							<form:input path="children" type="number" min="0" style="height:30px;width:50px;margin: auto;"/> Children |
							<form:input path="infant" type="number" min="0" style="height:30px;width:50px;margin: auto;"/> Infants 
						</td>
						<td>
							<div class="select">
								<form:select path="insuranceType" required="required" style="width: 200px;">  
									<form:options items = "${INSURANCE_TYPE_MAP}" class="service-small"/>
								</form:select>  
							</div>
						</td>
					</tr>
					<tr>	
						<th style="background-color:#FF5733;" colspan="2"><font size="4"><b>Remarks</b></font></th>
						<th style="background-color:#FF5733;"><font size="4"><b>Premium Cost</b></font></th>
						<th style="background-color:#FF5733;"><font size="4"><b>Markup</b></font></th>
						<th style="background-color:#FF5733;"><font size="4"><b>Display Order</b></font></th>
					</tr>
						<tr>
						<td colspan="2"><form:textarea path="remarks" rows="3" cols="50" maxlength="1450"/></td>
						<td><form:input path="premiumCost" type="number" min="0" style="height:30px;width:100px;margin: auto;"/></td>
						<td><form:input path="premiumMarkup" type="number" min="0" style="height:30px;width:100px;margin: auto;"/></td>
						<td><form:input path="displayOrder" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
					</tr>
					<tr>
						<th style="background-color:#DAF7A6;" colspan="5">
							<input type="submit" style="background-color:blue;" value="Add Insurance" />
							<a href="form_view_insurance_quotation_details?quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:green;" value="Cancel" /></a>
						</th>
					</tr>
				</table>	
	
</form:form>
<script>
$('#countryName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCountryList',
	paramName: "countryName",
	delimiter: ",",
	onSelect: function(suggestion) {
        cityID = suggestion.data;
        id=cityID;
        jQuery("#countryId").val(cityID);
        $('input[name=countryId]').val(id);
        return false;
    },
	transformResult: function(response) {
        return {
            suggestions: $.map($.parseJSON(response), function(item) {
            	return { value: item.countryName, data: item.destinationId };
            })
            
        };
    }
});
 </script>