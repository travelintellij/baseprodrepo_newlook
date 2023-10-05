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
/*body {
  background-image: url('${pageContext.request.contextPath}/resources/images/insurance.png');
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
  background: #D2691E;
  height: 40px;
  width: 10%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
  font-size:20px;
  
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

	
	<br>
	<h2 align="center">
		Insurance WorkLoad Details
	</h2>
	<hr>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<body style="background-color: white;">
			<c:if test="${not empty INS_SL_LIST}">
				<c:forEach var="insSLObj" items="${INS_SL_LIST}">
				<c:choose>
				<c:when test="${insSLObj.insServiceId eq INS_SL_OBJ.insServiceId  && INS_SL_ACTION eq 'UPDATE' }">
				<form:form name="formaddwl" modelAttribute="INS_SL_OBJ" action="edit_edit_workload_INS_SL" >
					<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
					<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
					<input type="hidden" name="insServiceId" value="${insSLObj.insServiceId}" />
					<c:if test="${INS_SL_ACTION eq 'UPDATE'}">
					<table  style="border: 3px solid black;width:85%;table-layout: fixed;" id="updateinsurance">
					<tr>
						<th style="width: 10%;background-color: #CA1551;" align="center">Destination</th>
						<th style="width: 20%;background-color: #CA1551;" align="center">Applicant Name</th>
						<th style="width: 15%;background-color: #CA1551;" align="center">Age</th>
						<th style="width: 15%;background-color: #CA1551;" align="center">Plan Name</th>
						<th style="width: 15%;background-color: #CA1551;" align="center">Coverage Start Date</th>
						<th style="width: 15%;background-color: #CA1551;" align="center">Coverage End Date</th>
						<th style="width: 10%;background-color: #CA1551;" align="center">Insurance Type</th>
						
					</tr>
					<tr>
						<td style="width: 10%;" align="center">
							<form:input path="destinationName" style="width: 150px; height:40px; border: 1px solid ;" required="required" placeholder="country name" />
							<form:hidden path = "destinationId" id="destinationId" />
							<font color="red"><form:errors path="destinationName" /></font>
							
						</td>
						<td style="width: 20%;" align="center">
							<form:input path="applicantName" style="width: 240px; height:40px; border: 1px solid ;" required="required" placeholder="Applicant name" />
						</td>
						<td style="width: 15%;" align="center">
							<form:input path="age" style="width: 40px; height:40px; border: 1px solid ;" required="required" type="number" />
						</td>
						<td style="width: 15%;" align="center">
							<form:input path="planName" style="width: 200px; height:40px; border: 1px solid ;" required="required"  />
						</td>
						<td style="width: 20%;" align="center">
							<form:input path="coverageStartDate" style="width: 150px; height:40px; border: 1px solid ;" type="date" required="required"  />
							<font color="red"><form:errors path="coverageStartDate" /></font>
						</td>
						<td style="width: 20%;" align="center">
							<form:input path="coverageEndDate" style="width: 150px; height:40px; border: 1px solid ;" type="date" required="required"  />
						</td>
						<td style="width: 20%;" align="center">
							<form:select path="insuranceType" style="width: 100px;height:40px;" required="required">  
								<form:options items = "${INSURANCE_TYPE_MAP}" class="service-small"/>
							</form:select>  
						</td>
					</tr>
					<tr>						
						<th style="width: 15%;background-color: #CA1551;" align="center">Coverage</th>
						<th style="width: 30%;background-color: #CA1551;" align="center">Remarks</th>
						<th style="width: 15%;background-color: #CA1551;" align="center">Provider</th>
						<th style="width: 15%;background-color: #CA1551;" align="center">Supplier</th>
						<th style="width: 15%;background-color: #CA1551;" align="center" >Status</th>
						<th style="width: 10%;background-color: #CA1551;" align="center">Cost</th>
						<th style="width: 10%;background-color: #CA1551;" align="center">Markup</th>
						
					</tr>
					<tr>
						<td style="width: 15%;" align="center">
							<table style="border:none;">
							<tr><td>
							<div class="select">
								<form:select path="coverageCurrency" style="width: 60px;height:30px;" required="required">  
										<option class="service-small" value="" selected>Please Select</option>
										<form:options items = "${CURRENCY_LIST}" class="service-small"/>
									</form:select>  
							</div>
							</td>
							<td>
								<form:input path="coverageAmount" style="width: 80px;height:40px; border: 1px solid ;" type="number" required="required"  />
							</td>
							</tr> 
							</table>
						</td>
						<td style="width: 30%;" align="center">
							<form:textarea path = "remarks" style="width: 250px;" rows="3" cols="150" htmlEscape="false" />
						</td>
						
						<td style="width: 15%;" align="center">
							<div class="select">
							<form:select path="insuranceProvider" style="width: 180px;height:30px;" required="required">  
										<option class="service-small" value="" selected>Please Select</option>
										<form:options items = "${INS_PROVIDER_MAP}" class="service-small"/>
							</form:select>  
							 </div>
							</td>
							
						<td style="width: 15%;" align="center">
								 <div class="select">
								<form:select path="supplierId" style="width: 180px;height:30px;" required="required">  
										<form:options items = "${INS_SUPPLIER_MAP}" class="service-small"/>
								</form:select>  
								 </div>
							</td>
								<td style="width: 15%;" align="left">
									<div class="select">
										<form:select path="status" style="width: 200px;height:30px;" required="required">  
											<form:options items = "${INS_SL_STATUS_MAP}" class="service-small"/>
										</form:select>  
								 </div>
							</td>
							<td style="width: 10%;" align="center" >
								<form:input path="serviceLineCost" style="width: 100px; height:40px; border: 1px solid ;" type="number" required="required"  />
							</td>
							<td style="width: 10%;" align="center" >
								<form:input path="markup" style="width: 100px; height:40px; border: 1px solid ;" type="number" required="required"  />
							</td>
							
							</tr>
							<tr>
								<th style="background-color: #CA1551;" colspan="4">&nbsp;</th>
								<th style="width: 10%;background-color: #CA1551;" align="center">Display Order</th>
								<th  style="width: 20%;background-color: #CA1551;" colspan="2"> Action </th>
							</tr>
							<tr>
							<td colspan="4">&nbsp;</td>
							<td style="width: 10%;" align="center">
								<form:input path="displayOrder" style="width: 50px; height:40px; border: 1px solid ;" type="number" required="required"  />
							</td>
							
							<td style="width: 20%;" align="center" colspan="2">
								<input style="width: 100px; background-color: green" type="submit" value="Update" /> | 
								<a href="view_workload_INS?dealConfirmationId=${dealConfirmationId}" ><input type="button" style="width: 100px;background-color: blue;" value="Cancel"></a>
							</td>
						</tr>
					</table>
					</c:if>		
				</form:form>
				
				</c:when>
				<c:otherwise>
					<table style="border: 3px solid black;width:85%;table-layout: fixed;">
					<tr>
						<th style="width: 10%;" align="center">Destination</th>
						<th style="width: 20%;" align="center">Applicant Name</th>
						<th style="width: 15%;" align="center">Age</th>
						<th style="width: 15%;" align="center">Plan Name</th>
						<th style="width: 15%;" align="center">Coverage Start Date</th>
						<th style="width: 15%;" align="center" >Coverage End Date</th>
						<th style="width: 15%;" align="center" >Insurance Type</th>
						
					</tr>
					<tr>
						<td style="width: 10%;" align="center">${insSLObj.destinationName}</td>
						<td style="width: 20%;" align="center">${insSLObj.applicantName}</td>
						<td style="width: 15%;" align="center">${insSLObj.age}</td>
						<td style="width: 15%;" align="center">${insSLObj.planName} </td>
						<td style="width: 15%;" align="center"><fmt:formatDate value="${insSLObj.coverageStartDate}" pattern="dd-MM-yyyy" /></td>
						<td style="width: 15%;" align="center"><fmt:formatDate value="${insSLObj.coverageEndDate}" pattern="dd-MM-yyyy" /></td>
						<td style="width: 10%;" align="center">${insSLObj.insuranceTypeName} </td>
					</tr>
					<tr>						
						<th style="width: 15%" align="center">Coverage</th>
						<th style="width: 30%" align="center">Remarks</th>
						<th style="width: 15%;" align="center">Provider</th>
						<th style="width: 15%" align="center">Supplier</th>
						<th style="width: 15%;" align="center" >Status</th>
						<th style="width: 10%;" align="center">Cost</th>
						<th style="width: 10%;" align="center">Markup</th>
						
					</tr>
					<tr>
						<td style="width: 15%;" align="center">${insSLObj.coverageCurrency} ${insSLObj.coverageAmount} </td>
						<td style="width: 30%;" align="center">${insSLObj.remarks}</td>
						<td style="width: 15%;" align="center">${insSLObj.insuranceProviderName}</td>
						<td style="width: 15%;" align="center">${insSLObj.supplierName}</td>
						<td style="width: 15%;" align="left">${insSLObj.statusName}</td>
						<td style="width: 10%;" align="left">${insSLObj.serviceLineCost}</td>
						<td style="width: 10%;" align="left">${insSLObj.markup}</td>
					</tr>		
					<tr>
						<th colspan="5"></th>
						<th style="width: 15%;" align="center" >Display Order</th>
						<th style="width: 25%;" align="center" >Action</th>
					</tr>
					<tr>
					<td colspan="5"></td>
					<td style="width: 10%;" align="center">${insSLObj.displayOrder} </td>
					<td style="width: 25%;" align="center">
							<form:form id="form_update_INS_SL" name="form_update_INS_SL" action="view_update_workload_form_INS" method="POST" style="display:inline;">
								<input type="hidden" name="insServiceId" value="${insSLObj.insServiceId}" />
								<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
								<input type="submit" name="Edit" Value="Edit" style="background-color: blue; padding: 6px 12px;" />
							</form:form> | 
					
							<form:form id="form_del_INS_SL" name="form_del_FLT_SL" action="view_delete_ins_sl_confirmation" method="POST" style="display:inline;">		
								<input type="hidden" name="insServiceId" value="${insSLObj.insServiceId}"/>
								<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
								<input type="submit" name="Delete" Value="Delete" style="background-color: red; padding: 6px 12px;" />
							</form:form>
						</td>
					</tr>
					</table>
					<p>&nbsp;</p>
				</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:if>
		
		
		<!-- Following set of code will get executed only user have clicked on the Add Insurance  button.  -->
		<form:form name="formaddwl" modelAttribute="INS_SL_OBJ" action="create_workload_INS_SL" >
			<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
			<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
			<c:if test="${INS_SL_ACTION eq 'ADD'}">
			<table  style="border: 3px solid black;width:85%;table-layout: fixed;" id="updateinsurance">
					
				<tr>
						<th style="width: 10%;background-color: #CA1551;" align="center">Destination</th>
						<th style="width: 20%;background-color: #CA1551;" align="center">Applicant Name</th>
						<th style="width: 15%;background-color: #CA1551;" align="center">Age</th>
						<th style="width: 15%;background-color: #CA1551;" align="center">Plan Name</th>
						<th style="width: 15%;background-color: #CA1551;" align="center">Coverage Start Date</th>
						<th style="width: 15%;background-color: #CA1551;" align="center">Coverage End Date</th>
						<th style="width: 10%;background-color: #CA1551;" align="center">Insurance Type</th>
						
					</tr>
					<tr>
						<td style="width: 10%;" align="center">
							<form:input path="destinationName" style="width: 150px; height:40px; border: 1px solid ;" required="required" placeholder="country name" />
							<form:hidden path = "destinationId" id="destinationId" />
							<font color="red"><form:errors path="destinationName" /></font>
							
						</td>
						<td style="width: 20%;" align="center">
							<form:input path="applicantName" style="width: 240px; height:40px; border: 1px solid ;" required="required" placeholder="Applicant name" />
						</td>
						<td style="width: 15%;" align="center">
							<form:input path="age" style="width: 40px; height:40px; border: 1px solid ;" required="required" type="number" />
						</td>
						<td style="width: 15%;" align="center">
							<form:input path="planName" style="width: 200px; height:40px; border: 1px solid ;" required="required"  />
						</td>
						<td style="width: 20%;" align="center">
							<form:input path="coverageStartDate" style="width: 150px; height:40px; border: 1px solid ;" type="date" required="required"  />
							<font color="red"><form:errors path="coverageStartDate" /></font>
						</td>
						<td style="width: 20%;" align="center">
							<form:input path="coverageEndDate" style="width: 150px; height:40px; border: 1px solid ;" type="date" required="required"  />
						</td>
						<td style="width: 20%;" align="center">
							<div class="select">
								<form:select path="insuranceType" style="width: 200px;height:30px;" required="required">  
									<form:options items = "${INSURANCE_TYPE_MAP}" class="service-small"/>
								</form:select>  
							 </div>
						</td>
						
					</tr>
					<tr>						
						<th style="width: 15%;background-color: #CA1551;" align="center">Coverage</th>
						<th style="width: 30%;background-color: #CA1551;" align="center">Remarks</th>
						<th style="width: 15%;background-color: #CA1551;" align="center">Provider</th>
						<th style="width: 15%;background-color: #CA1551;" align="center">Supplier</th>
						<th style="width: 15%;background-color: #CA1551;" align="center" >Status</th>
						<th style="width: 10%;background-color: #CA1551;" align="center">Cost</th>
						<th style="width: 10%;background-color: #CA1551;" align="center">Markup</th>
						
					</tr>
					<tr>
						<td style="width: 15%;" align="center">
							<table style="border:none;">
							<tr><td>
							<div class="select">
								<form:select path="coverageCurrency" style="width: 60px;height:30px;" required="required">  
										<option class="service-small" value="" selected>Select</option>
										<form:options items = "${CURRENCY_LIST}" class="service-small"/>
									</form:select>  
							</div>
							</td>
							<td>
								<form:input path="coverageAmount" style="width: 80px;height:40px; border: 1px solid ;" type="number" required="required"  />
							</td>
							</tr> 
							</table>
						</td>
						<td style="width: 30%;" align="center">
							<form:textarea path = "remarks" style="width: 250px;" rows="3" cols="150" htmlEscape="false" />
						</td>
						
						<td style="width: 15%;" align="center">
							<div class="select">
							<form:select path="insuranceProvider" style="width: 180px;height:30px;" required="required">  
										<option class="service-small" value="" selected>Please Select</option>
										<form:options items = "${INS_PROVIDER_MAP}" class="service-small"/>
							</form:select>  
							 </div>
							</td>
							
						<td style="width: 15%;" align="center">
								 <div class="select">
								<form:select path="supplierId" style="width: 180px;height:30px;" required="required">  
										<form:options items = "${INS_SUPPLIER_MAP}" class="service-small"/>
								</form:select>  
								 </div>
							</td>
								<td style="width: 15%;" align="left">
									<div class="select">
										<form:select path="status" style="width: 200px;height:30px;" required="required">  
											<form:options items = "${INS_SL_STATUS_MAP}" class="service-small"/>
										</form:select>  
								 </div>
							</td>
							<td style="width: 10%;" align="center" >
								<form:input path="serviceLineCost" style="width: 100px; height:40px; border: 1px solid ;" type="number" required="required"  />
							</td>
							<td style="width: 10%;" align="center" >
								<form:input path="markup" style="width: 100px; height:40px; border: 1px solid ;" type="number" required="required"  />
							</td>
							
							</tr>
							<tr>
								<th style="background-color: #CA1551;" colspan="4">&nbsp;</th>
								<th style="width: 10%;background-color: #CA1551;" align="center">Display Order</th>
								<th  style="width: 20%;background-color: #CA1551;" colspan="2"> Action </th>
							</tr>
							<tr>
							<td colspan="4">&nbsp;</td>
							<td style="width: 10%;" align="center">
								<form:input path="displayOrder" style="width: 50px; height:40px; border: 1px solid ;" type="number" required="required"  />
							</td>
							
							<td style="width: 20%;" align="center" colspan="2">
								<input style="width: 100px; background-color: green" type="submit" value="Create" /> | 
								<a href="view_workload_INS?dealConfirmationId=${dealConfirmationId}" ><input type="button" style="width: 100px;background-color: blue;" value="Cancel"></a>
							</td>
						</tr>
					</table>
			</c:if>		
		</form:form>
		</table>


	<form:form modelAttribute="INS_SL_OBJ" action="view_create_workload_form_INS">
		<div align="right">
			<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
			<c:if test="${INS_SL_ACTION ne 'ADD'}">
				<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
				<input type="submit" value="Add Insurance" />
			</c:if>
		</div>
	</form:form>
</div>
</body>

<script>
$(document).ready(function () {
    // Handler for .ready() called.
    var ut = document.getElementById('updateinsurance'); 
    var nt = document.getElementById('newinsurance');
    if (ut != null) { 
    	$('html, body').animate({
            scrollTop: $('#updateinsurance').offset().top
        }, 'slow');
    }
    else if (nt != null) {
        $('html, body').animate({
            scrollTop: $('#newinsurance').offset().top
        }, 'slow');
    	
    }
    
});

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

