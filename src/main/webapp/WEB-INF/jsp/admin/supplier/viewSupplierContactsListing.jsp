<!doctype html>
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
<link href="resources/core/magicsuggest.css" rel="stylesheet" type="text/css">
<style>
.sscontainer { max-width: 550px; }
</style>
</head>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script	src="<c:url value="/resources/core/magicsuggest.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<style>
/* The Modal (background) */
	.modal {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  padding-top: 150px; /* Location of the box */
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
	  width: 45%;
	  height: 65%;
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
	  border-collapse: collapse;
	  border: 1px solid #38678f;
	  //margin: 5px auto;
	  background: white;
	}
	
	th {
	  background: #8433FF;
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
	  height:50px;
	}
	
	td {
	  border-right: 1px solid #cccccc;
	  padding: 5px;
	  transition: all 0.2s;
	  text-align: center;
	}
	
	.heavyTable {
	  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
	  animation: float 5s infinite;
	}
	input[type="radio"] {
		display: inline-block;
		opacity: 1;
		width: 1em;
		z-index: -1;
	}

select {
	appearance: none;
	outline: 0;
	background: lightblue;
	background-image: none;
	width: 80%;
	height: 100%;
	color: black;
	cursor: pointer;
	border: 1px solid black;
	border-radius: 3px;
	text-indent: 2px;
}

.select {
	position: relative;
	display: block;
	height: 2.5em;
	line-height: 3;
	overflow: hidden;
	border-radius: .25em;
	padding-bottom: 10px;
	padding-top: 10px;
}

.select option.service-small {
	font-size: 20px;
	padding: 25px;
	background: lightgreen;
}


input[type=button], input[type=submit], input[type=reset] {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}

.sscontainer {
z-index: 5;
  position: absolute;
  width: 750px;
  border: 1px dashed #900;
  background-color: #fdd;  
  max-width: 570px; 
}
	</style>
</head>
<br>
<h2 align="center"><font color="#8433FF">(Supplier Id : ${SUPPLIER_OBJ.supplierId})</font></h2><br>
	<body style="background-color: creamwhite;">
	<form:form method="post" action="form_view_quote_req_email_supplier" modelAttribute="EMAIL_QUOTE_OBJ" >
	<form:hidden path = "supplierId" />
	<form:hidden path = "supplierName" />
	<form:hidden path = "leadId" />
	
	 <div align="right">
		<a href="view_supplier_details?supplierId=${SUPPLIER_OBJ.supplierId }"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"  value="View Supplier" /></a>
		<a href="form_view_editsupplier?supplierId=${SUPPLIER_OBJ.supplierId }"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"  value="Edit Supplier" /></a>
		<a href="view_form_search_supplier_quote?leadId=${EMAIL_QUOTE_OBJ.leadId}"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"  value="Search Supplier" /></a>
	</div>
	 
	<table>
		<tr>
			<th>Supplier Name</th>
			<td>${SUPPLIER_OBJ.supplierName}</td>
			<th>Email</th>
			<td>${SUPPLIER_OBJ.email}</td>
			<th>Mobile</th>
			<td>${SUPPLIER_OBJ.mobile}</td>
			<th>Destinations Ssupported.</th>
			<td colspan="2">
				<c:forEach items="${SUPPLIER_OBJ.destinations}" var="destination">
					${destination.cityName},
				</c:forEach>
			</td>
		</tr>
		<tr>
			<th>Service Offerred</th>
			<td><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;">
				<c:if test="${SUPPLIER_OBJ.flight eq true}">
					<input type="checkbox" checked disabled/>
				</c:if>
				<c:if test="${SUPPLIER_OBJ.flight eq false}">
					<input type="checkbox" disabled/>
				</c:if>
				<span class="checkmark"></span></label>Flight
			</td>
			<td><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;">
				<c:if test="${SUPPLIER_OBJ.hotel eq true}">
					<input type="checkbox" checked disabled/>
				</c:if>
				<c:if test="${SUPPLIER_OBJ.hotel eq false}">
					<input type="checkbox" disabled/>
				</c:if>
				<span class="checkmark"></span></label>Hotel
			</td>
			<td>
				<label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;">
				<c:if test="${SUPPLIER_OBJ.transfers eq true}">
					<input type="checkbox" checked disabled/>
				</c:if>
				<c:if test="${SUPPLIER_OBJ.transfers eq false}">
					<input type="checkbox" disabled/>
				</c:if>
				<span class="checkmark"></span></label>Transfers
			</td>
			<td>
				<label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;">
				<c:if test="${SUPPLIER_OBJ.sightseeing eq true}">
					<input type="checkbox" checked disabled/>
				</c:if>
				<c:if test="${SUPPLIER_OBJ.sightseeing eq false}">
					<input type="checkbox" disabled/>
				</c:if>
				<span class="checkmark"></span></label>Sight Seeing
			</td>
			<td>
				<label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;">
				<c:if test="${SUPPLIER_OBJ.visa eq true}">
					<input type="checkbox" checked disabled/>
				</c:if>
				<c:if test="${SUPPLIER_OBJ.visa eq false}">
					<input type="checkbox" disabled/>
				</c:if>
				<span class="checkmark"></span></label>Visa
			</td>
			<td>
				<label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;">
				<c:if test="${SUPPLIER_OBJ.insurance eq true}">
					<input type="checkbox" checked disabled/>
				</c:if>
				<c:if test="${SUPPLIER_OBJ.insurance eq false}">
					<input type="checkbox" disabled/>
				</c:if>
				<span class="checkmark"></span></label>Insurance
			</td>
			<td colspan="2">
				<label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;">
				<c:if test="${SUPPLIER_OBJ.landPackage eq true}">
					<input type="checkbox" checked disabled/>
				</c:if>
				<span class="checkmark"></span></label>Package 
			</td>
		</tr>
	</table>
