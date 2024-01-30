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
    <title>Created By me (Ticket)</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<style>

        body::before {
            content: "";
            background-image:url(${pageContext.request.contextPath}/resources/images/revamped/created_by_me_ticket_bg.jpg);
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
        <a href="view_create_ticket_form_user">Create Ticket</a>
        <a href="view_open_ticket_form_user">Open Tickets</a>
        <a href="view_open_ticket_form_user_filter_due_today">Due Today</a>
        <a href="view_open_over_due_ticket_form_user">Over Due</a>
        <a href="view_open_my_created_ticket_form_user"  style="color:white;background:black">Created By Me</a>
        <a href="view_open_my_assigned_ticket_form_user">Assigned to me</a>
        <a href="view_completed_ticket_form_user">Completed</a>
    </div>



    <div class="created_by_me_ticket container">
        <div class="created_by_me_ticket_wrapper">
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <form:form action="view_open_my_created_ticket_form_user" modelAttribute="TICKET_FILTER_OBJ">
                <div class="created_by_me_ticket_wrapper_data">
                    <div class="created_by_me_ticket_wrapper_data_line1">
                        <label for="">Ticket Owner</label> <br>
                        <select id="ticketOwner" name="ticketOwner" style="width:90%" required>
                            <option class="service-small"> -----Ticket Owner----</option>
                            <c:if test="${not empty ACTIVE_USERS_LIST}">
                                <c:forEach items="${ACTIVE_USERS_LIST}" var="userObj">
                                    <option class="service-small" value="${userObj.userId}" style="color:white;background:black">${userObj.name}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                    <div class="created_by_me_ticket_wrapper_data_line1">
                        <label for="">Deal Confirmation Id</label>
                        <input class="form-control search-slt" type="number" name="dealConfirmationId"
                            id="dealConfirmationId" step="0.0" placeholder="Deal Confirmation Id " />
                    </div>
                    <div class="created_by_me_ticket_wrapper_data_line1">
                        <label for="">Ticket Priority</label> <br>
                        <select id="ticketPriority" name="ticketPriority" style="width:90%">
                            <option class="service-small" value=""> -----Ticket Priority----</option>
                            <c:if test="${not empty TICKET_PRIORITY}">
                                <c:forEach items="${TICKET_PRIORITY}" var="priority">
                                    <option class="service-small" value="${priority}" style="color:white;background:black">${priority}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                </div>
                <div class="created_by_me_ticket_wrapper_data">
                    <div class="created_by_me_ticket_wrapper_data_line2">
                        <label for="">Due Date Range</label><br>
                        <input type="Date" name="DateFrom">
                    </div>
                    <div class="created_by_me_ticket_wrapper_data_line2">
                        <label for="">Deal Confirmation Id</label><br>
                        <input type="Date" name="DateTo">
                    </div>
                </div>
                <div class="due_today_task_data_btns">
                    <input type="submit" value="Apply Filter" />
                    <a href=" view_open_my_created_ticket_form_user">Clear Filter</a>
                </div>
            </form:form>
        </div>



<div style="color:white;background:black;width:100%;margin-top:20px;font-weight:bold;padding:5px 10px;border-radius:5px;display:flex">
<p style="margin-right:10px"> <span style="color:#FFBA08">DA</span> : Deal Associated</p>
<p> <span style="color:#FFBA08">AT</span> : Assigned To</p>
</div>


        <table class="due_date_task_tabel">
            <thead>
                <tr style="background:#6082B6">
                    <th><a
                        style="    color: black"    href="view_open_my_created_ticket_form_user?sortBy=ticketId&dateFrom=${dateFrom}&dateTo=${dateTo}&ticketOwner=${ticketOwner}&dealConfirmationId=${dealConfirmationId}&ticketPriority=${ticketPriority}">Ticket
                            Id</a></th>
                    <th style="    color: black" >Ticket Title</th>
                    <th  style="    color: black" >Client Associated</th>
                    <th><a
                         style="    color: black"     href="view_open_my_created_ticket_form_user?sortBy=dealConfirmationId&dateFrom=${dateFrom}&dateTo=${dateTo}&ticketOwner=${ticketOwner}&dealConfirmationId=${dealConfirmationId}&ticketPriority=${ticketPriority}">DA</a></th>
                    <th><a
                          style="    color: black"    href="view_open_my_created_ticket_form_user?sortBy=ticketOwner&dateFrom=${dateFrom}&dateTo=${dateTo}&ticketOwner=${ticketOwner}&dealConfirmationId=${dealConfirmationId}&ticketPriority=${ticketPriority}">AT
                            </a></th>
                    <th><a
                          style="    color: black"    href="view_open_my_created_ticket_form_user?sortBy=ticketPriority&dateFrom=${dateFrom}&dateTo=${dateTo}&ticketOwner=${ticketOwner}&dealConfirmationId=${dealConfirmationId}&ticketPriority=${ticketPriority}">Priority</a>
                    </th>
                    <th><a
                         style="    color: black"     href="view_open_my_created_ticket_form_user?sortBy=ticketDueDate&dateFrom=${dateFrom}&dateTo=${dateTo}&ticketOwner=${ticketOwner}&dealConfirmationId=${dealConfirmationId}&ticketPriority=${ticketPriority}">Due
                            Date</a></th>
                    <th  style="    color: black" >Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${OPEN_TICKET_LIST}" var="openTicketList">
                    <tr>
                        <td style="width:7%;border-bottom:2px solid #ffa500;border-right:2px solid #ffa500">${openTicketList.ticketId }</td>
                        <td style="width:15%;border-bottom:2px solid #ffa500;border-right:2px solid #ffa500">${openTicketList.ticketTitle }</td>
                        <td style="width:15%;border-bottom:2px solid #ffa500;border-right:2px solid #ffa500">${openTicketList.clientName }</td>
                        <td style="width:7%;border-bottom:2px solid #ffa500;border-right:2px solid #ffa500">
                            <c:if test="${openTicketList.dealConfirmationId != 0}">
                                ${openTicketList.dealConfirmationId}
                            </c:if>
                        </td>
                        <td style="width:10%;border-bottom:2px solid #ffa500;border-right:2px solid #ffa500"> ${openTicketList.ticketOwnerName}</td>
                        <td style="width:10%;border-bottom:2px solid #ffa500;border-right:2px solid #ffa500">${openTicketList.ticketPriority}</td>
                        <td style="width:15%;border-bottom:2px solid #ffa500;border-right:2px solid #ffa500">${localDateTimeFormat.format(openTicketList.ticketDueDate)}</td>
                        <td style="width:10%;border-bottom:2px solid #ffa500;">
                            <a href="view_view_my_created_ticket?ticketId=${openTicketList.ticketId }"><input
                                    type="button" style="color:red;background:transparent;border:none;outline:none" value="View" /></a> |
                            <a href="view_form_edit_my_created_ticket?ticketId=${openTicketList.ticketId }"><input
                                    type="button" style="color:red;background:transparent;border:none;outline:none" value="Edit" /></a>
                        </td>
                    </tr>

                </c:forEach>
            </tbody>
        </table>

        <div id="pagination" align="center" style="margin-top:10px">
          <p style="color:#ffa500;background:black;display:inline-block;padding:2px;border-radius:2px">Page : </p>
            <c:url value="view_open_my_created_ticket_form_user" var="prev">
                <c:param name="page" value="${page-1}" />
            </c:url>
            <c:if test="${page > 0}">
                <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href="<c:out value="
                    ${prev}&sortBy=${sortBy}&ticketOwner=${ticketOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&ticketPriority=${ticketPriority}" />"
                class="pn prev">Prev</a>
            </c:if>

            <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                <c:choose>
                    <c:when test="${(page+1) == i.index}">
                        <span style="background:black;padding:2px 5px;border-radius:2px;color:white">${i.index}</span>
                    </c:when>
                    <c:otherwise>
                        <c:url value="view_open_my_created_ticket_form_user" var="url">
                            <c:param name="page" value="${i.index-1}" />
                        </c:url>
                        <a style="background:white;padding:2px 5px;border-radius:2px;color:black"
                            href='<c:out value="${url}&sortBy=${sortBy}&ticketOwner=${ticketOwner}&dealConfirmationId=${dealConfirmationId}&ticketPriority=${ticketPriority}" />'>${i.index}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
            <c:url value="view_open_my_created_ticket_form_user" var="next">
                <c:param name="page" value="${page + 1}" />
            </c:url>
            <c:if test="${page + 1 < maxPages}">
                <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href='<c:out value="${next}&sortBy=${sortBy}&ticketOwner=${ticketOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&ticketPriority=${ticketPriority}" />'
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