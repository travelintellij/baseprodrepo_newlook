<!DOCTYPE html>
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
<h3 align="center"><b>Flight Service Line</b></h3>
	
	 <div class="container">
<form:form action="get_flight_service_line_queue_user" modelAttribute="FILTER_SL">
        <div class="view_task_wrapper bs">
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <div class="view_task_data">
                <div class="view_task_data_li">
                    <label for="">Deal Confirmation id</label>
                    <form:input path="dealConfirmationId" type="number" min="0" size="35" value="" placeholder="Deal Number" />
                </div>
                <div class="view_task_data_li view_task_tak_owner">
						<form:radiobutton path="upcomingDeal" value="false" style="display: inline-block;width: 20px;height: 20px;margin-left: -25px;margin-right:10px"/>
						<input type="button" style="background-color:green;color:white;width:200px;" value="Completed Deals" />                
				</div>
                <div class="view_task_data_li view_task_task_pri">
					<form:radiobutton path="upcomingDeal" value="true" style="display: inline-block;width: 20px;height: 20px;margin-left: -25px;margin-right:10px"/>
					<a href="#"><input type="button" style="background-color:red;color:white;width:200px;" value="Upcoming or Active" /></a>                
					
				</div>
				<sec:authorize access="hasAnyRole('ADMIN','LEAD_MANAGER')">
                    <div class="secondL">
                		<div class="l3Box3 box">
                            <label for="all"  style="font-weight:800">Deal Owner</label> <br>
                            <form:select path="dealOwner" style="width: 150px;">
                                <form:option value="0" label="***ALL***" class="service-small" />
                                <form:options items="${ACTIVE_USERS_MAP}" class="service-small" />
                            </form:select>
                        </div>
                    </div>
                </sec:authorize>
				<sec:authorize access="! hasAnyRole('ADMIN','LEAD_MANAGER')">
 					<b>Deal Owner:</b> &nbsp;&nbsp; ${userName}
                </sec:authorize>
            </div>
            <div class="due_today_task_data_btnss" style="display:flex;justify-content:center;margin-top:10px">
                <input style="background-color:#32cd32;" type="submit" value="Apply Filter" />
              <a href="get_deals_service_line_queue_user"><input type="button" value="Clear Filter" /></a>
            </div>
        </div>
	</form:form>
	</div>
		<table style="width: 90%; ">
			<tr >
				<td style="height:30px"><img src="${pageContext.request.contextPath}/resources/images/filter.jpg" height="50" width="50"/></td>
				<td style="height:30px">
					<input type="text" class="contact" id="clientName" name="clientName" value="" size="35" placeholder="Client Name"/>
					<input type="hidden" name="clientId" value="" />
				</td>
		        <td style="height:30px">
	        	<div class="select">
				<select id = "statusId" name="statusId" style="width: 150px;">
					<c:if test="${not empty FLT_SL_STATUS_LIST}">
				      <option value="" class="service-small">Status Filter</option>
				       <c:forEach items="${FLT_SL_STATUS_LIST}" var="flt_sl_statusObj">
			      			<option class="service-small" value="${flt_sl_statusObj.workloadStatusId}">${flt_sl_statusObj.workloadStatusName}</option>
				   		</c:forEach>
				 </c:if>
				 </select>  
				 </div>
      
	        </td>
	        <td>
	        	<b>Departure Date Range</b>
	        </td>
	        <td><input type="date" name="DateFrom"/></td>
	        <td><input type="date" name="DateTo"/></td>
 			<td style="height:30px"><input style="background-color:red;" type="submit" value="Apply Filter" /> </td>
			<td style="height:30px"><a href="get_flight_service_line_queue_user"><input type="button" value="Clear Filter" /></a></td>
			</tr>
		</table>
	
	
		<hr>
		<c:set value="${FLT_PAGE_LIST}" var="fltPageList" />
		<table>
			<tr>
				<th style="width:5%;">Service Id</th>
				<th style="width:5%;">Flight #</th>
				<th style="width:8%;"><a style="color:#ffffa0;" href="get_flight_service_line_queue_user?sortBy=dealConfirmationId&clientId=${clientId}&statusId=${statusId}&dateFrom=${dateFrom}&dateTo=${dateTo}">Deal Code #</a></th>
				<th style="width:13%;">Lead Client Name</th>
				<th style="width:8%;"><a style="color:#ffffa0;" href="get_flight_service_line_queue_user?sortBy=CreatedAt&clientId=${clientId}&statusId=${statusId}&dateFrom=${dateFrom}&dateTo=${dateTo}">Created Date</a></th>
				<th style="width:8%;"><a style="color:#ffffa0;" href="get_flight_service_line_queue_user?sortBy=departureDate&clientId=${clientId}&statusId=${statusId}&dateFrom=${dateFrom}&dateTo=${dateTo}">Departure Date</a></th>
				<th style="width:10%;">Departing From</th>
				<th style="width:10%;">Arriving To</th>
				<th style="width:12%;"><a style="color:#ffffa0;" href="get_flight_service_line_queue_user?sortBy=status&clientId=${clientId}&statusId=${statusId}&dateFrom=${dateFrom}&dateTo=${dateTo}">SL Status</a></th>
				<th style="width:22%;">Action</th>
			</tr>
			<c:forEach items="${fltPageList}" var="flt">
				<tr>
					<td style="width:5%;">${flt.fltServiceId}</td>
					<td style="width:5%;">${flt.flightNumber}</td>
					<td style="width:5%;">UDN ${flt.dealConfirmationId}</td>
					<td style="width:13%;">${flt.clientName}</td>
					<td style="width:8%;"><fmt:formatDate value="${flt.createdAt}" pattern="dd-MM-yyyy" /></td>
					<td style="width:8%;"><fmt:formatDate value="${flt.departureDate}" pattern="dd-MM-yyyy" /></td></td>
					<td style="width:10%;">${flt.departingCity}</td>
					<td style="width:10%;">${flt.arrivalCity}</td>
					<td style="width:13%;">${flt.statusName}</td>
					<td style="width:24%;"><a target="_blank" href="view_workload_createNewWorkLoadForm?dealConfirmationId=${flt.dealConfirmationId}"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"value="View WorkLoad" /></a> | <a href="view_view_deal_form?dealConfirmationId=${flt.dealConfirmationId}"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"value="View Deal" /></a> | <a target="_blank" href="view_upload_file?dealConfirmationId=${flt.dealConfirmationId}"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"value="View Voucher" /></a></td>
					
				</tr>
			</c:forEach>
		</table>
	
				<div id="pagination" align="right">
				Page: 
			    <c:url value="get_flight_service_line_queue_user" var="prev">
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
			                <c:url value="get_flight_service_line_queue_user" var="url">
			                    <c:param name="page" value="${i.index-1}"/>
			                </c:url>
			                 <a href='<c:out value="${url}&sortBy=${sortBy}&statusId=${statusId}&clientId=${clientId}" />'>${i.index}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:url value="get_flight_service_line_queue_user" var="next">
			        <c:param name="page" value="${page + 1}"/>
			    </c:url>
			    <c:if test="${page + 1 < maxPages}">
			       <a href='<c:out value="${next}&sortBy=${sortBy}&statusId=${statusId}&clientId=${clientId}&dateFrom=${dateFrom}&dateTo=${dateTo}" />' class="pn next">Next</a>
			    </c:if>
			</div>



