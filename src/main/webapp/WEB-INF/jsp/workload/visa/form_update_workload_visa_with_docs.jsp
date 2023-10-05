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
  //background-image: url('${pageContext.request.contextPath}/resources/images/visa.png');
  //background-repeat: no-repeat;
  background-size: auto;
}
table {
  width: 85%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 10px auto;
  background: white;
}

th {
  background: #007f5c;
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
  height:50px;
}
tr {
  border-bottom: 1px solid #cccccc;
}
tr:hover {background-color:#f5f5f5;}
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

<%-- <jsp:include page="form_createWokLoad_Visa.jsp" />--%>
<jsp:include page="../_Workload_Menu.jsp" />
<br>
	<h2 align="center">
		Visa WorkLoad Details
	</h2>
	<hr>
<body style="background-color: white;">
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
		
				<table style="border: 3px solid black;">
					<tr>
						<th style="background-color: #FFCC00;color:black;width: 12.5%;" align="center">Country</th>
						<th style="background-color: #FFCC00;color:black;width: 10%;" align="center">Consulate City</th>
						<th style="background-color: #FFCC00;color:black;width: 12.5%;" align="center">Applicant Name</th>
						<th style="background-color: #FFCC00;color:black;width: 12.5%;" align="center">Passport Number</th>
						<th style="background-color: #FFCC00;color:black;width: 12.5%;" align="center">Passport Expiry</th>
						<th style="background-color: #FFCC00;color:black;width: 12.5%;" align="center">Visa Type</th>
						<th style="background-color: #FFCC00;color:black;width: 12.5%;" align="center">Visa Profile</th>
						<th style="background-color: #FFCC00;color:black;width: 10%;" align="center">Visa Purpose</th>
						
					</tr>
					<tr>
						<td style="width: 12.5%;" align="center">
								${ORG_VSA_SL_VO.countryName}						
						</td>
						<td style="width: 10%;" align="center">
								${ORG_VSA_SL_VO.consulateCityName}						
						</td>
						<td style="width: 12.5%;" align="center">
								${ORG_VSA_SL_VO.applicantName }
						</td>
						<td style="width: 12.5%;" align="center">
								${ORG_VSA_SL_VO.passportNumber }
						</td>
						<td style="width: 12.5%;" align="center">
							<fmt:formatDate value="${ORG_VSA_SL_VO.passportExpiryDate}" pattern="dd-MM-yyyy" />
						</td>
						<td style="width: 12.5%;" align="center">
							${VISA_TYPE.get(ORG_VSA_SL_VO.visaType  )} 
						</td>
						<td style="width: 12.5%;" align="center">
							${VISA_PROFILE.get(ORG_VSA_SL_VO.profile )}	

						</td>
						<td style="width: 10%;" align="center">
							${VISA_PURPOSE.get(ORG_VSA_SL_VO.visaPurpose )} 
						</td>
					</tr>
					<tr>
						<th style="background-color: #FFCC00;color:black;width: 10%;" align="center" >Travel Start Date</th>
						<th style="background-color: #FFCC00;color:black;width: 10%;" align="center" >Travel Return Date</th>
						<th style="background-color: #FFCC00;color:black;width: 15%;" align="center" >Supplier</th>
						<th style="background-color: #FFCC00;color:black;width: 15%;" align="center">Status</th>
						<th style="background-color: #FFCC00;color:black;width: 30%;" align="center"  colspan="2">Remarks</th>
						<th style="background-color: #FFCC00;color:black;width: 10%;" align="center">Cost</th>
						<th style="background-color: #FFCC00;color:black;width: 10%;" align="center">Markup</th>
					</tr>
					<tr>
						<td style="width: 10%;" align="center">
							<fmt:formatDate value="${ORG_VSA_SL_VO.travelStartDate}" pattern="dd-MM-yyyy" />
						</td>

						<td style="width: 10%;" align="center">
							<fmt:formatDate value="${ORG_VSA_SL_VO.travelReturnDate}" pattern="dd-MM-yyyy" />
						</td>
						<td style="width: 15%;" align="center">
							${ORG_VSA_SL_VO.supplierName}
						</td>
						
						<td style="width: 15%;" align="center">
								${ORG_VSA_SL_VO.statusName}
						</td>
						<td style="width: 30%;" align="center" colspan="2">
							<p style="white-space: pre-line">${ORG_VSA_SL_VO.remarks}</p>
						</td>
						<td style="width: 10%;" align="center" >
							<p style="white-space: pre-line">${ORG_VSA_SL_VO.serviceLineCost}</p>
						</td>
						<td style="width: 10%;" align="center" >
							<p style="white-space: pre-line">${ORG_VSA_SL_VO.markup}</p>
						</td>
						</tr>
						<tr>
						<th style="background-color:#FFCC00;color:black"align="center" colspan="6">&nbsp;</th>
								<th style="background-color: #FFCC00;color:blackwidth: 20%;" align="center" colspan="2">Action</th>
						</tr>
						<tr>
						<td colspan="6">&nbsp;</td>
						<td colspan="2" style="width:20%;">
							<table>
								<tr>
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
						</td>
					</tr>
				</table>
				
		</c:if>		

		<c:if test="${VSA_SL_ACTION eq 'VIEW'}">
			<form:form name="formaddwl" modelAttribute="VSA_SL_OBJ" action="view_form_update_workload_VSA_SL" >
			<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
			<input type="hidden" name="vsaServiceId" value="${VSA_SL_OBJ.vsaServiceId}"/>
			<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
			<input type="hidden" name="consulateCity" value="${VSA_SL_OBJ.consulateCity}"/>
			<input type="hidden" name="countryCode" value="${VSA_SL_OBJ.countryCode}"/>
				<table style="border: 3px solid black;width:85%;table-layout: fixed;">
					<tr>
						<th style="width: 15%;" align="center">Country</th>
						<th style="width: 15%;" align="center">Consulate City</th>
						<th style="width: 20%;" align="center">Applicant Name</th>
						<th style="width: 10%;" align="center">Passport Number</th>
						<th style="width: 10%;" align="center">Passport Expiry</th>
						<th style="width: 10%;" align="center">Visa Type</th>
						<th style="width: 10%;" align="center">Visa Profile</th>
						<th style="width: 10%;" align="center">Visa Purpose</th>


						<!-- 
						<th style="width: 10%;" align="center">Country</th>
						<th style="width: 10%;" align="center">Consulate City</th>
						<th style="width: 15%;" align="center">Applicant Name</th>
						<th style="width: 15%;" align="center">Passport Number</th>
						<th style="width: 15%;" align="center">Passport Expiry</th>
						<th style="width: 12%;" align="center">Visa Type</th>
						<th style="width: 12%;" align="center">Visa Profile</th>
						<th style="width: 12%;" align="center">Visa Purpose</th>
						<th style="width: 10%;" align="center" >Supplier</th>
						 -->					
					</tr>
					<tr>
						<td style="width: 15%;" align="center">
								${VSA_SL_OBJ.countryName}						
						</td>
						<td style="width: 15%;" align="center">
								${VSA_SL_OBJ.consulateCityName}						
						</td>
						<td style="width: 20%;" align="center">
								${VSA_SL_OBJ.applicantName }
						</td>
						<td style="width: 10%;" align="center">
								${VSA_SL_OBJ.passportNumber }
						</td>
						<td style="width: 10%;" align="center">
							<fmt:formatDate value="${VSA_SL_OBJ.passportExpiryDate}" pattern="dd-MM-yyyy" />
						</td>
						<td style="width: 10%;" align="center">
							${VISA_TYPE.get(VSA_SL_OBJ.visaType )} 
						</td>
						<td style="width: 10%;" align="center">
							${VISA_PROFILE.get(VSA_SL_OBJ.profile  )} 

						</td>
						<td style="width: 10%;" align="center">
							${VISA_PURPOSE.get(VSA_SL_OBJ.visaPurpose  )} 
						</td>
					</tr>
					<tr>
						<th style="width: 15%;" align="center" >Travel Start Date</th>
						<th style="width: 15%;" align="center" >Travel Return Date</th>
						<th style="width: 15%;" align="center" >Supplier</th>
						<th style="width: 15%;" align="center">Status</th>
						<th style="width: 25%;" align="center"  colspan="3">Remarks</th>
						<th style="width: 15%;" align="center">Cost</th>
						
						<!-- 
						<th style="width: 20%;" align="center">Travel Start Date</th>
						<th style="width: 25%;" align="center">Travel Return Date</th>
						<th style="width: 15%;" align="center">Status</th>
						<th style="width: 30%;" align="center" colspan="5">Remarks</th>
						<th style="width: 10%;" align="center">Cost</th>
						 -->
					</tr>
					<tr>
						<td style="width: 15%;" align="center">
							<fmt:formatDate value="${VSA_SL_OBJ.travelStartDate}" pattern="dd-MM-yyyy" />
						</td>

						<td style="width: 15%;" align="center">
							<fmt:formatDate value="${VSA_SL_OBJ.travelReturnDate}" pattern="dd-MM-yyyy" />
						</td>
						<td style="width: 15%;" align="center">
							${VSA_SL_OBJ.supplierName}
						</td>

						<td style="width: 15%;" align="center">
								${VSA_SL_OBJ.statusName}
						</td>
						<td style="width: 25%;" align="center" colspan="3">
							<p style="white-space: pre-line">${VSA_SL_OBJ.remarks}</p>
						</td>
						<td style="width: 15%;" >${VSA_SL_OBJ.serviceLineCost}</td>
						</tr>
						<tr>
								<th align="center" colspan="6">&nbsp;</th>
								<th style="width: 20%;" align="center" colspan="2">Action</th>
						</tr>
						<tr>
							<td colspan="6">&nbsp;</td>
							<td style="width: 20%;" align="center" colspan="2">
								<input class="contact" type="submit" value="Edit"> | 
								<a href="view_workload_VSA?dealConfirmationId=${dealConfirmationId}" ><input type="button" style="width: 150px;background-color: blue;" value="Visa Applicant List"></a>
							</td>								
						</tr>
					</table>
				</form:form>
		</c:if>		
		<c:if test="${VSA_SL_ACTION eq 'UPDATE'}">
			<form:form name="formaddwl" modelAttribute="VSA_SL_OBJ" action="edit_edit_workload_VSA_SL"  >
			<div align="center"><b><font color="red"><form:errors path="countryName" cssClass="error" /></b></font></div>
			
			<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
			<input type="hidden" name="vsaServiceId" value="${VSA_SL_OBJ.vsaServiceId}"/>
			<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
			
				<table style="width:85%;">
					<tr>
						<th style="background-color: #b33d32;width: 12.5%;" align="center">Country</th>
						<th style="background-color: #b33d32;width: 10%;" align="center">Consulate City</th>
						<th style="background-color: #b33d32;width: 12.5%;" align="center">Applicant Name</th>
						<th style="background-color: #b33d32;width: 12.5%;" align="center">Passport Number</th>
						<th style="background-color: #b33d32;width: 12.5%;" align="center">Passport Expiry</th>
						<th style="background-color: #b33d32;width: 12.5%;" align="center">Visa Type</th>
						<th style="background-color: #b33d32;width: 12.5%;" align="center">Visa Profile</th>
						<th style="background-color: #b33d32;width: 10%;" align="center">Visa Purpose</th>
						
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
						<th style="background-color: #b33d32;width: 15%;" align="center" >Travel Start Date</th>
						<th style="background-color: #b33d32;width: 15%;" align="center" >Travel Return Date</th>
						<th style="background-color: #b33d32;width: 15%;" align="center" >Supplier</th>
						<th style="background-color: #b33d32;width: 15%;" align="center">Status</th>
						<th style="background-color: #b33d32;width: 30%;" align="center"  colspan="3">Remarks</th>
						<th style="background-color: #b33d32;width: 10%;" align="center">Cost</th>
						
					</tr>
					<tr>
						<td style="width: 15%;" align="center">
							<form:input path="travelStartDate" style="width: 200px; height:40px; border: 1px solid ;" required="required" type="date" />
							<div align="center"><b><font color="red"><form:errors path="travelStartDate" cssClass="error" /></b></font></div>
						</td>

						<td style="width: 15%;" align="center">
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
						<td style="width: 30%;" align="center" colspan="3">
							<form:textarea path = "remarks" rows = "5" cols = "300" style="width: 500px;border: 2px solid green; border-radius: 4px;" htmlEscape="false" />
						</td>
						<td style="width: 10%;"> 
							<form:input path="serviceLineCost" style="width: 100px; height:40px; border: 1px solid ;" required="required" type="number" />
						</td>
						</tr>
						<tr>
							<th style="background-color: #b33d32;" align="center" colspan="5">&nbsp;</th>
							<th style="background-color: #b33d32;width: 20%;" align="center" colspan="3">Action</th>
						</tr>
						<tr>
							<td align="center" colspan="5">&nbsp;</td>
							<td style="width: 50%;" colspan="3">
								<input class="contact" type="submit" value="Update" > | 
								<a href="view_view_workload_VSA_SL?dealConfirmationId=${dealConfirmationId}&vsaServiceId=${VSA_SL_OBJ.vsaServiceId}" ><input type="button" style="width: 100px;background-color: blue;" value="Cancel"></a> | 
								<a href="view_workload_VSA?dealConfirmationId=${dealConfirmationId}&vsaServiceId=${VSA_SL_OBJ.vsaServiceId}" ><input type="button" style="width: 150px;background-color: blue;" value="Visa Applicant List"></a> 
						</td>
					</tr>
				</table>
				</form:form>
		</c:if>		
	
	
	<br>
	<table style="border: 3px solid black;width:50%">
		<caption>Visa Documents</caption>
		<tr>
			<th style="width: 15%;padding:0px;">Doc Id</th>
			<th style="width: 20%;padding:0px;">Document Title</th>
			<th style="width: 20%;padding:0px;">Document Custody</th>
			<th style="width: 20%;padding:0px;">Status</th>
			<th style="width: 25%;padding:0px;">Action</th>
		</tr>
		<c:forEach var="visaDocSLObj" items="${VSA_SL_OBJ.visaDocumentEntityList}">
		<tr>
			<td style="width: 15%;padding:0px;">${visaDocSLObj.vsaDocServiceId}</td>
			<td style="width: 20%;padding:0px;">${visaDocSLObj.documentTitle}</td>
			<td style="width: 20%;padding:0px;" >${visaDocSLObj.documentCustody}</td>
			<td style="width: 20%;padding:0px;">${visaDocSLObj.statusName}</td>
			<td style="width: 25%;padding:0px;">
				<form:form modelAttribute="VISA_DOC_SL_OBJ" action="view_view_visa_doc_sl" style="display:inline;">
					<input type="hidden" name="vsaDocServiceId" value="${visaDocSLObj.vsaDocServiceId}" />
					<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
					<input type="submit" name="view" Value="View" style="background-color: blue; padding: 6px 12px;" />
				</form:form> | 
				<form:form modelAttribute="VSA_DOC_SL_OBJ" action="view_edit_visa_doc_sl" style="display:inline;">
					<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
					<input type="hidden" name="vsaDocServiceId" value="${visaDocSLObj.vsaDocServiceId}" />
					<input type="hidden" name="vsaServiceId" value="${visaDocSLObj.vsaServiceId.vsaServiceId}" />
					<input type="submit" name="Edit" Value="Edit" style="background-color: blue; padding: 6px 12px;" />
					
				</form:form> |
				<form:form modelAttribute="VISA_DOC_OBJ" action="view_delete_visa_doc_sl" style="display:inline;">
					<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
					<input type="hidden" name="vsaDocServiceId" value="${visaDocSLObj.vsaDocServiceId}" />
					<input type="hidden" name="vsaServiceId" value="${visaDocSLObj.vsaServiceId.vsaServiceId}" />
					<input type="submit" name="Delete" Value="Delete" style="background-color: red; padding: 6px 12px;" />
				</form:form>
			</td>
		</tr>
	</c:forEach>
		<tr>
			<td colspan="4">&nbsp;</td>
			<td >
			<table style="border:none;">
			<tr>
				<td style="padding: 0;">
					<form:form name="formaddwl" modelAttribute="VSA_DOC_SL_OBJ" action="view_add_workload_VSA_doc_SL" >
							<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
							<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
							<input type="hidden" name="vsaServiceId" value="${VSA_SL_OBJ.vsaServiceId}" />
							
							<input class="contact" type="submit"  style="background-color: green;" value="Add Document">
					</form:form>
				</td>
					
				
				<td style="padding: 0;">
				 	<form:form name="formaddwl" modelAttribute="VSA_SL_OBJ" action="view_workload_VSA" >	
							<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
							<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
							<input type="submit" name="submit" value="Back"  style="background-color: blue;" />
					</form:form>
				
			</tr>
			</table>
			 
			
			</td>
			
		</tr>
	</table>
	 
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

</script>
</body>
</html>

