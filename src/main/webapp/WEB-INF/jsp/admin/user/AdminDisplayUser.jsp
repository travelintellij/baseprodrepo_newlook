<!DOCTYPE html>
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>
<style>
table {
	  width: 90%;
	  border-collapse: collapse;
	  border: 1px solid #38678f;
	  margin: 5px auto;
	  background: white;
	}
	
	th {
	  background: green;
	  width: 40%;
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
	input[type="radio"] {
		display: inline-block;
		opacity: 1;
		width: 1em;
		z-index: -1;
	}

select {
	appearance: none;
	outline: 0;
	background: lightblue;
	background-image: none;
	width: 80%;
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
	padding: 16px 32px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}
	</style>
</head>

<br>
<h2 align="center"> View User</h2>
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
<body>
	<form:form method="post" action="view_edit_Admin_User" modelAttribute="userobj">

		<table>
			<tr>
				<td>
					<table>
						<tr><th>Record Id</th><td>${userobj.userId}</td></tr>
						<tr><th>Login Id</th><td>${userobj.username}</td></tr>
						<tr><th>Password</th><td>Confidential (Encrypted)</td></tr>
						<tr><th	>Primary Role</th>
							<td>
									<c:if test = "${fn:containsIgnoreCase(userobj.roles, 'User')}">
										User
									</c:if> 
									<c:if test = "${fn:containsIgnoreCase(userobj.roles, 'Admin')}">
										Admin
									</c:if> 
									
							</td>
						</tr>
					</table>
				</td>
				<td>
				<table>
			        <tr><th>User Full Name </th><td>${userobj.name}</td></tr>
			        <tr><th>Address</th><td>${userobj.address}</td></tr>
			        <tr><th>Company Email</th><td> ${userobj.email}</td></tr>
			       	<tr><th>Company Mobile</th><td>${userobj.mobile}</td></tr>
				</table>
				</td>
				<td>
				<table>
			        <tr><th>Designation</th><td>${userobj.designation}</td></tr>
			        <tr><th>Type</th><td>
			        	${userobj.type}
						</td></tr>
							
		        	<tr><th>Shift</th>
		        	<td>
		        	${userobj.shift}
		        	</td></tr>
		        	<tr><th>Fixed Incentive </th><td>${userobj.fixedIncentive}</td></tr>
				</table>
				</td>
			</tr>
		</table>
		
		<table style="align: center;">
			<tr>
				<td>
				<table>
					<tr><th>Pan Card</th><td>${userobj.panCard}</td></tr>
					<tr><th>Aadhar Card</th><td>${userobj.aadharCard}</td></tr>
					<tr><th>Marial Status</th><td>${userobj.maritalStatus}</td></tr>
					<tr><th>Gender</th><td>${userobj.gender}</td></tr>
					<tr><th>Deleted</th><td>${userobj.deleted}</td></tr>
					<tr><th>Account Locked</th><td>${userobj.accountLocked}</td></tr>
					
				</table>
				</td>
				<td>
				<table>
					<tr><th>Date of Birth</th><td><fmt:formatDate value="${userobj.dob}" pattern="dd-MM-yyyy" /></td></tr>
		    		<tr><th>Date of Joining</th><td> <fmt:formatDate value="${userobj.doj}" pattern="dd-MM-yyyy" /></td></tr>
		    		<tr><th>Personal Email</th><td>${userobj.personalEmail}</td></tr>
		    		<tr><th>Personal Mobile</th><td> ${userobj.personalMobile}</td></tr>
		    		<tr><th>Active</th><td> ${userobj.active}</td></tr>
		    		<tr><th>Account Expired</th><td style="text-align:center;">${userobj.accountExpired}</td></tr>
		    		<tr><th>Credentials Expired</th><td style="text-align:center;">${userobj.credentialsExpired}</td></tr>
		    	</table>
			</td>
			</tr>
			<tr>
			<th>
			Remarks</th>
			<td colspan="2"> 
				${userobj.remarks}
			</td>
			</tr>
			<tr>
			<td colspan="3">
				<sec:authorize access="hasAnyRole('ADMIN','USER_EDIT')">
					<input type="submit" style="width: 120px;background-color: blue;" value="Edit User">
				</sec:authorize>
				
				<a href="view_workloadhome"><input type="button" style="width: 100px;background-color: blue;" value="Home"></a>
				<a href="view_search_admin_user"><input type="button" style="width: 140px;background-color: blue;" value="User Listings"></a>
			</td>
			</tr>
		</table>
	    	<input type="hidden" name="active" value="true" />
	    	<input type="hidden" name="userId" value="${userobj.userId}" />
		</form:form>
      
</body>
</html>
