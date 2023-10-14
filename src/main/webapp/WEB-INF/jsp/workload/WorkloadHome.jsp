<jsp:include page="../menu/MenuBuilder.jsp" />
	
	<!-- 
	<ul id="content">
	 -->
	<body style="  background-image: url('${pageContext.request.contextPath}/resources/images/revamped/homePageBg.png');
    background-size: cover;
    background-repeat: no-repeat;
    background-position: top;
    background-attachment: fixed;">
		<table width="100%;">
		<tr>
		<td style="width: 100%">
			<jsp:include page="../dashboard/DealsDashboardUser.jsp" />
		</td>
		
		<!-- 
		<td style="width: 50%">
			<%--
			<jsp:include page="../dashboard/WorkloadDashboardUser.jsp" />
			 --%>
			<jsp:include page="../dashboard/WorkloadDashboardUser.jsp" /> 
		</td>
		-->
		
		</table>
		
		<!-- 
		<img src="${pageContext.request.contextPath}/resources/images/comingsoon.jpg" >
		 -->
	</body>
	
	
	<!-- </ul> -->