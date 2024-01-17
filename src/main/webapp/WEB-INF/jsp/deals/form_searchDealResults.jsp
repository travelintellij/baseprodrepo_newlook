<!DOCTYPE html>
<html lang="en">
    <jsp:include page="form_searchDeal.jsp" />
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>form_searchDealResults</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
<script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="form_searchDealResults">
        <div class="form_searchDealResults_wrapper">
            <div class="form_searchDealResults_wrapper_data">
                <div class="form_searchDealResults_wdl">
                        <div align="center"><span style="background:black;color:white;padding:0 10px;margin-bottom:10px;border-radius:5px;color:#32cd32 ">Total Deals Found : ${FILTERED_DEAL_RECORDS.size()}</span></div>
                        <table class="deal_table">
                            <tr style="background:#6082B6;height:40px">
                                <th style="width: 5%;" align="center">Deal #</th>
                                <th style="width: 5%;" align="center">Query #</th>
                                <th style="width: 15%;">Booking Date</th>
                                <th style="width: 20%;">Client Name </th>
                                <th style="width: 10%;">Travel Date</th>
                                <th style="width: 20%;">Services Booked</th>
                                <th style="width: 10%;">Deal Status</th>
                                <th style="width: 10%;">Deal Owner</th>
                                <th style="width: 5%;">Action</th>
                            </tr>
                        
                            <c:forEach items="${FILTERED_DEAL_RECORDS}" var="dealObj">
                                <tr >
                                    <td style="width: 100px;border-bottom:2px solid #F8AF51;border-left:2px solid #F8AF51;border-right:2px solid #F8AF51">${dealObj.dealConfirmationId}</td>
                                    <td style="width: 100px;border-bottom:2px solid #F8AF51;border-right:2px solid #F8AF51">${dealObj.queryId}</td>
                                    <td style="width: 100px;border-bottom:2px solid #F8AF51;border-right:2px solid #F8AF51">
                                        <fmt:formatDate value="${dealObj.bookingDate}" pattern="dd-MM-yyyy" />
                                    </td>
                                    <td style="width: 200px;border-bottom:2px solid #F8AF51;border-right:2px solid #F8AF51">${dealObj.clientName}</td>
                                    <td style="width: 100px;border-bottom:2px solid #F8AF51;border-right:2px solid #F8AF51">
                                        <fmt:formatDate value="${dealObj.travelStartDate}" pattern="dd-MM-yyyy" />
                                    </td>
                        
                                    <td style="width: 250px;border-bottom:2px solid #F8AF51;border-right:2px solid #F8AF51">
                                        <c:forEach var="listValue" items="${dealObj.serviceList}" varStatus="loopCounter">
                                            <img src="${pageContext.request.contextPath}/resources/images/${listValue.trim()}.jpg" height="25"
                                                width="25">
                                        </c:forEach>
                                    </td>
                        
                                    <td style="width: 120px;border-bottom:2px solid #F8AF51;border-right:2px solid #F8AF51">${dealObj.statusName}</td>
                                    <td style="width: 120px;border-bottom:2px solid #F8AF51;border-right:2px solid #F8AF51">${dealObj.dealOwnerName}</td>
                                    <td style="width: 200px;border-bottom:2px solid #F8AF51;border-right:2px solid #F8AF51">
                                    
                                    <i class="fa-solid fa-sliders deal_menu_icon" >
                                    
                                    <div class="deal_menu">
                                    <a href="view_view_deal_form?dealConfirmationId=${dealObj.dealConfirmationId}"> View Deal </a>  
                                    <a style="margin:10px 0 !important"  href="view_edit_deal_form?dealConfirmationId=${dealObj.dealConfirmationId}">Edit Deal </a>  
                                    <a target="_blank" href="view_workload_createNewWorkLoadForm?dealConfirmationId=${dealObj.dealConfirmationId}">WorkLoad</a>
                                    </div>

                                    </i>
                                    
                                   
                                    </td>
                                </tr>
                            </c:forEach>
                        
                        </table>
                </div>
            </div>
        </div>
    </div>
        <div id="pagination" align="center">
            Page:
            <c:url value="view_filter_deals" var="prev">
                <c:param name="page" value="${page-1}" />
            </c:url>
            <c:if test="${page > 0}">
                <a href="<c:out value="
                    ${prev}&sortBy=${sortBy}&dealStatus=${FILTER_DEAL_OBJ.dealStatus}&startDate=${FILTER_DEAL_OBJ.startDate}&endDate=${FILTER_DEAL_OBJ.endDate}&searchOnBookingDate=${FILTER_DEAL_OBJ.searchOnBookingDate}" />"
                class="pn prev">Prev</a>
            </c:if>
        
            <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                <c:choose>
                    <c:when test="${(page+1) == i.index}">
                        <span>${i.index}</span>
                    </c:when>
                    <c:otherwise>
                        <c:url value="view_filter_deals" var="url">
                            <c:param name="page" value="${i.index-1}" />
                        </c:url>
                        <a
                            href='<c:out value="${url}&sortBy=${sortBy}&dealStatus=${FILTER_DEAL_OBJ.dealStatus}&startDate=${FILTER_DEAL_OBJ.startDate}&endDate=${FILTER_DEAL_OBJ.endDate}&searchOnBookingDate=${FILTER_DEAL_OBJ.searchOnBookingDate}" />'>${i.index}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:url value="view_filter_deals" var="next">
                <c:param name="page" value="${page + 1}" />
            </c:url>
            <c:if test="${page + 1 < maxPages}">
                <a href='<c:out value="${next}&sortBy=${sortBy}&dealStatus=${FILTER_DEAL_OBJ.dealStatus}&startDate=${FILTER_DEAL_OBJ.startDate}&endDate=${FILTER_DEAL_OBJ.endDate}&searchOnBookingDate=${FILTER_DEAL_OBJ.searchOnBookingDate}" />'
                    class="pn next">Next</a>
            </c:if>
        </div>
</body>
</html>