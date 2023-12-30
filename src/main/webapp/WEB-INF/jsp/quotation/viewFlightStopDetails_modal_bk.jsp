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
				<table style="width:90%;  table-layout:fixed;background-color: lightblue; border: 3px solid #000000; border-collapse: collapse" >
				<tr>
					<th style="background-color:#800000"><font size="4"><b>Flight Stop Id yoyyo-  ${flightStopDetailQtnObj.fltQuotationStopId}</b></font></th>
					<th colspan="1"><font size="4"><b>Airline</b></font></th>
					<td>${flightStopDetailQtnObj.airlineName }</td>
					<th><font size="4"><b>Flight No. </b></font></th>
					<td > ${flightStopDetailQtnObj.flightNumber }</td>
				</tr>
				<tr>	
					<th><font size="4"><b>Departure</b></font></th>
					<th><font size="4"><b>Arrival</b></font></th>
					<th><font size="4"><b>Departure Details</b></font></th>
					<th><font size="4"><b>Arrival Details</b></font></th>
					<th><font size="4"><b>Travel Class</b></font></th>
				</tr>
				<tr>	
					<td>${flightStopDetailQtnObj.originCity }				</td>
					<td>${flightStopDetailQtnObj.destinationCity}				</td>
					<td>${localDateTimeFormat.format(flightStopDetailQtnObj.departureDate )} 	</td>
					<td>${localDateTimeFormat.format(flightStopDetailQtnObj.arrivalDate )} 	</td>
					<td>${flightStopDetailQtnObj.cabinClassName }</td>
				</tr>
				<tr>	
					<th><font size="4"><b>Adults</b></font></th>
					<th><font size="4"><b>Child</b></font></th>
					<th><font size="4"><b>Infants</b></font></th>
					<th colspan="2"><font size=4"><b>Action</b></font></th>
				</tr>
				<tr>	
					<td>${flightStopDetailQtnObj.adultCount }		</td>
					<td>${flightStopDetailQtnObj.childCount }		</td>
					<td>${flightStopDetailQtnObj.infantCount }		</td>
					<td colspan="2">
					<c:if test="${QTN_OBJ.converted ne true }">
						<a href="form_view_edit_flight_stop_quotation?manualFlightQuotationId=${MANUAL_FLT.manualFlightQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}&fltQuotationStopId=${flightStopDetailQtnObj.fltQuotationStopId}"><input type="button" style="background-color:blue;" value="Edit Stop" /></a>
						<a href="form_view_delete_flight_stop_quotation?manualFlightQuotationId=${MANUAL_FLT.manualFlightQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}&fltQuotationStopId=${flightStopDetailQtnObj.fltQuotationStopId}"><input type="button" style="background-color:red;" value="Delete Stop" /></a>
					</c:if>
					<c:if test="${QTN_OBJ.converted eq true }">
						<a><input type="button" style="background-color:lightgray;" value="Edit Stop" /></a>
						<a><input type="button" style="background-color:lightgray;" value="Delete Stop" /></a>
					</c:if>					
					</td>
				</tr>
				</table>

			</c:forEach>
			</td>
			</tr>
		</table>
  </body>
</html>
  