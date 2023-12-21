<!DOCTYPE html>
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<style>
table {
	  width: 100%;
	  border-collapse: collapse;
	  border: 1px solid #38678f;
	  //margin: 5px auto;
	  background: white;
	}
	
	th {
	  background: #14D3A0;
	  width: 50%;
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
	</style>
</head>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br><br>
<h2 align="center">View Client</h2>
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<body style="background-color: creamwhite;">
	<form:form method="post" action="view_edit_admin_client" modelAttribute="CLIENT_OBJ" >
	<input type="hidden" name="clientId" value="${CLIENT_OBJ.clientId}" />
	<table>
		<tr>
			<td  style="width:40%;">
				<table>
				<caption><font size="3"><b><mark>Client Id - ${CLIENT_OBJ.clientId}</mark></b></font></caption>
				<tr>
					<th>Client Name</th>
					<td>${CLIENT_OBJ.clientName}</td>
				</tr>
				<tr>
					<th>Client Address</th>
					<td>${CLIENT_OBJ.address}</td>
				</tr>
				<tr>
					<th>City</th>
					<td>${CLIENT_OBJ.cityName}</td>
				</tr>
				<tr>
					<th>Country</th>
					<td>${CLIENT_OBJ.countryName}</td>
				</tr>
				<tr>
					<th>Email</th>
					<td>${CLIENT_OBJ.email}</td>
				</tr>
				<tr>
					<th>Mobile</th>
					<td>${CLIENT_OBJ.mobile}</td>
				</tr>
				<tr>
					<th>Phone</th>
					<td>${CLIENT_OBJ.phone}</td>
				</tr>
				<tr>
				 <th>Active</th>
				<td style="text-align:center">${CLIENT_OBJ.active}</td>
				</tr>
		
				
				</table>
			</td>
			<td  style="width:40%;">
				<table>
				<tr>
					<th>Company Details</th>
					<td>${CLIENT_OBJ.companyDetails}</td>
				</tr>
				<tr>
					<th>Referred By</th>
					<td>${CLIENT_OBJ.referredBy}</td>
				</tr>
				<tr>
					<th>GST Details</th>
					<td>${CLIENT_OBJ.gstDetails}</td>
				</tr>
				<tr>
					<th>Bank Details</th>
					<td>${CLIENT_OBJ.bankDetails}</td>
				</tr>
				<tr>
					<th>Passport Number</th>
					<td>${CLIENT_OBJ.passportNumber}</td>
				</tr>
				<tr>
					<td colspan="2">
						<table>
						<tr>
							<th style="width:33%;">Passport Expiry</th>
							<th style="width:33%;">DOB</th>
							<th style="width:33%;">DOA</th>
						</tr>
						<tr>
							<td style="width:33%;">${CLIENT_OBJ.passportExpiry}</td>
							<td style="width:33%;">${CLIENT_OBJ.birthDate}</td>
							<td style="width:33%;">${CLIENT_OBJ.anniversaryDate}</td>

						</tr>
						</table>
					</td>
				</tr>
				<tr>
					<th>Remarks</th>
					<td>${CLIENT_OBJ.remarks}</td>
				</tr>
				</table>
				</td>
				
				<td  style="width:20%;"> 
				<table>
					<tr><th colspan="2" style="background-color:steelblue;">Personal Preferences</th></tr>
					
					<tr><th style="background-color:steelblue;">Hotel Preferences </th> 
					<td>
						${CLIENT_OBJ.hotelPref} Star
					</td>
					</tr>
					
					<tr>
						<th style="background-color:steelblue;"> Cost Savy </th>
						<td>
								${CLIENT_OBJ.costSavvy}<br>
									(Scale 1 to 10) 
						</td>
						</tr>
					
					
					<tr><th style="background-color:steelblue;"> Service Savvy</th>
					 <td>
					 	${CLIENT_OBJ.serviceSavvy}<br>
      						(Scale 1 to 5)
					</td>
					</tr>
					<tr><th style="background-color:steelblue;"> Food Pref.</th>
					<td>
						${CLIENT_OBJ.foodPref}
					</td>
					</tr>
					<tr><th style="background-color:steelblue;"> Aggressiveness</th>
					 <td>
							${CLIENT_OBJ.aggressiveness} <br>
      						(Scale 1 to 5)
					</td>
					</tr>
					
					<tr><th style="background-color:steelblue;">Payment Record</th>
					 <td>
							${CLIENT_OBJ.paymentRating} <br>
      						(Scale 1 to 5)
					</td>
					</tr>
				</table>
				</td>
			</tr>
				 
			<tr>
					<td colspan="3" style="text-align: center;">
						<sec:authorize access="hasAnyRole('ADMIN','CLIENT_EDIT')">
							<input type="submit" value="Edit Client" style="background-color: green;">
						</sec:authorize>
						
						<a href="view_form_admin_search_client"><input type="button" style="width: 140px;background-color: blue;" value="Client Listing"></a>

					 </td>
			</tr>
		</table>
	</form:form>
</body>
</html>

