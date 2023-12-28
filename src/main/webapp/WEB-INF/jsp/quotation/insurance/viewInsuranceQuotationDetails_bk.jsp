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
  background: #900C3F;
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
  background: white;
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
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h2 align="center">View Insurance Quotation Details </h2>
<body>
<form:form modelAttribute="QTN_OBJ" action="create_create_lead_quotation">
	<table style="width:45%;margin: auto;">
		<tr>
		<th style="background: #FFC300;color:black;"> Quotation Id</th><td>${QTN_OBJ.quotationId}</td>
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
		<c:if test="${INS_ACTION ne 'ADD'}">
		<table style="width:10%;">
		<caption><font size="4"> <b>Services Action </b></font></caption>
			<tr>
				<td style="text-align:center;">
				<ul>
					<c:if test="${QTN_OBJ.converted ne true }">
		  				<li><a href="form_view_add_insurance_quotation?leadId=${LEAD_OBJ.leadId }&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:green;" value="Add Insurance" /></a></li>
		  			</c:if>
		  			<c:if test="${QTN_OBJ.converted eq true }">
						<li><a><input type="button" style="background-color:lightgray;" value="Add Insurance" /></a></li>		  			
		  			</c:if>
				</ul>
				</td>
			</tr>
		</table>
		</c:if>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<table style="width:70%;  table-layout:fixed;background-color:#cc3300;" >
	<tr><td>
		<c:if test="${INS_ACTION eq 'ADD'}">
			<jsp:include page="form_view_add_manual_insurance_quotation.jsp" />
		</c:if>
		
		<c:forEach items="${QTN_OBJ.insuranceVoList}" var="insuranceQtnObj">
			<c:choose>
				<c:when test="${insuranceQtnObj.manualInsuranceQuotationId eq MANUAL_INS.manualInsuranceQuotationId  && INS_ACTION eq 'EDIT' }">
					<jsp:include page="form_view_edit_manual_insurance_quotation.jsp" />
				</c:when>
				<c:when test="${insuranceQtnObj.manualInsuranceQuotationId eq MANUAL_INS.manualInsuranceQuotationId  && INS_ACTION eq 'DELETE' }">
					<jsp:include page="form_view_delete_manual_insurance_quotation.jsp" />
				</c:when>
				<c:otherwise>
					<table style="width:100%;  table-layout:fixed;background-color: #DFE0DC; border: 3px solid #000000; border-collapse: collapse" >
					<tr><th style="background-color:blue;" colspan="5"><font size="4"><b>Id-  ${insuranceQtnObj.manualInsuranceQuotationId}</b></font></th></tr>
					<tr>
						<th><font size="4"><b>Country Name</b></font></th>
						<th><font size="4"><b>Insurance Name</b></font></th>
						<th><font size="4"><b>Start Date</b></font></th>
						<th><font size="4"><b>End Date</b></font></th>
						<th><font size="4"><b>Insurance Provider</b></font></th>
					</tr>
					<tr>
						<td>${insuranceQtnObj.countryName }</td>
						<td>${insuranceQtnObj.insuranceName}</td>
						<td><fmt:formatDate value="${insuranceQtnObj.coverageStartDate}" pattern="dd-MM-yyyy" /></td>
						<td><fmt:formatDate value="${insuranceQtnObj.coverageEndDate}" pattern="dd-MM-yyyy" /></td>
						<td>${insuranceQtnObj.insuranceProviderName}</td>
					</tr>
		
					<tr>	
						<th><font size="4"><b>Coverage Amount</b></font></th>
						<th><font size="4"><b>Coverage Currency</b></font></th>
						<th colspan="2"><font size="4"><b>Guest Details</b></font></th>
						<th><font size="4"><b>Insurance Type</b></font></th>
					</tr>
					<tr>
						<td>${insuranceQtnObj.coverageAmount }</td>
						<td>${insuranceQtnObj.coverageCurrency}</td>
						<td colspan="2">${insuranceQtnObj.adults} Adults | ${insuranceQtnObj.children} Children | ${insuranceQtnObj.infant} Infants</td>
						<td>${insuranceQtnObj.insuranceTypeName} </td>
					</tr>
					<tr>	
						<th colspan="2"><font size="4"><b>Remarks</b></font></th>
						<th><font size="4"><b>Premium Cost</b></font></th>
						<th><font size="4"><b>Markup</b></font></th>
						<th><font size="4"><b>Display Order</b></font></th>
					</tr>
						<tr>
						<td colspan="2">${insuranceQtnObj.remarks }</td>
						<td>${insuranceQtnObj.premiumCost}</td>
						<td>${insuranceQtnObj.premiumMarkup}</td>
						<td>${insuranceQtnObj.displayOrder}</td>
					</tr>
					<tr>
						<th style="background-color:#DAF7A6;" colspan="5">
							<c:if test="${QTN_OBJ.converted ne true }">
								<a href="form_view_edit_manual_insurance_quotation?manualInsuranceQuotationId=${insuranceQtnObj.manualInsuranceQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:blue;" value="Edit Insurance" /></a>
								<a href="form_view_delete_manual_insurance_quotation?manualInsuranceQuotationId=${insuranceQtnObj.manualInsuranceQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:red;" value="Delete Insurance" /></a>
							</c:if>
							<c:if test="${QTN_OBJ.converted eq true }">
								<a><input type="button" style="background-color:lightgray;" value="Edit Insurance" /></a>
								<a><input type="button" style="background-color:lightgray;" value="Delete Insurance" /></a>

							</c:if>
						</th>
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
</div>


</body>
</html>
  