<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.jquery-ui.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<head>
	<title>UdanChoo Team Workload Section</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="${pageContext.request.contextPath}/resources/css/tooplate_style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/coda-slider.css" type="text/css" charset="utf-8" />
</head>
<style>
input[type=button], input[type=submit], input[type=reset] {
	background-color: #4CAF50;
	border: none;
	color: white;
	text-decoration: none;
	
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

.select option.service-small {
	font-size: 20px;
	padding: 25px;
	background: lightgreen;
}
</style>

<jsp:include page="_Workload_Menu.jsp" />
   <body style="background-color: white;">
    <div class="content">
   	 <br>
    	<h2 align="center">Deal Workload Summary</h2>
        <hr>
        <div align="center">Please manage your <b>Deal Service Line Workload</b> by clicking left on the services needed for this deal.</div> 
		<hr>
	</div>
	
	<jsp:include page="view_Deal_WL_summary.jsp" />
	
	<%--

	 --%>
	<hr>
	<BR>
	<div align="center"><B><font size="4"> 
		<a href="view_workload_createNewWorkLoadForm?dealConfirmationId=${dealConfirmationId}">Workload Summary</a>  | 
		<a href="view_upload_file?dealConfirmationId=${dealConfirmationId}">Voucher Management </a>  |
		<a href="view_workload_costmanagement?dealConfirmationId=${dealConfirmationId}">Cost Management </a>
		</font></B>
		
		</div><br>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<table class="heavyTable" style=" width: 75%;">
      <tr>
          <th style="background: #FF5733;">WorkLoad Type</th>
          <th style="background: #FF5733;">Service Lines Added</th>
          <th style="background: #FF5733;">WorkLoad Status</th>
          <th style="background: #FF5733;">Update WL Status</th>
          <th style="background: #FF5733;">Action</th>
        </tr>
       <%--
       
          	<c:forEach var="listValue"  items="${DealObject.serviceList}" varStatus="loopCounter">
         		 <tr>
         		<td>${serviceMap.get(listValue)}</td>
         		 <td>${serviceLineCountMap.get(listValue)}</td>
         		 <td>Status</td>
         		 <td>Update Status</td>
         		 <td>Action</td>
    			</tr>
    		</c:forEach>
         --%>
          <c:forEach var="listValue"  items="${DealObject.serviceWorkLoadList}" varStatus="loopCounter">
         		<form:form name="form_upd_wl" modelAttribute="WL_OBJ" action="update_update_workload">
         		<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
         		<input type="hidden" name="serviceMapId" value="${listValue.serviceMapId}" />
         		
         		<tr>
         		<th>${listValue.serviceName}</th>
         		 <td>${serviceLineCountMap.get(listValue.dealServiceCode)}</td>
         		 <td>${listValue.statusName}</td>
         		 <td>
         		 	<div class="select">
					<select id="serviceStatus" name="serviceStatus" style="width: 200px;" required>
							 <c:if test="${not empty MAP_WL_ALL_STATUS.get(listValue.dealServiceCode)}">
						      	<c:forEach items="${MAP_WL_ALL_STATUS.get(listValue.dealServiceCode)}" var="workload_status">
						      		<c:if test="${workload_status.workloadStatusId eq listValue.serviceStatus }">
										<option class="service-small" value="${workload_status.workloadStatusId}" selected>${workload_status.workloadStatusName}</option>
									</c:if>
									<c:if test="${workload_status.workloadStatusId ne listValue.serviceStatus }">
										<option class="service-small" value="${workload_status.workloadStatusId}">${workload_status.workloadStatusName}</option>
									</c:if>
						      	</c:forEach>
							</c:if>
						</select>
					</div>
         		 
         		 </td>
         		 <td><input style="width: 70px; height:25px; background-color: blue" type="submit" value="Update" /></td>
    			</tr>
    			</form:form>
    		</c:forEach>
	</table>
	</body>
     	
     		
  
  </html>
 