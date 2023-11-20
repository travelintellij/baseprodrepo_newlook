<jsp:include page="../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
	<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	
	<!-- Following code is for managing the jquery date time picker.  -->	
	<link href="<c:url value="/resources/css/jquery.datetimepicker.min.css" />" rel="stylesheet">
	<script src="<c:url value="/resources/js/jquery.datetimepicker.full.js" />"></script>
	
<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  width: 170px;
  position: relative;
  z-index: 0;
  top: 50px;
  left: 10px;
  background: #eee;
  overflow-x: hidden;
  padding: 8px 0;
}

.sidenav a {
  padding: 10px 8px 10px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #2196F3;
  display: block;
}

.sidenav a:hover {
  color: #064579;
}

.main {
  margin-left: 450px; /* Same width as the sidebar + left position in px */
  font-size: 28px; /* Increased text to enable scrolling */
  padding: 0px 10px;
  position: absolute;
  top: 160px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
a:hover, a:active {
  background-color: lightblue;
}
#img table,th,tr, td {
    border: 1px solid transparent;
    border-spacing: 0px;
    border-collapse: collapse;
    text-align:left;
    padding: 5px;
}
 th, td {
    font-size: 18px;
  }

.search-slt{
    display: block;
    width: 50%;
    font-size: 0.875rem;
    line-height: 1.5;
    color: #55595c;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    height: 45px !important;
    border-radius:0;
}
select {
	appearance: none;
	outline: 0;
	background: lightgreen;
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
</head>
<body>

<div class="sidenav">
    <a href="view_create_ticket_form_user">Create Ticket</a>
  	<c:if test="${VIEW_SOURCE eq 'OPEN_TICKET'}">
  		<a href="view_open_ticket_form_user" style="background-color: #2E3F50;">Open Ticket</a>
  	</c:if>
  	<c:if test="${VIEW_SOURCE ne 'OPEN_TICKET'}">
  		<a href="view_open_ticket_form_user">Open Ticket</a>
  	</c:if>
	<c:if test="${VIEW_SOURCE eq 'DUE_TODAY'}">
  		<a href="view_open_ticket_form_user_filter_due_today" style="background-color: #2E3F50;">Due Today</a>
  	</c:if>
	<c:if test="${VIEW_SOURCE ne 'DUE_TODAY'}">
  		<a href="view_open_ticket_form_user_filter_due_today">Due Today</a>
  	</c:if>

	<c:if test="${VIEW_SOURCE eq 'OVER_DUE'}">
  		<a href="view_open_ticket_form_user_filter_overdue" style="background-color: #2E3F50;">Over Due</a>
  	</c:if>
	<c:if test="${VIEW_SOURCE ne 'OVER_DUE'}">
  		<a href="view_open_ticket_form_user_filter_overdue">Over Due</a>
  	</c:if>

	<c:if test="${VIEW_SOURCE eq 'MY_CREATED'}">
  		<a href="view_open_my_created_ticket_form_user" style="background-color: #2E3F50;">Created By Me</a>
  	</c:if>
	<c:if test="${VIEW_SOURCE ne 'MY_CREATED'}">
  		<a href="view_open_my_created_ticket_form_user">Created By Me</a>
  	</c:if>
  
  	<c:if test="${VIEW_SOURCE eq 'MY_ASSIGNED'}">
  		<a href="view_open_my_assigned_ticket_form_user" style="background-color: #2E3F50;">Assigned to me</a>
  	</c:if>
	<c:if test="${VIEW_SOURCE ne 'MY_ASSIGNED'}">
  		<a href="view_open_my_assigned_ticket_form_user">Assigned to me</a>
  	</c:if>
  
  	<c:if test="${VIEW_SOURCE eq 'COMPLETED_TICKET'}">
  		<a href="view_completed_ticket_form_user" style="background-color: #2E3F50;">Completed</a>
  	</c:if>
	<c:if test="${VIEW_SOURCE ne 'COMPLETED_TICKET'}">
  		<a href="view_completed_ticket_form_user">Completed</a>
  	</c:if>
  
</div>

<div class="main">
  <div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
  
  <c:if test="${VIEW_SOURCE eq 'DUE_TODAY'}">
  	<c:set var = "action" value = "edit_edit_due_today_ticket_form_user"/>
  </c:if>

  <c:if test="${VIEW_SOURCE eq 'OPEN_TICKET'}">
  	  	<c:set var = "action" value = "edit_edit_ticket_form_user"/>
  </c:if>
  <c:if test="${VIEW_SOURCE eq 'OVER_DUE'}">
  	  	<c:set var = "action" value = "edit_edit_over_due_ticket_form_user"/>
  </c:if>
  <c:if test="${VIEW_SOURCE eq 'MY_CREATED'}">
  	  	<c:set var = "action" value = "edit_edit_my_created_ticket_form_user"/>
  </c:if>
  <c:if test="${VIEW_SOURCE eq 'MY_ASSIGNED'}">
  	  	<c:set var = "action" value = "edit_edit_my_assigned_ticket_form_user"/>
  </c:if>

  <c:if test="${VIEW_SOURCE eq 'COMPLETED_TICKET'}">
  	  	<c:set var = "action" value = "edit_edit_completed_ticket_form_user"/>
  </c:if>
  
  <br><br>
  <form:form action="${action}" modelAttribute="TICKET_RECORDER_OBJ">
  <div align="center"><font color="red">
	<b>
		<form:errors path="dealName" /><br>
	</b>
	</font>
 </div>
  
  <form:hidden path = "ticketId" />
  <table>
	<tr>
		<th colspan="2">Ticket Title*</th>
	</tr>
	<tr>
  		<td colspan="2">
			<form:input path="ticketTitle" class="form-control search-slt" name="taskTitle" style="height:30px;width:450px;" required="required" /><br>
  		</td>
	</tr>
	<tr>
	<th> Assigned To* </th><th>Priority*</th>
	</tr>
	<tr>
	<td>
		<div class="select">
			<form:select path="ticketOwner" style="width: 150px;" min="1" required="required">  
		       <option class="service-small" value=""> -----Select User----</option>
		       <form:options items = "${ACTIVE_USERS_MAP}" class="service-small"/>
	        </form:select>  
		</div>
	</td>
	<td>
		<div class="select">
			<form:select path="ticketPriority" style="width: 180px;" min="1" required="required">  
		       <option class="service-small" value=""> -----Select User----</option>
		       <form:options items = "${TICKET_PRIORITY_MAP}" class="service-small"/>
	        </form:select>  
		</div>
	</td>
	</tr>
	<tr>
		<th>Status*</th><th>Due Date*</th>
	</tr>
	<tr>
		<td>
			<div class="select">
				<form:select path="ticketStatus" style="width: 150px;">  
			       <form:options items = "${TICKET_STATUS}" class="service-small"/>
		        </form:select>  
			</div>
	</td>
	<td>
		<!-- 
		<input style="height: 30px; width: 180px;" type="datetime-local" name="ticketDueDate" value="${TICKET_OBJ.ticketDueDate }" required />
		 -->
		<fmt:parseDate value="${TICKET_RECORDER_OBJ.ticketDueDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both" />
		<fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${ parsedDateTime }" var="parsedDate" />
		 
		 
		<input style="height: 30px; width: 180px;" id="ticketDueDate" name="ticketDueDate" value="${parsedDate}" required />
		
	</td>
	</tr>
	<tr>
		<th colspan="2">Link With Client*</th>
	</tr>
	<tr>
		<td colspan="2">
			<form:input path="clientName" name="clientName" class="form-control search-slt" style="height:30px;width:450px;"/><br>
			<form:hidden path = "clientId" />
		<font color="red"> <form:errors path="clientName" cssClass="error" /></font>
		</td>
	</tr>
	
	<tr>
		<th colspan="2">Link With Deal</th>
	</tr>
	<tr>
		<td colspan="2">
			<form:input path="dealName" name="dealName" class="form-control search-slt" style="height:30px;width:450px;" placeholder="Deal Search - Enter Only numeric Deal # or Client Name " /><br>
			<form:hidden path = "dealConfirmationId" />
		</td>
	</tr>
	<tr>
	<th colspan="2"> Description </th>
	</tr>
	<tr>
	<td colspan="2">
		<form:textarea path = "ticketDescription" rows="6" cols="70"  maxlength="1100"/>
	</td>
	</tr>
	<tr>
		<th>Inform Client </th><td><input type="checkbox" name="notifyTicketOwner" checked />
		<i><font size="2">(if checked email will be sent to client with Ticket Title and status only)</font></i>
		</td>
	</tr>
	
	<tr>
		<td style="text-align:right;">
				<input style="width: 80px; background-color: green" type="submit" id="Update" value="Update" />
		</td>
		<td style="text-align:left;">
			<c:if test="${VIEW_SOURCE eq 'OPEN_TICKET'}">
				<a href="view_open_ticket_form_user" ><input type="button" style="width: 80px;background-color: blue;" value="Cancel"></a>
			</c:if>
			<c:if test="${VIEW_SOURCE eq 'DUE_TODAY'}">
				<a href="view_open_ticket_form_user_filter_due_today" ><input type="button" style="width: 80px;background-color: blue;" value="Cancel"></a>
			</c:if>
			<c:if test="${VIEW_SOURCE eq 'OVER_DUE'}">
				<a href="view_open_over_due_ticket_form_user" ><input type="button" style="width: 80px;background-color: blue;" value="Cancel"></a>
			</c:if>
			<c:if test="${VIEW_SOURCE eq 'MY_CREATED'}">
				<a href="view_open_my_created_ticket_form_user" ><input type="button" style="width: 80px;background-color: blue;" value="Cancel"></a>
			</c:if>
			<c:if test="${VIEW_SOURCE eq 'MY_ASSIGNED'}">
				<a href="view_open_my_assigned_ticket_form_user" ><input type="button" style="width: 80px;background-color: blue;" value="Cancel"></a>
			</c:if>

			<c:if test="${VIEW_SOURCE eq 'COMPLETED_TICKET'}">
				<a href="view_completed_ticket_form_user" ><input type="button" style="width: 80px;background-color: blue;" value="Cancel"></a>
			</c:if>

		</td>
	</tr>
  </table>
  </form:form>
  
</div>  
<script>
$('#dealName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getDealInfo',
	paramName: "dealKeyword",
	delimiter: ",",
	onSelect: function(suggestion) {
        dealID = suggestion.data;
        id=dealID;
        jQuery("#dealConfirmationId").val(dealID);
        $('input[name=dealName]').val(id);
        return false;
    },
	transformResult: function(response) {
        return {
            suggestions: $.map($.parseJSON(response), function(item) {
            	return { value: item.tagName, data: item.id };
            })
            
        };
    }
});

$('#clientName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getClientList',
	paramName: "tagName",
	delimiter: ",",
	onSelect: function(suggestion) {
        cityID = suggestion.data;
        id=cityID;
        jQuery("#contactId").val(cityID);
        $('input[name=clientId]').val(id);
        return false;
    },
	transformResult: function(response) {
        return {
            suggestions: $.map($.parseJSON(response), function(item) {
            	return { value: item.tagName, data: item.id };
            })
            
        };
    }
});

</script>
<script>

$(document).ready(function(){
	$("#Update").on('click', function () {
	   var getValue=$("#ticketDueDate").val();
	   $('input[name=ticketDueDate]').val(getValue);
	 });
	});
	
$("#ticketDueDate").datetimepicker();

</script>

</body>
</html> 