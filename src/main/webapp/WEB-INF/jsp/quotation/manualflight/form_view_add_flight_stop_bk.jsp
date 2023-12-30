<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link href="<c:url value="/resources/css/jquery.datetimepicker.min.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery.datetimepicker.full.js" />"></script>

<form:form modelAttribute="FLT_STOP" action="create_createoriginCity_flight_stop_quotation">	
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualFlightQuotationId" value= "${MANUAL_FLT.manualFlightQuotationId}" />
<table style="width:90%;border-collapse:collapse;border:none;border-spacing:0;background-color:creamwhite" id="newflightStop">
	<tr>
		<th colspan="1"><font size="4"><b>Airline</b></font></th>
		<td>
			<div class="select">
				<form:select path="airlineId" required="required" >  
					<option class="service-small" value="" selected>Please Select</option>
					<form:options items = "${AIRLINE_MAP}" class="service-small"/>
				</form:select>  
			</div>
		</td>
		<th><font size="3"><b>Flight No. </b></font></th>
		<td colspan="2"><form:input path="flightNumber"  style="height:30px;width:120px;margin: auto;"/></td>
	</tr>
	<tr>	
		<th><font size="4"><b>Departure hello</b></font></th>
		<th><font size="4"><b>Arrival</b></font></th>
		<th><font size="4"><b>Departure Details</b></font></th>
		<th><font size="4"><b>Arrival Details</b></font></th>
	</tr>
	<tr>	
		<td>
			<font color="red"><form:errors path="originCity" cssClass="error" /></font>
			<form:input path="originCity" style="width: 250px;height:40px;" type="text" id="originCity"  />
			<form:hidden path = "airportCodeOrigin" id="origin" />
		</td>
		<td>
			<font color="red"><form:errors path="destinationCity" cssClass="error" /></font>
			<form:input path="destinationCity" style="width: 250px;height:40px;" type="text" id="destinationCity"  />
			<form:hidden path = "airportCodeDestination" id="origin"  />
		</td>
		<td>
		  	<c:if test="${not empty FLT_STOP.departureDate}">
				<input style="height: 30px; width: 180px;" id="departureDate" name="departureDate" value="${localDateTimeFormatToEdit.format(FLT_STOP.departureDate)}" required />
			</c:if>
		  	<c:if test="${empty FLT_STOP.departureDate}">
				<input style="height: 30px; width: 180px;" id="departureDate" name="departureDate" required />
			</c:if>
		</td>
		<td>
			<font color="red"><form:errors path="dateErrorHolder" cssClass="error" /></font>
			<c:if test="${not empty FLT_STOP.arrivalDate}">
				<input style="height: 30px; width: 180px;" id="arrivalDate" name="arrivalDate" value="${localDateTimeFormatToEdit.format(FLT_STOP.arrivalDate)}" required />
			</c:if>
		  	<c:if test="${empty FLT_STOP.arrivalDate}">
				<input style="height: 30px; width: 180px;" id="arrivalDate" name="arrivalDate" required />
			</c:if>
			
		</td>
	</tr>
	<tr>	
		<th><font size="4"><b>Adults</b></font></th>
		<th><font size="4"><b>Child</b></font></th>
		<th><font size="4"><b>Infants</b></font></th>
		<th><font size="4"><b>Travel Class</b></font></th>
	</tr>
	<tr>	
		<td>
		<font color="red"><form:errors path="adultCount" cssClass="error" /></font>
		<form:input path="adultCount" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
		<td><form:input path="childCount" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
		<td><form:input path="infantCount" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
		<td>
			<div class="select">
				<form:select path="cabinClass" required="required" >  
					<option class="service-small" value="0" selected>Please Select</option>
					<form:options items = "${CABIN_CLASS}" class="service-small"/>
				</form:select>  
			</div>
		</td>
	</tr>
	<tr>
		<th colspan="4"><input type="submit" name="addFlight" id="addFlight" Value="Add Flight Stop" />
		<a href="form_view_manage_stops_quotation?manualFlightQuotationId=${MANUAL_FLT.manualFlightQuotationId}&leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
		
		</th>
	</tr>
	</table>
</form:form>

<script>
$(document).ready(function() {	
	$('#originCity').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getAirportList',
			paramName: "cityName",
			delimiter: ",",
			onSelect: function(suggestion) {
	            cityID = suggestion.data;
	            id=cityID;
	            jQuery("#destinationId").val(cityID);
	            $('input[name=airportCodeOrigin]').val(id);
	            return false;
	        },
			transformResult: function(response) {
		        return {
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	return { value: item.cityName, data: item.airportId };
		            })
		            
		        };
		    }
		});

		$('#destinationCity').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getAirportList',
			paramName: "cityName",
			delimiter: ",",
			onSelect: function(suggestion) {
	            cityID = suggestion.data;
	            id=cityID;
	            jQuery("#destinationId").val(cityID);
	            $('input[name=airportCodeDestination]').val(id);
	            return false;
	        },
			transformResult: function(response) {
		        return {
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	return { value: item.cityName, data: item.airportId };
		            })
		            
		        };
		    }
		});

		//$('.flightMode').change(function(e) {
		//$('#flightMode').change(function(e) {
		$('input[name="flightMode"]').change(function() {
			//alert($('form input[type=radio]:checked').val());
			var url = $(this).attr('data-url');
			window.location.replace(url);
			//const $this = $(this), $link = $("#url");
			//$link.html($this.val());
			//$link.attr("href", $this.attr("data-url"));
			//alert($this.attr("data-url"))
			});
				
	});

	

	</script>
	<script>

$(document).ready(function(){
	$("#addFlight").on('click', function () {
	   var getValue=$("#departureDate").val();
	   $('input[name=departureDate]').val(getValue);
	 });

	 
	});
$(document).ready(function () {
    // Handler for .ready() called.
     
    var nt = document.getElementById('newflightStop');
   	if (nt != null) {
        $('html, body').animate({
            scrollTop: $('#newflightStop').offset().top
        }, 'slow');
    	
    }
    
});

$("#departureDate").datetimepicker();
$("#arrivalDate").datetimepicker();


</script>


