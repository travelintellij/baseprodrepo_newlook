<!DOCTYPE html>
<jsp:include page="../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
	<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
	<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	
	<link href="<c:url value="/resources/css/jquery.datetimepicker.min.css" />" rel="stylesheet">
	<script src="<c:url value="/resources/js/jquery.datetimepicker.full.js" />"></script>
  	
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
	  width: 50%;
	  height: 80%;
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

	input[type="radio"] {
		display: inline-block;
		opacity: 1;
		width: 1em;
		z-index: -1;
	}
	</style>
</head>

<body>
<br>
			<form:form method="post" action="edit_edit_incentive_details" modelAttribute="INCENTIVE_OBJ">
        	<h2 align="center">Update Incentive Details </h2>
          
         	 <form:input type="hidden" path="incentiveId" />
         	 <h3 align="center"><font color="blue"><b>Incentive Id - ${INCENTIVE_OBJ.incentiveId}</b></font></h3>
 			<table>
		        <tr>
		        	<th>Incentive Claimant</th>
		        	<td>
		        	<sec:authorize access="hasAnyRole('ADMIN')">
					
					<div class="select">
						<form:select path="claimantId" required="required" >  
							 <form:options items = "${ACTIVE_USERS_MAP}" class="service-small"/>
						</form:select>  
					</div>
					
					</sec:authorize>
			
					<sec:authorize access="! hasAnyRole('ADMIN')">
					
						${INCENTIVE_OBJ.claimantName }
					
					</sec:authorize>
		      		  </td>
		       </tr>
		       <tr>	
		       		<th>Deal ID </th>
		       		<td style="text-align:left;">
		       			<input style="width:450px;" class="form-control search-slt" type="text" name="dealName" id="dealName" placeholder="Deal Search - Enter Only numeric Deal # or Client Name " value=${INCENTIVE_OBJ.dealConfirmationId } />
						<form:hidden path = "dealConfirmationId" /> 
						<a id="myBtn[${filteredLeads.leadId}]" onclick="myLeadDisplay(this)" data-load-url="view_view_deal_form_modal" data-toggle="modal" data-target="#myModal" ><input type="button" style="background-color: #786AAF;padding: 4px 5px;"  value="View Lead Details" /></a> 
		       		 <br><font color="red"><form:errors path="dealConfirmationId" cssClass="error" /></font>
		       		 
		       		
		       		</td>
		       	</tr>
		       	<%--
		        <tr><th>Guest Name</th><td><input class="contact" type="text" name="guestName" required/><br><font color="red"><form:errors path="guestName" cssClass="error" /></font></td></tr>
		        <tr><th>Query Details</th><td><textarea rows="3" cols="57" name="queryDetails" maxlength="250"></textarea><br><font color="red"><form:errors path="queryDetails" cssClass="error" /></font></td></tr>
		        <tr><th>Travel Date</th><td><input class="contact" type="date" name="travelDate" required /><br><font color="red"><form:errors path="travelDate" cssClass="error" /></font></td></tr>
		        <tr><th>Service End Date</th><td> <input class="contact" type="date" name="endDate" required /><br><font color="red"><form:errors path="endDate" cssClass="error" /></font></td></tr>
		        <tr><th>Service Type </th><td><input class="contact" type="text" name="serviceType" required /><br><font color="red"><form:errors path="serviceType" cssClass="error" /></font></td></tr>
		         --%>
 		       </table>
 		       <!-- The Modal -->
						<div id="myModal" class="modal">
						
						  <!-- Modal content -->
						  <div class="modal-content">
						    <div class="modal-header">
						      <span class="close">&times;</span>
						      <br><h2 style="text-align:center;">View Deal Details</h2>
						    </div>
						    <div class="modal-body">
						
						
						    </div>
						    <div class="modal-footer">
						      <h3>Powered by @TravelIntelliJ</h3>
						    </div>
						  </div>
						
						</div>
	
 		       <br>
				<table style="background-color:#DCDCDC;">
				<tr>
					<td style="text-align:left;">
						<b>Please answer following questions to justify your claim for an incentive. 
						<br>Please make a note that if we find any information marked wrong or not justified then your claim will be rejected.</b>
					</td>
				</tr>
				</table>
        	
        	<br>
        	<h2 align="center">Incentive Effort Details</h2>  
        	 <table>
		        <tr>
		        	<th style="width:5%;">1</th><th style="width:35%; padding: 5px;text-align:left;">Client is Referred by You ? <form:errors path="question1" cssClass="error" /></th> 
		        	<td> <form:radiobutton path="question1" value="1" /> Yes</td>
		        	<td> <form:radiobutton path="question1" value="0" />  No</td>
		        </tr>     
		        <tr>
		        	<th style="width:5%;">2</th><th style="width:50%; padding: 5px;text-align:left;">You took minimal support of management and were able to handle the query alone ? </th> 
		        	<td> <form:radiobutton path="question2" value="true"/> Yes</td>
		        	<td> <form:radiobutton path="question2" value="false"/>  No</td>
		        </tr>
		        <tr>
		        	<th style="width:5%;">3</th><th style="width:50%; padding: 5px;text-align:left;">You responded all queries of client yourself ontime without any delay ?  </th>
					<td> <form:radiobutton path="question3" value="Yes"/> Yes</td>
		        	<td> <form:radiobutton path="question3" value="No"/>  No</td>				</tr>
		        <tr>
		        	<th style="width:5%;">4</th><th style="width:50%; padding: 5px;text-align:left;">You ensured and verified with management time to time for payment settlement ?  </th> 
		        	<td> <form:radiobutton path="question4" value="Yes"/> Yes</td>
		        	<td> <form:radiobutton path="question4" value="No"/>  No</td>
				</tr>
		        <tr>
		        	<th style="width:5%;">5</th><th style="width:50%; padding: 5px;text-align:left;">You ensured the vouchers were sent on time and reminder call before travel is made to the client.  </th> 
		        	<td> <form:radiobutton path="question5" value="Yes"/> Yes</td>
		        	<td> <form:radiobutton path="question5" value="No"/>  No</td>
		        </tr>
		        <tr>
		        	<th style="width:5%;">6</th><th style="width:50%; padding: 5px;text-align:left;">UdanChoo online Review achieved or decided not needed ?  </th> 
					<td> <form:radiobutton path="question6" value="Yes"/> Yes</td>
		        	<td> <form:radiobutton path="question6" value="No"/>  No</td>
		       </tr>
		     </table>
		     
		     <table>
		     	<form:input type="hidden" path="claimedAmount" />
		     	<form:input type="hidden" path="userRemarks" />
		    	<tr>
		    		<td width="50%"><font color="red"><b>Claimed Amount </b></font></td>
		    		<td>${INCENTIVE_OBJ.claimedAmount}</td>
		    	</tr>
		    	<tr>
		    		<td width="50%"><font color="green"><b>Approved Amount </b></font></td>
		    		<td><form:input type="number" path="approvedAmount" style="height:30px;width: 100px;"/></td>
		    	</tr>
		    	
		    	<tr>
		    		<td width="50%"><font color="red"><b>User Remarks </b></font></td>
		    		<td>${INCENTIVE_OBJ.userRemarks}</td>
		    	</tr>
		    	
		    	<tr>
		    		<td width="50%"><font color="red"><b>Management Remarks </b></font></td>
		    		<td>
		    		  <form:textarea path="managementRemarks" rows="4" cols="60" maxlength="250"/>
		    		</td>
		    	</tr>
		    	
		    	<tr>
		    		<td style="background-color:pink" ><b>Update Claim Status</b></td>
		    		<td>
		    			<form:select path="status" required="required" style="height:30px;width: 150px;">
		  	  		 		<form:options items = "${ACTIVE_INCENTIVE_STATUS}" class="service-small"/>
						</form:select>
		    		</td>
		    	</tr>
				<tr>
					<td>Inform Claimant</td>
					<td>&nbsp;&nbsp;<label class="container"><form:checkbox path="notifyClaimant"/><i><font size="2">(if checked email will be sent to claimant)</font></i><span class="checkmark"></span></label>
					</td>
				</tr>	
				<tr>
					<td colspan="2">
						<input type="submit" value="Update Claim" style="background:green;"/>
						<a href="view_default_incentives_report"><input type="button" style="background:blue;" value="Cancel" /></a>
					</td>
				</tr>		
		     </table>
		     
	
		</form:form>
		
<script>
$('#dealName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getDealInfo',
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

<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];



function myLeadDisplay(clicked) { 
	//alert(document.getElementById("dealName").value);
	//document.getElementsByTagName("H1")[0].setAttribute("myModal", "data-load-url") = document.getElementById("dealName").value;
	//$(clicked).attr('data-load-url')="view_view_deal_form_modal?dealConfirmationId=227";
	var dealURL =$(clicked).attr('data-load-url');
	dealURL = dealURL+'?dealConfirmationId='+document.getElementById("dealName").value;
	
	$("#myModal .modal-body").load(dealURL);
	//$("#myModal .modal-body").load($(clicked).attr('data-load-url'));
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

