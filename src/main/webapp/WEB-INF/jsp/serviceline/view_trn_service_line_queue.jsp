<jsp:include page="../menu/MenuBuilder.jsp" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script>
$(document).ready(function() {
	$('#clientName').autocomplete({
		serviceUrl: '${pageContext.request.contextPath}/getClientList',
		paramName: "tagName",
		delimiter: ",",
		onSelect: function(suggestion) {
            cityID = suggestion.data;
            id=cityID;
            jQuery("#clientId").val(cityID);
            $('input[name=clientId]').val(id);
            return false;
        },
		transformResult: function(response) {
	        return {
	            suggestions: $.map($.parseJSON(response), function(item) {
	            	return { value: item.tagName, data: item.id };
	            })
	            
	        };
	    }
	});
});

 
</script>

	
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">


<style>
table {
  width: 100%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
}

th {
  background: #3A6507;
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
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 10px 20px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}

</style>
<br>	
<h3 align="center"><b>Transfers Service Line</b></h3>
	

	<form:form action="get_transfers_service_line_queue_user" modelAttribute="FILTER_SL">
	<div align="center"><font color="red">
			<b>
			<form:errors path="clientName" /><br>
			<form:errors path="dateFrom" />
			</b>
		</font>
		</div>
		<table style="width: 90%;">
			<tr>
				<td><img src="${pageContext.request.contextPath}/resources/images/filter.jpg" height="50" width="50"/></td>
				<td>
					<input type="text" class="contact" id="clientName" name="clientName" value="" size="35" placeholder="Client Name"/>
					<input type="hidden" name="clientId" value="" />
				</td>
		        <td>
	        	<div class="select">
				<select id = "statusId" name="statusId" style="width: 150px;">
					<c:if test="${not empty TRN_SL_STATUS_LIST}">
				      <option value="" class="service-small">Status Filter</option>
				       <c:forEach items="${TRN_SL_STATUS_LIST}" var="trn_sl_statusObj">
			      			<option class="service-small" value="${trn_sl_statusObj.workloadStatusId}">${trn_sl_statusObj.workloadStatusName}</option>
				   		</c:forEach>
				 </c:if>
				 </select>  
				 </div>
      
	        </td>
	        <td>
	        	<b>CheckIn Date Range</b>
	        </td>
	        <td><input type="date" name="DateFrom"/></td>
	        <td><input type="date" name="DateTo"/></td>
			<td><input style="background-color:red;" type="submit" value="Apply Filter" /> </td>
			<td><a href="get_transfers_service_line_queue_user"><input type="button" value="Clear Filter" /></a> </td>
			
			</tr>
		</table>
	
		<hr>
		<c:set value="${TRN_PAGE_LIST}" var="trnPageList" />
		<table>
			<tr>
				<th style="width:5%;">Service Id</th>
				<th style="width:7%;"><a style="color:#ffffa0;" href="get_transfers_service_line_queue_user?sortBy=dealConfirmationId&clientId=${clientId}&statusId=${statusId}&dateFrom=${dateFrom}&dateTo=${dateTo}">Deal Code #</a></th>
				<th style="width:11%;">Lead Client Name</th>
				<th style="width:9%;">Pickup City</th>
				<th style="width:9%;">Pickup From</th>
				<th style="width:10%;">Pickup From Name</th>
				<th style="width:7%;"><a style="color:#ffffa0;" href="get_transfers_service_line_queue_user?sortBy=CreatedAt&clientId=${clientId}&statusId=${statusId}&dateFrom=${dateFrom}&dateTo=${dateTo}">Created Date</a></th>
				<th style="width:10%;"><a style="color:#ffffa0;" href="get_transfers_service_line_queue_user?sortBy=transferDate&clientId=${clientId}&statusId=${statusId}&dateFrom=${dateFrom}&dateTo=${dateTo}">Transfer Date</a></th>
				<th style="width:12%;"><a style="color:#ffffa0;" href="get_transfers_service_line_queue_user?sortBy=status&clientId=${clientId}&statusId=${statusId}&dateFrom=${dateFrom}&dateTo=${dateTo}">SL Status</a></th>
				<th style="width:22%;">Action</th>
			</tr>
			<c:forEach items="${trnPageList}" var="trn">
				<tr>
					<td style="width:5%;">${trn.trnServiceId}</td>
					<td style="width:7%;">UDN ${trn.dealConfirmationId}</td>
					<td style="width:11%;">${trn.clientName}</td>
					<td style="width:9%;">${trn.pickupCityName}</td>
					<td style="width:9%;">${trn.pickUpFrom}</td>
					<td style="width:10%;">${trn.pickUpFromName}</td>
					<td style="width:7%;"><fmt:formatDate value="${trn.createdAt}" pattern="dd-MM-yyyy" /></td>
					<td style="width:10%;">${localDateTimeFormat.format(trn.transferDate)}</td></td>
					<td style="width:12%;">${trn.statusName}</td>
					<td style="width:22%;"><a target="_blank" href="view_workload_createNewWorkLoadForm?dealConfirmationId=${trn.dealConfirmationId}"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"value="View WorkLoad" /></a> | <a href="view_view_deal_form?dealConfirmationId=${trn.dealConfirmationId}"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"value="View Deal" /></a> | <a target="_blank" href="view_upload_file?dealConfirmationId=${trn.dealConfirmationId}"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"value="View Voucher" /></a></td>
					
				</tr>
			</c:forEach>
		</table>
	
				<div id="pagination" align="right">
				Page: 
			    <c:url value="get_transfers_service_line_queue_user" var="prev">
			       <c:param name="page" value="${page-1}"/>
			    </c:url>
			    <c:if test="${page > 0}">
			        <a href="<c:out value="${prev}&sortBy=${sortBy}&statusId=${statusId}&clientId=${clientId}&dateFrom=${dateFrom}&dateTo=${dateTo}" />" class="pn prev">Prev</a>
			    </c:if>
			
			    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
			        <c:choose>
			            <c:when test="${(page+1) == i.index}">
			                <span>${i.index}</span>
			            </c:when>
			            <c:otherwise>
			                <c:url value="get_transfers_service_line_queue_user" var="url">
			                    <c:param name="page" value="${i.index-1}"/>
			                </c:url>
			                 <a href='<c:out value="${url}&sortBy=${sortBy}&statusId=${statusId}&clientId=${clientId}" />'>${i.index}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:url value="get_transfers_service_line_queue_user" var="next">
			        <c:param name="page" value="${page + 1}"/>
			    </c:url>
			    <c:if test="${page + 1 < maxPages}">
			        <a href='<c:out value="${next}&sortBy=${sortBy}&statusId=${statusId}&clientId=${clientId}&dateFrom=${dateFrom}&dateTo=${dateTo}" />' class="pn next">Next</a>
			    </c:if>
			</div>
	</form:form>


