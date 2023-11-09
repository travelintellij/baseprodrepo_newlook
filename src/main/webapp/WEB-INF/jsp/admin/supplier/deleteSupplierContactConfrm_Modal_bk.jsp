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
</head>
<br>

<body style="background-color: creamwhite;">
<br>
<br>
<br>
<br>

	<form:form method="post" action="delete_delete_supplier_contact" modelAttribute="SUPPLIER_CONTACT_OBJ" >
		<input type="hidden" name="supplierId" value= "${SUPPLIER_CONTACT_OBJ.supplierEntity.supplierId}" />
		<form:hidden path = "supplierContactId" />
		<table style="table-layout: fixed;width: 700px; margin-left: auto;margin-right: auto;" >
				<tr height="50px;">
					<th style="background: #FFCC00;color:black;">Contact Id</th>
					<td style="width:20%;">${SUPPLIER_CONTACT_OBJ.supplierContactId}</td>
				</tr>
				<tr height="50px;">
					<th style="background: #FFCC00;color:black;">Contact Name</th>
					<td style="width:20%;">${SUPPLIER_CONTACT_OBJ.contactName}</td>
				</tr>
				<tr height="50px;">
					<th style="background: #FFCC00;color:black;">Role</th>
					<td style="width:500px;">${SUPPLIER_CONTACT_OBJ.role}</td>
				</tr>
				<tr height="50px;">
					<th style="background: #FFCC00;color:black;">Email</th>
					<td style="width:500px;">${SUPPLIER_CONTACT_OBJ.email}</td>
				</tr>
				<tr height="50px;">
					<th style="background: #FFCC00;color:black;">Mobile</th>
					<td style="width:500px;">${SUPPLIER_CONTACT_OBJ.mobile}</td>				
				</tr>
				<tr height="50px;">
					<th style="background: #FFCC00;color:black;">Phone</th>
						<td style="width:500px;">${SUPPLIER_CONTACT_OBJ.phone}</td>
				</tr>
				<tr height="50px;">
					<th style="background: #FFCC00;color:black;">Description</th>
					<td style="width:500px;">${SUPPLIER_CONTACT_OBJ.description}</td>
				</tr>
				<tr height="50px;">
					<th style="background: #FFCC00;color:black;">City</th>
					<td style="width:500px;">${SUPPLIER_CONTACT_OBJ.city}</td>
				</tr>
				
				
				<tr height="50px;">
					<td colspan="2"><input type="submit" value="Confirm Delete!!" style="background-color: red;"> <input type="button" style="background-color: green;" value="Cancel" onclick="cancelModal();" /></td>
				</tr>
		</table>
		<br>
</form:form>
</body>
</html>
