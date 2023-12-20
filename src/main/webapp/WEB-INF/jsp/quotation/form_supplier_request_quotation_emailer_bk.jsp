<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<head>
<title>UdanChoo Team Workload Section</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="${pageContext.request.contextPath}/resources/css/tooplate_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/coda-slider.css" type="text/css" charset="utf-8" />

</head>
<jsp:include page="../menu/MenuBuilder.jsp" />
<style>
body {
  //background-image: url('${pageContext.request.contextPath}/resources/images/visa.png');
  //background-repeat: no-repeat;
  //background-size: auto;
}
table {
  width: 100%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
}

th {
  background: #007f5c;
  height: 40px;
  width: 10%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
}

th, td {
  padding: 10px;
}
tr {
  border-bottom: 1px solid #cccccc;
}
tr:hover {background-color:#f5f5f5;}
td {
  border-right: 1px solid #cccccc;
  padding: 10px;
  transition: all 0.2s;
  text-align: center;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
  
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
select {
	appearance: none;
	outline: 0;
	background: lightblue;
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

</style>
	<hr>
 <body style="background-color: white;">
 <br>
  <br>
   <br>
    <br>
     <br>
      <br>
       <br>
<br>
<h2 align="center"> Request Quotation</h2>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	 
      <form:form name="reqQuotationEmailForm" id="reqQuotationEmailForm" action="send_send_email_req_quote_supplier" style="display:inline;" modelAttribute="EMAIL_QUOTE_OBJ" >
	   <table style="width:60%;">
	   <tr>
	   		<th style="width:15%;background-color:#FFC300;color: black;">Lead Reference #</th><td style="width:20%;color: black;">${EMAIL_QUOTE_OBJ.leadReferenceNumber }</td>
	   		<th style="width:15%;background-color:#FFC300;color: black;">Client Name</th><td style="width:20%;color: black;">${LEAD_OBJ.contactName }</td>
	   		<th style="width:15%;background-color:#FFC300;color: black;">Supplier Name</th><td style="width:20%;color: black;">${EMAIL_QUOTE_OBJ.supplierName }</td>
	   	</tr>
	   	</table>
	    
      <form:hidden path = "leadReferenceNumber" />
      <form:hidden path = "leadId" />
      <form:hidden path = "supplierId" />

      <table  style="width:70%;">
	    <tr>
	          <th style="width:20%;text-align: center;vertical-align: middle;background: #FF5733;" >To: </th>
	          <td style="text-align: left;">
	          	<input type="text" name="emailToList" style="width: 500px;height: 40px; border-color: lightblue !important;" value="${EMAIL_QUOTE_OBJ.emailToList}"/>
	          	<font color="red"><form:errors path="emailToList" cssClass="error" /></font>
	          </td>
	    </tr>
	    <tr>
	          <th style="width:20%;text-align: center;vertical-align: middle;background: #FF5733;" >Cc: </th>
	          <td style="text-align: left;">
	          	<input type="text" name="emailCcList" style="width: 500px;height: 40px; border-color: lightblue !important;" value="${EMAIL_QUOTE_OBJ.emailCcList}" />
	          	<font color="red"><form:errors path="emailCcList" cssClass="error" /> </font>
	          </td>
	    </tr>
	    <tr>
	          <th style="width:20%;text-align: center;vertical-align: middle;background: #FF5733;" >Subject: </th>
	          <td style="text-align: left;">
	          		<input type="text" name="emailSubject" style="width: 500px;height: 40px; border-color: lightblue !important;" value="${EMAIL_QUOTE_OBJ.emailSubject}" />
	          </td>
	    </tr>
	    <tr>
	          <th style="width:20%;text-align: center;vertical-align: middle;background: #FF5733;" >Message: </th>
	          <td style="color:black;">	Request Content - Please verify service details before requesting from supplier. </td>
	    </tr>
	
		<tr><th colspan="2" style="background-color:black;"> Check and Modify Content<font color="red"> (As you may be requesting multiple suppliers for multiple request against one lead.)</font></th></tr>
		<tr><td colspan="2">  
			<form:textarea path = "emailMessage" rows="10" cols="100"  maxlength="1450" />
		</td></tr> 
        
        <tr>
        <td colspan="2">
        	<input type="submit" name="emailRequestQuote" value="Send Quote Request" />
        	<a href="view_supplier_contacts_listing?supplierId=${EMAIL_QUOTE_OBJ.supplierId }&leadId=${EMAIL_QUOTE_OBJ.leadId }"><input type="button" style="background-color: blue;"value="Cancel" /></a>
        </td>
        
        </table>
        </form:form>
       

    </body>
    
</html>


