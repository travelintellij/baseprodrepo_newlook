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
<style>

        body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/due_task_bg.jpg);
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
            <a href="view_open_task_form_user_filter_due_today" style="color:white;background:black">Due Today</a>
            <a href="view_open_over_due_task_form_user">Over Due</a>
            <a href="view_open_my_created_task_form_user">Created By Me</a>
            <a href="view_open_my_assigned_task_form_user">Assigned to me</a>
            <a href="view_completed_task_form_user">Completed</a>
    </div>


    <div class="due_date_task container">
        <form:form action="view_open_due_today_task_form_user" modelAttribute="TASK_FILTER_OBJ">
            <div class="due_date_task_wrapper bs">
            <h1 class="hd">Due Today</h1>
                <input type="hidden" name="dateFrom" value="${dateFrom}" />
                <input type="hidden" name="dateTo" value="${dateTo}" />
                <div class="due_today_task_data">
                    <div class="due_today_task_data_l1 due_today_task_owner">
                        <label for="">Task Owner </label> <br>
                        <select id="taskOwner" name="taskOwner" style="width: 160px;" required>
                            <option class="service-small"> -----Task Owner----</option>
                            <c:if test="${not empty ACTIVE_USERS_LIST}">
                                <c:forEach items="${ACTIVE_USERS_LIST}" var="userObj">
                                    <option class="service-small" value="${userObj.userId}" style="background:black;color:white">${userObj.name}</option>
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
                                    <option class="service-small" value="${priority}" style="background:black;color:white">${priority}</option>
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
                    <tr style="background:#6082B6;color:black;height:50px">
                        <th style="width:10%;"><a
                             style="color:black"   href="view_open_due_today_task_form_user?sortBy=taskId&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Task
                                Id</a></th>
                        <th style="color:black" >Task Title</th>
                        <th><a
                             style="color:black"   href="view_open_due_today_task_form_user?sortBy=dealConfirmationId&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Deal
                                Associated</a></th>
                        <th><a
                              style="color:black"  href="view_open_due_today_task_form_user?sortBy=taskOwner&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Assigned
                                To</a></th>
                        <th><a
                             style="color:black"   href="view_open_due_today_task_form_user?sortBy=taskPriority&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Priority</a>
                        </th>
                        <th><a
                             style="color:black"   href="view_open_due_today_task_form_user?sortBy=taskDueDate&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Due
                                Date</a></th>
                        <th style="color:black" >Action</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <c:forEach items="${OPEN_TASK_LIST}" var="openTaskList">
                    <tr>
                        <td style="width:10%;border-bottom:2px solid #ffa500;border-right:2px solid #ffa500">${openTaskList.taskId }</td>
                        <td style="width:10%;border-bottom:2px solid #ffa500;border-right:2px solid #ffa500">${openTaskList.taskTitle }</td>
                        <td style="width:10%;border-bottom:2px solid #ffa500;border-right:2px solid #ffa500">
                            <c:if test="${openTaskList.dealConfirmationId != 0}">
                                UDN-${openTaskList.dealConfirmationId}
                            </c:if>
                            <c:if test="${openTaskList.dealConfirmationId == 0}">
                                None
                            </c:if>
                        </td>
                        <td style="width:10%;border-bottom:2px solid #ffa500;border-right:2px solid #ffa500"> ${openTaskList.taskOwnerName}</td>
                        <td style="width:10%;border-bottom:2px solid #ffa500;border-right:2px solid #ffa500">${openTaskList.taskPriority}</td>
                        <td style="width:10%;border-bottom:2px solid #ffa500;border-right:2px solid #ffa500">${localDateTimeFormat.format(openTaskList.taskDueDate)}</td>
                        <td style="width:10%;border-bottom:2px solid #ffa500;">
                            <a href="view_view_due_today_task?taskId=${openTaskList.taskId }"><input type="button"
                                    style="background:transparent;outline:none;border:none;color:red" value="View" /></a> |
                            <a href="view_form_edit_due_today_task?taskId=${openTaskList.taskId }"><input type="button"
                                     style="background:transparent;outline:none;border:none;color:red" value="Edit" /></a> |
                            <a href="view_form_delete_due_today_task?taskId=${openTaskList.taskId }"><input
                                    type="button"  style="background:transparent;outline:none;border:none;color:red" value="Delete" /></a>
                        </td>
                    </tr>
                    </c:forEach>
                </tbody>
            </table>


          <div id="pagination" align="right" style="margin-top:10px">
				<p style="color:#ffa500;background:black;display:inline-block;padding:2px;border-radius:2px">Page : </p>
			    <c:url value="view_open_due_today_task_form_user" var="prev">
			       <c:param name="page" value="${page-1}"/>
			    </c:url>
			    <c:if test="${page > 0}">
			        <a  style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href="<c:out value="${prev}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&taskPriority=${taskPriority}" />" class="pn prev">Prev</a>
			    </c:if>
			
			    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
			        <c:choose>
			            <c:when test="${(page+1) == i.index}">
			                <span style="background:black;padding:2px 5px;border-radius:2px;color:white">${i.index}</span>
			            </c:when>
			            <c:otherwise>
			                <c:url value="view_open_due_today_task_form_user" var="url">
			                    <c:param name="page" value="${i.index-1}"/>
			                </c:url>
			                 <a style="padding:2px 5px;border-radius:2px;color:black" href='<c:out value="${url}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}" />'>${i.index}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:url value="view_open_due_today_task_form_user" var="next">
			        <c:param name="page" value="${page + 1}"/>
			    </c:url>
			    <c:if test="${page + 1 < maxPages}">
			       <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href='<c:out value="${next}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&taskPriority=${taskPriority}" />' class="pn next">Next</a>
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