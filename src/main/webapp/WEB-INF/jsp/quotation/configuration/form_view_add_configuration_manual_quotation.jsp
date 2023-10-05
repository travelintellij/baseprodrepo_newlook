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

<form:form modelAttribute="MANUAL_CNF" action="create_update_generate_manual_configuration_quotation">

	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualConfigurationQuotationId" value= "${MANUAL_CNF.manualConfigurationQuotationId}" />
	<form:hidden path = "totalQuotationAmount" />
	<form:hidden path = "remarks" />
	
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
		<a href="#"><input type="button" style="opacity: 0.6;cursor: not-allowed;width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="General Configuration Section" /></a>
	</td>
	<td style="background-color:green;" colspan="3">
	
		<a href="form_view_cost_remarks_configure_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Costing & Remarks Section" /></a>
	</td>
	</tr>

	</table>

	<table style="width:70%;  table-layout:fixed;background-color:lightgray;" >
	<tr><th>
	<b>Quotation Partner Header :</b>
	</th><td>
		<div class="select">
			<form:select path="partnerId" required="required" style="width: 200px;">  
				<option class="service-small" value="" selected>Please Select</option>
				<form:options items = "${B2B_PARTNERS_MAP}" class="service-small"/>
			</form:select>  
		</div>
	</td>
	<th>Logo Header</th>
	<td>
		<form:radiobutton path="logoHeader" id="logoHeaderTrue" name="logoHeader" value="true"/> <label for="logoHeaderTrue" class="radio">Yes</label> 
		<form:radiobutton path="logoHeader" id="logoHeaderFalse" name="logoHeader" value="false"/> <label for="logoHeaderFalse" class="radio">No</label> 
	</td>
	<th>Complete Address</th>
	<td>
		<form:radiobutton path="completeAddress" id="completeAddressTrue" name="completeAddress" value="true"/> <label for="completeAddressTrue" class="radio">Yes</label> 
		<form:radiobutton path="completeAddress" id="completeAddressFalse" name="completeAddress" value="false"/> <label for="completeAddressFalse" class="radio">No</label> 
	
	</td>
	</tr>
		<c:if test="${QTN_OBJ.flight eq true}">
			<tr>
				<th colspan="6" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" ><input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Flight" /></th>
			</tr>	
			<tr>
				<th colspan="3"> Show Flight Stop Details </th>
				<td colspan="3">
					<form:radiobutton path="flightShowConnections" id="showconnectiontrue" name="flightShowConnections" value="true"/> <label for="showconnectiontrue" class="radio">Yes</label> 
					<form:radiobutton path="flightShowConnections" id="showconnectionfalse" name="flightShowConnections" value="false"/> <label for="showconnectionfalse" class="radio">No</label> 
				</td>
			</tr>
			<tr>
				<th colspan="3"> Display Separate Cost </th>
				<td colspan="3">
					<form:radiobutton path="flightSeperateCostDisplay" id="showseperatecosttrue" name="flightSeperateCostDisplay" value="true"/> <label for="showseperatecosttrue" class="radio">Yes</label> 
					<form:radiobutton path="flightSeperateCostDisplay" id="showseperatecostfalse" name="flightSeperateCostDisplay" value="false"/> <label for="showseperatecostfalse" class="radio">No</label> 
				</td>
			</tr>
			<tr>
				<th colspan="3"> Show GST Breakup </th>
				<td colspan="3">
					<form:radiobutton path="flightGstBreakup" id="flightGstBreakupTrue" name="flightGstBreakup" value="true"/> <label for="flightGstBreakupTrue" class="radio">Yes</label> 
					<form:radiobutton path="flightGstBreakup" id="flightGstBreakupFalse" name="flightGstBreakup" value="false"/> <label for="flightGstBreakupFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr>
				<th colspan="3"> Display Remarks / Cancellation Policy </th>
				<td colspan="3">
					<form:radiobutton path="flightCancellationPolicyDisplay" id="flightCancellationPolicyDisplayTrue" name="flightCancellationPolicyDisplay" value="true" onclick="check();" /> <label for="flightCancellationPolicyDisplayTrue" class="radio">Yes</label> 
					<form:radiobutton path="flightCancellationPolicyDisplay" id="flightCancellationPolicyDisplayFalse" name="flightCancellationPolicyDisplay" value="false" onclick="check();" /> <label for="flightCancellationPolicyDisplayFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr id="displayFlightCancellationHeader">
				<th style="background-color:lightblue;color:black;" colspan="6"> Flight Remarks / Cancellation Policy </th>
			</tr>
			<tr id="displayFlightCancellationTextArea">
				<td colspan="6">
					<form:textarea path="flightCancellationPolicy" rows="10" cols="100" />
				</td>
			</tr>	
		</c:if>
	
		<c:if test="${QTN_OBJ.hotel eq true}">
			<tr>
				<th colspan="6" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Hotel" /></th>
			</tr>	
			<tr>
				<th colspan="3"> Display Hotel Separate Cost </th>
				<td colspan="3">
					<form:radiobutton path="hotelSeperateCostDisplay" id="hotelSeperateCostDisplayTrue" name="hotelSeperateCostDisplay" value="true"/> <label for="hotelSeperateCostDisplayTrue" class="radio">Yes</label> 
					<form:radiobutton path="hotelSeperateCostDisplay" id="hotelSeperateCostDisplayFalse" name="hotelSeperateCostDisplay" value="false"/> <label for="hotelSeperateCostDisplayFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr>
				<th colspan="3"> Show Hotel GST Breakup </th>
				<td colspan="3">
					<form:radiobutton path="hotelGstBreakup" id="hotelGstBreakupTrue" name="hotelGstBreakup" value="true"/> <label for="hotelGstBreakupTrue" class="radio">Yes</label> 
					<form:radiobutton path="hotelGstBreakup" id="hotelGstBreakupFalse" name="hotelGstBreakup" value="false"/> <label for="hotelGstBreakupFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr>
				<th colspan="3"> Display Hotel Remarks / Cancellation Policy </th>
				<td colspan="3">
					<form:radiobutton path="hotelCancellationPolicyDisplay" id="hotelCancellationPolicyDisplayTrue" name="hotelCancellationPolicyDisplay" value="true" onclick="check();" /> <label for="hotelCancellationPolicyDisplayTrue" class="radio">Yes</label> 
					<form:radiobutton path="hotelCancellationPolicyDisplay" id="hotelCancellationPolicyDisplayFalse" name="hotelCancellationPolicyDisplay" value="false" onclick="check();" /> <label for="hotelCancellationPolicyDisplayFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr id="displayHotelCancellationHeader">
				<th style="background-color:lightblue;color:black;" colspan="6"> Hotel Remarks / Cancellation Policy </th>
			</tr>
			<tr id="displayHotelCancellationTextArea">
				<td colspan="6">
					<form:textarea path="hotelCancellationPolicy" rows="10" cols="100" />
				</td>
			</tr>	
		</c:if>
		
		<c:if test="${QTN_OBJ.transfers eq true}">
			<tr>
				<th colspan="6" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Transfers" /></th>
			</tr>	
			<tr>
				<th colspan="3"> Display Transfers Separate Cost </th>
				<td colspan="3">
					<form:radiobutton path="transfersSeperateCostDisplay" id="transfersSeperateCostDisplayTrue" name="transfersSeperateCostDisplay" value="true"/> <label for="transfersSeperateCostDisplayTrue" class="radio">Yes</label> 
					<form:radiobutton path="transfersSeperateCostDisplay" id="transfersSeperateCostDisplayFalse" name="transfersSeperateCostDisplay" value="false"/> <label for="transfersSeperateCostDisplayFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr>
				<th colspan="3"> Show Transfers GST Breakup </th>
				<td colspan="3">
					<form:radiobutton path="transfersGstBreakup" id="transfersGstBreakupTrue" name="transfersGstBreakup" value="true"/> <label for="transfersGstBreakupTrue" class="radio">Yes</label> 
					<form:radiobutton path="transfersGstBreakup" id="transfersGstBreakupFalse" name="transfersGstBreakup" value="false"/> <label for="transfersGstBreakupFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr>
				<th colspan="3"> Display Transfers Remarks / Cancellation Policy </th>
				<td colspan="3">
					<form:radiobutton path="transfersCancellationPolicyDisplay" id="transfersCancellationPolicyDisplayTrue" name="transfersCancellationPolicyDisplay" value="true" onclick="check();" /> <label for="transfersCancellationPolicyDisplayTrue" class="radio">Yes</label> 
					<form:radiobutton path="transfersCancellationPolicyDisplay" id="transfersCancellationPolicyDisplayFalse" name="transfersCancellationPolicyDisplay" value="false" onclick="check();" /> <label for="transfersCancellationPolicyDisplayFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr id="displayTransfersCancellationHeader">
				<th style="background-color:lightblue;color:black;" colspan="6"> Transfers Remarks / Cancellation Policy </th>
			</tr>
			<tr id="displayTransfersCancellationTextArea">
				<td colspan="6">
					<form:textarea path="transfersCancellationPolicy" rows="10" cols="100" />
				</td>
			</tr>	
		</c:if>
		
		<c:if test="${QTN_OBJ.sightseeing eq true}">
			<tr>
				<th colspan="6" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Sight Seeing" /></th>
			</tr>	
			<tr>
				<th colspan="3"> Display Sight Seeing Separate Cost </th>
				<td colspan="3">
					<form:radiobutton path="sightSeeingSeperateCostDisplay" id="sightSeeingSeperateCostDisplayTrue" name="sightSeeingSeperateCostDisplay" value="true"/> <label for="sightSeeingSeperateCostDisplayTrue" class="radio">Yes</label> 
					<form:radiobutton path="sightSeeingSeperateCostDisplay" id="sightSeeingSeperateCostDisplayFalse" name="sightSeeingSeperateCostDisplay" value="false"/> <label for="sightSeeingSeperateCostDisplayFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr>
				<th colspan="3"> Show Sight Seeing GST Breakup </th>
				<td colspan="3">
					<form:radiobutton path="sightSeeingGstBreakup" id="sightSeeingGstBreakupTrue" name="sightSeeingGstBreakup" value="true"/> <label for="sightSeeingGstBreakupTrue" class="radio">Yes</label> 
					<form:radiobutton path="sightSeeingGstBreakup" id="sightSeeingGstBreakupFalse" name="sightSeeingGstBreakup" value="false"/> <label for="sightSeeingGstBreakupFalse" class="radio">No</label> 
				</td>
			</tr>
			
			<tr>
				<th colspan="3"> Attach Sight Seeing Detailed Information At Last </th>
				<td colspan="3">
					<form:radiobutton path="sightSeeingsIncludeMasterAppendix" id="sightSeeingsIncludeMasterAppendixTrue" name="sightSeeingsIncludeMasterAppendix" value="true" onclick="check();" /> <label for="sightSeeingsIncludeMasterAppendixTrue" class="radio">Yes</label> 
					<form:radiobutton path="sightSeeingsIncludeMasterAppendix" id="sightSeeingsIncludeMasterAppendixFalse" name="sightSeeingsIncludeMasterAppendix" value="false" onclick="check();" /> <label for="sightSeeingsIncludeMasterAppendixFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr>
				<th colspan="3"> Display Sight Seeing Remarks / Cancellation Policy </th>
				<td colspan="3">
					<form:radiobutton path="sightSeeingCancellationPolicyDisplay" id="sightSeeingCancellationPolicyDisplayTrue" name="sightSeeingCancellationPolicyDisplay" value="true" onclick="check();" /> <label for="sightSeeingCancellationPolicyDisplayTrue" class="radio">Yes</label> 
					<form:radiobutton path="sightSeeingCancellationPolicyDisplay" id="sightSeeingCancellationPolicyDisplayFalse" name="sightSeeingCancellationPolicyDisplay" value="false" onclick="check();" /> <label for="sightSeeingCancellationPolicyDisplayFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr id="displaySigtSeeingCancellationHeader">
				<th style="background-color:lightblue;color:black;" colspan="6"> Sight Seeing Remarks / Cancellation Policy </th>
			</tr>
			<tr id="displaySightSeeingCancellationTextArea">
				<td colspan="6">
					<form:textarea path="sightSeeingCancellationPolicy" rows="10" cols="100" />
				</td>
			</tr>	
		</c:if>


	<c:if test="${QTN_OBJ.visa eq true}">
			<tr>
				<th colspan="6" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Visa" /></th>
			</tr>	
			<tr>
				<th colspan="3"> Display Visa Separate Cost </th>
				<td colspan="3">
					<form:radiobutton path="visaSeperateCostDisplay" id="visaSeperateCostDisplayTrue" name="visaSeperateCostDisplay" value="true"/> <label for="visaSeperateCostDisplayTrue" class="radio">Yes</label> 
					<form:radiobutton path="visaSeperateCostDisplay" id="visaSeperateCostDisplayFalse" name="visaSeperateCostDisplay" value="false"/> <label for="visaSeperateCostDisplayFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr>
				<th colspan="3"> Visa GST Breakup </th>
				<td colspan="3">
					<form:radiobutton path="visaGstBreakup" id="visaGstBreakupTrue" name="visaGstBreakup" value="true"/> <label for="visaGstBreakupTrue" class="radio">Yes</label> 
					<form:radiobutton path="visaGstBreakup" id="visaGstBreakupFalse" name="visaGstBreakup" value="false"/> <label for="visaGstBreakupFalse" class="radio">No</label> 
				</td>
			</tr>

			<tr>
				<th colspan="3"> Display Visa Additional Details </th>
				<td colspan="3">
					<form:radiobutton path="visaAdditionalDetailsDisplay" id="visaAdditionalDetailsDisplayTrue" name="visaAdditionalDetailsDisplay" value="true" onclick="check();" /> <label for="visaAdditionalDetailsDisplayTrue" class="radio">Yes</label> 
					<form:radiobutton path="visaAdditionalDetailsDisplay" id="visaAdditionalDetailsDisplayFalse" name="visaAdditionalDetailsDisplay" value="false" onclick="check();" /> <label for="visaAdditionalDetailsDisplayFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr id="displayVisaAdditionalHeader">
				<th style="background-color:lightblue;color:black;" colspan="6"> Visa Remarks / Cancellation Policy </th>
			</tr>
			<tr id="displayVisaAdditionalTextArea">
				<td colspan="6">
					<form:textarea path="visaAdditionalDetails" rows="10" cols="100" />
				</td>
			</tr>	

			
			<tr>
				<th colspan="3"> Display Visa Cancellation Policy </th>
				<td colspan="3">
					<form:radiobutton path="visaCancellationPolicyDisplay" id="visaCancellationPolicyDisplayTrue" name="visaCancellationPolicyDisplay" value="true" onclick="check();" /> <label for="visaCancellationPolicyDisplayTrue" class="radio">Yes</label> 
					<form:radiobutton path="visaCancellationPolicyDisplay" id="visaCancellationPolicyDisplayFalse" name="visaCancellationPolicyDisplay" value="false" onclick="check();" /> <label for="visaCancellationPolicyDisplayFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr id="displayVisaCancellationHeader">
				<th style="background-color:lightblue;color:black;" colspan="6"> Visa Remarks / Cancellation Policy </th>
			</tr>
			<tr id="displayVisaCancellationTextArea">
				<td colspan="6">
					<form:textarea path="visaCancellationPolicy" rows="10" cols="100" />
				</td>
			</tr>	
		</c:if>
		<c:if test="${QTN_OBJ.insurance eq true}">
			<tr>
				<th colspan="6" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Insurance" /></th>
			</tr>	
			<tr>
				<th colspan="3"> Display Insurance Separate Cost </th>
				<td colspan="3">
					<form:radiobutton path="insuranceSeperateCostDisplay" id="insuranceSeperateCostDisplayTrue" name="insuranceSeperateCostDisplay" value="true"/> <label for="insuranceSeperateCostDisplayTrue" class="radio">Yes</label> 
					<form:radiobutton path="insuranceSeperateCostDisplay" id="insuranceSeperateCostDisplayFalse" name="insuranceSeperateCostDisplay" value="false"/> <label for="insuranceSeperateCostDisplayFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr>
				<th colspan="3"> Show Insurance GST Breakup </th>
				<td colspan="3">
					<form:radiobutton path="insuranceGstBreakup" id="insuranceGstBreakupTrue" name="insuranceGstBreakup" value="true"/> <label for="insuranceGstBreakupTrue" class="radio">Yes</label> 
					<form:radiobutton path="insuranceGstBreakup" id="insuranceGstBreakupFalse" name="insuranceGstBreakup" value="false"/> <label for="insuranceGstBreakupFalse" class="radio">No</label> 
				</td>
			</tr>
			
			<tr>
				<th colspan="3"> Display Insurance Remarks / Cancellation Policy </th>
				<td colspan="3">
					<form:radiobutton path="insuranceCancellationPolicyDisplay" id="insuranceCancellationPolicyDisplayTrue" name="insuranceCancellationPolicyDisplay" value="true" onclick="check();" /> <label for="insuranceCancellationPolicyDisplayTrue" class="radio">Yes</label> 
					<form:radiobutton path="insuranceCancellationPolicyDisplay" id="insuranceCancellationPolicyDisplayFalse" name="insuranceCancellationPolicyDisplay" value="false" onclick="check();" /> <label for="insuranceCancellationPolicyDisplayFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr id="displayInsuranceCancellationHeader">
				<th style="background-color:lightblue;color:black;" colspan="6"> Insurance Remarks / Cancellation Policy </th>
			</tr>
			<tr id="displayInsuranceCancellationTextArea">
				<td colspan="6">
					<form:textarea path="insuranceCancellationPolicy" rows="10" cols="100" />
				</td>
			</tr>	
		</c:if>
		<c:if test="${QTN_OBJ.cruise eq true}">
			<tr>
				<th colspan="6" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Cruise" /></th>
			</tr>	
			<tr>
				<th colspan="3"> Display Cruise Separate Cost </th>
				<td colspan="3">
					<form:radiobutton path="cruiseSeperateCostDisplay" id="cruiseSeperateCostDisplayTrue" name="cruiseSeperateCostDisplay" value="true"/> <label for="cruiseSeperateCostDisplayTrue" class="radio">Yes</label> 
					<form:radiobutton path="cruiseSeperateCostDisplay" id="cruiseSeperateCostDisplayFalse" name="cruiseSeperateCostDisplay" value="false"/> <label for="cruiseSeperateCostDisplayFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr>
				<th colspan="3"> Show Cruise GST Breakup </th>
				<td colspan="3">
					<form:radiobutton path="cruiseGstBreakup" id="cruiseGstBreakupTrue" name="cruiseGstBreakup" value="true"/> <label for="cruiseGstBreakupTrue" class="radio">Yes</label> 
					<form:radiobutton path="cruiseGstBreakup" id="cruiseGstBreakupFalse" name="cruiseGstBreakup" value="false"/> <label for="cruiseGstBreakupFalse" class="radio">No</label> 
				</td>
			</tr>
			
			<tr>
				<th colspan="3"> Display Cruise Remarks / Cancellation Policy </th>
				<td colspan="3">
					<form:radiobutton path="cruiseCancellationPolicyDisplay" id="cruiseCancellationPolicyDisplayTrue" name="cruiseCancellationPolicyDisplay" value="true" onclick="check();" /> <label for="cruiseCancellationPolicyDisplayTrue" class="radio">Yes</label> 
					<form:radiobutton path="cruiseCancellationPolicyDisplay" id="cruiseCancellationPolicyDisplayFalse" name="cruiseCancellationPolicyDisplay" value="false" onclick="check();" /> <label for="cruiseCancellationPolicyDisplayFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr id="displayCruiseCancellationHeader">
				<th style="background-color:lightblue;color:black;" colspan="6"> Cruise Remarks / Cancellation Policy </th>
			</tr>
			<tr id="displayCruiseCancellationTextArea">
				<td colspan="6">
					<form:textarea path="cruiseCancellationPolicy" rows="10" cols="100" />
				</td>
			</tr>	
		</c:if>
		<c:if test="${QTN_OBJ.tourPackage eq true}">
			<tr>
				<th colspan="6" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Tour Package" /></th>
			</tr>	
			<tr>
				<th colspan="3"> Display Tour Package Separate Cost </th>
				<td colspan="3">
					<form:radiobutton path="packageSeperateCostDisplay" id="packageSeperateCostDisplayTrue" name="packageSeperateCostDisplay" value="true"/> <label for="packageSeperateCostDisplayTrue" class="radio">Yes</label> 
					<form:radiobutton path="packageSeperateCostDisplay" id="packageSeperateCostDisplayFalse" name="packageSeperateCostDisplay" value="false"/> <label for="packageSeperateCostDisplayFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr>
				<th colspan="3"> Show Tour Package GST Breakup </th>
				<td colspan="3">
					<form:radiobutton path="packageGstBreakup" id="packageGstBreakupTrue" name="packageGstBreakup" value="true"/> <label for="packageGstBreakupTrue" class="radio">Yes</label> 
					<form:radiobutton path="packageGstBreakup" id="packageGstBreakupFalse" name="packageGstBreakup" value="false"/> <label for="packageGstBreakupFalse" class="radio">No</label> 
				</td>
			</tr>
			
			<tr>
				<th colspan="3"> Display Tour Package Remarks / Cancellation Policy </th>
				<td colspan="3">
					<form:radiobutton path="packageCancellationPolicyDisplay" id="packageCancellationPolicyDisplayTrue" name="packageCancellationPolicyDisplay" value="true" onclick="check();" /> <label for="packageCancellationPolicyDisplayTrue" class="radio">Yes</label> 
					<form:radiobutton path="packageCancellationPolicyDisplay" id="packageCancellationPolicyDisplayFalse" name="packageCancellationPolicyDisplay" value="false" onclick="check();" /> <label for="packageCancellationPolicyDisplayFalse" class="radio">No</label> 
				</td>
			</tr>
			
			<tr id="displayTourPackageCancellationHeader">
				<th style="background-color:lightblue;color:black;" colspan="6"> Tour Package Remarks / Cancellation Policy </th>
			</tr>
			<tr id="displayTourPackageCancellationTextArea">
				<td colspan="6">
					<form:textarea path="packageCancellationPolicy" rows="10" cols="100" />
				</td>
			</tr>	
		</c:if>
		
	<c:if test="${QTN_OBJ.others eq true}">
			<tr>
				<th colspan="6" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Other Services" /></th>
			</tr>	
			<tr>
				<th colspan="3"> Display Other Services Separate Cost </th>
				<td colspan="3">
					<form:radiobutton path="otherSeperateCostDisplay" id="otherSeperateCostDisplayTrue" name="otherSeperateCostDisplay" value="true"/> <label for="otherSeperateCostDisplayTrue" class="radio">Yes</label> 
					<form:radiobutton path="otherSeperateCostDisplay" id="otherSeperateCostDisplayFalse" name="otherSeperateCostDisplay" value="false"/> <label for="otherSeperateCostDisplayFalse" class="radio">No</label> 
				</td>
			</tr>
			<tr>
				<th colspan="3"> Show Other Services GST Breakup </th>
				<td colspan="3">
					<form:radiobutton path="otherGstBreakup" id="otherGstBreakupTrue" name="otherGstBreakup" value="true"/> <label for="otherGstBreakupTrue" class="radio">Yes</label> 
					<form:radiobutton path="otherGstBreakup" id="otherGstBreakupFalse" name="otherGstBreakup" value="false"/> <label for="otherGstBreakupFalse" class="radio">No</label> 
				</td>
			</tr>
			
			<tr>
				<th colspan="3"> Display Other Services Remarks / Cancellation Policy </th>
				<td colspan="3">
					<form:radiobutton path="otherCancellationPolicyDisplay" id="otherCancellationPolicyDisplayTrue" name="otherCancellationPolicyDisplay" value="true" onclick="check();" /> <label for="otherCancellationPolicyDisplayTrue" class="radio">Yes</label> 
					<form:radiobutton path="otherCancellationPolicyDisplay" id="otherCancellationPolicyDisplayFalse" name="otherCancellationPolicyDisplay" value="false" onclick="check();" /> <label for="otherCancellationPolicyDisplayFalse" class="radio">No</label> 
				</td>
			</tr>
			
			<tr id="displayOtherCancellationHeader">
				<th style="background-color:lightblue;color:black;" colspan="6"> Other Services Remarks / Cancellation Policy </th>
			</tr>
			<tr id="displayOtherCancellationTextArea">
				<td colspan="6">
					<form:textarea path="otherCancellationPolicy" rows="10" cols="100" />
				</td>
			</tr>	
		</c:if>
		<tr>
			<th colspan="6" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Miscellaneous" /></th>
		</tr>
		<tr>
			<th colspan="3"> Other Left Over Amount Display</th>
			<td colspan="3">
					<form:radiobutton path="leftOverAmtDisplay" id="leftOverAmtDisplayTrue" name="leftOverAmtDisplay" value="true" onclick="check();" /> <label for="leftOverAmtDisplayTrue" class="radio">Yes</label> 
					<form:radiobutton path="leftOverAmtDisplay" id="leftOverAmtDisplayFalse" name="leftOverAmtDisplay" value="false" onclick="check();" /> <label for="leftOverAmtDisplayFalse" class="radio">No</label> 
			</td>
		</tr>	
		<tr>
			<th colspan="3"> Show Bank Accounts</th>
			<td colspan="3">
					<form:radiobutton path="showBankAccounts" id="showBankAccountsTrue" name="showBankAccounts" value="true" onclick="check();" /> <label for="showBankAccountsTrue" class="radio">Yes</label> 
					<form:radiobutton path="showBankAccounts" id="showBankAccountsFalse" name="showBankAccounts" value="false" onclick="check();" /> <label for="showBankAccountsFalse" class="radio">No</label> 
			</td>
		</tr>	
		<tr>
			<th colspan="6" style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;" > <input type="button" style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Other Quotation Configuration" /></th>
		</tr>
		<tr>
			<th colspan="3"> Flight New Page</th>
			<td colspan="3">
					<form:radiobutton path="flightStarNewPage" id="flightStarNewPageTrue" name="flightStarNewPage" value="true" onclick="check();" /> <label for="flightStarNewPageTrue" class="radio">Yes</label> 
					<form:radiobutton path="flightStarNewPage" id="flightStarNewPageFalse" name="flightStarNewPage" value="false" onclick="check();" /> <label for="flightStarNewPageFalse" class="radio">No</label> 
			</td>
		</tr>	
		<tr>
			<th colspan="3"> Hotel New Page</th>
			<td colspan="3">
					<form:radiobutton path="hotelStartNewPage" id="hotelStartNewPageTrue" name="hotelStartNewPage" value="true" onclick="check();" /> <label for="hotelStartNewPageTrue" class="radio">Yes</label> 
					<form:radiobutton path="hotelStartNewPage" id="hotelStartNewPageFalse" name="hotelStartNewPage" value="false" onclick="check();" /> <label for="hotelStartNewPageFalse" class="radio">No</label> 
			</td>
		</tr>	
		<tr>
			<th colspan="3"> Cruise New Page</th>
			<td colspan="3">
					<form:radiobutton path="cruiseStartNewPage" id="cruiseStartNewPageTrue" name="cruiseStartNewPage" value="true" onclick="check();" /> <label for="cruiseStartNewPageTrue" class="radio">Yes</label> 
					<form:radiobutton path="cruiseStartNewPage" id="cruiseStartNewPageFalse" name="cruiseStartNewPage" value="false" onclick="check();" /> <label for="cruiseStartNewPageFalse" class="radio">No</label> 
			</td>
		</tr>	
		
		<tr>
			<th colspan="3"> Package New Page</th>
			<td colspan="3">
					<form:radiobutton path="packagesStartNewPage" id="packagesStartNewPageTrue" name="packagesStartNewPage" value="true" onclick="check();" /> <label for="packagesStartNewPageTrue" class="radio">Yes</label> 
					<form:radiobutton path="packagesStartNewPage" id="packagesStartNewPageFalse" name="packagesStartNewPage" value="false" onclick="check();" /> <label for="packagesStartNewPageFalse" class="radio">No</label> 
			</td>
		</tr>	
		
		<tr>
			<th colspan="3"> Sight Seeing New Page</th>
			<td colspan="3">
					<form:radiobutton path="sightSeeingStartNewPage" id="sightSeeingStartNewPageTrue" name="sightSeeingStartNewPage" value="true" onclick="check();" /> <label for="sightSeeingStartNewPageTrue" class="radio">Yes</label> 
					<form:radiobutton path="sightSeeingStartNewPage" id="sightSeeingStartNewPageFalse" name="sightSeeingStartNewPage" value="false" onclick="check();" /> <label for="sightSeeingStartNewPageFalse" class="radio">No</label> 
			</td>
		</tr>	
		<tr>
			<th colspan="3"> Transfers New Page</th>
			<td colspan="3">
					<form:radiobutton path="transfersStartNewPage" id="transfersStartNewPageTrue" name="transfersStartNewPage" value="true" onclick="check();" /> <label for="transfersStartNewPageTrue" class="radio">Yes</label> 
					<form:radiobutton path="transfersStartNewPage" id="transfersStartNewPageFalse" name="transfersStartNewPage" value="false" onclick="check();" /> <label for="transfersStartNewPageFalse" class="radio">No</label> 
			</td>
		</tr>	
		<tr>
			<th colspan="3"> Visa New Page</th>
			<td colspan="3">
					<form:radiobutton path="visaStartNewPage" id="visaStartNewPageTrue" name="visaStartNewPage" value="true" onclick="check();" /> <label for="visaStartNewPageTrue" class="radio">Yes</label> 
					<form:radiobutton path="visaStartNewPage" id="visaStartNewPageFalse" name="visaStartNewPage" value="false" onclick="check();" /> <label for="visaStartNewPageFalse" class="radio">No</label> 
			</td>
		</tr>	
		<tr>
			<th colspan="3"> Insurance New Page</th>
			<td colspan="3">
					<form:radiobutton path="insuranceStartNewPage" id="insuranceStartNewPageTrue" name="insuranceStartNewPage" value="true" onclick="check();" /> <label for="insuranceStartNewPageTrue" class="radio">Yes</label> 
					<form:radiobutton path="insuranceStartNewPage" id="insuranceStartNewPageFalse" name="insuranceStartNewPage" value="false" onclick="check();" /> <label for="insuranceStartNewPageFalse" class="radio">No</label> 
			</td>
		</tr>	
		<tr>
			<th colspan="3"> Others New Page</th>
			<td colspan="3">
					<form:radiobutton path="othersStartNewPage" id="othersStartNewPageTrue" name="othersStartNewPage" value="true" onclick="check();" /> <label for="othersStartNewPageTrue" class="radio">Yes</label> 
					<form:radiobutton path="othersStartNewPage" id="othersStartNewPageFalse" name="othersStartNewPage" value="false" onclick="check();" /> <label for="othersStartNewPageFalse" class="radio">No</label> 
			</td>
		</tr>
		<tr>
			<th colspan="3"> Costing New Page</th>
			<td colspan="3">
					<form:radiobutton path="costingStartNewPage" id="costingStartNewPageTrue" name="costingStartNewPage" value="true" onclick="check();" /> <label for="costingStartNewPageTrue" class="radio">Yes</label> 
					<form:radiobutton path="costingStartNewPage" id="costingStartNewPageFalse" name="costingStartNewPage" value="false" onclick="check();" /> <label for="costingStartNewPageFalse" class="radio">No</label> 
			</td>
		</tr>	
		<tr>
			<th colspan="3"> T&C New Page</th>
			<td colspan="3">
					<form:radiobutton path="tncStartNewPage" id="tncStartNewPageTrue" name="tncStartNewPage" value="true" onclick="check();" /> <label for="tncStartNewPageTrue" class="radio">Yes</label> 
					<form:radiobutton path="tncStartNewPage" id="tncStartNewPageFalse" name="tncStartNewPage" value="false" onclick="check();" /> <label for="tncStartNewPageFalse" class="radio">No</label> 
			</td>
		</tr>	
		<tr>
			<th colspan="3"> Itinerary New Page</th>
			<td colspan="3">
					<form:radiobutton path="itineraryStartNewPage" id="itineraryStartNewPageTrue" name="itineraryStartNewPage" value="true" onclick="check();" /> <label for="itineraryStartNewPageTrue" class="radio">Yes</label> 
					<form:radiobutton path="itineraryStartNewPage" id="itineraryStartNewPageFalse" name="itineraryStartNewPage" value="false" onclick="check();" /> <label for="itineraryStartNewPageFalse" class="radio">No</label> 
			</td>
		</tr>
		<tr> 
			<td colspan="6">
				<input type="submit" name="Save Configuration" id="Save Configuration" Value="Save Configuration" />
				<a href="form_view_configure_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
				<a href="form_view_delete_confirm_configure_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:red;" value="Restore Default" /></a>
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
		      <br><h2 style="text-align:center;">Travel Quotation</h2>
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
  