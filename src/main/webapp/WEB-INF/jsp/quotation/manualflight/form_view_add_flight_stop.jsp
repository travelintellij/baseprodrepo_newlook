<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<link href="<c:url value="/resources/css/jquery.datetimepicker.min.css"/>" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery.datetimepicker.full.js"/>"></script>
   <style>
   .autocomplete-suggestions { border: 1px solid #999; background: red;overflow-y:auto}
		.autocomplete-suggestion {padding: 2px 5px;color:white; background: black;overflow-y: auto;overflow-y:auto}
		.autocomplete-selected { background: #F0F0F0;overflow-y:auto} 
		.autocomplete-suggestions strong { font-weight: normal; color:#FABA08;overflow-y:auto}
		.autocomplete-group { padding: 2px 5px;overflow-y:auto}
		.autocomplete-group strong { display: block; border-bottom: 1px solid #000;  background: black ; color:black overflow-y:auto}
		.autocomplete-selected:hover{
		color:black
		}
   </style>
   <div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>
   
<form:form modelAttribute="FLT_STOP" action="create_create_flight_stop_quotation">	
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualFlightQuotationId" value= "${MANUAL_FLT.manualFlightQuotationId}" />
        <div class="fr_view_fli_qu container">
            <div class="fr_view_fli_qu_wr ">
                <div class="fr_view_fli_qu_wr_li_f">
                    <div class="fr_view_fli_qu_wr_d">
                        <label for="">Airline</label> <br>
                        <form:select path="airlineId" required="required" style="width:95%">
                            <option class="service-small" value="" selected>Please Select</option>
                            <form:options items="${AIRLINE_MAP}" class="service-small" />
                        </form:select>
                    </div>
                    <div class="fr_view_fli_qu_wr_d">
                        <label for="">Flight Number</label> <br>
                        <form:input path="flightNumber" />
                    </div>
                </div>
                <div class="fr_view_fli_qu_wr_li">
                    <div class="fr_view_fli_qu_wr_d">
                        <label for="">Departure</label> <br>
                   
                    <form:input path="originCity"  type="text" id="originCity" />
                    <form:hidden path="airportCodeOrigin" id="origin" />
                    <font color="red">
                        <form:errors path="originCity" cssClass="error" />
                    </font>
                    </div>
                    <div class="fr_view_fli_qu_wr_d">
                        <label for="">Arrival</label> <br>
                        
                        <form:input path="destinationCity"  type="text" id="destinationCity" />
                        <form:hidden path="airportCodeDestination" id="origin" />
                        <font color="red">
                            <form:errors path="destinationCity" cssClass="error" />
                        </font>
                    </div>
                    <div class="fr_view_fli_qu_wr_d">
                        <label for="">Departure Details</label> <br>
                        <c:if test="${not empty FLT_STOP.departureDate}">
                            <input id="departureDate" name="departureDate"
                                value="${localDateTimeFormatToEdit.format(FLT_STOP.departureDate)}" required />
                        </c:if>
                        <c:if test="${empty FLT_STOP.departureDate}">
                            <input  id="departureDate" name="departureDate" required />
                        </c:if>
                    </div>
                    <div class="fr_view_fli_qu_wr_d">
                        <label for="">Arrival Details</label> <br>
                        <font color="red">
                            <form:errors path="dateErrorHolder" cssClass="error" />
                        </font>
                        <c:if test="${not empty FLT_STOP.arrivalDate}">
                            <input  id="arrivalDate" name="arrivalDate"
                                value="${localDateTimeFormatToEdit.format(FLT_STOP.arrivalDate)}" required />
                        </c:if>
                        <c:if test="${empty FLT_STOP.arrivalDate}">
                            <input  id="arrivalDate" name="arrivalDate" required />
                        </c:if>
                    </div>
                </div>
                <div class="fr_view_fli_qu_wr_li">
                    <div class="fr_view_fli_qu_wr_d">
                        <label for="">Adults</label> <br>
                        <font color="red">
                            <form:errors path="adultCount" cssClass="error" />
                        </font>
                        <form:input path="adultCount" type="number" min="0"  />
                    </div>
                    <div class="fr_view_fli_qu_wr_d">
                        <label for="">Children</label> <br>
                        <form:input path="childCount" type="number" min="0"  />
                    </div>
                    <div class="fr_view_fli_qu_wr_d">
                        <label for="">Infants</label> <br>
                        <form:input path="infantCount" type="number" min="0" />
                    </div>
                      <div class="fr_view_fli_qu_wr_d">
                        <label for="">Travel Class</label> <br>
                        <form:select path="cabinClass" required="required" style="width:90%">
                            <option class="service-small" value="0" selected>Please Select</option>
                            <form:options items="${CABIN_CLASS}" class="service-small" />
                        </form:select>
                    </div>
                </div>
            
                <div class="due_today_task_data_btnss" style="margin:10px 0">
                <input type="submit" name="addFlight" id="addFlight" Value="Add Flight Stop" />
                <a
                    href="form_view_manage_stops_quotation?manualFlightQuotationId=${MANUAL_FLT.manualFlightQuotationId}&leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input
                        type="button" value="Cancel" /></a>
                </div>
            </div>
        </div>
            </form:form>
                    <script>
                        $(document).ready(function () {
                            $('#originCity').autocomplete({
                                serviceUrl: '${pageContext.request.contextPath}/getAirportList',
                                paramName: "cityName",
                                delimiter: ",",
                                onSelect: function (suggestion) {
                                    cityID = suggestion.data;
                                    id = cityID;
                                    jQuery("#destinationId").val(cityID);
                                    $('input[name=airportCodeOrigin]').val(id);
                                    return false;
                                },
                                transformResult: function (response) {
                                    return {
                                        suggestions: $.map($.parseJSON(response), function (item) {
                                            return { value: item.cityName, data: item.airportId };
                                        })

                                    };
                                }
                            });

                            $('#destinationCity').autocomplete({
                                serviceUrl: '${pageContext.request.contextPath}/getAirportList',
                                paramName: "cityName",
                                delimiter: ",",
                                onSelect: function (suggestion) {
                                    cityID = suggestion.data;
                                    id = cityID;
                                    jQuery("#destinationId").val(cityID);
                                    $('input[name=airportCodeDestination]').val(id);
                                    return false;
                                },
                                transformResult: function (response) {
                                    return {
                                        suggestions: $.map($.parseJSON(response), function (item) {
                                            return { value: item.cityName, data: item.airportId };
                                        })

                                    };
                                }
                            });

                            //$('.flightMode').change(function(e) {
                            //$('#flightMode').change(function(e) {
                            $('input[name="flightMode"]').change(function () {
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

                        $(document).ready(function () {
                            $("#addFlight").on('click', function () {
                                var getValue = $("#departureDate").val();
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

