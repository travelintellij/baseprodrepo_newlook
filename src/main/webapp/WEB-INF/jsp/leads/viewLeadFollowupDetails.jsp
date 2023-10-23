<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lead Followup</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
	<link href="<c:url value="/resources/css/jquery.datetimepicker.min.css" />" rel="stylesheet">
	<script src="<c:url value="/resources/js/jquery.datetimepicker.full.js" />"></script>
</head>

<body
    style="background: url(${pageContext.request.contextPath}/resources/images/revamped/lead_follow_up_1.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
	
	<form:form modelAttribute="LEAD_FOLLOWUP_OBJ" action="create_create_lead_followup">
	<input type="hidden" name= "leadId" value="${LEAD_OBJ.leadId}"/>
	<div class="follow-up">
        <div class="follow-up-wrapper container">
            <div class="follow-up-heading">
                <h1>Lead Followup</h1>
            </div>
            <div class="follow-up-main-form">
                <div class="follow-up-main-upper-part">
                    <div class="follow-up-sub-uppper-part">
                        <h3 class="follow-up-p" style="color: #FFBA08;;">
                            ${pageContext.request.remoteUser} says
                        </h3>
                        <div class="follow-up-time">
                            <div class="follow-up-lead-action-time">
                                <label for="fulat">Lead Action Time</label>
                                <form:input path= "followuptime" required="required" id="followuptime"/>
                            </div>
                            <div class="follow-up-next-action-time">
                                <label for="funat">Next Action Time</label>
                                <form:input path= "nextfollowuptime" required="required" id="nextfollowuptime"/>
                            </div>
                        </div>
                        <div class="follow-up-main-response">
                            <div class="fwaction-taken">
                                <p>Action Taken | Client Response</p>
                                <form:textarea path = "response" rows = "5" cols = "40" />
                            </div>
                            <div class="fwnext-todo">
                                <p>Next To do</p>
                                <form:textarea path = "nextactionplan" rows = "5" cols = "40" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="follow-up-btn">
                    <input type="submit" id="submitFollowup" name="submitFollowup" value="Update Follwup" class="submitbtns submit1" />
                </div>
            </div>
        </div>
    </div>
    <!-- ################## followup lead ################ -->

    <div class="follow-up-main-tabel container" style="margin-top:50px">
        <table>
            <tr>
              <c:if test="${LEAD_FOLLOWUP_OBJ.sortOrder eq 'ASC'}">
				<th><a href="form_view_lead_followup_details?leadId=${LEAD_OBJ.leadId}&sortBy=updatedBy&sortOrder=DESC">User</a></th>
			</c:if>

			<c:if test="${LEAD_FOLLOWUP_OBJ.sortOrder ne 'ASC'}">
				<th><a href="form_view_lead_followup_details?leadId=${LEAD_OBJ.leadId}&sortBy=updatedBy&sortOrder=ASC">User</a></th>
			</c:if>

		
			<c:if test="${LEAD_FOLLOWUP_OBJ.sortOrder eq 'ASC'}">
				<th><a href="form_view_lead_followup_details?leadId=${LEAD_OBJ.leadId}&sortOrder=DESC">Lead Action Time</a></th>
			</c:if>

			<c:if test="${LEAD_FOLLOWUP_OBJ.sortOrder ne 'ASC'}">
				<th><a href="form_view_lead_followup_details?leadId=${LEAD_OBJ.leadId}&sortOrder=ASC">Lead Action Time</a></th>
			</c:if>
			
			<th>Action Taken | Client Response</th>
			
			
			<c:if test="${LEAD_FOLLOWUP_OBJ.sortOrder eq 'ASC'}">
				<th><a href="form_view_lead_followup_details?leadId=${LEAD_OBJ.leadId}&sortBy=nextfollowuptime&sortOrder=DESC">Next Action Time</a></th>
			</c:if>

			<c:if test="${LEAD_FOLLOWUP_OBJ.sortOrder ne 'ASC'}">
				<th><a href="form_view_lead_followup_details?leadId=${LEAD_OBJ.leadId}&sortBy=nextfollowuptime&sortOrder=ASC">Next Action Time</a></th>
			</c:if>
			<th>Next To Do</th>
              
            </tr>
         <tr>
         <c:forEach items="${LEADS_FOLLOWUP_LIST}" var="filteredFollowUpList">
		 <tr>
			 <td>${filteredFollowUpList.userName }</td>
			 <td>${filteredFollowUpList.formattedFollowUpTime }</td>
			 <td style="text-align:left;">${filteredFollowUpList.response}</td>
			 <td>${filteredFollowUpList.formattedNextFollowUpTime}</td>
			 <td style="text-align:left;">${filteredFollowUpList.nextactionplan}</td>
		 </tr>
		 </c:forEach>
		<tr>
  			<td colspan="5">
  			 <div id="pagination" align="center">
				Page: 
			    <c:url value="form_view_lead_followup_details" var="prev">
			       <c:param name="page" value="${page-1}"/>
			    </c:url>
			    <c:if test="${page > 0}">
			        <a href="<c:out value="${prev}&leadId=${LEAD_OBJ.leadId}&sortBy=${LEAD_FOLLOWUP_OBJ.sortBy}&sortOrder=${LEAD_FOLLOWUP_OBJ.sortOrder}"/>" class="pn prev">Prev</a>
			    </c:if>
			
			    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
			        <c:choose>
			            <c:when test="${(page+1) == i.index}">
			                <span>${i.index}</span>
			            </c:when>
			            <c:otherwise>
			                <c:url value="form_view_lead_followup_details" var="url">
			                    <c:param name="page" value="${i.index-1}"/>
			                </c:url>
			                 <a href='<c:out value="${url}&leadId=${LEAD_OBJ.leadId}&sortBy=${LEAD_FOLLOWUP_OBJ.sortBy}&sortOrder=${LEAD_FOLLOWUP_OBJ.sortOrder}" />'>${i.index}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:url value="form_view_lead_followup_details" var="next">
			        <c:param name="page" value="${page + 1}"/>
			    </c:url>
			    <c:if test="${page + 1 < maxPages}">
			       <a href='<c:out value="${next}&leadId=${LEAD_OBJ.leadId}&sortBy=${LEAD_FOLLOWUP_OBJ.sortBy}&sortOrder=${LEAD_FOLLOWUP_OBJ.sortOrder}" />' class="pn next">Next</a>
			    </c:if>
			</div>
			</td>
			</tr>
         </tr>
        </table>
    </div>
	</form:form>




    <div class="quick-lead-view">
        <div class="follow-up-icon">
        </div>
        <p class="qlv-text">Quick Lead View</p>
        <i class="fa-solid fa-bars fa-xl hamburgur-i-follow-up ham"></i>
        <input type="checkbox" name="" id="show-fu-cb" class="hamburgur-i-follow-up hamCh">
        <!-- ############ hidden ############ -->
        <div class="inside-quick-lead-view container">
            <!-- <i><i class="fa-solid fa-xmark fa-2xl follw-up-cross"></i></i>
            <input class= "iqvl-cross" type="checkbox" style="position: absolute;top: 11px;left: 13px;;width: 20px;height: 20px;"> -->


            <input type="checkbox" id="show-fu-cb" class="hamburgur-i-follow-up hamCh">
            <label for="show-fu-cb" class="iqvl-cross">
                <i class="fa-solid fa-xmark fa-2xl follw-up-cross"></i>
            </label>



            <h1 style="margin-bottom: 5px;">Lead Details</h1>
            <div class="follow-up-data">
                <div class="follow-up-fl">
                    <div class="follow-up-d1-l1 fu-box">
                        <label for="">Lead id</label>
                        <p>Q-0778-HCF</p>
                    </div>
                    <div class="follow-up-d2-l1 fu-box">
                        <label for="">Client</label>
                        <p>Hitesh Kumar</p>
                    </div>
                    <div class="follow-up-d3-l1 fu-box">
                        <label for="">Source</label>
                        <p>Delhi</p>
                    </div>
                    <div class="follow-up-d4-l1 fu-box">
                        <label for="">Destination</label>
                        <p>Kathmandu</p>
                    </div>
                    <div class="follow-up-d5-l1 fu-box">
                        <label for="">Adults</label>
                        <p>4</p>
                    </div>
                </div>
                <div class="follow-up-f2">
                    <div class="follow-up-d1-l2 fu-box">
                        <label for="">Children</label>
                        <p>0(Age)</p>
                    </div>
                    <div class="follow-up-d2-l2 fu-box">
                        <label for="">Travel s date</label>
                        <p>07-09-2023</p>
                    </div>
                    <div class="follow-up-d3-l2 fu-box">
                        <label for="">Travel e date</label>
                        <p>10-09-2023</p>
                    </div>
                    <div class="follow-up-d4-l2 fu-box">
                        <label for="">Lead Source</label>
                        <p>Holidays Guide</p>
                    </div>
                    <div class="follow-up-d5-l2 fu-box">
                        <label for="">Status</label>
                        <p>Open</p>
                    </div>
                </div>
                <div class="follow-up-f3">
                    <h2>Services Requested</h2>
                    <div class="follow-up-reqs">
                        <div class="follow-up-c1">
                            <label for="">Package</label>
                            <input type="checkbox" name="" id="">
                        </div>
                        <div class="follow-up-c1">
                            <label for="">Flight</label>
                            <input type="checkbox" name="" id="">
                        </div>
                        <div class="follow-up-c1">
                            <label for="">Hotal</label>
                            <input type="checkbox" name="" id="">
                        </div>
                        <div class="follow-up-c1">
                            <label for="">Transfers</label>
                            <input type="checkbox" name="" id="">
                        </div>
                        <div class="follow-up-c1">
                            <label for="">Sightseeing</label>
                            <input type="checkbox" name="" id="">
                        </div>
                        <div class="follow-up-c1">
                            <label for="">Visa</label>
                            <input type="checkbox" name="" id="">
                        </div>
                        <div class="follow-up-c1">
                            <label for="">Insurence</label>
                            <input type="checkbox" name="" id="">
                        </div>
                        <div class="follow-up-c1">
                            <label for="">cruise</label>
                            <input type="checkbox" name="" id="">
                        </div>
                        <div class="follow-up-c1">
                            <label for="">others</label>
                            <input type="checkbox" name="" id="">
                        </div>
                    </div>
                </div>
                <div class="follow-ups-remarks-qv">
                    <h3>Remarks</h3>
                </div>
            </div>
        </div>
    </div>

<script>
$(document).ready(function(){
	$("#UpdateFollowup").on('click', function () {
		var fuValue=$("#followuptime").val();
	   	var nfuValue=$("#nextfollowuptime").val();
	   	$('input[name=followuptime]').val(fuValue);
	   	$('input[name=nextfollowuptime]').val(nfuValue);
	 });

 });
	$("#followuptime").datetimepicker();
	$("#nextfollowuptime").datetimepicker();
	

	
</script>
</body>

</html>