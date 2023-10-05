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
}
*/
th { vertical-align: baseline; 
	 height:30px;
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
  width: 85%;
  margin-left: auto; 
  margin-right: auto;
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
  background-color: #007f5c ;
  color: white;
   
  
}
</style>
<jsp:include page="../_Workload_Menu.jsp" />
<body style="background-color: white;">
	
	<br>
	<h2 align="center">
		Visa WorkLoad Details
	</h2>
	<hr>
		<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
		
		<!-- Following set of code will get executed only user have clicked on the Add Visa  button.  -->
		<c:if test="${VSA_SL_ACTION eq 'DELETE'}">
			<h2 align="center">
				<input type="image" src="${pageContext.request.contextPath}/resources/images/warning.jpg" height="50" width="50"/> Delete Visa Service Line
			</h2>
			<div align="center"><font color="red"><b>Please make a note that delete will delete all associated visa documents record as well. </b></font></div>
			<form:form name="formaddwl" modelAttribute="VSA_SL_OBJ" action="delete_delete_workload_VSA_SL" >
				<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
				<input type="hidden" name="vsaServiceId" value="${ORG_VSA_SL_VO.vsaServiceId}"/>
				<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
		
				<table id="flight-sl" style="border: 3px solid black;">
					<tr>
						<th style="width: 10%;" align="center">Country</th>
						<th style="width: 15%;" align="center">Applicant Name</th>
						<th style="width: 15%;" align="center">Passport Number</th>
						<th style="width: 15%;" align="center">Passport Expiry Date</th>
						<th style="width: 12%;" align="center">Visa Type</th>
						<th style="width: 12%;" align="center">Visa Profile</th>
						<th style="width: 12%;" align="center">Visa Purpose</th>
						<th style="width: 10%;" align="center" colspan="2">Supplier</th>
					</tr>
					<tr>
						<td style="width: 10%;" align="center">
								${ORG_VSA_SL_VO.countryName}						
						</td>
						<td style="width: 15%;" align="center">
								${ORG_VSA_SL_VO.applicantName }
						</td>
						<td style="width: 10%;" align="center">
								${ORG_VSA_SL_VO.passportNumber }
						</td>
						<td style="width: 15%;" align="center">
							<fmt:formatDate value="${ORG_VSA_SL_VO.passportExpiryDate}" pattern="dd-MM-yyyy" />
						</td>
						<td style="width: 12%;" align="center">
							${ORG_VSA_SL_VO.visaType }
						</td>
						<td style="width: 12%;" align="center">
							${ORG_VSA_SL_VO.profile }

						</td>
						<td style="width: 12%;" align="center">
							${ORG_VSA_SL_VO.visaPurpose}
						</td>
						<td style="width: 10%;" align="center" colspan="2">
							${ORG_VSA_SL_VO.supplierName}
						</td>
					</tr>
					<tr>
						<th style="width: 15%;" align="center">Travel Start Date</th>
						<th style="width: 15%;" align="center">Travel Return Date</th>
						<th style="width: 20%;" align="center">Status</th>
						<th style="width: 55%;" align="center" colspan="4">Remarks</th>
						<th style="width: 10%;" align="center" colspan="2">Action</th>
					</tr>
					<tr>
						<td style="width: 15%;" align="center">
							<fmt:formatDate value="${ORG_VSA_SL_VO.travelStartDate}" pattern="dd-MM-yyyy" />
						</td>

						<td style="width: 15%;" align="center">
							<fmt:formatDate value="${ORG_VSA_SL_VO.travelReturnDate}" pattern="dd-MM-yyyy" />
						</td>
						<td style="width: 20%;" align="center">
								${ORG_VSA_SL_VO.statusName}
						</td>
						<td style="width: 45%;" align="center" colspan="4">
							<p style="white-space: pre-line">${ORG_VSA_SL_VO.remarks}</p>
						</td>
						<td style="width: 10%;" align="center">
							<input type="submit" name="submit" value="Confirm Delete"  style="background-color: red;" />
						</form:form>
						</td>
						<td style="width: 10%;">
							<form:form name="formaddwl" modelAttribute="VSA_SL_OBJ" action="view_workload_VSA" style="display: inline;" >	
								<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
								<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
								<input type="submit" name="submit" value="Cancel"  style="background-color: blue;" />
							</form:form>
						</td>
					</tr>
				</table>
				
		</c:if>		
		<c:if test="${VSA_SL_ACTION eq 'ADD'}">
			<form:form name="formaddwl" modelAttribute="VSA_SL_OBJ" action="add_add_workload_VSA_SL" >
			
			<div align="center"><b><font color="red"><form:errors path="countryName" cssClass="error" /></b></font></div>
			<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
			<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
	
				<table id="flight-sl" style="border: 3px solid black;width:85%;table-layout:fixed;" >
					<tr>
						<th style="width: 12.5%;" align="center">Country</th>
						<th style="width: 10%;" align="center">Consulate City</th>
						<th style="width: 12.5%;" align="center">Applicant Name</th>
						<th style="width: 12.5%;" align="center">Passport Number</th>
						<th style="width: 12.5%;" align="center">Passport Expiry</th>
						<th style="width: 12.5%;" align="center">Visa Type</th>
						<th style="width: 12.5%;" align="center">Visa Profile</th>
						<th style="width: 10%;" align="center">Visa Purpose</th>
					</tr>
					<tr>
						<td style="width: 12.5%;" align="center" >
							<form:input path="countryName" style="width: 200px; height:40px; border: 1px solid ;" required="required" placeholder="country name" />
							<input type="hidden" name="countryCode" id="countryCode" value="${VSA_SL_OBJ.countryCode}" />
						
						</td>
						<td style="width:10%;">
							<div class="select" >
								<form:select path="consulateCity" style="width: 200px;height:30px;border: 1px solid ;" required="required">  
									<option class="service-small" value="0">------Please Select------</option>
									<form:options items = "${CONSULATE_CITIES}" class="service-small"/>
								</form:select>  
							</div>
						</td>
						<td style="width: 12.5%;" align="center">
							<form:input path="applicantName" style="width: 200px; height:40px; border: 1px solid ;" required="required" placeholder="Applicant Name" />
						</td>
						<td style="width: 12.5%;" align="center">
							<form:input path="passportNumber" style="width: 200px; height:40px; border: 1px solid ;" placeholder="Passport No" />
						</td>
						<td style="width: 12.5%;" align="center">
							<form:input path="passportExpiryDate" style="width: 200px; height:40px; border: 1px solid ;" type="date" />
						</td>
						<td style="width: 12.5%;" align="center">
						<div class="select">
							<form:select path="visaType" style="width: 200px;height:30px;border: 1px solid ;" required="required">  
								<option class="service-small">------Please Select------</option>
								<form:options items = "${VISA_TYPE}" class="service-small"/>
							</form:select>  
						</div>
						</td>
						<td style="width: 12.5%;" align="center">
							<div class="select">
								<form:select path="profile" style="width: 200px;height:30px;border: 1px solid ;" required="required">  
									<option class="service-small">------Please Select------</option>
									<form:options items = "${VISA_PROFILE}" class="service-small"/>
								</form:select>  
							</div>
						</td>
						<td style="width: 10%;" align="center">
						<div class="select">
								<form:select path="visaPurpose" style="width: 200px;height:30px;border: 1px solid ;" required="required">  
									<option class="service-small">------Please Select------</option>
									<form:options items = "${VISA_PURPOSE}" class="service-small"/>
								</form:select>  
						</div>
						</td>
					</tr>
					<tr>
						<th style="width: 10%;" align="center" >Travel Start Date</th>
						<th style="width: 10%;" align="center" >Travel Return Date</th>
						<th style="width: 15%;" align="center" >Supplier</th>
						<th style="width: 15%;" align="center">Status</th>
						<th style="width: 30%;" align="center"  colspan="2">Remarks</th>
						<th style="width: 10%;" align="center">Cost</th>
						<th style="width: 10%;" align="center">Markup</th>
					</tr>
					<tr>
						<td style="width: 10%;" align="center">
							<form:input path="travelStartDate" style="width: 200px; height:40px; border: 1px solid ;" required="required" type="date" />
							<div align="center"><b><font color="red"><form:errors path="travelStartDate" cssClass="error" /></b></font></div>
						</td>

						<td style="width: 10%;" align="center">
							<form:input path="travelReturnDate" style="width: 200px; height:40px; border: 1px solid ;" required="required" type="date" />
						</td>
						<td style="width: 15%;" align="center">
						 	<div class="select">
								<form:select path="supplierId" style="width: 200px;height:30px;border: 1px solid ;" required="required">  
									<form:options items = "${VSA_SUPPLIER_MAP}" class="service-small"/>
								</form:select>  
							 </div>
						</td>
						<td style="width: 15%;" align="center">
							<div class="select">
								<form:select path="status" style="width: 200px;height:30px;border: 1px solid ;" required="required">  
									<option class="service-small" value="0">------Please Select------</option>
									<form:options items = "${VSA_SL_STATUS_MAP}" class="service-small"/>
								</form:select>  
							</div>
						
						</td>
						<td style="width: 30%;" align="center" colspan="2">
							<form:textarea path = "remarks" rows = "5" cols = "300" style="width: 500px;border: 2px solid green; border-radius: 4px;" htmlEscape="false" />
						</td>
						<td style="width: 10%;text-align:center;"> 
							<form:input path="serviceLineCost" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
						</td>
						<td style="width: 10%;text-align:center;"> 
							<form:input path="markup" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
						</td>
						
						</tr>
						<tr>
							<th colspan="6">&nbsp;</th>
							<th style="width: 30%;" align="center" colspan="2">Action</th>
						</tr>
						<tr>
							<td colspan="6"> &nbsp;</td>
							<td style="width: 30%;" colspan="2">
								<table style="border:none">
									<tr>
									<td>
										<input class="contact" type="submit" value="Add & Import Doc List">
									</td>
									<td>
										<a href="view_workload_VSA?dealConfirmationId=${dealConfirmationId}" ><input type="button" style="width: 100px;background-color: blue;" value="Cancel"></a>
									</td>
								</tr>
								</table>
					</tr>
				</table>
				</form:form>
		</c:if>		
