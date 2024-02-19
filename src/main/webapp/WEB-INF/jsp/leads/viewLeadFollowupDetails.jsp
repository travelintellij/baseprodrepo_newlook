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
<style>
body::before {
            content: "";
            background-image:url(${pageContext.request.contextPath}/resources/images/revamped/lead_follow_up_1.jpg);
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
	
	<form:form modelAttribute="LEAD_FOLLOWUP_OBJ" action="create_create_lead_followup">
	<input type="hidden" name= "leadId" value="${LEAD_OBJ.leadId}"/>
	<div class="follow-up">
        <div class="follow-up-wrapper bs  container">
            <div class="follow-up-heading" style="padding-top:5px">
                <h1>Lead Followup</h1>
            </div>
            <div class="follow-up-main-form">
                <div class="follow-up-main-upper-part">
                    <div class="follow-up-sub-uppper-part">
                        <h3 class="follow-up-p" style="color:#32cd32 ;margin-top:10px" >
                          ${pageContext.request.remoteUser} says
                        </h3>
                        <div class="follow-up-time">
                            <div class="follow-up-lead-action-time">
                                <label for="fulat">Lead Action Time</label> <br>
                                <form:input path= "followuptime" required="required" id="followuptime"/>
                            </div>
                            <div class="follow-up-next-action-time">
                                <label for="funat">Next Action Time</label> <br>
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

    <div class="follow-up-main-tabel" style="margin-top:60px">
        <table class="bs">
            <tr style="background:#6082B6;">
              <c:if test="${LEAD_FOLLOWUP_OBJ.sortOrder eq 'ASC'}">
				<th ><a href="form_view_lead_followup_details?leadId=${LEAD_OBJ.leadId}&sortBy=updatedBy&sortOrder=DESC" style=" color: black !important;color: #FABA08; border: none;margin-bottom: 20px; font-size: 19px">User</a></th>
			</c:if>

			<c:if test="${LEAD_FOLLOWUP_OBJ.sortOrder ne 'ASC'}">
				<th><a href="form_view_lead_followup_details?leadId=${LEAD_OBJ.leadId}&sortBy=updatedBy&sortOrder=ASC" style=" color: black !important;color: #FABA08; border: none;margin-bottom: 20px; font-size: 19px">User</a></th>
			</c:if>

		
			<c:if test="${LEAD_FOLLOWUP_OBJ.sortOrder eq 'ASC'}">
				<th><a href="form_view_lead_followup_details?leadId=${LEAD_OBJ.leadId}&sortOrder=DESC" style=" color: black !important;color: #FABA08; border: none;margin-bottom: 20px; font-size: 19px">Lead Action Time</a></th>
			</c:if>

			<c:if test="${LEAD_FOLLOWUP_OBJ.sortOrder ne 'ASC'}">
				<th ><a href="form_view_lead_followup_details?leadId=${LEAD_OBJ.leadId}&sortOrder=ASC" style=" color: black !important;color: #FABA08; border: none;margin-bottom: 20px; font-size: 19px" >Lead Action Time</a></th>
			</c:if>
			
			<th class="actionTaken" style="color: black;margin-bottom: 20px; font-size: 19px">Action Taken | Client Response</th>
			
			
			<c:if test="${LEAD_FOLLOWUP_OBJ.sortOrder eq 'ASC'}">
				<th><a href="form_view_lead_followup_details?leadId=${LEAD_OBJ.leadId}&sortBy=nextfollowuptime&sortOrder=DESC" style=" color: black !important;color: #FABA08; border: none;margin-bottom: 20px; font-size: 19px"style=" color: #FFBA08 !important;">Next Action Time</a></th>
			</c:if>

			<c:if test="${LEAD_FOLLOWUP_OBJ.sortOrder ne 'ASC'}">
				<th><a href="form_view_lead_followup_details?leadId=${LEAD_OBJ.leadId}&sortBy=nextfollowuptime&sortOrder=ASC" style=" color: black !important;"style=" color: #FFBA08 !important;">Next Action Time</a></th>
			</c:if>
			<th class="nextToDo" style="color: black;margin-bottom: 20px; font-size: 19px">Next To Do</th>
              
            </tr>
         <c:forEach items="${LEADS_FOLLOWUP_LIST}" var="filteredFollowUpList">
		 <tr style="margin-bottom:20px;background:white">
			 <td style="font-size:18px;text-align:center;border-bottom:2px solid black;border-right:2px solid black">${filteredFollowUpList.userName }</td>
			 <td style="font-size:18px;text-align:center;border-bottom:2px solid black;border-right:2px solid black">${filteredFollowUpList.formattedFollowUpTime }</td>
			 <td style="font-size:18px;text-align:center;border-bottom:2px solid black;border-right:2px solid black">${filteredFollowUpList.response}</td>
			 <td style="font-size:18px;text-align:center;border-bottom:2px solid black;border-right:2px solid black">${filteredFollowUpList.formattedNextFollowUpTime}</td>
			 <td style="font-size:18px;text-align:center;border-bottom:2px solid black;">${filteredFollowUpList.nextactionplan}</td>
		 </tr>
		 </c:forEach>
        </table>
    </div>
    
    
     <div id="pagination" align="center" style="margin-top:10px">
			<span style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500;margin-right:5px">Page : </span>
			    <c:url value="form_view_lead_followup_details" var="prev">
			       <c:param name="page" value="${page-1}"/>
			    </c:url>
			    <c:if test="${page > 0}">
			        <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href="<c:out value="${prev}&leadId=${LEAD_OBJ.leadId}&sortBy=${LEAD_FOLLOWUP_OBJ.sortBy}&sortOrder=${LEAD_FOLLOWUP_OBJ.sortOrder}"/>" class="pn prev">Prev</a>
			    </c:if>
			
			    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
			        <c:choose>
			            <c:when test="${(page+1) == i.index}">
			                <span style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500"">${i.index}</span>
			            </c:when>
			            <c:otherwise>
			                <c:url value="form_view_lead_followup_details" var="url">
			                    <c:param name="page" value="${i.index-1}"/>
			                </c:url>
			                 <a style="background:white;padding:2px 5px;border-radius:2px;color:#ffa500" href='<c:out value="${url}&leadId=${LEAD_OBJ.leadId}&sortBy=${LEAD_FOLLOWUP_OBJ.sortBy}&sortOrder=${LEAD_FOLLOWUP_OBJ.sortOrder}" />'>${i.index}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:url value="form_view_lead_followup_details" var="next">
			        <c:param name="page" value="${page + 1}"/>
			    </c:url>
			    <c:if test="${page + 1 < maxPages}">
			       <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href='<c:out value="${next}&leadId=${LEAD_OBJ.leadId}&sortBy=${LEAD_FOLLOWUP_OBJ.sortBy}&sortOrder=${LEAD_FOLLOWUP_OBJ.sortOrder}" />' class="pn next">Next</a>
			    </c:if>
			</div>
	</form:form>
	


    <div class="quick-lead-view">
        <p class="qlv-text" >Quick Lead View</p>
        <i class="fa-solid fa-bars fa-xl hamburgur-i-follow-up ham"></i>
        <input type="checkbox" name="" id="show-fu-cb" class="hamburgur-i-follow-up hamCh fwtb">
        <div  class="inside-quick-lead-view">
        <form:form modelAttribute="LEAD_OBJ" action="create_create_lead_quotation">
		<jsp:include page="../quotation/leadDetailsOpenNavView.jsp" />
	    <form:hidden path = "leadId" />
	    </form:form>
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