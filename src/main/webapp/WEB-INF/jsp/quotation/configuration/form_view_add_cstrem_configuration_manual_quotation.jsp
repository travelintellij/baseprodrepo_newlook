<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<jsp:include page="../../menu/MenuBuilder.jsp" />
  
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
  background: blue;
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
<h2 align="center">Configure Quotation Parameters</h2>
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
		<jsp:include page="../leadDetailsOpenNavView.jsp" />
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

<form:form modelAttribute="MANUAL_CNF" action="create_update_costing_remarks_manual_configuration_quotation">
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualConfigurationQuotationId" value= "${MANUAL_CNF.manualConfigurationQuotationId}" />


<div class="float-container">
  	<div class="float-child-left">
    <div class="green" >
   		<jsp:include page="../_quotationServicesMenu.jsp" />
    </div>
  	</div>

 	<div class="float-child-right">
    <div class="blue">
		
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	
	<hr/>
	
	
	
	<table style="width:70%;  table-layout:fixed;" >
	<tr>
		<c:if test="${QUOTATION_EXISTS eq true}">
		<td style="width:20%;">
			<!-- <a id="myBtn[${filteredLeads.leadId}]" onclick="myStopsDisplay(this)" data-load-url="form_view_quotation_modal?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}&manualConfigurationQuotationId=${MANUAL_CNF.manualConfigurationQuotationId}" data-toggle="modal" data-target="#myModal" ><input type="button" style="width:70%;background-color:#800000;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="View / Print Quotation" /></a> -->
			<a id="myBtn[${filteredLeads.leadId}]"  href="form_view_quotation_modal?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}&manualConfigurationQuotationId=${MANUAL_CNF.manualConfigurationQuotationId}" target="_new" ><input type="button" style="background-color:#800000;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Old View / Print Quotation" /></a>
		</td>
		<td><input type="submit" name="Generate Quotation" id="Generate Quotation" Value="Generate Quotation" style="background-color:#800000;color:white;font-weight: bold;font-weight: 600;font-size: 18px;"/></td>
		<td><a href="viewQuotation?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }&version=${QTN_OBJ.version}" target="_new"><input type="button" style="background-color:#800000;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="View" /></a></td>
		<td><a href="downloadQuotation?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }&version=${QTN_OBJ.version}"><input type="button" style="background-color:#800000;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Download" /></a></td>
		<td><a href="form_view_email_quotation?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }&version=${QTN_OBJ.version}"><input type="button" style="background-color:#800000;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Send Email" /></a></td>
		<td><a href="view_lead_quotations_list?leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:#800000;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="List Versions" /></a></td>
		</c:if>
		<c:if test="${QUOTATION_EXISTS eq false}">
			<td colspan="2">
				<!-- <a id="myBtn[${filteredLeads.leadId}]" onclick="myStopsDisplay(this)" data-load-url="form_view_quotation_modal?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}&manualConfigurationQuotationId=${MANUAL_CNF.manualConfigurationQuotationId}" data-toggle="modal" data-target="#myModal" ><input type="button" style="width:70%;background-color:#800000;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="View / Print Quotation" /></a> -->
				<a id="myBtn[${filteredLeads.leadId}]"  href="form_view_quotation_modal?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}&manualConfigurationQuotationId=${MANUAL_CNF.manualConfigurationQuotationId}" target="_new" ><input type="button" style="width:70%;background-color:#800000;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Old View / Print Quotation" /></a>
			</td>
			<td colspan="2"><input type="submit" name="Generate Quotation" id="Generate Quotation" Value="Generate Quotation" style="background-color:#800000;color:white;font-weight: bold;font-weight: 600;font-size: 18px;"/></td>
			<td colspan="2"><a href="view_lead_quotations_list?leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:#800000;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="List Versions" /></a></td>
		</c:if>
		
	</tr>
	
	<tr>
	<td style="background-color:green;" colspan="3">
		<a href="form_view_configure_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="General Configuration Section" /></a>
	</td>
	<td style="background-color:green;" colspan="3">
		<a href="#"><input type="button" style="opacity: 0.6;cursor: not-allowed;width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Costing & Remarks Section" /></a>
	</td>
	</tr>

	</table>

	<table style="width:70%;  table-layout:fixed;background-color:white;" >
		<c:set var="grandTotalCost"  value="0" scope="page"/>
		<c:set var="grandTotalMarkup" value="0" scope="page"/>
		
		<c:if test="${QTN_OBJ.flight eq true}">
			<c:set var = "totalFlightCost" scope = "page" value = "0"/>
			<c:set var = "totalFlightMarkup" scope = "page" value = "0"/>
			<c:forEach var="flightList" items="${QTN_OBJ.manualQuotationsVoList}">
				<c:set var="totalFlightCost" value="${totalFlightCost + flightList.flightCost}" scope="page"/>
				<c:set var="totalFlightMarkup" value="${totalFlightMarkup + flightList.flightMarkup}" scope="page"/>
			</c:forEach>
			<tr>
				<th colspan="2" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <a href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Flight" /></a></th>
			</tr>	
			<tr>
				<th style="background-color: #C0C0C0;color:black;"> Flight Total Cost </th>
				<td>
					INR <c:out value = "${totalFlightCost}"/>
				</td>
			</tr>
			<tr>
				<th style="background-color: #C0C0C0;color:black;"> Flight Total Markup</th>
				<td>INR <c:out value = "${totalFlightMarkup}"/></td>
			</tr>
			<tr>
				<th style="background-color: gray;color:black;"> Grand Total (Flight)</th>
				<td style="background-color: LIGHTCORAL;color:white;">INR <c:out value = "${totalFlightCost + totalFlightMarkup}"/></td>
			</tr>
			<c:set var="grandTotalCost"  value="${grandTotalCost + totalFlightCost}" scope="page"/>
			<c:set var="grandTotalMarkup" value="${grandTotalMarkup + totalFlightMarkup}" scope="page"/>
		</c:if>

		<c:if test="${QTN_OBJ.hotel eq true}">
			
			<tr>
				<th colspan="2" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <a href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Hotel" /></a></th>
			</tr>	
			
			
			 <c:forEach items="${QTN_OBJ.hotelOptionsWiseMap}" var="entry">
    				<c:set var = "totalHotelCost" scope = "page" value = "0"/>
					<c:set var = "totalHotelMarkup" scope = "page" value = "0"/>
	        		<tr><th colspan="2" style="background-color: blue;color:white;">Option (${entry.key})</th></tr>
	        			<c:forEach var="hotelObj" items="${entry.value}">
							<c:set var="totalHotelCost" value="${totalHotelCost + hotelObj.hotelStayCost}" scope="page"/>
							<c:set var="totalHotelMarkup" value="${totalHotelMarkup + hotelObj.hotelStayMarkup}" scope="page"/>
	        			</c:forEach>
	        			<tr>
							<th style="background-color: #C0C0C0;color:black;"> Hotel Total Cost </th>
							<td>
									INR <c:out value = "${totalHotelCost}"/>
							</td>
							</tr>
							<tr>
								<th style="background-color: #C0C0C0;color:black;"> Hotel Total Markup</th>
								<td>INR <c:out value = "${totalHotelMarkup}"/></td>
							</tr>
							<tr>
								<th style="background-color: gray;color:black;"> Grand Total (Hotel)</th>
								<td style="background-color: LIGHTCORAL;color:white;">INR <c:out value = "${totalHotelCost + totalHotelMarkup}"/></td>
							</tr>
			</c:forEach>
			
			
		</c:if>
		
		<c:if test="${QTN_OBJ.transfers eq true}">
			<c:set var = "totalTransfersCost" scope = "page" value = "0"/>
			<c:set var = "totalTransfersMarkup" scope = "page" value = "0"/>
			<c:forEach var="transfersList" items="${QTN_OBJ.transferVoList}">
				<c:set var="totalTransfersCost" value="${totalTransfersCost + transfersList.transferCost}" scope="page"/>
				<c:set var="totalTransfersMarkup" value="${totalTransfersMarkup + transfersList.transferMarkup}" scope="page"/>
			</c:forEach>
			<tr>
				<th colspan="2" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <a href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Transfers" /></a></th>
			</tr>	
			<tr>
				<th style="background-color: #C0C0C0;color:black;"> Transfers Total Cost </th>
				<td>
					INR <c:out value = "${totalTransfersCost}"/>
				</td>
			</tr>
			<tr>
				<th style="background-color: #C0C0C0;color:black;"> Transfers Total Markup</th>
				<td>INR <c:out value = "${totalTransfersMarkup}"/></td>
			</tr>
			<tr>
				<th style="background-color: gray;color:black;"> Grand Total (Transfers)</th>
				<td style="background-color: LIGHTCORAL;color:white;">INR <c:out value = "${totalTransfersCost + totalTransfersMarkup}"/></td>
			</tr>
			<c:set var="grandTotalCost"  value="${grandTotalCost + totalTransfersCost}" scope="page"/>
			<c:set var="grandTotalMarkup" value="${grandTotalMarkup + totalTransfersMarkup}" scope="page"/>
		</c:if>
		
		<c:if test="${QTN_OBJ.sightseeing eq true}">
			<c:set var = "totalSightSeeingCost" scope = "page" value = "0"/>
			<c:set var = "totalSightSeeingMarkup" scope = "page" value = "0"/>
			<c:forEach var="sightSeeingList" items="${QTN_OBJ.sightSeeingVoList}">
				<c:set var="totalSightSeeingCost" value="${totalSightSeeingCost + sightSeeingList.sightSeeingCost}" scope="page"/>
				<c:set var="totalSightSeeingMarkup" value="${totalSightSeeingMarkup + sightSeeingList.sightSeeingMarkup}" scope="page"/>
			</c:forEach>
			<tr>
				<th colspan="2" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <a href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Sight-Seeing" /></a></th>
			</tr>	
			<tr>
				<th style="background-color: #C0C0C0;color:black;"> Sight-Seeing Total Cost </th>
				<td>
					INR <c:out value = "${totalSightSeeingCost}"/>
				</td>
			</tr>
			<tr>
				<th style="background-color: #C0C0C0;color:black;"> Sight-Seeing Total Markup</th>
				<td>INR <c:out value = "${totalSightSeeingMarkup}"/></td>
			</tr>
			<tr>
				<th style="background-color: gray;color:black;"> Grand Total ( Sight-Seeing )</th>
				<td style="background-color: LIGHTCORAL;color:white;">INR <c:out value = "${totalSightSeeingCost + totalSightSeeingMarkup}"/></td>
			</tr>
			
			<c:set var="grandTotalCost"  value="${grandTotalCost + totalSightSeeingCost}" scope="page"/>
			<c:set var="grandTotalMarkup" value="${grandTotalMarkup + totalSightSeeingMarkup}" scope="page"/>
			
		</c:if>


	<c:if test="${QTN_OBJ.visa eq true}">
		<c:set var = "totalVisaCost" scope = "page" value = "0"/>
		<c:set var = "totalVisaMarkup" scope = "page" value = "0"/>
		<c:forEach var="visaList" items="${QTN_OBJ.visaVoList}">
			<c:set var="totalVisaCost" value="${totalVisaCost + visaList.visaCost}" scope="page"/>
			<c:set var="totalVisaMarkup" value="${totalVisaMarkup + visaList.visaMarkup}" scope="page"/>
		</c:forEach>
		<tr>
			<th colspan="2" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <a href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Visa" /></a></th>
		</tr>	
		<tr>
			<th style="background-color: #C0C0C0;color:black;"> Visa Total Cost </th>
			<td>
				INR <c:out value = "${totalVisaCost}"/>
			</td>
		</tr>
		<tr>
			<th style="background-color: #C0C0C0;color:black;"> Visa Total Markup</th>
			<td>INR <c:out value = "${totalVisaMarkup}"/></td>
		</tr>
		<tr>
			<th style="background-color: gray;color:black;"> Grand Total ( Visa )</th>
			<td style="background-color: LIGHTCORAL;color:white;">INR <c:out value = "${totalVisaCost + totalVisaMarkup}"/></td>
		</tr>
		
		<c:set var="grandTotalCost"  value="${grandTotalCost + totalVisaCost}" scope="page"/>
		<c:set var="grandTotalMarkup" value="${grandTotalMarkup + totalVisaMarkup}" scope="page"/>
		
	</c:if>
	
	<c:if test="${QTN_OBJ.insurance eq true}">
		<c:set var = "totalInsuranceCost" scope = "page" value = "0"/>
		<c:set var = "totalInsuranceMarkup" scope = "page" value = "0"/>
		<c:forEach var="insuranceList" items="${QTN_OBJ.insuranceVoList}">
			<c:set var="totalInsuranceCost" value="${totalInsuranceCost + insuranceList.premiumCost}" scope="page"/>
			<c:set var="totalInsuranceMarkup" value="${totalInsuranceMarkup + insuranceList.premiumMarkup}" scope="page"/>
		</c:forEach>
		<tr>
			<th colspan="2" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <a href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Insurance" /></a></th>
		</tr>	
		<tr>
			<th style="background-color: #C0C0C0;color:black;"> Insurance Total Cost </th>
			<td>
				INR <c:out value = "${totalInsuranceCost}"/>
			</td>
		</tr>
		<tr>
			<th style="background-color: #C0C0C0;color:black;"> Insurance Total Markup</th>
			<td>INR <c:out value = "${totalInsuranceMarkup}"/></td>
		</tr>
		<tr>
			<th style="background-color: gray;color:black;"> Grand Total ( Insurance )</th>
			<td style="background-color: LIGHTCORAL;color:white;">INR <c:out value = "${totalInsuranceCost + totalInsuranceMarkup}"/></td>
		</tr>
		<c:set var="grandTotalCost"  value="${grandTotalCost + totalInsuranceCost}" scope="page"/>
		<c:set var="grandTotalMarkup" value="${grandTotalMarkup + totalInsuranceMarkup}" scope="page"/>
	
	</c:if>
		
		
	<c:if test="${QTN_OBJ.cruise eq true}">
		<c:set var = "totalCruiseCost" scope = "page" value = "0"/>
		<c:set var = "totalCruiseMarkup" scope = "page" value = "0"/>
		<c:forEach var="cruiseList" items="${QTN_OBJ.cruiseVoList}">
			<c:set var="totalCruiseCost" value="${totalCruiseCost + cruiseList.cruiseStayCost}" scope="page"/>
			<c:set var="totalCruiseMarkup" value="${totalCruiseMarkup + cruiseList.cruiseStayMarkup}" scope="page"/>
		</c:forEach>
		<tr>
			<th colspan="2" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <a href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Cruise" /></a></th>
		</tr>	
		<tr>
			<th style="background-color: #C0C0C0;color:black;"> Cruise Total Cost </th>
			<td>
				INR <c:out value = "${totalCruiseCost}"/>
			</td>
		</tr>
		<tr>
			<th style="background-color: #C0C0C0;color:black;"> Cruise Total Markup</th>
			<td>INR <c:out value = "${totalCruiseMarkup}"/></td>
		</tr>
		<tr>
			<th style="background-color: gray;color:black;"> Grand Total ( Cruise )</th>
			<td style="background-color: LIGHTCORAL;color:white;">INR <c:out value = "${totalCruiseCost + totalCruiseMarkup}"/></td>
		</tr>
		<c:set var="grandTotalCost"  value="${grandTotalCost + totalCruiseCost}" scope="page"/>
		<c:set var="grandTotalMarkup" value="${grandTotalMarkup + totalCruiseMarkup}" scope="page"/>

	</c:if>
	
	<c:if test="${QTN_OBJ.tourPackage eq true}">
		<c:set var = "totalPackageCost" scope = "page" value = "0"/>
		<c:set var = "totalPackageMarkup" scope = "page" value = "0"/>
		<c:forEach var="packageList" items="${QTN_OBJ.tourPackageVoList}">
			<c:set var="totalPackageCost" value="${totalPackageCost + packageList.pkgCost}" scope="page"/>
			<c:set var="totalPackageMarkup" value="${totalPackageMarkup + packageList.pkgMarkup}" scope="page"/>
		</c:forEach>
		<tr>
			<th colspan="2" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <a href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Tour Package" /></a></th>
		</tr>	
		<tr>
			<th style="background-color: #C0C0C0;color:black;"> Tour Package Total Cost </th>
			<td>
				INR <c:out value = "${totalPackageCost}"/>
			</td>
		</tr>
		<tr>
			<th style="background-color: #C0C0C0;color:black;"> Tour Package Total Markup</th>
			<td>INR <c:out value = "${totalPackageMarkup}"/></td>
		</tr>
		<tr>
			<th style="background-color: gray;color:black;"> Grand Total ( Tour Package )</th>
			<td style="background-color: LIGHTCORAL;color:white;">INR <c:out value = "${totalPackageCost + totalPackageMarkup}"/></td>
		</tr>
		<c:set var="grandTotalCost"  value="${grandTotalCost + totalPackageCost}" scope="page"/>
		<c:set var="grandTotalMarkup" value="${grandTotalMarkup + totalPackageMarkup}" scope="page"/>
	</c:if>
	
	<c:if test="${QTN_OBJ.others eq true}">
		<c:set var = "totalOthersCost" scope = "page" value = "0"/>
		<c:set var = "totalOthersMarkup" scope = "page" value = "0"/>
		<c:forEach var="otherList" items="${QTN_OBJ.otherVoList}">
			<c:set var="totalOthersCost" value="${totalOthersCost + otherList.serviceCost}" scope="page"/>
			<c:set var="totalOthersMarkup" value="${totalOthersMarkup + otherList.serviceMarkup}" scope="page"/>
		</c:forEach>
		<tr>
			<th colspan="2" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <a href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Other Services" /></a></th>
		</tr>	
		<tr>
			<th style="background-color: #C0C0C0;color:black;"> Other Services Total Cost </th>
			<td>
				INR <c:out value = "${totalOthersCost}"/>
			</td>
		</tr>
		<tr>
			<th style="background-color: #C0C0C0;color:black;"> Other Services Total Markup</th>
			<td>INR <c:out value = "${totalOthersMarkup}"/></td>
		</tr>
		<tr>
			<th style="background-color: gray;color:black;"> Grand Total ( Other Services )</th>
			<td style="background-color: LIGHTCORAL;color:white;">INR <c:out value = "${totalOthersCost + totalOthersMarkup}"/></td>
		</tr>
		
		<c:set var="grandTotalCost"  value="${grandTotalCost + totalOthersCost}" scope="page"/>
		<c:set var="grandTotalMarkup" value="${grandTotalMarkup + totalOthersMarkup}" scope="page"/>
			
	</c:if>
	<tr><th colspan="2">Remarks</th></tr>
	<tr><td colspan="2"><form:textarea path="remarks" rows="10" cols="100" /></td></tr>

	<tr>
		<td colspan="2">
		<table>
			<fmt:setLocale value = "en_IN"/>
			<tr><th colspan="2" style="background-color:blue; "></th></tr>
		
		
		
		 <c:forEach items="${QTN_OBJ.hotelOptionsWiseMap}" var="entry">
    				<c:set var = "totalHotelChotelOptionsWiseMapost" scope = "page" value = "0"/>
					<c:set var = "totalHotelMarkup" scope = "page" value = "0"/>
					<c:set var = "totalHotelCost" scope = "page" value = "0"/>
					<c:forEach var="hotelObj" items="${entry.value}">
							<c:set var="totalHotelCost" value="${totalHotelCost + hotelObj.hotelStayCost}" scope="page"/>
							<c:set var="totalHotelMarkup" value="${totalHotelMarkup + hotelObj.hotelStayMarkup}" scope="page"/>
	        		</c:forEach>
	        		<tr>
	        			<th colspan="2" style="background-color: blue;color:white;">Grand Total with Hotel Option (${entry.key})</th>
	        		</tr>
					<tr>
						<th style="width:50%;background-color:#808000;">Total NETT Cost : </th> 
						<td><fmt:formatNumber value = "${grandTotalCost + totalHotelCost}" type = "currency" currencySymbol="INR " /></td>
					</tr>
			
					<tr>
						<th style="width:50%;background-color:#808000;">Total Markup : </th> 
						<td><fmt:formatNumber value = "${grandTotalMarkup + totalHotelMarkup}" type = "currency" currencySymbol="INR " /></td>
					</tr>
					<tr> 
						<th style="width:50%;background-color:#808000;">Total Quotation Amount : </th>
						<td style="background-color:lawngreen;color:black;">
							<fmt:formatNumber value = "${grandTotalCost + grandTotalMarkup + totalHotelCost + totalHotelMarkup}" type = "currency" currencySymbol="INR " />
						</td>
					</tr>
				</c:forEach>
			<tr> 
				<td colspan="2">
					<input type="submit" name="Save Configuration" id="Save Configuration" Value="Save Configuration" />
					<!--
					<a href="form_view_configure_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
					 
					
					<a href="form_view_delete_confirm_configure_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:red;" value="Restore Default" /></a>
					 -->
				</td>
			</tr>

			
			
		</table>
			</td>
		</tr>
		
	</table>
   	</div>
   	</div>
