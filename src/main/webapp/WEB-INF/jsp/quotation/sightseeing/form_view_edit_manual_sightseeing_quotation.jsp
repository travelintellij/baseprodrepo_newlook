<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>

<form:form modelAttribute="MANUAL_STS" action="edit_edit_sightseeing_manual_quotation">
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualSightSeeingQuotationId" value= "${MANUAL_STS.manualSightSeeingQuotationId}" />
	
	<table style="width:100%;" id="editSightSeeingTable">
		<tr><th style="background-color:blue;" colspan="5"><font size="4"><b>Id-  ${MANUAL_STS.manualSightSeeingQuotationId}</b></font></th></tr>
		<tr>
			<th><font size="4"><b>Sight Seeing City</b></font></th>
			<th colspan="2"><font size="4"><b>Sight Seeing Selection</b></font></th>
			<th ><font size="4"><b>Transfer Type</b></font></th>
			<th><font size="4"><b>Sight Seeing Date</b></font></th>
		</tr>
		<tr>
			<td>
				<font color="red"><form:errors path="cityName" cssClass="error" /></font>
				<form:input path="cityName" style="width: 150px;height:40px;" type="text" id="cityName"  />
				<form:hidden path = "cityId" id="cityId" />
			</td>
			<td colspan="2">
				<div class="gender" align="center">
					<form:radiobutton path="savedSightSeeing" value="true" onclick="check();" id="system" />  <label for="system" class="radio">System Based</label>
					<form:radiobutton path="savedSightSeeing" value="false" onclick="check();" id="cutomized" /> <label for="cutomized" class="radio">Customized</label>
	 			</div>	
			
			 </td>
			<td>
			<div class="select">
				<form:select path="transferType" required="required" style="width: 130px;">  
					<option class="service-small" value="" selected>Please Select</option>
					<form:options items = "${TRANSFER_TYPE_MODE}" class="service-small"/>
				</form:select>  
			</div>
			
			</td>
			<td><form:input type="date" path="sightSeeingDate" required="required" /> </td>
		</tr>

		<tr>	
			<th colspan="5"><font size="4"><b>Sight Seeing Id / Sight Seeing Name</b></font></th>
			
		</tr>
		<tr>
			<td colspan="5">
				<font color="red"><form:errors path="sightSeeingName" cssClass="error" /></font>
				<form:input path="sightSeeingName" style="width: 700px;height:40px;" type="text" id="sightSeeingName" required="required" onchange="considerAutoComplete()" />
				<form:hidden path = "sightSeeingId" id="sightSeeingId" />
			</td>
		</tr>
		<tr>	
			<th><font size="4"><b>Adults</b></font></th>
			<th><font size="4"><b>Children</b></font></th>
			<th><font size="4"><b>Infant</b></font></th>
			<th><font size="4"><b>Sight Seeing Cost</b></font></th>
			<th><font size="4"><b>Sight Seeing Markup</b></font></th>
		</tr>
		<tr>	
			<td>
				<font color="red"><form:errors path="adults" cssClass="error" /></font>
				<form:input path="adults" type="number" min="0" style="height:30px;width:50px;margin: auto;"/>
			</td>
			<td><form:input path="children" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
			<td><form:input path="infant" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
			<td><form:input path="sightSeeingCost" type="number" min="0" style="height:30px;width:120px;margin: auto;"/></td>
			<td><form:input path="sightSeeingMarkup" type="number" min="0" style="height:30px;width:80px;margin: auto;"/></td>
		</tr>
		<tr>	
			<th colspan="4"><font size="4"><b>Remarks</b></font></th>
			<th><font size="4"><b>Display Order</b></font></th>
		</tr>
		<tr>	
			<td colspan="4"><form:textarea path="remarks" rows="3" cols="100" maxlength="1450"/></td>
			<td><form:input path="displayOrder" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>	
		</tr>
		<tr>
			<th colspan="5">
				<input type="submit" name="editSightSeeing" id="editSightSeeing" Value="Update Sight Seeing" />
				<a href="form_view_sightseeing_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
			</th>
		</tr>
	</table>		
</form:form>

<script>

$(document).ready(function() {
	check();
});

function check(){
	if ($("input[name='savedSightSeeing']:checked").val()=="true") {
		$( "#sightSeeingName" ).autocomplete( "enable" );
	}
	if ($("input[name='savedSightSeeing']:checked").val()=="false") {
		$( "#sightSeeingName" ).autocomplete( "disable" );
	}
}

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



	



	//alert($("input[name='savedSightSeeing']:checked").val());
	$('#sightSeeingName').autocomplete(
		{

			//alert($("#savedSightSeeing").val);
			serviceUrl : "${pageContext.request.contextPath}/getCitySightSeeingList",
			minChars: 3,
			paramName : "sightSeeingName",
			params : {
				cityId : function() {
					return $('#cityId').val()
				}
			},
			delimiter : ",",
			onSelect : function(suggestion) {
				sightSeeingID = suggestion.data;
				id = sightSeeingId;
				jQuery("#sightSeeingId").val(sightSeeingID);
				$('input[name=sightSeeingName]').val(suggestion.value);
				//alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
				return false;
			},
			transformResult : function(response) {
				return {
					suggestions : $.map($.parseJSON(response),
							function(item) {
								return {
									value : item.tagName,
									data : item.id,
									roomCat : item.keyValueList
								};
							})

				};
			}

		});
	$(document).ready(function () {
	    // Handler for .ready() called.
	    var nt = document.getElementById('editSightSeeingTable');
	   	if (nt != null) {
	        $('html, body').animate({
	            scrollTop: $('#editSightSeeingTable').offset().top
	        }, 'slow');
	    	
	    }
	    
	});

</script>
   