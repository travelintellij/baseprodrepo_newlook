<!DOCTYPE html>
<html>
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<br>
<body>
    <div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<table style="width:70%;  table-layout:fixed;background-color:#cc3300;" >
		<tr style="background-color: lightblue;">
		<td>Stops Details </td></tr>
		<tr style="background-color: lightblue; border: 1px solid black;">
		
		<td style=" border: 1px solid black;">
			<c:forEach items="${MANUAL_FLT.flightStopsQuotationsVoList}" var="flightStopDetailQtnObj">
				  <div class="fli_de container">
                <div class="fli_de_wrapper" style="margin-top:120px">
                    <h1 style="margin:10px 0;font-size: 25px;color:#32cd32 ">Flight Stop Id- ${flightStopDetailQtnObj.fltQuotationStopId}</h1>
                    <div class="fli_de_wrapper_data">
                        <div class="fli_de_wrapper_data_fli bc-clr">
                            <div class="fli_de_wrapper_dl1">
                                <label for="" class="lb">Airline</label>
                                <p>${flightStopDetailQtnObj.airlineName }</p>
                            </div>
                            <div class="fli_de_wrapper_dl1">
                                <label for="" class="lb">Flight Number</label>
                                <p>${flightStopDetailQtnObj.flightNumber }</p>
                            </div>
                        </div>
                    </div>
                    <div class="fli_de_wrapper_data_li bc-clr">
                        <div class="fli_de_wrapper_dl1">
                            <label for="" class="lb">Departure</label>
                            <p>${flightStopDetailQtnObj.originCity }</p>
                        </div>
                        <div class="fli_de_wrapper_dl1">
                            <label for="" class="lb">Arrival</label>
                            <p>${flightStopDetailQtnObj.destinationCity}</p>
                        </div>
                        <div class="fli_de_wrapper_dl1">
                            <label for="" class="lb">Departure Details</label>
                            <p>${localDateTimeFormat.format(flightStopDetailQtnObj.departureDate )}</p>
                        </div>
                        <div class="fli_de_wrapper_dl1">
                            <label for="" class="lb">Arrival Details</label>
                            <p>${localDateTimeFormat.format(flightStopDetailQtnObj.arrivalDate )}</p>
                        </div>
                    </div>
                    <div class="fli_de_wrapper_data_li bc-clr">
                        <div class="fli_de_wrapper_dl1">
                            <label for="" class="lb">Travel Class</label>
                            <p>${flightStopDetailQtnObj.cabinClassName }</p>
                        </div>
                        <div class="fli_de_wrapper_dl1">
                            <label for="" class="lb">Adults</label>
                            <p>${flightStopDetailQtnObj.adultCount }</p>
                        </div>
                        <div class="fli_de_wrapper_dl1">
                            <label for="" class="lb">Child</label>
                            <p>${flightStopDetailQtnObj.childCount }</p>
                        </div>
                        <div class="fli_de_wrapper_dl1">
                            <label for="" class="lb">Infants</label>
                            <p>${flightStopDetailQtnObj.infantCount }</p>
                        </div>
                    </div>
                    <div class="due_today_task_data_btnss">
                    <c:if test="${QTN_OBJ.converted ne true }">
                        <a
                            href="form_view_edit_flight_stop_quotation?manualFlightQuotationId=${MANUAL_FLT.manualFlightQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}&fltQuotationStopId=${flightStopDetailQtnObj.fltQuotationStopId}"><input
                                type="button" style="background-color:blue;" value="Edit Stop" /></a>
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

			</c:forEach>
			</td>
			</tr>
		</table>
  </body>
</html>
  