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
  background-image: url('${pageContext.request.contextPath}/resources/images/visa.png');
  //background-repeat: no-repeat;
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
		Visa WorkLoad Details
	</h2>
	<hr>
<body style="background-color: white;">
	<c:if test="${VSA_SL_ACTION eq 'VIEW'}">
			<form:form name="formaddwl" modelAttribute="VSA_SL_OBJ" action="view_form_update_workload_VSA_SL" >
			<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
			<input type="hidden" name="vsaServiceId" value="${VSA_SL_OBJ.vsaServiceId}"/>
			<input type="hidden" name="serviceMapId" value="${serviceMapId}" />
	
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
	
	<c:if test="${VSA_DOC_SL_ACTION eq 'ADD'}">
		<br>
		<h2 align="center">Visa Documents</h2>
		<form:form modelAttribute="VSA_DOC_SL_OBJ" action="edit_edit_visa_doc_sl" style="display:inline;">
			<table id="visadoc-sl" style="width:30%;">
				<tr>
					<th style="width: 30%;background-color: #b33d32;">Doc Id</th><td style="width: 70%;">Auto Generated</td>
				</tr>
				<tr>
					<th style="width: 30%;background-color: #b33d32;">Document Title</th>
					<td style="width: 70%;">
						<input style="width: 300px; height: 40px; border-color: lightblue !important;" type="text" id="documentTitle" name="documentTitle" required />
					</td>
				</tr>
				<tr>
					<th style="width: 30%;background-color: #b33d32;">Document Description</th>
					<td style="width: 70%;">
						<textarea style="width: 300px;" rows="5" cols="150" name="description"></textarea>
					</td>
				</tr>
				<tr>
					<th style="width: 30%;background-color: #b33d32;">Document Custody</th>
					<td style="width: 70%;"  >
							<div class="select">
							<select name="documentCustody" style="width: 200px;height: 30px;" required>
								<option class="service-small" value="" selected>Please Select</option>
								<c:if test="${not empty VISA_DOC_CUSTODY}">
				       				<c:forEach items="${VISA_DOC_CUSTODY}" var="custody">
				      							<option class="service-small" value="${custody}">${custody}</option>
				   					</c:forEach>
				 				</c:if>
				 			</select>
							</div>
					</td>
				</tr>
				<tr>
					<th style="width: 30%;background-color: #b33d32;">Status</th>
					<td style="width: 70%;">
					<div class="select">
							<form:select path="status" style="width: 200px;height:30px;border: 1px solid ;" required="required">  
									<option class="service-small" >------Please Select------</option>
									<form:options items = "${VISA_DOC_SL_STATUS_MAP}" class="service-small"/>
							</form:select>  
					</div>
					</td>
				</tr>
				<tr>
					<th style="width: 30%;background-color: #b33d32;">Remarks</th>
					<td style="width: 70%;">
						<textarea style="width: 300px;" rows="5" cols="150" name="remarks"></textarea>
					</td>
				</tr>
				<tr>
				<td colspan="2"> &nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
							<table>
								<tr>
									<td style="text-align:right;">
										<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
										<input type="hidden" name="vsaServiceId" value="${VSA_SL_OBJ.vsaServiceId}" />
										<input style="width: 100px; background-color: green" type="submit" value="ADD" />
									</td>
									<td style="text-align:left;">
										<a href="view_view_workload_VSA_SL?dealConfirmationId=${dealConfirmationId}&vsaServiceId=${VSA_SL_OBJ.vsaServiceId}" ><input type="button" style="width: 100px;background-color: blue;" value="Cancel"></a>
									</td>
								</tr>
							</table>
					</td>
				</tr>
			</table> 
			</form:form>
	</c:if>
	
	<c:if test="${VSA_DOC_SL_ACTION eq 'DELETE'}">
			<h2 align="center">
				<input type="image" src="${pageContext.request.contextPath}/resources/images/warning.jpg" height="50" width="50"/> Delete Document
			</h2>
			<form:form modelAttribute="VSA_DOC_SL_OBJ" action="del_del_visa_doc_sl_opt" style="display:inline;">
			<table id="visadoc-sl" style="width:30%;">
				<tr>
					<th style="width: 30%;background-color:red;">Doc Id</th><td style="width: 70%;">${VSA_DOC_SL_OBJ.vsaDocServiceId}</td>
				</tr>
				<tr>
					<th style="width: 30%;background-color:red;">Document Title</th><td style="width: 70%;">${VSA_DOC_SL_OBJ.documentTitle}</td>
				</tr>
				<tr>
					<th style="width: 30%;background-color:red;">Document Description</th><td style="width: 70%;">${VSA_DOC_SL_OBJ.description}</td>
				</tr>
				<tr>
					<th style="width: 30%;background-color:red;">Document Custody</th><td style="width: 70%;">${VSA_DOC_SL_OBJ.documentCustody}</td>
				</tr>
				<tr>
					<th style="width: 30%;background-color:red;">Status</th><td style="width: 70%;">${VSA_DOC_SL_OBJ.statusName}</td>
				</tr>
				<tr>
					<th style="width: 30%;background-color:red;">Remarks</th><td style="width: 70%;"><p style="white-space: pre-line">${VSA_DOC_SL_OBJ.remarks}</p></td>
				</tr>
				<tr>
				<td colspan="2"> &nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
						<input type="hidden" name="vsaDocServiceId" value="${VSA_DOC_SL_OBJ.vsaDocServiceId}" />
						<input type="hidden" name="vsaServiceId" value="${VSA_DOC_SL_OBJ.vsaServiceId.vsaServiceId}" />
						<input type="submit" name="Confirm Delete" value="Confirm Delete"  style="background-color: red; padding: 12px 12px;" /> | 
						<input type="submit" name="Cancel" value="Cancel"  style="background-color: blue; padding: 12px 12px;" />
						
						<%--
						<form:form modelAttribute="VISA_DOC_OBJ" action="delete_delete_visa_doc_sl" style="display:inline;">
							<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
							<input type="hidden" name="vsaDocServiceId" value="${ORG_VSA_DOC_SL_VO.vsaDocServiceId}" />
							<input type="hidden" name="vsaServiceId" value="${ORG_VSA_DOC_SL_VO.vsaServiceId.vsaServiceId}" />
							<input type="submit" name="submit" value="Confirm Delete"  style="background-color: red; padding: 12px 12px;" />
						</form:form> | 
						<form:form modelAttribute="VISA_DOC_OBJ" action="view_view_visa_doc_sl" style="display:inline;">
							<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
							<input type="hidden" name="vsaDocServiceId" value="${ORG_VSA_DOC_SL_VO.vsaDocServiceId}" />
							<input type="hidden" name="vsaServiceId" value="${ORG_VSA_DOC_SL_VO.vsaServiceId.vsaServiceId}" />
							<input type="submit" name="submit" value="Cancel"  style="background-color: blue; padding: 12px 12px;" />
						</form:form>
						 --%>
					</td>
				</tr>
			</table> 
			</form:form>
	</c:if>
	
	<c:if test="${VSA_DOC_SL_ACTION eq 'UPDATE'}">
	<br>
	<h2 align="center">Visa Documents</h2>
		<form:form modelAttribute="VSA_DOC_SL_OBJ" action="edit_edit_visa_doc_sl" style="display:inline;">
			
			<table id="visadoc-sl" style="width:30%;">
				<tr>
					<th style="width: 30%;background-color: #b33d32;">Doc Id</th><td style="width: 70%;">${VSA_DOC_SL_OBJ.vsaDocServiceId}</td>
				</tr>
				<tr>
					<th style="width: 30%;background-color: #b33d32;">Document Title</th>
					<td style="width: 70%;">
						<input style="width: 335px; height: 40px; border-color: lightblue !important;" type="text" id="documentTitle" name="documentTitle" value="${VSA_DOC_SL_OBJ.documentTitle}" required />
					</td>
				</tr>
				<tr>
					<th style="width: 30%;background-color: #b33d32;">Document Description</th>
					<td style="width: 70%;">
						<textarea style="width: 335px;" rows="5" cols="150" name="description">${VSA_DOC_SL_OBJ.description}</textarea>
					</td>
				</tr>
				<tr>
					<th style="width: 30%;background-color: #b33d32;">Document Custody</th>
					<td style="width: 70%;"  >
							<div class="select">
							<select name="documentCustody" style="width: 335px;height: 30px;" required>
								<option class="service-small" value="">Please Select</option>
								<c:if test="${not empty VISA_DOC_CUSTODY}">
				       				<c:forEach items="${VISA_DOC_CUSTODY}" var="custody">
				      						<c:if test="${VSA_DOC_SL_OBJ.documentCustody eq custody }">
				      							<option class="service-small" value="${custody}" selected>${custody}</option>
				      						</c:if>
				      						<c:if test="${VSA_DOC_SL_OBJ.documentCustody ne custody }">
				      							<option class="service-small" value="${custody}">${custody}</option>
				      						</c:if>
				      						
				   					</c:forEach>
				 				</c:if>
				 			</select>
							</div>

					</td>
				</tr>
				<tr>
					<th style="width: 30%;background-color: #b33d32;">Status</th>
					<td style="width: 70%;">
					<div class="select">
						<form:select path="status" style="width: 200px;height:30px;border: 1px solid ;" required="required">  
								<option class="service-small" >------Please Select------</option>
								<form:options items = "${VISA_DOC_SL_STATUS_MAP}" class="service-small"/>
						</form:select>  
					</div>
					</td>
				</tr>
				<tr>
					<th style="width: 30%;background-color: #b33d32;">Remarks</th>
					<td style="width: 70%;">
						<textarea style="width: 300px;" rows="5" cols="150" name="remarks">${VSA_DOC_SL_OBJ.remarks.trim()}</textarea>
						
					</td>
				</tr>
				<tr>
				<td colspan="2"> &nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
						<input type="hidden" name="vsaDocServiceId" value="${VSA_DOC_SL_OBJ.vsaDocServiceId}" />
						<input type="hidden" name="vsaServiceId" value="${VSA_DOC_SL_OBJ.vsaServiceId.vsaServiceId}" />
						<input type="submit" name="submit" value="Update"  style="background-color: green; padding: 6px 12px;" />
						</form:form>
						|
			
						<form:form modelAttribute="VISA_DOC_OBJ" action="view_delete_visa_doc_sl" style="display:inline;">
							<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
							<input type="hidden" name="vsaDocServiceId" value="${VSA_DOC_SL_OBJ.vsaDocServiceId}" />
							<input type="hidden" name="vsaServiceId" value="${VSA_DOC_SL_OBJ.vsaServiceId.vsaServiceId}" />
							<input type="submit" name="submit" value="Delete"  style="background-color: red; padding: 6px 12px;" />
						</form:form> | 
						<form:form modelAttribute="VISA_DOC_OBJ" action="view_view_visa_doc_sl" style="display:inline;">
							<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
							<input type="hidden" name="vsaDocServiceId" value="${VSA_DOC_SL_OBJ.vsaDocServiceId}" />
							<input type="hidden" name="vsaServiceId" value="${VSA_DOC_SL_OBJ.vsaServiceId.vsaServiceId}" />
							<input type="submit" name="submit" value="Cancel"  style="background-color: blue; padding: 6px 12px;" />
						</form:form>
					</td>
				</tr>
			</table> 
	</c:if>
	
	<c:if test="${VSA_DOC_SL_ACTION eq 'VIEW'}">
	<br>
	<h2 align="center">Visa Documents</h2>
	<div align="center"><b><font color="green" > ${Success_Doc} </font><font color="red"> ${Error_Doc}</font> </b></div>
			<form:form modelAttribute="VSA_DOC_SL_OBJ" action="view_view_visa_doc_sl" style="display:inline;">
			<table id="visadoc-sl" style="width:30%;">
				<tr>
					<th style="width: 30%;text-align:left;">Doc Id</th><td style="width: 70%;text-align:left;">${VSA_DOC_SL_OBJ.vsaDocServiceId}</td>
				</tr>
				<tr>
					<th style="width: 30%;text-align:left;">Document Title</th><td style="width: 70%;text-align:left;">${VSA_DOC_SL_OBJ.documentTitle}</td>
				</tr>
				<tr>
					<th style="width: 30%;text-align:left;">Document Description</th><td style="width: 70%;text-align:left;">${VSA_DOC_SL_OBJ.description}</td>
				</tr>
				<tr>
					<th style="width: 30%;text-align:left;">Document Custody</th><td style="width: 70%;text-align:left;">${VSA_DOC_SL_OBJ.documentCustody}</td>
				</tr>
				<tr>
					<th style="width: 30%;text-align:left;">Status</th><td style="width: 70%;text-align:left;">${VSA_DOC_SL_OBJ.statusName}</td>
				</tr>
				<tr>
					<th style="width: 30%;text-align:left;">Remarks</th><td style="width: 70%;text-align:left;"><p style="white-space: pre-line">${VSA_DOC_SL_OBJ.remarks}</p></td>
				</tr>
				<tr>
				<td colspan="2"> &nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
						<input type="hidden" name="vsaDocServiceId" value="${VSA_DOC_SL_OBJ.vsaDocServiceId}" />
						<input type="hidden" name="vsaServiceId" value="${VSA_DOC_SL_OBJ.vsaServiceId.vsaServiceId}" />
						<input type="submit" name="Edit" value="Edit" id="Edit" style="background-color: green; padding: 6px 12px;" /> | 
						<input type="submit" name="Delete" value="Delete"  style="background-color: red; padding: 6px 12px;" /> | 
						<input type="submit" name="Back" value="Back"  style="background-color: blue; padding: 6px 12px;" />
						
					<%--
							<form:form modelAttribute="VSA_DOC_SL_OBJ" action="view_edit_visa_doc_sl" style="display:inline;">
								<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
								<input type="hidden" name="vsaDocServiceId" value="${VSA_DOC_SL_OBJ.vsaDocServiceId}" />
								<input type="hidden" name="vsaServiceId" value="${VSA_DOC_SL_OBJ.vsaServiceId.vsaServiceId}" />
								<input type="submit" name="submit" value="Edit"  style="background-color: green; padding: 6px 12px;" />
							</form:form> | 
							<form:form modelAttribute="VISA_DOC_OBJ" action="view_delete_visa_doc_sl" style="display:inline;">
								<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
								<input type="hidden" name="vsaDocServiceId" value="${VSA_DOC_SL_OBJ.vsaDocServiceId}" />
								<input type="hidden" name="vsaServiceId" value="${VSA_DOC_SL_OBJ.vsaServiceId.vsaServiceId}" />
								<input type="submit" name="submit" value="Delete"  style="background-color: red; padding: 6px 12px;" />
							</form:form>|
							<form:form modelAttribute="VISA_DOC_OBJ" action="view_view_workload_VSA_SL" style="display:inline;">
								<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
								<input type="hidden" name="vsaServiceId" value="${VSA_DOC_SL_OBJ.vsaServiceId.vsaServiceId}" />
								<input type="submit" name="submit" value="Back"  style="background-color: blue; padding: 6px 12px;" />
							</form:form>
						 --%>
					</td>
				</tr>
			</table>
			</form:form> 
	</c:if>
</body>
</html>

