<jsp:include page="../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
	<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
	<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
	<meta name="viewport" content="width=device-width, initial-scale=1">
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
  position: fixed;
  top: 170px;
  z-index: 0;
}


@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
a:hover, a:active {
  background-color: lightblue;
}
#img th,tr, td {
    border: 1px solid #38678f;
    border-spacing: 0px;
    border-collapse: collapse;
    text-align:left;
    padding: 15px;
    background-color: #fff;
}
 th, td {
    font-size: 18px;
    border: 1px solid #38678f;
   	border-collapse: collapse;
   	padding: 15px;
  }

th{
	background-color: lightgray;
}

table {
    border: 1px solid transparent;
  	width: 30%;
  	height: 60px;
  	border: 1px solid #38678f;
    border-collapse: collapse;
 	background: white;
  	table-layout: fixed;
	padding: 15px;

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
<br>
<br>
<br>
<br>
<br>
<br>
<div class="sidenav">
  	<a href="view_create_task_form_user">Create Task</a>
  	<c:if test="${VIEW_SOURCE eq 'OPEN_TASK'}">
  		<a href="view_open_task_form_user" style="background-color: #2E3F50;">Open Task</a>
  	</c:if>
  	<c:if test="${VIEW_SOURCE ne 'OPEN_TASK'}">
  		<a href="view_open_task_form_user">Open Task</a>
  	</c:if>
	<c:if test="${VIEW_SOURCE eq 'DUE_TODAY'}">
  		<a href="view_open_task_form_user_filter_due_today" style="background-color: #2E3F50;">Due Today</a>
  	</c:if>
	<c:if test="${VIEW_SOURCE ne 'DUE_TODAY'}">
  		<a href="view_open_task_form_user_filter_due_today">Due Today</a>
  	</c:if>

	<c:if test="${VIEW_SOURCE eq 'OVER_DUE'}">
  		<a href="view_open_task_form_user_filter_overdue" style="background-color: #2E3F50;">Over Due</a>
  	</c:if>
	<c:if test="${VIEW_SOURCE ne 'OVER_DUE'}">
  		<a href="view_open_task_form_user_filter_overdue">Over Due</a>
  	</c:if>

	<c:if test="${VIEW_SOURCE eq 'MY_CREATED'}">
  		<a href="view_open_my_created_task_form_user" style="background-color: #2E3F50;">Created By Me</a>
  	</c:if>
	<c:if test="${VIEW_SOURCE ne 'MY_CREATED'}">
  		<a href="view_open_my_created_task_form_user">Created By Me</a>
  	</c:if>
	<c:if test="${VIEW_SOURCE eq 'MY_ASSIGNED'}">
  		<a href="view_open_my_assigned_task_form_user" style="background-color: #2E3F50;">Assigned to me</a>
  	</c:if>
	<c:if test="${VIEW_SOURCE ne 'MY_ASSIGNED'}">
  		<a href="view_open_my_assigned_task_form_user">Assigned to me</a>
  	</c:if>
  	
  	<c:if test="${VIEW_SOURCE eq 'COMPLETED_TASK'}">
  		<a href="view_completed_task_form_user" style="background-color: #2E3F50;">Completed</a>
  	</c:if>
  	<c:if test="${VIEW_SOURCE ne 'COMPLETED_TASK'}">
  		<a href="view_completed_task_form_user">Completed</a>
  	</c:if>
  
</div>

<div class="main">
  <c:if test="${VIEW_SOURCE eq 'DUE_TODAY'}">
  	<c:set var = "action" value = "view_form_edit_due_today_task"/>
  </c:if>
  <c:if test="${VIEW_SOURCE eq 'OPEN_TASK'}">
  	  	<c:set var = "action" value = "view_form_edit_task"/>
  </c:if>

  <c:if test="${VIEW_SOURCE eq 'OVER_DUE'}">
  	  	<c:set var = "action" value = "view_form_edit_over_due_task"/>
  </c:if>

 <c:if test="${VIEW_SOURCE eq 'MY_CREATED'}">
  	  	<c:set var = "action" value = "view_form_edit_my_created_task"/>
  </c:if>

 <c:if test="${VIEW_SOURCE eq 'MY_ASSIGNED'}">
  	  	<c:set var = "action" value = "view_form_edit_my_assigned_task"/>
  </c:if>

 <c:if test="${VIEW_SOURCE eq 'COMPLETED_TASK'}">
  	  	<c:set var = "action" value = "view_form_edit_completed_task"/>
  </c:if>

<br><br>
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
  <form:form action="view_form_edit_task" modelAttribute="TASK_RECORDER_OBJ">
  <form:hidden path = "taskId" />
  <table style="width:80%;">
  <tr>
  <td>
  
  
  <table style="width:100%;">
	<tr>
		<th colspan="2">Task Title*</th>
	</tr>
	<tr>
  		<td colspan="2">
			${TASK_RECORDER_OBJ.taskTitle}  
  		</td>
	</tr>
	<tr>
	<th> Assigned To* </th><th>Priority*</th>
	</tr>
	<tr>
	<td>
		${TASK_RECORDER_OBJ.taskOwnerName}	
	</td>
	<td>
			${TASK_RECORDER_OBJ.taskPriority}
	</td>
	</tr>
	<tr>
		<th>Status*</th><th>Due Date*</th>
	</tr>
	<tr>
		<td>
			${TASK_RECORDER_OBJ.taskStatus}
		</td>
	<td>
		${localDateTimeFormat.format(TASK_RECORDER_OBJ.taskDueDate)}		
	</td>
	</tr>
	<tr>
		<th colspan="2">Link With Deal</th>
	</tr>
	<tr>
		<td colspan="2">
			<c:if test="${TASK_RECORDER_OBJ.dealConfirmationId != 0}">
				${TASK_RECORDER_OBJ.dealConfirmationId}
			</c:if>
		</td>
	</tr>
	<tr>
	<th colspan="2"> Description </th>
	</tr>
	<tr>
	<td colspan="2">
			${TASK_RECORDER_OBJ.taskDescription}
	</td>
	</tr>
	<tr>
		<td style="text-align:right;">
				<input style="width: 80px; background-color: green" type="submit" value="Edit" name="Edit" />
		</td>
		<td style="text-align:left;">
			<c:if test="${VIEW_SOURCE eq 'OPEN_TASK'}">
				<a href="view_open_task_form_user" ><input type="button" style="width: 80px;background-color: blue;" value="Cancel"></a>
			</c:if>
			<c:if test="${VIEW_SOURCE eq 'DUE_TODAY'}">
				<a href="view_open_task_form_user_filter_due_today" ><input type="button" style="width: 80px;background-color: blue;" value="Cancel"></a>
			</c:if>
			<c:if test="${VIEW_SOURCE eq 'OVER_DUE'}">
				<a href="view_open_over_due_task_form_user" ><input type="button" style="width: 80px;background-color: blue;" value="Cancel"></a>
			</c:if>
			<c:if test="${VIEW_SOURCE eq 'MY_CREATED'}">
				<a href="view_open_my_created_task_form_user" ><input type="button" style="width: 80px;background-color: blue;" value="Cancel"></a>
			</c:if>
			<c:if test="${VIEW_SOURCE eq 'MY_ASSIGNED'}">
				<a href="view_open_my_assigned_task_form_user" ><input type="button" style="width: 80px;background-color: blue;" value="Cancel"></a>
			</c:if>
			<c:if test="${VIEW_SOURCE eq 'COMPLETED_TASK'}">
				<a href="view_completed_task_form_user" ><input type="button" style="width: 80px;background-color: blue;" value="Cancel"></a>
			</c:if>
		</td>
	</tr>
  </table>
  </td>
  <td>
  	<table style="width:100%;">
	  		<tr><th>${pageContext.request.remoteUser} Says:</th></tr>
  			<tr><td> <textarea cols="60" rows="4" name="taskComment" style="font-size: 18px;"></textarea></td></tr>
  			<tr><td style="text-align:right;"><input style="width: 180px; background-color: green" type="submit" value="Update Comments" name="Update Comments" /></td></tr>
  		</table>
  		<table style="width:100%;">
  			<c:forEach items="${FILTERED_TASK_COMMENTS}" var="filteredTaskComments">
	  			<tr>
		  			<th style="background-color:lightblue;">${filteredTaskComments.commentedBy}</th>
		  			<th style="background-color:lightblue;">${localDateTimeFormat.format(filteredTaskComments.lastUpdated )}</th>
	  			</tr>
	  			<tr><td colspan="2">${filteredTaskComments.ttComment }</td></tr>
  			</c:forEach>
  			<tr>
  			<td colspan="2">
  			 <div id="pagination" align="right">
				Page: 
			    <c:url value="view_view_task" var="prev">
			       <c:param name="page" value="${page-1}"/>
			    </c:url>
			    <c:if test="${page > 0}">
			        <a href="<c:out value="${prev}&taskId=${TASK_RECORDER_OBJ.taskId}"/>" class="pn prev">Prev</a>
			    </c:if>
			
			    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
			        <c:choose>
			            <c:when test="${(page+1) == i.index}">
			                <span>${i.index}</span>
			            </c:when>
			            <c:otherwise>
			                <c:url value="view_view_task" var="url">
			                    <c:param name="page" value="${i.index-1}"/>
			                </c:url>
			                 <a href='<c:out value="${url}&taskId=${TASK_RECORDER_OBJ.taskId}" />'>${i.index}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:url value="view_view_task" var="next">
			        <c:param name="page" value="${page + 1}"/>
			    </c:url>
			    <c:if test="${page + 1 < maxPages}">
			       <a href='<c:out value="${next}&taskId=${TASK_RECORDER_OBJ.taskId}" />' class="pn next">Next</a>
			    </c:if>
			</div>
			</td>
			</tr>
  		</table>
  		
	</td>
	</tr>
  		
  	</table>
  
  </form:form>
  
</div>  
</body>
</html> 