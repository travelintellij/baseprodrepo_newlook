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
	table {
	  width: 50%;
	  height: 60px;
	  border-collapse: collapse;
	  border: 1px solid #38678f;
	  margin: 5px auto;
	  background: white;
	}
	
	th {
	  background: green;
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
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
   	<form:form modelAttribute="INCENTIVE_OBJ"> 	
    	<h1 align="center"><font color="blue">Incentive Claim ID is ${INCENTIVE_OBJ.incentiveId}</font></h1>
    	<hr>
		<table>
	        <tr><th>Requested By</th><td>${INCENTIVE_OBJ.claimantName} <input type="hidden" name="userId" value="${userId}" /><input type="hidden" name="userName" value="${userName}" /></td></tr>
	        <tr>
	        	<th>Deal Confirmation ID </th>
	        	<td>${INCENTIVE_OBJ.dealConfirmationId}
				<form:hidden path = "dealConfirmationId" /> 
				<a id="myBtn[${filteredLeads.leadId}]" onclick="myLeadDisplay(this)" data-load-url="view_view_deal_form_modal" data-toggle="modal" data-target="#myModal" >
					<input type="button" style="background-color: #786AAF;padding: 4px 5px;"  value="View Deal Details" />
				</a>
	        	</td>
	        </tr>
	        <tr><th>Guest Name</th><td>${INCENTIVE_OBJ.guestName}&nbsp;</td></tr>
	    </table>
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
	
       	 <table>
	        <tr><th style="width:5%;">1</th><th style="width:70%; padding: 5px;text-align:left;">Client is Referred by You ?</th> <td>${INCENTIVE_OBJ.question1}</td></tr>     
	        <tr><th style="width:5%;">2</th><th style="width:70%; padding: 5px;text-align:left;">You took minimal support of management and were able to handle the query alone ? </th> <td>${INCENTIVE_OBJ.question2}</td></tr>
	        <tr><th style="width:5%;">3</th><th style="width:70%; padding: 5px;text-align:left;">You responded all queries of client yourself ontime without any delay ?  </th> <td>${INCENTIVE_OBJ.question3} </td></tr>
	        <tr><th style="width:5%;">4</th><th style="width:70%; padding: 5px;text-align:left;">You ensured and verified with management time to time for payment settlement ?  </th> <td>${INCENTIVE_OBJ.question4}</td></tr>
	        <tr><th style="width:5%;">5</th><th style="width:70%; padding: 5px;text-align:left;">You ensured the vouchers were sent on time and reminder call before travel is made to the client.  </th> <td>${INCENTIVE_OBJ.question5}</td></tr>
	         <tr><th style="width:5%;">6</th><th style="width:70%; padding: 5px;text-align:left;">UdanChoo online Review achieved or decided not needed ? </th> <td>${INCENTIVE_OBJ.question6}</td></tr>
	     </table>
	     <table>
	    	<tr><td width="50%"><font color="red"><b>Claimed Amount </b></font></td><td>${INCENTIVE_OBJ.claimedAmount}</td></tr>
	    	<tr><td width="50%"><font color="green"><b>Approved Amount </b></font></td><td>${INCENTIVE_OBJ.approvedAmount}</td></tr>
	    	<tr><td width="50%"><font color="red"><b>User Remarks </b></font></td><td>${INCENTIVE_OBJ.userRemarks}</td></tr>
	    	 <tr><td width="50%"><font color="red"><b>Management Remarks </b></font></td><td>${INCENTIVE_OBJ.managementRemarks}</td></tr>
	    	<tr><td><b>Claim Status</b></td><td><mark>${INCENTIVE_OBJ.claimStatusName}</mark></td></tr>
	    	
	    	<tr>
					<td colspan="2">
						<a href="form_view_editIncentive?incentiveId=${INCENTIVE_OBJ.incentiveId}"><input type="button" value="Edit Claim" style="background:green;"/></a>
						<a href="view_default_incentives_report"><input type="button" style="background:blue;" value="View Incentive List" /></a>
					</td>
				</tr>		
	     </table>
	     </form:form>
	     


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
	dealURL = dealURL+'?dealConfirmationId='+document.getElementById("dealConfirmationId").value;
	
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
