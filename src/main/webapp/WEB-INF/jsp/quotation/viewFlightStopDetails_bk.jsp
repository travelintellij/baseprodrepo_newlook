<!DOCTYPE html>
<html>
<jsp:include page="../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>


<style>
table {
  width: 100%;
  height: 40px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 35px auto;
  background: white;
    
}

th {
  background: #9999ff;
  height: 30px;
  width: 15%;
  font-weight: bold;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
  height: 30px;
}
tr {
  border-bottom: 1px solid #cccccc;
}

td {
  border-right: 1px solid #cccccc;
  padding: 10px;
  transition: all 0.2s;
  text-align: center;
  height: 30px;
  font-size: 16px;
  font-weight:bold;
}
input[type=button], input[type=submit], input[type=reset] {
  background-color: green;
  border: none;
  color: white;
  padding: 10px 20px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}

.sidenav {
	height: 70%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 118;
	left: 0; //
	//background-color: #111;
	background-color: lightblue;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 30px;
	text-align: center;
}

.sidenav a {
	padding: 4px 4px 4px 16px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover {
	color: #f1f1f1;
	
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

.float-container {
    //border: 3px solid #fff;
    padding: 15px;
}

.float-child-left {
    width: 20%;
    float: left;
    padding: 20px;
    //border: 2px solid red;
}

.float-child-right {
    width: 80%;
    float: center;
    //padding: 50px;
    //border: 2px solid red;
}  
  ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
}

li {
  float: left;
}

li a {
  display: block;
  padding: 20px;
  background-color: #dddddd;
}
</style>
<br>
<h2 align="center">View Flight Quotation Details </h2>
<body>
<form:form modelAttribute="QTN_OBJ" action="create_create_lead_quotation">
	<table style="width:45%;margin: auto;">
		<tr>
		<th style="background: #FFC300;color:black;"> Quotation Id </th><td>${QTN_OBJ.quotationId}</td>
		<th style="background: #FFC300;color:black;"> Version Id </th><td>${QTN_OBJ.version}</td>
		</tr>
	</table>
</form:form>


<form:form modelAttribute="LEAD_OBJ" action="create_create_lead_quotation">
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<jsp:include page="leadDetailsOpenNavView.jsp" />
	</div>
	<h3><font color="red">View Lead Details </font>	</h3>
	<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;
		 Quick Lead View</span>
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "35%";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
	</script>
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
</form:form>

<div class="float-container">
  	<div class="float-child-left">
    <div class="green" >
   		<jsp:include page="_quotationServicesMenu.jsp" />
    </div>
  	</div>

 	<div class="float-child-right">
    
    <div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<table style="width:70%;  table-layout:fixed;background-color:#cc3300;" >
	<tr><td><b><font color="white">Main Flight Detail</font></b>	  
			<table style="width:100%;  table-layout:fixed;" >
			<tr>
				<th style="background-color:blue;"><font size="4"><b>Id-  ${MANUAL_FLT.manualFlightQuotationId}</b></font></th>
				<th colspan="1"><font size="4"><b>Airline</b></font></th>
				<td>${MANUAL_FLT.airlineName }</td>
				<th><font size="4"><b>Flight No. </b></font></th>
				<td > ${MANUAL_FLT.flightNumber }</td>
			</tr>
			<tr>	
				<th><font size="4"><b>Departure</b></font></th>
				<th><font size="4"><b>Arrival</b></font></th>
				<th><font size="4"><b>Departure Details</b></font></th>
				<th><font size="4"><b>Arrival Details</b></font></th>
				<th><font size="4"><b>Duration</b></font></th>
			</tr>
			<tr>	
				<td>	${MANUAL_FLT.originCity }				</td>
				<td>	 	${MANUAL_FLT.destinationCity}				</td>
				<td>${localDateTimeFormat.format(MANUAL_FLT.departureDate )} 	</td>
				<td>${localDateTimeFormat.format(MANUAL_FLT.arrivalDate )} 	</td>
				<td>${MANUAL_FLT.duration }				</td>
			</tr>
			<tr>	
				<th><font size="4"><b>Adults</b></font></th>
				<th><font size="4"><b>Child</b></font></th>
				<th><font size="4"><b>Infants</b></font></th>
				<th><font size="4"><b>Stops</b></font></th>
				<th><font size="4"><b>Travel Class</b></font></th>
			</tr>
			<tr>	
				<td>${MANUAL_FLT.adultCount }		</td>
				<td>${MANUAL_FLT.childCount }		</td>
				<td>${MANUAL_FLT.infantCount }		</td>
				<td>${MANUAL_FLT.noOfStops }		</td>
				<td>${MANUAL_FLT.cabinClassName }</td>
			</tr>
			<tr>	
				<th colspan="2"><font size="4"><b>Total Flight Cost</b></font></th>
				<th colspan="2"><font size="4"><b>Total Flight Markup</b></font></th>
				<th><font size="4"><b>Display Order</b></font></th>
			</tr>
			<tr>	
				<td colspan="2">${MANUAL_FLT.flightCost}		</td>
				<td colspan="2">${MANUAL_FLT.flightMarkup }		</td>
				<td>${MANUAL_FLT.displayOrder }		</td>
			</tr>
			<tr>
				<th colspan="5">
					<c:if test="${ MANUAL_FLT.flightStopsQuotationsVoList.size() le MANUAL_FLT.noOfStops }">
						<c:if test="${QTN_OBJ.converted ne true }">
							<a href="form_view_add_flight_stop_quotation?manualFlightQuotationId=${MANUAL_FLT.manualFlightQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:blue;" value="Add Stop" /></a>
						</c:if>
						<c:if test="${QTN_OBJ.converted eq true }">
							<a ><input type="button" style="background-color:lightgray;" value="Add Stop" /></a>
						</c:if>
					</c:if>
					<c:if test="${QTN_OBJ.converted ne true }">
						<a href="form_view_edit_manual_flight_quotation?manualFlightQuotationId=${MANUAL_FLT.manualFlightQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:blue;" value="Edit Flight" /></a>
						<a href="form_view_delete_manual_flight_quotation?manualFlightQuotationId=${MANUAL_FLT.manualFlightQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:red;" value="Delete Flight" /></a>
						<a href="form_view_flight_quotation_details?quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
					</c:if>
					<c:if test="${QTN_OBJ.converted eq true }">
						<a><input type="button" style="background-color:lightgray;" value="Edit Flight" /></a>
						<a><input type="button" style="background-color:lightgray;" value="Delete Flight" /></a>
						<a href="form_view_flight_quotation_details?quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
					</c:if>
					
				</th>
			</tr>
		</table>	
		</td>
		</tr>

		<tr style="background-color: lightblue;">
		<td>Stops Details </td></tr>
		<tr style="background-color: lightblue; border: 1px solid black;"><td style=" border: 1px solid black;">

			<c:if test="${FLT_STOP_ACTION eq 'ADD'}">
				<jsp:include page="manualflight/form_view_add_flight_stop.jsp" />
			</c:if>
			
			
			

			<c:forEach items="${MANUAL_FLT.flightStopsQuotationsVoList}" var="flightStopDetailQtnObj">
				<c:choose>
				<c:when test="${flightStopDetailQtnObj.fltQuotationStopId eq FLT_STOP.fltQuotationStopId  && FLT_STOP_ACTION eq 'EDIT' }">
					<jsp:include page="manualflight/form_view_edit_flight_stop.jsp" />
				</c:when> 
				<c:when test="${flightStopDetailQtnObj.fltQuotationStopId eq FLT_STOP.fltQuotationStopId  && FLT_STOP_ACTION eq 'DELETE' }">
					<jsp:include page="manualflight/form_view_delete_flight_stop.jsp" />
				</c:when> 
				
				<c:otherwise>
			
				<table style="width:90%;  table-layout:fixed;background-color: lightblue; border: 3px solid #000000; border-collapse: collapse" >
				<tr>
					<th style="background-color:#800000"><font size="4"><b>Flight Stop Id-  ${flightStopDetailQtnObj.fltQuotationStopId}</b></font></th>
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
  