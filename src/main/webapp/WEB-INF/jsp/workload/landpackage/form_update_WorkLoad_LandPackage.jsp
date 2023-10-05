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
  height: 50px;
  width: 10%;
  font-weight: heavy;
  /*text-shadow: 0 1px 0 #38678f;*/
  color: black;
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
.textarea {
  clear: left;
  text-align: left;
}

.textarea > * {
  vertical-align: top;
}
</style>
<jsp:include page="../_Workload_Menu.jsp" />

<body style="background-color: white;">
	<br>
	<h2 align="center">
		Edit LandPackage Details
	</h2>
	<hr>
		<form:form modelAttribute="LDP_SL_OBJ" action="edit_edit_workload_LDP">
		<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
		<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
		<input type="hidden" name="ldpServiceId" value="${LDP_SL_OBJ.ldpServiceId}" />
		<form:hidden path="destinationId"/>
		<table id="flight-sl" style="border: 3px solid black;width:85%;">
			<tr>
				<th style="width: 13%;" align="center">Destination</th>
				<td style="width: 20%;" align="center">
					<form:input path="destinationName" style="width: 200px; height:40px; border: 1px solid ;" required="required" /> 
					<input type="hidden" id="destinationId" name="destinationId" value="${LDP_SL_OBJ.destinationId}"/>
					<b><font color="red"><form:errors path="destinationName" cssClass="error" /></font></b>
				</td>
							
				<th align="center" style="width: 13%;" >Package Name</th>
				<td align="center" style="width: 20%;" >
					<form:input path="packageName" style="width: 300px;height:40px; border: 1px solid ;" required="required" /> 
				</td>
				<th style="width: 13%;" align="center">Guest Details</th>
				<td style="width: 20%;" align="center">
					<table>
						<tr>
							<th style="background-color: 32CD32;">Adults</th>
							<td>
								<form:input path="adults" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" /> 
								<b><font color="red"><form:errors path="adults" cssClass="error" /></font></b>	

							</td>
							<th style="background-color: 32CD32;">Children</th>
							<td>
								<form:input path="children" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" />
							</td>
							<th style="background-color: 32CD32;">Infants</th>
							<td>
								<form:input path="infants" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" />
							</td>
						</tr>
					</table>
				</td>
				</tr>
				<tr>
				<th style="width: 13%;" align="center">Start Date</th>
				<td style="width: 20%;" align="center">
					<form:input path="startDate" style="height: 40px; width: 130px;" required="required" type="date" />
					<b><font color="red"><form:errors path="startDate" cssClass="error" /></font></b>
				</td>
				<th style="width: 13%;" align="center">End Date</th>
				<td style="width: 20%;" align="center">
					<form:input path="endDate" style="height: 40px; width: 130px;" required="required" type="date" />
				</td>
				
				<th style="width: 13%;" align="center">Package Type</th>
				<td style="width: 20%;" align="center">
					<div class="select">
						<form:select path="packageType" style="width: 200px;height:40px;border: 1px solid ;" required="required">  
							<option class="service-small" value="0">------Please Select------</option>
							<form:options items = "${LDP_TYPE}" class="service-small"/>
						</form:select>  
					</div>
				</td>
				
				</tr>
				<tr>
				<th style="width: 13%;" align="center">Hold T/L</th>
				<td style="width: 20%;" align="center">
					<form:input path="holdingDate" style="height: 40px; width: 130px;" type="date" />
				</td>
				
				<th style="width: 13%;" align="center">Supplier</th>
				<td style="width: 20%;" align="center">
					<div class="select">
						<form:select path="supplierId" style="width: 200px;height:40px;border: 1px solid ;" required="required">  
							<option class="service-small" value="0">------Please Select------</option>
							<form:options items = "${LDP_SUPPLIER_MAP}" class="service-small"/>
						</form:select>  
					</div>
				</td>
				
				<th style="width: 13%;" align="center">Status</th>
				<td style="width: 20%;" align="center">
					<div class="select">
						<form:select path="status" style="width: 200px;height:40px;border: 1px solid ;" required="required">  
							<option class="service-small" value="0">------Please Select------</option>
							<form:options items = "${LDP_SL_STATUS_MAP}" class="service-small"/>
						</form:select>  
					</div>
				</td>
				</tr>
				<tr>
					<th width="13%">Cost</th>
					<td width="20%" align="center">
						<form:input path="serviceLineCost" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
					</td>
					<th width="13%">Markup</th>
					<td width="20%" align="center">
						<form:input path="serviceLineMarkup" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
					</td>
					<th width="13%">Display Order</th>
					<td width="20%" align="center">
						<form:input path="displayOrder" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
					</td>
					
					
				</tr>
				<tr>		
				<th colspan="6" align="center"> <font color="green"><b>Package Details</b></font></th>
				</tr>
				<tr>		
				<td colspan="6" align="center">
					<form:textarea path = "packageDetails" rows = "5" cols = "1500" style="width: 1000px; height: 600px;border: 2px solid green; border-radius: 4px;" htmlEscape="false" />
				</td>
				</tr>
				<tr>		
					<th colspan="3" align="center" style="width:50%;"> <font color="green"><b>Inclusions</b></font></th>
					<th colspan="3" align="center" style="width:50%;"><font color="red"> <b>Exclusions</b></font></th>
				</tr>
				<tr>		
					<td colspan="3" align="center">
						<form:textarea path = "inclusions" rows = "3" cols = "1000" style="width: 500px; height: 200px;border: 2px solid green;  border-radius: 4px;" htmlEscape="false" />
					</td>

					<td colspan="3" align="center">
						<form:textarea path = "exclusions" rows = "3" cols = "1000" style="width: 500px; height: 200px;border: 2px solid red; border-radius: 4px;" htmlEscape="false" />
					</td>
				</tr>
				<tr>
					<th colspan="6" align="center"> <font color="red"><b>Cancellation Policy</b></font></th>
				</tr>
				<tr>
					<td colspan="6" align="center">
						<form:textarea path = "cancellationPolicy" rows = "6" cols = "250" style="width: 700px; height: 200px;border: 2px solid red;  border-radius: 4px;" htmlEscape="false" />
					</td>
				</tr>
				
				<tr>
				<th style="width: 150px;" align="center" colspan="6"><b>Additional Remarks</b></th>
				</tr>
				<tr> 
				<td style="width: 550px;" align="center" colspan="6">
					<form:textarea path = "remarks" rows = "6" cols = "250" style="width: 550px;border: 2px solid blue;" htmlEscape="false" />
				</td>
			</tr>
			<tr>
				<td style="width: 200px;" align="right" colspan="3">
					<input type="Submit" value="Update Package" />
				</td>
		</form:form>
		<form:form modelAttribute="LDP_SL_OBJ" action="view_workload_LDP">
			<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
			<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
				<td style="width: 150px;" align="left" colspan="3">
				<input type="Submit" value="Cancel" style="background-color: blue"/>
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

