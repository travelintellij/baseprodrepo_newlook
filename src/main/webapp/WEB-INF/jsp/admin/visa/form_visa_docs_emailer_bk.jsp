<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<style>
table {
  width: 80%;
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
	background-color: green;
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}

</style>
 <body>
 <br>
  <br>
   <br>
    <br>
     <br>
      <br>
       <br>
 <br>
<h2 align="center"> Email Visa Docs </h2>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div> 
      <form:form name="visaEmailForm" id="visaEmailForm" action="send_send_email_visa_master_checklist" style="display:inline;" modelAttribute="EMAIL_VISA_MASTER" >
	      <form:hidden path="visaCostToIncludeList"/>
    	  <form:hidden path="visaIdListToEmail" />
    	  <form:hidden path="countryName" />
    	  <form:hidden path="countryCode" />
            
      <table  style="width:70%;">
	    <tr>
	          <th style="width:20%;text-align: center;vertical-align: middle;background: #FF5733;" >To: </th>
	          <td style="text-align: left;">
	          	<input type="text" name="emailToList" style="width: 600px;height: 40px; border-color: lightblue !important;" value="${EMAIL_VISA_MASTER.emailToList}"/>
	          	<font color="red"><form:errors path="emailToList" cssClass="error" /></font>
	          </td>
	    </tr>
	    <tr>
	          <th style="width:20%;text-align: center;vertical-align: middle;background: #FF5733;" >Cc: </th>
	          <td style="text-align: left;">
	          	<input type="text" name="emailCcList" style="width: 600px;height: 40px; border-color: lightblue !important;" value="${EMAIL_VISA_MASTER.emailCcList}" />
	          	<font color="red"><form:errors path="emailCcList" cssClass="error" /> </font>
	          </td>
	    </tr>
	    <tr>
	          <th style="width:20%;text-align: center;vertical-align: middle;background: #FF5733;" >Subject: </th>
	          <td style="text-align: left;">
	          		<input type="text" name="emailSubject" style="width: 600px;height: 40px; border-color: lightblue !important;" value="${EMAIL_VISA_MASTER.visaObjectListForEmail[0].countryName} Visa Documents Checklist" />
	          </td>
	    </tr>
	    <tr>
	          <th style="width:20%;text-align: center;vertical-align: middle;background: #FF5733;" >Message: </th>
	          <td>	Following Profile of Checklist documents will be sent to the recipient. You can change the cost if needed below. </td>
	    </tr>
	
		<tr><th colspan="2"> Sending Visa Docs Checklist For </th></tr>
		<tr><td colspan="2">  
			<table>
				<tr>
					<th>Country</th><th>Visa Id</th><th>Profile</th><th>Purpose</th><th>Visa Type</th>
					<c:if test="${EMAIL_VISA_MASTER.visaCostToIncludeList eq 'b2bcost' or EMAIL_VISA_MASTER.visaCostToIncludeList eq 'bothcosts'}">
						<th>B2b Cost</th>
					</c:if>
					<c:if test="${EMAIL_VISA_MASTER.visaCostToIncludeList eq 'b2ccost' or EMAIL_VISA_MASTER.visaCostToIncludeList eq 'bothcosts'}">
						<th>B2C Cost</th>
					</c:if>
				</tr>
				<c:forEach varStatus="visaobj" var="visaProfObj" items="${EMAIL_VISA_MASTER.visaObjectListForEmail}">
					
					
					<c:set var = "columnCount" scope = "page" value = "6"/>
					<c:if test="${EMAIL_VISA_MASTER.visaCostToIncludeList eq 'bothcosts'}">
						<c:set var = "columnCount" scope = "page" value = "7"/>
					</c:if>
					
					<tr>
						<td>${visaProfObj.countryName}</td>
						<td>${visaProfObj.visaId}</td>
						<td>${VISA_PROFILE.get(visaProfObj.profile)} </td>
						<td>${VISA_PURPOSE.get(visaProfObj.visaPurpose)}</td>
						<td>${VISA_TYPE.get(visaProfObj.visaType)}</td>
						<c:if test="${EMAIL_VISA_MASTER.visaCostToIncludeList eq 'b2bcost' or EMAIL_VISA_MASTER.visaCostToIncludeList eq 'bothcosts'}">
							<td><form:input path="visaObjectListForEmail[${visaobj.index}].standardB2bPrice"  type="text" style="border-color: red !important;" value="${visaProfObj.standardB2bPrice}" /></td>
						</c:if>
						<c:if test="${EMAIL_VISA_MASTER.visaCostToIncludeList eq 'b2ccost' or EMAIL_VISA_MASTER.visaCostToIncludeList eq 'bothcosts'}">
							<td><form:input path="visaObjectListForEmail[${visaobj.index}].standardB2cPrice"  type="text" style="border-color: red !important;" value="${visaProfObj.standardB2cPrice}" /></td>
						</c:if>
						<form:hidden path="visaObjectListForEmail[${visaobj.index}].visaId" />
						<form:hidden path="visaObjectListForEmail[${visaobj.index}].standardB2bPrice" />
						<form:hidden path="visaObjectListForEmail[${visaobj.index}].standardB2cPrice" />
					</tr>
					<tr>
						<td colspan=<c:out value = "${columnCount}"/>>
							<form:textarea path="visaObjectListForEmail[${visaobj.index}].otherCosts" style="width: 500px; height: 100px;border: 2px solid green; border-radius: 4px;" rows="3" cols="1500" name="otherCosts" htmlEscape="false" />
						</td>
					
					</tr>
					
				</c:forEach>	
			</table>
		</td></tr> 
        
        <tr>
        <td colspan="2">
        	<input type="submit" name="emailVisaDocs" value="Send Check List" />
        	<a href="search_search_visa_master?countryCode=${EMAIL_VISA_MASTER.countryCode} " ><input type="button" style="background-color: blue;"value="Cancel" /></a>
        <a href="" > </a>
        
        </td>
        
        </table>
        </form:form>
       

    </body>
    
</html>


