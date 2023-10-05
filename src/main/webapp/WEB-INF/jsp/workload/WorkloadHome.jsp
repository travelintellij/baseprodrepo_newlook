<jsp:include page="../menu/MenuBuilder.jsp" />
	
	<!-- 
	<ul id="content">
	 -->
	<center>
	<font color="green" size="5">
	<br><br>
	<h2 >Deal Dashboard </h2>
	</font>
		<table width="90%;" style="margin-left:auto;margin-right:auto;">
		<tr>
		<td style="width: 50%">
			<jsp:include page="../dashboard/DealsDashboardUser.jsp" />
		</td>
		<td style="width: 50%">
			<%--
			<jsp:include page="../dashboard/WorkloadDashboardUser.jsp" />
			 --%>
			<jsp:include page="../dashboard/WorkloadDashboardUser.jsp" /> 
		</td>
		
		</table>
		
		<!-- 
		<img src="${pageContext.request.contextPath}/resources/images/comingsoon.jpg" >
		 -->
	
	
	</center>
	
	
	<!-- </ul> -->