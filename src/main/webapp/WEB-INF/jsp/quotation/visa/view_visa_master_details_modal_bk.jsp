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


<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<form:form modelAttribute="VISA_OBJ">
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualFlightQuotationId" value= "${MANUAL_HTL.manualHotelQuotationId}" />
	<table style="width:100%;  table-layout:fixed;background-color: #DFE0DC; border: 3px solid #000000; border-collapse: collapse" >
			<tr>
					<td colspan="2">&nbsp;</td>
					<th colspan="2" style="width:20%;">Country Name</th>
					<td colspan="2" style="width:20%; padding-bottom: 15px; vertical-align: bottom;">
						${VISA_OBJ.countryName}
					</td>
					<td colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<th style="width:10%;">Consulate City</th>
					 <td style="width:10%; padding-bottom: 5px;">${VISA_OBJ.cityName}
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
					<th style="width:10%;" colspan="4">Internal Remarks (Will never be shared with clients)</th>
					<th style="width:10%;" colspan="4">Other Costs (Like extended validity visa options)</th>
				</tr>
				
				<tr>
					<td colspan="4"><p style="white-space: pre-line"> ${VISA_OBJ.internalRemarks} </p></td>
					<td colspan="4"><p style="white-space: pre-line"> ${VISA_OBJ.otherCosts} </p></td>
				</tr>
				<tr>
					<th style="width:10%;" colspan="8">Remarks</th>
				</tr>
				<tr>
					<td colspan="8"><p style="white-space: pre-line"> ${VISA_OBJ.remarks} </p></td>
				</tr>
	</table>	
</form:form>
   