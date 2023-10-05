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
  height: 40px;
  width: 10%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
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
  width: 80%;
  align: center;
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
  background-color: red;
  color: white;
}
</style>
<jsp:include page="../_Workload_Menu.jsp" />

<body style="background-color: white;">
	<br>
	<h2 align="center">
		<input type="image" src="${pageContext.request.contextPath}/resources/images/warning.jpg" height="50" width="50"/> Delete LandPackage Service Line
	</h2>
	<hr>
		
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
						Adults${LDP_SL_OBJ.adults} Children ${LDP_SL_OBJ.children}
					
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
				<td width="15%" align="center">
					${LDP_SL_OBJ.packageType}
				</td>
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
					<th width="15%" align="center">Cost</th>
					<td width="15%" align="center">${LDP_SL_OBJ.serviceLineCost}</td>
					<th width="15%" align="center">Markup</th>
					<td width="15%" align="center">${LDP_SL_OBJ.serviceLineMarkup}</td>
					<th width="15%" align="center">Display Order</th>
					<td width="15%" align="center">${LDP_SL_OBJ.displayOrder}</td>
					
				</tr>
				
				
				<tr>		
				<th colspan="6" align="center"><b>Package Details</b></th>
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
						<p style="white-space: pre-line" align="left">${LDP_SL_OBJ.inclusions}</p>
					</td>
					<td colspan="3" align="center">
						<p style="white-space: pre-line" align="left">${LDP_SL_OBJ.exclusions}</p>
					</td>
				</tr>
				<tr>		
					<th colspan="6" align="center"> <b>Cancellation Policy</b></th>
				</tr>
				<tr>
					<td colspan="6" align="center">
						<p style="white-space: pre-line" align="left">${LDP_SL_OBJ.cancellationPolicy}</p>
					</td>
				</tr>
				
				<tr>
				<th style="width: 150px;" align="center" colspan="6"><b>Additional Remarks</b></th>
				</tr>
				<tr>
				<td style="width: 550px;" align="center" colspan="6">
				<p style="white-space: pre-line" align="left">	${LDP_SL_OBJ.remarks}
				</td>
			</tr>
			<tr>
			<form:form id="form_del_LDP_SL" name="form_del_LDP_SL" action="delete_LDP_SL" method="POST" style="display:inline;">
				<td style="width: 200px;" align="right" colspan="3">
					<input type="hidden" name="ldpServiceId" value="${LDP_SL_OBJ.ldpServiceId}" />
					<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
					<input type="submit" name="Delete" Value="Confirm Delete" style="background-color: red;" />
				</td>
				</form:form>
				<form:form modelAttribute="LDP_SL_OBJ" action="view_workload_LDP">
					<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
					<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
				<td style="width: 200px;" align="left" colspan="3">
					<input type="Submit" value="Cancel" />
				</td>
				</form:form>
		</tr>
	</table>
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

