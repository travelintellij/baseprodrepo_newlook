<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>edit_Task</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    
    <link href="<c:url value="/resources/css/jquery.datetimepicker.min.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/js/jquery.datetimepicker.full.js" />"></script>
</head>

<body  style="background: url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
    <!-- ############# side menu bar ################## -->
    <div class="cnt_options">
        <a href="#">Create Task</a>
        <a href="view_open_task_form_user" style="color:white;background:black"> Open Tasks</a>
        <a href="view_open_task_form_user_filter_due_today">Due Today</a>
        <a href="view_open_over_due_task_form_user">Over Due</a>
        <a href="view_open_my_created_task_form_user">Created By Me</a>
        <a href="view_open_my_assigned_task_form_user">Assigned to me</a>
        <a href="view_completed_task_form_user">Completed</a>
    </div>


    <div class="edit_Task container">
        <div class="edit_Task_wrapper">
        <h1 class="page-heading">Edit Task</h1>
            <form:form action="edit_edit_task_form_user" modelAttribute="TASK_RECORDER_OBJ">
                <form:hidden path="taskId" />
                <div class="edit_Task_wrapper_data">
                    <div class="edit_Task_wrapper_data_line">
                        <div class="edit_Task_wrapper_data_l1">
                            <label for="">Task Title</label> <br>
                            <form:input path="taskTitle" class="form-control search-slt" name="taskTitle"
                                required="required" />
                        </div>
                        <div class="edit_Task_wrapper_data_l1">
                            <label for="">Assigned to</label> <br>
                            <form:select path="taskOwner" min="1" required="required" style="width:90%">
                                <option class="service-small" value=""> -----Select User----</option>
                                <form:options items="${ACTIVE_USERS_MAP}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="edit_Task_wrapper_data_l1">
                            <label for="">Priority</label> <br>
                            <form:select path="taskPriority" min="1" required="required" style="width:90%">
                                <option class="service-small" value=""> -----Select User----</option>
                                <form:options items="${TASK_PRIORITY_MAP}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="edit_Task_wrapper_data_l1">
                            <label for="">Status</label> <br>
                            <form:select path="taskStatus" style="width:90%">
                                <form:options items="${TASK_STATUS}" class="service-small" />
                            </form:select>
                        </div>
                    </div>
                    <div class="edit_Task_wrapper_data_line2">
                        <div class="edit_Task_wrapper_data_l1">
                            <label for="">Due Date</label> <br>
                            <fmt:parseDate value="${TASK_RECORDER_OBJ.taskDueDate}" pattern="yyyy-MM-dd'T'HH:mm"
                                var="parsedDateTime" type="both" />
                            <fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${ parsedDateTime }" var="parsedDate" />
                            <input id="taskDueDate" name="taskDueDate" value="${parsedDate}" required />
                            
                        </div>
                        <div class="edit_Task_wrapper_data_l1">
                            <label for="">Link with deal</label> <br>
                            <input class="form-control search-slt" type="text" name="dealName" id="dealName"
                                placeholder="Deal Search - Enter Only numeric Deal # or Client Name "
                                value="${TASK_RECORDER_OBJ.dealConfirmationId }" style="width:90%"/>
                            <input type="hidden" id="dealConfirmationId" name="dealConfirmationId"
                                value="${TASK_RECORDER_OBJ.dealConfirmationId}" />
                        </div>
                        <div class="edit_Task_wrapper_data_l1_des">
                            <label for="">Description</label> <br>
                            <form:textarea path="taskDescription" rows="1" cols="66.5" maxlength="1100" />
                        </div>
                    </div>
                    <div class="edit_Task_wrapper_data_line2_confom">
                        <div class="edit_Task_wrapper_data_l1">
                            <label for="" style=" color:#FFBA08;font-weight: bold;">Inform Mate</label> <br>
                            <form:checkbox path="notifyTaskOwner" name="transfers" />
                            <p>(if checked email will be sent to task owner)</p>
                        </div>
                    </div>
                    <div class="due_today_task_data_btns">
                        <input type="submit" id="Update" value="Update" />
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

    <script>
        $('#dealName').autocomplete({
            serviceUrl: '${pageContext.request.contextPath}/getDealInfo',
            paramName: "dealKeyword",
            delimiter: ",",
            onSelect: function (suggestion) {
                dealID = suggestion.data;
                id = dealID;
                jQuery("#dealConfirmationId").val(dealID);
                $('input[name=dealName]').val(id);
                return false;
            },
            transformResult: function (response) {
                return {
                    suggestions: $.map($.parseJSON(response), function (item) {
                        return { value: item.tagName, data: item.id };
                    })

                };
            }
        });

    </script>
    <script>

        $(document).ready(function () {
            $("#Update").on('click', function () {
                var getValue = $("#taskDueDate").val();
                //$("#taskDueDate").val(getValue);
                $('input[name=taskDueDate]').val(getValue);
            });
        });

        $("#taskDueDate").datetimepicker();

    </script>



</body>

</html>