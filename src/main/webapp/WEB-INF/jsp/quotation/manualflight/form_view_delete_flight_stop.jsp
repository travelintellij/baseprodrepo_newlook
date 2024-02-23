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

	
	

	
				  <div class="fli_de container">
                <div class="fli_de_wrapper bs" style="margin-top:120px">
                    <h1 style="margin:10px 0;font-size: 25px;color:#32cd32 ">Flight Stop Id-  ${FLT_STOP.fltQuotationStopId}</h1>
                    <div class="fli_de_wrapper_data">
                        <div class="fli_de_wrapper_data_fli a">
                            <div class="fli_de_wrapper_dl1">
                                <label for="" class="lb">Airline</label>
                                <p>${FLT_STOP.airlineName }</p>
                            </div>
                            <div class="fli_de_wrapper_dl1">
                                <label for="" class="lb">Flight Number</label>
                                <p>${FLT_STOP.flightNumber }</p>
                            </div>
                        </div>
                    </div>
                    <div class="fli_de_wrapper_data_li a">
                        <div class="fli_de_wrapper_dl1">
                            <label for="" class="lb">Departure</label>
                            <p>${FLT_STOP.originCity }</p>
                        </div>
                        <div class="fli_de_wrapper_dl1">
                            <label for="" class="lb">Arrival</label>
                            <p>${FLT_STOP.destinationCity }</p>
                        </div>
                        <div class="fli_de_wrapper_dl1">
                            <label for="" class="lb">Departure Details</label>
                            <p>${localDateTimeFormatToEdit.format(FLT_STOP.departureDate)}</p>
                        </div>
                        <div class="fli_de_wrapper_dl1">
                            <label for="" class="lb">Arrival Details</label>
                            <p>${localDateTimeFormatToEdit.format(FLT_STOP.arrivalDate)}</p>
                        </div>
                    </div>
                    <div class="fli_de_wrapper_data_li a">
                        <div class="fli_de_wrapper_dl1">
                            <label for="" class="lb">Travel Class</label>
                            <p>${FLT_STOP.cabinClassName }</p>
                        </div>
                        <div class="fli_de_wrapper_dl1">
                            <label for="" class="lb">Adults</label>
                            <p>${FLT_STOP.adultCount }</p>
                        </div>
                        <div class="fli_de_wrapper_dl1">
                            <label for="" class="lb">Child</label>
                            <p>${FLT_STOP.childCount } </p>
                        </div>
                        <div class="fli_de_wrapper_dl1">
                            <label for="" class="lb">Infants</label>
                            <p>${FLT_STOP.infantCount }</p>
                        </div>
                    </div>
                    <div class="due_today_task_data_btnss" style="margin:10px 0">
                    <input type="submit" name="deleteFlight" id="deleteFlight" Value="Confirm Delete"  style="background-color:red;"/>
		<a href="form_view_manage_stops_quotation?manualFlightQuotationId=${MANUAL_FLT.manualFlightQuotationId}&leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button"  value="Cancel" /></a>
                    </div>
                </div>
            </div>
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


