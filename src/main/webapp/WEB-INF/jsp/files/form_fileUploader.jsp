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
	<div align="center"><B><font size="4">  
		<a href="view_workload_createNewWorkLoadForm?dealConfirmationId=${dealConfirmationId}"> Workload Summary </a>  | 
		<a href="view_upload_file?dealConfirmationId=${dealConfirmationId}">Voucher Management </a> | 
		<a href="view_workload_costmanagement?dealConfirmationId=${dealConfirmationId}">Cost Management </a>
		</font></B></div><br>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div> 
       
      <table  id="files-sl" style="width:70%;height: 10px;">
	    <tr>
	          <th style="width:20%;text-align: center;vertical-align: middle;background: #FF5733;" >Services</th>
	          <th style="width:80%;text-align: center;vertical-align: middle;background: #FF5733;padding: 6px 6px;">Vouchers 
	          	
	          	<form:form name="emailForm" id="emailForm" action="view_emailVouchers" modelAttribute="FILE_UPLOADER_VO" style="display:inline;">
	          		
	          		
	          		<input type="hidden" id="flight" name="flight" />
	          		<input type="hidden" id="hotel" name="hotel" />
	          		<input type="hidden" id="insurance" name="insurance" />
	          		
	          		<input type="hidden" id="landPackage" name="landPackage" />
	          		<input type="hidden" id="others" name="others" />
	          		<input type="hidden" id="sightSeeing" name="sightSeeing" />
	          		<input type="hidden" id="transfers" name="transfers" />
	          		<input type="hidden" id="visa" name="visa" />
	          		
	          		<%--
	          		<input type="hidden" id="hotelFilesList" name="hotelFilesList" />
	          		<input type="hidden" id="insuranceFilesList" name="insuranceFilesList" />
	          		
	          		<input type="hidden" id="landPackageFilesList" name="landPackageFilesList" />
	          		<input type="hidden" id="othersFilesList" name="othersFilesList" />
	          		<input type="hidden" id="sightseeingsFilesList" name="sightseeingsFilesList" />
	          		<input type="hidden" id="transfersFilesList" name="transfersFilesList" />
	          		<input type="hidden" id="visaFilesList" name="visaFilesList" />
	   				 --%>
	          		<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
	          		<input type="submit" id="EmailSelected" name="EmailSelected" value="Email Selected" style="float: right; color: white;background-color: Blue; padding: 12px 12px;" />
	          	</form:form>		
	          </th>
	          	
	          	
	          <%--<th style="width:40%;text-align: center;vertical-align: middle;background: #FF5733;">Input Invoices</th> --%>
        	</tr>
          <c:forEach var="listValue"  items="${DealObject.serviceWorkLoadList}" varStatus="loopCounter">
	      	<tr>
	          <th style="width:20%;text-align: center;vertical-align: middle;" >${listValue.serviceName}</th>
	          <td style="width:20%;text-align: left;vertical-align: middle;" >
	         	<table style="width:100%;text-align: left;">
	          	
	          		<c:forEach var="entry" items="${VOUCHERS_MAP}"> 
			          	<c:if test="${entry.key eq listValue.serviceName }">
		          				<c:forEach var="fileName" items="${entry.value}"> 
			          			<tr>
			          				<td style="width: 45%; text-align: left;vertical-align: middle;" >
			          						<font size="2" ><c:out value="${fileName.name}"/></font>
					          		</td>
					          		<td style="width: 15%; text-align: center;vertical-align: middle;" >
					          			
					          			<%--
					          			<form:checkbox path="${listValue.serviceName}" value="${fileName.path}"/>  
					          			 --%>
					          			<input type="checkbox" id="${listValue.serviceName}" name="${listValue.serviceName}" value="${fileName}"><label for="fileToEmail">Email</label>
					          			  
					          		</td>
					          		<td style="width: 20%; text-align: center;vertical-align: middle;" >
					          		<form:form name="singleDownloadFileForm" id="singleDownloadFileForm" action="downloadFile" style="display:inline;">
					          				<input type="hidden" name="fileType" value="${listValue.serviceName}"/>
                 							<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
                 							<input type="hidden" name="fileName" value="${fileName}"/>
			          						<input type="submit" name="Download" Value="Download" style="color: white;background-color: Green; padding: 6px 12px;" />
			          				</form:form>
					          		</td>
					          		<td style="width: 20%; text-align: center;vertical-align: middle;" >
					          			
					          			<form:form name="singleDeleteFileForm" id="singleDeleteFileForm" action="deleteFile" style="display:inline;">
					          				<input type="hidden" name="fileType" value="${listValue.serviceName}"/>
                 							<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
                 							<input type="hidden" name="fileName" value="${fileName}"/>
					          				<input type="submit" name="Delete" Value="Delete" style="color: white;background-color: red; padding: 6px 12px;" />
					          			</form:form>
					          		</td>
					          	</tr>
			          			</c:forEach>
			   			</c:if>
	          		</c:forEach>
	        	</table>
	        	<br>
	          	
	          	 <form:form name="singleUploadForm" id="singleUploadForm" action="uploadFile" enctype="multipart/form-data" >
                 	<input type="hidden" name="uploadType" value="${listValue.serviceName}"/>
                 	<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}"/>
                 	<input id="singleFileUploadInput" type="file" name="file" class="file-input" required />
                    <button type="submit" class="primary submit-btn">Submit</button>
                 </form:form>
                 <div class="upload-response">
                 	<div id="singleFileUploadError"></div>
                    <div id="singleFileUploadSuccess"></div>
                  </div>
               </td>
	         
        	</tr>
	      </c:forEach>
        
        </table>
        <form:form name="singleDownloadFileForm" id="singleDownloadFileForm" action="downloadFile" >
       	
       	</form:form>
        
       

    </body>
        <script>
        $(document).ready(function() {
        	$("#EmailSelected").click(function(){
            
       		
        		/*
        		var flightvouchers = new Array();
        		$.each($("input[name='Flight']:checked"), function() {
        			flightvouchers.push($(this).val());
        			  // or you can do something to the actual checked checkboxes by working directly with  'this'
        			  // something like $(this).hide() (only something useful, probably) :P
        			});
        		
        		 
        		$('#flight').val(flightvouchers);
        		*/
        		
        	
        		
        		var flightvouchers = $("input[name='Flight']:checked").map(function(){
            	      return $(this).val();
            	    }).get();
            	            	
            	var hotelvouchers = $("input[name='Hotel']:checked").map(function(){
          	      return $(this).val();
          	    }).get();
          	
            	var insurancevouchers = $("input[name='Insurance']:checked").map(function(){
            	      return $(this).val();
            	    }).get();
            	
            	
            	var landpackagevouchers = $("input[name='Land-Package']:checked").map(function(){
          	      return $(this).val();
          	    }).get();
            	
            	var othersvouchers = $("input[name='Others']:checked").map(function(){
            	      return $(this).val();
            	    }).get();
              	
            	var sightseeingsvouchers = $("input[name='Sight-Seeing']:checked").map(function(){
            	      return $(this).val();
            	    }).get();
            	
            	var transfersvouchers = $("input[name='Transfers']:checked").map(function(){
          	      return $(this).val();
          	    }).get();
            	
            	var visavouchers = $("input[name='Visa']:checked").map(function(){
            	      return $(this).val();
            	    }).get();
              	
            	$('#flight').val(flightvouchers);
            	$('#hotel').val(hotelvouchers);
            	$('#insurance').val(insurancevouchers);
            	$('#landPackage').val(landpackagevouchers);
            	$('#others').val(othersvouchers);
            	$('#sightseeings').val(sightseeingsvouchers);
            	$('#transfers').val(transfersvouchers);
            	$('#visa').val(visavouchers);
            	
            	//alert(fileMailingList);
            	
            });
        	
        });
        
    </script>
</html>


