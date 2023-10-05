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
<h2 align="center">View Package Quotation Details </h2>
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
	
	<h3 align="center"><font color="blue"><b>Add Package</b></font></h3>
	
<div class="float-container">
  	<div class="float-child-left">
    <div class="green" >
   		<jsp:include page="../_quotationServicesMenu.jsp" />
    </div>
  	</div>

 	<div class="float-child-right">
    <div class="blue">
		
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<table style="width:70%;  table-layout:fixed;background-color:#cc3300;" >
	<tr><td>
<form:form modelAttribute="MANUAL_PKG" action="create_create_package_manual_quotation">
	
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualFlightQuotationId" value= "${MANUAL_PKG.manualPkgQuotationId}" />
	
	<table style="width:100%;  table-layout:fixed;" >
		<tr>
			<th style="width:20%;"><font size="4"><b>City</b></font></th>
			<th colspan="2" style="width:40%;"><font size="4"><b>Package Name</b></font></th>
			<th><font size="4" style="width:20%;"><b>Start Date</b></font></th>
			<th><font size="4" style="width:20%;"><b>End Date</b></font></th>
		</tr>
		<tr>
			<td>
				<font color="red"><form:errors path="cityName" cssClass="error" /></font>
				<form:input path="cityName" style="width: 150px;height:40px;" type="text" id="cityName"  />
				<form:hidden path = "cityId" id="cityId" />
			</td>
			<td colspan="2">
				<font color="red"><form:errors path="packageName" cssClass="error" /></font>
				<form:input path="packageName" style="width: 300px;height:40px;" type="text" id="packageName" required="required" />
			</td>
			<td>
				<font color="red"><form:errors path="startDate" cssClass="error" /></font>
				<form:input type="date" path="startDate" required="required" /> 
			</td>
			<td>
				<form:input type="date" path="endDate" required="required" /> 
			</td>
		</tr>
		<tr>	
			<th colspan="5"><font size="4"><b>Package Description</b></font></th>
		</tr>
		<tr>
			<td colspan="5"><form:textarea path="packageDescription" rows="20" cols="100" maxlength="5000"/></td>
		</tr>
		<tr>
			<th colspan="5" style="background-color:green;">Inclusions </th>
			
		</tr>
		<tr>
			
			<td colspan="5"><form:textarea path="inclusions" rows="15" cols="100" maxlength="2000"/></td>
			
		</tr>
		<tr>
			<th colspan="5" style="background-color:red;"> Exclusions</th>
		</tr>
		<tr>
			<td colspan="5"><form:textarea path="exclusions" rows="15" cols="100" maxlength="2000"/></td>
		</tr>
		<tr>

		</tr>
		<tr>	
			<th colspan="5" style="background-color:red;"><font size="4"><b>Cancellation Policy</b></font>(If left empty, it won't be printed)</th>
		</tr>
		<tr>
			<td colspan="5"><form:textarea path="cancellationPolicy" rows="10" cols="150" maxlength="3000"/></td>
		</tr>
		<tr>	
			<th colspan="5"><font size="4"><b>Remarks</b></font></th>
		</tr>
		<tr>
			<td colspan="5"><form:textarea path="remarks" rows="10" cols="150" maxlength="5000"/></td>
		</tr>
		
		<tr>	
			<th style="width:20%;"><font size="4"><b>Adults</b></font></th>
			<th style="width:20%;"><font size="4"><b >Children</b></font></th>
			<th style="width:20%;"><font size="4"><b>Infant</b></font></th>
			<th style="width:20%;"><font size="4"><b>Package Cost</b></font></th>
			<th style="width:20%;"><font size="4"><b>Package Markup</b></font></th>
		</tr>
		<tr>
			<td>
				<font color="red"><form:errors path="adults" cssClass="error" /></font>
				<form:input path="adults" type="number" min="0" style="height:30px;width:50px;margin: auto;"/>
			</td>
			<td><form:input path="children" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
			<td><form:input path="infant" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
			<td><form:input path="pkgCost" type="number" min="0" style="height:30px;width:120px;margin: auto;"/>	</td>
			<td><form:input path="pkgMarkup" type="number" min="0" style="height:30px;width:80px;margin: auto;"/></td>
			
		</tr>
			
			
		<tr>	
			<th colspan="2"><font size="4"><b>Flights Included</b></font></th>
			<td>
				<div class="gender" align="center">
					<input type="radio" value="true" id="yes" name="flightIncluded"  /> <label for="yes" class="radio">Yes</label>
	       			<input type="radio" value="false" id="no" name="flightIncluded"  checked /> <label for="no" class="radio">No</label>
	 			</div>	
			
			</td>  
			<th><font size="4"><b>Display Order</b></font></th>
			<td><form:input path="displayOrder" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
		</tr>
		<tr>
			<th colspan="5"><input type="submit" name="addPackage" id="addPackage" Value="Add Package" />
			<a href="form_view_package_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
		</th>
	</tr>
	</table>	
</form:form>


		</td>
		</tr>
		</table>
   	</div>
   	</div>
</div>
<script>
$('#cityName').autocomplete({
	serviceUrl : '${pageContext.request.contextPath}/getCityList',
	paramName : "cityName",
	delimiter : ",",
	onSelect : function(suggestion) {
		cityID = suggestion.data;
		id = cityID;
		jQuery("#cityId").val(cityID);
		$('input[name=cityId]').val(id);
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

</body>
</html>
  