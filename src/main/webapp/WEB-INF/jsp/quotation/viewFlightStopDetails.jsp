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

                            <div align="center"><b>
                                    <font color="green"> ${Success} </font>
                                    <font color="red"> ${Error}</font>
                                </b></div>
       
                                 <div class="fli_de container">
        <div class="fli_de_wrapper" style="margin-top:300px">
            <h1 style="margin:10px 0;font-size: 25px;color:#32cd32 ">Id- ${MANUAL_FLT.manualFlightQuotationId}</h1>
            <div class="fli_de_wrapper_data">
                <div class="fli_de_wrapper_data_fli bc-clr">
                    <div class="fli_de_wrapper_dl1">
                        <label for="" class="lb">Airline</label>
                        <p>${MANUAL_FLT.airlineName }</p>
                    </div>
                    <div class="fli_de_wrapper_dl1">
                        <label for="" class="lb">Flight Number</label>
                        <p>${MANUAL_FLT.flightNumber }</p>
                    </div>
                </div>
            </div>
            <div class="fli_de_wrapper_data_li bc-clr">
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Departure</label>
                    <p>${MANUAL_FLT.originCity }</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Arrival</label>
                    <p>${MANUAL_FLT.destinationCity}</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Departure Details</label>
                    <p>${localDateTimeFormat.format(MANUAL_FLT.departureDate )}</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Arrival Details</label>
                    <p>${localDateTimeFormat.format(MANUAL_FLT.arrivalDate )}</p>
                </div>
            </div>
            <div class="fli_de_wrapper_data_li bc-clr">
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Duration</label>
                    <p>${MANUAL_FLT.duration }</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Adults</label>
                    <p>${MANUAL_FLT.adultCount }</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Child</label>
                    <p>${MANUAL_FLT.childCount }</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Infants</label>
                    <p>${MANUAL_FLT.infantCount }</p>
                </div>
            </div>
            <div class="fli_de_wrapper_data_li bc-clr">
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Stops</label>
                    <p>${MANUAL_FLT.noOfStops }</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Travel Class</label>
                    <p>${MANUAL_FLT.cabinClassName }</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Total Flight Cost</label>
                    <p>${MANUAL_FLT.flightCost}</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Total Flight Markup</label>
                    <p>${MANUAL_FLT.flightMarkup }</p>
                </div>
            </div>
            <div class="fli_de_wrapper_data_li bc-clr">
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Display order</label>
                    <p>${MANUAL_FLT.displayOrder }</p>
                </div>
            </div>
            <div class="due_today_task_data_btnss">
              
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

                                                    <table
                                                        style="width:90%;  table-layout:fixed;background-color: lightblue; border: 3px solid #000000; border-collapse: collapse">
                                                        <tr>
                                                            <th style="background-color:#800000">
                                                                <font size="4"><b>Flight Stop Id-
                                                                        ${flightStopDetailQtnObj.fltQuotationStopId}</b>
                                                                </font>
                                                            </th>
                                                            <th colspan="1">
                                                                <font size="4"><b>Airline</b></font>
                                                            </th>
                                                            <td>${flightStopDetailQtnObj.airlineName }</td>
                                                            <th>
                                                                <font size="4"><b>Flight No. </b></font>
                                                            </th>
                                                            <td> ${flightStopDetailQtnObj.flightNumber }</td>
                                                        </tr>
                                                        <tr>
                                                            <th>
                                                                <font size="4"><b>Departure</b></font>
                                                            </th>
                                                            <th>
                                                                <font size="4"><b>Arrival</b></font>
                                                            </th>
                                                            <th>
                                                                <font size="4"><b>Departure Details</b></font>
                                                            </th>
                                                            <th>
                                                                <font size="4"><b>Arrival Details</b></font>
                                                            </th>
                                                            <th>
                                                                <font size="4"><b>Travel Class</b></font>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <td>${flightStopDetailQtnObj.originCity } </td>
                                                            <td>${flightStopDetailQtnObj.destinationCity} </td>
                                                            <td>${localDateTimeFormat.format(flightStopDetailQtnObj.departureDate
                                                                )}
                                                            </td>
                                                            <td>${localDateTimeFormat.format(flightStopDetailQtnObj.arrivalDate
                                                                )} </td>
                                                            <td>${flightStopDetailQtnObj.cabinClassName }</td>
                                                        </tr>
                                                        <tr>
                                                            <th>
                                                                <font size="4"><b>Adults</b></font>
                                                            </th>
                                                            <th>
                                                                <font size="4"><b>Child</b></font>
                                                            </th>
                                                            <th>
                                                                <font size="4"><b>Infants</b></font>
                                                            </th>
                                                            <th colspan="2">
                                                                <font size=4"><b>Action</b></font>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <td>${flightStopDetailQtnObj.adultCount } </td>
                                                            <td>${flightStopDetailQtnObj.childCount } </td>
                                                            <td>${flightStopDetailQtnObj.infantCount } </td>
                                                            <td colspan="2">
                                                                <c:if test="${QTN_OBJ.converted ne true }">
                                                                    <a
                                                                        href="form_view_edit_flight_stop_quotation?manualFlightQuotationId=${MANUAL_FLT.manualFlightQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}&fltQuotationStopId=${flightStopDetailQtnObj.fltQuotationStopId}"><input
                                                                            type="button" style="background-color:blue;"
                                                                            value="Edit Stop" /></a>
                                                                    <a
                                                                        href="form_view_delete_flight_stop_quotation?manualFlightQuotationId=${MANUAL_FLT.manualFlightQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}&fltQuotationStopId=${flightStopDetailQtnObj.fltQuotationStopId}"><input
                                                                            type="button" style="background-color:red;"
                                                                            value="Delete Stop" /></a>
                                                                </c:if>
                                                                <c:if test="${QTN_OBJ.converted eq true }">
                                                                    <a><input type="button"
                                                                            style="background-color:lightgray;"
                                                                            value="Edit Stop" /></a>
                                                                    <a><input type="button"
                                                                            style="background-color:lightgray;"
                                                                            value="Delete Stop" /></a>
                                                                </c:if>
                                                            </td>
                                                        </tr>
                                                    </table>
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