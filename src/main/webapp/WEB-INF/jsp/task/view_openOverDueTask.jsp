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
    <title>Over due</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<style>
 body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/over_due_task_bg.jpg);
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
        <a href="view_create_ticket_form_user" >Create Task</a>
            <a href="view_open_task_form_user"> Open Tasks</a>
            <a href="view_open_task_form_user_filter_due_today">Due Today</a>
            <a href="view_open_over_due_task_form_user" style="color:white;background:black">Over Due</a>
            <a href="view_open_my_created_task_form_user">Created By Me</a>
            <a href="view_open_my_assigned_task_form_user">Assigned to me</a>
            <a href="view_completed_task_form_user">Completed</a>
    </div>
    <div class="over_due_tasks container">
        <form:form action="view_open_over_due_task_form_user" modelAttribute="TASK_FILTER_OBJ">
            <input type="hidden" name="dateFrom" value="${dateFrom}" />
            <input type="hidden" name="dateTo" value="${dateTo}" />
            <div class="over_due_tasks_wrapper bs ">
            <h1 class="hd">Over Due</h1>
                <div align="center"><b>
                        <font color="green"> ${Success} </font>
                        <font color="red"> ${Error}</font>
                    </b></div>
                <div class="over_due_tasks_data">
                    <div class="over_due_tasks_li task_owner_viwe_task">
                        <label for="">Task Owner </label><br>
                        <select class="task_owner_viwe_task" id="taskOwner" name="taskOwner" style="width: 160px;" required>
                            <option class="service-small"> -----Task Owner----</option>
                            <c:if test="${not empty ACTIVE_USERS_LIST}">
                                <c:forEach items="${ACTIVE_USERS_LIST}" var="userObj">
                                    <option class="service-small" value="${userObj.userId}" style="background:black;color:white">${userObj.name}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                    <div class="over_due_tasks_li">
                        <label for="">Deal Confirmation id</label><br>
                        <input class="form-control search-slt" type="number" name="dealConfirmationId"
                            id="dealConfirmationId" step="0.0" placeholder="Deal Confirmation Id " />
                    </div>
                    <div class="over_due_tasks_li task_pri_viwe_task">
                        <label for="">Task Priority</label><br>
                        <select id="taskPriority" name="taskPriority" style="width: 160px;">
                            <option class="service-small" value=""> -----Task Priority----</option>
                            <c:if test="${not empty TASK_PRIORITY}">
                                <c:forEach items="${TASK_PRIORITY}" var="priority">
                                    <option class="service-small" value="${priority}" style="color:white;background:black">${priority}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                </div>
                <div class="due_today_task_data_btns">
                <input type="submit" value="Apply Filter" />
                    <a href="view_open_over_due_task_form_user">Clear Filter</a>
                </div>
            </div>

            <table class="due_date_task_tabel">
                <thead>
                    <tr style="background:#6082B6;height:50px">
                    <th><a 
                          style="color:black;"  href="view_open_over_due_task_form_user?sortBy=taskId&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Task
                            Id</a></th>
                    <th style="color:black;">Task Title</th>
                        <th><a 
                             style="color:black"   href="view_open_over_due_task_form_user?sortBy=dealConfirmationId&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Deal
                                Associated</a></th>
                        <th><a
                             style="color:black"   href="view_open_over_due_task_form_user?sortBy=taskOwner&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Assigned
                                To</a></th>
                        <th><a
                            style="color:black"    href="view_open_over_due_task_form_user?sortBy=taskPriority&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Priority</a>
                        </th>
                        <th><a
                             style="color:black"   href="view_open_over_due_task_form_user?sortBy=taskDueDate&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Due
                                Date</a></th>
                        <th style="color:black;">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <c:forEach items="${OPEN_TASK_LIST}" var="openTaskList">
                            <tr>
                                <td style="width:10%;border-bottom:2px solid black;border-right:2px solid black">${openTaskList.taskId }</td>
                                <td style="width:10%;border-bottom:2px solid black;border-right:2px solid black">${openTaskList.taskTitle }</td>
                                <td style="width:20%;border-bottom:2px solid black;border-right:2px solid black">
                                    <c:if test="${openTaskList.dealConfirmationId != 0}">
                                        UDN-${openTaskList.dealConfirmationId}
                                    </c:if>
                                    <c:if test="${openTaskList.dealConfirmationId == 0}">
                                        None
                                    </c:if>
                                </td>
                                <td style="width:15%;border-bottom:2px solid black;border-right:2px solid black"> ${openTaskList.taskOwnerName}</td>
                                <td style="width:10%;border-bottom:2px solid black;border-right:2px solid black">${openTaskList.taskPriority}</td>
                                <td style="width:15%;border-bottom:2px solid black;border-right:2px solid black">
                                    <font>${localDateTimeFormat.format(openTaskList.taskDueDate)}</font>
                                </td>
                                <td style="width:20%;border-bottom:2px solid black;">
                                    <a   href="view_view_over_due_task?taskId=${openTaskList.taskId }"><input class="list_buttons" type="button" style="background:transparent;color:red;border:none;outline:none;cursor:pointer"
                                            value="View" /></a> |
                                    <a  href="view_form_edit_over_due_task?taskId=${openTaskList.taskId }"><input class="list_buttons" type="button" style="background:transparent;color:red;border:none;outline:none;cursor:pointer"
                                             value="Edit" /></a> |
                                    <a  href="view_form_delete_over_due_task?taskId=${openTaskList.taskId }"><input class="list_buttons" type="button" style="background:transparent;color:red;border:none;outline:none;cursor:pointer"
                                            value="Delete" /></a>
                                </td>
                        
                            </tr>
                        
                        </c:forEach>
                    </tr>
                </tbody>
            </table>

                       <div id="pagination" align="center" style="margin-top:10px">
				<p style="color:#ffa500;background:black;display:inline-block;padding:2px;border-radius:2px">Page : </p>
			    <c:url value="view_open_over_due_task_form_user" var="prev">
			       <c:param name="page" value="${page-1}"/>
			    </c:url>
			    <c:if test="${page > 0}">
			        <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href="<c:out value="${prev}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&taskPriority=${taskPriority}" />" class="pn prev">Prev</a>
			    </c:if>
			
			    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
			        <c:choose>
			            <c:when test="${(page+1) == i.index}">
			                <span style="background:black;padding:2px 5px;border-radius:2px;color:white">${i.index}</span>
			            </c:when>
			            <c:otherwise>
			                <c:url value="view_open_over_due_task_form_user" var="url">
			                    <c:param name="page" value="${i.index-1}"/>
			                </c:url>
			                 <a style="background:white;padding:2px 5px;border-radius:2px;color:black" href='<c:out value="${url}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}" />'>${i.index}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:url value="view_open_over_due_task_form_user" var="next">
			        <c:param name="page" value="${page + 1}"/>
			    </c:url>
			    <c:if test="${page + 1 < maxPages}">
			       <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500"  href='<c:out value="${next}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&taskPriority=${taskPriority}" />' class="pn next">Next</a>
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