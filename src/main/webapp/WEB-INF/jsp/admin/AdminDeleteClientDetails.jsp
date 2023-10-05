<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>

<jsp:include page="../menu/MenuBuilder.jsp" />  

<style>
table
{ margin: 5px 0 30px 0;}

table tr th, table tr td
{ background: #3B3B3B;
  color: #FFF;
  padding: 6px 2px;
  text-align: left;}
  
table tr td
{ background: #E5E5DB;
  color: #47433F;
  border-top: 1px solid #FFF;}

input[type=button], input[type=submit], input[type=reset] {
  background-color: red;
  border: none;
  color: white;
  padding: 16px 32px;
  text-decoration: none;
  margin: 2px 2px;
  cursor: pointer;
}
</style>
	
       <h3> <br>Welcome Administrator  <font color="red" size="5">  ${userName} </font></h3>
         
         <div class="main-block">
           <form:form method="post" action="actionDeleteClient" modelAttribute="client">
        	<input type="hidden" name="clientId" value="${clientId}" />
          <div id="table">
	       <table id="table" style="width:100%;cellspacing=30px;" ><caption><h2>Client Delete Confirmation </h2></caption>
		      <font size="2">
		        <tr><th>Client Id</th><td width="80%"> ${client.clientId}</td></tr>
		        <tr><th>Client Name</th><td width="80%"> ${client.clientName}</td></tr>
		        <tr><th>Client Address</th><td>${client.address}</td></tr>
		        <tr><th>City</th><td>${client.cityName}</td></tr>
				<tr><th>Email</th><td>${client.email}</td></tr>
				<tr><th>Mobile</th><td>${client.mobile}</td></tr>
				<tr><th>Phone </th><td>${client.phone}</td></tr>
				<tr><th>Company Details</th><td>${client.companyName}</td></tr>
				<tr><th>Referred By</th><td>${client.referredBy}</td></tr>				
				<tr><th>GST Details</th><td>${client.gstNumber}</td></tr>
				<tr><th>Bank Details</th><td>${client.bankAccountDetails}</td></tr>
				<tr><th>Remarks</th><td>${client.remarks}</td></tr>
				<tr><td colspan="2"><center><input class="contact" type="submit" value="Confirm Delete"></center></td></tr>
	        </table>
	       </form:form>
        </div>
        </div>