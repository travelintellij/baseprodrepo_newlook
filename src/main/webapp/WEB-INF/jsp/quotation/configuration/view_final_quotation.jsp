<!DOCTYPE html>
<html>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>
<body>
<form:form modelAttribute="MANUAL_CNF" action="create_update_generate_manual_configuration_quotation">

<%@ include file="subcomponents/_qtn_header_config.jsp" %>
<hr>
<c:if test="${QTN_OBJ.flight eq true}">
	<%@ include file="subcomponents/_qtn_flight_config.jsp" %>
</c:if>
<c:if test="${QTN_OBJ.hotel eq true}">
	<%@ include file="subcomponents/_qtn_hotel_config.jsp" %>
</c:if>
 
<c:if test="${QTN_OBJ.transfers eq true}">
	<%@ include file="subcomponents/_qtn_transfers_config.jsp" %>
</c:if>

<c:if test="${QTN_OBJ.sightseeing eq true}">
	<%@ include file="subcomponents/_qtn_sightseeing_config.jsp" %>
</c:if>

<c:if test="${QTN_OBJ.visa eq true}">
	<%@ include file="subcomponents/_qtn_visa_config.jsp" %>
</c:if>

<c:if test="${QTN_OBJ.insurance eq true}">
	<%@ include file="subcomponents/_qtn_insurance_config.jsp" %>
</c:if>

<c:if test="${QTN_OBJ.cruise eq true}">
	<%@ include file="subcomponents/_qtn_cruise_config.jsp" %>
</c:if>

<c:if test="${QTN_OBJ.tourPackage eq true}">
<%@ include file="subcomponents/_qtn_tourpackage_config.jsp" %>
</c:if>

<c:if test="${QTN_OBJ.others eq true}">
<%@ include file="subcomponents/_qtn_others_config.jsp" %>
</c:if>




<c:if test="${not empty MANUAL_CNF.remarks }">
<table style="width:100%;" >
	<tr><th>Remarks</th></tr>
	<tr>
	<td>
	<p align="left" style="white-space: pre-line">${MANUAL_CNF.remarks}</p>
	</td>
	</tr>
</table>

</c:if>
<%@ include file="subcomponents/_qtn_costing_config.jsp" %>
<%@ include file="subcomponents/_qtn_tnc_config.jsp" %>
<p align="right">
    <a href="send_whatsapp_quotation?leadId=${LEAD_OBJ.leadId}&quotationId=${QTN_OBJ.quotationId}" style="text-decoration:none;">
        <input type="button" value="Share on WhatsApp" style="background:#25D366; color:white; border:none; padding:5px 10px; cursor:pointer; border-radius:3px;"/>
    </a>
    <input type="button" id="Printbox" value="print" onclick="javascript:window.print();" /> 
</p>
</form:form> 



</body>
</html>
  