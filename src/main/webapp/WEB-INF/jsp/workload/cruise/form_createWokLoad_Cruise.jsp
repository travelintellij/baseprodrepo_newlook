<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script
	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.jquery-ui.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<head>
<title>UdanChoo Team Workload Section</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="${pageContext.request.contextPath}/resources/css/tooplate_style.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/coda-slider.css"	type="text/css" charset="utf-8" />

<link href="<c:url value="/resources/css/jquery.datetimepicker.min.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery.datetimepicker.full.js" />"></script>


</head>

<style>
/*
body {
  background-image: url('${pageContext.request.contextPath}/resources/images/transfer.png');
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
	background: #26220e;
	height: 40px;
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
input[type=text],input[type=number],input[type=date]{
font-size: 15pt;
}
</style>
<jsp:include page="../_Workload_Menu.jsp" />


<br>
<h2 align="center">Cruise WorkLoad Details</h2>
<hr>
<body style="background-color: white;">
	<div align="center">
		<b><font color="green"> ${Success} </font><font color="red">${Error}</font> </b>
	</div>
		<c:if test="${not empty CRS_SL_LIST}">
			<c:forEach var="crsSLObj" items="${CRS_SL_LIST}">
				<c:choose>
					<c:when test="${crsSLObj.crsServiceId eq CRS_SL_OBJ.crsServiceId  && CRS_SL_ACTION eq 'UPDATE' }">
							<form:form name="formaddwl" modelAttribute="CRS_SL_OBJ" action="edit_edit_workload_CRS_SL">
								<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
								<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
								<form:hidden path="crsServiceId"/>
								<table id="updatetransfer" style="border: 3px solid black;width:85%;">
									<tr>
										<th style="width: 10%;background-color: #CA1551;" align="center">City</th>
										<th style="width: 15%;background-color: #CA1551;" align="center">Cruise Name</th>
										<th style="width: 15%;background-color: #CA1551;" align="center">State Room Type</th>
										<th style="width: 10%;background-color: #CA1551;" align="center">Cruise Start Date</th>
										<th style="width: 10%;background-color: #CA1551;" align="center">Cruise End Date</th>
										<th style="width: 15%;background-color: #CA1551;" align="center">Cruise Provider</th>
										<th style="width: 15%;background-color: #CA1551;" align="center">Guest Details</th>
										<th style="width: 10%;background-color: #CA1551;" align="center">Childrem Age Info</th>
									</tr>

									<tr>
										<td style="width: 10%;" "align="center">
											<form:input path="cityName" style="width: 150px; height:40px; border: 1px solid ;" required="required" placeholder="City Name" />
											<b><font color="red"><form:errors path="cityName" cssClass="error" /></font></b>
											<form:hidden path="cityId"/>
										</td>
										<td style="width: 15%;" align="center">
											<form:input path="cruiseName" style="width: 250px; height:40px; border: 1px solid ;" required="required" placeholder="Cruise Name" />
										</td>
										<td style="width: 15%;" align="center">
											<div class="select">
												<form:select path="stateRoomType" style="width: 130px;height:30px;border: 1px solid ;" required="required">  
													<form:options items = "${CRS_STATE_ROOM_TYPE_MAP}" class="service-small"/>
												</form:select>  
											</div>
										</td>
										<td style="width: 10%;" align="center">
											<form:input path="cruiseStartDate" style="height: 40px; width: 150px;" required="required" type="date" />
											<b><font color="red"><form:errors path="cruiseStartDate" cssClass="error" /></font></b>
										</td>
										<td style="width: 10%;" align="center">
											<form:input path="cruiseEndDate" style="height: 40px; width: 150px;" required="required" type="date" />
										</td>
										<td style="width: 15%;" align="center">
											<div class="select">
												<form:select path="cruiseProvider" style="width: 130px;height:30px;border: 1px solid ;" required="required">  
													<form:options items = "${CRS_CRUISE_PROVIDER_MAP}" class="service-small"/>
												</form:select>  
											</div>
										</td>
										<td style="width: 15%;" align="center">
											<table>
											<tr><th style="background-color: #CA1551;">Adults</th><th style="background-color: #CA1551;">Children</th><th style="background-color: #CA1551;">Infants</th></tr>
											<tr>
												<td>
													<form:input path="adults" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" /> 
													<b><font color="red"><form:errors path="adults" cssClass="error" /></font></b>	
												</td>
												<td>
													<form:input path="children" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" /> 
												</td>
												<td>
													<form:input path="infants" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" />
												</td>
											</tr>
											</table>
										</td>
										<td style="width: 15%;" align="center">
											<form:input path="childrenAgeInfo" style="width:150px;height:40px; border: 1px solid ;"  />
										</td>
									</tr>
									<tr>
										<th style="width: 15%; background-color: #CA1551;" align="center">No Of Decks</th>
										<th style="width: 25%; background-color: #CA1551;" align="center" colspan="2">Remarks</th>
										<th style="width: 15%; background-color: #CA1551;" align="center">Supplier</th>
										<th style="width: 15%; background-color: #CA1551;" align="center">Status</th>
										<th style="width: 10%; background-color: #CA1551;" align="center">Cost</th>
										<th style="width: 10%; background-color: #CA1551;" align="center">Markup</th>
										<th style="width: 10%; background-color: #CA1551;" align="center">Display Order</th>
									</tr>
									<tr>
										<td style="width: 15%;" align="center">
											<form:input path="noOfDecks" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" />
										</td>
										<td style="width: 25%;" align="center" colspan="2">
											<form:textarea path = "remarks" rows = "4" cols = "15" style="width: 300px; height: 100px;border: 2px solid green; border-radius: 4px;" htmlEscape="false" />
										</td>
										<td style="width: 15%;" align="center">
											<div class="select">
												<form:select path="supplierId" style="width: 150px;height:30px;border: 1px solid ;" required="required">  
													<option class="service-small" value="0">------Please Select------</option>
													<form:options items = "${CRS_SUPPLIER_MAP}" class="service-small"/>
												</form:select>  
											</div>
										</td>
										<td style="width: 15%;" align="center">
											<div class="select">
												<form:select path="status" style="width: 180px;height:30px;border: 1px solid ;" required="required">  
													<form:options items = "${CRS_SL_STATUS_MAP}" class="service-small"/>
												</form:select>  
											</div>
										</td>
										<td style="width: 10%;">
											<form:input path="serviceLineCost" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
										</td>
										<td style="width: 10%;">
											<form:input path="markup" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
										</td>
										<td style="width: 10%;">
											<form:input path="displayOrder" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
										</td>
										</tr>
										<tr>
										<td colspan="6">&nbsp;</td>
										<td style="width: 100px;" align="center" colspan="2">
												<input style="width: 100px; background-color: green" id="Update" type="submit" value="Update" /> |  
												<a href="view_workload_CRS?dealConfirmationId=${dealConfirmationId}" ><input type="button" style="width: 100px;background-color: blue;" value="Cancel"></a>
										</td>
									</tr>
								</table>
								</form:form>
					</c:when>

					<c:otherwise>
						<table style="border: 3px solid black;width:85%; table-layout: fixed;" id="viewtransfer">
							<tr>
								<th style="width: 10%;background-color: #5f1ba7;" align="center">City</th>
								<th style="width: 15%;background-color: #5f1ba7;" align="center">Cruise Name</th>
								<th style="width: 15%;background-color: #5f1ba7;" align="center">State Room Type</th>
								<th style="width: 10%;background-color: #5f1ba7;" align="center">Cruise Start Date</th>
								<th style="width: 10%;background-color: #5f1ba7;" align="center">Cruise End Date</th>
								<th style="width: 15%;background-color: #5f1ba7;" align="center">Cruise Provider</th>
								<th style="width: 15%;background-color: #5f1ba7;" align="center">Guest Details</th>
								<th style="width: 10%;background-color: #5f1ba7;" align="center">Childrem Age Info</th>
							</tr>

							<tr>
								<td style="width: 10%;" "align="center">${crsSLObj.cityName}</td>
								<td style="width: 15%;" align="center">${crsSLObj.cruiseName}</td>
								<td style="width: 15%;" align="center">${crsSLObj.stateRoomTypeName}</td>
								<td style="width: 10%;" align="center"><fmt:formatDate value="${crsSLObj.cruiseStartDate}" pattern="dd-MM-yyyy" /></td>
								<td style="width: 10%;" align="center"><fmt:formatDate value="${crsSLObj.cruiseEndDate}" pattern="dd-MM-yyyy" /></td>
								<td style="width: 15%;" align="center">${crsSLObj.cruiseProviderName}</td>
								<td style="width: 15%;" align="center">${crsSLObj.adults} Adults ${crsSLObj.children} Children <br> ${crsSLObj.infants} Infants</td>
								<td style="width: 15%;" align="center">${crsSLObj.childrenAgeInfo} </td>
							</tr>
							<tr>
								<th style="width: 15%; background-color: #5f1ba7;" align="center">No Of Decks</th>
								<th style="width: 25%; background-color: #5f1ba7;" align="center" colspan="2">Remarks</th>
								<th style="width: 15%; background-color: #5f1ba7;" align="center">Supplier</th>
								<th style="width: 15%; background-color: #5f1ba7;" align="center">Status</th>
								<th style="width: 10%; background-color: #5f1ba7;" align="center">Cost</th>
								<th style="width: 10%; background-color: #5f1ba7;" align="center">Markup</th>
								<th style="width: 10%; background-color: #5f1ba7;" align="center">Display Order</th>
							</tr>
							<tr>
								<td style="width: 15%;" align="center">${crsSLObj.noOfDecks}</td>
								<td style="width: 25%;" align="center" colspan="2">${crsSLObj.remarks}</td>
								<td style="width: 15%;" align="center">${crsSLObj.supplierName}</td>
								<td style="width: 15%;" align="center">${crsSLObj.statusName}</td>
								<td style="width: 10%;">${crsSLObj.serviceLineCost}</td>
								<td style="width: 10%;">${crsSLObj.markup}</td>
								<td style="width: 10%;">${crsSLObj.displayOrder}</td>
								</tr>
								<tr>
								<td colspan="7">&nbsp;</td>
								<td style="width: 100px;" align="center">
									<form:form id="form_update_CRS_SL" modelAttribute="CRS_SL_OBJ" name="form_update_CRS_SL" action="view_update_workload_form_CRS" method="POST" style="display:inline;">
										<input type="hidden" name="crsServiceId" value="${crsSLObj.crsServiceId}" />
										<input type="hidden" name="cityId" value="${crsSLObj.cityId}" />
										<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
										<input type="submit" name="Edit" Value="Edit" style="background-color: blue; padding: 6px 12px;" />
									</form:form> | 
									<form:form modelAttribute="CRS_SL_OBJ" action="view_delete_crs_sl_confirmation" style="display:inline;">
										<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
										<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
										<input type="hidden" name="crsServiceId" value="${crsSLObj.crsServiceId}" />
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

		<!-- Following set of code will get executed only user have clicked on the Add Hotel button.  -->
		<c:if test="${CRS_SL_ACTION eq 'ADD'}">
			<form:form name="formaddwl" modelAttribute="CRS_SL_OBJ" action="create_workload_CRS_SL">
				<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
				<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
				<table id="updatetransfer" style="border: 3px solid black;width:85%;">
					<tr>
						<th style="width: 10%;background-color: #CA1551;" align="center">City</th>
						<th style="width: 15%;background-color: #CA1551;" align="center">Cruise Name</th>
						<th style="width: 15%;background-color: #CA1551;" align="center">State Room Type</th>
						<th style="width: 10%;background-color: #CA1551;" align="center">Cruise Start Date</th>
						<th style="width: 10%;background-color: #CA1551;" align="center">Cruise End Date</th>
						<th style="width: 15%;background-color: #CA1551;" align="center">Cruise Provider</th>
						<th style="width: 15%;background-color: #CA1551;" align="center">Guest Details</th>
						<th style="width: 10%;background-color: #CA1551;" align="center">Childrem Age Info</th>
					</tr>

					<tr>
						<td style="width: 10%;" "align="center">
							<form:input path="cityName" style="width: 150px; height:40px; border: 1px solid ;" required="required" placeholder="City Name" />
							<b><font color="red"><form:errors path="cityName" cssClass="error" /></font></b>
							<form:hidden path="cityId"/>
						</td>
						<td style="width: 15%;" align="center">
							<form:input path="cruiseName" style="width: 250px; height:40px; border: 1px solid ;" required="required" placeholder="Cruise Name" />
						</td>
						<td style="width: 15%;" align="center">
							<div class="select">
								<form:select path="stateRoomType" style="width: 130px;height:30px;border: 1px solid ;" required="required">  
									<form:options items = "${CRS_STATE_ROOM_TYPE_MAP}" class="service-small"/>
								</form:select>  
							</div>
						</td>
						<td style="width: 10%;" align="center">
							<form:input path="cruiseStartDate" style="height: 40px; width: 150px;" required="required" type="date" />
							<b><font color="red"><form:errors path="cruiseStartDate" cssClass="error" /></font></b>
						</td>
						<td style="width: 10%;" align="center">
							<form:input path="cruiseEndDate" style="height: 40px; width: 150px;" required="required" type="date" />
						</td>
						<td style="width: 15%;" align="center">
							<div class="select">
								<form:select path="cruiseProvider" style="width: 130px;height:30px;border: 1px solid ;" required="required">  
									<form:options items = "${CRS_CRUISE_PROVIDER_MAP}" class="service-small"/>
								</form:select>  
							</div>
						</td>
						<td style="width: 15%;" align="center">
							<table>
							<tr><th style="background-color: #CA1551;">Adults</th><th style="background-color: #CA1551;">Children</th><th style="background-color: #CA1551;">Infants</th></tr>
							<tr>
								<td>
									<form:input path="adults" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" /> 
									<b><font color="red"><form:errors path="adults" cssClass="error" /></font></b>	
								</td>
								<td>
									<form:input path="children" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" /> 
								</td>
								<td>
									<form:input path="infants" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" />
								</td>
							</tr>
							</table>
						</td>
						<td style="width: 15%;" align="center">
							<form:input path="childrenAgeInfo" style="width:150px;height:40px; border: 1px solid ;" />
						</td>
					</tr>
					<tr>
						<th style="width: 15%; background-color: #CA1551;" align="center">No Of Decks</th>
						<th style="width: 25%; background-color: #CA1551;" align="center" colspan="2">Remarks</th>
						<th style="width: 15%; background-color: #CA1551;" align="center">Supplier</th>
						<th style="width: 15%; background-color: #CA1551;" align="center">Status</th>
						<th style="width: 10%; background-color: #CA1551;" align="center">Cost</th>
						<th style="width: 10%; background-color: #CA1551;" align="center">Markup</th>
						<th style="width: 10%; background-color: #CA1551;" align="center">Display Order</th>
					</tr>
					<tr>
						<td style="width: 15%;" align="center">
							<form:input path="noOfDecks" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" />
						</td>
						<td style="width: 25%;" align="center" colspan="2">
							<form:textarea path = "remarks" rows = "4" cols = "15" style="width: 300px; height: 100px;border: 2px solid green; border-radius: 4px;" htmlEscape="false" />
						</td>
						<td style="width: 15%;" align="center">
							<div class="select">
								<form:select path="supplierId" style="width: 150px;height:30px;border: 1px solid ;" required="required">  
									<option class="service-small" value="0">------Please Select------</option>
									<form:options items = "${CRS_SUPPLIER_MAP}" class="service-small"/>
								</form:select>  
							</div>
						</td>
						<td style="width: 15%;" align="center">
							<div class="select">
								<form:select path="status" style="width: 180px;height:30px;border: 1px solid ;" required="required">  
									<form:options items = "${CRS_SL_STATUS_MAP}" class="service-small"/>
								</form:select>  
							</div>
						</td>
						<td style="width: 10%;">
							<form:input path="serviceLineCost" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
						</td>
						<td style="width: 10%;">
							<form:input path="markup" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
						</td>
						<td style="width: 10%;">
							<form:input path="displayOrder" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
						</td>
						</tr>
						<tr>
						<td colspan="6">&nbsp;</td>
						<td style="width: 100px;" align="center" colspan="2">
								<input style="width: 100px; background-color: green" id="Update" type="submit" value="Add Cruise" /> |  
								<a href="view_workload_CRS?dealConfirmationId=${dealConfirmationId}" ><input type="button" style="width: 100px;background-color: blue;" value="Cancel"></a>
						</td>
					</tr>
				</table>
				</form:form>
		</c:if>

		<form:form modelAttribute="CRS_SL_OBJ" action="view_create_workload_form_CRS">
			<div align="right">
				<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
				<c:if test="${CRS_SL_ACTION eq 'VIEW'}">
					<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
					<input type="submit" value="Add Cruise" />
				</c:if>
			</div>
		</form:form>
</body>


<script>
	$(document).ready(function() {
		// Handler for .ready() called.
		var ut = document.getElementById('updatetransfer');
		var nt = document.getElementById('addtransfer');
		if (ut != null) {
			$('html, body').animate({
				scrollTop : $('#updatetransfer').offset().top
			}, 'slow');
		} else if (nt != null) {
			$('html, body').animate({
				scrollTop : $('#addtransfer').offset().top
			}, 'slow');

		}

	});
	$('#cityName').autocomplete({
		serviceUrl : '${pageContext.request.contextPath}/getCityList',
		paramName : "cityName",
		delimiter : ",",
		onSelect : function(suggestion) {
			cityID = suggestion.data;
			id = cityID;
			jQuery("#cityId").val(cityID);
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

	$('#dropCityName').autocomplete({
		serviceUrl : '${pageContext.request.contextPath}/getCityList',
		paramName : "cityName",
		delimiter : ",",
		onSelect : function(suggestion) {
			cityID = suggestion.data;
			id = cityID;
			jQuery("#dropCityId").val(cityID);
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
	
	$(document).ready(function(){
		$("#Add").on('click', function () {
		   var getValue=$("#transferDate").val();
		   //$("#taskDueDate").val(getValue);
		   $('input[name=transferDate]').val(getValue);
		 });
		});
		
	$(document).ready(function(){
		$("#Update").on('click', function () {
		   var getValue=$("#transferDate").val();
		   //$("#taskDueDate").val(getValue);
		   $('input[name=transferDate]').val(getValue);
		 });
		});

	
	
	
	
</script>

</html>

