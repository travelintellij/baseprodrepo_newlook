<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
<form:form modelAttribute="LEAD_OBJ" action="form_view_editlead">
	<form:hidden path = "leadId" />
	<h2>Lead Details</h2>
	<table style="width:95%;" align="left">
		<tr>
		<th>Lead Id </th><td align="center">Q-${String.format("%04d",LEAD_OBJ.leadId)}-${LEAD_OBJ.leadSourceShortName }</td>
		
		<th>Client</th>
		<td>
			${LEAD_OBJ.contactName}
		</td>
		</tr>
		<tr>
			<th>Source</th>
			<td>
				${LEAD_OBJ.sourceName}
			</td>
			<th>Destination</th>
			<td>
				${LEAD_OBJ.destinationName}
			</td>
		</tr>
		<tr>
			<th>Adults </th><td>${LEAD_OBJ.adults}</td>
			<th>Children</th><td>${LEAD_OBJ.children} (Age ${LEAD_OBJ.childrenAgeInfo} ) </td>
		</tr>
		<tr>
			<th style="width:30%;">Travel S.Date</th><td><fmt:formatDate value="${LEAD_OBJ.travelStartDate}" pattern="dd-MM-yyyy" /></td>
			<th style="width:30%;">Travel E.Date</th><td><fmt:formatDate value="${LEAD_OBJ.travelEndDate}" pattern="dd-MM-yyyy" /></td>
		</tr>
		<tr>
		<th>Lead Source</th>
			<td align="center">
				${LEAD_OBJ.leadSourceName}
			</td>
			<th>Status</th>
		<td align="center">${LEAD_OBJ.statusName}</td>
		
		</tr>
	</table>
	<table style="width:95%;" align="left">
		<tr style="background-color:#FFD633;">
			<th colspan="3">Services Requested</th>
		</tr>
		<tr>
			<td style="text-align:left;" colspan="2">
				<label class="container" style="display:inline;"><form:checkbox path="landPackage" name="landPackage;" disabled="true" /> <span class="checkmark"></span></label>Package	
			</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="flight" name="flight" disabled="true" /><span class="checkmark"></span></label> Flight</td>
			
		</tr>
		<tr>		
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="hotel" name="hotel" disabled="true" /><span class="checkmark"></span></label> Hotel</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="transfers" name="transfers" disabled="true" /><span class="checkmark"></span></label> Transfers</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="sightseeing" name="sightseeing" disabled="true" /><span class="checkmark"></span></label>SightSeeing</td>
			
		</tr>
		<tr>	
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="visa" name="visa" disabled="true" /><span class="checkmark"></span></label>Visa</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="insurance" name="insurance" disabled="true" /><span class="checkmark"></span></label>Insurance</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="cruise" name="cruise" disabled="true" /><span class="checkmark"></span></label>Cruise</td>
		</tr>
		<tr>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="others" name="others" disabled="true" /><span class="checkmark"></span></label>Others</td>
			<td colspan="2"> These services are requested by the client for quotation. </td>
		
		</tr>
		<tr><th colspan="3">Remarks</th></tr>
		<tr><td colspan="3">${LEAD_OBJ.clientRemarks}</td></tr>
	</table>
	
	</form:form>