</div>

<div id="myModal" class="modal">	
		  <!-- Modal content -->
		  <div class="modal-content">
		    <div class="modal-header">
		      <span class="close">&times;</span>
		      <br><h2 style="text-align:center;">View Hotel Details</h2>
		    </div>
		    <div class="modal-body">
		
		
		    </div>
		    <div class="modal-footer">
		      <h3 align="center">Powered by @TravelIntelliJ</h3>
		    </div>
		  </div>
	</div>
    
 </form:form>

<script>
// Get the modal
var modal = document.getElementById("myModal");
// Get the button that opens the modal
var btn = document.getElementById("myBtn");
// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];
function myStopsDisplay(clicked) { 
	//alert(clicked); 
	$("#myModal .modal-body").load($(clicked).attr('data-load-url'));
	modal.style.display = "block";
}   
// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

$(document).ready(function() {
	check();
});
function check(){
	if ($("input[name='flightCancellationPolicyDisplay']:checked").val()=="true") {
		$("#displayFlightCancellationHeader").show();
		$("#displayFlightCancellationTextArea").show();
	}
	if ($("input[name='flightCancellationPolicyDisplay']:checked").val()=="false") {
		$("#displayFlightCancellationHeader").hide();
		$("#displayFlightCancellationTextArea").hide();
	}

	if ($("input[name='hotelCancellationPolicyDisplay']:checked").val()=="true") {
		$("#displayHotelCancellationHeader").show();
		$("#displayHotelCancellationTextArea").show();
	}
	if ($("input[name='hotelCancellationPolicyDisplay']:checked").val()=="false") {
		$("#displayHotelCancellationHeader").hide();
		$("#displayHotelCancellationTextArea").hide();
	}

	if ($("input[name='transfersCancellationPolicyDisplay']:checked").val()=="true") {
		$("#displayTransfersCancellationHeader").show();
		$("#displayTransfersCancellationTextArea").show();
	}
	if ($("input[name='transfersCancellationPolicyDisplay']:checked").val()=="false") {
		$("#displayTransfersCancellationHeader").hide();
		$("#displayTransfersCancellationTextArea").hide();
	}

	if ($("input[name='sightSeeingCancellationPolicyDisplay']:checked").val()=="true") {
		$("#displaySigtSeeingCancellationHeader").show();
		$("#displaySightSeeingCancellationTextArea").show();
	}
	if ($("input[name='sightSeeingCancellationPolicyDisplay']:checked").val()=="false") {
		$("#displaySigtSeeingCancellationHeader").hide();
		$("#displaySightSeeingCancellationTextArea").hide();
	}


	if ($("input[name='visaAdditionalDetailsDisplay']:checked").val()=="true") {
		$("#displayVisaAdditionalHeader").show();
		$("#displayVisaAdditionalTextArea").show();
	}
	if ($("input[name='visaAdditionalDetailsDisplay']:checked").val()=="false") {
		$("#displayVisaAdditionalHeader").hide();
		$("#displayVisaAdditionalTextArea").hide();
	}

	if ($("input[name='visaCancellationPolicyDisplay']:checked").val()=="true") {
		$("#displayVisaCancellationHeader").show();
		$("#displayVisaCancellationTextArea").show();
	}
	if ($("input[name='visaCancellationPolicyDisplay']:checked").val()=="false") {
		$("#displayVisaCancellationHeader").hide();
		$("#displayVisaCancellationTextArea").hide();
	}

	if ($("input[name='insuranceCancellationPolicyDisplay']:checked").val()=="true") {
		$("#displayInsuranceCancellationHeader").show();
		$("#displayInsuranceCancellationTextArea").show();
	}
	if ($("input[name='insuranceCancellationPolicyDisplay']:checked").val()=="false") {
		$("#displayInsuranceCancellationHeader").hide();
		$("#displayInsuranceCancellationTextArea").hide();
	}
	

	if ($("input[name='cruiseCancellationPolicyDisplay']:checked").val()=="true") {
		$("#displayCruiseCancellationHeader").show();
		$("#displayCruiseCancellationTextArea").show();
	}
	if ($("input[name='cruiseCancellationPolicyDisplay']:checked").val()=="false") {
		$("#displayCruiseCancellationHeader").hide();
		$("#displayCruiseCancellationTextArea").hide();
	}


	if ($("input[name='packageCancellationPolicyDisplay']:checked").val()=="true") {
		$("#displayTourPackageCancellationHeader").show();
		$("#displayTourPackageCancellationTextArea").show();
	}
	if ($("input[name='packageCancellationPolicyDisplay']:checked").val()=="false") {
		$("#displayTourPackageCancellationHeader").hide();
		$("#displayTourPackageCancellationTextArea").hide();
	}


	if ($("input[name='otherCancellationPolicyDisplay']:checked").val()=="true") {
		$("#displayOtherCancellationHeader").show();
		$("#displayOtherCancellationTextArea").show();
	}
	if ($("input[name='otherCancellationPolicyDisplay']:checked").val()=="false") {
		$("#displayOtherCancellationHeader").hide();
		$("#displayOtherCancellationTextArea").hide();
	}
	
}
</script>
</body>
</html>
  