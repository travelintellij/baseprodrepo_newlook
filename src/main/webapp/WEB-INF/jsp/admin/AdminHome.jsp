<jsp:include page="../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

	<body style="  background-image: url('${pageContext.request.contextPath}/resources/images/revamped/homePageBg.png');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: top;
    background-attachment: fixed;">
	<table width="100%;">
		<tr>
		<td style="width: 100%">
			<jsp:include page="../dashboard/DealsDashboardAdmin.jsp" />
		</td>
		
		<!-- 
		<td style="width: 50%">
			<%--
			<jsp:include page="../dashboard/WorkloadDashboardUser.jsp" />
			 --%>
			<%--
			<jsp:include page="../dashboard/WorkloadDashboardAdmin.jsp" />
			--%> 
		</td>
		-->
		</table>
	
	</body>
	
	
       

     
</div>