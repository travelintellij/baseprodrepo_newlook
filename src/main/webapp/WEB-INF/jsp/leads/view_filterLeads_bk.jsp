<!DOCTYPE html>
<html>
<jsp:include page="../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<head>
	<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
	<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style>
.menubtn {
  background-color: #3498DB;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
  cursor: pointer;
}

.menubtn:hover, .menubtn:focus {
  background-color: #2980B9;
}

.menudown {
  position: relative;
  display: inline-block;
}

.menudown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  overflow: auto;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.menudown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.menudown a:hover {background-color: #ddd;}

.show {display: block;}
</style>
	
	
	<style>
	body {font-family: Arial, Helvetica, sans-serif;}

	/* The Modal (background) */
	.modal {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  padding-top: 50px; /* Location of the box */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 100%; /* Full height */
	  overflow: scroll; /* Enable scroll if needed */
	  background-color: rgb(0,0,0); /* Fallback color */
	  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content */
	.modal-content {
	  position: relative;
	  background-color: #fefefe;
	  margin: auto;
	  padding: 0;
	  border: 1px solid #888;
	  width: 80%;
	  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
	  -webkit-animation-name: animatetop;
	  -webkit-animation-duration: 0.4s;
	  animation-name: animatetop;
	  animation-duration: 0.4s
	}
	
	/* Add Animation */
	@-webkit-keyframes animatetop {
	  from {top:-300px; opacity:0} 
	  to {top:0; opacity:1}
	}
	
	@keyframes animatetop {
	  from {top:-300px; opacity:0}
	  to {top:0; opacity:1}
	}
	
	/* The Close Button */
	.close {
	  color: white;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	  color: #000;
	  text-decoration: none;
	  cursor: pointer;
	}
	
	.modal-header {
	  padding: 2px 16px;
	  background-color: lightblue;
	  color: white;
	}
	
	.modal-body {padding: 2px 16px;}
	
	.modal-footer {
	  padding: 2px 16px;
	  background-color: lightblue;
	  color: white;
	}
	
		table {
		  width: 100%;
		  height: 60px;
		  border-collapse: collapse;
		  border: 1px solid #38678f;
		  margin: 5px auto;
		  background: white;
		}
		th {
		  background: #7B68EE;
		  height: 40px;
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
		tr:nth-child(even) { 
            background-color: #E2E7DA; 
        } 
		td {
		  border-right: 1px solid #cccccc;
		  padding: 10px;
		  transition: all 0.2s;
		  text-align: center;
		}
		.heavyTable {
		  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
		  animation: float 5s infinite;
		}
		
		input[type=button], input[type=submit], input[type=reset] {
		  background-color: #4CAF50;
		  border: none;
		  color: white;
		  padding: 10px 20px;
		  text-decoration: none;
		  margin: 4px 2px;
		  cursor: pointer;
		}
	</style>
</head>
<br>	
<h3 align="center"><b>Search Leads</b></h3>
<body>	
	
	<form:form action="view_filter_leads" modelAttribute="FILTER_LEAD_WL">
		<input type="hidden" name="onlyLeadOwner" value="true" />
		<table style="width: 90%; ">
			<tr style="height:20px;">
				<th>Traveling From </th>
				<td>
					<form:input path="sourceName" name="sourceName" style="height:30px;width:250px;margin: auto;"/>
					<form:hidden path = "source" />
					<font color="red"> <form:errors path="sourceName" cssClass="error" htmlEscape="false" /></font>
				</td>
				<th>Traveling To </th>
				<td>
					<form:input path="destinationName" name="sourceName" style="height:30px;width:250px;margin: auto;"/>
					<form:hidden path = "destination" />
					<font color="red"> <form:errors path="destinationName" cssClass="error" htmlEscape="false"/></font>
				</td>
				<sec:authorize access="hasAnyRole('ADMIN','LEAD_MANAGER')">
				<th>Lead Owner</th>
				<td>
					<div class="select">
						<form:select path="leadOwner" style="width: 150px;">  
					       <form:options items = "${ACTIVE_USERS_MAP}" class="service-small"/>
					       <form:option value="0" label="***ALL***" class="service-small" />
				        </form:select>  
					</div>
				</td> 
				</sec:authorize>
				<td>
					<label class="container" style="display:inline;"><form:checkbox path="qualified" /><span class="checkmark"></span></label> Qualified &nbsp;&nbsp;
					<label class="container" style="display:inline;"><form:checkbox path="flagged" /><span class="checkmark"></span></label> Flagged
				</td>
				
			</tr>
			</table>
			<table style="width: 90%; ">
			<tr>
				<td style="height:30px"><img src="${pageContext.request.contextPath}/resources/images/filter.jpg" height="50" width="50"/></td>
				<td style="height:30px;vertical-align: middle;">
					Lead Id
					<form:input path="leadId" type="number" min="0" style="height:30px;width:80px;" size="35" value="" placeholder="Lead Number"/>
				</td>
				<td style="height:30px;vertical-align:top;">
					<form:input path="contactName"  id="contactName" name="contactName" size="35" style="width:200px;" placeholder="Contact Name" />

					<input type="hidden" name="contactId" value="0" />
				</td>
				<td style="height:30px">
		        	
		        	<div class="select">
						<form:select path="leadSource" style="width: 150px;">  
					      <form:option value="0" label="***ALL***" class="service-small"/>
					      <form:options items = "${PARTNERS_MAP}" class="service-small"/>
				        </form:select>  
					 </div>
      		      </td>
		        <td style="height:30px">
		        	<div class="select">
					<form:select path="leadStatus">  
			      		<form:option value="0" label="***** All Leads *****" class="service-small"/>
			      		<form:option value="200" label="***** All Open Leads *****" class="service-small"/>
			      		<form:option value="100" label="***** All Closed *****" class="service-small"/>
			      		<form:options items = "${LEAD_STATUS_MAP}" class="service-small" />
		        	</form:select>  
					
					<%-- 
					<select id = "leadStatus" name="leadStatus" style="height:30px;width: 150px;">
						<c:if test="${not empty LEAD_STATUS_LIST}">
					       <c:forEach items="${LEAD_STATUS_LIST}" var="lead_statusObj">
				      			<option class="service-small" value="${lead_statusObj.workloadStatusId}">${lead_statusObj.workloadStatusName}</option>
					   		</c:forEach>
					 </c:if>
					 </select>
					 --%>  
					 </div>
      		      </td>
	        <td>
	        	<div class="select">
				<form:select path="dateCriteria" style="width: 150px;">  
					<form:option value="0" label="Select Date Criteria" class="service-small"/>
					<form:option value="1" label="Creation Date" class="service-small"/>
					<form:option value="2" label="Travel Date" class="service-small"/>
				</form:select>
				 </div>
				 <font color="red"> <form:errors path="dateCriteria" cssClass="error" htmlEscape="false" /></font>
	        </td>
	        <td><form:input path="startDate" type="date"/></td>
	        <td><form:input path="endDate" type="date" />
	        	<font color="red"> <form:errors path="endDate" cssClass="error" htmlEscape="false" /></font>
	        </td>
 			<td style="height:30px"><input style="background-color:red;" type="submit" value="Apply Filter" /> </td>
			<td style="height:30px"><a href="view_filter_leads"><input type="button" value="Clear Filter" /></a></td>
			</tr>
		</table>
		<hr>
		<table>
			<tr>
				<th style="width:8%;">Lead Id</th>
				<th style="width:5%;">Flagged</th>
				<th style="width:5%;">Qualified</th>
				<th style="width:13%;">Client Name</th>
				<th style="width:10%;">Destination</th>
				<th style="width:9%;">Reference</th>
				<th style="width:8%;">Travel Start Date</th>
				<th style="width:8%;">Travel End Date</th>
				<th style="width:8%;">Status</th>
				<th style="width:8%;">Owner</th>
				<th style="width:20%;" colspan="2">Action</th>
			</tr>
			<c:forEach items="${FILTERED_LEADS_RECORDS}" var="filteredLeads">
				<tr style="height:60px;">
					<td style="width:8%;">
						<a style="cursor: pointer;" id="myBtn[${filteredLeads.leadId}]" onclick="myLeadDisplay(this)" data-load-url="view_lead_details_modal?leadId=${filteredLeads.leadId}" data-toggle="modal" data-target="#myModal" >
							Q-${String.format("%04d",filteredLeads.leadId)}-${filteredLeads.leadSourceShortName }
						</a>
					</td>
					<td style="width:5%;">
							<c:if test="${filteredLeads.flagged eq true}">
								<img style="border: 10px solid transparent;" src="${pageContext.request.contextPath}/resources/images/flagged.png" height="20" width="20" />
							</c:if>
							<c:if test="${filteredLeads.flagged eq false}">
								${filteredLeads.flagged}
							</c:if>
					</td>
					<td style="width:5%;">
							<c:if test="${filteredLeads.qualified eq true}">
								<img style="border: 10px solid transparent;" src="${pageContext.request.contextPath}/resources/images/qualified.png" height="20" width="20" />
							</c:if>
							<c:if test="${filteredLeads.qualified eq false}">
								${filteredLeads.qualified}
							</c:if>
					</td>
					<td style="width:13%;">${filteredLeads.contactName}</td>
					<td style="width:10%;">${filteredLeads.destinationName}</td>
					<td style="width:9%;">${filteredLeads.leadSourceName}</td>
					<td style="width:8%;"><fmt:formatDate value="${filteredLeads.travelStartDate}" pattern="dd-MM-yyyy" /></td>
					<td style="width:8%;"><fmt:formatDate value="${filteredLeads.travelEndDate}" pattern="dd-MM-yyyy" /></td>
					
					<td style="width:8%;">${filteredLeads.statusName}</td>
					<td style="width:8%;">${filteredLeads.leadOwnerName}</td>
					<td style="width:20%;" colspan="2">
						<!-- 
						<a href="view_lead_details?leadId=${filteredLeads.leadId }"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"value="View" /></a> | 
						<a href="form_view_editlead?leadId=${filteredLeads.leadId }"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"value="Edit" /></a> 
					 	-->
					<!-- Trigger/Open The Modal -->
						 
						 <a href="form_view_lead_followup_details?leadId=${filteredLeads.leadId }"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"  value="FollowUp" /></a> |
						<a href="form_view_editlead?leadId=${filteredLeads.leadId }"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"value="Edit" /></a> |  
						<a href="view_form_search_supplier_quote?leadId=${filteredLeads.leadId }"><input type="button" style="background-color: green;padding: 4px 5px;"value="Request Quote" /></a>
						<a href="view_lead_quotations_list?leadId=${filteredLeads.leadId }"><input type="button" style="color:black;background-color: #FFC300;padding: 4px 5px;"value="Quotations" /></a>
						
						<a href="form_view_lead_reminder_details?leadId=${filteredLeads.leadId }&page=${page}"><input type="button" style="color:white;background-color: purple;padding: 4px 5px;"value="Reminder" /></a>
					
					
					</td>
				</tr>
			</c:forEach>
		</table>
	
		<!-- The Modal -->
						<div id="myModal" class="modal">
						
						  <!-- Modal content -->
						  <div class="modal-content">
						    <div class="modal-header">
						      <span class="close">&times;</span>
						      <br><h2 style="text-align:center;">View Lead Details</h2>
						    </div>
						    <div class="modal-body">
						
						
						    </div>
						    <div class="modal-footer">
						      <h3>Powered by @TravelIntelliJ</h3>
						    </div>
						  </div>
						
						</div>
	
				<div id="pagination" align="right">
				Page: 
			    <c:url value="view_filter_leads" var="prev">
			       <c:param name="page" value="${page-1}"/>
			    </c:url>
			    <c:if test="${page > 0}">
			        <a href="<c:out value="${prev}&sortBy=${sortBy}&qualified=${FILTER_LEAD_WL.qualified}&flagged=${FILTER_LEAD_WL.flagged}&leadOwner=${FILTER_LEAD_WL.leadOwner}&leadSource=${FILTER_LEAD_WL.leadSource}&leadStatus=${FILTER_LEAD_WL.leadStatus}&source=${FILTER_LEAD_WL.source}&sourceName=${FILTER_LEAD_WL.sourceName}&destinationName=${FILTER_LEAD_WL.destinationName}&destination=${FILTER_LEAD_WL.destination}&contactId=${FILTER_LEAD_WL.contactId}&contactName=${FILTER_LEAD_WL.contactName}&dateCriteria=${FILTER_LEAD_WL.dateCriteria}&startDate=${FILTER_LEAD_WL.startDate}&endDate=${FILTER_LEAD_WL.endDate}" />" class="pn prev">Prev</a>
			    </c:if>
			
			    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
			        <c:choose>
			            <c:when test="${(page+1) == i.index}">
			                <span>${i.index}</span>
			            </c:when>
			            <c:otherwise>
			                <c:url value="view_filter_leads" var="url">
			                    <c:param name="page" value="${i.index-1}"/>
			                </c:url>
			                 <a href='<c:out value="${url}&sortBy=${sortBy}&qualified=${FILTER_LEAD_WL.qualified}&flagged=${FILTER_LEAD_WL.flagged}&leadOwner=${FILTER_LEAD_WL.leadOwner}&leadSource=${FILTER_LEAD_WL.leadSource}&leadStatus=${FILTER_LEAD_WL.leadStatus}&source=${FILTER_LEAD_WL.source}&sourceName=${FILTER_LEAD_WL.sourceName}&destinationName=${FILTER_LEAD_WL.destinationName}&destination=${FILTER_LEAD_WL.destination}&contactId=${FILTER_LEAD_WL.contactId}&contactName=${FILTER_LEAD_WL.contactName}&dateCriteria=${FILTER_LEAD_WL.dateCriteria}" />'>${i.index}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:url value="view_filter_leads" var="next">
			        <c:param name="page" value="${page + 1}"/>
			    </c:url>
			    <c:if test="${page + 1 < maxPages}">
			       <a href='<c:out value="${next}&sortBy=${sortBy}&qualified=${FILTER_LEAD_WL.qualified}&flagged=${FILTER_LEAD_WL.flagged}&leadOwner=${FILTER_LEAD_WL.leadOwner}&leadSource=${FILTER_LEAD_WL.leadSource}&leadStatus=${leadStatus}&source=${FILTER_LEAD_WL.source}&sourceName=${FILTER_LEAD_WL.sourceName}&destinationName=${FILTER_LEAD_WL.destinationName}&destination=${FILTER_LEAD_WL.destination}&contactId=${FILTER_LEAD_WL.contactId}&contactName=${FILTER_LEAD_WL.contactName}&dateCriteria=${FILTER_LEAD_WL.dateCriteria}&startDate=${FILTER_LEAD_WL.startDate}&endDate=${FILTER_LEAD_WL.endDate}" />' class="pn next">Next</a>
			    </c:if>
			</div>
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
<script>
/* When the user clicks on the button, 
toggle between hiding and showing the menudown content */
function myFunction(clicked) {
  document.getElementById($(clicked)).classList.toggle("show");
}

// Close the menudown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.menubtn')) {
    var menudowns = document.getElementsByClassName("menudown-content");
    var i;
    for (i = 0; i < menudowns.length; i++) {
      var openmenudown = menudowns[i];
      if (openmenudown.classList.contains('show')) {
        openmenudown.classList.remove('show');
      }
    }
  }
}
</script>
</body>
</html>