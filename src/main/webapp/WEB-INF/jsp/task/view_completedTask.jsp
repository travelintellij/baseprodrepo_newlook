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
    <title>Completed (tasks)</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<style>
  body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/completed_tasks_bg.jpg);
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
          <a href="view_create_task_form_user">Create Task</a>
            <a href="view_open_task_form_user"> Open Tasks</a>
            <a href="view_open_task_form_user_filter_due_today"  >Due Today</a>
            <a href="view_open_over_due_task_form_user">Over Due</a>
            <a href="view_open_my_created_task_form_user">Created By Me</a>
            <a href="view_open_my_assigned_task_form_user">Assigned to me</a>
            <a href="view_completed_task_form_user"  style="color:white;background:black">Completed</a>
    </div>


    <div class="completed_tasks container">
        <div class="completed_tasks_wrapper">
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <form:form action="view_completed_task_form_user" modelAttribute="TASK_FILTER_OBJ">
            <div class="completed_tasks_data">
                <div class="complete_tasks_data_li">
                    <label for="">Task Owner</label> <br>
                    <select id="taskOwner" name="taskOwner" style="width: 90%;" required>
                        <option class="service-small"> -----Task Owner----</option>
                        <c:if test="${not empty ACTIVE_USERS_LIST}">
                            <c:forEach items="${ACTIVE_USERS_LIST}" var="userObj">
                                <option class="service-small" value="${userObj.userId}" style="color:white;background:black">${userObj.name}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                </div>
                <div class="complete_tasks_data_li">
                    <label for="">Task Priority</label> <br>
                    <select id="taskPriority" name="taskPriority" style="width:90%;">
                        <option class="service-small" value=""> -----Task Priority----</option>
                        <c:if test="${not empty TASK_PRIORITY}">
                            <c:forEach items="${TASK_PRIORITY}" var="priority">
                                <option class="service-small" value="${priority}" style="color:white;background:black">${priority}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                </div>
                <div class="complete_tasks_data_li">
                    <label for="">Dute Date Range</label>
                    <input type="date" name="DateFrom">
                </div>
                <div class="complete_tasks_data_li">
                    <br>
                    <input type="date" name="DateTo">
                </div>
            </div>
            <div class="due_today_task_data_btns">
                <input type="submit" value="Apply Filter" />
                <a href=" view_completed_task_form_user">Clear Filter</a>
            </div>
        </div>


        <table class="due_date_task_tabel">
            <thead>
                <tr style="background:#6082B6">
                    <th><a
                       style="color: black"     href="view_completed_task_form_user?sortBy=taskId&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Task
                            Id</a></th>
                    <th style="color: black"  >Task Title</th>
                    <th><a
                         style="color: black"     href="view_completed_task_form_user?sortBy=dealConfirmationId&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Deal
                            Associated</a></th>
                    <th><a
                        style="color: black"     href="view_completed_task_form_user?sortBy=taskOwner&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Assigned
                            To</a></th>
                    <th><a
                          style="color: black"    href="view_completed_task_form_user?sortBy=taskPriority&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Priority</a>
                    </th>
                    <th><a
                         style="color: black"     href="view_completed_task_form_user?sortBy=taskDueDate&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Due
                            Date</a></th>
                    <th style="color: black"  >Action</th>
                </tr>
            </thead>
            <tbody>

                <c:forEach items="${OPEN_TASK_LIST}" var="openTaskList">
                    <tr>
                        <td style="width:10%;border-bottom:2px solid #ffb908cf;border-right:2px solid #ffb908cf;">${openTaskList.taskId }</td>
                        <td style="width:20%;border-bottom:2px solid #ffb908cf;border-right:2px solid #ffb908cf;"><strike>${openTaskList.taskTitle }</strike></td>
                        <td style="width:10%;border-bottom:2px solid #ffb908cf;border-right:2px solid #ffb908cf;">
                            <c:if test="${openTaskList.dealConfirmationId != 0}">
                                UDN-${openTaskList.dealConfirmationId}
                            </c:if>
                            <c:if test="${openTaskList.dealConfirmationId == 0}">
                                None
                            </c:if>
                        </td>
                        <td style="width:15%;border-bottom:2px solid #ffb908cf;border-right:2px solid #ffb908cf;"> ${openTaskList.taskOwnerName}</td>
                        <td style="width:10%;border-bottom:2px solid #ffb908cf;border-right:2px solid #ffb908cf;">${openTaskList.taskPriority}</td>
                        <td style="width:15%;border-bottom:2px solid #ffb908cf;border-right:2px solid #ffb908cf;">${localDateTimeFormat.format(openTaskList.taskDueDate)}</td>
                        <td style="width:20%;border-bottom:2px solid #ffb908cf;padding-top:10px">
                            <a href="view_view_completed_task?taskId=${openTaskList.taskId }"><input type="button"
                                    style="background:#32cd32;color:black;outline:none;border:none;border-radius:2px;padding:2px;margin-bottom:10px;" value="View" /></a> 
                            <a href="view_form_edit_completed_task?taskId=${openTaskList.taskId }"><input type="button"
                                    style="background:#32cd32;color:black;outline:none;border:none;border-radius:2px;padding:2px;margin-bottom:10px;" value="Edit" /></a> 
                            <a href="view_form_delete_completed_task?taskId=${openTaskList.taskId }"><input
                                  style="background:red;color:white;outline:none;border:none;border-radius:2px;padding:2px;margin-bottom:10px;"   type="button" style="background-color: #786AAF;" value="Delete" /></a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
            </form:form>
        </table>


     	<div id="pagination" align="right" style="margin-top:10px">
		<p style="color:#ffa500;background:black;display:inline-block;padding:2px;border-radius:2px"> Page: </p>		
			    <c:url value="view_completed_task_form_user" var="prev">
			       <c:param name="page" value="${page-1}"/>
			    </c:url>
			    <c:if test="${page > 0}">
			        <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href="<c:out value="${prev}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&taskPriority=${taskPriority}" />" class="pn prev">Prev</a>
			    </c:if>
			
			    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
			        <c:choose>
			            <c:when test="${(page+1) == i.index}">
			                <span  style="background:black;padding:2px 5px;border-radius:2px;color:white">${i.index}</span>
			            </c:when>
			            <c:otherwise>
			                <c:url value="view_completed_task_form_user" var="url">
			                    <c:param name="page" value="${i.index-1}"/>
			                </c:url>
			                 <a style="background:white;padding:2px 5px;border-radius:2px;color:black" href='<c:out value="${url}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}" />'>${i.index}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:url value="view_completed_task_form_user" var="next">
			        <c:param name="page" value="${page + 1}"/>
			    </c:url>
			    <c:if test="${page + 1 < maxPages}">
			       <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href='<c:out value="${next}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&taskPriority=${taskPriority}" />' class="pn next">Next</a>
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