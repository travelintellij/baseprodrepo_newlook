<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>viewFlightStopDetails</title>
                    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
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
                <div class="viewInsuranceQuotationD_wr_data bs">
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

                            <div align="center"><b>
                                    <font color="green"> ${Success} </font>
                                    <font color="red"> ${Error}</font>
                                </b></div>
       
                                 <div class="fli_de container">
        <div class="fli_de_wrapper bs" style="margin-top:20px">
            <h1 style="margin:10px 0;font-size: 25px;color:#32cd32 ">Id- ${MANUAL_FLT.manualFlightQuotationId}</h1>
            <div class="fli_de_wrapper_data">
                <div class="fli_de_wrapper_data_fli a">
                    <div class="fli_de_wrapper_dl1">
                        <label for="" class="lb">Airline</label>
                        <p style="color:gray">${MANUAL_FLT.airlineName }</p>
                    </div>
                    <div class="fli_de_wrapper_dl1">
                        <label for="" class="lb">Flight Number</label>
                        <p style="color:gray">${MANUAL_FLT.flightNumber }</p>
                    </div>
                </div>
            </div>
            <div class="fli_de_wrapper_data_li a">
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Departure</label>
                    <p style="color:gray">${MANUAL_FLT.originCity }</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Arrival</label>
                    <p style="color:gray">${MANUAL_FLT.destinationCity}</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Departure Details</label>
                    <p style="color:gray">${localDateTimeFormat.format(MANUAL_FLT.departureDate )}</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Arrival Details</label>
                    <p style="color:gray">${localDateTimeFormat.format(MANUAL_FLT.arrivalDate )}</p>
                </div>
            </div>
            <div class="fli_de_wrapper_data_li a">
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Duration</label>
                    <p style="color:gray">${MANUAL_FLT.duration }</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Adults</label>
                    <p style="color:gray">${MANUAL_FLT.adultCount }</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Child</label>
                    <p style="color:gray">${MANUAL_FLT.childCount }</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Infants</label>
                    <p style="color:gray">${MANUAL_FLT.infantCount }</p>
                </div>
            </div>
            <div class="fli_de_wrapper_data_li a">
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Stops</label>
                    <p style="color:gray">${MANUAL_FLT.noOfStops }</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Travel Class</label>
                    <p style="color:gray">${MANUAL_FLT.cabinClassName }</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Total Flight Cost</label>
                    <p style="color:gray">${MANUAL_FLT.flightCost}</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Total Flight Markup</label>
                    <p style="color:gray">${MANUAL_FLT.flightMarkup }</p>
                </div>
            </div>
            <div class="fli_de_wrapper_data_li a">
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Display order</label>
                    <p style="color:gray">${MANUAL_FLT.displayOrder }</p>
                </div>
            </div>
            <div class="due_today_task_data_btnss" style="margin-top:10px">
              
    <c:if test="${ MANUAL_FLT.flightStopsQuotationsVoList.size() le MANUAL_FLT.noOfStops }">
        <c:if test="${QTN_OBJ.converted ne true }">
            <a
                href="form_view_add_flight_stop_quotation?manualFlightQuotationId=${MANUAL_FLT.manualFlightQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                    type="button"  value="Add Stop" /></a>
        </c:if>
        <c:if test="${QTN_OBJ.converted eq true }">
            <a><input type="button" style="background-color:lightgray;" value="Add Stop" /></a>
        </c:if>
    </c:if>
    <c:if test="${QTN_OBJ.converted ne true }">
        <a
            href="form_view_edit_manual_flight_quotation?manualFlightQuotationId=${MANUAL_FLT.manualFlightQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                type="button"  value="Edit Flight" /></a>
        <a
            href="form_view_delete_manual_flight_quotation?manualFlightQuotationId=${MANUAL_FLT.manualFlightQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                type="button" style="background-color:red;" value="Delete Flight" /></a>
        <a href="form_view_flight_quotation_details?quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                type="button"  value="Cancel" /></a>
    </c:if>
    <c:if test="${QTN_OBJ.converted eq true }">
        <a><input type="button" style="background-color:lightgray;" value="Edit Flight" /></a>
        <a><input type="button" style="background-color:lightgray;" value="Delete Flight" /></a>
        <a href="form_view_flight_quotation_details?quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                type="button" style="background-color:blue;" value="Cancel" /></a>
    </c:if>
            </div>
        </div>
    </div>
                                    </td>
                                </tr>
                                <br>
                                <br>
                               
                              

                                
                                <tr style="background-color: lightblue; border: 1px solid black;">
                                    <td style=" border: 1px solid black;">

                                        <c:if test="${FLT_STOP_ACTION eq 'ADD'}">
                                            <jsp:include page="manualflight/form_view_add_flight_stop.jsp" />
                                        </c:if>




                                        <c:forEach items="${MANUAL_FLT.flightStopsQuotationsVoList}"
                                            var="flightStopDetailQtnObj">
                                            <c:choose>
                                                <c:when
                                                    test="${flightStopDetailQtnObj.fltQuotationStopId eq FLT_STOP.fltQuotationStopId  && FLT_STOP_ACTION eq 'EDIT' }">
                                                    <jsp:include page="manualflight/form_view_edit_flight_stop.jsp" />
                                                </c:when>
                                                <c:when
                                                    test="${flightStopDetailQtnObj.fltQuotationStopId eq FLT_STOP.fltQuotationStopId  && FLT_STOP_ACTION eq 'DELETE' }">
                                                    <jsp:include page="manualflight/form_view_delete_flight_stop.jsp" />
                                                </c:when>

                                                <c:otherwise>

                             <div class="view_flight container" style="margin-top:20px">
        <div class="view_flight_wrapper">
            <h1 style="margin:10px 0;font-size: 25px;color:#32cd32 " >Flight Stop Id-
            ${flightStopDetailQtnObj.fltQuotationStopId}</h1>
            <div class="view_flight_wrapper_data">
                <div class="view_flight_wrapper_data_line a">
                    <div class="view_flight_wrapper_dl">
                        <label for="" class="lb">Airline</label>
                        <p>${flightStopDetailQtnObj.airlineName }</p>
                    </div>
                    <div class="view_flight_wrapper_dl">
                        <label for="" class="lb">Flight No</label>
                        <p>${flightStopDetailQtnObj.flightNumber }</p>
                    </div>
                    <div class="view_flight_wrapper_dl">
                        <label for="" class="lb">Departure</label>
                        <p>${flightStopDetailQtnObj.originCity }</p>
                    </div>
                    <div class="view_flight_wrapper_dl">
                        <label for="" class="lb">Arrival</label>
                        <p>${flightStopDetailQtnObj.destinationCity}</p>
                    </div>
                </div>
                <div class="view_flight_wrapper_data_line a">
                    <div class="view_flight_wrapper_dl">
                        <label for="" class="lb">Departure Details</label>
                        <p>${localDateTimeFormat.format(flightStopDetailQtnObj.departureDate
                        )}</p>
                    </div>
                    <div class="view_flight_wrapper_dl">
                        <label for="" class="lb">Arrival Details</label>
                        <p>${localDateTimeFormat.format(flightStopDetailQtnObj.arrivalDate
                        )}</p>
                    </div>
                    <div class="view_flight_wrapper_dl">
                        <label for="" class="lb">Travel class</label>
                        <p>${flightStopDetailQtnObj.cabinClassName }</p>
                    </div>
                    <div class="view_flight_wrapper_dl">
                        <label for="" class="lb">Adults</label>
                        <p>${flightStopDetailQtnObj.adultCount }</p>
                    </div>
                </div>
                <div class="view_flight_wrapper_data_line a">
                    <div class="view_flight_wrapper_dl" style="width:25%">
                        <label for="" class="lb">Child</label>
                        <p>${flightStopDetailQtnObj.childCount }</p>
                    </div>
                    <div class="view_flight_wrapper_dl" style="width:25%">
                        <label for="" class="lb">Infant</label>
                        <p>${flightStopDetailQtnObj.infantCount }</p>
                    </div>
                    <div class="view_flight_wrapper_dl" style="width:25%">
                        <label for="" class="lb">Action</label>
                        <p>3232</p>
                    </div>
                </div>
                <div class="due_today_task_data_btnss" style="margin-top:10px">
                    <c:if test="${QTN_OBJ.converted ne true }">
                        <a
                            href="form_view_edit_flight_stop_quotation?manualFlightQuotationId=${MANUAL_FLT.manualFlightQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}&fltQuotationStopId=${flightStopDetailQtnObj.fltQuotationStopId}"><input
                                type="button" style="background-color:#32cd32  ;" value="Edit Stop" /></a>
                        <a
                            href="form_view_delete_flight_stop_quotation?manualFlightQuotationId=${MANUAL_FLT.manualFlightQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}&fltQuotationStopId=${flightStopDetailQtnObj.fltQuotationStopId}"><input
                                type="button" style="background-color:red;" value="Delete Stop" /></a>
                    </c:if>
                    <c:if test="${QTN_OBJ.converted eq true }">
                        <a><input type="button" style="background-color:lightgray;" value="Edit Stop" /></a>
                        <a><input type="button" style="background-color:lightgray;" value="Delete Stop" /></a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </body>

</html>