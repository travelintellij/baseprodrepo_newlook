<!doctype html>
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

<body style="background-color: creamwhite;">
	<form:form method="post" >
		<input type="hidden" name="supplierId" value= "${SUPPLIER_CONTACT_OBJ.supplierEntity.supplierId}" />
		<table style="table-layout: fixed;width: 700px; margin-left: auto;margin-right: auto;" >
				<tr height="50px;">
					<th>Contact Id</th>
					<td style="width:20%;">${SUPPLIER_CONTACT_OBJ.supplierContactId}</td>
				</tr>
				<tr height="50px;">
					<th>Contact Name</th>
					<td style="width:20%;">${SUPPLIER_CONTACT_OBJ.contactName}</td>
				</tr>
				<tr height="50px;">
					<th>Role</th>
					<td style="width:500px;">${SUPPLIER_CONTACT_OBJ.role}</td>
				</tr>
				<tr height="50px;">
					<th>Email</th>
					<td style="width:500px;">${SUPPLIER_CONTACT_OBJ.email}</td>
				</tr>
				<tr height="50px;">
					<th>Mobile</th>
					<td style="width:500px;">${SUPPLIER_CONTACT_OBJ.mobile}</td>				
				</tr>
				<tr height="50px;">
					<th>Phone</th>
						<td style="width:500px;">${SUPPLIER_CONTACT_OBJ.phone}</td>
				</tr>
				<tr height="50px;">
					<th>Description</th>
					<td style="width:500px;">${SUPPLIER_CONTACT_OBJ.description}</td>
				</tr>
				<tr height="50px;">
					<th>City</th>
					<td style="width:500px;">${SUPPLIER_CONTACT_OBJ.city}</td>
				</tr>
		</table>
		<br><br><br><br>
</form:form>
</body>
</html>
