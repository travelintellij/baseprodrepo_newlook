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
        <h1><font>Submitted Incentive Details By <font color="red" size="5">  ${userName} </font></h1>
          <form:form method="post" action="adminUpdateIncentive" modelAttribute="updateincentive">
        	<input type="hidden" name="incentiveId" value="${incentiveId}" />
        	<center><h1><font color="blue">Incentive Claim ID is ${incentiveId}</font></h1></center>
        	<div id="table">
		        <table>
		        <font size="2">
		        <tr><th>Requested By</th><td>${userName} <input type="hidden" name="userId" value="${userId}" /><input type="hidden" name="userName" value="${userName}" /></td></tr>
		        <tr><th>Query ID </th><td>${queryId}</td></tr>
		        <tr><th>Guest Name</th><td>${guestName}</td></tr>
		        <tr><th>Query Details</th><td>${queryDetails}</td></tr>
		        <tr><th>Travel Date</th><td>${travelDate}</td></tr>
		        <tr><th>Service End Date</th><td> ${endDate}</td></tr>
		        <tr><th>Service Type </th><td>${serviceType}</td></tr>
		      </font> 
		       </table>
        	</div>
        	
        	 <table>
		        <tr><td width="80%"><b>1. Client is Referred by You ?</b></td> <td>${question1}</td></tr>     
		        <tr><td width="80%"><b>2. You took minimal support of management and were able to handle the query alone ? </b></td> <td>${question2}</td></tr>
		        <tr><td width="80%"><b>3. You responded all queries of client yourself ontime without any delay ? </b> </td> <td>${question3} </td></tr>
		        <tr><td width="80%"><b>4. You ensured and verified with management time to time for payment settlement ? </b> </td> <td>${question4}</td></tr>
		        <tr><td width="80%"><b>5. You ensured the vouchers were sent on time and reminder call before travel is made to the client. </b> </td> <td>${question5}</td></tr>
		         <tr><td width="80%"><b>6. UdanChoo online Review achieved or decided not needed ?  </b></td> <td>${question6}</td></tr>
		     </table>
		     <table>
		    	<tr><td width="50%"><font color="red"><b>Claimed Amount </b></font></td><td>${claimedAmount}</td></tr>
		    	<tr><td width="50%"><font color="green"><b>Approved Amount </b></font></td><td><input class="contact" type="text" name="approvedAmount" value="${approvedAmount}" /></td></tr>
		    	<tr><td width="50%"><font color="red"><b>User Remarks </b></font></td><td>${userRemarks}</td></tr>
		    	 <tr><td width="50%"><font color="red"><b>Management Remarks </b></font></td><td><textarea rows="4" cols="60" name="managementRemarks" maxlength="250">${managementRemarks}</textarea></td></tr>
		    	<tr><td style="background-color:pink" ><b>Update Claim Status</b></td><td><select id = "status" name = "status" class="contact">
							   <option value = "Pending"> --Pending---</option>
							  <option value = "Approved"> --Approved--</option>
							   <option value = "Paid">    --Paid------</option>
							   <option value = "Rejected">-Rejected---</option>
							</select></td></tr>
							
				<tr><td colspan="2" style="background-color:blue"><center><input type="submit" value="Update Claim" /></center></th></tr>		
		     </table>
		</form:form>
</body>
</html>
