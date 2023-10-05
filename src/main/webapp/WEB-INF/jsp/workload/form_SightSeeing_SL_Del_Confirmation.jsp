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

<jsp:include page="_Workload_Menu.jsp" />

<br>
<h2 align="center">
	<input type="image" src="${pageContext.request.contextPath}/resources/images/warning.jpg" height="50" width="50"/> Delete Sight Seeing Service Line
</h2>
<hr>
<body>
<div class="submenu-block">
	
	
		<table id="hotel-sl" style="border: 1px solid white; margin-left: auto; margin-right: auto; width: 45%;font-size:15pt;">
					<tr>
						<th>City Name</th><td>${stsSLObj.cityName}</td>
					</tr>
					<tr>
						<th>Sight Seeing Name</th><td>${stsSLObj.sightSeeingName}</td>
					</tr>
					<tr>
						<th>Tour Date</th><td><fmt:formatDate value="${stsSLObj.tourDate}" pattern="dd-MM-yyyy" /> </td>
					</tr>
					<tr>
						<th>Transfer Type</th><td>${stsSLObj.transferTypeName}</td>
					</tr>
					<tr>
						<th>Supplier</th><td>${stsSLObj.supplierName}</td>
					</tr>
					<tr>
						<th>Guest Details </th><td>${stsSLObj.adults} Adults | ${stsSLObj.children} Children | ${stsSLObj.infants} Infants</td>
					</tr>
					
					<tr>
						<th>Remarks</th><td>${stsSLObj.remarks}</td>
					</tr>
					<tr>
						<th>Status</th><td>${stsSLObj.statusName}</td>
					</tr>
					<tr>
						<th>Cost</th><td>${stsSLObj.serviceLineCost}</td>
					</tr>
					<tr>
						<th>Markup</th><td>${stsSLObj.markup}</td>
					</tr>
					
					
				</table>
				<table align="center">
					<tr>
						<td><form:form id="form_STS_SL" name="form_del_STS_SL" action="delete_STS_SL" method="POST" style="display:inline;">
								<input type="hidden" name="stsServiceId" value="${stsSLObj.stsServiceId}" />
								<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
								<input type="submit" name="Delete" Value="Confirm Delete" style="background-color: red;" />
							</form:form>
						</td>
						<td><form:form id="form_cancel_STS_SL" name="form_cancel_STS_SL" action="view_workload_STS" method="POST" style="display:inline;">
								<input type="hidden" name="htlServiceId" value="${stsSLObj.stsServiceId}" />
								<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
								<input type="submit" name="Cancel" Value="Cancel" />
							</form:form>
						</td>
						
					</tr>
				</table>

		
	
</div>

</body>

</html>

