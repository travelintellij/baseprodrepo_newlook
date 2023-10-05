<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<jsp:include page="../../menu/MenuBuilder.jsp" />

<style>
table {
  width: 100%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
}

th {
  background: #7B68EE;
  height: 40px;
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

	<center>
		<h2><br>Search User</h2>
	</center>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>

	<form:form modelAttribute="SEARCH_USER" action="search_search_filtered_User">
			<table style="width: 90%; ">
			<tr >
				<td style="height:30px"><img src="${pageContext.request.contextPath}/resources/images/filter.jpg" height="50" width="50"/></td>
				<td style="height:30px">
					<input type="number" class="contact" id="userId" name="userId" placeholder="userId" style="height:30px;width:70px;" value="${SEARCH_USER.userId}" />
				</td>
				<td style="height:30px">
					<input type="text" class="contact" id="username" name="username" value="" size="35" placeholder="username" value="${SEARCH_USER.username}" />
				</td>
				<td style="height:30px">
					<input type="text" class="contact" id="name" name="name"  size="35" placeholder="Name" value="${SEARCH_USER.name}" />
				</td>
				
	        <td>
	        	<b>Joining Date Range</b>
	        </td>
	        <td><input type="date" name="joiningFromDate" value="${SEARCH_USER.joiningFromDate}" /></td>
	        <td><input type="date" name="joiningToDate" value="${SEARCH_USER.joiningToDate}" /></td>
 			<td style="height:30px"><input style="background-color:red;" type="submit" value="Apply Filter" /> </td>
			<td style="height:30px"><a href="view_search_admin_user"><input type="button" value="Clear Filter" /></a></td>
			</tr>
		</table>
				
	</form:form>
		<c:set value="${USERS_LIST}" var="userList" />
		<table>
			<tr>
				<th style="width:10%;">Id</th>
				<th style="width:10%;">User Id</th>
				<th style="width:15%;">User Name</th>
				<th style="width:15%;">Date of Joining</th>
				<th style="width:15%;">Designation</th>
				<th style="width:10%;">Role</th>
				<th style="width:10%;">Active</th>
				<th style="width:15%;">Action</th>
			</tr>
			<c:forEach items="${userList}" var="user">
				<tr>
				<td style="width:10%;">${user.userId}</td>
				<td style="width:10%;">${user.username}</td>
				<td style="width:15%;">${user.name}</td>
				<td style="width:15%;"><fmt:formatDate value="${user.doj}" pattern="dd-MM-yyyy" /></td>
				<td style="width:15%;">${user.designation}</td>
				<td style="width:10%;">
					<c:if test = "${fn:containsIgnoreCase(user.roles, 'ADMIN')}">
						Admin
					</c:if>
					<c:if test = "${!fn:containsIgnoreCase(user.roles, 'ADMIN')}">
						User
					</c:if>
				
				</td>
				
				<td style="width:10%;">${user.active}</td>
				<td style="width:15%;">
					<sec:authorize access="hasAnyRole('ADMIN','USER_VIEW','USER_EDIT','USER_DELETE')">
						<a href="view_view_Admin_User?userId=${user.userId}"><input type="button" style="background-color: green;padding: 4px 5px;"value="View" /></a> 
					</sec:authorize> 
					

					<sec:authorize access="hasAnyRole('ADMIN','USER_EDIT')">
							<c:choose>
								<c:when test = "${(!fn:containsIgnoreCase(LOGGED_USER.roles, 'ADMIN')) and (user.userId eq LOGGED_USER.userId)}">
									 | <a href="view_edit_Admin_User?userId=${user.userId}"><input type="button" style="background-color: #dddddd;padding: 4px 5px;"value="Edit" disabled/></a>
								</c:when>
								<c:when test = "${fn:containsIgnoreCase(LOGGED_USER.roles, 'ADMIN')}">
									| <a href="view_edit_Admin_User?userId=${user.userId}"><input type="button" style="background-color: blue;padding: 4px 5px;" value="Edit" /></a>
								</c:when>
								<c:when test = "${ (! fn:containsIgnoreCase(LOGGED_USER.roles, 'ADMIN') and fn:containsIgnoreCase(user.roles, 'ADMIN'))}">
									| <a href="view_edit_Admin_User?userId=${user.userId}"><input type="button" style="background-color: #dddddd;padding: 4px 5px;"value="Edit" disabled/></a>
								</c:when>
								<c:when test = "${ (! fn:containsIgnoreCase(LOGGED_USER.roles, 'ADMIN') and (!fn:containsIgnoreCase(user.roles, 'ADMIN')))}">
									| <a href="view_edit_Admin_User?userId=${user.userId}"><input type="button" style="background-color: blue;padding: 4px 5px;" value="Edit" /></a>
								</c:when>
								<c:otherwise>
									| <a href="view_edit_Admin_User?userId=${user.userId}"><input type="button" style="background-color: blue;padding: 4px 5px;" value="Edit" /></a>
								</c:otherwise>
							</c:choose>
					</sec:authorize> 
					<sec:authorize access="hasAnyRole('ADMIN','USER_DELETE')">
						<c:if test="${user.userId ne LOGGED_USER.userId }">
							 <c:choose>
								<c:when test = "${ (! fn:containsIgnoreCase(LOGGED_USER.roles, 'ADMIN') and fn:containsIgnoreCase(user.roles, 'ADMIN'))}">
									| <a href="view_view_delete_User_confirmation?userId=${user.userId}"><input type="button" style="background-color: #dddddd;padding: 4px 5px;" value="Delete" disabled /></a>
								</c:when>
								<c:when test = "${ (! fn:containsIgnoreCase(LOGGED_USER.roles, 'ADMIN') and (!fn:containsIgnoreCase(user.roles, 'ADMIN')))}">
									| <a href="view_view_delete_User_confirmation?userId=${user.userId}"><input type="button" style="background-color: red;padding: 4px 5px;" value="Delete" /></a>
								</c:when>
								<c:when test = "${ user.deleted eq true }">
									| <font color="red" >Deleted</font>
								</c:when>
								<c:otherwise>
									| <a href="view_view_delete_User_confirmation?userId=${user.userId}"><input type="button" style="background-color: red;padding: 4px 5px;" value="Delete" /></a>
								</c:otherwise>
							</c:choose>
						</c:if>
						
						<c:if test="${user.userId eq LOGGED_USER.userId }">
							| <a href="view_view_delete_User_confirmation?userId=${user.userId}"><input type="button" style="background-color: #dddddd;;padding: 4px 5px;"value="Delete" disabled /></a> 
						</c:if>
					</sec:authorize>

					<sec:authorize access="hasAnyRole('ADMIN','USER_MANAGE_DOCS')">
						| <a href="view_view_crud_user_docs?userId=${user.userId}"><input type="button" style="color:black;background-color: #FFDF00;padding: 4px 5px;"value="Docs" /></a>
					</sec:authorize>
					
				</td>
				</tr>
			</c:forEach>
		</table>
 
  
  </html>
  