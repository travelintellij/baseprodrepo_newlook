<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<head>
<title>UdanChoo Team Workload Section</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="${pageContext.request.contextPath}/resources/css/tooplate_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/coda-slider.css" type="text/css" charset="utf-8" />

</head>

<style>
/*
body {
  background-image: url('${pageContext.request.contextPath}/resources/images/visa.png');
  background-repeat: no-repeat;
  background-position: center;
  background-size: auto;
}*/
table {
  width: 100%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
}

th {
  background: #007f5c;
  height: 60px;
  width: 10%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
}

th, td {
  padding: 10px;
}
tr {
  border-bottom: 1px solid #cccccc;
}
tr:hover {background-color:#f5f5f5;}
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
</style>
<jsp:include page="../_Workload_Menu.jsp" />
<br>
<h2 align="center">
		Visa WorkLoad Details
</h2>
	<hr>
<body style="background-color: white;">
		<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
		<table style="width:85%;table-layout:fixed;">
			<tr>
				<th style="width: 8%;" align="center">Country</th>
				<th style="width: 12%;" align="center">Applicant Name</th>
				<th style="width: 10%;" align="center">Visa Type</th>
				<th style="width: 10%;" align="center">Visa Profile</th>
				<th style="width: 10%;" align="center">Visa Purpose</th>
				<th style="width: 10%;" align="center">Supplier</th>
				<th style="width: 9%;" align="center">Cost</th>
				<th style="width: 9%;" align="center">Markup</th>
				<th style="width: 10%;" align="center">Status</th>
				<th style="width: 12%;" align="center">Action</th>
			</tr>
		
			<c:if test="${not empty VSA_SL_LIST}">
				<c:forEach var="vsaSLObj" items="${VSA_SL_LIST}">
					<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
					<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
					<input type="hidden" name="vsaServiceId" value="${vsaSLObj.vsaServiceId}" />
						<tr>
						<td style="width: 8%;" align="center">${vsaSLObj.countryName}</td>
						<td style="width: 12%;" align="center">${vsaSLObj.applicantName}</td>
						<td style="width: 10%;" align="center">${VISA_TYPE.get(vsaSLObj.visaType)}</td>
						<td style="width: 10%;" align="center">${VISA_PROFILE.get(vsaSLObj.profile)} </td>
						<td style="width: 10%;" align="center">${VISA_PURPOSE.get(vsaSLObj.visaPurpose)} </td>
						<td style="width: 10%;" align="center">${vsaSLObj.supplierName}</td>
						<td style="width: 9%;" align="center">${vsaSLObj.serviceLineCost}</td>
						<td style="width: 9%;" align="center">${vsaSLObj.markup}</td>
						<td style="width: 10%;" align="center">${vsaSLObj.statusName}</td>
						<td style="width: 12%;" align="center">
							<form:form id="form_view_VSA_SL" name="form_view_LDP_SL" action="view_view_workload_VSA_SL" method="POST" style="display:inline;">		
									<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
									<input type="hidden" name="vsaServiceId" value="${vsaSLObj.vsaServiceId}"/>
									<input type="hidden" name="countryCode" value="${vsaSLObj.countryCode}"/>
									<input type="submit" name="view" Value="View" style="background-color: green; padding: 6px 12px;" />
							</form:form> | 
				
							<form:form id="form_update_VSA_SL" name="form_update_VSA_SL" action="view_form_update_workload_VSA_SL" method="POST" style="display:inline;">
								<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
								<input type="hidden" name="vsaServiceId" value="${vsaSLObj.vsaServiceId}"/>
								<input type="hidden" name="countryCode" value="${vsaSLObj.countryCode}"/>
								<input type="submit" name="Edit" Value="Edit" style="background-color: blue; padding: 6px 12px;" />
							</form:form> | 
				
							<form:form id="form_del_VSA_SL" name="form_del_VSA_SL" action="view_delete_workload_VSA_SL" method="POST" style="display:inline;">		
									<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
									<input type="hidden" name="vsaServiceId" value="${vsaSLObj.vsaServiceId}"/>
									<input type="submit" name="Delete" Value="Delete" style="background-color: red; padding: 6px 12px;" />
							</form:form>
						</td>
						</tr>
			</c:forEach>
		</c:if>
		<tr>
		<td colspan="8">&nbsp;</td>
		<td colspan="2" style="text-align:right;background-color:pink;">
			<form:form action="view_form_create_workload_VSA_SL" style="display:inline;">

					<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
					<c:if test="${VSA_SL_ACTION ne 'ADD'}">
						<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
						<input type="submit" value="Add Visa" style="background-color:green;" />
					</c:if>

			</form:form>
			<form:form action="view_form_email_workload_VSA_SL_status" style="display:inline;">

					<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
						<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
						<input type="submit" value="Send Visa Status" style="background-color:blue;"/>

			</form:form>
		
		</td>
		</tr>
	
		</table>


</body>

<script>
$('#destinationName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCityList',
	paramName: "cityName",
	delimiter: ",",
	onSelect: function(suggestion) {
        cityID = suggestion.data;
        id=cityID;
        jQuery("#destinationId").val(cityID);
        $('input[name=destinationId]').val(id);
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



</script>

</html>

