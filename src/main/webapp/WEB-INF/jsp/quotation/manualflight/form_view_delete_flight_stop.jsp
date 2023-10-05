<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link href="<c:url value="/resources/css/jquery.datetimepicker.min.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery.datetimepicker.full.js" />"></script>

<form:form modelAttribute="FLT_STOP" action="delete_delete_flight_stop_quotation">	
	
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualFlightQuotationId" value= "${MANUAL_FLT.manualFlightQuotationId}" />

	<form:hidden path = "fltQuotationStopId" />

	
	
<h2 align="center">
	<input type="image" src="${pageContext.request.contextPath}/resources/images/warning.jpg" height="50" width="50"/>
	 Delete Flight Stop
</h2>
	
<table style="width:100%;border-collapse:collapse;border:none;border-spacing:0;background-color:creamwhite" id="newflightStop">
	<tr>
		<th style="background-color:#800000"><font size="4"><b>Flight Stop Id-  ${FLT_STOP.fltQuotationStopId}</b></font></th>
		<th colspan="1" style="background-color:red;"><font size="4"><b>Airline</b></font></th>
		<td>${FLT_STOP.airlineName }</td>
		<th style="background-color:red;"><font size="3"><b>Flight No. </b></font></th>
		<td colspan="2">${FLT_STOP.flightNumber }</td>
	</tr>
	<tr>	
		<th style="background-color:red;"><font size="4"><b>Departure</b></font></th>
		<th style="background-color:red;"><font size="4"><b>Arrival</b></font></th>
		<th style="background-color:red;"><font size="4"><b>Departure Details</b></font></th>
		<th style="background-color:red;"><font size="4"><b>Arrival Details</b></font></th>
		<th style="background-color:red;"><font size="4"><b>Travel Class</b></font></th>
	</tr>
	<tr>	
		<td>${FLT_STOP.originCity }</td>
		<td>${FLT_STOP.destinationCity }</td>
		<td>${localDateTimeFormatToEdit.format(FLT_STOP.departureDate)}</td>
		<td>${localDateTimeFormatToEdit.format(FLT_STOP.arrivalDate)}</td>
		<td>${FLT_STOP.cabinClassName }</td>
	</tr>
	<tr>	
		<th style="background-color:red;"><font size="4"><b>Adults</b></font></th>
		<th style="background-color:red;"><font size="4"><b>Child</b></font></th>
		<th style="background-color:red;"><font size="4"><b>Infants</b></font></th>
		<th colspan="2" style="background-color:red;"><font size=4"><b>Action</b></font></th>
		
	</tr>
	<tr>	
		<td>${FLT_STOP.adultCount }</td>
		<td>${FLT_STOP.childCount } </td>
		<td>${FLT_STOP.infantCount } </td>
		<td colspan="2"><input type="submit" name="deleteFlight" id="deleteFlight" Value="Confirm Delete"  style="background-color:red;"/>
		<a href="form_view_manage_stops_quotation?manualFlightQuotationId=${MANUAL_FLT.manualFlightQuotationId}&leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
		
		</td>
	
	</tr>
	<tr>
		
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
	$("#editFlight").on('click', function () {
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


