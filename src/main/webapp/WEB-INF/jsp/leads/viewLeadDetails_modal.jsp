<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<body>
	<form:form modelAttribute="LEAD_OBJ" action="form_view_editlead">
	<form:hidden path = "leadId" />
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<hr>
	<table>
		<tr>
		<th>Lead Id </th><td align="center">Q-${String.format("%04d",LEAD_OBJ.leadId)}-${LEAD_OBJ.leadSourceShortName }</td>
		<th>Is Qualified</th><td style="text-align:center;"><label class="container" style="display: table;margin: 0 auto;margin-bottom: 25px;"><form:checkbox path="qualified" disabled="true" /><span class="checkmark"></span></label></td>
		<th>Is Flagged</th>
		<td style="text-align:center;">
			<label class="container" style="display: table;margin: 0 auto;margin-bottom: 25px;">
				<form:checkbox path="flagged" disabled="true" />
				<span class="checkmark"></span>
			</label>
		</td>
		<th>Client</th>
		<td>
			${LEAD_OBJ.contactName}
		</td>
		<th>Lead Owner</th><td style="background-color:#66ff00;"><b>${LEAD_OBJ.leadOwnerName}</b></td>
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
			<th>Adults </th><td>${LEAD_OBJ.adults}</td>
			<th>Children</th><td>${LEAD_OBJ.children}</td>
			<th>Age</th><td>${LEAD_OBJ.childrenAgeInfo}</td>
		</tr>
		<tr>
			<th>Lead Source</th>
			<td align="center">
				${LEAD_OBJ.leadSourceName}
			</td>
			<th>Travel Date</th><td><fmt:formatDate value="${LEAD_OBJ.travelStartDate}" pattern="dd-MM-yyyy" /></td>
			<th>Travel End Date</th><td><fmt:formatDate value="${LEAD_OBJ.travelEndDate}" pattern="dd-MM-yyyy" /></td>
			<th>Tentative Amount</th><td>${LEAD_OBJ.tentativeCost}</td>
			<th>Status</th>
			<td align="center">${LEAD_OBJ.statusName}</td>
		</tr>
	</table>
	
	<table>
		<tr style="background-color:#FFD633;">
			<th>Select Services</th>
			<td style="text-align:left;">
				<label class="container" style="display:inline;" colspan="2"><form:checkbox path="landPackage" name="landPackage;" disabled="true" /> <span class="checkmark"></span></label>Package 	
			</td>
			
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="flight" name="flight" disabled="true" /><span class="checkmark"></span></label> Flight</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="hotel" name="hotel" disabled="true" /><span class="checkmark"></span></label> Hotel</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="transfers" name="transfers" disabled="true" /><span class="checkmark"></span></label> Transfers</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="sightseeing" name="sightseeing" disabled="true" /><span class="checkmark"></span></label>SightSeeing</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="visa" name="visa" disabled="true" /><span class="checkmark"></span></label>Visa</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="insurance" name="insurance" disabled="true" /><span class="checkmark"></span></label>Insurance</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="cruise" name="cruise" disabled="true" /><span class="checkmark"></span></label>Cruise</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="others" name="others" disabled="true" /><span class="checkmark"></span></label>Others</td>
		</tr>
		
		<tr><th>Client Remarks</th><td colspan="9" style="text-align:left;"><b><pre>${LEAD_OBJ.clientRemarks}</pre></b>
		 </td></tr>
		<tr><th>Internal Remarks</th><td colspan="9" style="text-align:left;"><b><pre>${LEAD_OBJ.internalRemarks}</pre></b>
		</td></tr>
		
		<tr>
			<th>Tagged Team Mates</th>
			<td colspan="9" style="text-align:left;">
				<c:forEach items="${LEAD_OBJ.team}" var="leadteam">
							<li>${leadteam.name}</li>
				</c:forEach>
			</td>
		</tr>
	
		<tr><td colspan="10">
			<label class="container" style="display:inline;"><form:checkbox path="leadCreationClientInformed" disabled="true"/> <span class="checkmark"></span></label>Client Informed (Email Sent) </td></tr>
		<tr>
			<td colspan="10">
				<input type="submit" id="editLead"  name="editLead" value="Edit Lead" />  
			</td>
		</tr>
	</table>
	



    </form:form>
 
 
 <script>
	
	$(document).ready(function() {
		$('#contactName').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getClientList',
			paramName: "tagName",
			delimiter: ",",
			onSelect: function(suggestion) {
	            cityID = suggestion.data;
	            id=cityID;
	            jQuery("#contactId").val(cityID);
	            $('input[name=contactId]').val(id);
	            return false;
	        },
			transformResult: function(response) {
		        return {
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	return { value: item.tagName, data: item.id };
		            })
		            
		        };
		    }
		});
		
		
		$('#sourceName').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getCityList',
			paramName: "cityName",
			delimiter: ",",
			onSelect: function(suggestion) {
	            cityID = suggestion.data;
	            id=cityID;
	            jQuery("#destinationId").val(cityID);
	            $('input[name=source]').val(id);
	            return false;
	        },
			transformResult: function(response) {
		        return {
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	return { value: item.cityName, data: item.destinationId };
		            })
		            
		        };
		    }
		});
		
		$('#destinationName').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getCityList',
			paramName: "cityName",
			delimiter: ",",
			onSelect: function(suggestion) {
	            cityID = suggestion.data;
	            id=cityID;
	            jQuery("#destinationId").val(cityID);
	            $('input[name=destination]').val(id);
	            return false;
	        },
			transformResult: function(response) {
		        return {
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	return { value: item.cityName, data: item.destinationId };
		            })
		            
		        };
		    }
		});
	});
	
	
	
	</script>
 </body>
  
  </html>
  