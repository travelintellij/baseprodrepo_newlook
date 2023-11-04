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
    <title>Due today task</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body
    style="background: url(${pageContext.request.contextPath}/resources/images/revamped/due_task_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">

    <div class="cnt_options">
        <a href="view_create_ticket_form_user">Create Ticket</a>
        <a href="view_open_ticket_form_user"> Open Ticket</a>
        <a href="view_open_ticket_form_user_filter_due_today">Due Today</a>
        <a href="view_open_over_due_ticket_form_user">Over Due</a>
        <a href="view_open_my_created_ticket_form_user">Created By Me</a>
        <a href="view_open_my_assigned_ticket_form_user">Assigned to me</a>
        <a href="view_completed_ticket_form_user">Completed</a>
    </div>


    <div class="due_date_task container">
        <form:form action="view_open_due_today_task_form_user" modelAttribute="TASK_FILTER_OBJ">
            <div class="due_date_task_wrapper">
                <input type="hidden" name="dateFrom" value="${dateFrom}" />
                <input type="hidden" name="dateTo" value="${dateTo}" />
                <div class="due_today_task_data">
                    <div class="due_today_task_data_l1">
                        <label for="">Task Owner</label> <br>
                        <select id="taskOwner" name="taskOwner" style="width: 160px;" required>
                            <option class="service-small"> -----Task Owner----</option>
                            <c:if test="${not empty ACTIVE_USERS_LIST}">
                                <c:forEach items="${ACTIVE_USERS_LIST}" var="userObj">
                                    <option class="service-small" value="${userObj.userId}">${userObj.name}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                    <div class="due_today_task_data_l1">
                        <label for="">Deal Confirmation Id</label> <br>
                        <input class="form-control search-slt" type="number" name="dealConfirmationId"
                            id="dealConfirmationId" step="0.0" placeholder="Deal Confirmation Id " />
                    </div>
                    <div class="due_today_task_data_l1">
                        <label for="">Task Priority</label> <br>
                        <select id="taskPriority" name="taskPriority" style="width: 160px;">
                            <option class="service-small" value=""> -----Task Priority----</option>
                            <c:if test="${not empty TASK_PRIORITY}">
                                <c:forEach items="${TASK_PRIORITY}" var="priority">
                                    <option class="service-small" value="${priority}">${priority}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                </div>
                <div class="due_today_task_data_btns">
                    <input type="submit" value="Apply Filter" />
                    <a href="">Clear Filter</a>
                </div>
            </div>

            <!-- ############# table ###################  -->

            <table class="due_date_task_tabel">
                <thead>
                    <tr>
                        <th style="width:10%;"><a
                                href="view_open_due_today_task_form_user?sortBy=taskId&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Task
                                Id</a></th>
                        <th>Task Title</th>
                        <th><a
                                href="view_open_due_today_task_form_user?sortBy=dealConfirmationId&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Deal
                                Associated</a></th>
                        <th><a
                                href="view_open_due_today_task_form_user?sortBy=taskOwner&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Assigned
                                To</a></th>
                        <th><a
                                href="view_open_due_today_task_form_user?sortBy=taskPriority&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Priority</a>
                        </th>
                        <th><a
                                href="view_open_due_today_task_form_user?sortBy=taskDueDate&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Due
                                Date</a></th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <c:forEach items="${OPEN_TASK_LIST}" var="openTaskList">
                    <tr>
                        <td style="width:10%;">${openTaskList.taskId }</td>
                        <td style="width:20%;">${openTaskList.taskTitle }</td>
                        <td style="width:10%;">
                            <c:if test="${openTaskList.dealConfirmationId != 0}">
                                UDN-${openTaskList.dealConfirmationId}
                            </c:if>
                            <c:if test="${openTaskList.dealConfirmationId == 0}">
                                None
                            </c:if>
                        </td>
                        <td style="width:15%;"> ${openTaskList.taskOwnerName}</td>
                        <td style="width:10%;">${openTaskList.taskPriority}</td>
                        <td style="width:15%;">${localDateTimeFormat.format(openTaskList.taskDueDate)}</td>
                        <td style="width:20%;">
                            <a href="view_view_due_today_task?taskId=${openTaskList.taskId }"><input type="button"
                                    style="background-color: #786AAF;" value="View" /></a> |
                            <a href="view_form_edit_due_today_task?taskId=${openTaskList.taskId }"><input type="button"
                                    style="background-color: #786AAF;" value="Edit" /></a> |
                            <a href="view_form_delete_due_today_task?taskId=${openTaskList.taskId }"><input
                                    type="button" style="background-color: #786AAF;" value="Delete" /></a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>


            <div id="pagination" align="right">
                Page:
                <c:url value="view_open_due_today_task_form_user" var="prev">
                    <c:param name="page" value="${page-1}" />
                </c:url>
                <c:if test="${page > 0}">
                    <a href="<c:out value="
                        ${prev}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&taskPriority=${taskPriority}" />Prev</a>
                </c:if>

                <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                    <c:choose>
                        <c:when test="${(page+1) == i.index}">
                            <span>${i.index}</span>
                        </c:when>
                        <c:otherwise>
                            <c:url value="view_open_due_today_task_form_user" var="url">
                                <c:param name="page" value="${i.index-1}" />
                            </c:url>
                            <a
                                href='<c:out value="${url}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}" />'>${i.index}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:url value="view_open_due_today_task_form_user" var="next">
                    <c:param name="page" value="${page + 1}" />
                </c:url>
                <c:if test="${page + 1 < maxPages}">
                    <a href='<c:out value="${next}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&taskPriority=${taskPriority}" />'
                        class="pn next">Next</a>
                </c:if>
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
                id = cityID;
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




</body>

</html>