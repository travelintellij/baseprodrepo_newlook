<!DOCTYPE html>
<html>
<jsp:include page="../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/css/jquery.datetimepicker.min.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/jquery.datetimepicker.full.js" />"></script>

<style>
table {
  width: 100%;
  height: 20px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 3px auto;
  background: white;
  font-size:18;
}

th {
  background: blue;
  height: 40px;
  width: 15%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
  font-size:18px;
}
tr {
  border-bottom: 1px solid #cccccc;
}

td {
  border-right: 1px solid #cccccc;
  padding: 10px;
  transition: all 0.2s;
  text-align: center;
}
input[type=button], input[type=submit], input[type=reset] {
  background-color: green;
  border: none;
  color: white;
  padding: 10px 20px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}

.sidenav {
	height: 70%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 118;
	left: 0; //
	//background-color: #111;
	background-color: lightblue;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 30px;
	text-align: center;
}

.sidenav a {
	padding: 4px 4px 4px 16px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover {
	color: #f1f1f1;
	
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

.float-container {
    //border: 3px solid #fff;
    padding: 15px;
}

.float-child-left {
    width: 20%;
    float: left;
    padding: 20px;
    //border: 2px solid red;
}

.float-child-right {
    width: 100%;
    float: center;
    //padding: 50px;
    //border: 2px solid red;
}  
  
</style>
<br>
<h2 align="center">Lead Followup </h2>


<body>

<form:form modelAttribute="LEAD_OBJ" action="create_create_lead_quotation">

	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<jsp:include page="../quotation/leadDetailsOpenNavView.jsp" />
	</div>
	<h3>
		<br>
		<font color="red">View Lead Details </font>
	</h3>
	<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;
		 Quick Lead View</span>
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "35%";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
	</script>
	<form:hidden path = "leadId" />
	</form:form>
	<form:form modelAttribute="LEAD_FOLLOWUP_OBJ" action="create_create_lead_followup">
	
	<input type="hidden" name= "leadId" value="${LEAD_OBJ.leadId}"/>
	
	
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<table style="width:40%;">
		<tr><th style="text-align:left;background: maroon;" colspan="2">${pageContext.request.remoteUser} Says:</th></tr>
		<tr><th>Lead Action Time</th><th>Next Action Time</th></tr>
		<tr><td><form:input path= "followuptime" required="required" style="height: 30px; width: 180px;" id="followuptime"/></td><td><form:input path= "nextfollowuptime" required="required" style="height: 30px; width: 180px;" id="nextfollowuptime"/></td></tr>
		<tr><th>Action Taken | Client Response</th><th>Next To Do</th></tr>
		<tr><td><form:textarea path = "response" rows = "5" cols = "40" style="font-size:18px;"/></td><td><form:textarea path = "nextactionplan" rows = "5" cols = "40" style="font-size:18px;"/></td></tr>
		<tr><td colspan="2" style="text-align:center;"><input style="width: 180px; background-color: green" type="submit" value="Update Followup" id="UpdateFollowup" name="UpdateFollowup" /></td></tr>
	</table>	
	<br><br>
	
	<table style="width:70%;font-size:18px;">
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
	</table>



    </form:form> 
  	
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
  