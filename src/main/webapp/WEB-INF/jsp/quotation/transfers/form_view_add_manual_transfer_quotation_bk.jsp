<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/css/jquery.datetimepicker.min.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery.datetimepicker.full.js" />"></script>


<form:form modelAttribute="MANUAL_TRN" action="create_create_transfer_manual_quotation">
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualFlightQuotationId" value= "${MANUAL_HTL.manualHotelQuotationId}" />
	<table style="width:100%;  table-layout:fixed;background-color: #DFE0DC; border: 3px solid #000000; border-collapse: collapse" >
		<tr>
			<th colspan="1" style="width:20%;"><font size="4"><b>Pickup City <b></font></th>
			<th  style="width:20%;"><font size="4"><b>Pickup From</b></font></th>
			<th colspan="2"  style="width:40%;"><font size="4"><b>Pickup From Name</b></font></th>
			<th  style="width:20%;"><font size="4"><b>Transfer Date</b></font></th>
		</tr>
		<tr>
			<td>
				<font color="red"><form:errors path="pickUpCityName" cssClass="error" /></font>
				<form:input path="pickUpCityName" style="width: 180px;height:40px;" type="text" id="pickUpCityName" required="required" />
				<form:hidden path = "pickUpCityId" id="pickUpCityId" />
			</td>
			<td>
				<div class="select">
					<form:select path="pickUpFrom" required="required" style="width: 130px;">  
						<option class="service-small" value="" selected>Please Select</option>
						<form:options items = "${TRANSFER_POINT_NAME}" class="service-small"/>
					</form:select>  
				</div>
			
			</td>
			<td colspan="2">
				<form:input path="pickUpFromName" style="width: 300px;height:40px;" type="text" id="pickUpFromName" required="required" />
			</td>
			<td>
				<form:input type="date" path="transferDate" required="required" />
			</td>
		</tr>

		<tr>	
			<th><font size="4"><b>Drop City</b></font></th>
			<th><font size="4"><b>Drop To</b></font></th>
			<th colspan="2"><font size="4"><b>Drop To Name</b></font></th>
			<th><font size="4"><b>Transfer Type</b></font></th>
		</tr>
		<tr>
			<td>
				<font color="red"><form:errors path="dropToCityName" cssClass="error" /></font>
				<form:input path="dropToCityName" style="width: 180px;height:40px;" type="text" id="dropToCityName"  required="required" />
				<form:hidden path = "dropToCityId" id="dropToCityId" />
			</td>
			<td>
				<div class="select">
					<form:select path="dropTo" required="required" style="width: 130px;">  
						<option class="service-small" value="" selected>Please Select</option>
						<form:options items = "${TRANSFER_POINT_NAME}" class="service-small"/>
					</form:select>  
				</div>
			</td>
			<td colspan="2">
				<form:input path="dropToName" style="width: 300px;height:40px;" type="text" id="dropToName" required="required" />
			</td>
			<td>
				<div class="select">
					<form:select path="transferType" required="required" style="width: 100px;">  
						<option class="service-small" value="" selected>Please Select</option>
						<form:options items = "${TRANSFER_TYPE_MODE}" class="service-small"/>
					</form:select>  
				</div>
			</td>
		</tr>
		<tr>	
			<th><font size="4"><b>Adults</b></font></th>
			<th><font size="4"><b>Children</b></font></th>
			<th><font size="4"><b>Infant</b></font></th>
			<th><font size="4"><b>Transfer Cost</b></font></th>
			<th><font size="4"><b>Transfer Markup</b></font></th>
		</tr>
		<tr>	
			<td>
				<font color="red"><form:errors path="adults" cssClass="error" /></font>
				<form:input path="adults" type="number" min="0" style="height:30px;width:50px;margin: auto;"/>
			</td>
			<td><form:input path="children" type="number" min="0" style="height:30px;width:50px;margin: auto;"/>	</td>
			<td><form:input path="infant" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
			<td><form:input path="transferCost" type="number" min="0" style="height:30px;width:120px;margin: auto;"/>	</td>
			<td><form:input path="transferMarkup" type="number" min="0" style="height:30px;width:80px;margin: auto;"/> </td>
		</tr>
		<tr>	
			<th colspan="4"><font size="4"><b>Remarks</b></font></th>
			<th><font size="4"><b>Display Order</b></font></th>
		</tr>
		<tr>	
			<td colspan="4"><form:textarea path="remarks" rows="3" cols="120" maxlength="1450"/></td>
			<td><form:input path="displayOrder" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>	
		</tr>
		<tr>
			<th colspan="5"><input type="submit" name="addTransfer" id="addTransfer" Value="Add Transfer" />
			<a href="form_view_transfer_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
		
		</tr>
	</table>	
</form:form>

<script>
$('#pickUpCityName').autocomplete({
	serviceUrl : '${pageContext.request.contextPath}/getCityList',
	paramName : "cityName",
	delimiter : ",",
	onSelect : function(suggestion) {
		cityID = suggestion.data;
		id = cityID;
		jQuery("#cityId").val(cityID);
		$('input[name=pickUpCityId]').val(id);
		return false;
	},
	transformResult : function(response) {
		return {
			suggestions : $.map($.parseJSON(response), function(item) {
				return {
					value : item.cityName,
					data : item.destinationId
				};
			})

		};
	}
});

$('#dropToCityName').autocomplete({
	serviceUrl : '${pageContext.request.contextPath}/getCityList',
	paramName : "cityName",
	delimiter : ",",
	onSelect : function(suggestion) {
		cityID = suggestion.data;
		id = cityID;
		jQuery("#cityId").val(cityID);
		$('input[name=dropToCityId]').val(id);
		return false;
	},
	transformResult : function(response) {
		return {
			suggestions : $.map($.parseJSON(response), function(item) {
				return {
					value : item.cityName,
					data : item.destinationId
				};
			})

		};
	}
});



//$("#transferDate").datetimepicker();

</script>
   