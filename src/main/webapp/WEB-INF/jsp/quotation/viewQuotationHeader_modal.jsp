<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form:form modelAttribute="QTN_OBJ" action="delete_delete_lead_quotation">
	<input type="hidden" name="leadId" value="${LEAD_OBJ.leadId }" />
	<form:hidden path = "quotationId" />
	<h2 align="center">
		<input type="image" src="${pageContext.request.contextPath}/resources/images/warning.jpg" height="50" width="50"/> 
		<font color="red">Please make a note that all service elements of this quotation (flights, Hotels, Sight-Seeings etc) will be deleted. 
	<br><br>You will not be able to retrieve them back.</font>
</h2>
	<table style="width:70%;">
		<tr>
		<th style="background: #FFC300;color:black;"> Quotation Id </th><td>${QTN_OBJ.quotationId}</td>
		<th style="background: #FFC300;color:black;"> Version Id </th><td>${QTN_OBJ.version}</td>
		
		</tr>
		<tr>
			<th style="width:25%;background: #FFC300;color:black;"> Quotation Header </th><td colspan="3" style="text-align:left;">${QTN_OBJ.quotationName}</td>
		</tr>
		<tr>
			<th style="width:25%;background: #FFC300;color:black;" colspan="4"> Services to be included</th>
		</tr>
		<tr>	
			<td style="width:50%;text-align:left;" colspan="2"><label class="container" style="display:inline;"><form:checkbox path="landPackage" name="landPackage" disabled="true"/> <span class="checkmark"></span></label>Package</td>

			<td style="width:25%;text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="flight" name="flight"  disabled="true"/><span class="checkmark"></span></label> Flight</td>
			<td style="width:25%;text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="hotel" name="hotel" disabled="true" /><span class="checkmark"></span></label> Hotel</td>
			
		</tr>
		<tr>	
			<td style="width:25%;text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="transfers" name="transfers" disabled="true" /><span class="checkmark"></span></label> Transfers</td>
			<td style="width:25%;text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="sightseeing" name="sightseeing" disabled="true" /><span class="checkmark"></span></label>SightSeeing</td>
			<td style="width:25%;text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="visa" name="visa" disabled="true" /><span class="checkmark"></span></label>Visa</td>
			<td style="width:25%;text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="insurance" name="insurance" disabled="true" /><span class="checkmark"></span></label>Insurance</td>
		</tr>
		<tr>
			<td style="width:25%;text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="cruise" name="cruise"  disabled="true" /><span class="checkmark"></span></label>Cruise</td>
			<td style="width:25%;text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="others" name="others"  disabled="true" /><span class="checkmark"></span></label>Others</td>
			<td colspan="2">Please select all applicable services for this quotation.</td>
		</tr>
		<tr>
		<th style="width:50%;background: #FFC300;color:black;" colspan="2">Quotation Status</th>
		<td colspan="2">Created</td>
		</tr>
		<tr>
			<td colspan="4">
				<input type="submit" id="deletequotation"  name="deletequotation" value="Confirm Delete" style="background-color:red" />  
				<a href="view_lead_quotations_list?leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
		 	</td>
		 </tr>
		
		</table> 
</form:form>
</body>
</html>