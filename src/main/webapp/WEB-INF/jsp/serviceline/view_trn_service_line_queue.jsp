<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


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
        table, th, td {
  border: 1px solid black;
}
</style>
<body>



 <div class="cnt_options ">
            <a href="get_deals_service_line_queue_user" >Deals</a>
            <a href="get_flight_service_line_queue_user">Flight</a>
            <a href="get_hotel_service_line_queue_user">Hotel</a>
            <a href="get_insurance_service_line_queue_user">Insurance</a>
             <a href="get_transfers_service_line_queue_user" style="color:white;background:black">Transfers</a>
            <a href="get_sightseeing_service_line_queue_user">SightSeeing</a>
            <a href="get_landpackage_service_line_queue_user">Land Package</a>
            <a href="get_visa_service_line_queue_user">Visa</a>
            <a href="get_other_service_line_queue_user">Other</a>
  </div>




<br>	
<h3 align="center"><b>Transfers Service Line</b></h3>
	
	 <div class="container">
<form:form action="get_transfers_service_line_queue_user" modelAttribute="FILTER_SL">
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
						<input type="button" style="background-color:green;color:white;width:200px;" value="Completed" />                
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
              <a href="get_transfers_service_line_queue_user"><input type="button" value="Clear Filter" /></a>
            </div>
        </div>
	
	</div>
		<c:set value="${TRN_PAGE_LIST}" var="fltPageList" />
	<table class="view_task_table" style="width:80%; margin-left: auto;margin-right: auto;">
        <thead style="background:#6082B6;height:50px;">
            <tr>
                <th style="width:5%;"><a style="color:black;" href="#">Deal #</a></th>
                <th style="width:15%;">Client Name</th>
                <th style="width:9%;"><a style="color:black;" href="#">Pickup City Name</a></th>
                <th style="width:9%;"><a style="color:black;" href="#">Pickup From</a></th>
                <th style="width:9%;"><a style="color:black;" href="#">Drop City Name</a></th>
                <th style="width:9%;"><a style="color:black" href="#">Drop To</a></th>
                <th style="width:9%;"><a style="color:black" href="#">Transfer Date</a></th>
                <th style="width:10%;"><a style="color:black" href="#">SL Status</th>
                <th style="width:10%;"><a style="color:black" href="#">Deal Owner</th>
                <th style="width:15%;"><a style="color:black" href="#">Action</th>
             </tr>
   		</thead>
		<c:forEach items="${fltPageList}" var="flt">
				<tr>
					<td style="width:5%;">${flt.dealConfirmationId}</td>
					<td style="width:15%;">${flt.clientName}</td>
					<td style="width:9%;">${flt.pickupCityName}</td>
					<td style="width:9%;">${flt.pickUpFromName}</td>
					<td style="width:9%;">${flt.dropCityName}</td>
					<td style="width:9%;">${flt.dropToName}</td>
					<td style="width:9%;">${flt.transferDate}</td>
					<td style="width:10%;">${flt.statusName}</td>
					<td style="width:10%;">${flt.dealOwnerName}</td>
					<td style="width:15%;"><a target="_blank" href="view_workload_createNewWorkLoadForm?dealConfirmationId=${flt.dealConfirmationId}"><input type="button" style="background-color: #786AAF;color:white;padding: 4px 5px;" value="Workload" /></a> | <a href="view_view_deal_form?dealConfirmationId=${flt.dealConfirmationId}"><input type="button" style="background-color: #786AAF;color:white;padding: 4px 5px;"value="Deal" /></a> </a></td>
				</tr>
			</c:forEach>

            </tr>
        </table>
		</form:form>
	
	     <div id="pagination" align="center" style="margin:10px 0">
          <font style="color:#ffa500;background:black;display:inline-block;padding:2px;border-radius:2px">Page:</font> 
            <c:url value="get_transfers_service_line_queue_user" var="prev">
                <c:param name="page" value="${page-1}" />
            </c:url>
            <c:if test="${page > 0}">
                <a  style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href="<c:out value="${prev}&sortBy=${sortBy}&dealOwner=${dealOwner}&dealConfirmationId=${dealConfirmationId}&upcomingDeal=${upcomingDeal}" />"
                >Prev</a>
            </c:if>

            <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                <c:choose>
                    <c:when test="${(page+1) == i.index}">
                        <span style="background:black;padding:2px 5px;border-radius:2px;color:white">${i.index}</span>
                    </c:when>
                    <c:otherwise>
                        <c:url value="get_transfers_service_line_queue_user" var="url">
                            <c:param name="page" value="${i.index-1}" />
                        </c:url>
                        <a style="padding:2px 5px;border-radius:2px;color:black"  href='<c:out value="${url}&sortBy=${sortBy}&dealOwner=${dealOwner}&dealConfirmationId=${dealConfirmationId}&upcomingDeal=${upcomingDeal}" />'>${i.index}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:url value="get_transfers_service_line_queue_user" var="next">
                <c:param name="page" value="${page + 1}" />
            </c:url>
            <c:if test="${page + 1 < maxPages}">
                <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href='<c:out value="${next}&sortBy=${sortBy}&dealOwner=${dealOwner}&dealConfirmationId=${dealConfirmationId}&upcomingDeal=${upcomingDeal}" />'
                    class="pn next">Next</a>
            </c:if>
        </div>
    


