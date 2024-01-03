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
    <title>Create new task</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
	<link href="<c:url value="/resources/css/jquery.datetimepicker.min.css" />" rel="stylesheet">
		<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
	<script src="<c:url value="/resources/js/jquery.datetimepicker.full.js" />"></script>
</head>
<style>
  body::before {
            content: "";
            background-image: url(${pageContext.request.contextPath}/resources/images/revamped/create_new_task.jpg);
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

        <div class="cnt_options">
            <a href="#" style="color:white;background:black">Create Task</a>
            <a href="view_open_task_form_user"> Open Tasks</a>
            <a href="view_open_task_form_user_filter_due_today">Due Today</a>
            <a href="view_open_over_due_task_form_user">Over Due</a>
            <a href="view_open_my_created_task_form_user">Created By Me</a>
            <a href="view_open_my_assigned_task_form_user">Assigned to me</a>
            <a href="view_completed_task_form_user">Completed</a>
        </div>

    <div class="create-new-task-wrapper container">
        <font color="#32cd32"> ${Success} </font>
        <font color="red"> ${Error}</font>
        <h1 class="create_new_task_title" style="font-size:30px;color: #FFBA08;margin-bottom: 10px;">Create New Task</h1>
        <form:form action="create_create_task_form_user" modelAttribute="TASK_RECORDER_OBJ">
            <div class="create-new-task-wrapper-f-li">

                <div class="create-new-task-wrapper-f-li-d1 cntb">
                    <label for="taskTitle">Task title</label> <br>
                    <input class="form-control search-slt" type="text" name="taskTitle" id="taskTitle"
                        placeholder="Enter Title" required />
                </div>
                <div class="create-new-task-wrapper-f-li-d2 cntb">
                    <label for="cntat">Assigned to</label> <br>
                    <form:select path="taskOwner" style="width: 270px;" min="1" required="required">
                        <option class="service-small" value=""  style="background:black;color:white"> -----Select User----</option>
                        <form:options items="${ACTIVE_USERS_MAP}" class="service-small"  style="background:black;color:white" />
                    </form:select>
                </div>
                <div class="create-new-task-wrapper-f-li-d3 cntb">
                    <label for="cntp">Priority</label> <br>
                    <select id="taskPriority" name="taskPriority" required style="width: 270px;">
                        <option class="service-small" value="" style="background:black;color:white"> -----Select Priority----</option>
                        <c:if test="${not empty TASK_PRIORITY}">
                            <c:forEach items="${TASK_PRIORITY}" var="taskPriority">
                                <option class="service-small" value="${taskPriority}" style="background:black;color:white">${taskPriority}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                </div>
                <div class="create-new-task-wrapper-f-li-2-d1 cntb">
                    <label for="cnts">Status</label> <br>
                    <form:select path="taskStatus" style="width: 260px;">
                        <form:options items="${TASK_STATUS}" class="service-small" style="background:black;color:white"/>
                    </form:select>
                </div>
            </div>
            <div class="create-new-task-wrapper-f-li-2">
                <div class="create-new-task-wrapper-f-li-2-d2 cntb2">
                    <label for="cntdd">Due Date</label> <br>
                    	<input id="taskDueDate" name="taskDueDate" required />
                </div>
                <div class="create-new-task-wrapper-f-li-2-d3 cntb2 ">
                    <label for="cntlwd">Link with deal</label> <br>
                    <input type="text" name="dealName" id="dealName"
                        placeholder="numeric Deal or Client Name " />
                    <input type="hidden" id="dealConfirmationId" name="dealConfirmationId" />
                </div>
               
            </div>
             <div class="cnt_des cntb-des">
                    <label for="">Description</label>
                    <textarea  rows="10" cols="250" name="taskDescription"></textarea>
                </div>
            <div class="due_today_task_data_btnss" style="margin-top:15px">
               <input type="submit" id="create" value="Create" />
               <a href="view_open_task_form_user" ><input type="button" value="Cancel"></a>
            </div>
        </form:form>
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
            $("#create").on('click', function () {
                var getValue = $("#taskDueDate").val();
                //$("#taskDueDate").val(getValue);
                $('input[name=taskDueDate]').val(getValue);
            });
        });

        $("#taskDueDate").datetimepicker();

    </script>


</body>

</html>