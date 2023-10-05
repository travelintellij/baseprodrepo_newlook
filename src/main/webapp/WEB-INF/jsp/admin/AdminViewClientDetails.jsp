<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<jsp:include page="../menu/MenuBuilder.jsp" />
 
<style>
table {
	margin: 5px 0 30px 0;
}

table tr th, table tr td {
	background: #3B3B3B;
	color: #FFF;
	padding: 15px 20px;
	text-align: left;
	
}

table tr td {
	background: #E5E5DB;
	color: #47433F;
	border-top: 1px solid #FFF;
	align: center;
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
<br><br>
       <h3> Welcome Administrator  <font color="red" size="5">  ${userName} </font></h3>
       <br>
        ${messageDisplay}
        <br>
        <div class="main-block">
        <body style="background-color: creamwhite;">
        <div id="table">
	       <table style="width:100%;cellspacing=30px;"><caption><h2>Client Details</h2></caption>
		     
		        <tr><th align="left">Client Id</th><td width="80%"> ${client.clientId}</td></tr>
		        <tr><th align="left">Client Name</th><td width="80%"> ${client.clientName}</td></tr>
		        <tr><th align="left">Client Address</th><td>${client.address}</td></tr>
		        <tr><th align="left">City</th><td>${client.cityName}</td></tr>
				<tr><th align="left">Email</th><td>${client.email}</td></tr>
				<tr><th align="left">Mobile</th><td>${client.mobile}</td></tr>
				<tr><th align="left">Phone </th><td>${client.phone}</td></tr>
				<tr><th align="left">Company Details</th><td>${client.companyName}</td></tr>
				<tr><th align="left">Referred By</th><td>${client.referredBy}</td></tr>				
				<tr><th align="left">GST Details</th><td>${client.gstNumber}</td></tr>
				<tr><th align="left">Bank Details</th><td>${client.bankAccountDetails}</td></tr>
				<tr><th align="left">Remarks</th><td>${client.remarks}</td></tr>
	        </table>
	    </div>
	    </body>
	    </div>
	    
