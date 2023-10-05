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
  background-image: url('${pageContext.request.contextPath}/resources/images/other.png');
  background-repeat: no-repeat;
   background-position: center;
  background-size: auto;
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
  background: yellow;
  height: 40px;
  width: 10%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: black;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
  font-size:20px;
}

th, td {
  padding: 0px;
}
tr {
  border-bottom: 1px solid #cccccc;
}

td {
  border-right: 1px solid #cccccc;
  padding: 10px;
  transition: all 0.2s;
  text-align: center;
  font-size:20px;
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
<h2 align="center">	Other Services WorkLoad Details	</h2>
<hr>
	
<body style="background-color: white;">
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
			<c:if test="${not empty OTH_SL_LIST}">
				<c:forEach var="othSLObj" items="${OTH_SL_LIST}">
				<c:choose>
				<c:when test="${othSLObj.othServiceId eq OTH_SL_OBJ.othServiceId  && OTH_SL_ACTION eq 'UPDATE' }">
					<form:form name="formaddwl" modelAttribute="OTH_SL_OBJ" action="edit_edit_workload_OTH_SL" >
							<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
							<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
							<input type="hidden" name="othServiceId" value="${othSLObj.othServiceId}" />
							<c:if test="${OTH_SL_ACTION eq 'UPDATE'}">
							<table style="border: 3px solid black;width:85%;table-layout: fixed;" id="updateother">
							<tr>
								<th width="15%;" style="background-color: #CA1551;color:white;" align="center">Service Name</th>
								<th width="15%;" style="background-color: #CA1551;color:white;" align="center">Service Type</th>
								<th width="30%;" style="background-color: #CA1551;color:white;" align="center">Service Details</th>
								<th width="10%;" style="background-color: #CA1551;color:white;" align="center">Date</th>
								<th width="15%;" style="background-color: #CA1551;color:white;" align="center">Supplier Name</th>
								<th width="15%;" style="background-color: #CA1551;color:white;" align="center">Status</th>
							</tr>
							<tr>
							<td width="15%;" align="center" >
								<form:input path="serviceName" style="width: 150px; height:40px; border: 1px solid ;" required="required" />
							</td>
							<td width="15%" align="center">
								<form:input path="serviceType" style="width: 150px; height:40px; border: 1px solid ;" required="required" />
							</td>
							<td width="30%" align="center">
								<form:input path="serviceDetails" style="width: 350px; height:40px; border: 1px solid ;" required="required" />
							</td>
							
							<td width="10%" align="center">
								<form:input path="serviceDate" style="width: 150px; height:40px; border: 1px solid ;" type="date"  />
							 </td>
							
							<td width="15%" align="center">
								<div class="select">
									<form:select path="supplierId" style="width: 150px;height:30px;border: 1px solid ;" required="required">  
										<form:options items = "${OTH_SUPPLIER_MAP}" class="service-small"/>
									</form:select>  
								</div>
							</td>
							<td width="15%;" align="center">
								<div class="select">
									<form:select path="status" style="width: 120px;height:30px;border: 1px solid ;" required="required">  
										<form:options items = "${OTH_SL_STATUS_MAP}" class="service-small"/>
									</form:select>  
								</div>
							</td>
					
						</tr>
						<tr>
							<th width="30%;" style="background-color: #CA1551;color:white;" align="center" colspan="2">Remarks</th>
							<th width="15%;" style="background-color: #CA1551;color:white;" align="center">Cost</th>
							<th width="15%;" style="background-color: #CA1551;color:white;" align="center">Markup</th>
							<th width="10%;" style="background-color: #CA1551;color:white;" align="center">Display Order</th>
							<th width="30%;" style="background-color: #CA1551;color:white;" align="center">Action</th>
						</tr>
						<tr>
							
							<td width="30%;" align="center" colspan="2">
								<form:textarea path = "remarks" rows = "2" cols = "15" style="width: 300px; height: 100px;border: 2px solid green; border-radius: 4px;" htmlEscape="false" /> 
							</td>
							<td width="15%;" align="center">
								<form:input path="serviceLineCost" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
							</td>
							<td width="15%;" align="center">
								<form:input path="markup" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" /> 
							</td>
							<td width="10%;" align="center">
								<form:input path="displayOrder" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" /> 
							</td>
											
							<td width="30%" align="center">
								<input style="width: 100px; background-color: green" type="submit" value="Update" /> | 
								<a href="view_workload_OTH?dealConfirmationId=${dealConfirmationId}" ><input type="button" style="width: 100px;background-color: blue;" value="Cancel"></a>
							</td>
						</tr>
				</table>
				<p>&nbsp;</p>
				</c:if>
			</form:form>						
						
			</c:when>
								

				<c:otherwise>
				<table style="border: 3px solid black;width:85%;table-layout: fixed;" id="viewother">
				<tr>
					<th width="15%" align="center">Service Name</th>
					<th width="15%" align="center">Service Type</th>
					<th width="30%" align="center">Service Details</th>
					<th width="10%" align="center">Date</th>
					<th width="15%" align="center">Supplier Name</th>
					<th width="15%" align="center">Status</th>
				</tr>
				<tr>
					<td width="15%" align="center">${othSLObj.serviceName}</td>
					<td width="15%" align="center">${othSLObj.serviceType}</td>
					<td width="30%" align="center">${othSLObj.serviceDetails}</td>
					<td width="10%" align="center"><fmt:formatDate value="${othSLObj.serviceDate}" pattern="dd-MM-yyyy" /></td>
					<td width="15%" align="center">${othSLObj.supplierName}</td>
					<td width="15%" align="center">${othSLObj.statusName}</td>
					
				</tr>
				<tr>
					
					<th width="30%" align="center" colspan="2">Remarks</th>
					<th width="15%" align="center">Cost</th>
					<th width="15%" align="center">Markup</th>
					<th width="10%" align="center">Display Order</th>
					<th width="30%" align="center">Action</th>
				</tr>
				<tr>
					
					<td width="30%" align="center" colspan="2">${othSLObj.remarks}</td>
					<td width="15%">${othSLObj.serviceLineCost}</td>
					<td width="15%">${othSLObj.markup}</td>
					<td width="10%">${othSLObj.displayOrder}</td>
					<td width="30%" align="center">
						<form:form id="form_update_OTH_SL" name="form_update_OTH_SL" action="view_update_workload_form_OTH" method="POST" style="display:inline;">
							<input type="hidden" name="othServiceId" value="${othSLObj.othServiceId}"/>
							<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
							<input type="submit" name="Edit" Value="Edit" style="background-color: blue; padding: 6px 12px;" />
						</form:form> | 
						<form:form id="form_del_OTH_SL" name="form_del_OTH_SL" action="view_delete_oth_sl_confirmation" method="POST" style="display:inline;">		
								<input type="hidden" name="othServiceId" value="${othSLObj.othServiceId}"/>
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
		
		
		<!-- Following set of code will get executed only user have clicked on the Add flight button.  -->
		<form:form name="formaddwl" modelAttribute="OTH_SL_OBJ" action="create_workload_OTH_SL" >
			<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
			<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
			<c:if test="${OTH_SL_ACTION eq 'ADD'}">
			<table style="border: 3px solid black;width:85%;" id="newother">
			<tr>
				<th width="15%;" style="background-color: #CA1551;color:white;" align="center">Service Name</th>
				<th width="15%;" style="background-color: #CA1551;color:white;" align="center">Service Type</th>
				<th width="30%;" style="background-color: #CA1551;color:white;" align="center">Service Details</th>
				<th width="10%;" style="background-color: #CA1551;color:white;" align="center">Date</th>
				<th width="15%;" style="background-color: #CA1551;color:white;" align="center">Supplier Name</th>
				<th width="15%;" style="background-color: #CA1551;color:white;" align="center">Status</th>
			</tr>
			<tr>
					<td width="15%;" align="center" >
						<form:input path="serviceName" style="width: 150px; height:40px; border: 1px solid ;" required="required" />
					</td>
					<td width="15%" align="center">
						<form:input path="serviceType" style="width: 150px; height:40px; border: 1px solid ;" required="required" />
					</td>
					<td width="30%" align="center">
						<form:input path="serviceDetails" style="width: 350px; height:40px; border: 1px solid ;" required="required" />
					</td>
					
					<td width="10%" align="center">
						<form:input path="serviceDate" style="width: 150px; height:40px; border: 1px solid ;" type="date"  />
					 </td>
					
					<td width="15%" align="center">
						<div class="select">
							<form:select path="supplierId" style="width: 150px;height:30px;border: 1px solid ;" required="required">  
								<form:options items = "${OTH_SUPPLIER_MAP}" class="service-small"/>
							</form:select>  
						</div>
					</td>
					<td width="15%;" align="center">
						<div class="select">
							<form:select path="status" style="width: 120px;height:30px;border: 1px solid ;" required="required">  
								<form:options items = "${OTH_SL_STATUS_MAP}" class="service-small"/>
							</form:select>  
						</div>
					</td>
			
				</tr>
				<tr>
					<th width="30%;" style="background-color: #CA1551;color:white;" align="center" colspan="2">Remarks</th>
					<th width="15%;" style="background-color: #CA1551;color:white;" align="center">Cost</th>
					<th width="15%;" style="background-color: #CA1551;color:white;" align="center">Markup</th>
					<th width="10%;" style="background-color: #CA1551;color:white;" align="center">Display Order</th>
					<th width="30%;" style="background-color: #CA1551;color:white;" align="center">Action</th>
				</tr>
				<tr>
					
					<td width="30%;" align="center" colspan="2">
						<form:textarea path = "remarks" rows = "2" cols = "15" style="width: 300px; height: 100px;border: 2px solid green; border-radius: 4px;" htmlEscape="false" /> 
					</td>
					<td width="15%;" align="center">
						<form:input path="serviceLineCost" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
					</td>
					<td width="15%;" align="center">
						<form:input path="markup" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" /> 
					</td>
					<td width="10%;" align="center">
						<form:input path="displayOrder" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" /> 
					</td>
					<td width="30%;" align="center">
						<table>
						<tr>
						<td>
							<input style="width: 100px;background-color: blue" type="submit" value="ADD" />
						</td>
						<td>
							<a href="view_workload_OTH?dealConfirmationId=${dealConfirmationId}" ><input type="button" style="width: 80px;background-color: blue;" value="Cancel"></a>	
						</td>
						</tr>
						</table>
						
					</td>
				</tr>
				</table>
				</c:if>
			</form:form>
		
			<form:form modelAttribute="OTH_SL_OBJ" action="view_create_workload_form_OTH">
				<div align="right">
					<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
					<c:if test="${OTH_SL_ACTION ne 'ADD'}">
						<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
						<input type="submit" value="Add Other Service" />
					</c:if>
				</div>
			</form:form>

		
		<!-- 
		
			<div align="right">
				<table>
				<tr>
				<td>
				<form:form modelAttribute="OTH_SL_OBJ" action="view_create_workload_form_OTH">
					<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
					<c:if test="${OTH_SL_ACTION ne 'ADD'}">
						<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
						<input type="submit" value="Add Other Service" />
					</c:if>
				</form:form>
				</td>
				<td>
				<form:form modelAttribute="OTH_SL_OBJ" action="view_workload_OTH">	
				<c:if test="${OTH_SL_ACTION eq 'ADD' || OTH_SL_ACTION eq 'UPDATE' }">
					<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
					<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
					<input type="submit" value="Cancel" />
				</c:if>
				</form:form>
				</td>
				</tr>
				</table>
			</div>
		
 -->

</body>

<script>
$(document).ready(function () {
    // Handler for .ready() called.
    var ut = document.getElementById('updateother'); 
    var nt = document.getElementById('newother');
    if (ut != null) { 
    	$('html, body').animate({
            scrollTop: $('#updateother').offset().top
        }, 'slow');
    }
    else if (nt != null) {
        $('html, body').animate({
            scrollTop: $('#newother').offset().top
        }, 'slow');
    	
    }
    
});

$('#departingCity').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCityList',
	paramName: "cityName",
	delimiter: ",",
	onSelect: function(suggestion) {
        cityID = suggestion.data;
        id=cityID;
        jQuery("#destinationId").val(cityID);
        $('input[name=departingFrom]').val(id);
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

$('#arrivalCity').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCityList',
	paramName: "cityName",
	delimiter: ",",
	onSelect: function(suggestion) {
        cityID = suggestion.data;
        id=cityID;
        jQuery("#destinationId").val(cityID);
        $('input[name=arrivingTo]').val(id);
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

