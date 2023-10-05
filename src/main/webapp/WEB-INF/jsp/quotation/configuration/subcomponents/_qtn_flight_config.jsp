<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<style>
td{
text-align:center;
background-color:white;
}
</style>
	
	<h1 align="center">Flights</h1>
	
	<table style="width:100%; margin-left: auto;margin-right: auto;  background-color:#000080;" >
	
	<tr><td>	  
	<font size="4"><b>
		<c:set var="count" value="1" scope="page" />
		<c:forEach items="${QTN_OBJ.manualQuotationsVoList}" var="flightQtnObj">
			<table style="width:100%;" >
			<tr><td colspan="4" height="50" style="background-color:blue;color:white;"><font size="5">Flight <c:out value="${count}" /></font></td></tr>
			<tr>
			<td style="width:20%;"><img src="${pageContext.request.contextPath}/resources/images/quotation/flight-quote.jpg"  height="200" width="350"/></td>
			<td style="width:80%;" colspan="3" >
			<table style="width:100%;table-layout:fixed;" >
				<tr>
					<th style="border: 1px solid black;">Airline</th>
					<td style="border:1px solid black;">${flightQtnObj.airlineName }</td>
					<th style="border: 1px solid black;" >Flight No. </th>
					<td style="border: 1px solid black;"> ${flightQtnObj.flightNumber }</td>
				</tr>
				<tr>	
					<th style="border: 1px solid black;">Departure</th><td height="50" style="border: 1px solid black;">${flightQtnObj.originCity }</td>
					<th style="border: 1px solid black;">Arrival</th><td style="border: 1px solid black;">${flightQtnObj.destinationCity}</td>
				</tr>
				<tr>	
					<th style="border: 1px solid black;">Departure Details</th><td style="border: 1px solid black;">${localDateTimeFormat.format(flightQtnObj.departureDate )} 	</td>
					<th style="border: 1px solid black;">Arrival Details</th><td style="border: 1px solid black;">${localDateTimeFormat.format(flightQtnObj.arrivalDate )} 	</td>
				</tr>
				<tr>	
					<th style="border: 1px solid black;">Adults</th><td height="50" style="border: 1px solid black;">${flightQtnObj.adultCount }		</td>
					<th style="border: 1px solid black;">Child | Infants</th><td style="border: 1px solid black;">${flightQtnObj.childCount }	| ${flightQtnObj.infantCount }	</td>
				</tr>
				<tr>	
					<th style="border: 1px solid black;">Stops</th><td style="border: 1px solid black;">${flightQtnObj.noOfStops }
					<th style="border: 1px solid black;">Travel Class</th><td style="border: 1px solid black;">${flightQtnObj.cabinClassName }</td>
				</tr>
				</table>	
			</td>
			</tr>
		</table>	
		<c:if test="${MANUAL_CNF.flightShowConnections eq true}">
				<br>
				<c:forEach items="${flightQtnObj.flightStopsQuotationsVoList}" var="flightStopDetailQtnObj">
				<h3><font color="black">Flight Stop Details</font></h3>
				<table style="width:80%;  background-color: lightblue; border: 3px solid #000000; margin-left: auto;margin-right: auto;" >
				<tr>
					<th colspan="1"><font size="4"><b>Airline</b></font></th><td>${flightStopDetailQtnObj.airlineName }</td>
					<th><font size="4"><b>Flight No. </b></font></th><td>${flightStopDetailQtnObj.flightNumber}</td>
					<th><font size="4"><b>Departure</b></font></th><td height="50">${flightStopDetailQtnObj.originCity }</td>
					<th><font size="4"><b>Arrival</b></font></th><td>${flightStopDetailQtnObj.destinationCity}</td>
					
				</tr>
				<tr>	
					
					<th><font size="4"><b>Arrival Details</b></font></th><td>${localDateTimeFormat.format(flightStopDetailQtnObj.arrivalDate )}</td>
					<th><font size="4"><b>Departure Details</b></font></th><td>${localDateTimeFormat.format(flightStopDetailQtnObj.departureDate )}</td>
					<th><font size="4"><b>Adults | Child | Infants</b></font></th><td height="50">${flightStopDetailQtnObj.adultCount }|${flightStopDetailQtnObj.childCount }|${flightStopDetailQtnObj.infantCount }</td>
					<th><font size="4"><b>Travel Class</b></font></th><td>${flightStopDetailQtnObj.cabinClassName }</td>
				</tr>
				
				</table>

			</c:forEach> 
		</c:if>
		<table style="width:100%;">
				<tr><td style="background-color:lightblue;" height="50">&nbsp;</td></tr>
				<tr><td style="background-color:white;" height="50">&nbsp;</td></tr>
		</table>
		<c:set var="count" value="${count + 1}" scope="page"/>
		</c:forEach>
		</b>
		</font>
		</td>
		</tr>
		<c:if test="${MANUAL_CNF.flightCancellationPolicyDisplay eq true}">
		<tr>
			<td style="background-color:red;color:white;" height="30"><b>Flight Remarks or Cancellation Details</b></td>
		</tr>
		<tr>
			<td style="background-color:white;text-align:left;">
				<p style="white-space: pre-line"><font size="4"><c:out value="${MANUAL_CNF.flightCancellationPolicy}"/></font></p>
			</td>
		</tr>
		</c:if>
		</table>
		
	