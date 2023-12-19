<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>


<jsp:include page="../../menu/MenuBuilder.jsp" />

<style>
table {
  width: 90%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
}

th {
  background: #FFCC00;
  height: 40px;
  width: 10%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: black;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
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
</style>
<br>
<br>
		<h2 align="center">
			Visa Documents
		</h2>

	
<body style="background-color: white;">
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<form:form method="post" action="del_del_visa_docs" modelAttribute="VISA_OBJ">

			<table border="1 px;" style="width:80%; border-collapse: collapse;"  align="center">
				<tr>
				<th style="width:10%;">Country Name</th>
				 <td style="width:10%; padding-bottom: 5px;">${VISA_OBJ.countryName}
					<input type="hidden" name="countryCode" id="countryCode" />
				</td>
				<th style="width:10%;">Visa Profile</th>
				<td style="width:10%;">${VISA_PROFILE.get(VISA_OBJ.profile)}</td>
				<th style="width:10%;">Visa Type</th>
				<td style="width:10%;">${VISA_TYPE.get(VISA_OBJ.visaType)}</td>

				<th style="width:10%;">Visa Purpose</th>
				<td style="width:10%;">${VISA_PURPOSE.get(VISA_OBJ.visaPurpose)}</td>

				</tr>
				<tr>
				<th style="width:10%;">Standard Cost</th>
				<td style="width:10%; padding-bottom: 5px;">${VISA_OBJ.standardCost}</td>
				<th style="width:10%;">B2B Price</th>
				<td style="width:10%; padding-bottom: 5px;">${VISA_OBJ.standardB2bPrice}</td>
				<th style="width:10%;">B2C Price</th>
				<td style="width:10%; padding-bottom: 5px;">${VISA_OBJ.standardB2cPrice}</td>
				<th style="width:10%;">Processing Time</th>
				 <td style="width: 10%; padding-bottom: 5px;">${VISA_OBJ.processingTime} Days</td>
				
				</tr>
				<tr>
				<th style="width:10%;" colspan="8">Remarks</th>
				</tr>
				<tr>
				<td colspan="8"><p style="white-space: pre-line">${VISA_OBJ.remarks}</p></td>
				
				</tr>
		</table>
		<br><br>
		<h2 align="center"><input type="image" src="${pageContext.request.contextPath}/resources/images/warning.jpg" height="50" width="50"/> Delete Visa Document</h2>

		<table border="1 px;" style="width:40%; border-collapse: collapse;"  align="center">
				<tr>
					<th style="width: 30%">Document Id</th><td>${ORG_VISA_DOC_OBJ.visaDocId}</td>
				</tr>
				<tr>
					<th style="width: 30%">Document Title</th><td>${ORG_VISA_DOC_OBJ.documentTitle}</td>
				</tr>
				<tr>
					<th style="width: 30%">Document Description</th><td>${ORG_VISA_DOC_OBJ.description}</td>
				</tr>
		</table>

		<br>
		<table  style="width: 30%; border-collapse: collapse;"  align="center">
			<input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
			<input type="hidden" name="visaDocId" value="${ORG_VISA_DOC_OBJ.visaDocId}" />
			<tr>
			<td style="text-align: right;">
				<input type="submit" name="Delete" Value="Confirm Delete" style="background-color: red; padding: 6px 12px;" />
			</td>
			</form:form>
			<td style="text-align: left;">
				<form:form modelAttribute="VISA_DOC_OBJ" action="view_list_visa_proceed_docs_form" style="display:inline;">
					<input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
					<input type="submit" name="submit" value="Cancel"  style="background-color: blue; padding: 6px 12px;" /> 
				</form:form>
				
				
			</td>
			</tr>
		</table>
	


</body>