<br><br>
<h3 align="center"><b>Supplier Contacts</b></h3>


<div align="center" style="display:inline;"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>


<div align="right" style="float:right;display:inline;">
	<input type="Submit" style="height:20px;width:150px;text-align: center;background-color:green;padding-bottom: 30px;" value="Email Selected" />
	<a href="form_view_add_supplier_contact?supplierId=${SUPPLIER_OBJ.supplierId}"><input type="button" style="height:20px;width:150px;text-align: center;background-color:blue;padding-bottom: 30px;" value="Add Contact" /></a>
</div>
<table style="table-layout: fixed;">

<tr>
	<th style="height:30px;width:5%;background: steelblue;">Contact No.</th>
	<th style="background: steelblue;">Contact Name</th>
	<th style="background: steelblue;">Role</th>
	<th style="background: steelblue;">Mobile</th>
	<th style="background: steelblue;">Email</th>
	<th style="background: steelblue;" colspan="3">Action</th>
</tr>
<c:forEach items="${SUPPLIER_OBJ.supplierContactsList}" var="contactList">
	<tr>
		<td style="height:30px;width:5%">${contactList.supplierContactId}</td><td>${contactList.contactName}</td><td>${contactList.role}</td><td>${contactList.mobile}</td><td>${contactList.email}</td>
		
		<td colspan="3">
		Email To: <label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><input type="checkbox" name="emailToList" value="${contactList.email}"  /> <span class="checkmark"></span></label>
		
		Cc: <label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><input type="checkbox" name="emailCcList" value="${contactList.email}" /> <span class="checkmark"></span></label>
		|
			<a id="myBtn[${contactList.supplierContactId}]" onclick="contactDisplay(this)" data-load-url="view_supplier_contact_details_modal?supplierContactId=${contactList.supplierContactId}" data-toggle="modal" data-target="#myModal" ><input type="button" style="background-color: #786AAF;padding: 4px 5px;"  value="View" /></a> 
			|
			<a href="form_view_edit_supplier_contact?supplierContactId=${contactList.supplierContactId}"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"value="Edit" /></a> | 
			<a id="myBtn[${contactList.supplierContactId}]" onclick="contactDisplay(this)" data-load-url="view_delete_supplier_contact_confirm_modal?supplierContactId=${contactList.supplierContactId}" data-toggle="modal" data-target="#myModal" ><input type="button" style="background-color: red;padding: 4px 5px;"  value="Delete" /></a>
			
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
						      <br><h2 style="text-align:center;" id="modelheaderh2">Contact Details</h2>
						    </div>
						    <div class="modal-body">
						
						
						    </div>
						    <div class="modal-footer">
						      <h3>Powered by @TravelIntelliJ</h3>
						    </div>
						  </div>
						
						</div>	
				 
		
</form:form>
<script>
// Get the modal
var modal = document.getElementById("myModal");
// Get the button that opens the modal
var btn = document.getElementById("myBtn");
// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];
function contactDisplay(clicked) { 
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

function cancelModal(){
	modal.style.display = "none";
}
</script>


	
</body>
</html>
