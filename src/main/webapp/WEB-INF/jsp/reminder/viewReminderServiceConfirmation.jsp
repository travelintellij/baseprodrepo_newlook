<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
    <script src="<c:url value='/resources/core/jquery.1.10.2.min.js' />"></script>
    <script src="<c:url value='/resources/core/jquery.autocomplete.min.js' />"></script>
</head>

<style>
body::before {
    content: "";
    background-image: url(${pageContext.request.contextPath}/resources/images/revamped/re_lead.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center center;
    background-attachment: fixed;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    opacity: 0.5;
    z-index: -1;
}
</style>

<body>

<form:form modelAttribute="REMINDER_SERVICE" action="send_send_leadReminder">
    <form:hidden path="leadsRecorderObj.leadId" />
    <form:hidden path="leadsRecorderObj.contactName" />
    <form:hidden path="smsVo.to" />
    <form:hidden path="smsVo.message" />
    <form:hidden path="emailMessageVo.emailToList" />
    <form:hidden path="emailMessageVo.emailCcList" />
    <form:hidden path="emailMessageVo.emailSubject" />
    <form:hidden path="emailMessageVo.emailMessage" />

    <div class="rso container">
        <div class="rso_wrapper bs">

            <h1 style="font-size:25px;margin-bottom:10px;color:#32cd32">
                View Reminder Service
            </h1>

            <div class="rso_wrapper_data">

                <!-- Existing content untouched -->
                <!-- (All your lead info blocks remain exactly same) -->

                <!-- SERVICES -->
                <h1 style="text-align: start;">Services requested</h1>

                <div class="rso_wrapper_data_line">
                    <div class="rso_wrapper_data_ser">

                        <!-- (All checkboxes unchanged) -->

                        <div class="rso_ser">
                            <form:checkbox class="ch_c" path="leadsRecorderObj.landPackage" disabled="true"/>
                            <label>package</label>
                        </div>

                        <!-- keep rest same... -->

                        <!-- ================= FIXED SECTION ================= -->

                        <h2 style="margin-top:20px;">Send Reminder Via</h2>

                        <div style="margin-top:15px; display:flex; gap:10px;">

                            <button type="submit" name="action" value="sms"
                                    class="btn btn-success">
                                Send SMS
                            </button>

                            <button type="submit" name="action" value="email"
                                    class="btn btn-success">
                                Send Email
                            </button>

                            <button type="submit" name="action" value="whatsapp"
                                    class="btn btn-success"
                                    style="background-color:#25D366;border-color:#25D366;">
                                Send WhatsApp
                            </button>

                        </div>

                        <!-- ================= END FIX ================= -->

                    </div>
                </div>
            </div>
        </div>

        <!-- ================= TABLE ================= -->

        <table class="rso_table bs">
            <tr>
                <th style="color:#32cd32;font-size:25px">Reminder History</th>
            </tr>

            <tr>
                <td>
                    <table>
                        <tr style="background-color:#6082B6;height:50px;">
                            <th>S.No.</th>
                            <th>SMS</th>
                            <th>Email</th>
                            <th>WhatsApp</th>
                            <th>Reminder DateTime</th>
                        </tr>

                        <c:set var="count" value="${LEADS_REMINDER_RECORDS.size()+1}" />

                        <c:forEach items="${LEADS_REMINDER_RECORDS}" var="leadReminderRecorder">
                            <tr>
                                <td>${count=count-1}</td>
                                <td>${leadReminderRecorder.smsSent}</td>
                                <td>${leadReminderRecorder.emailSent}</td>
                                <td>${leadReminderRecorder.whatsappSent}</td>
                                <td>
                                    <fmt:formatDate pattern="dd-MM-yyyy"
                                        value="${leadReminderRecorder.createdAt}" />
                                </td>
                            </tr>
                        </c:forEach>

                    </table>
                </td>
            </tr>
        </table>

    </div>

</form:form>

</body>
</html>