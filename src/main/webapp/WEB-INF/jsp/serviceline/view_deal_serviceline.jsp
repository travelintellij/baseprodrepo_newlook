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
    <title>View Task</title>
    		<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
</head>
<style>
   body::before {
            content: "";
            background-image: url(${pageContext.request.contextPath}/resources/images/revamped/view_task.jpg);
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



 <div class="cnt_options ">
            <a href="view_create_task_form_user" style="color:white;background:black">Deals</a>
            <a href="view_open_task_form_user" "> Flight</a>
            <a href="view_open_task_form_user_filter_due_today">Hotel</a>
            <a href="view_open_over_due_task_form_user">Transfers</a>
            <a href="view_open_my_created_task_form_user">SightSeeing</a>
            <a href="view_open_my_assigned_task_form_user">Land Package</a>
            <a href="view_completed_task_form_user">Visa</a>
        </div>



    <div class="view_taask container">
        <div class="view_task_wrapper bs">
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <div class="view_task_data">
                <div class="view_task_data_li">
                    <label for="">Deal Confirmation id</label>
                    <input type="text" name="dealConfirmationId" id="dealConfirmationId" step="0.0"
                        placeholder="Deal Confirmation Id ">
                </div>
                <div class="view_task_data_li view_task_tak_owner">
                    <label for="">Task Owner</label>
                      <a href="#"><input type="button" style="background-color:green;color:white;" value="Completed Deals" /></a>
                </div>
                <div class="view_task_data_li view_task_task_pri">
                    <label for="">Task Priority</label>
					<a href="#"><input type="button" style="background-color:red;color:white;" value="Upcoming or Active" /></a>                
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
            <div class="due_today_task_data_btnss" style="display:flex;justify-content:center;margin-top:10px">
                <input style="background-color:#32cd32;" type="submit" value="Apply Filter" />
              <a href="view_open_task_form_user"><input type="button" value="Clear Filter" /></a>
            </div>
        </div>
        

        <table class="view_task_table">
        <thead style="background:#6082B6;height:50px">
            <tr>
                <th style="width:10%;"><a style="color:black;"
                        href="view_open_task_form_user?sortBy=taskId&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Task
                        Id</a></th>
                <th style="width:20%;color:black" >Task Title</th>
                <th style="width:20%;"><a style="color:black;"
                        href="view_open_task_form_user?sortBy=dealConfirmationId&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Deal
                        Associated</a></th>
                <th style="width:15%;"><a style="color:black;"
                        href="view_open_task_form_user?sortBy=taskOwner&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Assigned
                        To</a></th>
                <th style="width:10%;"><a style="color:black;"
                        href="view_open_task_form_user?sortBy=taskPriority&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Priority</a>
                </th>
                <th style="width:15%;"><a style="color:black"
                        href="view_open_task_form_user?sortBy=taskDueDate&dateFrom=${dateFrom}&dateTo=${dateTo}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}">Due
                        Date</a></th>
                <th style="width:20%;color:black">Action
            </tr>
   </thead>
            <tr>
                <c:forEach items="${OPEN_TASK_LIST}" var="openTaskList">
            <tr>
                <td style="border-bottom:2px solid black;border-right:2px solid black;border-left:2px solid black">${openTaskList.taskId }</td>
                <td style="border-bottom:2px solid black;border-right:2px solid black;">${openTaskList.taskTitle }</td>
                <td style="border-bottom:2px solid black;border-right:2px solid black;">
                    <c:if test="${openTaskList.dealConfirmationId != 0}">
                        ${openTaskList.dealConfirmationId}
                    </c:if>
                </td>
                <td style="border-bottom:2px solid black;border-right:2px solid black;"> ${openTaskList.taskOwnerName}</td>
                <td style="border-bottom:2px solid black;border-right:2px solid black;">${openTaskList.taskPriority}</td>
                <td style="border-bottom:2px solid black;border-right:2px solid black;">${localDateTimeFormat.format(openTaskList.taskDueDate)}</td>
                <td style="border-bottom:2px solid black;border-right:2px solid black;">
                    <i class="fa-solid fa-sliders view_task_icon" >
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


        <div id="pagination" align="center" style="margin:10px 0">
          <font style="color:#ffa500;background:black;display:inline-block;padding:2px;border-radius:2px">Page:</font> 
            <c:url value="view_open_task_form_user" var="prev">
                <c:param name="page" value="${page-1}" />
            </c:url>
            <c:if test="${page > 0}">
                <a  style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href="<c:out value="
                    ${prev}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&taskPriority=${taskPriority}" />"
                >Prev</a>
            </c:if>

            <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                <c:choose>
                    <c:when test="${(page+1) == i.index}">
                        <span style="background:black;padding:2px 5px;border-radius:2px;color:white">${i.index}</span>
                    </c:when>
                    <c:otherwise>
                        <c:url value="view_open_task_form_user" var="url">
                            <c:param name="page" value="${i.index-1}" />
                        </c:url>
                        <a
                          style="padding:2px 5px;border-radius:2px;color:black"  href='<c:out value="${url}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&taskPriority=${taskPriority}" />'>${i.index}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:url value="view_open_task_form_user" var="next">
                <c:param name="page" value="${page + 1}" />
            </c:url>
            <c:if test="${page + 1 < maxPages}">
                <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href='<c:out value="${next}&sortBy=${sortBy}&taskOwner=${taskOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&taskPriority=${taskPriority}" />'
                    class="pn next">Next</a>
            </c:if>
        </div>
    </div>


   <script>
$('#dealName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getDealInfo',
	paramName: "dealKeyword",
	delimiter: ",",
	onSelect: function(suggestion) {
        dealID = suggestion.data;
        id=cityID;
        jQuery("#dealConfirmationId").val(dealID);
        $('input[name=dealName]').val(id);
        return false;
    },
	transformResult: function(response) {
        return {
            suggestions: $.map($.parseJSON(response), function(item) {
            	return { value: item.tagName, data: item.id };
            })
            
        };
    }
});

</script>

</body>

</html>