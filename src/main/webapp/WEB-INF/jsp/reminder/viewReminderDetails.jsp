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
       <title>Reminder Service</title>
       <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
       <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
       
       <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
		<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>

       
   </head>
   <style>
  body::before {
     content: "";
     background-image:   url(${pageContext.request.contextPath}/resources/images/revamped/re_lead.jpg);
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
					<form:hidden path = "leadsRecorderObj.leadId" />
					<form:hidden path = "leadsRecorderObj.contactName" />
					<form:hidden path = "smsVo.to" />
					<form:hidden path = "smsVo.message" />
					
					<form:hidden path = "bothSmsAndEmailReminder" />
					<form:hidden path = "smsReminder" />
					<form:hidden path = "emailReminder" />
                        <div align="center"><b>
                                <font color="green"> ${Success} </font>
                                <font color="red"> ${Failure}</font>
                            </b></div>
                        <div class="rso container">
                            <div class="rso_wrapper">
                                <div class="rso_wrapper_data">
                                <h1 class="hd">Reminder</h1>
                                    <div class="rso_wrapper_data_line a">
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Lead Id</label>
                                            <p style="color:#32cd32;font-weight:bold">Q-${String.format("%04d",REMINDER_SERVICE.leadsRecorderObj.leadId)}-${REMINDER_SERVICE.leadsRecorderObj.leadSourceShortName
                                                }</p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Is Qualified</label>
                                            <p>
                                                <form:checkbox class="ch_c" path="leadsRecorderObj.qualified" disabled="true" style="width:18px;height:18px"/><span class="checkmark">
                                            </p>
                                        </div>
                                        <div class="rso_wrapper_data_l1">
                                            <label for="" class="lb">Is Flagged</label>
                                            <p>
                                                <form:checkbox class="ch_c" path="leadsRecorderObj.flagged" disabled="true" style="width:18px;height:18px"/>
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
                                            <p style="color:gray">${REMINDER_SERVICE.leadsRecorderObj.leadOwnerName}2</p>
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
                                            <p style="color:gray">${REMINDER_SERVICE.leadsRecorderObj.children}2</p>
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
                                                <fmt:formatDate
                                                    value="${REMINDER_SERVICE.leadsRecorderObj.travelStartDate}"
                                                    pattern="dd-MM-yyyy" />
                                            </p>
                                        </div>
                                    </div>
                                    <div class="rso_wrapper_data_line a">
                                        <div class="rso_wrapper_data_l1p">
                                            <label for="" class="lb">Travel End Date</label>
                                            <p style="color:gray">
                                                <fmt:formatDate
                                                    value="${REMINDER_SERVICE.leadsRecorderObj.travelEndDate}"
                                                    pattern="dd-MM-yyyy" />
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
                                                    disabled="true" style="width:18px;height:18px"/>
                                                <label for="">flight</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox class="ch_c" path="leadsRecorderObj.hotel" name="hotel"
                                                    disabled="true" style="width:18px;height:18px"/>
                                                <label for="">hotal</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox class="ch_c" path="leadsRecorderObj.transfers" name="transfers"
                                                    disabled="true" style="width:18px;height:18px"/>
                                                <label for="">transfers</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox class="ch_c" path="leadsRecorderObj.sightseeing" name="sightseeing"
                                                    disabled="true" style="width:18px;height:18px"/>
                                                <label for="">signtseeing</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox class="ch_c" path="leadsRecorderObj.visa" name="visa"
                                                    disabled="true" style="width:18px;height:18px"/>
                                                <label for="">visa</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox class="ch_c" path="leadsRecorderObj.insurance" name="insurance"
                                                    disabled="true" style="width:18px;height:18px"/>
                                                <label for="">insurance</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox class="ch_c" path="leadsRecorderObj.cruise" name="cruise"
                                                    disabled="true" style="width:18px;height:18px"/>
                                                <label for="">cruise</label>
                                            </div>
                                            <div class="rso_ser">
                                                <form:checkbox class="ch_c" path="leadsRecorderObj.others" name="others"
                                                    disabled="true" style="width:18px;height:18px"/>
                                                <label for="">others</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- ########################### table ####################### -->

                            <table class="rso_table">
                                <tr>
                                    <th style="background-color:#6082B6;height: 50px;width: 10%;color:black">Reminder History</th>
                                </tr>
                                <tr>
                                    <td>
                                        <table style="background:white;color:black">
                                            <tr>
                                                <th width="300px;">S.No.</th>
                                                <th width="300px;">SMS</th>
                                                <th width="300px;">Email</th>
                                                <th width="300px;">Reminder DateTime</th>
                                            </tr>

                                            <c:set var="count" value="${LEADS_REMINDER_RECORDS.size()+1}"
                                                scope="page" />
                                            <c:forEach items="${LEADS_REMINDER_RECORDS}" var="leadReminderRecorder">
                                                <tr >
                                                    <td style="border-bottom:2px solid black;border-right:2px solid black">${count=count-1}</td>
                                                    <td style="border-bottom:2px solid black;border-right:2px solid black">${leadReminderRecorder.smsSent}</td>
                                                    <td style="border-bottom:2px solid black;border-right:2px solid black">${leadReminderRecorder.emailSent}</td>
                                                    <td style="border-bottom:2px solid black">
                                                        <fmt:formatDate type="both" dateStyle="medium"
                                                            timeStyle="medium" pattern="dd-MMM-yyyy"
                                                            value="${leadReminderRecorder.createdAt}" />
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </td>
                                </tr>
                            </table>

                            <!-- ########################### table ####################### -->
                            
                            <div class="sms-mail-wrapper">
                            <!-- ########################### sms reminder ####################### -->
                            <div class="rso_sms bs">
                                <h1 style="font-size: 25px;color:#32cd32  ">SMS Reminder<i
                                        class="fa-solid fa-comment-sms fa-xl"></i>
                                </h1>
                                <div class="rso_sms_heading"  style= "color:blue;font-weight:bold">
                                    To : ${REMINDER_SERVICE.leadsRecorderObj.contactName} ( ${REMINDER_SERVICE.smsVo.to}
                                    )
                                </div>
                                <div class="rso_sms_input">
                                    <form:textarea path="smsVo.message" rows="11" cols="65" maxlength="240"
                                        disabled="true" />
                                </div>
                                <div class="due_today_task_data_btns">
                                    <input type="submit" style="background:#32cd32;color:white" name="SendEmail" value="Send SMS Reminder" id="sms" />
                                </div>
                            </div>

                            <!-- ########################### sms reminder ####################### -->
                            <!-- ########################### email reminder ####################### -->


                            <div class="rso_sms">
                                <h1 style="font-size: 25px;color:#32cd32  ">Email Reminder <i
                                        class="fa-regular fa-envelope fa-xl"></i>
                                </h1>
                                <div class="sms_email_wrapper">
                                    <div class="rso_sms_heading" style="width:815px">
                                        <label for="" style="color:blue;font-weight:bold">To : </label> <br>
                                        <form:input path="emailMessageVo.emailToList" />
                                        <font color="red">
                                            <form:errors path="emailMessageVo.emailToList" cssClass="error" />
                                        </font>
                                    </div>
                                    <div class="rso_sms_heading" style="width:815px">
                                        <label for="" style="color:blue;font-weight:bold">Cc : </label> <br>
                                        <form:input path="emailMessageVo.emailCcList" />
                                        <font color="red">
                                            <form:errors path="emailMessageVo.emailCcList" cssClass="error" />
                                        </font>
                                    </div>
                                    <div class="rso_sms_heading" style="width:815px">
                                        <label for="" style="color:blue;font-weight:bold">Subject : </label> <br>
                                        <form:input path="emailMessageVo.emailSubject" />
                                    </div>
                                </div>
                                <div class="rso_sms_input">
                                    <label for="" style="color:blue;font-weight:bold">Massage : </label> <br>
                                    <form:textarea path="emailMessageVo.emailMessage" rows="4" cols="65" />
                                </div>
                                <div class="due_today_task_data_btns">
                                    <input type="submit" style="background:#32cd32;color:white" name="SendEmail" value="Send Email Reminder" id="email" onclick="return setReminderMode()" />
                                </div>
                            </div>
                            </div>
                            <!-- ########################### email reminder ####################### -->
                            <div class="due_today_task_data_btns"
                                style="display:flex;justify-content: center;margin-bottom: 50px;">
                                <input type="submit" name="SendEmail" value="Send Both Sms-Email Reminder" id="both"  style="background:#023e8a;color:white"/>
                                <a href="view_filter_leads?page=${page}" style="background:#023e8a;color:white">Cancel</a>
                            </div>

                        </div>
                    </form:form>


					<script>
					$('#sms, #email,#both').click(function () {
						   if (this.id == 'sms') {
							   $("#smsReminder").attr('value','true');
							   $("#bothSmsAndEmailReminder").attr('value','false');
							   $("#emailReminder").attr('value','false');
						   }
						   else if (this.id == 'email') {
							   $("#emailReminder").attr('value','true');
							   $("#smsReminder").attr('value','false');
							   $("#bothSmsAndEmailReminder").attr('value','false');
						   }
						   else if (this.id == 'both') {
							   $("#bothSmsAndEmailReminder").attr('value','true');
							   $("#smsReminder").attr('value','false');
							   $("#emailReminder").attr('value','false');
							}
						});

					
					/*
					function setNotifyAction(clicked){ 
						alert(clicked);
						$("#bothSmsAndEmailReminder").attr('value','true');
						alert($("#bothSmsAndEmailReminder").val());
					}
					*/
					</script>

                </body>

</html>