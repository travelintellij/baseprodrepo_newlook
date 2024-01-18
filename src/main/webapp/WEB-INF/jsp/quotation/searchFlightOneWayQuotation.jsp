<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
</head>


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

<div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>

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
        <jsp:include page="leadDetailsOpenNavView.jsp" />
        </div>
    </div>
    </form:form>
    <!-- ############# quick lead view ends here################## -->
</div>

    <div class="afd">
<jsp:include page="_quotationServicesMenu.jsp" />
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
    

  
    <form:form modelAttribute="FLT_SRCH" action="serach_flight_oneway_quotation_results">
        <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
        <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
    
        <div class="float-container">
    
         
            <div class="float-child-right">
                <div class="gender" align="center" style="border:2px solid black;background:black;color:white;width:600px;margin:10px auto;padding:10px 0;border-radius:10px"> 
    
                    <input type="radio" value="oneway" id="oneway" name="flightMode"
                        data-url="form_view_serach_flight_oneway_quotation?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"
                        checked /> <label for="oneway" class="radio" style="margin-right:10px">One Way</label>
                    <input type="radio" value="return" id="return" name="flightMode" data-url="www.returnflight.com" />
                    <label for="return" class="radio" style="margin-right:10px">Return</label>
                    <input type="radio" value="manual" id="manual" name="flightMode"
                        data-url="form_view_add_manual_flight_quotation?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}" />
                    <label for="manual" class="radio">Manual</label>
                </div>
                <div class="blue">
                
                    <div class="oneW container">
        <div class="oneW_wr" style="margin-top:20px;margin-left:50px">
            <div class="oneW_wr_d">
                <div class="oneW_wr_d_li">
                    <label for="">Departure</label>
                    <input type="text" id="originCity" name="originCity" />
                    <form:hidden path="${FLT_SRCH.segments.origin}" id="origin" value="0" />
                </div>
                <div class="oneW_wr_d_li">
                    <label for="">Destination</label>
                <input  type="text" id="destination" />
                </div>
                <div class="oneW_wr_d_li">
                    <label for="">Departure Date</label>
                <input type="date" name="preferredDepartureTime" />
                </div>
                <div class="oneW_wr_d_li">
                    <label for="">Departure Time</label>
                    <select id="preferredDeparture" name="preferredDeparture" style="width:90%">
                        <option class="service-small" value="Morning">Any Time</option>
                        <option class="service-small" value="Morning">Morning</option>
                        <option class="service-small" value="Morning">Afternoon</option>
                        <option class="service-small" value="Morning">Evening</option>
                        <option class="service-small" value="Morning">Night</option>
                    </select>
                </div>
            </div>
            <div class="oneW_wr_d">
                <div class="oneW_wr_d_li">
                    <label for="">Adults</label>
                <form:select path="adultCount" style="width:90%">
                    <form:options class="service-small" items="${PAX_COUNT}" />
                </form:select>
                </div>
                <div class="oneW_wr_d_li">
                    <label for="">Children</label>
                    <form:select path="childCount" style="width:90%">
                        <form:options class="service-small" items="${PAX_COUNT}" />
                    </form:select>
                </div>
                <div class="oneW_wr_d_li">
                    <label for="">Infant</label>
                    <form:select path="infantCount" style="width:90%">
                        <form:options class="service-small" items="${PAX_COUNT}" />
                    </form:select>
                </div>
                <div class="oneW_wr_d_li">
                    <label for="">Cabin Class</label>
                    <select id="cabinClass" name="cabinClass" required style="width:90%">
                        <option class="service-small" value="Morning">Any</option>
                        <option class="service-small" value="Morning">Economy</option>
                        <option class="service-small" value="Morning">Premium Economy</option>
                        <option class="service-small" value="Morning">Business</option>
                        <option class="service-small" value="Morning">First Class</option>
                    </select>
                </div>
            </div>
            <div class="oneW_wr_d">
                <div class="oneW_wr_d_li_ch">
                <form:checkbox path="directFlight" value="${FLT_SRCH.directFlight}" />
                <b>Show Direct Flight Only</b>
                </div>
            </div>
            <div class="due_today_task_data_btns">
            <input type="submit" name="SearchNow" Value="Search Now" />
            </div>
        </div>
    </div>
    
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
                    $('input[name=travelingFrom]').val(id);
                    return false;
                },
                transformResult: function (response) {
                    return {
                        suggestions: $.map($.parseJSON(response), function (item) {
                            return { value: item.cityName, data: item.destinationId };
                        })

                    };
                }
            });

            $('#destination').autocomplete({
                serviceUrl: '${pageContext.request.contextPath}/getAirportList',
                paramName: "cityName",
                delimiter: ",",
                onSelect: function (suggestion) {
                    cityID = suggestion.data;
                    id = cityID;
                    jQuery("#destinationId").val(cityID);
                    $('input[name=travelingFrom]').val(id);
                    return false;
                },
                transformResult: function (response) {
                    return {
                        suggestions: $.map($.parseJSON(response), function (item) {
                            return { value: item.cityName, data: item.destinationId };
                        })

                    };
                }
            });

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
</body>
</html>