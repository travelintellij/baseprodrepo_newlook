<jsp:include page="form_searchDeal.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<style>
th {
	background: #1c87c9;
	color: #FFF;
	padding: 7px 4px;
	text-align: center;
}

td {
	text-align: center;
}
</style>
	<div align="center"><b>Total Deals Found : ${FILTERED_DEAL_RECORDS.size()}</b></div>
	<table border="1px" style="width:70%;border-collapse: collapse; margin-left: auto;margin-right: auto;">
			<tr>
				<th style="width: 100px;" align="center">Deal #</th>
				<th style="width: 100px;" align="center">Query #</th>
				<th style="width: 100px;">Booking Date</th>
				<th style="width: 200px;">Client Name</th>
				<th style="width: 100px;">Travel Date</th>
				<th style="width: 250px;">Services Booked</th>
				<th style="width: 120px;">Deal Status</th>
				<th style="width: 120px;">Deal Owner</th>
				<th style="width: 200px;">Action</th>
			</tr>
			
			<c:forEach items="${FILTERED_DEAL_RECORDS}" var="dealObj">
					<tr>
						<td style="width: 100px;">${dealObj.dealConfirmationId}</td>
						<td style="width: 100px;">${dealObj.queryId}</td>
						<td style="width: 100px;"><fmt:formatDate value="${dealObj.bookingDate}" pattern="dd-MM-yyyy" /></td>
						<td style="width: 200px;">${dealObj.clientName}</td>
						<td style="width: 100px;"><fmt:formatDate value="${dealObj.travelStartDate}" pattern="dd-MM-yyyy" /></td>
						
						<td style="width: 250px;">
						<c:forEach var="listValue"  items="${dealObj.serviceList}" varStatus="loopCounter">
                 	 		<img src="${pageContext.request.contextPath}/resources/images/${listValue.trim()}.jpg" height="25" width="25">
           		 		</c:forEach>
						</td>
						
						<td style="width: 120px;">${dealObj.statusName}</td>
						<td style="width: 120px;">${dealObj.dealOwnerName}</td>
						<td style="width: 200px;"><a href="view_view_deal_form?dealConfirmationId=${dealObj.dealConfirmationId}">View Deal </a> | <a href="view_edit_deal_form?dealConfirmationId=${dealObj.dealConfirmationId}">Edit Deal </a> | <a target="_blank" href="view_workload_createNewWorkLoadForm?dealConfirmationId=${dealObj.dealConfirmationId}">WorkLoad</a> 
						</td>
					</tr>
			</c:forEach>

		</table>
		<div id="pagination" align="center">
				Page: 
			    <c:url value="view_filter_deals" var="prev">
			       <c:param name="page" value="${page-1}"/>
			    </c:url>
			    <c:if test="${page > 0}">
			        <a href="<c:out value="${prev}&sortBy=${sortBy}&dealStatus=${FILTER_DEAL_OBJ.dealStatus}&startDate=${FILTER_DEAL_OBJ.startDate}&endDate=${FILTER_DEAL_OBJ.endDate}&searchOnBookingDate=${FILTER_DEAL_OBJ.searchOnBookingDate}" />" class="pn prev">Prev</a>
			    </c:if>
			
			    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
			        <c:choose>
			            <c:when test="${(page+1) == i.index}">
			                <span>${i.index}</span>
			            </c:when>
			            <c:otherwise>
			                <c:url value="view_filter_deals" var="url">
			                    <c:param name="page" value="${i.index-1}"/>
			                </c:url>
			                 <a href='<c:out value="${url}&sortBy=${sortBy}&dealStatus=${FILTER_DEAL_OBJ.dealStatus}&startDate=${FILTER_DEAL_OBJ.startDate}&endDate=${FILTER_DEAL_OBJ.endDate}&searchOnBookingDate=${FILTER_DEAL_OBJ.searchOnBookingDate}" />'>${i.index}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:url value="view_filter_deals" var="next">
			        <c:param name="page" value="${page + 1}"/>
			    </c:url>
			    <c:if test="${page + 1 < maxPages}">
			       <a href='<c:out value="${next}&sortBy=${sortBy}&dealStatus=${FILTER_DEAL_OBJ.dealStatus}&startDate=${FILTER_DEAL_OBJ.startDate}&endDate=${FILTER_DEAL_OBJ.endDate}&searchOnBookingDate=${FILTER_DEAL_OBJ.searchOnBookingDate}" />' class="pn next">Next</a>
			    </c:if>
			</div>

</html>
