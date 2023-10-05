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
td {
  border-right: 1px solid #cccccc;
  padding: 10px;
  transition: all 0.2s;
  text-align: center;
  font-size:20px;
}

input[type=button], input[type=submit], input[type=reset] {
  background-color: darkgreen;
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
    border:1px solid black; 
    border-radius:3px; 
      text-indent: 2px;
} 
.select { 
    position: relative; 
    display: block; 
    height: 2.5em; 
    line-height: 3; 
    overflow: hidden; 
    border-radius: .25em; 
    padding-bottom:10px; 
   	padding-top: 10px;
	      
} 
.select option.service-small {
	font-size: 20px;
  	padding: 25px;
  	background: lightgreen;
}

.ui-autocomplete.ui-widget {
  font-family: Verdana,Arial,sans-serif;
  font-size: 30px;
}


#flight-sl {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#flight-sl td, #flight-sl th {
  border: 1px solid #ddd;
  padding: 8px;
}

#flight-sl tr:nth-child(even){background-color: #f2f2f2;}

#flight-sl tr:hover {background-color: #ddd;}

#flight-sl th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #edbc00;
  color: black;
}
</style>
<jsp:include page="../_Workload_Menu.jsp" />

<body style="background-color: white;">
	<br>
	<h2 align="center">
		LandPackage Details
	</h2>
	<hr>
		<form:form modelAttribute="LDP_SL_OBJ" action="manage_landpackage_workload_actions">
		<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
		<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
		<form:hidden path="ldpServiceId"/>
		<form:hidden path="destinationId"/>
		<table id="flight-sl" style="border: 3px solid black;width:85%;" >
			<tr>
				<th width="15%" align="center">Destination</th>
				<td width="18%" align="center">
					${LDP_SL_OBJ.destinationName}
				</td>
							
				<th width="15%" align="center">Package Name</th>
				<td width="15%" align="center">
					${LDP_SL_OBJ.packageName} 
				</td>
				<th width="15%" align="center">Guest Details</th>
				<td width="15%" align="center">
						<b>Adults</b> ${LDP_SL_OBJ.adults} <b>Children</b> ${LDP_SL_OBJ.children} <b>Infants</b> ${LDP_SL_OBJ.infants}
					
				</td>
				</tr>
				<tr>
				<th width="15%" align="center">Start Date</th>
				<td width="15%" align="center">
					<fmt:formatDate value="${LDP_SL_OBJ.startDate}" pattern="dd-MM-yyyy" /> 
				</td>
				<th width="15%" align="center">End Date</th>
				<td width="15%" align="center">
					<fmt:formatDate value="${LDP_SL_OBJ.endDate}" pattern="dd-MM-yyyy" /> 
				</td>
				
				<th width="15%" align="center">Package Type</th>
				<td width="15%" align="center">${LDP_SL_OBJ.packageType}</td>
				</tr>
				<tr>
				<th width="15%" align="center">Hold T/L</th>
				<td width="15%" align="center">
					<fmt:formatDate value="${LDP_SL_OBJ.holdingDate}" pattern="dd-MM-yyyy" /> 
				</td>
				<th width="15%" align="center">Supplier</th>
				<td width="15%" align="center">
						${LDP_SL_OBJ.supplierName}
				</td>
				
				<th width="15%" align="center">Status</th>
				<td width="15%" align="center">
						${LDP_SL_OBJ.statusName}
				</td>
				</tr>
				<tr>
					<th width="15%">Cost</th>
					<td width="15%" align="center">${LDP_SL_OBJ.serviceLineCost}</td>
					<th width="15%">Markup</th>
					<td width="15%" align="center">${LDP_SL_OBJ.serviceLineMarkup}</td>
					<th width="15%">Cost</th>
					<td width="15%" align="center">${LDP_SL_OBJ.displayOrder}</td>
				</tr>
				<tr>		
					<th colspan="6" align="center"> <font color="green"><b>Package Details </b></font></th>
				</tr>
				<tr>		
				<td colspan="6" align="center">
				<p align="left" style="white-space: pre-line">${LDP_SL_OBJ.packageDetails}</p>
					
				</td>
				</tr>
				<tr>		
					<th colspan="3" align="center"> <b>Inclusions</b></th>
					<th colspan="3" align="center"> <b>Exclusions</b></th>
				</tr>
				<tr>		
					<td colspan="3" align="center">
						<p align="left" style="white-space: pre-line">${LDP_SL_OBJ.inclusions}</p>
					</td>
					<td colspan="3" align="center">
						<p align="left" style="white-space: pre-line">${LDP_SL_OBJ.exclusions}</p>
					</td>
					
				</tr>
				<tr>
					<th style="width: 150px;" align="center" colspan="6"><b>Cancellation Policy</b></th>
				</tr>
	
				<tr>				
					<td colspan="6" align="center">
						<p align="left" style="white-space: pre-line">${LDP_SL_OBJ.cancellationPolicy}</p>
					</td>
				</tr>
				<tr>
					<th style="width: 150px;" align="center" colspan="6"><b>Additional Remarks</b></th>
				</tr>
				<tr>
				<td style="width: 550px;" align="center" colspan="6">
				<p align="left" style="white-space: pre-line">	${LDP_SL_OBJ.remarks}</p>
				</td>
			</tr>
			<tr>
				<td style="width: 200px;" align="center" colspan="2">
					<input type="Submit" value="Back" id="Back" name="Back" />
				</td>
				<td style="width: 200px;" align="center" colspan="2">
					<input type="Submit" value="Edit" name="Edit" id="Edit" style="background-color:blue;" />
				</td>
				<td style="width: 200px;" align="center" colspan="2">
					<input type="Submit" value="Delete" name="Delete" id="Delete" style="background-color:red;" />
				</td>
				</tr>
	</table>
		</form:form>
</body>

<script>
$('#destinationName').autocomplete({
	serviceUrl : '${pageContext.request.contextPath}/getCityList',
	paramName : "cityName",
	delimiter : ",",
	onSelect : function(suggestion) {
		cityID = suggestion.data;
		id = cityID;
		jQuery("#destinationId").val(cityID);
		$('input[name=departingFrom]').val(id);
		return false;
	},
	transformResult : function(response) {
		return {
			suggestions : $.map($.parseJSON(response), function(item) {
				return {
					value : item.cityName,
					data : item.destinationId
				};
			})

		};
	}
});




</script>

</html>

