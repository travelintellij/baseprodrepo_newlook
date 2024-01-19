<!DOCTYPE html>
<html>
<jsp:include page="../../menu/MenuBuilder.jsp" />
  
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
  height: 40px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 35px auto;
  background: white;
}

th {
  background: #9999ff;
  height: 30px;
  width: 15%;
  font-weight: bold;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
  height: 30px;
}
tr {
  border-bottom: 1px solid #cccccc;
}

td {
  border-right: 1px solid #cccccc;
  padding: 10px;
  transition: all 0.2s;
  text-align: center;
  height: 30px;
  font-size: 16px;
  font-weight:bold;
}
input[type=button], input[type=submit], input[type=reset] {
  background-color: green;
  border: none;
  color: white;
  padding: 10px 20px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}

.sidenav {
	height: 70%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 118;
	left: 0; //
	//background-color: #111;
	background-color: lightblue;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 30px;
	text-align: center;
}

.sidenav a {
	padding: 4px 4px 4px 16px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover {
	color: #f1f1f1;
	
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

.float-container {
    //border: 3px solid #fff;
    padding: 15px;
}

.float-child-left {
    width: 20%;
    float: left;
    padding: 20px;
    //border: 2px solid red;
}

.float-child-right {
    width: 80%;
    float: center;
    //padding: 50px;
    //border: 2px solid red;
}  
  ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
}

li {
  float: left;
}

li a {
  display: block;
  padding: 20px;
  background-color: #dddddd;
}
</style>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h2 align="center">View SightSeeing Quotation Details hello </h2>
<body>
<form:form modelAttribute="QTN_OBJ" action="create_create_lead_quotation">
	<table style="width:45%;margin: auto;">
		<tr>
		<th style="background: #FFC300;color:black;"> Quotation Id </th><td>${QTN_OBJ.quotationId}</td>
		<th style="background: #FFC300;color:black;"> Version Id </th><td>${QTN_OBJ.version}</td>
		</tr>
	</table>
</form:form>


<form:form modelAttribute="LEAD_OBJ" action="create_create_lead_quotation">
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<jsp:include page="../leadDetailsOpenNavView.jsp" />
	</div>
	<h3><font color="red">View Lead Details </font>	</h3>
	<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;
		 Quick Lead View</span>
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "35%";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
	</script>
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
</form:form>
	
	<h3 align="center"><font color="blue"><b>View Sight Seeing Details</b></font></h3>
	
<div class="float-container">
  	<div class="float-child-left">
    <div class="green" >
   		<jsp:include page="../_quotationServicesMenu.jsp" />
    </div>
  	</div>

 	<div class="float-child-right">
    <div class="blue">
		<table style="width:24%;">
		<caption><font size="4"> <b>Add Sight Seeing to quotation.</b></font></caption>
			<tr>
				<td style="text-align:center;">
				<ul>
					<c:if test="${QTN_OBJ.converted ne true }">
		  				<li><a href="#"> <input type="button" style="background-color:blue;" value="Search Sight Seeing" /></a></li>
		  				<li><a href="form_view_add_sightseeing_quotation?leadId=${LEAD_OBJ.leadId }&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:green;" value="Add Manually" /></a></li>
		  			</c:if>
					<c:if test="${QTN_OBJ.converted eq true }">
		  				<li><a href="#"> <input type="button" style="background-color:lightgray;" value="Search Sight Seeing" /></a></li>
		  				<li><a><input type="button" style="background-color:lightgray;" value="Add Manually" /></a></li>
		  			</c:if>
		  			
				</ul>
				</td>
			</tr>
		</table>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<table style="width:70%;  table-layout:fixed;background-color:green;" >
	<tr><td>
		<c:if test="${STS_ACTION eq 'ADD'}">
			<jsp:include page="form_view_add_manual_sightseeing_quotation.jsp" /> 
		</c:if>
		
		<c:forEach items="${QTN_OBJ.sightSeeingVoList}" var="sightSeeingQtnObj">
			<c:choose>
				<c:when test="${sightSeeingQtnObj.manualSightSeeingQuotationId eq MANUAL_STS.manualSightSeeingQuotationId  && STS_ACTION  eq 'EDIT' }">
					 <jsp:include page="form_view_edit_manual_sightseeing_quotation.jsp" />  
				</c:when>
				<c:when test="${sightSeeingQtnObj.manualSightSeeingQuotationId eq MANUAL_STS.manualSightSeeingQuotationId  && STS_ACTION  eq 'DELETE' }">
					<jsp:include page="form_view_delete_manual_sightseeing_quotation.jsp" /> 
				</c:when>
				<c:otherwise>
					<table style="width:100%;  table-layout:fixed;background-color: #DFE0DC; border: 3px solid #000000; border-collapse: collapse" >
					<tr><th style="background-color:blue;" colspan="5"><font size="4"><b>Id-  ${sightSeeingQtnObj.manualSightSeeingQuotationId}</b></font></th></tr>
					<tr>
						
						<th colspan="1"><font size="4"><b>Sight Seeing City</b></font></th>
						<th><font size="4"><b>Sight Seeing Selection</b></font></th>
						<th colspan="2"><font size="4"><b>Transfer Type</b></font></th>
						<th><font size="4"><b>Sight Seeing Date</b></font></th>
					</tr>
					<tr>
						<td>${sightSeeingQtnObj.cityName} </td>
						<td>
						<c:if test="${sightSeeingQtnObj.savedSightSeeing eq true}">
							System Based
						</c:if>
						<c:if test="${sightSeeingQtnObj.savedSightSeeing eq false}">
							Customized 
						</c:if>
						
						 </td>
						<td colspan="2">${sightSeeingQtnObj.transferTypeName} </td>
						<td><fmt:formatDate value="${sightSeeingQtnObj.sightSeeingDate}" pattern="dd-MMM-yyyy" /> </td>
					</tr>
		
					<tr>	
						<th colspan="5"><font size="4"><b>Sight Seeing Id / Sight Seeing Name</b></font></th>
						
					</tr>
					<tr>
						<td colspan="5">${sightSeeingQtnObj.sightSeeingName} </td>
					</tr>
					<tr>	
						<th><font size="4"><b>Adults</b></font></th>
						<th><font size="4"><b>Children</b></font></th>
						<th><font size="4"><b>Infant</b></font></th>
						<th><font size="4"><b>Sight Seeing Cost</b></font></th>
						<th><font size="4"><b>Sight Seeing Markup</b></font></th>
					</tr>
					<tr>	
						<td>${sightSeeingQtnObj.adults}</td>
						<td>${sightSeeingQtnObj.children}	</td>
						<td>${sightSeeingQtnObj.infant}</td>
						<td>${sightSeeingQtnObj.sightSeeingCost}</td>
						<td>${sightSeeingQtnObj.sightSeeingMarkup}</td>
					</tr>
					<tr>	
						<th colspan="4"><font size="4"><b>Remarks</b></font></th>
						<th><font size="4"><b>Display Order</b></font></th>
					</tr>
					<tr>	
						<td colspan="4">${sightSeeingQtnObj.remarks}</td>
						<td>${sightSeeingQtnObj.displayOrder }</td>	
					</tr>
					<tr>
						<th colspan="5">
							<c:if test="${QTN_OBJ.converted ne true }">
								<a href="form_view_edit_manual_sightseeing_quotation?manualSightSeeingQuotationId=${sightSeeingQtnObj.manualSightSeeingQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:blue;" value="Edit Sight Seeing" /></a>
								<a href="form_view_delete_manual_sightseeing_quotation?manualSightSeeingQuotationId=${sightSeeingQtnObj.manualSightSeeingQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:red;" value="Delete Sight Seeing" /></a>
							</c:if>
							<c:if test="${QTN_OBJ.converted eq true }">
								<a><input type="button" style="background-color:lightgray;" value="Edit Sight Seeing" /></a>
								<a><input type="button" style="background-color:lightgray;" value="Delete Sight Seeing" /></a>
							</c:if>
						</th>
					</tr>
				</table>	
			</c:otherwise>
			</c:choose>
		</c:forEach>
		</td>
		</tr>
		</table>
   	</div>
   	</div>
</div>

<div id="myModal" class="modal">	
		  <!-- Modal content -->
		  <div class="modal-content">
		    <div class="modal-header" style="background:red">
		      <span class="close">&times;</span>
		      <br><h2 style="text-align:center;">View Sight Seeing Details</h2>
		    </div>
		    <div class="modal-body">
		    </div>
		    <div class="modal-footer">
		      <h3 align="center">Powered by @TravelIntelliJ</h3>
		    </div>
		  </div>
</div>

	<script>
		// Get the modal
		var modal = document.getElementById("myModal");
		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");
		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];
		function myStopsDisplay(clicked) { 
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
	</script>
</body>
</html>
  