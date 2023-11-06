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
    <title>create new ticket</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body
    style="background: url(${pageContext.request.contextPath}/resources/images/revamped/createTicket_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
    <div class="container">


        <div class="cnt_options">
            <a href="view_create_ticket_form_user"  style="color:white;background:black">Create Ticket</a>
            <a href="view_open_ticket_form_user"> Open Ticket</a>
            <a href="view_open_ticket_form_user_filter_due_today">Due Today</a>
            <a href="view_open_over_due_ticket_form_user">Over Due</a>
            <a href="view_open_my_created_ticket_form_user">Created By Me</a>
            <a href="view_open_my_assigned_ticket_form_user">Assigned to me</a>
            <a href="view_completed_ticket_form_user">Completed</a>
        </div>

        <div class="create-new-ticket-wrapper">
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <form:form action="create_create_ticket_form_user" modelAttribute="TICKET_RECORDER">
                <div align="center">
                    <font color="red">
                        <b>
                            <form:errors path="dealName" /><br>
                        </b>
                    </font>
                    <h1 class="cnt-heading">Create New Ticket</h1>
                    <div class="create-new-ticket-wrapper-f-li">
                        <div class="cntd">
                            <label for="ticketTitle">Ticket Title</label><br>
                            <input class="form-control search-slt" type="text" name="ticketTitle" id="ticketTitle"
                                placeholder="Title" required />
                        </div>
                        <div class="cntd">
                            <label for="assin-to">Assigned to</label><br>
                            <form:select path="ticketOwner" min="1" required="required">
                                <option class="service-small" value=""> -----Select User----</option>
                                <form:options items="${ACTIVE_USERS_MAP}" class="service-small" style="background:black;color:white"/>
                            </form:select>
                        </div>
                        <div class="cntd cnt-pri">
                            <label for="prio">Priority</label><br>
                            <select id="ticketPriority" name="ticketPriority" style="width: 215px;" required>
                                <option class="service-small" value="">Select Priority</option>
                                <c:if test="${not empty TICKET_PRIORITY}">
                                    <c:forEach items="${TICKET_PRIORITY}" var="ticketPriority">
                                        <option style="background:black;color:white" class="service-small" value="${ticketPriority}">${ticketPriority}
                                        </option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                        <div class="cntd">
                            <label for="status">Status</label><br>
                            <form:select path="ticketStatus" style="width: 220px;">
                                <form:options items="${TICKET_STATUS}" class="service-small"  style="background:black;color:white"/>
                            </form:select>
                        </div>
                        <div class="cntd cntd-date">
                            <label for="due-date">Due Date</label><br>
                            <input id="ticketDueDate" name="ticketDueDate" required />
                        </div>
                    </div>
                    <div class="create-new-ticket-wrapper-f-li-2">
                        <div class="cntd2 link-wid-cli">
                            <label for="linkWithClient">Link with Client</label><br>
                            <form:input path="clientName" name="clientName" class="form-control search-slt"
                                style="height:30px;width:450px;" /><br>
                            <form:hidden path="clientId" />
                            <font color="red">
                                <form:errors path="clientName" cssClass="error" />
                            </font>
                        </div>
                        <div class="cntd2 link-wid-deal">
                            <label for="linkWithDeal">Link with Deal</label><br>
                            <form:input path="dealName" name="dealName" class="form-control search-slt"
                                style="height:30px;width:450px;"
                                placeholder="Deal Search - Enter Only numeric Deal # or Client Name " /><br>
                            <form:hidden path="dealConfirmationId" />
                        </div>
                        <div class="cntd2 cnt-des">
                            <label for="cnt-des">Description</label><br>
                            <input type="text" id="cnt-des">
                        </div>
                    </div>
                    <div class="create-new-ticket-wrapper-f-li-3">
                        <div class="cli-info">
                            <h1>Inform Client</h1>
                        </div>
                        <div class="cnt-check">
                            <input type="checkbox">
                        </div>
                        <div class="cnt-text">
                            <p>(if checked email will be sent to client with Ticket Title only)</p>
                        </div>
                    </div>
                    <div class="create-new-ticket-wrapper-f-li-4">
                        <div class="cnt-btns">
                            <input type="submit" value="Create" />
                            <a href="view_open_ticket_form_user">Cancel</a>
                        </div>
                    </div>
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

            $('#clientName').autocomplete({
                serviceUrl: '${pageContext.request.contextPath}/getClientList',
                paramName: "tagName",
                delimiter: ",",
                onSelect: function (suggestion) {
                    cityID = suggestion.data;
                    id = cityID;
                    jQuery("#contactId").val(cityID);
                    $('input[name=clientId]').val(id);
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
                    var getValue = $("#ticketDueDate").val();
                    $('input[name=ticketDueDate]').val(getValue);
                });
            });

            $("#ticketDueDate").datetimepicker();

        </script>




</body>

</html>