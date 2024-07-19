<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Task</title>
    		<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
</head>
<style>
   body::before {
            content: "";
            background-image: url(${pageContext.request.contextPath}/resources/images/revamped/view_task.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            background-attachment: fixed;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0.5; /* Adjust the opacity value as needed (0.0 to 1.0) */
            z-index: -1;
        }
</style>
<body>



 <div class="cnt_options ">
            <a href="view_create_task_form_user" style="color:white;background:black">Deals</a>
            <a href="view_open_task_form_user" "> Flight</a>
            <a href="view_open_task_form_user_filter_due_today">Hotel</a>
            <a href="view_open_over_due_task_form_user">Transfers</a>
            <a href="view_open_my_created_task_form_user">SightSeeing</a>
            <a href="view_open_my_assigned_task_form_user">Land Package</a>
            <a href="view_completed_task_form_user">Visa</a>
  </div>



    <div class="container">
<form:form action="get_deals_service_line_queue_user" modelAttribute="FILTER_SL">
        <div class="view_task_wrapper bs">
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <div class="view_task_data">
                <div class="view_task_data_li">
                    <label for="">Deal Confirmation id</label>
                    <input type="text" name="dealConfirmationId" id="dealConfirmationId" step="0.0"
                        placeholder="Deal Confirmation Id ">
                </div>
                <div class="view_task_data_li view_task_tak_owner">
                    <label for="">Click for Completed Deals</label>
                      <a href="#"><input type="button" style="background-color:green;color:white;" value="Completed Deals" /></a>
                </div>
                <div class="view_task_data_li view_task_task_pri">
                    <label for="">Task Priority</label>
					<a href="#"><input type="button" style="background-color:red;color:white;" value="Upcoming or Active" /></a>                
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
				
            </div>
            <div class="due_today_task_data_btnss" style="display:flex;justify-content:center;margin-top:10px">
                <input style="background-color:#32cd32;" type="submit" value="Apply Filter" />
              <a href="view_open_task_form_user"><input type="button" value="Clear Filter" /></a>
            </div>
        </div>
	</form:form>
	</div>
        <table class="view_task_table" style="width:70%; margin-left: auto;margin-right: auto;">
        <thead style="background:#6082B6;height:50px;">
            <tr>
                <th style="width:10%;"><a style="color:black;" href="#">Deal Number</a></th>
                <th style="width:10%;"><a style="color:black;" href="#">Booking Date</th>
                <th style="width:20%;">Client Name</th>
                <th style="width:10%;"><a style="color:black;" href="#">Start Date</a></th>
                <th style="width:10%;"><a style="color:black;" href="#">End Date</a></th>
                <th style="width:20%;">Services Booked</a></th>
                <th style="width:10%;"><a style="color:black" href="#">Deal Status</a></th>
                <th style="width:10%;"><a style="color:black" href="#">Deal Owner</th>
             </tr>
   		</thead>
			<c:forEach items="${FILTERED_DEAL_RECORDS}" var="dealObj">
			<tr>
                <td style="width:10%;"><a style="color:black;" href="#">${dealObj.dealConfirmationId}</a></td>
                <td style="width:10%;"><fmt:formatDate value="${dealObj.bookingDate}" pattern="dd-MM-yyyy" /></td>
                <td style="width:20%;">${dealObj.clientName}</th>
                <td style="width:10%;"><fmt:formatDate value="${dealObj.travelStartDate}" pattern="dd-MM-yyyy" /></td>
                <td style="width:10%;"><fmt:formatDate value="${dealObj.travelEndDate}" pattern="dd-MM-yyyy" /></td>
                <td style="width:20%;">   
                	<c:forEach var="listValue" items="${dealObj.serviceList}" varStatus="loopCounter">
                    	<img src="${pageContext.request.contextPath}/resources/images/${listValue.trim()}.jpg" height="25" width="25">
                    </c:forEach>
                </td>
                <td style="width:10%;">${dealObj.statusName}</a></td>
                <td style="width:10%;">${dealObj.dealOwnerName}</td>
             </tr>
			</c:forEach>

            </tr>
        </table>


        <div id="pagination" align="center" style="margin:10px 0">
          <font style="color:#ffa500;background:black;display:inline-block;padding:2px;border-radius:2px">Page:</font> 
            <c:url value="view_open_task_form_user" var="prev">
                <c:param name="page" value="${page-1}" />
            </c:url>
            <c:if test="${page > 0}">
                <a  style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href="<c:out value="
                    ${prev}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&taskPriority=${taskPriority}" />"
                >Prev</a>
            </c:if>

            <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                <c:choose>
                    <c:when test="${(page+1) == i.index}">
                        <span style="background:black;padding:2px 5px;border-radius:2px;color:white">${i.index}</span>
                    </c:when>
                    <c:otherwise>
                        <c:url value="view_open_task_form_user" var="url">
                            <c:param name="page" value="${i.index-1}" />
                        </c:url>
                        <a
                          style="padding:2px 5px;border-radius:2px;color:black"  href='<c:out value="${url}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}" />'>${i.index}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:url value="view_open_task_form_user" var="next">
                <c:param name="page" value="${page + 1}" />
            </c:url>
            <c:if test="${page + 1 < maxPages}">
                <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href='<c:out value="${next}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&taskPriority=${taskPriority}" />'
                    class="pn next">Next</a>
            </c:if>
        </div>
    


   <script>
$('#dealName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getDealInfo',
	paramName: "dealKeyword",
	delimiter: ",",
	onSelect: function(suggestion) {
        dealID = suggestion.data;
        id=cityID;
        jQuery("#dealConfirmationId").val(dealID);
        $('input[name=dealName]').val(id);
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

</script>

</body>

</html>