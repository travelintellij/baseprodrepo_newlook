<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

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
  width: 190px;
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
  margin-left: 220px; /* Same width as the sidebar + left position in px */
  font-size: 28px; /* Increased text to enable scrolling */
  padding: 0px 10px;
  position: absolute;
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
  //margin: 5px auto;
  background: white;
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
  font-size: 15px;
}
tr {
  border-bottom: 1px solid #cccccc;
}

td {
  border-right: 1px solid #cccccc;
  height: 30px;
  padding: 5px;
  transition: all 0.2s;
  text-align: center;
  font-size: 15px;
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
  <a href="view_form_my_profile" >My Profile</a>
  <a href="view_form_change_password" >Change Password</a>
  <a href="view_form_manage_permissions" style="background-color: #2E3F50;">Permissions</a>
  <a href="#">Email Settings</a>
</div>

<div class="main">
<br><br>
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	
		<c:forEach items="${ROLE_OBJ}" var="roleMap">
			<c:if test="${(roleMap.key ne 'PRIV')}">
				<h3 align="center"><b>${roleMap.key}</b></h3>
				<table style="width: 90%;">
					<tr>
						<th style="background-color:green;width:9%;">User</th>
						<c:forEach var="roleList" items="${roleMap.value}">
							<th style="width:9%;">${roleList.roleName}</th>
						</c:forEach>
						
						<c:forEach var = "i" begin = "${roleMap.value.size()}" end = "8">
        					 <th style="width:9%;">&nbsp;</th>
      					</c:forEach>
        					  
      						
						
						<th>Action</th>
					</tr>
						
						<c:forEach var="user" items="${ACTIVE_USERS_LIST}">
							<c:if test = "${! fn:containsIgnoreCase(user.roles, 'ADMIN')}">
								<form:form action="update_update_user_permissions" modelAttribute="USER_OBJ">
								<input type="hidden" name="userId" value="${user.userId}" />
								<input type="hidden" name="roleName" value="${roleMap.key}" />
								<tr>
										<td style="width:9%;">${user.username}</td>
										<c:forEach var="roleList" items="${roleMap.value}">
											<c:if test = "${fn:containsIgnoreCase(user.roles, roleList.roleName)}">
												<td style="width:9%;">
												 	<form:checkbox path="roles" value="${roleList.roleId}" checked="checked" />
												</td>
											</c:if>
											<c:if test = "${! fn:containsIgnoreCase(user.roles, roleList.roleName)}">
												<td style="width:9%;"><form:checkbox path="roles" value="${roleList.roleId}" /></td>
											</c:if>
										</c:forEach>
										<c:forEach var = "i" begin = "${roleMap.value.size()}" end = "8">
        									 <td style="width:9%;">&nbsp;</td>
      									</c:forEach>
        				
									 	<td style="width:9%;"><input type="submit" style="background-color: blue;padding: 4px 5px;"value="Update Permission" /></td>
									
									</tr>
								</form:form>
							</c:if>
						</c:forEach>
						
						
					</table>
					<hr>
			</c:if>
			</c:forEach>
	
  
</div>  

</body>
</html> 

<%--<form:checkboxes title="Assigned Roles:" path="roles" id="roles" items="${roleMap.value}" itemLabel="roleName" itemValue="roleId" />** --%>
<%-- <input type="checkbox" name="roles" value="${roleList.roleName}" checked></input>--%>
