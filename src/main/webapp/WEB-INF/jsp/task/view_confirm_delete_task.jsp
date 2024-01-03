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
    <title>view_confirm_delete_task</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
	<script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body  style="background: url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">


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


    <div class="view_confirm_delete_task container">
        <div class="view_confirm_delete_task_wrapper">
            <h1 class="page-heading" style="color:red">Confirm Delete <i class="fas fa-exclamation-triangle fa-xl"></i></h1>
            <form:form action="${action}" modelAttribute="TASK_RECORDER_OBJ">
                <input type="hidden" name="taskId" value="${TASK_RECORDER_OBJ.taskId}" />
                <div class="view_confirm_delete_task_wrapper_data">
                    <div class="view_confirm_delete_task_wrapper_data_line bc-clr">
                        <div class="view_confirm_delete_task_wrapper_data_l1">
                            <label for="">Task Id</label>
                            <p>${TASK_RECORDER_OBJ.taskId}</p>
                        </div>
                        <div class="view_confirm_delete_task_wrapper_data_l1">
                            <label for="">Task Title</label>
                            <p>${TASK_RECORDER_OBJ.taskTitle}</p>
                        </div>
                        <div class="view_confirm_delete_task_wrapper_data_l1">
                            <label for="">Assgined To</label>
                            <p>${TASK_RECORDER_OBJ.taskOwnerName}</p>
                        </div>
                        <div class="view_confirm_delete_task_wrapper_data_l1">
                            <label for="">Priority</label>
                            <p>${TASK_RECORDER_OBJ.taskPriority}</p>
                        </div>
                    </div>
                    <div class="view_confirm_delete_task_wrapper_data_line bc-clr">
                        <div class="view_confirm_delete_task_wrapper_data_l1">
                            <label for="">Status</label>
                            <p>${TASK_RECORDER_OBJ.taskStatus}</p>
                        </div>
                        <div class="view_confirm_delete_task_wrapper_data_l1">
                            <label for="">Due Date</label>
                            <p>${localDateTimeFormat.format(TASK_RECORDER_OBJ.taskDueDate)}</p>
                        </div>
                        <div class="view_confirm_delete_task_wrapper_data_l1_link">
                            <label for="">Link with deal</label>
                            <p>
                                <c:if test="${TASK_RECORDER_OBJ.dealConfirmationId != 0}">
                                    UDN-${TASK_RECORDER_OBJ.dealConfirmationId}
                                </c:if>
                                <c:if test="${TASK_RECORDER_OBJ.dealConfirmationId == 0}">
                                    None
                                </c:if>
                            </p>
                        </div>
                    </div>
                    <div class="view_confirm_delete_task_wrapper_data_line bc-clr">
                        <div class="view_confirm_delete_task_wrapper_data_l1">
                            <label for="">Description</label>
                            <p>${TASK_RECORDER_OBJ.taskDescription}</p>
                        </div>
                    </div>
                    <div class="due_today_task_data_btns">
                        <input type="submit" value="Delete" style="background:red;color:white"/>
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
            </form:form>
        </div>
    </div>
</body>

</html>