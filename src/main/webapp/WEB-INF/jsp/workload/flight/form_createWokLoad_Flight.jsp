<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/jquery.datetimepicker.min.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery.datetimepicker.full.js" />"></script>


<head>
<title>UdanChoo Team Workload Section</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="${pageContext.request.contextPath}/resources/css/tooplate_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/coda-slider.css" type="text/css" charset="utf-8" />

</head>

<style>
body {
  background-image: url('${pageContext.request.contextPath}/resources/images/flight.png');
  background-repeat: no-repeat;
   background-position: center;
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
  background: #7B68EE;
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
<body style="background-color: white;">


	<br>
	<h2 align="center">
		Flight WorkLoad Details
	</h2>
	<hr>
	<p style="text-align:center"><font color="green"><b>${Success}</b></font>
	<font color="red"><b>${Error}</b></font>
	<font color="red">
		<form:errors path="departingFrom" /><br>
		<form:errors path="arrivingTo" />
	</font>
	</p>
	
		
			<c:if test="${not empty FLT_SL_LIST}">
			
				<c:forEach var="fltSLObj" items="${FLT_SL_LIST}">
				<c:choose>
				<c:when test="${fltSLObj.fltServiceId eq FLT_SL_OBJ.fltServiceId  && FLT_SL_ACTION eq 'UPDATE' }">
					<c:if test="${FLT_SL_ACTION eq 'UPDATE'}">
					<form:form name="formaddwl" modelAttribute="FLT_SL_OBJ" action="edit_edit_workload_FLT_SL" >
							<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
							<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
							<input type="hidden" name="fltServiceId" value="${fltSLObj.fltServiceId}" />
						<table style="border: 3px solid black;width:85%;" id="updateflight">
							<tr>
								<th style="background-color: #CA1551; width: 10%;" align="center">Air Line</th>
								<th style="background-color: #CA1551;width: 10%;" align="center">Flight No.</th>
								<th style="background-color: #CA1551;width: 15%;" align="center">Depart Date</th>
								<th style="background-color: #CA1551;width: 15%;" align="center">Arrival Date</th>
								<th style="background-color: #CA1551;width: 15%;" align="center">Departure</th>
								<th style="background-color: #CA1551;width: 15%;" align="center">Arrival</th>
								<th style="background-color: #CA1551;width: 5%;" align="center">Halt</th>
								<th style="background-color: #CA1551;width: 15%;" align="center">Cabin</th>
							</tr>
							<tr>
								<td style="width: 10%;" align="center">
								 <div class="select">
								 	<form:select path="airlineId" style="width: 200px;" required="required">  
										<option class="service-small" value="" selected>Please Select</option>
										<form:options items = "${AIRLINES_MAP}" class="service-small"/>
									</form:select>  
									 </div>
									</td>
									<td style="width: 10%;" align="center">
										<form:input path="flightNumber" style="width: 130px;height:40px;border: 1px solid ;" id="flightNumber"  required="required" minlength="3" />
									</td>
									<td style="width: 10%;" align="center">
										<input style="width: 130px;height:40px;border: 1px solid ;" id="departureDate" name="departureDate" value="${localDateTimeFormatToEdit.format(FLT_SL_OBJ.departureDate)}"  required/>
									</td>
									<td style="width: 10%;" align="center">
										<input style="width: 130px;height:40px;border: 1px solid ;" id="arrivalDate" name="arrivalDate" value="${localDateTimeFormatToEdit.format(FLT_SL_OBJ.arrivalDate)}"  required/>
									</td>
									<td style="width: 15%;" align="center">
										<form:input path="originCity" style="width: 130px;height:40px;border: 1px solid ;" type="text" id="originCity"  />
										<form:hidden path = "departingFrom" id="departingFrom" />
										<b><font color="red"><form:errors path="originCity" cssClass="error" /></font></b>
										
									</td>
									<td style="width: 15%;" align="center">
										<form:input path="destinationCity" style="width: 130px;height:40px;border: 1px solid ;" type="text" id="destinationCity"  />
										<form:hidden path = "arrivingTo" id="arrivingTo" />
										<b><font color="red"><form:errors path="destinationCity" cssClass="error" /></font></b>
									</td>
									<td style="width: 5%;" align="center">
										 <div class="select">
										<form:select path="noOfHalt" style="width: 150px;" required="required">  
											<form:options items = "${NO_OF_HALTS}" class="service-small"/>
										</form:select>  
										</div>
									</td>
							<td style="width: 15%;" align="center">
								<div class="select">
									<form:select path="cabinClass" style="width: 150px;" required="required">  
										<form:options items = "${FLT_TKT_TYPE_LIST}" class="service-small"/>
									</form:select>  
								</div>
							</td>
								
							</tr>
					<tr>
						<th style="background-color: #CA1551;width: 20%;" align="center">Adults | Children | Infant</th>
						<th style="background-color: #CA1551;width: 25%;" align="center" colspan="2">Remarks</th>
						<th style="background-color: #CA1551;width: 15%;" align="center">Supplier</th>
						<th style="background-color: #CA1551;width: 10%;" align="center" >Status</th>
						<th style="background-color: #CA1551;width: 10%;" align="center" >Cost</th>
						<th style="background-color: #CA1551;width: 10%;" align="center" >Markup</th>
						<th style="background-color: #CA1551;width: 10%;" align="center" >Display Order</th>
					</tr>
					<tr>
						<td style="width: 20%;" align="center">
							<form:input path="adults"  style="width: 50px;height:40px;border: 1px solid ;" type="number" min="0" step="1" /> | 
							<form:input path="children"  style="width: 50px;height:40px;border: 1px solid ;" type="number" min="0" step="1" /> | 
							<form:input path="infants"  style="width: 50px;height:40px;border: 1px solid ;" type="number" min="0" step="1" />
							<b><font color="red"><form:errors path="adults" cssClass="error" /></font></b> 

						</td>
						<td style="width: 25%;" align="center" colspan="2">
							<form:textarea path = "remarks" rows = "4" cols = "15" style="width: 300px; height: 100px;border: 2px solid green; border-radius: 4px;" htmlEscape="false" /> 
						</td>
						<td style="width: 15%;" align="center">
							 <div class="select">
								<form:select path="supplierId" style="width: 230px;" required="required">  
									<form:options items = "${FLT_SUPPLIER_MAP}" class="service-small"/>
								</form:select>  
							 </div>
						</td>
						<td style="width: 10%;" align="center">
							<div class="select">
								<form:select path="status" style="width: 230px;" required="required">  
									<form:options items = "${FLT_SL_STATUS_MAP}" class="service-small"/>
								</form:select>  
							 </div>
						</td>
						<td style="width: 10%;" align="center">
						 	<form:input path="serviceLineCost" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
						</td>
						<td style="width: 10%;" align="center">
						 	<form:input path="markup" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
						</td>
						<td style="width: 10%;" align="center" >
							<form:input path="displayOrder" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
						</td>
						</tr>
						<tr>
							<th style="background-color: #CA1551;" colspan="7">&nbsp;</th>
							<th style="background-color: #CA1551;"> Action </th>
						</tr>
						<tr>
							<td colspan="7">&nbsp;</td>
							<td style="width: 15%;" align="center">
								<table style="border: none;border-collapse:collapse;margin: 0px auto;" >
									<tr>
										<td><input style="width: 100px;" type="submit" value="Update" />
										</form:form>
										</td>
										<td>
										<form:form name="formaddwl" modelAttribute="FLT_SL_OBJ" action="view_workload_FLT" style="display:inline;" >
											<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
											<input style="width: 100px;background-color: blue;" type="submit" value="Cancel" />
										</form:form>
										</td>
								</tr>
								</table>
								
							</td>
						</tr>
							
					<!-- 
					<tr>
						<td colspan="9" style="background-color: white;" class="divider"><hr /></td>
					</tr>		
 					-->
				</table>
				<p>&nbsp;</p>
								
				</c:if>
											
						
				</c:when>
				<c:otherwise>
				
				<table style="border: 3px solid black;width:85%;">
				
				<tr>
					<th style="width: 10%;" align="center">Air Line</th>
					<th style="width: 10%;" align="center">Flight No.</th>
					<th style="width: 15%;" align="center">Depart Date</th>
					<th style="width: 15%;" align="center">Arrival Date</th>
					<th style="width: 15%;" align="center">Departing</th>
					<th style="width: 15%;" align="center">Arriving</th>
					<th style="width: 5%;" align="center">Halt</th>
					<th style="width: 15%;" align="center">Cabin</th>
					
				</tr>
				<tr>
					<td style="width: 10%;" align="center">${fltSLObj.airlineShortName}</td>
					<td style="width: 10%;" align="center">${fltSLObj.flightNumber}</td>
					<td style="width: 15%;" align="center">${localDateTimeFormat.format(fltSLObj.departureDate)}</td>
					<td style="width: 15%;" align="center">${localDateTimeFormat.format(fltSLObj.arrivalDate)}</td>
					<td style="width: 15%;" align="center">${fltSLObj.originCity}</td>
					<td style="width: 15%;" align="center">${fltSLObj.destinationCity}</td>
					<td style="width: 5%;" align="center">${fltSLObj.noOfHalt}</td>
					<td style="width: 15%;" align="center">${fltSLObj.cabinClassName}</td>
				</tr>
				<tr>
					<th style="width: 20%;" align="center">Adults | Children | Infant</th>
					<th style="width: 20%;" align="center" colspan="2">Remarks</th>
					<th style="width: 15%;" align="center">Supplier</th>
					<th style="width: 15%;" align="center" >Status</th>
					<th style="width: 10%;" align="center" >Cost</th>
					<th style="width: 10%;" align="center">Markup </th>
					<th style="width: 10%;" align="center">Display Order</th>
				
				</tr>
				<tr>
					<td style="width: 20%;" align="center">${fltSLObj.adults} | ${fltSLObj.children} | ${fltSLObj.infants}</td>
					<td style="width: 20%;font-size:15px;" align="center" colspan="2">${fltSLObj.remarks}</td>
					<td style="width: 15%;" align="center">${fltSLObj.supplierName}</td>
					<td style="width: 15%;" align="center" >${fltSLObj.statusName}</td>
					<td style="width: 10%;" >${fltSLObj.serviceLineCost}</td>
					<td style="width: 20%;" align="center">${fltSLObj.markup}</td>
					<td style="width: 20%;" align="center">${fltSLObj.displayOrder}</td>
															
				</tr>
				<tr>
				<th colspan="7">&nbsp;</th>
				<th> Action </th>
				</tr>
				<tr>
				<td colspan="7">&nbsp;</td>
						<td style="width: 15%;" align="center">
						<table style="border: none;border-collapse:collapse;margin: 0px auto;" >	
						<tr><td>
							<form:form id="form_update_FLT_SL" name="form_update_FLT_SL" action="view_update_workload_form_FLT?fltServiceId=${fltSLObj.fltServiceId}" method="POST" style="display:inline;">
								<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
								<input type="submit" name="Edit" Value="Edit" style="background-color: blue; padding: 6px 12px;" />
							</form:form>
							</td><td>
								<form:form id="form_del_FLT_SL" name="form_del_FLT_SL" action="view_delete_flt_sl_confirmation?fltServiceId=${fltSLObj.fltServiceId}" method="POST" style="display:inline;">		
										<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
										<input type="submit" name="Delete" Value="Delete" style="background-color: red; padding: 6px 12px;" />
								</form:form>
						</td></tr>
						</table>
					</td>
				</tr>
				</table>
				<p>&nbsp;</p>	
	</c:otherwise>
	</c:choose>
				</c:forEach>
			</c:if>
		

		<!-- Following set of code will get executed only user have clicked on the Add flight button.  -->
			<c:if test="${FLT_SL_ACTION eq 'ADD'}">
			<form:form name="formaddwl" modelAttribute="FLT_SL_OBJ" action="create_workload_FLT_SL" >
			<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
			<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
			
			<table style="border: 3px solid black;width:85%;text-align:right;" id="newflight" >
				<tr>
					
					<th style="background-color: #CA1551; width: 10%;" align="center">Air Line</th>
					<th style="background-color: #CA1551;width: 10%;" align="center">Flight No.</th>
					<th style="background-color: #CA1551;width: 15%;" align="center">Depart Date</th>
					<th style="background-color: #CA1551;width: 15%;" align="center">Arrival Date</th>
					<th style="background-color: #CA1551;width: 15%;" align="center">Departure</th>
					<th style="background-color: #CA1551;width: 15%;" align="center">Arrival</th>
					<th style="background-color: #CA1551;width: 5%;" align="center">Halt</th>
					<th style="background-color: #CA1551;width: 15%;" align="center">Cabin</th>
				</tr>
				<tr>
								<td style="width: 10%;" align="center">
								 <div class="select">
								 	<form:select path="airlineId" style="width: 200px;" required="required">  
										<option class="service-small" value="" selected>Please Select</option>
										<form:options items = "${AIRLINES_MAP}" class="service-small"/>
									</form:select>  
									 </div>
									</td>
									<td style="width: 10%;" align="center">
										<form:input path="flightNumber" style="width: 130px;height:40px;border: 1px solid ;" id="flightNumber"  required="required" minlength="3" />
									</td>
									<td style="width: 15%;" align="center">
										<input style="width: 130px;height:40px;border: 1px solid ;" id="departureDate" name="departureDate" value="${localDateTimeFormatToEdit.format(FLT_SL_OBJ.departureDate)}"  required/>
									</td>
									<td style="width: 15%;" align="center">
										<input style="width: 130px;height:40px;border: 1px solid ;" id="arrivalDate" name="arrivalDate" value="${localDateTimeFormatToEdit.format(FLT_SL_OBJ.arrivalDate)}"  required/>
									</td>
									<td style="width: 15%;" align="center">
										<form:input path="originCity" style="width: 130px;height:40px;border: 1px solid ;" type="text" id="originCity"  />
										<form:hidden path = "departingFrom" id="departingFrom" />
										<b><font color="red"><form:errors path="originCity" cssClass="error" /></font></b>
									</td>
									<td style="width: 15%;" align="center">
										<form:input path="destinationCity" style="width: 130px;height:40px;border: 1px solid ;" type="text" id="destinationCity"  />
										<form:hidden path = "arrivingTo" id="arrivingTo" />
										<b><font color="red"><form:errors path="destinationCity" cssClass="error" /></font></b>
									</td>
									<td style="width: 5%;" align="center">
										 <div class="select">
										 <form:select path="noOfHalt" style="width: 150px;" required="required">  
											<form:options items = "${NO_OF_HALTS}" class="service-small"/>
										</form:select>  
										</div>
									</td>
							<td style="width: 15%;" align="center">
								<div class="select">
									<form:select path="cabinClass" style="width: 150px;" required="required">  
										<form:options items = "${FLT_TKT_TYPE_LIST}" class="service-small"/>
									</form:select>  
								</div>
							</td>
							</tr>

					<tr>
						<th style="background-color: #CA1551;width: 20%;" align="center">Adults | Children | Infant</th>
						<th style="background-color: #CA1551;width: 20%;" align="center" colspan="2">Remarks</th>
						<th style="background-color: #CA1551;width: 15%;" align="center">Supplier</th>
						<th style="background-color: #CA1551;width: 15%;" align="center" >Status</th>
						<th style="background-color: #CA1551;width: 10%;" align="center">Cost</th>
						<th style="background-color: #CA1551;width: 10%;" align="center">Mark Up</th>
						<th style="background-color: #CA1551;width: 10%;" align="center">Display Order</th>
					</tr>
					<tr>
						<td style="width: 20%;" align="center">
							<form:input path="adults"  style="width: 50px;height:40px;border: 1px solid ;" type="number" min="0" step="1" /> | 
							<form:input path="children"  style="width: 50px;height:40px;border: 1px solid ;" type="number" min="0" step="1" /> | 
							<form:input path="infants"  style="width: 50px;height:40px;border: 1px solid ;" type="number" min="0" step="1" />
							<b><font color="red"><form:errors path="adults" cssClass="error" /></font></b> 
						</td>
						<td style="width: 20%;" align="center" colspan="2">
							<form:textarea path = "remarks" rows = "4" cols = "15" style="width: 300px; height: 100px;border: 2px solid green; border-radius: 4px;" htmlEscape="false" /> 
						</td>
						<td style="width: 15%;" align="center">
							 <div class="select">
								<form:select path="supplierId" style="width: 230px;" required="required">  
									<form:options items = "${FLT_SUPPLIER_MAP}" class="service-small"/>
								</form:select>  
							 </div>
						</td>
						<td style="width: 15%;" align="center">
							<div class="select">
								<form:select path="status" style="width: 230px;" required="required">  
									<form:options items = "${FLT_SL_STATUS_MAP}" class="service-small"/>
								</form:select>
							 </div>
							</td>
						<td style="width: 10%;" align="center" >
						 	<form:input path="serviceLineCost"  style="width: 150px;height:40px;border: 1px solid ;" type="number" min="0" step="1" />
						</td>
						
						<td style="width: 10%;" align="center">
							 <form:input path="markup"  style="width: 150px;height:40px;border: 1px solid ;" type="number" min="0" step="1" />
							
						</td>
						<td style="width:10%;" align="center">
							 <form:input path="displayOrder"  style="width: 50px;height:40px;border: 1px solid ;" type="number" min="0" step="1" />
							
						</td>
						
						</tr>
						<tr>
							<th style="background-color: #CA1551;" colspan="7">&nbsp;</th>
							<th style="background-color: #CA1551;"> Action </th>
						</tr>
						<tr>
							<td colspan="7">&nbsp;</td>
							<td style="width: 15%;" align="center">
					
							<table style="border: none;border-collapse:collapse;margin: 0px auto;" >
							<tr>
							
								<td>
									<input style="width: 100px;" type="submit" value="Add" />
									</form:form>
								</td>
								
							
								<td>
									<form:form name="formaddwl" modelAttribute="FLT_SL_OBJ" action="view_workload_FLT" style="display:inline;" >
										<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
										<input style="width: 100px;background-color: blue;" type="submit" value="Cancel" />
									</form:form>
								</td>
							
							</tr>
							
							</table>
							</td>
					</tr>
				</table>	
				
				</c:if>
			
				
		

	<form:form modelAttribute="FLT_SL_OBJ" action="view_create_workload_form_FLT">
		<div align="right">
			<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
			<c:if test="${FLT_SL_ACTION eq 'VIEW'}">
				<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
				<input type="submit" value="Add Flight" />
			</c:if>
		</div>
	</form:form>



</body>
<script>
$(document).ready(function () {
    // Handler for .ready() called.
    var ut = document.getElementById('updateflight'); 
    var nt = document.getElementById('newflight');
    if (ut != null) { 
    	$('html, body').animate({
            scrollTop: $('#updateflight').offset().top
        }, 'slow');
    }
    else if (nt != null) {
        $('html, body').animate({
            scrollTop: $('#newflight').offset().top
        }, 'slow');
    	
    }
    
});

$('#originCity').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getAirportList',
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
            	return { value: item.cityName, data: item.airportId };
            })
            
        };
    }
});

$('#destinationCity').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getAirportList',
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
            	return { value: item.cityName, data: item.airportId };
            })
            
        };
    }
});

$(document).ready(function(){
	$("#addFlight").on('click', function () {
	   var getValue=$("#departureDate").val();
	   $('input[name=departureDate]').val(getValue);
	 });

	 
	});
	$("#departureDate").datetimepicker();
	$("#arrivalDate").datetimepicker();


</script>

</html>

