<!DOCTYPE html>
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
	  background: steelblue;
//	  height: 40px;
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
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
<br>
<h2 align="center"> Edit User (Id: ${USER_OBJ.userId})</h2>
<body>
	<form:form method="post" action="edit_edit_Admin_User" modelAttribute="USER_OBJ">
		<form:hidden path = "userId" />
		<table>
			<tr>
				<td>
					<table>
						<tr><th>Login Id</th><td> <form:input path="username" maxlength="20"/> <br><font color="red"><form:errors path="username" cssClass="error" /></font></td></tr>
						<tr><th>Password</th><td><form:password path="password" showPassword="true" /> <br><font color="red"><form:errors path="password" cssClass="error" /></font></td></tr>
						<tr><th>Confirm Password </th><td><form:password path="passwordConfirm" showPassword="true"  /><br><font color="red"><form:errors path="passwordConfirm" cssClass="error" /></font></td></tr>
						<tr><th	>Role</th>
							<td>
								<c:forEach var="userRoles" items="${USER_OBJ.roles}">
									<c:if test="${userRoles.roleTarget eq 'PRIV' }">
										<c:if test="${userRoles.roleName eq 'ADMIN' }">
											<input type="radio" id="roleId" name="roleId" value="2" > User &nbsp;&nbsp;
											<input type="radio" id="roleId" name="roleId" value="1" checked> Admin
										</c:if>
										<c:if test="${userRoles.roleName eq 'USER' }">
											<input type="radio" id="roleId" name="roleId" value="2" checked> User &nbsp;&nbsp;
											<input type="radio" id="roleId" name="roleId" value="1" > Admin
										</c:if>
									</c:if>
								</c:forEach>
							</td>
						</tr>
					</table>
				</td>
				<td>
				<table>
			        <tr><th>User Full Name </th><td><form:input path="name" /> <br><font color="red"><form:errors path="name" cssClass="error" /></font></td></tr>
			        <tr><th>Address</th><td><form:textarea path = "address" rows="3" cols="50"  maxlength="250"/><br><font color="red"><form:errors path="address" cssClass="error" /></font></td></tr>
			        <tr><th>Company Email</th><td> <form:input path="email" /><br><font color="red"><form:errors path="email" cssClass="error" /></font></td></tr>
			       	<tr><th>Company Mobile</th><td><form:input path="mobile" type="number" required="required" style="height:30px;" /> <br><font color="red"><form:errors path="mobile" cssClass="error" /></font></td></tr>
				</table>
				</td>
				<td>
				<table>
			        <tr><th>Designation</th><td><form:input path="designation" /> <br><font color="red"><form:errors path="designation" cssClass="error" /></font></td></tr>
			        <tr><th>Type</th><td>
			        	 <div class="select">
			        	 <form:select path="type">  
			      			<form:options items = "${EMP_TYPE_MAP}" class="service-small" />
		        		</form:select> 
			        	
			        	
						</div>
						</td>
					</tr>
							
		        	<tr><th>Shift</th>
		        		<td>
				        	 <div class="select">
					        	 <form:select path="shift">  
					      			<form:options items = "${EMP_SHIFT_MAP}" class="service-small" />
				        		</form:select> 
							</div>
		        		</td>
		        	</tr>
		        	<tr><th>Fixed Incentive </th><td><form:input path="fixedIncentive" type="number" required="required" style="height:30px;" /> </td></tr>
				</table>
				</td>
			</tr>
		</table>
		
		<table style="align: center;">
			<tr>
				<td>
				<table>
					<tr>
						<th>Pan Card</th><td><form:input path="panCard" /> </td>
					</tr>
					<tr>
						<th>Aadhar Card</th><td><form:input path="aadharCard" /> </td>
					</tr>
					<tr>
						<th>Marital Status</th>
						<td>
							<div class="select">
								<form:select path="maritalStatus">  
					      			<form:options items = "${MARITAL_STATUS_MAP}" class="service-small" />
				        		</form:select> 
							</div>
						</td>
					</tr>
					<tr>
						<th>Gender</th>
						<td>
							<div class="select">
								<form:select path="gender">  
					      			<form:options items = "${GENDER_MAP}" class="service-small" />
				        		</form:select>
							</div>
						</td>
					</tr>
					<tr>
						<th>Deleted</th>
						<td>
							<div class="select">
								<form:select path="deleted">  
					      			<form:options items = "${ACTIVE_MAP}" class="service-small" />
				        		</form:select>
							</div>
						</td>
					</tr>
					<tr>
						<th>Account Locked</th>
						<td>
							<div class="select">
								<form:select path="accountLocked">  
					      			<form:options items = "${ACTIVE_MAP}" class="service-small" />
				        		</form:select>
							</div>
						</td>
					</tr>
				</table>
				</td>
				<td>
				<table>
					<tr><th>Date of Birth</th><td><form:input path= "dob" type="date" required="required" style="height:30px;margin: auto;"/> </td></tr>
		    		<tr><th>Date of Joining</th><td><form:input path= "doj" type="date" required="required" style="height:30px;margin: auto;"/></td></tr>
		    		<tr><th>Personal Email</th><td> <form:input path= "personalEmail" type="email" required="required" style="height:30px;margin: auto;"/></td></tr>
		    		<tr><th>Personal Mobile</th><td> <form:input path= "personalMobile" type="number" required="required" style="height:30px;margin: auto;"/></td></tr>
		    		<tr><th>Active</th>
		    		<td style="text-align:center;">
		    			<div class="select" style="display: inline-block" >
								<form:select path="active">  
					      			<form:options items = "${ACTIVE_MAP}" class="service-small" />
				        		</form:select>
						</div>
		    		</td>
		    		</tr>
		    		<tr><th>Account Expired</th>
		    		<td style="text-align:center;">
		    			<div class="select" style="display: inline-block" >
								<form:select path="accountExpired">  
					      			<form:options items = "${ACTIVE_MAP}" class="service-small" />
				        		</form:select>
						</div>
		    		
		    		</td>
		    		</tr>
		    			<tr><th>Credentials Expired</th>
		    		<td style="text-align:center;">
		    			<div class="select" style="display: inline-block" >
								<form:select path="credentialsExpired">  
					      			<form:options items = "${ACTIVE_MAP}" class="service-small" />
				        		</form:select>
						</div>
		    		
		    		</td>
		    		
		    		</tr>
		    	</table>
			</td>
			</tr>
			<tr>
			<th>
			Remarks</th>
			<td colspan="2"> 
				<form:textarea path = "remarks" rows="5" cols="80"  maxlength="1000"/>
			</td>
			</tr>
			<tr>
			
			<td colspan="3">
				<input type="submit" value="Update User">
				<a href="view_search_admin_user"><input type="button" style="width: 140px;background-color: blue;" value="User Listings"></a>
			</td>
			</tr>
		</table>
	
		        <!-- 
		        
		        <table>

		        <tr><th>Login Id</th><td> <input class="contact" type="text" name="username" value="" /><br><form:errors path="username" cssClass="error" /></td></tr>
		        <tr><th>Password </th><td><input class="contact" type="password" name="password" value="" /> <br><form:errors path="password" cssClass="error" /></td></tr>
		     	<tr><th>Confirm Password </th><td><input class="contact" type="password" name="passwordConfirm" value="" /> <br><form:errors path="passwordConfirm" cssClass="error" /></td></tr>
		      	<tr><th>Role</th><td><input type="radio" id="roles" name="roles" value="user" checked>	User <input type="radio" id="roles" name="roles" value="admin">Admin<br></td></tr>
		        <tr><th>User Full Name </th><td><input class="contact" type="text" name="name" value="" /><br><form:errors path="name" cssClass="error" /></td></tr>
		        <tr><th>Address</th><td><textarea rows="3" cols="50" name="address" maxlength="250"></textarea><br><form:errors path="address" cssClass="error" /></td></tr>
		        <tr><th>Email</th><td> <input class="contact" type="text" name="email" value="" /><br><form:errors path="email" cssClass="error" /></td></tr>
		       	<tr><th>Mobile</th><td><input class="contact" type="text" name="mobile" value="0" /><br><form:errors path="mobile" cssClass="error" /></td></tr>
				
		        <tr><th>Designation</th><td><input class="contact" type="text" name="designation" value="" /><br><font color="red"><form:errors path="designation" cssClass="error" /></font></td></tr>
		        
		        <tr><th>Type</th><td><select id = "type" name = "type">
							   <option value = "Regular"> Regular</option>
							  <option value = "Contractual"> Contractual</option>
							</select></td></tr>
							
		        <tr><th>Shift</th><td><input class="contact" type="text" name="shift" value="" />(Day / Night)<br><font color="red"><form:errors path="shift" cssClass="error" /></font></td></tr>
		        
		        <tr><th>Fixed Incentive </th><td><input class="contact" type="text" name="fixedIncentive" value="" /></td></tr>
		        <tr><th>Date of Birth</th><td><input class="contact" type="date" name="dob" value="" /><br><form:errors path="dob" cssClass="error" /></td></tr>
		        <tr><th>Date of Joining</th><td> <input class="contact" type="date" name="doj" value="" /><br><form:errors path="doj" cssClass="error" /></td></tr>

		        <tr><td colspan="2"><input class="contact" type="submit" value="Create User"></td></tr>
		       </table>

        	 -->
        			        <input type="hidden" name="active" value="true" />
		</form:form>
      
</body>
</html>
