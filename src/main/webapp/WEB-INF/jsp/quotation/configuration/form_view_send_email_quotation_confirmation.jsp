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
		<td><a href="#"><input type="button" style="background-color:#800000;color:white;font-weight: bold;font-weight: 600;font-size: 18px;" value="Send Email" /></a></td>
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
	
</div>
</div>
</div>



	
</body>
</html>
  