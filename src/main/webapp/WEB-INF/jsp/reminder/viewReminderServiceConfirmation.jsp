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
            opacity: 0.5; /* Adjust the opacity value as needed (0.0 to 1.0) */
            z-index: -1;
        }
</style>
                <body>
                    <form:form modelAttribute="REMINDER_SERVICE" action="send_send_leadReminder">
                        <form:hidden path="leadsRecorderObj.leadId" />
                        <form:hidden path="leadsRecorderObj.contactName" />
                        <form:hidden path="smsVo.to" />
                        <form:hidden path="smsVo.message" />
                    
                        <form:hidden path="bothSmsAndEmailReminder" />
                        <form:hidden path="smsReminder" />
                        <form:hidden path="emailReminder" />
                        <div class="rso container">
                            <div class="rso_wrapper bs">
                            <h1 style="font-size:25px;margin-bottom:10px;color:#32cd32">View Reminder Service</h1>
                                <div class="rso_wrapper_data">
                                    <div class="rso_wrapper_data_line a">
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Lead Id</label>
                                            <p style="color:#32cd32;font-weight:bold">Q-${String.format("%04d",REMINDER_SERVICE.leadsRecorderObj.leadId)}-${REMINDER_SERVICE.leadsRecorderObj.leadSourceShortName
                                            }</p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Is Qualified</label>
                                            <p>
                                                <form:checkbox class="ch_c" path="leadsRecorderObj.qualified" disabled="true" style="width:18px;height:18px"/>
                                            </p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Is Flagged</label>
                                            <p>
                                            <form:checkbox class="ch_c" path="leadsRecorderObj.flagged" disabled="true"  style="width:18px;height:18px"/>
                                            </p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Client</label>
                                            <p style="color:gray">${REMINDER_SERVICE.leadsRecorderObj.contactName}</p>
                                        </div>
                                    </div>
                                    <div class="rso_wrapper_data_line a">
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Lead Owner</label>
                                            <p style="color:gray">${REMINDER_SERVICE.leadsRecorderObj.leadOwnerName}</p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Source</label>
                                            <p style="color:gray">${REMINDER_SERVICE.leadsRecorderObj.sourceName}</p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Destination</label>
                                            <p style="color:gray">${REMINDER_SERVICE.leadsRecorderObj.destinationName}</p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Adults</label>
                                            <p style="color:gray">${REMINDER_SERVICE.leadsRecorderObj.adults}</p>
                                        </div>
                                    </div>
                                    <div class="rso_wrapper_data_line a">
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Chlidren</label>
                                            <p style="color:gray">${REMINDER_SERVICE.leadsRecorderObj.children}</p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Age</label>
                                            <p style="color:gray">${REMINDER_SERVICE.leadsRecorderObj.childrenAgeInfo}</p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Lead Source</label>
                                            <p style="color:gray">${REMINDER_SERVICE.leadsRecorderObj.leadSourceName}</p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Travel Start Date</label>
                                            <p style="color:gray">
                                            <fmt:formatDate value="${REMINDER_SERVICE.leadsRecorderObj.travelStartDate}" pattern="dd-MM-yyyy" />
                                            </p>
                                        </div>
                                    </div>
                                    <div class="rso_wrapper_data_line a">
                                        <div class="rso_wrapper_data_l1p">
                                            <label for="" class="lb">Travel End Date</label>
                                            <p style="color:gray">
                                                <fmt:formatDate value="${REMINDER_SERVICE.leadsRecorderObj.travelEndDate}" pattern="dd-MM-yyyy" />
                                            </p>
                                        </div>
                                        <div class="rso_wrapper_data_l1p">
                                            <label for="" class="lb">Tentative Amount</label>
                                            <p style="color:gray">${REMINDER_SERVICE.leadsRecorderObj.tentativeCost}</p>
                                        </div>
                                        <div class="rso_wrapper_data_l1p">
                                            <label for="" class="lb">Status</label>
                                            <p style="color:gray">${REMINDER_SERVICE.leadsRecorderObj.statusName}</p>
                                        </div>
                                    </div>
                                    <h1 style="text-align: start;" class="lb">Services requested</h1>
                                    <div class="rso_wrapper_data_line ">
                                        <div class="rso_wrapper_data_ser">
                                            <div class="rso_ser">
                                                <form:checkbox class="ch_c" path="leadsRecorderObj.landPackage" name="landPackage;"
                                                    disabled="true" style="width:18px;height:18px"/>
                                                <label for="">package</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox class="ch_c" path="leadsRecorderObj.flight" name="flight"
                                                    disabled="true"  style="width:18px;height:18px"/>
                                                <label for="">flight</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox class="ch_c" path="leadsRecorderObj.hotel" name="hotel"
                                                    disabled="true"  style="width:18px;height:18px"/>
                                                <label for="">hotal</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox class="ch_c" path="leadsRecorderObj.transfers" name="transfers"
                                                    disabled="true"  style="width:18px;height:18px"/>
                                                <label for="">transfers</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox class="ch_c" path="leadsRecorderObj.sightseeing" name="sightseeing"
                                                    disabled="true"  style="width:18px;height:18px"/>
                                                <label for="">signtseeing</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox class="ch_c" path="leadsRecorderObj.visa" name="visa"
                                                    disabled="true"  style="width:18px;height:18px"/>
                                                <label for="">visa</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox class="ch_c" path="leadsRecorderObj.insurance" name="insurance"
                                                    disabled="true"  style="width:18px;height:18px"/>
                                                <label for="">insurance</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox class="ch_c" path="leadsRecorderObj.cruise" name="cruise"
                                                    disabled="true"  style="width:18px;height:18px"/>
                                                <label for="">cruise</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox class="ch_c" path="leadsRecorderObj.others" name="others"
                                                    disabled="true"  style="width:18px;height:18px"/>
                                                <label for="">others</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- ########################### table ####################### -->

                            <table class="rso_table bs">
                                <tr>
                                    <th style="color:#32cd32;font-size:25px">Reminder History</th>
                                </tr>
                                <tr>
                                    <td>
                                        <table>
                                            <tr style="background-color:#6082B6;height: 50px;width: 10%;">
                                                <th width="300px;" style="color:black">S.No.</th>
                                                <th width="300px;" style="color:black">SMS</th>
                                                <th width="300px;" style="color:black">Email</th>
                                                <th width="300px;" style="color:black">Reminder DateTime</th>
                                            </tr>

                                            <c:set var="count" value="${LEADS_REMINDER_RECORDS.size()+1}"
                                                scope="page" />
                                           <c:set var="count" value="${LEADS_REMINDER_RECORDS.size()+1}" scope="page" />
						<c:forEach items="${LEADS_REMINDER_RECORDS}" var="leadReminderRecorder">
							<tr>
								<td style="border-bottom:2px solid black;border-right: 2px solid black">${count=count-1}</td>
								<td style="border-bottom:2px solid black;border-right: 2px solid black">${leadReminderRecorder.smsSent}</td>
								<td style="border-bottom:2px solid black;border-right: 2px solid black">${leadReminderRecorder.emailSent}</td>
								<td style="border-bottom:2px solid black;"><fmt:formatDate type="both" dateStyle="medium" timeStyle="medium" pattern="dd-MM-yyyy" value="${leadReminderRecorder.createdAt}" /></td>
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