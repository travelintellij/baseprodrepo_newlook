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

<jsp:include page="../workload/_Workload_Menu.jsp" />
<style>

input[type=button], input[type=submit], input[type=reset] {
  background-color: darkgreen;
  border: none;
  color: white;
  padding: 16px 32px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
} 

#files-sl td, #files-sl th {
  border: 1px solid #ddd;
  padding: 6px;
  
}
#files-sl tr:nth-child(even){background-color: #f2f2f2;}

#files-sl tr:hover {background-color: #ddd;}
</style>
 <body style="background-color: white;">
    <div class="content">
   	 <br>
    	<h2 align="center">Deal Workload Summary</h2>
        <hr>
        <div align="center">Please manage your <b>Deal Service Line Workload</b> by clicking left on the services needed for this deal.</div> 
		<hr>
	</div>
	
	<jsp:include page="../workload/view_Deal_WL_summary.jsp" />
	

<body>
      <hr>
	<BR>
	<div align="center"><B><font size="4">  <a href="view_workload_createNewWorkLoadForm?dealConfirmationId=${dealConfirmationId}"> Workload Summary </a>  | <a href="view_upload_file?dealConfirmationId=${dealConfirmationId}">Voucher Management </a></font></B></div><br>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div> 
      <form:form name="emailForm" id="emailForm" action="send_emailVouchers" style="display:inline;" modelAttribute="EMAIL_DETAILS" >
      <table  id="files-sl" style="width:70%;height: 10px;">
	    <tr>
	          <th style="width:20%;text-align: center;vertical-align: middle;background: #FF5733;" >To: </th>
	          <td style="text-align: left;">
	          	<input type="text" name="emailToList" style="width: 400px;height: 30px; border-color: lightblue !important;" value="${EMAIL_DETAILS.emailToList }"/>
	          	<font color="red"><form:errors path="emailToList" cssClass="error" /></font>
	          </td>
	    </tr>
	    <tr>
	          <th style="width:20%;text-align: center;vertical-align: middle;background: #FF5733;" >Cc: </th>
	          <td style="text-align: left;">
	          	<input type="text" name="emailCcList" style="width: 400px;height: 30px; border-color: lightblue !important;" value="${EMAIL_DETAILS.emailCcList }" />
	          	<font color="red"><form:errors path="emailCcList" cssClass="error" /> </font>
	          </td>
	    </tr>
	    <tr>
	          <th style="width:20%;text-align: center;vertical-align: middle;background: #FF5733;" >Subject: </th>
	          <td style="text-align: left;"><input type="text" name="emailSubject" style="width: 500px;height: 30px; border-color: lightblue !important;" value="${EMAIL_DETAILS.emailSubject }" /></td>
	    </tr>
	    <tr>
	          <th style="width:20%;text-align: center;vertical-align: middle;background: #FF5733;" >Message: </th>
	          <td>	<textarea style="width: 1000px; height: 300px;border: 2px solid green; border-radius: 4px;" rows="3" cols="1500" name="emailMessage" htmlEscape="false">${EMAIL_DETAILS.emailMessage.trim() }</textarea></td>
	    </tr>
	
		<tr><th colspan="2"> Attaching Files </th></tr>
		<tr><td colspan="2"> ${FILE_UPLOADER_VO}  
		
		<form:form name="emailForm" id="emailForm" action="send_emailVouchers" style="display:inline;" modelAttribute="FILE_UPLOADER_VO" >
			<form:hidden path="flight" />
			<form:hidden path="hotel" />
			<form:hidden path="insurance" />
			<form:hidden path="others" />
			<form:hidden path="landPackage" />
			<form:hidden path="sightSeeing" />
			<form:hidden path="transfers" />
			<form:hidden path="visa" />
		</form:form>
		<%--	 
			<input type="hidden" id="flight" name="flight" value= "${FILE_UPLOADER_VO.flight}"/>  
		
			  		<input type="hidden" id="hotelFilesList" name="hotelFilesList" value= "${fileUploaderListVo.hotelFilesList}" />
	          		<input type="hidden" id="insuranceFilesList" name="insuranceFilesList" value= "${fileUploaderListVo.insuranceFilesList}" />
	          		
	          		<input type="hidden" id="landPackageFilesList" name="landPackageFilesList" value= "${fileUploaderListVo.landPackageFilesList}" />
	          		<input type="hidden" id="othersFilesList" name="othersFilesList" value= "${fileUploaderListVo.othersFilesList}" />
	          		<input type="hidden" id="sightseeingsFilesList" name="sightseeingsFilesList" value= "${fileUploaderListVo.sightseeingsFilesList}" />
	          		<input type="hidden" id="transfersFilesList" name="transfersFilesList" value= "${fileUploaderListVo.transfersFilesList}" />
	          		<input type="hidden" id="visaFilesList" name="visaFilesList" value= "${fileUploaderListVo.visaFilesList}" />
	     --%>
		</td></tr> 
        
        <tr>
        <td colspan="2">
        	<table>
			<tr>
			<td>
				
					<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
	        		<input type="submit" name="SendEmail" value="Send Email" />
	        	
	        </td>
		</form:form>
	        <td>
	        	<form:form name="emailForm" id="emailForm" action="view_upload_file"  style="display:inline;">
	        		<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
	        		<input type="submit" name="cancelEmail" value="Cancel" style="background-color: blue;" />
	        	</form:form>		
	        </td>
	        	
	        </tr>
	        	</table>
        </td>
        
        </table>
        
       

    </body>
    
</html>


