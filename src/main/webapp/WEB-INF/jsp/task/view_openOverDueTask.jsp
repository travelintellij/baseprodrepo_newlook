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
  margin-left: 200px; /* Same width as the sidebar + left position in px */
  font-size: 28px; /* Increased text to enable scrolling */
  padding: 0px 10px;
  position: fixed;
  top: 170px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
a:hover, a:active {
  background-color: lightblue;
}
table {
  width: 100%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
  table-layout: fixed;
  padding: 10px;
    font-size: 20px;
  
}

th {
  background: #7B68EE;
  height: 30px;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
  padding: 10px;
}
tr {
  border-bottom: 1px solid #cccccc;
  padding: 10px;
}

td {
  border-right: 1px solid #cccccc;
  height: 30px;
  padding: 10px;
  transition: all 0.2s;
  text-align: center;
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
  <a href="view_create_task_form_user">Create Task</a>
  <a href="view_open_task_form_user">Open Tasks</a>
  <a href="view_open_task_form_user_filter_due_today">Due Today</a>
  <a href="view_open_over_due_task_form_user" style="background-color: #2E3F50;">Over Due</a>
  <a href="view_open_my_created_task_form_user">Created By Me</a>
  <a href="view_open_my_assigned_task_form_user">Assigned to me</a>
  <a href="view_completed_task_form_user">Completed</a>
  
</div>

<div class="main">
  <div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
  
  <br><br>
  <form:form action="view_open_over_due_task_form_user" modelAttribute="TASK_FILTER_OBJ">
  	<input type="hidden" name="dateFrom" value="${dateFrom}"/>
  	<input type="hidden" name="dateTo" value="${dateTo}" />
		<table style="width: 90%;">
			<tr >
				<td style="height:30px"><img src="${pageContext.request.contextPath}/resources/images/filter.jpg" height="40" width="40"/></td>
				<td>
						<div class="select">
						<select id = "taskOwner" name="taskOwner" style="width: 160px;" required>
							<option class="service-small"> -----Task Owner----</option>
						    <c:if test="${not empty ACTIVE_USERS_LIST}">
				        			<c:forEach items="${ACTIVE_USERS_LIST}" var="userObj">
				      					<option class="service-small" value="${userObj.userId}">${userObj.name}</option>
				   					</c:forEach>
				 			</c:if>
						</select>
						</div>
				</td>
				<td>
					<input style="width:150px;" class="form-control search-slt" type="number" name="dealConfirmationId" id="dealConfirmationId" step="0.0" placeholder="Deal Confirmation Id " />
	        	</td>
	        	<td>
	        		<div class="select">
						<select id = "taskPriority" name="taskPriority" style="width: 160px;">
							<option class="service-small" value=""> -----Task Priority----</option>
						    <c:if test="${not empty TASK_PRIORITY}">
				        			<c:forEach items="${TASK_PRIORITY}" var="priority">
				      					<option class="service-small" value="${priority}">${priority}</option>
				   					</c:forEach>
				 			</c:if>
						</select>
						</div>
	        	</td>
	        	<td style="width:27%;height:30px"><input style="background-color:red;" type="submit" value="Apply Filter" /> </td>
				<td style="width:27%;height:30px"><a href="view_open_over_due_task_form_user"><input type="button" value="Clear Filter" /></a></td>
	        	
	        
		        
			</tr>
		</table>
		<hr>
		
			<table style="width:100%;">
			<tr>
				<th style="width:10%;"><a style="color:#ffffa0;" href="view_open_over_due_task_form_user?sortBy=taskId&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Task Id</a></th>
				<th style="width:20%;">Task Title</th>
				<th style="width:10%;"><a style="color:#ffffa0;" href="view_open_over_due_task_form_user?sortBy=dealConfirmationId&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Deal Associated</a></th>
				<th style="width:15%;"><a style="color:#ffffa0;" href="view_open_over_due_task_form_user?sortBy=taskOwner&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Assigned To</a></th>
				<th style="width:10%;"><a style="color:#ffffa0;" href="view_open_over_due_task_form_user?sortBy=taskPriority&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Priority</a></th>
				<th style="width:15%;"><a style="color:#ffffa0;" href="view_open_over_due_task_form_user?sortBy=taskDueDate&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Due Date</a></th>
				<th style="width:20%;">Action</tr>
			<c:forEach items="${OPEN_TASK_LIST}" var="openTaskList">
			<tr>
				<td style="width:10%;">${openTaskList.taskId }</td>
				<td style="width:20%;">${openTaskList.taskTitle }</td>
				<td style="width:10%;">
					<c:if test="${openTaskList.dealConfirmationId != 0}">
						UDN-${openTaskList.dealConfirmationId}
					</c:if>
					<c:if test="${openTaskList.dealConfirmationId == 0}">
						None
					</c:if>
				</td>
				<td style="width:15%;"> ${openTaskList.taskOwnerName}</td>
				<td style="width:10%;">${openTaskList.taskPriority}</td>
				<td style="width:15%;"><font color="red">${localDateTimeFormat.format(openTaskList.taskDueDate)}</font></td>
				<td style="width:20%;">
					<a href="view_view_over_due_task?taskId=${openTaskList.taskId }"><input type="button" style="background-color: #786AAF;" value="View" /></a> | 
					<a href="view_form_edit_over_due_task?taskId=${openTaskList.taskId }"><input type="button" style="background-color: #786AAF;" value="Edit" /></a> | 
					<a href="view_form_delete_over_due_task?taskId=${openTaskList.taskId }"><input type="button" style="background-color: #786AAF;" value="Delete" /></a>
				</td>
				
			</tr>
			
			</c:forEach>
			</table>
				<div id="pagination" align="right">
				Page: 
			    <c:url value="view_open_over_due_task_form_user" var="prev">
			       <c:param name="page" value="${page-1}"/>
			    </c:url>
			    <c:if test="${page > 0}">
			        <a href="<c:out value="${prev}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&taskPriority=${taskPriority}" />" class="pn prev">Prev</a>
			    </c:if>
			
			    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
			        <c:choose>
			            <c:when test="${(page+1) == i.index}">
			                <span>${i.index}</span>
			            </c:when>
			            <c:otherwise>
			                <c:url value="view_open_over_due_task_form_user" var="url">
			                    <c:param name="page" value="${i.index-1}"/>
			                </c:url>
			                 <a href='<c:out value="${url}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}" />'>${i.index}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:url value="view_open_over_due_task_form_user" var="next">
			        <c:param name="page" value="${page + 1}"/>
			    </c:url>
			    <c:if test="${page + 1 < maxPages}">
			       <a href='<c:out value="${next}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&taskPriority=${taskPriority}" />' class="pn next">Next</a>
			    </c:if>
			</div>
	</form:form>
  
  
  
  
</div>  
<script>
$('#dealName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getDealInfo',
	paramName: "dealKeyword",
	delimiter: ",",
	onSelect: function(suggestion) {
        dealID = suggestion.data;
        id=cityID;
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

</script>
</body>
</html> 