<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Document</title>
                    <script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
                    <script src="<c:url value=" /resources/js/jquery.datetimepicker.full.js" />"></script>

                </head>
<style>
  body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/flight_qu.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            background-attachment: fixed;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0.5; /* Adjust the opacity value as needed (0.0 to 1.0) */
            z-index: -1;
        }

</style>
                <body>
                
                
                
<div class="my-ki">
    <!-- ############# quick lead view starts here################## -->
    <form:form modelAttribute="LEAD_OBJ" action="create_create_lead_quotation">
    <div class="sep_quick_lead_view">
        <input type="checkbox" name="" id="" class="ch_quick_lead_view">
        <div class="hamburgur_menu_quick_lead_view">
            <span class="sep_line1"></span>
            <span class="sep_line2"></span>
            <span class="sep_line3"></span>
        </div>
        <h2 style="display:inline-block;font-size:20px;;">Quick lead view</h2>
        <div class="lead_view_sep">
        <jsp:include page="../leadDetailsOpenNavView.jsp" />
        </div>
    </div>
    </form:form>
    <!-- ############# quick lead view ends here################## -->
</div>

<div class="afd">
<jsp:include page="../_quotationServicesMenu.jsp" />
</div>
                
                    
                    <form:form modelAttribute="QTN_OBJ" action="create_create_lead_quotation">
                    
                    
                    
                    
            <div class="viewInsuranceQuotationDetails">
            <div class="viewInsuranceQuotationD_wrapper">
                <div class="viewInsuranceQuotationD_wr_data">
                    <div class="viewInsuranceQuotationD_wr_data_line">
                        <label for="" class="lb">Quotation</label>
                        <p>${QTN_OBJ.quotationId}</p>
                    </div>
                    <div class="viewInsuranceQuotationD_wr_data_line">
                        <label for="" class="lb"> Version Id</label>
                        <p>${QTN_OBJ.version}</p>
                    </div>
                </div>
              </div>
            </div>
                    
            
                    </form:form>


                    <div class="float-container">
                      
                        <div class="float-child-right">
                            <div class="gender" align="center"  style="border:2px solid black;background:black;color:white;width:600px;margin:10px auto;padding:10px 0;border-radius:10px">
                                <input type="radio" value="oneway" id="oneway" name="flightMode"
                                    data-url="form_view_serach_flight_oneway_quotation?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"
                                    disabled /> <label for="oneway" class="radio">One Way</label>
                                <input type="radio" value="return" id="return" name="flightMode"
                                    data-url="www.returnflight.com" disabled />
                                <label for="return" class="radio">Return</label>
                                <input type="radio" value="manual" id="manual" name="flightMode"
                                    data-url="form_view_add_manual_flight_quotation?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"
                                    checked /> <label for="manual" class="radio">Manual</label>
                            </div>
                            <div class="blue">
                                <form:form modelAttribute="MANUAL_FLT" action="edit_edit_manual_flight_quotation">


                                    <form:hidden path="manualFlightQuotationId" />
                                    <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
                                    <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />



                                <div class="fr_view_fli_qu container">
        <div class="fr_view_fli_qu_wr" style="margin-top:20px;margin-left:50px">
            <div class="fr_view_fli_qu_wr_li_f">
                <div class="fr_view_fli_qu_wr_d">
                    <label for="">Airline</label> <br>
                    <form:select path="airlineId" required="required" style="width:95%">
                        <option class="service-small" value="" selected>Please Select
                        </option>
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
                    <form:input path="originCity" type="text" id="originCity" />
                    <form:hidden path="airportCodeOrigin" id="origin" />
                    <font color="red">
                        <form:errors path="originCity" cssClass="error" />
                    </font>
                </div>
                <div class="fr_view_fli_qu_wr_d">
                    <label for="">Arrival</label> <br>
                    <font color="red">
                        <form:errors path="destinationCity" cssClass="error" />
                    </font>
                    <input type="text" id="destinationCity" name="destinationCity" />
                    <form:hidden path="airportCodeDestination" id="origin" value="0" />
                </div>
                <div class="fr_view_fli_qu_wr_d">
                    <label for="">Departure Details</label> <br>
                    <input id="departureDate" name="departureDate"
                        value="${localDateTimeFormatToEdit.format(MANUAL_FLT.departureDate)}" required />
                </div>
                <div class="fr_view_fli_qu_wr_d">
                    <label for="">Arrival Details</label> <br>
                    <input id="arrivalDate" name="arrivalDate"
                        value="${localDateTimeFormatToEdit.format(MANUAL_FLT.arrivalDate)}" required />
                </div>
            </div>
            <div class="fr_view_fli_qu_wr_li">
                <div class="fr_view_fli_qu_wr_d">
                    <label for="">Duration</label> <br>
                    <form:input path="duration" />
                </div>
                <div class="fr_view_fli_qu_wr_d">
                    <label for="">Adults</label> <br>
                    <form:input path="adultCount" type="number" min="0" />
                    <font color="red">
                        <form:errors path="adultCount" cssClass="error" />
                    </font>
                </div>
                <div class="fr_view_fli_qu_wr_d">
                    <label for="">Children</label> <br>
                    <form:input path="childCount" type="number" min="0" />
                </div>
                <div class="fr_view_fli_qu_wr_d">
                    <label for="">Infants</label> <br>
                    <form:input path="infantCount" type="number" min="0" />
                </div>
            </div>
            <div class="fr_view_fli_qu_wr_li">
                <div class="fr_view_fli_qu_wr_d">
                    <label for="">Stops</label> <br>
                    <form:input path="noOfStops" type="number" min="0" />
                    <font color="red">
                        <form:errors path="noOfStops" cssClass="error" />
                    </font>
                </div>
                <div class="fr_view_fli_qu_wr_d">
                    <label for="">Travel Class</label> <br>
                    <form:select path="cabinClass" required="required" style="width:90%">
                        <option class="service-small" value="0" selected>Please Select
                        </option>
                        <form:options items="${CABIN_CLASS}" class="service-small" />
                    </form:select>
                </div>
                <div class="fr_view_fli_qu_wr_d">
                    <label for="">Total Flight Cost</label> <br>
                    <form:input path="flightCost" type="number" min="0" />
                </div>
                <div class="fr_view_fli_qu_wr_d">
                    <label for="">Total Flight Markup</label> <br>
                    <form:input path="flightMarkup" type="number" min="0" />
                </div>
            </div>
            <div class="fr_view_fli_qu_wr_li">
                <div class="fr_view_fli_qu_wr_d">
                    <label for="">Display Order</label> <br>
                    <form:input path="displayOrder" type="number" min="0" style="width:85%"/>
                </div>
            </div>
            <div class="due_today_task_data_btnss">
            <input type="submit" name="editFlight" id="editFlight" Value="Update Flight" />
            <a href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input
                    type="button" style="background-color:blue;" value="Cancel" /></a>
            </div>
        </div>
    </div>
                                </form:form>
                            </div>


                        </div>
                    </div>

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


                        /*$("input[type=radio][name=flightMode]").change(function (one,two) {
                    	
                            if ($(this).val() == "oneway") {
                                alert(one);
                                //window.location.replace("form_view_serach_flight_oneway_quotation?leadId=&quotationId=");
                            } else {
                                alert('false');
                            }
                        });
                        */
                    </script>
                    <script>

                        $(document).ready(function () {
                            $("#addFlight").on('click', function () {
                                var getValue = $("#departureDate").val();
                                $('input[name=departureDate]').val(getValue);
                            });


                        });
                        $("#departureDate").datetimepicker();
                        $("#arrivalDate").datetimepicker();


                    </script>

                </body>

</html>