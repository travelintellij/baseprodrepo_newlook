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
	  background: green;
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
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<body>
    	<h1 align="center"><font color="blue">Incentive Claim ID is ${INCENTIVE_OBJ.incentiveId}</font></h1>
    	<hr>
		<table>
	        <tr><th>Requested By</th><td>${userName} <input type="hidden" name="userId" value="${Id}" /><input type="hidden" name="userName" value="${userName}" /></td></tr>
	        <tr><th>Query ID </th><td>${INCENTIVE_OBJ.queryId}</td></tr>
	        <tr><th>Guest Name</th><td>${INCENTIVE_OBJ.guestName}</td></tr>
	        <tr><th>Query Details</th><td>${INCENTIVE_OBJ.queryDetails}</td></tr>
	        <tr><th>Travel Date</th><td>${INCENTIVE_OBJ.travelDate}</td></tr>
	        <tr><th>Service End Date</th><td> ${INCENTIVE_OBJ.endDate}</td></tr>
	        <tr><th>Service Type </th><td>${INCENTIVE_OBJ.serviceType}</td></tr>
	    </table>
       	 <table>
	        <tr><th style="width:5%;">1</th><th style="width:70%; padding: 5px;text-align:left;">Client is Referred by You ?</th> <td>${INCENTIVE_OBJ.question1}</td></tr>     
	        <tr><th style="width:5%;">2</th><th style="width:70%; padding: 5px;text-align:left;">You took minimal support of management and were able to handle the query alone ? </th> <td>${INCENTIVE_OBJ.question2}</td></tr>
	        <tr><th style="width:5%;">3</th><th style="width:70%; padding: 5px;text-align:left;">You responded all queries of client yourself ontime without any delay ?  </th> <td>${INCENTIVE_OBJ.question3} </td></tr>
	        <tr><th style="width:5%;">4</th><th style="width:70%; padding: 5px;text-align:left;">You ensured and verified with management time to time for payment settlement ?  </th> <td>${INCENTIVE_OBJ.question4}</td></tr>
	        <tr><th style="width:5%;">5</th><th style="width:70%; padding: 5px;text-align:left;">You ensured the vouchers were sent on time and reminder call before travel is made to the client.  </th> <td>${INCENTIVE_OBJ.question5}</td></tr>
	         <tr><th style="width:5%;">6</th><th style="width:70%; padding: 5px;text-align:left;">UdanChoo online Review achieved or decided not needed ? </th> <td>${INCENTIVE_OBJ.question6}</td></tr>
	     </table>
	     <table>
	    	<tr><td width="50%"><font color="red"><b>Claimed Amount </b></font></td><td>${INCENTIVE_OBJ.claimedAmount}</td></tr>
	    	<tr><td width="50%"><font color="green"><b>Approved Amount </b></font></td><td>${INCENTIVE_OBJ.approvedAmount}</td></tr>
	    	<tr><td width="50%"><font color="red"><b>User Remarks </b></font></td><td>${INCENTIVE_OBJ.userRemarks}</td></tr>
	    	 <tr><td width="50%"><font color="red"><b>Management Remarks </b></font></td><td>${INCENTIVE_OBJ.managementRemarks}</td></tr>
	    	<tr><td><b>Claim Status</b></td><td><mark>${INCENTIVE_OBJ.status}</mark></td></tr>
	     </table>
	</body>
</html>
