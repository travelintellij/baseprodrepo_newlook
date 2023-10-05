<!DOCTYPE html>
<jsp:include page="../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
	<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
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
	  width: 70%;
	  height: 60px;
	  border-collapse: collapse;
	  border: 1px solid #38678f;
	  margin: 5px auto;
	  background: white;
	}
	
	th {
	  background: #7B68EE;
	  height: 40px;
	  width: 40%;
	  font-weight: heavy;
	  text-shadow: 0 1px 0 #38678f;
	  color: white;
	  border: 1px solid #38678f;
	  box-shadow: inset 0px 1px 2px #568ebd;
	  transition: all 0.2s;
	  width:20%;
	  
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

	/* The container */
.container {
  display: block;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 20px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default radio button */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  
}

/* Create a custom radio button */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
  border-radius: 50%;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the radio button is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the indicator (the dot/circle - hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the indicator (dot/circle) when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the indicator (dot/circle) */
.container .checkmark:after {
 	top: 9px;
	left: 9px;
	width: 8px;
	height: 8px;
	border-radius: 50%;
	background: white;
}
	</style>
</head>

<body>
        <h1>Search Incentive Claims</h1>
       <form:form method="post" action="view_filter_incentives" modelAttribute="SEARCH_INCENTIVE">
        	
        	<input type="hidden" name="userName" value="${userName}"/>
        	
		        <table>
		        	<tr>
		        		<th>Incentive Id</th>
		        		<td><form:input path="incentiveId" type="number" min="0" style="height:30px;width:80px;" size="35" value="" placeholder="Incentive Id"/></td>
		        		<th>Search Criteria</th>
		        		<td>
		        			<label class="container">
		        				<form:radiobutton path="blnSearchOnClaimDate" value="true"/>
		        			<span class="checkmark"></span>
		        			Claim Date
		        			</label>  
		        			</td>
		        		<td>
			        			<label class="container">
			        				<form:radiobutton path="blnSearchOnClaimDate" value="false"/>
			        			<span class="checkmark"></span>
			        			Travel End Date
		        				</label>
		        		</td>
		        		<td>&nbsp;</td>
		        	</tr>
		        	<tr>
		        		<td colspan="2"><p style="font-family: 'Comic Sans MS', 'Comic Sans', fantasy;"> <b> Great Work leads to more claims. Work Hard.</b></p></td>
		        		<th>From Date </th>
			      		<td>
			      		 	<form:input path= "claimFromDate" type="date" required="required" style="height:30px;margin: auto;"/>
			      		 </td>
			      		 <th>To Date</th>
			      		 <td>
			      		 	<form:input path= "claimToDate" type="date" required="required" style="height:30px;margin: auto;"/>
		    	  		 </td>
		      		</tr>
		  	  		 <tr>
		  	  		 	<th>Deal Confirmation No.</th>
		  	  		 	<td>
							<input style="width:250px;" class="form-control search-slt" type="text" name="dealName" id="dealName" placeholder="Deal Search keyword " />
							<input type="hidden" id="dealConfirmationId" name="dealConfirmationId" />
		  	  		 	</td>
		  	  		 	<th>Claim Status</th>
		  	  		 	<td>
		  	  		 		<div class="select" style="margin: auto;">
		  	  		 		<form:select path="claimStatus" required="required" style="height:30px;width: 150px;">
		  	  		 			 <form:options items = "${ACTIVE_INCENTIVE_STATUS}" class="service-small"/>
							</form:select>
							</div>	
						</td>
						<th>Claimant</th>
						<sec:authorize access="hasAnyRole('ADMIN')">
						<td>
							<div class="select" >
							<form:select path="claimantId" style="height:30px;width: 150px;" required="required" >  
								<form:options items = "${ACTIVE_USERS_MAP}" class="service-small"/>
							</form:select>  
							</div>
						</td>
						</sec:authorize>
						<sec:authorize access="!hasAnyRole('ADMIN')">
						<td>
							${userName}
						</td>
						</sec:authorize>
						</tr>
						<tr>
		  	  		 		<td colspan="6">
		  	  		 			<input type="submit" value="Apply Filter" style="background-color: red;" />
		  	  		 			<a href="view_default_incentives_report"><input type="button" value="Clear Filter" /></a>
		  	  		 	</td>
		  	  		 </tr>
		       </table>
		        <table style="width:80%;">
		  			<tr>
		  				<th style="width:10%;background:green;">Incentive Id</th>
		  				<th style="width:10%;background:green;">Deal Confirmation Id </th>
		  				<th style="width:20%;background:green;">Lead Guest Name</th>
		  				<th style="width:10%;background:green;">Travel Date</th>
		  				<th style="width:10%;background:green;">End Date</th>
		  				<th style="width:10%;background:green;">Claim Date</th>
		  				<th style="width:10%;background:green;">Claimant</th>
		  				<th style="width:10%;background:green;">Claim Amount</th>
		  				<th style="width:10%;background:green;">Claim Status</th></tr>
		  			 <c:if test="${not empty INCENTIVES_LIST}">
						<c:set var="totalIncentive" value="${0}"/>
						<c:forEach var="incentiveObj" items="${INCENTIVES_LIST}">
		     				<tr>
		     					<td>
		     						<a id="myBtn[${incentiveObj.incentiveId}]" onclick="myLeadDisplay(this)" data-load-url="displayIncentiveModal?incentiveId=${incentiveObj.incentiveId}" data-toggle="modal" data-target="#myModal" ><input type="button" style="background-color: blue;padding: 4px 5px;"  value="${incentiveObj.incentiveId}" /></a>
		     					
		     						<sec:authorize access="hasAnyRole('ADMIN')">
		     						&nbsp;&nbsp;<a href="form_view_editIncentive?incentiveId=${incentiveObj.incentiveId}">Edit</a>
		     						</sec:authorize>
		     					
		     					</td>
		     					<td>
		     					<a id="myBtn[${incentiveObj.dealConfirmationId}]" onclick="myLeadDisplay(this)" data-load-url="view_view_deal_form_modal_free_acl?dealConfirmationId=${incentiveObj.dealConfirmationId}" data-toggle="modal" data-target="#myModal" ><input type="button" style="background-color: #786AAF;padding: 4px 5px;"  value="${incentiveObj.dealConfirmationId}" /></a>
		     					
		     					</td>
		     					<td>${incentiveObj.guestName}</td>
		     					<td><fmt:formatDate value="${incentiveObj.travelStartDate}" pattern="dd-MM-yyyy" /></td>
		     					<td><fmt:formatDate value="${incentiveObj.travelEndDate}" pattern="dd-MM-yyyy" /></td>
		     					<td><fmt:formatDate value="${incentiveObj.createdAt}" pattern="dd-MM-yyyy" /></td>
		     					<td>${incentiveObj.claimantName}</td>
		     					<td>${incentiveObj.claimedAmount}</td>
		     					<td>${incentiveObj.claimStatusName}</td></tr>
		     					<c:set var="totalIncentive" value="${totalIncentive + incentiveObj.claimedAmount}" />
		  				</c:forEach>
					</c:if>
					</table>
					<table style="width:80%;">
					<tr>
					<td colspan="7"><b><font size="3">Total Claim Amount </font></b></td>
					<td colspan="2" bgcolor="#D6EEEE">${totalIncentive}</td>
					
					</tr>
				</table>
				
					<div id="myModal" class="modal">
						
						  <!-- Modal content -->
						  <div class="modal-content">
						    <div class="modal-header">
						      <span class="close">&times;</span>
						      <br><h2 style="text-align:center;">View Details</h2>
						    </div>
						    <div class="modal-body">
						
						
						    </div>
						    <div class="modal-footer">
						      <h3>Powered by @TravelIntelliJ</h3>
						    </div>
						  </div>
						
						</div>
						
						
				<div id="pagination" align="center">
				Page: 
			    <c:url value="view_filter_incentives" var="prev">
			       <c:param name="page" value="${page-1}"/>
			    </c:url>
			    <c:if test="${page > 0}">
			        <a href="<c:out value="${prev}&sortBy=${sortBy}&claimFromDate=${SEARCH_INCENTIVE.claimFromDate }&claimToDate=${SEARCH_INCENTIVE.claimToDate}&claimantId=${SEARCH_INCENTIVE.claimantId}&claimStatus=${SEARCH_INCENTIVE.claimStatus}" />" class="pn prev">Prev</a>
			    </c:if>
			
			    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
			        <c:choose>
			            <c:when test="${(page+1) == i.index}">
			                <span>${i.index}</span>
			            </c:when>
			            <c:otherwise>
			                <c:url value="view_filter_incentives" var="url">
			                    <c:param name="page" value="${i.index-1}"/>
			                </c:url>
			                 <a href='<c:out value="${url}&sortBy=${sortBy}&claimFromDate=${SEARCH_INCENTIVE.claimFromDate }&claimToDate=${SEARCH_INCENTIVE.claimToDate}&claimantId=${SEARCH_INCENTIVE.claimantId}&claimStatus=${SEARCH_INCENTIVE.claimStatus}" />'>${i.index}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:url value="view_filter_incentives" var="next">
			        <c:param name="page" value="${page + 1}"/>
			    </c:url>
			    <c:if test="${page + 1 < maxPages}">
			       <a href='<c:out value="${next}&sortBy=${sortBy}&claimFromDate=${SEARCH_INCENTIVE.claimFromDate }&claimToDate=${SEARCH_INCENTIVE.claimToDate}&claimantId=${SEARCH_INCENTIVE.claimantId}&claimStatus=${SEARCH_INCENTIVE.claimStatus}" />' class="pn next">Next</a>
			    </c:if>
			</div>
		</form:form>
		
		
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


		$('#dealName').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getDealInfo_For_Incentives',
			paramName: "dealKeyword",
			delimiter: ",",
			onSelect: function(suggestion) {
		        dealID = suggestion.data;
		        id=dealID;
		        jQuery("#dealConfirmationId").val(dealID);
		        $('input[name=dealName]').val(id);
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
</script>
      </body>
</html>
