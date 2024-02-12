<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Leads</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/leadstyle.css">
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
</head>
<style>
        .autocomplete-suggestions { border: 1px solid #999; background: red;overflow-y:auto}
		.autocomplete-suggestion {padding: 2px 5px;color:white; background: black;overflow-y: auto;overflow-y:auto}
		.autocomplete-selected { background: #F0F0F0;overflow-y:auto} 
		.autocomplete-suggestions strong { font-weight: normal; color:#FABA08;overflow-y:auto}
		.autocomplete-group { padding: 2px 5px;overflow-y:auto}
		.autocomplete-group strong { display: block; border-bottom: 1px solid #000;  background: black ; color:black overflow-y:auto}
		.autocomplete-selected:hover{
		color:black
		}

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
	  color: white;
	}
	
	.modal-body {padding: 2px 16px;}
	
	.modal-footer {
	  padding: 2px 16px;
	  background-color: lightblue;
	  color: white;
	}

        body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/lens.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            background-attachment: fixed;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0.5; /* Adjust the opacity value as needed (0.0 to 1.0) */
            z-index: -1;
        }
</style>

<body>
   
<div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>

    <!-- ######################### Search leads ####################### -->


    <div class="form searchLeads container">
        
        <form:form action="view_filter_leads" modelAttribute="FILTER_LEAD_WL">
            <!-- ############## start of upper part ############# -->
            <div class="upperPart">
                <input type="hidden" name="onlyLeadOwner" value="true" />
                <h1 class="heading" style="color:black">Search Leads</h1>
                <div class="firstL">
                    <div class="box1 box">
                        <label for="tf">Traveling From</label><br>
                        <form:input path="sourceName" name="sourceName" id="sourceName" class="inf"  />
						<form:hidden path = "source" />
                        <font color="red">
                            <form:errors cssClass = "error" path="sourceName" htmlEscape="false"  style="font-size:13px;font-weight:bold"/>
                        </font>
                    </div>
                    <div class="box2 box">
                        <label for="tt">Traveling To</label><br>
                        
                        <form:input path="destinationName" name="destinationName" id="destinationName" class="inf"  />
                        <form:hidden path = "destination" />
                        <font color="red">
                            <form:errors path="destinationName" cssClass="error" htmlEscape="false" style="font-size: 13px;font-weight:bold"/>
                        </font>
                    </div>
                    <!-- <sec:authorize access="hasAnyRole('ADMIN','LEAD_MANAGER')">
                        <th>Lead Owner</th>
                        <td>
                            <div class="select">
                                <form:select path="leadOwner" style="width: 150px;">
                                    <form:options items="${ACTIVE_USERS_MAP}" class="service-small" />
                                    <form:option value="0" label="***ALL***" class="service-small" />
                                </form:select>
                            </div>
                        </td>
                    </sec:authorize> -->
                    <div class="box3 box chflex">
                        <form:checkbox path="qualified" id="quali" />
                        <label for="quali">Qualified</label>
                    </div>
                    <div class="box4 box chflex">
                       <form:checkbox path="flagged" id="flag" />
                        <label for="flag">Flagged</label>
                    </div>
                    <div class="l2Box1 box" style="margin-right:22px">
                        <label for="id">Lead id</label> <br>
                        <form:input path="leadId" type="number" min="0" size="35" value="" id="id" class="inf" placeholder="Lead Number" />
                    </div>
                    <div class="l2Box2 box contactName">
                        <label for="cn">Contact Name</label> <br>
                        <form:input path="contactName"  id="contactName" name="contactName" size="35" style="width:200px;" placeholder="Contact Name" class="inf" />
                        <input type="hidden" name="contactId" value="0" />
                    </div>
                </div>
                <div class="secondL">
                    <div class="l3Box3 box">
                        <label for="all">Lead Source</label> <br>
                        <form:select path="leadSource" class="inf">  
					      <form:option value="0" label="***ALL***" class="service-small"/>
					      <form:options items = "${PARTNERS_MAP}" class="service-small"/>
				        </form:select>  
                    </div>
                    <div class="l4Box4 box">
                        <label for="aol">All Open Leads</label> <br>
                        <form:select path="leadStatus" class="inf">  
				      		<form:option value="0" label="*** All Leads ***" class="service-small"/>
				      		<form:option value="200" label="*** All Open Leads ***" class="service-small"/>
				      		<form:option value="100" label="*** All Closed ***" class="service-small"/>
				      		<form:options items = "${LEAD_STATUS_MAP}" class="service-small" />
		        		</form:select>  
                        <!-- <select id="leadStatus" name="leadStatus" style="height:30px;width: 150px;">
                            <c:if test="${not empty LEAD_STATUS_LIST}">
                                <c:forEach items="${LEAD_STATUS_LIST}" var="lead_statusObj">
                                    <option class="service-small" value="${lead_statusObj.workloadStatusId}">
                                        ${lead_statusObj.workloadStatusName}</option>
                                </c:forEach>
                            </c:if>
                        </select> -->
                    </div>
                    <div class="l3Box1 box">
                        <label for="dsc">Date Search Criteria</label> <br>
                       <form:select path="dateCriteria" class="dsc">  
							<form:option value="0" label="Select Date Criteria" class="service-small"/>
							<form:option value="1" label="Creation Date" class="service-small"/>
							<form:option value="2" label="Travel Date" class="service-small"/>
						</form:select> <br>
                        <font color="red">
                            <form:errors path="dateCriteria" cssClass="error" htmlEscape="false"  style="font-size: 13px;font-weight:bold"/>
                        </font>
                    </div>
                    <div class="l3Box2 box fromBox">
                        <label for="">From</label> <br>
                        <form:input path="startDate" type="date" class="inf" />
                    </div>
                    <div class="l3Box3 box tobox">
                        <label for="">To</label> <br>
						<form:input path="endDate" type="date" class="inf" />
                    </div>
                </div>
                <div class="btns">
                    <div class="inBtns">
                        <input type="submit" value="Apply Filter" class="btn btn1">
                        <a href="view_filter_leads" class="btn">Clear Filter</a>
                    </div>
                </div>
            </div>
            <!-- ############## end of upper part ############# -->

            <div id="myModal" class="modal" style="background: rgba(0, 0, 0, 0.8);margin-top:80px">
						
						  <!-- Modal content -->
						  <div class="modal-content" style="background:black;border-radius:10px">
						    <div class="modal-header">
						      <span class="close" style="color:red;"><i class="fa-solid fa-xmark fa-xl"></i></span>
						    </div>
						    <div class="modal-body">
						
						
						    </div>

						  </div>
						
						</div>
      
      
      
         
      
      
            
            
            	
            <!-- ############## end of lower part ############# -->
	</form:form>
    </div>
    
     <div class="full-names container">
            <p><span>F</span> : Flagged</p>
            <p><span>Q</span> : Qualified</p>
            <p><span>Tsd</span> : Travel Start Date</p>
            <p><span>Ted</span>: Travel End Date</p>
            </div>
    
             <!-- ############## start of lower part ############# -->
            <div class="lowerPart" style="padding-bottom:50px">
            
           
            
            
                <table border="1" style="color:black">
                    <thead style="background:#6082B6;height:50px">
                        <th style="color:black" >Lead id</th>
                        <th style="width:3%;color:black">F</th>
                        <th style="width:3%;color:black">Q</th>
                        <th style="width:350px;color:black">Client Name</th>
                        <th style="color:black">Destination</th>
                        <th style="color:black">Reference</th>
                        <th style="color:black">Tsd</th>
                        <th style="color:black">Ted</th>
                        <th style="color:black">Status</th>
                        <th style="color:black">Owner</th>
                        <th style="color:black">Action</th>
                    </thead>
                    <tbody>
                  	<c:forEach items="${FILTERED_LEADS_RECORDS}" var="filteredLeads">
						<tr>
							<td class="leadId" style="border-bottom:2px solid black;border-right:2px solid black;border-left:2px solid black"">
								<a style="cursor: pointer;" id="myBtn[${filteredLeads.leadId}]" onclick="myLeadDisplay(this)" data-load-url="view_lead_details_modal?leadId=${filteredLeads.leadId}" data-toggle="modal" data-target="#myModal" >
									Q-${String.format("%04d",filteredLeads.leadId)}-${filteredLeads.leadSourceShortName }
								</a>
							</td>
							<c:if test="${filteredLeads.flagged eq true}">
								<td class="tick" style="border-bottom:2px solid black;border-right:2px solid black"><i class="fa-solid fa-check"></i></td>
							</c:if>
							<c:if test="${filteredLeads.flagged eq false}">
								<td class="cross" style="border-bottom:2px solid black;border-right:2px s olid black"><i class="fa-solid fa-xmark"></i></td>
							</c:if>
							<c:if test="${filteredLeads.qualified eq true}">
								<td class="tick" style="border-bottom:2px solid black;border-right:2px solid black"><i class="fa-solid fa-check"></i></td>
									</c:if>
									<c:if test="${filteredLeads.qualified eq false}">
								<td class="cross" style="border-bottom:2px solid black;border-right:2px solid black"><i class="fa-solid fa-xmark"></i></td>
							</c:if>
							<td style="border-bottom:2px solid black;border-right:2px solid black">${filteredLeads.contactName}</td>
							<td style="border-bottom:2px solid black;border-right:2px solid black">${filteredLeads.destinationName}</td>
							<td style="border-bottom:2px solid black;border-right:2px solid black">${filteredLeads.leadSourceName}</td>
							<td style="border-bottom:2px solid black;border-right:2px solid black"><fmt:formatDate value="${filteredLeads.travelStartDate}" pattern="dd-MM-yyyy" /></td>
							<td style="border-bottom:2px solid black;border-right:2px solid black"><fmt:formatDate value="${filteredLeads.travelEndDate}" pattern="dd-MM-yyyy" /></td>
							
							<td style="border-bottom:2px solid black;border-right:2px solid black">${filteredLeads.statusName}</td>
							<td style="border-bottom:2px solid black;border-right:2px solid black">${filteredLeads.leadOwnerName}</td>
							    <td class="st fili" style="border-bottom:2px solid black;border-right:2px solid black">
	                               <i class="fa-solid fa-sliders st1" style="color:black">
	                                   <div class="ul" style="background:gray">
	                                       <ul>
	                                           <li><a href="form_view_lead_followup_details?leadId=${filteredLeads.leadId }"
	                                                   class="pop-up">FollowUp</a></li>
	                                           <li><a href="form_view_editlead?leadId=${filteredLeads.leadId }"
	                                                   class="pop-up">Edit</a></li>
	                                           <li><a href="view_form_search_supplier_quote?leadId=${filteredLeads.leadId }"
	                                                   class="pop-up">Request Quote</a></li>
	                                           <li><a href="view_lead_quotations_list?leadId=${filteredLeads.leadId }"
	                                                   class="pop-up">Quotations</a></li>
	                                           <li><a href="form_view_lead_reminder_details?leadId=${filteredLeads.leadId }&page=${page}"
	                                                   class="pop-up">Reminder</a></li>
	                                       </ul>
	                                   </div>
	                               </i>
	                           </td>
						</tr>
					</c:forEach>
                    </tbody>
                </table>
            </div>
            
            
            
            <!-- The Modal -->
						<div id="myModal" class="modal" style="margin-top:100px">
						
						  <!-- Modal content -->
						  <div class="modal-content">
						    <div class="modal-header">
						      <span class="close">&times;</span>
						    </div>
						    <div class="modal-body">
						    </div>
						  </div>
						
						</div>
            
            
            
      
<div id="pagination" align="center" class="container">
<p style="color:#ffa500;background:black;display:inline-block;padding:2px;border-radius:2px">Page : </p>
				
			    <c:url value="view_filter_leads" var="prev">
			       <c:param name="page" value="${page-1}"/>
			    </c:url>
			    <c:if test="${page > 0}">
			        <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href="<c:out value="${prev}&sortBy=${sortBy}&qualified=${FILTER_LEAD_WL.qualified}&flagged=${FILTER_LEAD_WL.flagged}&leadOwner=${FILTER_LEAD_WL.leadOwner}&leadSource=${FILTER_LEAD_WL.leadSource}&leadStatus=${FILTER_LEAD_WL.leadStatus}&source=${FILTER_LEAD_WL.source}&sourceName=${FILTER_LEAD_WL.sourceName}&destinationName=${FILTER_LEAD_WL.destinationName}&destination=${FILTER_LEAD_WL.destination}&contactId=${FILTER_LEAD_WL.contactId}&contactName=${FILTER_LEAD_WL.contactName}&dateCriteria=${FILTER_LEAD_WL.dateCriteria}&startDate=${FILTER_LEAD_WL.startDate}&endDate=${FILTER_LEAD_WL.endDate}" />" class="pn prev">Prev</a>
			    </c:if>
			
			    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
			        <c:choose>
			            <c:when test="${(page+1) == i.index}">
			                <span style="background:black;padding:2px 5px;border-radius:2px;color:white">${i.index}</span>
			            </c:when>
			            <c:otherwise>
			                <c:url value="view_filter_leads" var="url">
			                    <c:param name="page" value="${i.index-1}"/>
			                </c:url>
			                 <a style="background:white;padding:2px 5px;border-radius:2px;color:black" href='<c:out value="${url}&sortBy=${sortBy}&qualified=${FILTER_LEAD_WL.qualified}&flagged=${FILTER_LEAD_WL.flagged}&leadOwner=${FILTER_LEAD_WL.leadOwner}&leadSource=${FILTER_LEAD_WL.leadSource}&leadStatus=${FILTER_LEAD_WL.leadStatus}&source=${FILTER_LEAD_WL.source}&sourceName=${FILTER_LEAD_WL.sourceName}&destinationName=${FILTER_LEAD_WL.destinationName}&destination=${FILTER_LEAD_WL.destination}&contactId=${FILTER_LEAD_WL.contactId}&contactName=${FILTER_LEAD_WL.contactName}&dateCriteria=${FILTER_LEAD_WL.dateCriteria}" />'>${i.index}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:url value="view_filter_leads" var="next">
			        <c:param name="page" value="${page + 1}"/>
			    </c:url>
			    <c:if test="${page + 1 < maxPages}">
			       <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href='<c:out value="${next}&sortBy=${sortBy}&qualified=${FILTER_LEAD_WL.qualified}&flagged=${FILTER_LEAD_WL.flagged}&leadOwner=${FILTER_LEAD_WL.leadOwner}&leadSource=${FILTER_LEAD_WL.leadSource}&leadStatus=${leadStatus}&source=${FILTER_LEAD_WL.source}&sourceName=${FILTER_LEAD_WL.sourceName}&destinationName=${FILTER_LEAD_WL.destinationName}&destination=${FILTER_LEAD_WL.destination}&contactId=${FILTER_LEAD_WL.contactId}&contactName=${FILTER_LEAD_WL.contactName}&dateCriteria=${FILTER_LEAD_WL.dateCriteria}&startDate=${FILTER_LEAD_WL.startDate}&endDate=${FILTER_LEAD_WL.endDate}" />' class="pn next">Next</a>
			    </c:if>
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