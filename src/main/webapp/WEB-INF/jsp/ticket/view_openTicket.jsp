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
    <title>view ticket</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<style>

        body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/view_ticket_bg.jpg);
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
        <a href="view_open_ticket_form_user"  style="color:white;background:black">Open Tickets</a>
        <a href="view_open_ticket_form_user_filter_due_today">Due Today</a>
        <a href="view_open_over_due_ticket_form_user">Over Due</a>
        <a href="view_open_my_created_ticket_form_user">Created By Me</a>
        <a href="view_open_my_assigned_ticket_form_user">Assigned to me</a>
        <a href="view_completed_ticket_form_user">Completed</a>
    </div>



    <div class="view_ticket container">
        <form:form action="view_open_ticket_form_user" modelAttribute="TICKET_FILTER_OBJ">
            <div class="view_ticket_wrapper">
                <div align="center"><b>
                        <font color="green"> ${Success} </font>
                        <font color="red"> ${Error}</font>
                    </b></div>
                <div class="view_ticket_wrapper_data">
                    <div class="view_ticket_wrapper_data_line1">
                        <div class="view_ticket_data_l1">
                            <label for="">Ticket id</label>
                            <input class="form-control search-slt" type="number" name="ticketId" id="ticketId"
                                step="0.0" placeholder="Ticket Id " />
                        </div>
                        <div class="view_ticket_data_l1">
                            <label for="">Ticket Owner</label> <br>
                            <select id="ticketOwner" name="ticketOwner" style="width:89%"required>
                                <option class="service-small"> -----Ticket Owner----</option>
                                <c:if test="${not empty ACTIVE_USERS_LIST}">
                                    <c:forEach items="${ACTIVE_USERS_LIST}" var="userObj">
                                        <option class="service-small" value="${userObj.userId}" style="background:black;color:white">${userObj.name}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                        <div class="view_ticket_data_l1">
                            <label for="">Deal Confirmation id</label>
                            <input class="form-control search-slt" type="number" name="dealConfirmationId"
                                id="dealConfirmationId" step="0.0" placeholder="Deal Confirmation Id " />
                        </div>
                        <div class="view_ticket_data_l1">
                            <label for="">Ticket Priority</label>
                            <select id="ticketPriority" name="ticketPriority" style="width:89%">
                                <option class="service-small" value=""> -----Ticket Priority----</option>
                                <c:if test="${not empty TICKET_PRIORITY}">
                                    <c:forEach items="${TICKET_PRIORITY}" var="priority">
                                        <option class="service-small" value="${priority}" style="background:black;color:white">${priority}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="view_ticket_wrapper_data_line2">
                    <div class="view_ticket_data_l1">
                        <label for="">Due Date Range</label>
                        <input type="Date" name="DateFrom">
                    </div>
                    <div class="view_ticket_data_l1">
                        <br>
                        <input type="Date" name="DateTo">
                    </div>
                </div>
                <div class="due_today_task_data_btns">
                    <input type="submit" value="Apply Filter" />
                    <a href=" view_open_ticket_form_user">Clear Filter</a>
                </div>
            </div>

