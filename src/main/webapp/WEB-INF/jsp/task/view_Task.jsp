<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>view_Task</title>
    	<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<style>

        body::before {
            content: "";
            background-image:   url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);
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

    <!-- ############# side menu bar ################## -->
    <div class="cnt_options">
        <a href="#" >Create Task</a>
        <a href="view_open_task_form_user" style="color:white;background:black"> Open Tasks</a>
        <a href="view_open_task_form_user_filter_due_today">Due Today</a>
        <a href="view_open_over_due_task_form_user">Over Due</a>
        <a href="view_open_my_created_task_form_user">Created By Me</a>
        <a href="view_open_my_assigned_task_form_user">Assigned to me</a>
        <a href="view_completed_task_form_user">Completed</a>
    </div>



    <div class="view_Task container">
        <div class="view_Task_wrapper bs">
            <form:form action="view_form_edit_task" modelAttribute="TASK_RECORDER_OBJ">
                <form:hidden path="taskId" />
                <div class="view_task_box_divide">
                    <div class="view_Task_wrapper_data" >
                        <div class="view_Task_wrapepr_data_line a" >
                            <div class="view_Task_wrapepr_data_l1">
                                <label for="">Task Title </label>
                                <p style="color:gray">${TASK_RECORDER_OBJ.taskTitle}</p>
                            </div>
                        </div>
                        <div class="view_Task_wrapepr_data_line2 a">
                            <div class="view_Task_wrapepr_data_l1">
                                <label for="">Assigned to</label>
                                <p style="color:gray">${TASK_RECORDER_OBJ.taskOwnerName}</p>
                            </div>
                            <div class="view_Task_wrapepr_data_l1">
                                <label for="">Priority</label>
                                <p style="color:gray">${TASK_RECORDER_OBJ.taskPriority}</p>
                            </div>
                        </div>
                        <div class="view_Task_wrapepr_data_line3 a">
                            <div class="view_Task_wrapepr_data_l1">
                                <label for="">Status</label>
                                <p style="color:gray">${TASK_RECORDER_OBJ.taskStatus}</p>
                            </div>
                            <div class="view_Task_wrapepr_data_l1">
                                <label for="">Due Date</label>
                                <p style="color:gray">${localDateTimeFormat.format(TASK_RECORDER_OBJ.taskDueDate)}</p>
                            </div>
                        </div>
                        <div class="view_Task_wrapepr_data_line4 a">
                            <div class="view_Task_wrapepr_data_l1">
                                <label for="">Link with deal</label>
                                <p style="color:gray">
                                    <c:if test="${TASK_RECORDER_OBJ.dealConfirmationId != 0}">
                                        ${TASK_RECORDER_OBJ.dealConfirmationId}
                                    </c:if>
                                </p>
                            </div>
                        </div>
                        <div class="view_Task_wrapepr_data_line4 a" style="width:100%">
                            <div class="view_Task_wrapepr_data_l1" style="width:100%">
                                <label for="">Description</label>
                                <p style="color:gray">${TASK_RECORDER_OBJ.taskDescription}</p>
                            </div>
                        </div>
                        <div class="due_today_task_data_btns">
                            <input type="submit" value="Edit" name="Edit" />
                            <c:if test="${VIEW_SOURCE eq 'OPEN_TASK'}">
                                <a href="view_open_task_form_user">Cancel</a>
                            </c:if>
                            <c:if test="${VIEW_SOURCE eq 'DUE_TODAY'}">
                                <a href="view_open_task_form_user_filter_due_today">Cancel</a>
                            </c:if>
                            <c:if test="${VIEW_SOURCE eq 'OVER_DUE'}">
                                <a href="view_open_over_due_task_form_user">Cancel</a>
                            </c:if>
                            <c:if test="${VIEW_SOURCE eq 'MY_CREATED'}">
                                <a href="view_open_my_created_task_form_user">Cancel</a>
                            </c:if>
                            <c:if test="${VIEW_SOURCE eq 'MY_ASSIGNED'}">
                                <a href="view_open_my_assigned_task_form_user">Cancel</a>
                            </c:if>
                            <c:if test="${VIEW_SOURCE eq 'COMPLETED_TASK'}">
                                <a href="view_completed_task_form_user">Cancel</a>
                            </c:if>
                        </div>
                    </div>
                    <div class="view_Task_wrapper_data_comment_side">
                        <div class="view_Task_wrapper_data_comment_title">
                            <label for="">${pageContext.request.remoteUser} Says:</label><br>
                            <textarea name="taskComment" id="taskComment" cols="70" rows="4" style="width:100%"></textarea>
                        </div>
                        <div class="due_today_task_data_btns">
                            <input type="submit" value="Update Comments" name="Update Comments" />
                        </div>
                        <div class="commemts-sec">
                            <c:forEach items="${FILTERED_TASK_COMMENTS}" var="filteredTaskComments" >
                            <div class="commentBox" style="background:#eaf4f4;margin:5px 0 ;border-radius:5px;border:2px solid black">
                            <div style="display:flex;">
                            <p style="padding:5px;color:#003049;display:inline-block;font-weight:bold;width:95%;text-align:start"> <span style="color:red">${filteredTaskComments.commentedBy}</span>  <br>  ${filteredTaskComments.ttComment} </p>
                            <p style="padding:5px;;display:inline-block;color:gray">  ${localDateTimeFormat.format(filteredTaskComments.lastUpdated )}</p> 
                                     </div>            
                                   
                                </div>
    
                            </c:forEach>
                        </div>
                        <div id="pagination" align="right" style="margin-top:20px">
                           <p style="color:#ffa500;background:black;display:inline-block;padding:2px;border-radius:2px">Page : </p>
                            <c:url value="view_view_task" var="prev">
                                <c:param name="page" value="${page-1}" />
                            </c:url>
                            <c:if test="${page > 0}">
                                <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href="<c:out value=" ${prev}&taskId=${TASK_RECORDER_OBJ.taskId}" />" class="pn
                                prev" style="color:#FFBA08">Prev</a>
                            </c:if>

                            <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                                <c:choose>
                                    <c:when test="${(page+1) == i.index}">
                                        <span style="background:black;padding:2px 5px;border-radius:2px;color:white">${i.index}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <c:url value="view_view_task" var="url">
                                            <c:param name="page" value="${i.index-1}" />
                                        </c:url>
                                        <a style="background:white;padding:2px 5px;border-radius:2px;color:black"
                                            href='<c:out value="${url}&taskId=${TASK_RECORDER_OBJ.taskId}" />'>${i.index}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:url value="view_view_task" var="next">
                                <c:param name="page" value="${page + 1}" />
                            </c:url>
                            <c:if test="${page + 1 < maxPages}">
                                <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href='<c:out value="${next}&taskId=${TASK_RECORDER_OBJ.taskId}" />'
                                    class="pn next" style="color:#FFBA08">Next</a>
                            </c:if>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</body>

</html>