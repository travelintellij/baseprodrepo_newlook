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
    <title>edit_Task</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <link rel="stylesheet" href="style.css">
</head>
<style>
  body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/lens.jpg);
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
    <!-- ############# side menu bar ################## -->
    <div class="cnt_options">
            <a href="view_create_ticket_form_user"  >Create Ticket</a>
            <a href="view_open_ticket_form_user" style="color:white;background:black"> Open Ticket</a>
            <a href="view_open_ticket_form_user_filter_due_today">Due Today</a>
            <a href="view_open_over_due_ticket_form_user">Over Due</a>
            <a href="view_open_my_created_ticket_form_user">Created By Me</a>
            <a href="view_open_my_assigned_ticket_form_user">Assigned to me</a>
            <a href="view_completed_ticket_form_user">Completed</a>
        </div>


    <div class="edit_Task container">
        <div class="edit_Task_wrapper bs">
            <form:form action="edit_edit_ticket_form_user" modelAttribute="TICKET_RECORDER_OBJ">
                <form:hidden path="ticketId" />
                <div class="edit_Task_wrapper_data">
                    <div class="edit_Task_wrapper_data_line">
                        <div class="edit_Task_wrapper_data_l1">
                            <label for="">Ticket Title*</label> <br>
                            <form:input path="ticketTitle" class="form-control search-slt" name="taskTitle"
                                required="required" />
                        </div>
                        <div class="edit_Task_wrapper_data_l1">
                            <label for="">Assigned to</label> <br>
                            <form:select path="ticketOwner" required="required" style="width:90%">
                                <option class="service-small" value=""> -----Select User----</option>
                                <form:options items="${ACTIVE_USERS_MAP}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="edit_Task_wrapper_data_l1">
                            <label for="">Priority</label> <br>
                            <form:select path="ticketPriority" required="required" style="width:90%">
                                <option class="service-small" value=""> -----Select User----</option>
                                <form:options items="${TICKET_PRIORITY_MAP}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="edit_Task_wrapper_data_l1">
                            <label for="">Status</label> <br>
                            <form:select path="ticketStatus" style="width:90%">
                                <form:options items="${TICKET_STATUS}" class="service-small" />
                            </form:select>
                        </div>
                    </div>
                    <div class="edit_Task_wrapper_data_line2">
                        <div class="edit_Task_wrapper_data_l1">
                            <label for="">Due Date</label> <br>
                            
                           <fmt:parseDate value="${TICKET_RECORDER_OBJ.ticketDueDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
		<fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${ parsedDateTime }" var="parsedDate"/>
		 
		 
		<input style="height: 30px; width: 180px;" id="ticketDueDate" name="ticketDueDate" value="${parsedDate}" required />
                        </div>
                        <div class="edit_Task_wrapper_data_l1">
                            <label for="">Link with client</label> <br>
                            <form:input path="clientName" name="clientName" class="form-control search-slt"
                               style="width:90%" /><br>
                            <form:hidden path="clientId" />
                            <font color="red">
                                <form:errors path="clientName" cssClass="error" />
                            </font>
                        </div>
                        <div class="edit_Task_wrapper_data_l1">
                            <label for="">Link with deal</label> <br>
                            <form:input path="dealName" name="dealName" class="form-control search-slt" style="width:560px" placeholder="Deal Search - Enter Only numeric Deal # or Client Name " /><br>
                            <form:hidden path="dealConfirmationId" />
                        </div>
                       
                    </div>
                     <div class="edit_Task_wrapper_data_l1">
                      <div class="edit_Task_wrapper_data_l1_des">
                            <label for="">Description</label> <br>
                            <form:textarea path="ticketDescription" rows="2" cols="139" maxlength="1100" />
                        </div>
                     </div>
                    <div class="edit_Task_wrapper_data_line2_confom">
                        <div class="edit_Task_wrapper_data_l1">
                            <label for="" style=" color:#FFBA08;font-weight: bold;">Inform Mate</label> <br>
                            <form:checkbox path="notifyTicketOwner" name="transfers" />
                            <p>(if checked email will be sent to task owner)</p>
                        </div>
                    </div>
                    <div class="due_today_task_data_btns">
                        <input type="submit" id="Update" value="Update" />
                        <c:if test="${VIEW_SOURCE eq 'OPEN_TICKET'}">
                            <a href="view_open_ticket_form_user">Cancel</a>
                        </c:if>
                        <c:if test="${VIEW_SOURCE eq 'DUE_TODAY'}">
                            <a href="view_open_ticket_form_user_filter_due_today">Cancel</a>
                        </c:if>
                        <c:if test="${VIEW_SOURCE eq 'OVER_DUE'}">
                            <a href="view_open_over_due_ticket_form_user">Cancel</a>
                        </c:if>
                        <c:if test="${VIEW_SOURCE eq 'MY_CREATED'}">
                            <a href="view_open_my_created_ticket_form_user">Cancel</a>
                        </c:if>
                        <c:if test="${VIEW_SOURCE eq 'MY_ASSIGNED'}">
                            <a href="view_open_my_assigned_ticket_form_user">Cancel</a>
                        </c:if>

                        <c:if test="${VIEW_SOURCE eq 'COMPLETED_TICKET'}">
                            <a href="view_completed_ticket_form_user">Cancel</a>
                        </c:if>
                    </div>
                </div>
            </form:form>
        </div>
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
            $("#Update").on('click', function () {
                var getValue = $("#ticketDueDate").val();
                $('input[name=ticketDueDate]').val(getValue);
            });
        });

        $("#ticketDueDate").datetimepicker();

    </script>


</body>

</html>