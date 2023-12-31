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
                <script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
                <script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
                </head>

                <body
                    style="background: url(${pageContext.request.contextPath}/resources/images/revamped/re_lead.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
                    <form:form modelAttribute="REMINDER_SERVICE" action="send_send_leadReminder">
                        <form:hidden path="leadsRecorderObj.leadId" />
                        <form:hidden path="leadsRecorderObj.contactName" />
                        <form:hidden path="smsVo.to" />
                        <form:hidden path="smsVo.message" />
                    
                        <form:hidden path="bothSmsAndEmailReminder" />
                        <form:hidden path="smsReminder" />
                        <form:hidden path="emailReminder" />
                        <div class="rso container">
                            <div class="rso_wrapper">
                            <h1 style="font-size:25px;margin-bottom:10px;color:#FABA08">View Reminder Service</h1>
                                <div class="rso_wrapper_data">
                                    <div class="rso_wrapper_data_line bc-clr">
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Lead Id</label>
                                            <p>Q-${String.format("%04d",REMINDER_SERVICE.leadsRecorderObj.leadId)}-${REMINDER_SERVICE.leadsRecorderObj.leadSourceShortName
                                            }</p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Is Qualified</label>
                                            <p>
                                                <form:checkbox path="leadsRecorderObj.qualified" disabled="true" />
                                            </p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Is Flagged</label>
                                            <p>
                                            <form:checkbox path="leadsRecorderObj.flagged" disabled="true" />
                                            </p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Client</label>
                                            <p>${REMINDER_SERVICE.leadsRecorderObj.contactName}</p>
                                        </div>
                                    </div>
                                    <div class="rso_wrapper_data_line bc-clr">
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Lead Owner</label>
                                            <p>${REMINDER_SERVICE.leadsRecorderObj.leadOwnerName}</p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Source</label>
                                            <p>${REMINDER_SERVICE.leadsRecorderObj.sourceName}</p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Destination</label>
                                            <p>${REMINDER_SERVICE.leadsRecorderObj.destinationName}</p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Adults</label>
                                            <p>${REMINDER_SERVICE.leadsRecorderObj.adults}</p>
                                        </div>
                                    </div>
                                    <div class="rso_wrapper_data_line bc-clr">
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Chlidren</label>
                                            <p>${REMINDER_SERVICE.leadsRecorderObj.children}</p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Age</label>
                                            <p>${REMINDER_SERVICE.leadsRecorderObj.childrenAgeInfo}</p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Lead Source</label>
                                            <p>${REMINDER_SERVICE.leadsRecorderObj.leadSourceName}</p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Travel Start Date</label>
                                            <p>
                                            <fmt:formatDate value="${REMINDER_SERVICE.leadsRecorderObj.travelStartDate}" pattern="dd-MM-yyyy" />
                                            </p>
                                        </div>
                                    </div>
                                    <div class="rso_wrapper_data_line bc-clr">
                                        <div class="rso_wrapper_data_l1p">
                                            <label for="" class="lb">Travel End Date</label>
                                            <p>
                                                <fmt:formatDate value="${REMINDER_SERVICE.leadsRecorderObj.travelEndDate}" pattern="dd-MM-yyyy" />
                                            </p>
                                        </div>
                                        <div class="rso_wrapper_data_l1p">
                                            <label for="" class="lb">Tentative Amount</label>
                                            <p>${REMINDER_SERVICE.leadsRecorderObj.tentativeCost}</p>
                                        </div>
                                        <div class="rso_wrapper_data_l1p">
                                            <label for="" class="lb">Status</label>
                                            <p>${REMINDER_SERVICE.leadsRecorderObj.statusName}</p>
                                        </div>
                                    </div>
                                    <h1 style="text-align: start;" class="lb">Services requested</h1>
                                    <div class="rso_wrapper_data_line ">
                                        <div class="rso_wrapper_data_ser">
                                            <div class="rso_ser">
                                                <form:checkbox path="leadsRecorderObj.landPackage" name="landPackage;"
                                                    disabled="true" />
                                                <label for="">package</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox path="leadsRecorderObj.flight" name="flight"
                                                    disabled="true" />
                                                <label for="">flight</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox path="leadsRecorderObj.hotel" name="hotel"
                                                    disabled="true" />
                                                <label for="">hotal</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox path="leadsRecorderObj.transfers" name="transfers"
                                                    disabled="true" />
                                                <label for="">transfers</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox path="leadsRecorderObj.sightseeing" name="sightseeing"
                                                    disabled="true" />
                                                <label for="">signtseeing</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox path="leadsRecorderObj.visa" name="visa"
                                                    disabled="true" />
                                                <label for="">visa</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox path="leadsRecorderObj.insurance" name="insurance"
                                                    disabled="true" />
                                                <label for="">insurance</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox path="leadsRecorderObj.cruise" name="cruise"
                                                    disabled="true" />
                                                <label for="">cruise</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox path="leadsRecorderObj.others" name="others"
                                                    disabled="true" />
                                                <label for="">others</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- ########################### table ####################### -->

                            <table class="rso_table">
                                <tr>
                                    <th style="background-color:#6082B6;height: 40px;width: 10%;">Reminder History</th>
                                </tr>
                                <tr>
                                    <td>
                                        <table>
                                            <tr>
                                                <th width="300px">S.No.</th>
                                                <th width="300px">SMS</th>
                                                <th width="300px">Email</th>
                                                <th width="300px">Reminder DateTime</th>
                                            </tr>

                                            <c:set var="count" value="${LEADS_REMINDER_RECORDS.size()+1}"
                                                scope="page" />
                                           <c:set var="count" value="${LEADS_REMINDER_RECORDS.size()+1}" scope="page" />
						<c:forEach items="${LEADS_REMINDER_RECORDS}" var="leadReminderRecorder">
							<tr>
								<td>${count=count-1}</td>
								<td>${leadReminderRecorder.smsSent}</td>
								<td>${leadReminderRecorder.emailSent}</td>
								<td><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" pattern="dd-MM-yyyy" value="${leadReminderRecorder.createdAt}" /></td>
							</tr>	
						</c:forEach>
                                        </table>
                                    </td>
                                </tr>
                            </table>

                            <!-- ########################### table ####################### -->
                    </form:form>
                </body>

</html>