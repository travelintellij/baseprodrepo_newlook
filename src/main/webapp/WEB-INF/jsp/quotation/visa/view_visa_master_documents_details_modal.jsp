<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/css/jquery.datetimepicker.min.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery.datetimepicker.full.js" />"></script>


<form:form modelAttribute="VISA_OBJ">
	<table style="width:100%;  table-layout:fixed;background-color: #DFE0DC; border: 3px solid #000000; border-collapse: collapse" >
		<c:forEach var="visaDocObj" items="${VISA_OBJ.visaDocumentEntityList}">
			<tr><td style="width:20%;">${visaDocObj.visaDocId}</td>
			<td style="width:40%;">${visaDocObj.documentTitle}</td>
			<td style="width:40%;">${visaDocObj.description}</td>
			</tr>
		</c:forEach>
	</table>	
</form:form>
   