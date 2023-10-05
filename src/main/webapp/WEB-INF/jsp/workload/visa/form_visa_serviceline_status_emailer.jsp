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
<jsp:include page="../_Workload_Menu.jsp" />
<br>
<h2 align="center">
		Visa Status Details
</h2>
	<hr>
 <body style="background-color: white;">
 <br>
<h2 align="center"> Email Visa Status </h2>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div> 
      <form:form name="visaEmailForm" id="visaEmailForm" action="send_send_email_visa_deal_status" style="display:inline;" modelAttribute="EMAIL_VISA_STATUS" >
    	  <form:hidden path="visaIdListToEmail" />
    	  <input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
    	  
            
      <table  style="width:70%;">
	    <tr>
	          <th style="width:20%;text-align: center;vertical-align: middle;background: #FF5733;" >To: </th>
	          <td style="text-align: left;">
	          	
	          	<form:input path="emailMessageVo.emailToList" style="width: 500px;height: 40px; border-color: lightblue !important;"/>
	          	<font color="red"><form:errors path="emailMessageVo.emailToList" cssClass="error" /></font>
	          </td>
	    </tr>
	    <tr>
	          <th style="width:20%;text-align: center;vertical-align: middle;background: #FF5733;" >Cc: </th>
	          <td style="text-align: left;">
	          	<form:input path="emailMessageVo.emailCcList" style="width: 500px;height: 40px; border-color: lightblue !important;"/>
	          	<font color="red"><form:errors path="emailMessageVo.emailCcList" cssClass="error" /> </font>
	          </td>
	    </tr>
	    <tr>
	          <th style="width:20%;text-align: center;vertical-align: middle;background: #FF5733;" >Subject: </th>
	          <td style="text-align: left;">
	          		<form:input path="emailMessageVo.emailSubject" style="width: 500px;height: 40px; border-color: lightblue !important;"/>
	          		
	          </td>
	    </tr>
	    <tr>
	          <th style="width:20%;text-align: center;vertical-align: middle;background: #FF5733;" >Message: </th>
	          <td style="color:black;">	Visa Application Status - Please verify each document status before sending it to the client. </td>
	    </tr>
	
		<tr><th colspan="2" style="background-color:black;"> Sending Visa Status <font color="red">(Each Document Status will be attached and visible to client)</font></th></tr>
		<tr><td colspan="2">  
			<table>
				<tr>
					<th>Country</th><th>Applicant Name</th><th>Visa Type</th><th>Profile</th><th>Purpose</th><th>Status</th>
				</tr>
				<c:forEach varStatus="visaobj" var="visaProfObj" items="${EMAIL_VISA_STATUS.visaServiceListForEmail}">
					<tr >
					<td style="color:black;">${visaProfObj.countryName}</td>
					<td style="color:black;">${visaProfObj.applicantName}</td>
					<td style="color:black;">${VISA_PROFILE.get(visaProfObj.profile)}  </td>
					<td style="color:black;">${VISA_PURPOSE.get(visaProfObj.visaPurpose)} </td>
					<td style="color:black;">${VISA_TYPE.get(visaProfObj.visaType)}</td>
					<td style="color:black;">${visaProfObj.statusName}</td>
					
						<form:hidden path="visaServiceListForEmail[${visaobj.index}].countryName" />
						<form:hidden path="visaServiceListForEmail[${visaobj.index}].vsaServiceId" />
						<form:hidden path="visaServiceListForEmail[${visaobj.index}].visaPurpose" />
						<form:hidden path="visaServiceListForEmail[${visaobj.index}].visaType" />
						<form:hidden path="visaServiceListForEmail[${visaobj.index}].profile" />
						<form:hidden path="visaServiceListForEmail[${visaobj.index}].statusName" />
						<form:hidden path="visaServiceListForEmail[${visaobj.index}].applicantName" />
						<%--<form:hidden path="visaServiceListForEmail[${visaobj.index}].visaDocumentEntityList" />  --%>
					</tr>
				</c:forEach>	
			</table>
		</td></tr> 
        
        <tr>
        <td colspan="2">
        	<input type="submit" name="emailVisaStatus" value="Send Visa Status" />
        	<a href="view_form_email_workload_VSA_SL_status?dealConfirmationId=${dealConfirmationId}"><input type="button" style="background-color: blue;"value="Cancel" /></a>
        </td>
        
        </table>
        </form:form>
       

    </body>
    
</html>


