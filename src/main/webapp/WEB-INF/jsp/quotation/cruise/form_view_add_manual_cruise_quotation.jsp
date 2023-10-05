<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>

<form:form modelAttribute="MANUAL_CRS" action="create_create_cruise_manual_quotation">
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualCruiseQuotationId" value= "${MANUAL_CRS.manualCruiseQuotationId}" />
	
	<table style="width:100%;  table-layout:fixed;" id="addCruise" >
		<tr>
			<th style="width:20%;background-color:#FF5733;" colspan="1"><font size="4"><b>City</b></font></th>
			<th style="width:40%;background-color:#FF5733;" colspan="2"><font size="4"><b>Cruise Name</b></font></th>
			<th style="width:20%;background-color:#FF5733;" ><font size="4"><b>State Room Type</b></font></th>
			<th style="width:20%;background-color:#FF5733;"><font size="4"><b>Cruise Provider</b></font></th>
		</tr>
		<tr>
			<td>
				<font color="red"><form:errors path="cityName" cssClass="error" /></font>
				<form:input path="cityName" style="width: 150px;height:40px;" type="text" id="cityName"  />
				<form:hidden path = "cityId" id="cityId" />
			</td>
			<td colspan="2">
				<form:input path="cruiseName" style="width: 250px;height:40px;" type="text" id="cruiseName" />
			</td>
			<td>
				<div class="select">
					<form:select path="stateRoomType" required="required" style="width: 150px;">  
						<option class="service-small" value="" selected>Please Select</option>
						<form:options items = "${CRUISE_STATE_ROOM_TYPE_MAP}" class="service-small"/>
					</form:select>  
				</div>
			
			</td>
			<td>
				<div class="select">
					<form:select path="cruiseProvider" required="required" style="width: 150px;">  
						<option class="service-small" value="" >Please Select</option>
						<form:options items = "${CRUISE_PROVIDER_NAMES_MAP}"  class="service-small"/>
					</form:select>  
				</div>
			</td>
		</tr>
 
		<tr>	
			<th style="width:20%;background-color:#FF5733;"><font size="4"><b>Sailing Start Date</b></font></th>
			<th style="width:20%;background-color:#FF5733;"><font size="4"><b>Sailing End Date</b></font></th>
			<th style="width:20%;background-color:#FF5733;"><font size="4"><b>Adults</b></font></th>
			<th style="width:20%;background-color:#FF5733;"><font size="4"><b >Children</b></font></th>
			<th style="width:20%;background-color:#FF5733;"><font size="4"><b>Children Age Info</b></font></th>
		</tr>
		<tr>
			<td>
			<font color="red"><form:errors path="sailingStartDate" cssClass="error" /></font>
				<form:input type="date" path="sailingStartDate" required="required" /> 
			</td>
			<td><form:input type="date" path="sailingEndDate" required="required" /></td>
			<td>
				<font color="red"><form:errors path="adults" cssClass="error" /></font>
				<form:input path="adults" type="number" min="0" style="height:30px;width:50px;margin: auto;"/>
			</td>
			<td><form:input path="children" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
			<td><form:input path="childrenAgeInfo" type="text" min="0" style="height:30px;width:100px;margin: auto;"/></td>
		</tr>
			
			
		<tr>	
			<th style="background-color:#FF5733;"><font size="4"><b>No. of Decks </b></font></th>
			<th style="background-color:#FF5733;" colspan="2"><font size="4"><b>Total Cost</b></font></th>
			<th style="background-color:#FF5733;"><font size="4"><b>Total Markup</b></font></th>
			<th style="background-color:#FF5733;"><font size="4"><b>Display Order</b></font></th>
		</tr>
		<tr>	
			<td><form:input path="noOfDecks" type="number" min="1" style="height:30px;width:50px;margin: auto;"/></td>
			<td colspan="2"><form:input path="cruiseStayCost" type="number" min="0" style="height:30px;width:120px;margin: auto;"/>	</td>
			<td><form:input path="cruiseStayMarkup" type="number" min="0" style="height:30px;width:80px;margin: auto;"/></td>
			<td><form:input path="displayOrder" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
		</tr>
		<tr>	
			<th style="background-color:#FF5733;" colspan="5"><font size="4"><b>Remarks</b></font></th>
		</tr>
		<tr>	
			<td colspan="5"><form:textarea path="remarks" rows="3" cols="150" maxlength="1450"/></td>
		</tr>
		<tr>
			<th colspan="5"><input type="submit" name="addCruise" id="addCruise" Value="Add Cruise Stay" />
			<a href="form_view_cruise_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
		
		</th>
	</tr>
	</table>	
</form:form>

<script>
$('#cityName').autocomplete({
	serviceUrl : '${pageContext.request.contextPath}/getCityList',
	paramName : "cityName",
	delimiter : ",",
	onSelect : function(suggestion) {
		cityID = suggestion.data;
		id = cityID;
		jQuery("#cityId").val(cityID);
		$('input[name=cityId]').val(id);
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

$(document).ready(function () {
    // Handler for .ready() called.
     
    var nt = document.getElementById('addCruise');
   	if (nt != null) {
        $('html, body').animate({
            scrollTop: $('#addCruise').offset().top
        }, 'slow');
    	
    }
    
});

</script>
   