<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.jquery-ui.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<head>
	<title>UdanChoo Team Workload Section</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="${pageContext.request.contextPath}/resources/css/tooplate_style.css"crel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/coda-slider.css" type="text/css" charset="utf-8" />
</head>

<style>
th {
	vertical-align: baseline;
	height: 30px;
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

select {
	appearance: none;
	outline: 0;
	background: lightblue;
	background-image: none;
	width: 100%;
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

.ui-autocomplete.ui-widget {
	font-family: Verdana, Arial, sans-serif;
	font-size: 30px;
}

#hotel-sl {
	font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 80%;
}

#hotel-sl td, #hotel-sl th {
	border: 1px solid white;
	padding: 2px;
}

#hotel-sl tr:nth-child(even) {
	background-color: #f2f2f2;
}

#hotel-sl tr:hover {
	background-color: #ddd;
}

#hotel-sl th {
	padding-top: 5px;
	padding-bottom: 5px;
	text-align: center;
	background-color: #5D7B9D;
	color: white;
}
</style>

<jsp:include page="../_Workload_Menu.jsp" />

<br>
<h2 align="center">
	<input type="image" src="${pageContext.request.contextPath}/resources/images/warning.jpg" height="50" width="50"/> Delete Cruise Service Line
</h2>
<hr>
<body>
<div class="submenu-block">
	
	
		<table id="hotel-sl" style="border: 1px solid white; margin-left: auto; margin-right: auto; width: 45%;font-size:15pt;">
						<tr>
							<th align="center">City</th>
							<td>${crsSLObj.cityName}</td>
						</tr>
						<tr>
							<th align="center">Cruise Name</th>
							<td>${crsSLObj.cruiseName}</td>
						</tr>
						<tr>
							<th align="center">State Room Type</th>
							<td>${crsSLObj.stateRoomTypeName}</td>
						</tr>
						<tr>
							<th align="center">Cruise Start Date</th>
							<td>${crsSLObj.cruiseStartDate}</td>
						</tr>
						<tr>
							<th align="center">Cruise End Date</th>
							<td>${crsSLObj.cruiseEndDate}</td>
						</tr>
						<tr>
							<th align="center">Cruise Provider</th>
							<td>${crsSLObj.cruiseProviderName}</td>
						</tr>
						<tr>
							<th align="center">Guest Details</th>
							<td>${crsSLObj.adults} Adults ${crsSLObj.children} Children ${crsSLObj.infants} Infants</td>
						</tr>
						<tr>
							<th align="center">Childrem Age Info</th>
							<td>${crsSLObj.childrenAgeInfo}</td>
						</tr>
						<tr>
							<th align="center">No Of Decks</th>
							<td>${crsSLObj.noOfDecks}</td>
						</tr>
						<tr>
							<th align="center">Remarks</th>
							<td>${crsSLObj.remarks}</td>
						</tr>
						<tr>
							<th align="center">Supplier</th>
							<td>${crsSLObj.supplierName}</td>
						</tr>
						<tr>
							<th align="center">Status</th>
							<td>${crsSLObj.statusName}</td>
						</tr>
						<tr>
							<th align="center">Cost</th>
							<td>${crsSLObj.serviceLineCost}</td>
						</tr>
						<tr>
							<th align="center">Markup</th>
							<td>${crsSLObj.markup}</td>
						</tr>
				</table>
				<table align="center">
					<tr>
						<td><form:form id="form_TRN_SL" name="form_del_CRS_SL" action="delete_CRS_SL" method="POST" style="display:inline;">
								<input type="hidden" name="crsServiceId" value="${crsSLObj.crsServiceId}" />
								<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
								<input type="submit" name="Delete" Value="Confirm Delete" style="background-color: red;" />
							</form:form>
						</td>
						<td><form:form id="form_cancel_CRS_SL" name="form_cancel_CRS_SL" action="view_workload_CRS" method="POST" style="display:inline;">
								<input type="hidden" name="crsServiceId" value="${crsSLObj.crsServiceId}" />
								<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
								<input type="submit" name="Cancel" Value="Cancel" />
							</form:form>
						</td>
						
					</tr>
				</table>

		
	
</div>

</body>

</html>

