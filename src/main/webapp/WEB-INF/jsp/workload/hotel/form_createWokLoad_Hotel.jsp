<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix = "fn"  uri = "http://java.sun.com/jsp/jstl/functions" %>  

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.jquery-ui.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<head>
	<title>UdanChoo Team Workload Section</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="${pageContext.request.contextPath}/resources/css/tooplate_style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/coda-slider.css" type="text/css" charset="utf-8" />
</head>

<style>

/*
body {
  background-image: url('${pageContext.request.contextPath}/resources/images/hotel.png');
  background-repeat: no-repeat;
   background-position: top;
 background-blend-mode: darken;


}*/
table {
  width: 100%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
  background: transparent;
}

th {
  background: #339933;
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


<br>
<h2 align="center">
	Hotel WorkLoad Details
</h2>
<hr>
	
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
<body style="background-color: white;" class="watermarked">

			<c:if test="${not empty HTL_SL_LIST}">
				<c:forEach var="htlSLObj" items="${HTL_SL_LIST}">
				<c:choose>
				<c:when test="${htlSLObj.htlServiceId eq HTL_SL_OBJ.htlServiceId  && HTL_SL_ACTION eq 'UPDATE' }">
					<form:form name="formaddwl" modelAttribute="HTL_SL_OBJ" action="edit_edit_workload_HTL_SL">
						<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
						<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
						<form:hidden path = "htlServiceId" id="htlServiceId" />
					<table style="border: 3px solid black;width:85%;" id="updatehotel" >
						<tr>
							<th style="width: 10%; background-color: #CA1551;" align="center">City</th>
							<th style="width: 25%; background-color: #CA1551;" align="center">Hotel Name</th>
							<th style="width: 20%; background-color: #CA1551;" align="center">Room Details</th>
							<th style="width: 10%; background-color: #CA1551;" align="center">Meal Plan</th>
							<th style="width: 10%; background-color: #CA1551;" align="center">Check In</th>
							<th style="width: 10%; background-color: #CA1551;" align="center">Check Out</th>
							<th style="width: 10%; background-color: #CA1551;" align="center">Hold T/L</th>
						</tr>
						<tr>
							<td style="width: 10%;" align="center">
								<form:input path="cityName" style="width: 130px;height:40px;border: 1px solid ;" type="text" id="cityName"  />
								<form:hidden path = "cityId" id="cityId" />
								<b><font color="red"><form:errors path="cityName" cssClass="error" /></font></b>
							</td>
							<td style="width: 25%;" align="center">
								<form:input path="hotelName" style="width: 350px;height:40px;border: 1px solid ;" id="hotelName"  required="required" minlength="3" /> 
								<form:hidden path = "hotelId" id="hotelId" />
							</td>
							<td style="width: 20%;" align="center">
								<div class="select" style="">
									<form:select path="roomCategoryId" style="width: 150px;" required="required">  
										<form:options items = "${ORG_HTL_ALL_RCAT_MAP}" class="service-small"/>
									</form:select>  
								</div>
							</td>
							<td style="width: 10%;" align="center">
								<div class="select">
									<form:select path="mealPlan" style="width: 200px;height:40px;border: 1px solid ;" required="required">  
										<option class="service-small" value="" selected>Please Select</option>
										<form:options items = "${MEAL_PLANS_MAP}" class="service-small"/>
									</form:select>  
								</div>
							</td>
							<td style="width: 10%;" align="center">
								<form:input path="checkInDate" style="height: 40px; width: 150px;" required="required" type="date" />
								<b><font color="red"><form:errors path="checkInDate" cssClass="error" /></font></b>
							</td>
							<td style="width: 10%;" align="center">
								<form:input path="checkOutDate" style="height: 40px; width: 150px;" required="required" type="date" />
							</td>
							<td style="width: 10%;" align="center">
								<form:input path="holdingDate" style="height: 40px; width: 150px;" type="date" />
							</td>
						</tr>
						<tr>
							<th style="width: 10%;background-color: #CA1551;" align="center">No. of Rooms</th>
							<th style="width: 20%;background-color: #CA1551;" align="center">Guest Details</th>
							<th style="width: 25%;background-color: #CA1551;" align="center">Remarks</th>
							<th style="width: 15%;background-color: #CA1551;" align="center">Supplier</th>
							<th style="width: 10%;background-color: #CA1551;" align="center">Status</th>
							<th style="width: 10%;background-color: #CA1551;" align="center">Cost</th>
							<th style="width: 10%;background-color: #CA1551;" align="center">Markup</th>
							
						</tr>
						<tr>
							<td style="width: 10%;" align="center" >
								<form:input path="noofrooms" style="width: 100px;height:40px;border: 1px solid ;" type="text" id="noofrooms"  />
							</td>
							<td style="width: 20%;" align="center">
								<table>
									<tr>
										<th style="background-color: #CA1551;">Adults</th>
										<th style="background-color: #CA1551;">Children</th>
										<th style="background-color: #CA1551;">E. Bed</th>
									</tr>
									<tr>
										<td><form:input path="adults" style="width: 70px;height:40px;border: 1px solid ;" type="text" id="adults" size="3" pattern="[0-9.]+" /></td>
										<td><form:input path="children" style="width: 70px;height:40px;border: 1px solid ;" type="text" id="children" size="3" pattern="[0-9.]+" /></td>
										<td><form:input path="extrabed" style="width: 70px;height:40px;border: 1px solid ;" type="text" id="extrabed" size="3" pattern="[0-9.]+" /></td>
										<b><font color="red"><form:errors path="adults" cssClass="error" /></font></b>
									</tr>
								</table>
							</td>
							<td style="width: 25%;" align="center">
								<form:textarea path = "remarks" rows = "4" cols = "15" style="width: 300px; height: 100px;border: 2px solid green; border-radius: 4px;" htmlEscape="false" />
							</td>
							<td style="width: 15%;" align="center">
								<div class="select">
									<form:select path="supplierId" style="width: 200px;height:40px;border: 1px solid ;" required="required">  
										<option class="service-small" value="0">------Please Select------</option>
										<form:options items = "${HTL_SUPPLIER_MAP}" class="service-small"/>
									</form:select>  
								</div>
							</td>
							
							
							<td style="width: 10%;" align="center">
								<div class="select">
									<form:select path="status" style="width: 200px;height:40px;border: 1px solid ;" required="required">  
										<option class="service-small" value="0">------Please Select------</option>
										<form:options items = "${HTL_SL_STATUS_MAP}" class="service-small"/>
									</form:select>  
								</div>
							</td>
							
							<td style="width: 10%;" align="center" >
								<form:input path="serviceLineCost" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
							</td>
							<td style="width: 10%;" align="center" >
								<form:input path="markup" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
							</td>
							
							</tr>
							<tr>
								<th style="background-color: #CA1551;" colspan="5">&nbsp;</th>
								<th style="width: 10%;background-color: #CA1551;" align="center">Display Order</th>
								<th style="background-color: #CA1551;"> Action </th>
							</tr>
							<tr>
								<td colspan="5">&nbsp;</td>
								<td style="width: 10%;" align="center" >
									<form:input path="displayOrder" style="width: 70px;height:40px;border: 1px solid ;" type="text" id="displayOrder" size="3" pattern="[0-9.]+" />
								</td>
								
								<td style="width: 15%;" align="center">
									<table>
										<tr>
											<td>
												<input style="width: 100px; background-color: green" type="submit" value="Update" />
											</td>
											<td>
												<a href="view_workload_HTL?dealConfirmationId=${dealConfirmationId}" ><input type="button" style="width: 100px;background-color: blue;" value="Cancel"></a>
											
											</td>
										</tr>
									</table>
							</td>
						</tr>
					</table>
					<p>&nbsp;</p>
			</form:form>
		</c:when>
		<c:otherwise>
				<table style="border: 3px solid black;width:85%;table-layout:fixed;" >
					<tr>
						<th style="width: 10%;" align="center">City</th>
						<th style="width: 25%;" align="center" >Hotel Name</th>
						<th style="width: 25%;" align="center">Room Details</th>
						<th style="width: 10%;" align="center">Meal Plan</th>
						<th style="width: 10%;" align="center">Check In</th>
						<th style="width: 10%;" align="center">Check Out</th>
						<th style="width: 10%;" align="center">Hold T/L</th>
						
					</tr>

					<tr>
						<td style="width: 10%;" align="center">${htlSLObj.cityName}</td>
						<td style="width: 25%" align="center" >${htlSLObj.hotelName}</td>
						<td style="width: 25%" align="center">${htlSLObj.roomCategoryName}</td> 
						<td style="width: 10%" align="center">${htlSLObj.mealPlanName}</td>
						<td style="width: 10%;" align="center"><fmt:formatDate value="${htlSLObj.checkInDate}" pattern="dd-MM-yyyy" /></td>
						<td style="width: 10%;" align="center"><fmt:formatDate value="${htlSLObj.checkOutDate}" pattern="dd-MM-yyyy" /></td>
						<td style="width: 10%;" align="center"><fmt:formatDate value="${htlSLObj.holdingDate}" pattern="dd-MM-yyyy" /></td>
						
					</tr>
					<tr>
						<th style="width: 10%;" align="center">No. of Rooms</th>
						<th style="width: 20%;" align="center">Guest Details</th>
						<th style="width: 20%;" align="center">Remarks</th>
						<th style="width: 15%;" align="center">Supplier</th>
						<th style="width: 15%;" align="center">Status</th>
						<th style="width: 10%;" align="center">Cost</th>
						<th style="width: 10%;" align="center">Markup</th>
					</tr>

					<tr>
						<td style="width: 10%;" align="center" >${htlSLObj.noofrooms}</td>
						<td style="width: 20%;" align="center">${htlSLObj.adults} Adults |  ${htlSLObj.children} Children | ${htlSLObj.extrabed} Extra Bed</td>
						<td style="width: 20%;" align="center">${htlSLObj.remarks}</td>
						<td style="width: 15%;" align="center">${htlSLObj.supplierName}</td>
						<td style="width: 15%;" align="center">${htlSLObj.statusName}</td>
						<td style="width: 10%;" align="center" >${htlSLObj.serviceLineCost}</td>
						<td style="width: 10%;" align="center" >${htlSLObj.markup}</td>
						
					</tr>
					<tr>
						<th colspan="5">Voucher</th>
						<th style="width: 10%;" align="center">Display Order</th>
						<th> Action </th>
					</tr>
					<tr>
						<form:form id="form_generate_voucher" modelAttribute="HTL_VCHR_OBJ" name="form_generate_voucher" action="manage_vouchers" method="POST" style="display:inline;">
						<td><input type="submit" name="Manage Vouchers" Value="Manage Vouchers" style="background-color: #AA6C39; padding: 15px 32px;" /></td>
						<td>
							
								<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
								<input type="hidden" name="htlServiceId" value="${htlSLObj.htlServiceId}" />
								<input type="submit" name="Re / Generate Voucher" Value="Re / Generate Voucher" style="background-color: #008CBA; padding: 15px 32px;" />
							
						</td>
						</form:form>
						<c:set var="fileMap" value="${VOUCHER_MAP}" />
						<c:set var="voucherInitial" value="HTL_VOUCHER_" />
						<c:set var="voucherCode" value="${htlSLObj.htlServiceId}.pdf" />
						<c:set var="voucherfileName" value="${voucherInitial}${voucherCode}" />
						<c:if test="${fileMap.containsKey(voucherfileName)}">
							<td>
								<form:form name="singleViewFileForm" id="singleViewFileForm" target="_blank" action="viewFile" style="display:inline;">
			          				<input type="hidden" name="fileType" value="HTL"/>
               							<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
               							<input type="hidden" name="fileName" value="${fileMap[voucherfileName]}"/>
	          						<input type="submit" name="View" Value="View" style="color: white;background-color: Green; padding: 6px 12px;" />
	          					</form:form>
							</td>
							<td>
			          		<form:form name="singleDownloadFileForm" id="singleDownloadFileForm" action="downloadFile" style="display:inline;">
		          				<input type="hidden" name="fileType" value="HTL"/>
         						<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
         						<input type="hidden" name="fileName" value="${fileMap[voucherfileName]}"/>
          						<input type="submit" name="Download" Value="Download" style="color: white;background-color: Green; padding: 6px 12px;" />
	          				</form:form>
	          				</td>
	          				<td>
		          				<form:form name="singleDownloadFileForm" id="singleDownloadFileForm" action="deleteVoucher" style="display:inline;">
			          				<input type="hidden" name="htlServiceId" value="${htlSLObj.htlServiceId}"/>
			          				<input type="hidden" name="fileType" value="HTL"/>
	         						<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
	         						<input type="hidden" name="fileName" value="${fileMap[voucherfileName]}"/>
	          						<input type="submit" name="Delete" Value="Delete" style="color: white;background-color: red; padding: 6px 12px;" />
		          				</form:form>
	          				</td>
						</c:if>
						<c:if test="${not fileMap.containsKey(voucherfileName)}">
						<td colspan="3">
							&nbsp;
						</td>
						</c:if>
						<td style="width: 10%;" align="center" >${htlSLObj.displayOrder}</td>
						<td style="width: 15%;" align="center">
							<table>
								<tr>
									<td><form:form id="form_update_FLT_SL" name="form_update_HTL_SL" action="view_update_workload_form_HTL" method="POST" style="display:inline;">
											<input type="hidden" name="htlServiceId" value="${htlSLObj.htlServiceId}" />
											<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
											<input type="hidden" name="cityId" value="${htlSLObj.cityId}" />
											<input type="submit" name="Edit" Value="Edit" style="background-color: blue; padding: 6px 12px;" />
										</form:form>
									</td>
									<td><form:form id="form_del_HTL_SL" name="form_del_conf_HTL_SL" action="view_delete_htl_sl_confirmation?htlServiceId=${htlSLObj.htlServiceId}" method="POST" style="display:inline;">
											<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
											<input type="submit" name="Delete" Value="Delete" style="background-color: red; padding: 6px 12px;" />
										</form:form></td>
								</tr>
							</table>
						</td>
					</tr>
					
					</table>
					<p>&nbsp;</p>	
				</c:otherwise>
				</c:choose>
				</c:forEach>
			</c:if>

			<!-- Following set of code will get executed only user have clicked on the Add Hotel button.  -->
			<c:if test="${HTL_SL_ACTION eq 'ADD'}">
				<form:form name="formaddwl" modelAttribute="HTL_SL_OBJ" action="create_workload_HTL_SL">
					<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
					<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
				<table style="border: 3px solid black;width:85%;table-layout:fixed;" id="newhotel">
					<tr>
						<th style="width: 10%; background-color: #CA1551;" align="center">City</th>
						<th style="width: 25%; background-color: #CA1551;" align="center">Hotel Name</th>
						<th style="width: 20%; background-color: #CA1551;" align="center">Room Details</th>
						<th style="width: 10%; background-color: #CA1551;" align="center">Meal Plan</th>
						<th style="width: 10%; background-color: #CA1551;" align="center">Check In</th>
						<th style="width: 10%; background-color: #CA1551;" align="center">Check Out</th>
						<th style="width: 10%; background-color: #CA1551;" align="center">Hold T/L</th>
					</tr>

					<tr>
						<td style="width: 10%;" align="center">
							<form:input path="cityName" style="width: 130px;height:40px;border: 1px solid ;" required="required"/>
							<form:hidden path="cityId"  />
							<b><font color="red"><form:errors path="cityName" cssClass="error" /></font></b>
						</td>
						<td style="width: 25%;" align="center">
							<form:input path="hotelName" style="width: 350px;height:40px;border: 1px solid ;" required="required"/>
							 <form:hidden path="hotelId"  />
							 <b><font color="red"><form:errors path="hotelName" cssClass="error" /></font></b>
						</td>
						<td style="width: 20%;" align="center">
							<div class="select">
									<form:select path="roomCategoryId" style="width: 200px;height:40px;border: 1px solid ;" required="required">  
										<form:options items = "${ORG_HTL_ALL_RCAT_MAP}" class="service-small"/>
									</form:select>  
							</div>
						</td>
						<td>
							<div class="select">
								<form:select path="mealPlan" style="width: 200px;height:40px;border: 1px solid ;" required="required">  
									<option class="service-small" value="" selected>Please Select</option>
									<form:options items = "${MEAL_PLANS_MAP}" class="service-small"/>
								</form:select>  
							</div>

						</td>
						<td style="width: 10%;" align="center">
							<form:input type="date" path="checkInDate" style="width: 130px;height:40px;border: 1px solid ;" required="required" />
							<b><font color="red"><form:errors path="checkInDate" cssClass="error" /></font></b>
						</td>
						<td style="width: 10%;" align="center">
							<form:input type="date" path="checkOutDate" style="width: 130px;height:40px;border: 1px solid ;" required="required" />
						</td>
						<td style="width: 10%;" align="center">
							<form:input type="date" path="holdingDate" style="width: 130px;height:40px;border: 1px solid ;" />

						</td>
					</tr>
					<tr>
						<th style="width: 10%;background-color: #CA1551;" align="center">No. of Rooms</th>
						<th style="width: 20%;background-color: #CA1551;" align="center">Guest Details</th>
						<th style="width: 25%;background-color: #CA1551;" align="center">Remarks</th>
						<th style="width: 15%;background-color: #CA1551;" align="center">Supplier</th>
						<th style="width: 10%;background-color: #CA1551;" align="center">Status</th>
						<th style="width: 10%;background-color: #CA1551;" align="center">Cost</th>
						<th style="width: 10%;background-color: #CA1551;" align="center">Markup</th>
					</tr>
					<tr>
							<td style="width: 10%;" align="center" >
								<form:input path="noofrooms" style="width: 100px;height:40px;border: 1px solid ;" type="number" id="noofrooms"  min="1" />
							</td>
							<td style="width: 20%;" align="center">
								<table>
									<tr>
										<th style="background-color: #CA1551;">Adults</th>
										<th style="background-color: #CA1551;">Children</th>
										<th style="background-color: #CA1551;">E. Bed</th>
									</tr>
									<tr>
										<td>
											<form:input path="adults" style="width: 70px;height:40px;border: 1px solid ;" type="text" id="adults" size="3" pattern="[0-9.]+" />
											<b><font color="red"><form:errors path="adults" cssClass="error" /></font></b>
										</td>
										<td><form:input path="children" style="width: 70px;height:40px;border: 1px solid ;" type="text" id="children" size="3" pattern="[0-9.]+" /></td>
										<td><form:input path="extrabed" style="width: 70px;height:40px;border: 1px solid ;" type="text" id="extrabed" size="3" pattern="[0-9.]+" /></td>
									</tr>
								</table>
							</td>
							<td style="width: 25%;" align="center">
								<form:textarea path = "remarks" rows = "4" cols = "15" style="width: 300px; height: 100px;border: 2px solid green; border-radius: 4px;" htmlEscape="false" /> 
							</td>
							<td style="width: 15%;" align="center">
								<div class="select">
									<form:select path="supplierId" style="width: 180px;height:40px;border: 1px solid ;" required="required">  
										<form:options items = "${HTL_SUPPLIER_MAP}" class="service-small"/>
									</form:select>  
								</div>
							</td>
							
							
							<td style="width: 10%;" align="center">
								<div class="select">
									<form:select path="status" style="width: 180px;height:40px;border: 1px solid ;" required="required">  
										<option class="service-small" value="0">------Please Select------</option>
										<form:options items = "${HTL_SL_STATUS_MAP}" class="service-small"/>
									</form:select>  
								</div>
							</td>
							
							<td style="width: 10%;" align="center" >
								<form:input path="serviceLineCost" style="width: 100px;height:40px;border: 1px solid ;" type="number" id="serviceLineCost" size="3" pattern="[0-9.]+" />
								
							</td>
							<td style="width: 10%;" align="center" >
								<form:input path="markup" style="width: 70px;height:40px;border: 1px solid ;" type="number" id="markup" />
							</td>
							</tr>
						<tr>
							<th style="background-color: #CA1551;" colspan="5">&nbsp;</th>
							<th style="width: 10%;background-color: #CA1551;" align="center">Display Order</th>
							<th style="width: 15%;background-color: #CA1551;"> Action </th>
						</tr>
						<tr>
							<td colspan="5">&nbsp;</td>
							<td style="width: 10%;"><form:input path="displayOrder" style="width: 70px;height:40px;border: 1px solid ;" type="number" id="displayOrder" size="3" pattern="[0-9.]+" /></td>
							<td style="width: 15%;" align="center">
								<table>
									<tr>
										<td>
												<input style="background-color: green;" type="submit" value="Add" />
										</td>
										<td>
											<a href="view_workload_HTL?dealConfirmationId=${dealConfirmationId}" ><input type="button" style="background-color: blue;" value="Cancel"></a>
										</td>
									</tr>
								</table>
							</td>
					</tr>
					</table>
				</form:form>
			</c:if>
		<form:form modelAttribute="HTL_SL_OBJ" action="view_create_workload_form_HTL">
			<div align="right">
				<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
				<c:if test="${HTL_SL_ACTION eq 'VIEW'}">
					<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
					<input type="submit" value="Add Hotel" />
				</c:if>
			</div>
			<div id="result"></div>
		</form:form>


</body>


<script>

$(document).ready(function () {
    // Handler for .ready() called.
    var ut = document.getElementById('updatehotel'); 
    var nt = document.getElementById('newhotel');
    if (ut != null) { 
    	$('html, body').animate({
            scrollTop: $('#updatehotel').offset().top
        }, 'slow');
    }
    else if (nt != null) {
        $('html, body').animate({
            scrollTop: $('#newhotel').offset().top
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

	$('#hotelName').autocomplete(
					{
						serviceUrl : "${pageContext.request.contextPath}/getCityHotelList",
						minChars: 3,
						paramName : "hotelName",
						params : {
							cityId : function() {
								return $('#cityId').val()
							}
						},
						delimiter : ",",
						onSelect : function(suggestion) {
							//$('#roomCategory').append(new Option(suggestion.value,suggestion.data));
							//populateRoomCategory(event, ui);
							$('#roomCategoryId').empty();
							$.each(suggestion.roomCat, function(key, value) {
								$('#roomCategoryId').append($("<option class='service-small'>").val(key).text(value));
								//$('#roomCategory').append(new Option(value,key));
							});
							hotelID = suggestion.data;
							id = hotelID;
							jQuery("#hotelId").val(hotelID);
							$('input[name=hotelName]').val(suggestion.value);
							//alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
							return false;
						},
						transformResult : function(response) {
							return {
								suggestions : $.map($.parseJSON(response),
										function(item) {
											/*for(var k in item.keyValueList) {
											    if(item[k] instanceof Object) {
											    	$.each(item[k], function(key, value) {
											    		alert(key);
											    	});
											    } else {
											        alert('not object');
											    };
											}*/
											//alert(item.keyValueList);
											return {
												value : item.tagName,
												data : item.id,
												roomCat : item.keyValueList
											};
										})

							};
						}

					});

	/*
	 $('#cityName').autocomplete({
	 serviceUrl: '${pageContext.request.contextPath}/getCityList',
	 paramName: "cityName",
	 delimiter: ",",
	 onSelect: function(suggestion) {
	 cityID = suggestion.data;
	 id=cityID;
	 jQuery("#cityId").val(cityID);
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
	 */

	/*

	 $('#hotelName').autocomplete({
	
	 serviceUrl: "${pageContext.request.contextPath}/getCityHotelList?cityId=" + $("#cityId").val(),
	 paramName: "hotelName",
	 delimiter: ",",
	 onSelect: function(suggestion) {
	 hotelId = suggestion.data;
	 id=hotelID;
	 jQuery("#hotelId").val(hotelId);
	 $('input[name=hotelName]').val(id);
	 return false;
	 },
	 transformResult: function(response) {
	 return {
	 suggestions: $.map($.parseJSON(response), function(item) {
	 return { value: item.hotelName, data: item.hotelId };
	 })
	
	 };
	 }
	 });

	 $(document).ready(function() { 
	
	
	 $("#clickme").click(function() { 
	 alert($("#cityId").val()); 
	 }); 

	
	 }) 

	 */
</script>

</html>

