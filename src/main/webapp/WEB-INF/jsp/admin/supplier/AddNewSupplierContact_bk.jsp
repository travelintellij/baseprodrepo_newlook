<!doctype html>
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
<link href="resources/core/magicsuggest.css" rel="stylesheet" type="text/css">
<style>
.sscontainer { max-width: 550px; }
</style>
</head>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script	src="<c:url value="/resources/core/magicsuggest.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<style>
table {
	  width: 100%;
	  border-collapse: collapse;
	  border: 1px solid #38678f;
	  //margin: 5px auto;
	  background: white;
	}
	
	th {
	  background: #D33F14;
	  width: 10%;
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
	  padding: 5px;
	  transition: all 0.2s;
	  text-align: center;
	}
	
	.heavyTable {
	  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
	  animation: float 5s infinite;
	}
	input[type="radio"] {
		display: inline-block;
		opacity: 1;
		width: 1em;
		z-index: -1;
	}

select {
	appearance: none;
	outline: 0;
	background: lightblue;
	background-image: none;
	width: 80%;
	height: 100%;
	color: black;
	cursor: pointer;
	border: 1px solid black;
	border-radius: 3px;
	text-indent: 2px;
}

.select {
	position: relative;
	display: block;
	height: 2.5em;
	line-height: 3;
	overflow: hidden;
	border-radius: .25em;
	padding-bottom: 10px;
	padding-top: 10px;
}

.select option.service-small {
	font-size: 20px;
	padding: 25px;
	background: lightgreen;
}


input[type=button], input[type=submit], input[type=reset] {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}

.sscontainer {
z-index: 5;
  position: absolute;
  width: 750px;
  border: 1px dashed #900;
  background-color: #fdd;  
  max-width: 570px; 
}
	</style>
</head>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h2 align="center"><font color="#8433FF">(Supplier Id : ${SUPPLIER_OBJ.supplierId})</font></h2><br>
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<body style="background-color: creamwhite;">
	<form:form method="post" modelAttribute="SUPPLIER_OBJ" >
	<table>
		<tr>
			<th>Supplier Name</th>
			<td>${SUPPLIER_OBJ.supplierName}</td>
			<th>Email</th>
			<td>${SUPPLIER_OBJ.email}</td>
			<th>Mobile</th>
			<td>${SUPPLIER_OBJ.mobile}</td>
			<th>Destinations Supported.</th>
			<td colspan="2">
				<c:forEach items="${SUPPLIER_OBJ.destinations}" var="destination">
					${destination.cityName},
				</c:forEach>
			</td>
		</tr>
		<tr>
			<th>Service Offerred</th>
			<td><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="flight" disabled="true"/><span class="checkmark"></span></label>Flight</td>
			<td><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="hotel" disabled="true"/><span class="checkmark"></span></label>Hotel</td>
			<td><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="transfers" disabled="true"/><span class="checkmark"></span></label>Transfers</td>
			<td><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="sightseeing" disabled="true" /><span class="checkmark"></span></label>SightSeeing</td>
			<td><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="visa" disabled="true" /><span class="checkmark"></span></label>Visa</td>
			<td><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="insurance" disabled="true"/><span class="checkmark"></span></label>Insurance</td>
			<td colspan="2"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="landPackage" disabled="true"/><span class="checkmark"></span></label>Package</td>
			
			
			
		</tr>
	</table>
<br><br>
</form:form>
<h2 align="center">Add New Contact</h2>
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	
	<form:form method="post" action="create_create_supplier_contact" modelAttribute="SUPPLIER_CONTACT_OBJ" >
		<input type="hidden" name="supplierId" value= "${SUPPLIER_CONTACT_OBJ.supplierEntity.supplierId}" />
		<table style="table-layout: fixed;width: 700px; margin-left: auto;margin-right: auto;" >
				<tr height="50px;">
					<th>Contact Name</th>
					<td style="width:20%;"><form:input path="contactName" name="contactName" style="height:30px;width:350px;margin: auto;" required="required"/>
					
					<font color="red"><form:errors path="contactName" cssClass="error" /></font></td>
				</tr>
				<tr height="50px;">
					<th>Role</th>
					<td style="width:500px;"><form:input path="role" name="role" style="height:30px;width:250px;margin: auto;" required="required"/>
					
					<font color="red"><form:errors path="role" cssClass="error" /></font></td>
				</tr>
				<tr height="50px;">
					<th>Email</th>
					<td style="width:500px;"><form:input type="email" path="email" style="height:30px;width:250px;margin: auto;" />
					<br>
					<font color="red"><form:errors path="email" cssClass="error" /></font></td>
				</tr>
				<tr height="50px;">
					<th>Mobile</th>
					<td style="width:500px;">
					<form:input type="number" path="mobile" style="height:30px;width:250px;margin: auto;"  />
					<br>
					<font color="red"><form:errors path="mobile" cssClass="error" /></font></td>
				</tr>
				<tr height="50px;">
					<th>Phone</th>
					<td style="width:500px;">
					
					<form:input type="number" path="phone" style="height:30px;width:250px;margin: auto;"  />
					<br>
					<font color="red"><form:errors path="phone" cssClass="error" /></font></td>
				</tr>
				<tr height="50px;">
					<th>Description</th>
					<td style="width:500px;"><form:input path="description" name="description" style="height:30px;width:350px;margin: auto;"/>
				</tr>
				<tr height="50px;">
					<th>City</th>
					<td style="width:500px;"><form:input path="city" name="city" style="height:30px;width:250px;margin: auto;"/>
					
					 
					
				</tr>
				
				
			<tr>
				<td colspan="2" style="text-align: center;"><input type="submit" value="Add Contact" style="background-color: green;">
						<a href="view_supplier_contacts_listing?supplierId=${SUPPLIER_OBJ.supplierId}"><input type="button" style="width: 160px;background-color: blue;" value="Contacts Listing"></a> 
				</td>
			</tr>
		</table>
</form:form>


	
</body>
</html>
