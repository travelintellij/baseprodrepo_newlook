<!DOCTYPE html>
<html>
<jsp:include page="../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>


<style>
table {
  width: 100%;
  height: 20px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 3px auto;
  background: white;
}

th {
  background: green;
  height: 30px;
  width: 10%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: white;
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
input[type=button], input[type=submit], input[type=reset] {
  background-color: green;
  border: none;
  color: white;
  padding: 10px 20px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}


</style>
<br>
<h2 align="center">Reminder Service Overview</h2>
<body>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<form:form modelAttribute="REMINDER_SERVICE" action="send_send_leadReminder">
	<form:hidden path = "leadsRecorderObj.leadId" />
	<form:hidden path = "leadsRecorderObj.contactName" />
	<form:hidden path = "smsVo.to" />
	<form:hidden path = "smsVo.message" />
	
	<form:hidden path = "bothSmsAndEmailReminder" />
	<form:hidden path = "smsReminder" />
	<form:hidden path = "emailReminder" />
	
	<hr>
	<table>
		<tr>
		<th>Lead Id </th><td align="center">Q-${String.format("%04d",REMINDER_SERVICE.leadsRecorderObj.leadId)}-${REMINDER_SERVICE.leadsRecorderObj.leadSourceShortName }</td>
		<th>Is Qualified</th><td style="text-align:center;"><label class="container" style="display: table;margin: 0 auto;margin-bottom: 25px;"><form:checkbox path="leadsRecorderObj.qualified" disabled="true" /><span class="checkmark"></span></label></td>
		<th>Is Flagged</th>
		<td style="text-align:center;">
			<label class="container" style="display: table;margin: 0 auto;margin-bottom: 25px;">
				<form:checkbox path="leadsRecorderObj.flagged" disabled="true" />
				<span class="checkmark"></span>
			</label>
		</td>
		<th>Client</th>
		<td>
			${REMINDER_SERVICE.leadsRecorderObj.contactName}
			
		</td>
			<th>Lead Owner</th><td style="background-color:#66ff00;"><b>${REMINDER_SERVICE.leadsRecorderObj.leadOwnerName}</b></td>	
		</tr>
		<tr>
			<th>Source</th>
			<td>
				${REMINDER_SERVICE.leadsRecorderObj.sourceName}
			</td>
			<th>Destination</th>
			<td>
				${REMINDER_SERVICE.leadsRecorderObj.destinationName}
			</td>
			<th>Adults </th><td>${REMINDER_SERVICE.leadsRecorderObj.adults}</td>
			<th>Children</th><td>${REMINDER_SERVICE.leadsRecorderObj.children}</td>
			<th>Age</th><td>${REMINDER_SERVICE.leadsRecorderObj.childrenAgeInfo}</td>
		</tr>
		<tr>
			<th>Lead Source</th>
			<td align="center">
				${REMINDER_SERVICE.leadsRecorderObj.leadSourceName}
			</td>
			<th>Travel Date</th><td><fmt:formatDate value="${REMINDER_SERVICE.leadsRecorderObj.travelStartDate}" pattern="dd-MM-yyyy" /></td>
			<th>Travel End Date</th><td><fmt:formatDate value="${REMINDER_SERVICE.leadsRecorderObj.travelEndDate}" pattern="dd-MM-yyyy" /></td>
			<th>Tentative Amount</th><td>${REMINDER_SERVICE.leadsRecorderObj.tentativeCost}</td>
			<th>Status</th>
			<td align="center">${REMINDER_SERVICE.leadsRecorderObj.statusName}</td>
		</tr>
	</table>
	
	<table>
		<tr style="background-color:#FFD633;">
			<th>Select Services</th>
			<td style="text-align:left;">
				<label class="container" style="display:inline;" colspan="2"><form:checkbox path="leadsRecorderObj.landPackage" name="landPackage;" disabled="true" /> <span class="checkmark"></span></label>Package 	
			</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="leadsRecorderObj.flight" name="flight" disabled="true" /><span class="checkmark"></span></label> Flight</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="leadsRecorderObj.hotel" name="hotel" disabled="true" /><span class="checkmark"></span></label> Hotel</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="leadsRecorderObj.transfers" name="transfers" disabled="true" /><span class="checkmark"></span></label> Transfers</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="leadsRecorderObj.sightseeing" name="sightseeing" disabled="true" /><span class="checkmark"></span></label>SightSeeing</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="leadsRecorderObj.visa" name="visa" disabled="true" /><span class="checkmark"></span></label>Visa</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="leadsRecorderObj.insurance" name="insurance" disabled="true" /><span class="checkmark"></span></label>Insurance</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="leadsRecorderObj.cruise" name="cruise" disabled="true" /><span class="checkmark"></span></label>Cruise</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="leadsRecorderObj.others" name="others" disabled="true" /><span class="checkmark"></span></label>Others</td>
		</tr>
	</table><br>
	
	<table style="width:80%;">
	<tr>
		<td style="vertical-align: top;">
			<table >
			<tr>
				<th style="background-color:blue;height: 40px;width: 10%;">Reminder History</th>
			</tr>
			<tr>
				<td>
					<table>
						<tr ><th style="background-color:blue;">S.No.</th><th style="background-color:blue;">SMS</th><th style="background-color:blue;">Email</th><th style="background-color:blue;">Reminder DateTime</th></tr>
						<c:set var="count" value="${LEADS_REMINDER_RECORDS.size()+1}" scope="page" />
						<c:forEach items="${LEADS_REMINDER_RECORDS}" var="leadReminderRecorder">
							<tr>
								<td>${count=count-1}</td>
								<td>${leadReminderRecorder.smsSent}</td>
								<td>${leadReminderRecorder.emailSent}</td>
								<td><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" pattern="dd-MM-yyyy" value="${leadReminderRecorder.createdAt}" /></td>
							</tr>	
						</c:forEach>
					</table>
				</td>
			</tr>
			</table>
		</td>
		<td style="vertical-align: top;width:70%;">
			<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Failure}</font> </b></div>
		</td>
		</tr>
		</table>
	</form:form>		
 </body>
  
</html>
  