<div style="color:white;background:black;width:100%;margin-top:20px;font-weight:bold;padding:5px 10px;border-radius:5px;display:flex">
<p style="margin-right:10px"> <span style="color:#FFBA08">DA</span> : Deal Associated</p>
<p> <span style="color:#FFBA08">AT</span> : Assigned To</p>
</div>

            <table class="due_date_task_tabel">
                <thead>
                    <tr>
                        <th><a
                           style="color:#FFBA08"     href="view_open_ticket_form_user?sortBy=ticketId&dateFrom=${dateFrom}&dateTo=${dateTo}&ticketOwner=${ticketOwner}&dealConfirmationId=${dealConfirmationId}&ticketPriority=${ticketPriority}">Ticket
                                Id</a></th>
                        <th>Ticket Title</th>
                        <th>Client Associated</th>
                        <th><a
                               style="color:#FFBA08"   href="view_open_ticket_form_user?sortBy=dealConfirmationId&dateFrom=${dateFrom}&dateTo=${dateTo}&ticketOwner=${ticketOwner}&dealConfirmationId=${dealConfirmationId}&ticketPriority=${ticketPriority}">DA</a></th>
                        <th><a
                               style="color:#FFBA08"   href="view_open_ticket_form_user?sortBy=ticketOwner&dateFrom=${dateFrom}&dateTo=${dateTo}&ticketOwner=${ticketOwner}&dealConfirmationId=${dealConfirmationId}&ticketPriority=${ticketPriority}">AT
                                </a></th>
                        <th><a
                                style="color:#FFBA08"  href="view_open_ticket_form_user?sortBy=ticketPriority&dateFrom=${dateFrom}&dateTo=${dateTo}&ticketOwner=${ticketOwner}&dealConfirmationId=${dealConfirmationId}&ticketPriority=${ticketPriority}">Priority</a>
                        </th>
                        <th><a
                               style="color:#FFBA08"   href="view_open_ticket_form_user?sortBy=ticketDueDate&dateFrom=${dateFrom}&dateTo=${dateTo}&ticketOwner=${ticketOwner}&dealConfirmationId=${dealConfirmationId}&ticketPriority=${ticketPriority}">Due
                                Date</a></th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${OPEN_TICKET_LIST}" var="openTicketList">
                        <tr>
                            <td style="width:7%;">${openTicketList.ticketId }</td>
                            <td style="width:15%;">${openTicketList.ticketTitle }</td>
                            <td style="width:15%;">${openTicketList.clientName }</td>
                            <td style="width:7%;">
                                <c:if test="${openTicketList.dealConfirmationId != 0}">
                                    ${openTicketList.dealConfirmationId}
                                </c:if>
                            </td>
                            <td style="width:10%;"> ${openTicketList.ticketOwnerName}</td>
                            <td style="width:10%;">${openTicketList.ticketPriority}</td>
                            <td style="width:15%;">${localDateTimeFormat.format(openTicketList.ticketDueDate)}</td>
                            <td style="width:10%;">
                                <a href="view_view_ticket?ticketId=${openTicketList.ticketId }"><input type="button"
                                        style="color:red;background:transparent;border:none;outline:none" value="View" /></a> |
                                <a href="view_form_edit_ticket_req?ticketId=${openTicketList.ticketId }"><input
                                        type="button" style="color:red;background:transparent;border:none;outline:none"  value="Edit" /></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </form:form>


                <div id="pagination" align="right">
                    Page:
                    <c:url value="view_open_ticket_form_user" var="prev">
                        <c:param name="page" value="${page-1}" />
                    </c:url>
                    <c:if test="${page > 0}">
                        <a href="<c:out value="
                            ${prev}&sortBy=${sortBy}&ticketOwner=${ticketOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&ticketPriority=${ticketPriority}" />"
                        class="pn prev">Prev</a>
                    </c:if>
                
                    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                        <c:choose>
                            <c:when test="${(page+1) == i.index}">
                                <span>${i.index}</span>
                            </c:when>
                            <c:otherwise>
                                <c:url value="view_open_ticket_form_user" var="url">
                                    <c:param name="page" value="${i.index-1}" />
                                </c:url>
                                <a
                                    href='<c:out value="${url}&sortBy=${sortBy}&ticketOwner=${ticketOwner}&dealConfirmationId=${dealConfirmationId}&ticketPriority=${ticketPriority}" />'>${i.index}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:url value="view_open_ticket_form_user" var="next">
                        <c:param name="page" value="${page + 1}" />
                    </c:url>
                    <c:if test="${page + 1 < maxPages}">
                        <a href='<c:out value="${next}&sortBy=${sortBy}&ticketOwner=${ticketOwner}&dealConfirmationId=${dealConfirmationId}&dateFrom=${dateFrom}&dateTo=${dateTo}&ticketPriority=${ticketPriority}" />'
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