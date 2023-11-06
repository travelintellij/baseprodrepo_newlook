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
    <title>View Task</title>
    	<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
</head>

<body
    style="background: url(${pageContext.request.contextPath}/resources/images/revamped/view_task.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">



 <div class="cnt_options ">
            <a href="view_create_task_form_user">Create Task</a>
            <a href="view_open_task_form_user" style="color:white;background:black"> Open Tasks</a>
            <a href="view_open_task_form_user_filter_due_today">Due Today</a>
            <a href="view_open_over_due_task_form_user">Over Due</a>
            <a href="view_open_my_created_task_form_user">Created By Me</a>
            <a href="view_open_my_assigned_task_form_user">Assigned to me</a>
            <a href="view_completed_task_form_user">Completed</a>
        </div>



    <div class="view_taask container">
        <div class="view_task_wrapper">
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <div class="view_task_data">
                <div class="view_task_data_li">
                    <label for="">Task id</label>
                    <input type="text" name="taskId" id="taskId" step="0.0" placeholder="Task Id ">
                </div>
                <div class="view_task_data_li">
                    <label for="">Deal Confirmation id</label>
                    <input type="text" name="dealConfirmationId" id="dealConfirmationId" step="0.0"
                        placeholder="Deal Confirmation Id ">
                </div>
                <div class="view_task_data_li view_task_tak_owner">
                    <label for="">Task Owner</label>
                    <select id="taskOwner" name="taskOwner" required>
                        <option class="service-small"> -----Task Owner----</option>
                        <c:if test="${not empty ACTIVE_USERS_LIST}">
                            <c:forEach items="${ACTIVE_USERS_LIST}" var="userObj">
                                <option class="service-small" value="${userObj.userId}" style="color:white;background:black">${userObj.name}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                </div>
                <div class="view_task_data_li view_task_task_pri">
                    <label for="">Task Priority</label>
                    <select id="taskPriority" name="taskPriority">
                        <option class="service-small" value=""> -----Task Priority----</option>
                        <c:if test="${not empty TASK_PRIORITY}">
                            <c:forEach items="${TASK_PRIORITY}" var="priority">
                                <option class="service-small" value="${priority}" style="color:white;background:black">${priority}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                </div>
            </div>
            <div class="view_task_data">
                <div class="view_task_data_li view_task_date">
                    <label for="">Due Date Range</label>
                    <input type="date">
                </div>
                <div class="view_task_data_li view_task_date">
                    <!-- <label for="">Confirmation id</label> -->
                    <br>
                    <input type="date">
                </div>
            </div>
            <div class="view_task_data_btns">
                <button type="submit">Apply Filter</button>
                <a href="view_open_task_form_user">Clear Filter</a>
            </div>
        </div>
        

        <table class="view_task_table">
            <tr>
                <th style="width:10%;"><a style="color:#FFBA08;"
                        href="view_open_task_form_user?sortBy=taskId&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Task
                        Id</a></th>
                <th style="width:20%;">Task Title</th>
                <th style="width:20%;"><a style="color:#FFBA08;"
                        href="view_open_task_form_user?sortBy=dealConfirmationId&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Deal
                        Associated</a></th>
                <th style="width:15%;"><a style="color:#FFBA08;"
                        href="view_open_task_form_user?sortBy=taskOwner&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Assigned
                        To</a></th>
                <th style="width:10%;"><a style="color:#FFBA08;"
                        href="view_open_task_form_user?sortBy=taskPriority&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Priority</a>
                </th>
                <th style="width:15%;"><a style="color:#FFBA08"
                        href="view_open_task_form_user?sortBy=taskDueDate&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Due
                        Date</a></th>
                <th style="width:20%;style="color:#FFBA08"">Action
            </tr>
            </tr>
            <tr>
                <c:forEach items="${OPEN_TASK_LIST}" var="openTaskList">
            <tr>
                <td>${openTaskList.taskId }</td>
                <td>${openTaskList.taskTitle }</td>
                <td>
                    <c:if test="${openTaskList.dealConfirmationId != 0}">
                        ${openTaskList.dealConfirmationId}
                    </c:if>
                </td>
                <td> ${openTaskList.taskOwnerName}</td>
                <td>${openTaskList.taskPriority}</td>
                <td>${localDateTimeFormat.format(openTaskList.taskDueDate)}</td>
                <td class="view_task_td">
                    <i class="fa-solid fa-sliders view_task_icon">
                        <div class="view_task_ul">
                            <ul>
                                <li><a href="view_view_task?taskId=${openTaskList.taskId }">View</a></li>
                                <li><a href="view_form_edit_task_req?taskId=${openTaskList.taskId }"
                                        class="pop-up">Edit</a></li>
                                <li><a href="view_form_delete_task?taskId=${openTaskList.taskId}"
                                        class="pop-up">Delete</a></li>
                            </ul>
                        </div>
                    </i>
                </td>
            </tr>

            </c:forEach>

            </tr>
        </table>


        <div id="pagination" align="right">
            Page:
            <c:url value="view_open_task_form_user" var="prev">
                <c:param name="page" value="${page-1}" />
            </c:url>
            <c:if test="${page > 0}">
                <a href="<c:out value="
                    ${prev}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&taskPriority=${taskPriority}" />"
                >Prev</a>
            </c:if>

            <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                <c:choose>
                    <c:when test="${(page+1) == i.index}">
                        <span>${i.index}</span>
                    </c:when>
                    <c:otherwise>
                        <c:url value="view_open_task_form_user" var="url">
                            <c:param name="page" value="${i.index-1}" />
                        </c:url>
                        <a
                            href='<c:out value="${url}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}" />'>${i.index}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:url value="view_open_task_form_user" var="next">
                <c:param name="page" value="${page + 1}" />
            </c:url>
            <c:if test="${page + 1 < maxPages}">
                <a href='<c:out value="${next}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&taskPriority=${taskPriority}" />'
                    class="pn next">Next</a>
            </c:if>
        </div>
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