</body>

<script>

$('#countryName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCountryConsulateList',
	paramName: "countryName",
	delimiter: ",",
	onSelect: function(suggestion) {
		$('#consulateCity').empty();
		$('#consulateCity').append($("<option class='service-small'>").val("").text("Please Select"));
		$.each(suggestion.consCityList, function(key, value) {
			$('#consulateCity').append($("<option class='service-small'>").val(key).text(value));
		});
		cityID = suggestion.data;
        id=cityID;
        jQuery("#countryCode").val(cityID);
        $('input[name=countryCode]').val(id);
        return false;
    },
	transformResult: function(response) {
        return {
            suggestions: $.map($.parseJSON(response), function(item) {
            	return { value: item.countryName, data: item.countryCode,consCityList : item.cityKeyValue };
            })
            
        };
        
    }
});

	//document.getElementById('passportExpiryDate').value = new Date().toISOString().substring(0, 10);

	/*
	$('#countryName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCountryList',
	paramName: "countryName",
	delimiter: ",",
	onSelect: function(suggestion) {
        cityID = suggestion.data;
        id=cityID;
        jQuery("#countryCode").val(cityID);
        $('input[name=countryCode]').val(id);
        return false;
    },
	transformResult: function(response) {
        return {
            suggestions: $.map($.parseJSON(response), function(item) {
            	return { value: item.countryName, data: item.countryCode };
            })
            
        };
    }
});
	*/
</script>
</html>

