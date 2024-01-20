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
    <title>view_Task</title>
    	<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body  style="background: url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">

      <!-- ############# side menu bar ################## -->
    <div class="cnt_options">
            <a href="view_create_ticket_form_user"  >Create Ticket</a>
            <a href="view_open_ticket_form_user" style="color:white;background:black"> Open Ticket</a>
            <a href="view_open_ticket_form_user_filter_due_today">Due Today</a>
            <a href="view_open_over_due_ticket_form_user">Over Due</a>
            <a href="view_open_my_created_ticket_form_user">Created By Me</a>
            <a href="view_open_my_assigned_ticket_form_user">Assigned to me</a>
            <a href="view_completed_ticket_form_user">Completed</a>
        </div>



    <div class="view_Task container">
        <div class="view_Task_wrapper">
            <form:form action="view_form_edit_ticket" modelAttribute="TICKET_RECORDER_OBJ">
                <form:hidden path="ticketId" />
                <div class="view_task_box_divide">
                    <div class="view_Task_wrapper_data">
                        <div class="view_Task_wrapepr_data_line a">
                            <div class="view_Task_wrapepr_data_l1">
                                <label for="">Ticket Title</label>
                                <p>${TICKET_RECORDER_OBJ.ticketTitle}</p>
                            </div>
                        </div>
                        <div class="view_Task_wrapepr_data_line2 a">
                            <div class="view_Task_wrapepr_data_l1">
                                <label for="">Assigned to</label>
                                <p>${TICKET_RECORDER_OBJ.ticketOwnerName}</p>
                            </div>
                            <div class="view_Task_wrapepr_data_l1 ">
                                <label for="">Priority</label>
                                <p>${TICKET_RECORDER_OBJ.ticketPriority}</p>
                            </div>
                        </div>
                        <div class="view_Task_wrapepr_data_line3 a">
                            <div class="view_Task_wrapepr_data_l1">
                                <label for="">Status</label>
                                <p>${TICKET_RECORDER_OBJ.ticketStatus}</p>
                            </div>
                            <div class="view_Task_wrapepr_data_l1">
                                <label for="">Due Date</label>
                                <p>${localDateTimeFormat.format(TICKET_RECORDER_OBJ.ticketDueDate)}</p>
                            </div>
                        </div>
                        <div class="view_Task_wrapepr_data_line4 a">
                            <div class="view_Task_wrapepr_data_l1">
                                <label for="">Link with deal</label>
                                <p>
                                    <c:if test="${TICKET_RECORDER_OBJ.dealConfirmationId != 0}">
                                        ${TICKET_RECORDER_OBJ.dealConfirmationId}
                                    </c:if>
                                </p>
                            </div>
                        </div>
                        <div class="view_Task_wrapepr_data_line4 a">
                            <div class="view_Task_wrapepr_data_l1">
                                <label for="">Description</label>
                                <p>${TICKET_RECORDER_OBJ.ticketDescription}</p>
                            </div>
                        </div>
                        <div class="due_today_task_data_btns">
                            <input type="submit" value="Edit" name="Edit" />
                            <c:if test="${VIEW_SOURCE eq 'OPEN_TICKET'}">
                                <a href="view_open_ticket_form_user">Cancel</a>
                            </c:if>
                            <c:if test="${VIEW_SOURCE eq 'DUE_TODAY'}">
                                <a href="view_open_ticket_form_user_filter_due_today">Cancel</a>
                            </c:if>
                            <c:if test="${VIEW_SOURCE eq 'OVER_DUE'}">
                                <a href="view_open_over_due_ticket_form_user">Cancel</a>
                            </c:if>
                            <c:if test="${VIEW_SOURCE eq 'MY_CREATED'}">
                                <a href="view_open_my_created_ticket_form_user">Cancel</a>
                            </c:if>
                            <c:if test="${VIEW_SOURCE eq 'MY_ASSIGNED'}">
                                <a href="view_open_my_assigned_ticket_form_user">Cancel</a>
                            </c:if>
                            <c:if test="${VIEW_SOURCE eq 'COMPLETED_TICKET'}">
                                <a href="view_completed_ticket_form_user">Cancel</a>
                            </c:if>
                        </div>
                    </div>


                    <!-- ############# taken code starts ########### -->
                    <div class="view_Task_wrapper_data_comment_side">
                        <div class="view_Task_wrapper_data_comment_title">
                            <label for="">${pageContext.request.remoteUser} Says:</label><br>
                            <textarea cols="70" rows="4" name="ticketComment" style="font-size: 18px;"></textarea>
                        </div>
                        <div class="due_today_task_data_btns">
                            <input type="submit" value="Update Comments" name="Update Comments" />
                        </div>
                        <div class="commemts-sec">
                            <c:forEach items="${FILTERED_TICKET_COMMENTS}" var="filteredTicketComments">
                                <div class="commentBox" style="background:#cce3de;margin:5px 0 ;border-radius:5px">
                                    <div style="display:flex">
                                        <p
                                            style="color:#003049;display:inline-block;margin-right:350px;font-weight:bold;margin-left:5px">
                                            ${filteredTicketComments.commentedBy}</p>

                                        <p style="display:inline-block;color:gray">
                                            ${localDateTimeFormat.format(filteredTicketComments.lastUpdated )}</p>
                                    </div>
                                    <p style="color:black">${filteredTicketComments.ttComment }</p>
                                </div>

                            </c:forEach>
                        </div>
                        <div id="pagination" align="right">
                            Page:
                            <c:url value="view_view_ticket" var="prev">
                                <c:param name="page" value="${page-1}" />
                            </c:url>
                            <c:if test="${page > 0}">
                                <a href="<c:out value=" ${prev}&ticketId=${TICKET_RECORDER_OBJ.ticketId}" />" class="pn
                                prev">Prev</a>
                            </c:if>

                            <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                                <c:choose>
                                    <c:when test="${(page+1) == i.index}">
                                        <span>${i.index}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <c:url value="view_view_ticket" var="url">
                                            <c:param name="page" value="${i.index-1}" />
                                        </c:url>
                                        <a
                                            href='<c:out value="${url}&ticketId=${TICKET_RECORDER_OBJ.ticketId}" />'>${i.index}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:url value="view_view_ticket" var="next">
                                <c:param name="page" value="${page + 1}" />
                            </c:url>
                            <c:if test="${page + 1 < maxPages}">
                                <a href='<c:out value="${next}&ticketId=${TICKET_RECORDER_OBJ.ticketId}" />'
                                    class="pn next">Next</a>
                            </c:if>
                        </div>
                    </div>
                    <!-- ############# taken code ends ########### -->
                </div>
            </form:form>
        </div>
    </div>
</body>

</html>