<!DOCTYPE html>
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>

<style>
	table {
	  width: 50%;
	  height: 60px;
	  border-collapse: collapse;
	  border: 1px solid #38678f;
	  margin: 5px auto;
	  background: white;
	}
	
	th {
	  background: #7B68EE;
	  height: 40px;
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
	
	input[type=button], input[type=submit], input[type=reset] {
	  background-color: #4CAF50;
	  border: none;
	  color: white;
	  padding: 10px 20px;
	  text-decoration: none;
	  margin: 4px 2px;
	  cursor: pointer;
	}

	input[type="radio"] {
		display: inline-block;
		opacity: 1;
		width: 1em;
		z-index: -1;
	}
	</style>
</head>

<body>
      <br>
      <h2 align="center">Search Incentive Claims</h2>
       <form:form method="post" action="showAdminIncentiveSearchReport" modelAttribute="searchincentive">
        	<input type="hidden" name="userId" value="${userId}"/>
        	<input type="hidden" name="userName" value="${userName}"/>
        	<div id="table">
		        <table>
		      		 <tr><th>From Date </th><td><input type="date" name="claimFromDate" /></td><th>To Date</th><td><input type="date" name="claimToDate" /></td></tr>
		  	  		 <tr>
		  	  		 	<th>Claim Status</th>
		  	  		 	<td>
		  	  		 		<select id = "claimStatus" name = "claimStatus">
							   <option value = "None">Select</option>
							   <option value = "ALL">     -----ALL----</option>
							   <option value = "Pending"> --Pending---</option>
							  <option value = "Approved"> --Approved--</option>
							   <option value = "Paid">    --Paid------</option>
							   <option value = "Rejected">-Rejected---</option>
							</select>  </td>
		  	  		 	<th>User Name</th>
		  	  		 	<td>
		  	  		 	<select id = "reportOfUser" name = "reportOfUser">
							   <option value = "0">     -----ALL----</option>
							    <c:if test="${not empty ActiveUsersList}">
					        			<c:forEach items="${ActiveUsersList}" var="userObj">
					      					<option value="${userObj.userId}">${userObj.name}</option>
					   					</c:forEach>
					 			</c:if>
							
							</select>  
						</td>
		  	  		 	<tr><td colspan="4"><input type="submit" value="Search Claims" /></td></tr>
		       </table>
        	</div>
		</form:form>
   		<table style="width:80%;">
   		<tr><th style="width:10%;background:green;">Incentive Id</th><th style="width:20%;background:green;">Query Id </th> <th style="width:20%;background:green;">Lead Guest Name</th>
   		<th style="width:13%;background:green;">Travel Date</th><th style="width:13%;background:green;">End Date</th><th style="width:15%;background:green;">Claimant</th><th style="width:10%;background:green;">Claim Status</th></tr>
   		 <c:if test="${not empty incentiveList}">
   				<c:forEach var="incentiveObj" items="${incentiveList}">
      					<tr><td><a href="adminDisplayIncentive?incentiveId=${incentiveObj.incentiveId}" target="_blank">${incentiveObj.incentiveId}</a>   &nbsp; <a href="adminEditIncentive?incentiveId=${incentiveObj.incentiveId}" target="_blank">Edit</a></td><td>${incentiveObj.queryId}</td> <td>${incentiveObj.guestName}</td><td>${incentiveObj.travelDate}</td><td>${incentiveObj.endDate}</td><td>${incentiveObj.userName}</td><td>${incentiveObj.status}</td></tr>
   				</c:forEach>
			</c:if>
		</table>
	</body>
</html>
