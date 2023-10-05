<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>

<form:form modelAttribute="MANUAL_OTH" action="create_create_other_manual_quotation">
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<table style="width:100%;  table-layout:fixed;background-color: #DFE0DC; border: 3px solid #000000; border-collapse: collapse" >
		<caption>Add Service to quotation</caption>
		<tr>
			<th style="width:30%;background-color:#78281F;"><font size="4"><b>Service Name</b></font></th>
			<th colspan="4" style="width:50%;background-color:#78281F;"><font size="4"><b>Service Details</b></font></th>
			<th style="width:20%;background-color:#78281F;"><font size="4"><b>Service Date</b></font></th>
		</tr>
		<tr>
			<td><form:input path="serviceName" style="width: 300px;height:40px;" type="text" id="serviceName" required="required"/></td>
			<td colspan="4"><form:textarea path="serviceDetails" rows="5" cols="50" maxlength="3000" required="required"/></td>
			<td>	<form:input type="date" path="serviceDate" required="required" /> </td>
		</tr>

		<tr>	
			<th style="background-color:#78281F;"><font size="4"><b>Service Cost</b></font></th>
			<td><form:input path="serviceCost" type="number" min="0" style="height:30px;width:120px;margin: auto;"/></td>
			<th style="background-color:#78281F;"><font size="4"><b>Service Markup</b></font></th>
			<td><form:input path="serviceMarkup" type="number" min="0" style="height:30px;width:120px;margin: auto;"/></td>
			<th style="background-color:#78281F;"><font size="4"><b>Display Order</b></font></th>
			<td><form:input path="displayOrder" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
		</tr>

		<tr>
			<th colspan="6">
				<input type="submit" style="background-color:blue;" value="Add Service" />
				<a href="form_view_other_quotation_details?quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:red;" value="Cancel" /></a>
			</th>
		</tr>
	</table>	
	
</form:form>

   