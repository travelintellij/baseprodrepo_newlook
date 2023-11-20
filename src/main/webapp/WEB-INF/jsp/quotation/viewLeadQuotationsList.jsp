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
  height: 30px;
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
  padding: 10px;
  transition: all 0.2s;
  text-align: center;
}
input[type=button], input[type=submit], input[type=reset] {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  cursor: pointer;
}


</style>
<br>
<h2 align="center">View Quotations</h2>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<form:form modelAttribute="LEAD_OBJ" action="form_view_editlead">
	<form:hidden path = "leadId" />
	<div align="center"><b><font color="green" > ${Success} </font><font color="red" size="5">${Error}</font> </b></div>
	<hr>
	<div align="right">
		<input type="submit" id="editLead"  name="editLead" value="Edit Lead" />  
		<a href="view_filter_leads"><input type="button" style="background-color:blue;" value="Search Again" /></a> 
	</div>	
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
			<th>Lead Owner</th><td><b>${LEAD_OBJ.leadOwnerName}</b></td>	
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
		<tr >
			<th>Select Services</th>
			<td style="text-align:left;" colspan="2">
				<label class="container" style="display:inline;"><form:checkbox path="landPackage" name="landPackage;" disabled="true" /> <span class="checkmark"></span></label>Package	
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
		
	
	</table>
    
	<br>

	<hr>
	
	<div align="center">
		<a href="form_view_new_quotation?leadId=${LEAD_OBJ.leadId }"><input type="button" style="background-color:#900C3F;" value="Create New Quotation" /></a>
	</div>	
	<table>
		<tr style="background-color:#FFD633;color:black;">
			<td style="border-width:5px;"><b>Quotation Id</b></td>
			<td style="border-width:5px;"><b>Version</b></td>
			<td style="border-width:5px;"><b>Quotation Name</b></td>
			<td style="border-width:5px;"><b>Created Date</b></td>
			<td style="border-width:5px;"><b>Last Edited</b></td>
			<td style="border-width:5px;"><b>Action</b></td>
			<td style="border-width:5px;"><b>Status</b></td>
		</tr>
	<c:forEach items="${LEAD_OBJ.leadQuotationsList}" var="leadquotations">
		<tr>
			<td style="border-width:5px;">${leadquotations.quotationId }</td>
			<td style="border-width:5px;">${leadquotations.version }</td>
			<td style="border-width:5px;">${leadquotations.quotationName}</td>
			<td style="border-width:5px;"><fmt:formatDate value="${leadquotations.createdAt }" pattern="dd-MMM-yyyy HH:MM" /></td>
			<td style="border-width:5px;">${leadquotations.updatedAt }</td>
			<c:if test="${ (leadquotations.converted ne true)  }">
				<c:choose>
			            <c:when test="${ (leadquotations.version gt CONVERTED_QTN.version) && (CONVERTED_QTN.version gt 0) }">
    						<td style="border-width:5px;;">
								<a href="form_view_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"value="View" /></a> | 
								<a href="form_view_edit_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"  value="Edit" /></a> |
								<a href="form_view_delete_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }"><input type="button" style="background-color: red;padding: 4px 5px;"  value="Delete" /></a>
								| 
								<a href="form_view_duplicate_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }"><input type="button" style="background-color: green;padding: 4px 5px;"  value="Duplicate Quotation"  /></a>
								|
								<a ><input type="button" style="background-color: lightgrey;padding: 4px 5px;"  value="Lock-And-Convert" /></a>
							</td>
			            </c:when>
			            <c:when test="${ leadquotations.version lt CONVERTED_QTN.version  }">
			            	<td style="border-width:5px;;">
								<a href="form_view_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"value="View" /></a> |
								<a ><input type="button" style="background-color: lightgrey;padding: 4px 5px;"  value="Edit" /></a> | 
								<a ><input type="button" style="background-color: lightgrey;padding: 4px 5px;"  value="Delete" /></a> | 
								<a href="form_view_duplicate_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }"><input type="button" style="background-color: green;padding: 4px 5px;"  value="Duplicate Quotation"  /></a> | 
								<a ><input type="button" style="background-color: lightgrey;padding: 4px 5px;"  value="Lock-And-Convert" /></a>
							</td>
			            </c:when>

			            <c:otherwise>
    						<td style="border-width:5px;;">
								<a href="form_view_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"value="View" /></a> | 
								<a href="form_view_edit_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"  value="Edit" /></a> |
								<a href="form_view_delete_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }"><input type="button" style="background-color: red;padding: 4px 5px;"  value="Delete" /></a>
								| 
								<a href="form_view_duplicate_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }"><input type="button" style="background-color: green;padding: 4px 5px;"  value="Duplicate Quotation"  /></a>
								|
								<a href="form_convert_new_deal?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }" aria-disabled="true"><input type="button" style="background-color: maroon;padding: 4px 5px;"  value="Lock-And-Convert" /></a>
							</td>
			            </c:otherwise>
			             
			    </c:choose>

					<td style="border-width:5px;;">
							<Input type="button" value="Generated" style="background-color:lightgray;color:black;cursor:none;" />
					</td>
				</c:if>
				<c:if test="${ leadquotations.converted eq true }">
					<td style="border-width:5px;;">
						<a href="form_view_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"value="View" /></a> |
						<a ><input type="button" style="background-color: lightgrey;padding: 4px 5px;"  value="Edit" /></a> | 
						<a ><input type="button" style="background-color: lightgrey;padding: 4px 5px;"  value="Delete" /></a> | 
						<a href="form_view_duplicate_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }"><input type="button" style="background-color: green;padding: 4px 5px;"  value="Duplicate Quotation"  /></a> | 
						<a ><input type="button" style="background-color: lightgrey;padding: 4px 5px;"  value="Lock-And-Convert" /></a>
					</td>
					<td style="border-width:5px;;">
						<Input type="button" value="CONVERTED" style="background-color:green;cursor:none;" />
					</td>
				</c:if>
		</tr>
	</c:forEach>
	</table>
	</form:form>
	
	<div id="myModal" class="modal">	
		  <!-- Modal content -->
		  <div class="modal-content">
		    <div class="modal-header">
		      <span class="close">&times;</span>
		      <br><h2 style="text-align:center;">Confirm Quotation Version Delete</h2>
		    </div>
		    <div class="modal-body">
		
		
		    </div>
		    <div class="modal-footer">
		      <h3 align="center">Powered by @TravelIntelliJ</h3>
		    </div>
		  </div>
	</div>




 
 
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
	
<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];



function myLeadDisplay(clicked) { 
	//alert(clicked); 
	$("#myModal .modal-body").load($(clicked).attr('data-load-url'));
	modal.style.display = "block";
}   
// When the user clicks the button, open the modal 
/*btn.onclick = function() {
	//$("#myModal .modal-body").html('pass your html text here');
	$("#myModal .modal-body").load($(this).attr('data-load-url'));
	modal.style.display = "block";
  
}*/

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
	
 </body>
  
  </html>
  