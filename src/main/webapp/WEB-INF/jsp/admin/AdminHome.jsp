<jsp:include page="../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

    <center>
	
	<font color="green" size="5">
	<br><br>
	<h2 >Admin Dashboard </h2>
	</font>
	<table width="90%;" style="margin-left:auto;margin-right:auto;">
		<tr>
		<td style="width: 50%">
			<jsp:include page="../dashboard/DealsDashboardAdmin.jsp" />
		</td>
		<td style="width: 50%">
			<%--
			<jsp:include page="../dashboard/WorkloadDashboardUser.jsp" />
			 --%>
			<jsp:include page="../dashboard/WorkloadDashboardAdmin.jsp" /> 
		</td>
		
		</table>
	
	
	</center>
	
       

     
</div>