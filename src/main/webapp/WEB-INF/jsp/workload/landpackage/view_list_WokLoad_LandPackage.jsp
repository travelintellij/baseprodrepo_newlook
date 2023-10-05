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
body {
  background-image: url('${pageContext.request.contextPath}/resources/images/landpackage.png');
  background-repeat: no-repeat;
   background-position: center;
  //background-size: auto;
}

table {
  width: 100%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
}

th {
  background: #edbc00;
  height: 40px;
  width: 10%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: black;
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
<body style="background-color: white;">
<br>
	<h2 align="center">
		LandPackage WorkLoad Summary
	</h2>
	<hr>
		<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
			<c:if test="${not empty LDP_SL_LIST}">
				<c:forEach var="ldpSLObj" items="${LDP_SL_LIST}">
				<table id="landpackage-sl" style="border: 3px solid black;width:85%;table-layout:fixed;">
				<tr>
					<th style="width: 10%;" align="center">Destination</th>
					<th style="width: 25%;" align="center">Package Name</th>
					<th style="width: 20%;" align="center">Guest Details</th>
					<th style="width: 15%;" align="center">Start Date</th>
					<th style="width: 15%;" align="center">End Date</th>
					<th style="width: 15%;" align="center">Hold T/L</th>
				</tr>
				<tr>
					<td style="width: 10%;" align="center">${ldpSLObj.destinationName} </td>
					<td style="width: 25%;" align="center">${ldpSLObj.packageName}</td>
					<td style="width: 20%;" align="center">${ldpSLObj.adults} Adults ${ldpSLObj.children} Children ${ldpSLObj.infants} Infants </td>
					<td style="width: 15%;" align="center"><fmt:formatDate value="${ldpSLObj.startDate}" pattern="dd-MM-yyyy" /> </td>
					<td style="width: 15%;" align="center"><fmt:formatDate value="${ldpSLObj.endDate}" pattern="dd-MM-yyyy" /> </td>
					<td style="width: 15%;" align="center"><fmt:formatDate value="${ldpSLObj.holdingDate}" pattern="dd-MM-yyyy" /> </td>
				</tr>
				<tr>
					<th style="width: 15%;" align="center">Package Type</th>
					<th style="width: 15%;" align="center">Supplier</th>
					<th style="width: 30%;" align="center">Remarks</th>
					<th style="width: 20%;" align="center">Status</th>
					<th style="width: 10%;" align="center">Cost</th>
					<th style="width: 10%;" align="center">Markup</th>
				</tr>	
				<tr>	
					<td style="width: 15%;" align="center">${ldpSLObj.packageType}</td>
					<td style="width: 15%;" align="center">${ldpSLObj.supplierName}</td>
					<td style="width: 30%;" align="center" >${ldpSLObj.remarks}</td>
					<td style="width: 20%;" align="center">${ldpSLObj.statusName}</td>
					<td style="width: 10%;" align="center">${ldpSLObj.serviceLineCost}</td>
					<td style="width: 10%;" align="center">${ldpSLObj.serviceLineMarkup}</td>
				</tr>
				<tr>	
					<th align="center" colspan="4">&nbsp;</th>
					<th style="width: 10%;" align="center">Display Order</th>
					<th style="width: 30%;" align="center">Action</th>
				</tr>
				<tr>			
					<td colspan="4">&nbsp;</td>
					<td style="width: 10%;" align="center">${ldpSLObj.displayOrder}</td>
					<td style="width: 30%;" align="center">
							<form:form id="form_view_LDP_SL" name="form_view_LDP_SL" action="view_view_LDP_SL" method="POST" style="display:inline;">		
									<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
									<input type="hidden" name="ldpServiceId" value="${ldpSLObj.ldpServiceId}"/>
									<input type="submit" name="View" Value="View" style="background-color: blue; padding: 6px 12px;" />
							</form:form> | 
							<form:form id="form_update_LDP_SL" name="form_update_LDP_SL" action="view_update_LDP_SL" method="POST" style="display:inline;">
								<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
								<input type="hidden" name="ldpServiceId" value="${ldpSLObj.ldpServiceId}"/>
								<input type="hidden" name="destinationId" value="${ldpSLObj.destinationId}"/>
								<input type="submit" name="Edit" Value="Edit" style="background-color: blue; padding: 6px 12px;" />
							</form:form> | 
							<form:form id="form_del_LDP_SL" name="form_del_LDP_SL" action="view_delete_ldp_sl_confirmation" method="POST" style="display:inline;">		
									<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
									<input type="hidden" name="ldpServiceId" value="${ldpSLObj.ldpServiceId}"/>
									<input type="submit" name="Delete" Value="Delete" style="background-color: red; padding: 6px 12px;" />
							</form:form>
					</td>
				</tr>
			
				</table>
				<p>&nbsp;</p>
	
				</c:forEach>
			</c:if>

	<form:form modelAttribute="LDP_SL_OBJ" action="view_create_workload_form_LDP">
		<div align="right">
			<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
			<c:if test="${LDP_SL_ACTION eq 'VIEW'}">
				<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
				<input type="submit" value="Add LandPackage" />
			</c:if>
		</div>
	</form:form>
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
        $('input[name=destinationName]').val(id);
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

