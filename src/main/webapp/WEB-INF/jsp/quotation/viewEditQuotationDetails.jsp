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
  height: 20px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 3px auto;
  background: white;
}

th {
  background: #FF4D00;
  height: 25px;
  width: 15%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
}
tr {
  border-bottom: 1px solid #cccccc;
}

td {
  border-right: 1px solid #cccccc;
  padding: 10px;
  transition: all 0.2s;
  text-align: center;
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
    width: 100%;
    float: center;
    //padding: 50px;
    //border: 2px solid red;
}  
  
</style>
<br>
<h2 align="center">Edit Quotation </h2>


<body>
<form:form modelAttribute="LEAD_OBJ" action="create_create_lead_quotation">
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<jsp:include page="leadDetailsOpenNavView.jsp" />
	</div>
	<h3>
		<br>
		<font color="red">View Lead Details </font>
	</h3>
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
<form:form modelAttribute="QTN_OBJ" action="edit_edit_lead_quotation">

<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<form:hidden path = "quotationId" id="quotationId" />
	<form:hidden path = "version" id="version" />
<div class="float-container">

  <div class="float-child-left">
    <div class="green" >
      <jsp:include page="_quotationServicesMenu.jsp" />
    </div>
  </div>
 <div class="float-child-right">
    <div class="blue">
	<table style="width:70%;">
		<tr>
			<th style="background: green;color:white;" height="40"> Quotation Id </th><td>${QTN_OBJ.quotationId}</td>
			<th style="background: green;color:white;"> Version Id </th><td>${QTN_OBJ.version}</td>
		</tr>
		<tr>
			<th style="width:25%;background: green;color:white;" height="40"> Quotation Header </th><td colspan="3" style="text-align:left;"><form:input path="quotationName"  style="height:30px;width:280px;margin: auto;"/></td>
		</tr>
		<tr>
			<th style="width:25%;background: green;color:white;" colspan="4" height="40"> Services to be included</th>
		</tr>
		<tr>	
			<td style="width:50%;text-align:left;" colspan="2">
				<font color="red"> <form:errors path="tourPackage" cssClass="error" /></font>
				<label class="container" style="display:inline;"><form:checkbox path="tourPackage" name="tourPackage" /> <span class="checkmark"></span></label>Package
			</td>
			<td style="width:25%;text-align:left;">
				<font color="red"> <form:errors path="flight" cssClass="error" /></font>
				<label class="container" style="display:inline;"><form:checkbox path="flight" name="flight"  /><span class="checkmark"></span></label> Flight
			</td>
			<td style="width:25%;text-align:left;">
				<font color="red"> <form:errors path="hotel" cssClass="error" /></font>
				<label class="container" style="display:inline;"><form:checkbox path="hotel" name="hotel"  /><span class="checkmark"></span></label> Hotel
			</td>
			
		</tr>
		<tr>	
			<td style="width:25%;text-align:left;">
				<font color="red"> <form:errors path="transfers" cssClass="error" /></font>
				<label class="container" style="display:inline;"><form:checkbox path="transfers" name="transfers"  /><span class="checkmark"></span></label> Transfers
			</td>
			<td style="width:25%;text-align:left;">
				<font color="red"> <form:errors path="sightseeing" cssClass="error" /></font>
				<label class="container" style="display:inline;"><form:checkbox path="sightseeing" name="sightseeing"  /><span class="checkmark"></span></label>SightSeeing
			</td>
			<td style="width:25%;text-align:left;">
				<font color="red"> <form:errors path="visa" cssClass="error" /></font>
				<label class="container" style="display:inline;"><form:checkbox path="visa" name="visa"  /><span class="checkmark"></span></label>Visa
			</td>
			<td style="width:25%;text-align:left;">
				<font color="red"> <form:errors path="insurance" cssClass="error" /></font>
				<label class="container" style="display:inline;"><form:checkbox path="insurance" name="insurance"  /><span class="checkmark"></span></label>Insurance
			</td>
		</tr>
		<tr>
			<td style="width:25%;text-align:left;">
				<font color="red"> <form:errors path="cruise" cssClass="error" /></font>
				<label class="container" style="display:inline;"><form:checkbox path="cruise" name="cruise"   /><span class="checkmark"></span></label>Cruise
			</td>
			<td style="width:25%;text-align:left;">
				<font color="red"> <form:errors path="others" cssClass="error" /></font>
				<label class="container" style="display:inline;"><form:checkbox path="others" name="others"   /><span class="checkmark"></span></label>Others
			</td>
			<td colspan="2">Please select all applicable services for this quotation.</td>
		</tr>
		<tr>
		<th style="width:50%;background: green;color:white;" colspan="2">Quotation Status</th>
		<td colspan="2">Created</td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="submit" id="createquotation"  name="createquotation" value="Update Quotation Skeleton" />  
				<a href="view_lead_quotations_list?leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
		 	</td>
		 </tr>
		
		</table>    
	   
    
   </div>
   </div>
   </div>
    
    </form:form> 
  

 </body>
  
  </html>
  