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
<h2 align="center">Transfer WorkLoad Details</h2>
<hr>
<body style="background-color: white;">
	<div align="center">
		<b><font color="green"> ${Success} </font><font color="red">${Error}</font> </b>
	</div>
		<c:if test="${not empty TRN_SL_LIST}">
			<c:forEach var="trnSLObj" items="${TRN_SL_LIST}">
				<c:choose>
					<c:when test="${trnSLObj.trnServiceId eq TRN_SL_OBJ.trnServiceId  && TRN_SL_ACTION eq 'UPDATE' }">
							<form:form name="formaddwl" modelAttribute="TRN_SL_OBJ" action="edit_edit_workload_TRN_SL">
								<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
								<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
								<form:hidden path="trnServiceId"/>
								<table id="updatetransfer" style="border: 3px solid black;width:85%;">
									<tr>
										<th style="width: 10%;background-color: #CA1551;" align="center">Pickup City</th>
										<th style="width: 10%;background-color: #CA1551;" align="center">PickUp From</th>
										<th style="width: 20%;background-color: #CA1551;" align="center">PickUp From Name</th>
										<th style="width: 10%;background-color: #CA1551;" align="center">Transfer Date</th>
										<th style="width: 10%;background-color: #CA1551;" align="center">Drop City</th>
										<th style="width: 10%;background-color: #CA1551;" align="center">Drop To</th>
										<th style="width: 20%;background-color: #CA1551;" align="center">Drop To Name</th>
										<th style="width: 10%; background-color: #CA1551;" align="center">Transfer Type</th>
									</tr>

									<tr>
										<td style="width: 10%;" "align="center">
											<form:input path="pickupCityName" style="width: 150px; height:40px; border: 1px solid ;" required="required" placeholder="City Name" />
											<b><font color="red"><form:errors path="pickupCityName" cssClass="error" /></font></b>
											<form:hidden path="pickupCityId"/>
										</td>
										<td style="width: 10%;" align="center">
											<div class="select">
												<form:select path="pickUpFrom" style="width: 130px;height:30px;border: 1px solid ;" required="required">  
													<form:options items = "${TRANSFER_POINT_MAP}" class="service-small"/>
												</form:select>  
											</div>
										</td>
										<td style="width: 20%;" align="center">
											<form:input path="pickUpFromName" style="width: 250px; height:40px; border: 1px solid ;" required="required" placeholder="Pickup Name" />
										</td>
										<td style="width: 10%;" align="center">
											<form:input path="transferDate" style="height: 40px; width: 150px;" required="required" type="date" />
										</td>
										<td style="width: 10%;" align="center">
											<form:input path="dropCityName" style="width: 150px; height:40px; border: 1px solid ;" required="required" placeholder="City Name" />
											<b><font color="red"><form:errors path="dropCityName" cssClass="error" /></font></b>
											<form:hidden path="dropCityId"/>
										</td>
										<td style="width: 10%;" align="center">
											<div class="select">
												<form:select path="dropTo" style="width: 130px;height:30px;border: 1px solid ;" required="required">  
													<form:options items = "${TRANSFER_POINT_MAP}" class="service-small"/>
												</form:select>  
											</div>
										</td>
										<td style="width: 20%;" align="center">
											<form:input path="dropToName" style="width: 250px; height:40px; border: 1px solid ;" required="required" placeholder="Drop Name" />
										</td>
										<td style="width: 10%;" align="center">
											<div class="select">
												<form:select path="transferType" style="width: 120px;height:30px;border: 1px solid ;" required="required">  
													<form:options items = "${TRANSFER_TYPE_MAP}" class="service-small"/>
												</form:select>  
											</div>
										</td>										
										
									</tr>
									<tr>
										<th style="width: 20%; background-color: #CA1551;" align="center">Guest Details</th>
										<th style="width: 20%; background-color: #CA1551;" align="center" colspan="2">Remarks</th>
										<th style="width: 15%; background-color: #CA1551;" align="center">Supplier</th>
										<th style="width: 15%; background-color: #CA1551;" align="center">Status</th>
										<th style="width: 10%; background-color: #CA1551;" align="center">Cost</th>
										<th style="width: 10%; background-color: #CA1551;" align="center">Markup</th>
										<th style="width: 10%; background-color: #CA1551;" align="center">Display Order</th>
									</tr>
									<tr>
										<td style="width: 20%;" align="center">
											<table>
												<tr>
													<th style="background-color: #CA1551;">Adults</th>
													<th style="background-color: #CA1551;">Children</th>
													<th style="background-color: #CA1551;">Infants</th>
												</tr>
												<tr>
													<td>
														<form:input path="adults" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" /> 
														<b><font color="red"><form:errors path="adults" cssClass="error" /></font></b>	
													<td>
														<form:input path="children" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" />
													</td>
													<td>
														<form:input path="infants" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" />
													</td>
												</tr>
											</table>
										</td>
										<td style="width: 20%;" align="center" colspan="2">
											<form:textarea path = "remarks" rows = "4" cols = "15" style="width: 300px; height: 100px;border: 2px solid green; border-radius: 4px;" htmlEscape="false" />
										</td>
										<td style="width: 15%;" align="center">
											<div class="select">
												<form:select path="supplierId" style="width: 150px;height:30px;border: 1px solid ;" required="required">  
													<option class="service-small" value="0">------Please Select------</option>
													<form:options items = "${TRN_SUPPLIER_MAP}" class="service-small"/>
												</form:select>  
											</div>
										</td>
										<td style="width: 15%;">
											<div class="select">
												<form:select path="status" style="width: 120px;height:30px;border: 1px solid ;" required="required">  
													<form:options items = "${TRN_SL_STATUS_MAP}" class="service-small"/>
												</form:select>  
											</div>
										</td>
										<td style="width: 10%;">
											<form:input path="serviceLineCost" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
										</td>
										<td width="10%;"  align="center">
											<form:input path="markup" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
										</td>
										<td width="10%;"  align="center">
											<form:input path="displayOrder" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
										</td>
										</tr>
										<tr>
											<th style="background-color: #CA1551;" colspan="7">&nbsp;</th>
											<th style="width: 30%; background-color: #CA1551;" align="center">Action</th>
										</tr>
										<tr>
											<td colspan="6">&nbsp;</td>
											<td style="width: 30%;" align="center" colspan="2">
												<input style="width: 100px; background-color: green" id="Update" type="submit" value="Update" /> |  
												<a href="view_workload_TRN?dealConfirmationId=${dealConfirmationId}" ><input type="button" style="width: 100px;background-color: blue;" value="Cancel"></a>
										</td>
									</tr>
								</table>
								</form:form>
					</c:when>

					<c:otherwise>
						<table style="border: 3px solid black;width:85%; table-layout: fixed;" id="viewtransfer">
							<tr>
								<th style="width: 10%;background-color: #5f1ba7;" align="center">Pickup City</th>
								<th style="width: 10%;background-color: #5f1ba7;" align="center">PickUp From</th>
								<th style="width: 20%;background-color: #5f1ba7;" align="center">PickUp From Name</th>
								<th style="width: 10%;background-color: #5f1ba7;" align="center">Transfer Date</th>
								<th style="width: 10%;background-color: #5f1ba7;" align="center">Drop City</th>
								<th style="width: 10%;background-color: #5f1ba7;" align="center">Drop To</th>
								<th style="width: 20%;background-color: #5f1ba7;" align="center">Drop To Name</th>
								<th style="width: 10%; background-color: #5f1ba7;" align="center">Transfer Type</th>
							</tr>

							<tr>
								<td style="width: 10%;" "align="center">${trnSLObj.pickupCityName}</td>
								<td style="width: 10%;" align="center">${trnSLObj.pickupTransferPointName}</td>
								<td style="width: 20%;" align="center">${trnSLObj.pickUpFromName}</td>
								<td style="width: 10%;" align="center"><fmt:formatDate value="${trnSLObj.transferDate}" pattern="dd-MM-yyyy" /></td>
								<td style="width: 10%;" align="center">${trnSLObj.dropCityName}</td>
								<td style="width: 10%;" align="center">${trnSLObj.dropTransferPointName}</td>
								<td style="width: 20%;" align="center">${trnSLObj.dropToName}</td>
								<td style="width: 10%;" align="center">${trnSLObj.transferTypeName}</td>
								
							</tr>
							<tr>
								<th style="width: 15%; background-color: #5f1ba7;" align="center">Guest Details</th>
								<th style="width: 25%; background-color: #5f1ba7;" align="center" colspan="2">Remarks</th>
								<th style="width: 15%; background-color: #5f1ba7;" align="center">Supplier</th>
								<th style="width: 15%; background-color: #5f1ba7;" align="center">Status</th>
								<th style="width: 10%; background-color: #5f1ba7;" align="center">Cost</th>
								<th style="width: 10%; background-color: #5f1ba7;" align="center">Markup</th>
								<th style="width: 10%; background-color: #5f1ba7;" align="center">Display Order</th>
							</tr>
							<tr>


								<td style="width: 15%;" align="center">${trnSLObj.adults} Adults ${trnSLObj.children} Children <br> ${trnSLObj.infants} Infants</td>
								<td style="width: 25%;" align="center" colspan="2">${trnSLObj.remarks}</td>
								<td style="width: 15%;" align="center">${trnSLObj.supplierName}</td>
								<td style="width: 15%;" align="center">${trnSLObj.statusName}</td>
								<td style="width: 10%;">${trnSLObj.serviceLineCost}</td>
								<td style="width: 10%;">${trnSLObj.markup}</td>
								<td style="width: 10%;">${trnSLObj.displayOrder}</td>
								</tr>
								<tr>
								<td colspan="7">&nbsp;</td>
								<td style="width: 100px;" align="center">
									<form:form id="form_update_STS_SL" modelAttribute="TRN_SL_OBJ" name="form_update_TRN_SL" action="view_update_workload_form_TRN" method="POST" style="display:inline;">
										<input type="hidden" name="trnServiceId" value="${trnSLObj.trnServiceId}" />
										<input type="hidden" name="pickupCityId" value="${trnSLObj.pickupCityId}" />
										<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
										<input type="submit" name="Edit" Value="Edit" style="background-color: blue; padding: 6px 12px;" />
									</form:form> | 
									<form:form modelAttribute="TRN_SL_OBJ" action="view_delete_trn_sl_confirmation" style="display:inline;">
										<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
										<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
										<input type="hidden" name="trnServiceId" value="${trnSLObj.trnServiceId}" />
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
		<c:if test="${TRN_SL_ACTION eq 'ADD'}">
			<form:form name="formaddwl" modelAttribute="TRN_SL_OBJ" action="create_workload_TRN_SL">
				<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
				<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
				<table id="updatetransfer" style="border: 3px solid black;width:85%;">
					<tr>
						<th style="width: 10%;background-color: #CA1551;" align="center">Pickup City</th>
						<th style="width: 10%;background-color: #CA1551;" align="center">PickUp From</th>
						<th style="width: 20%;background-color: #CA1551;" align="center">PickUp From Name</th>
						<th style="width: 10%;background-color: #CA1551;" align="center">Transfer Date</th>
						<th style="width: 10%;background-color: #CA1551;" align="center">Drop City</th>
						<th style="width: 10%;background-color: #CA1551;" align="center">Drop To</th>
						<th style="width: 20%;background-color: #CA1551;" align="center">Drop To Name</th>
						<th style="width: 10%; background-color: #CA1551;" align="center">Transfer Type</th>
					</tr>

					<tr>
						<td style="width: 10%;" "align="center">
							<form:input path="pickupCityName" style="width: 150px; height:40px; border: 1px solid ;" required="required" placeholder="City Name" />
							<b><font color="red"><form:errors path="pickupCityName" cssClass="error" /></font></b>
							<form:hidden path="pickupCityId"/>
						</td>
						<td style="width: 10%;" align="center">
							<div class="select">
								<form:select path="pickUpFrom" style="width: 130px;height:30px;border: 1px solid ;" required="required">  
									<form:options items = "${TRANSFER_POINT_MAP}" class="service-small"/>
								</form:select>  
							</div>
						</td>
						<td style="width: 20%;" align="center">
							<form:input path="pickUpFromName" style="width: 250px; height:40px; border: 1px solid ;" required="required" placeholder="Pickup Name" />
						</td>
						<td style="width: 10%;" align="center">
							<form:input path="transferDate" style="height: 40px; width: 150px;" required="required" type="date" />
						</td>
						<td style="width: 10%;" align="center">
							<form:input path="dropCityName" style="width: 150px; height:40px; border: 1px solid ;" required="required" placeholder="City Name" />
							<b><font color="red"><form:errors path="dropCityName" cssClass="error" /></font></b>
							<form:hidden path="dropCityId"/>
						</td>
						<td style="width: 10%;" align="center">
							<div class="select">
								<form:select path="dropTo" style="width: 130px;height:30px;border: 1px solid ;" required="required">  
									<form:options items = "${TRANSFER_POINT_MAP}" class="service-small"/>
								</form:select>  
							</div>
						</td>
						<td style="width: 20%;" align="center">
							<form:input path="dropToName" style="width: 250px; height:40px; border: 1px solid ;" required="required" placeholder="Drop Name" />
						</td>
						<td style="width: 10%;" align="center">
							<div class="select">
								<form:select path="transferType" style="width: 120px;height:30px;border: 1px solid ;" required="required">  
									<form:options items = "${TRANSFER_TYPE_MAP}" class="service-small"/>
								</form:select>  
							</div>
						</td>										
						
					</tr>
					<tr>
						<th style="width: 20%; background-color: #CA1551;" align="center">Guest Details</th>
						<th style="width: 20%; background-color: #CA1551;" align="center" colspan="2">Remarks</th>
						<th style="width: 15%; background-color: #CA1551;" align="center">Supplier</th>
						<th style="width: 15%; background-color: #CA1551;" align="center">Status</th>
						<th style="width: 10%; background-color: #CA1551;" align="center">Cost</th>
						<th style="width: 10%; background-color: #CA1551;" align="center">Markup</th>
						<th style="width: 10%; background-color: #CA1551;" align="center">Display Order</th>
					</tr>
					<tr>
						<td style="width: 20%;" align="center">
							<table>
								<tr>
									<th style="background-color: #CA1551;">Adults</th>
									<th style="background-color: #CA1551;">Children</th>
									<th style="background-color: #CA1551;">Infants</th>
								</tr>
								<tr>
									<td>
										<form:input path="adults" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" /> 
										<b><font color="red"><form:errors path="adults" cssClass="error" /></font></b>	
									<td>
										<form:input path="children" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" />
									</td>
									<td>
										<form:input path="infants" style="width:50px;height:40px; border: 1px solid ;" required="required" type="number" />
									</td>
								</tr>
							</table>
						</td>
						<td style="width: 20%;" align="center" colspan="2">
							<form:textarea path = "remarks" rows = "4" cols = "15" style="width: 300px; height: 100px;border: 2px solid green; border-radius: 4px;" htmlEscape="false" />
						</td>
						<td style="width: 15%;" align="center">
							<div class="select">
								<form:select path="supplierId" style="width: 150px;height:30px;border: 1px solid ;" required="required">  
									<form:options items = "${TRN_SUPPLIER_MAP}" class="service-small"/>
								</form:select>  
							</div>
						</td>
						<td style="width: 15%;">
							<div class="select">
								<form:select path="status" style="width: 120px;height:30px;border: 1px solid ;" required="required">  
									<form:options items = "${TRN_SL_STATUS_MAP}" class="service-small"/>
								</form:select>  
							</div>
						</td>
						<td style="width: 10%;">
							<form:input path="serviceLineCost" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
						</td>
						<td width="10%;"  align="center">
							<form:input path="markup" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
						</td>
						<td width="10%;"  align="center">
							<form:input path="displayOrder" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
						</td>
						</tr>
						<tr>
							<th style="background-color: #CA1551;" colspan="7">&nbsp;</th>
							<th style="width: 30%; background-color: #CA1551;" align="center">Action</th>
						</tr>
						<tr>
							<td colspan="6">&nbsp;</td>
							<td style="width: 30%;" align="center" colspan="2">
								<input style="width: 130px; background-color: green" id="Add Transfer" type="submit" value="Add Transfer" /> |  
								<a href="view_workload_TRN?dealConfirmationId=${dealConfirmationId}" ><input type="button" style="width: 100px;background-color: blue;" value="Cancel"></a>
						</td>
					</tr>
				</table>
				</form:form>
		</c:if>

		<form:form modelAttribute="STS_SL_OBJ" action="view_create_workload_form_TRN">
			<div align="right">
				<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
				<c:if test="${TRN_SL_ACTION eq 'VIEW'}">
					<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
					<input type="submit" value="Add Transfer" />
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
	$('#pickupCityName').autocomplete({
		serviceUrl : '${pageContext.request.contextPath}/getCityList',
		paramName : "cityName",
		delimiter : ",",
		onSelect : function(suggestion) {
			cityID = suggestion.data;
			id = cityID;
			jQuery("#pickupCityId").val(cityID);
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

