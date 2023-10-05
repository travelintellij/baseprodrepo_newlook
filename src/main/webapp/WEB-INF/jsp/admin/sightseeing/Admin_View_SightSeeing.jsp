<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<style>
table {
  width: 80%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
}

th {
  background: #7B68EE;
  height: 40px;
  width: 10%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
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

.heavyTable {
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
  animation: float 5s infinite;
}

input[type=button], input[type=submit], input[type=reset] {
	background-color: green;
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}

</style>
<br>
<h2 align="center">  ${sightSeeingMasterObj.sightSeeingName } </h2>
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>

<body style="background-color: white;">
<hr>
	<form:form modelAttribute="sightseeing_obj" action="add_add_sightseeing">
		<table>
			<tr>
				<th style="width: 70px;" align="center">City</th>
				<td style="width: 135px;" align="center">
					${sightSeeingMasterObj.cityName } 
					<input type="hidden" id="cityId" name="cityId" value="0"/>
				</td>
							
				<th style="width: 175px;" align="center">Sight Seeing Name</th>
				<td style="width: 400px;" align="center">
					 ${sightSeeingMasterObj.sightSeeingName } 
				</td>
				<th style="width: 200px;" align="center">Tour Duration</th>
				<td style="width: 50px;" align="center">
						 ${sightSeeingMasterObj.duration }  Minutes
				</td>
				</tr>
				<tr>
				<th style="width: 100px;" align="center">Departure Point</th>
				<td style="width: 135px;" align="center">
					 ${sightSeeingMasterObj.departurePoint }  
				</td>
				<th style="width: 100px;" align="center">Reporting Point</th>
				<td style="width: 135px;" align="center">
					 ${sightSeeingMasterObj.reportingPoint }  
				</td>
				
				<th style="width: 175px;" align="center">Meals</th>
				<td style="width: 75px;" align="center">
					 ${sightSeeingMasterObj.meals }  
				</td>
				
				</tr>
				<tr>
				<th style="width: 90px;" align="center">Pickup Time</th>
				<td style="width: 100px;" align="center">
					 ${sightSeeingMasterObj.standardPickupTime }  
				</td>
				
				<th style="width: 100px;" align="center">Drop Time</th>
				<td style="width: 80px;" align="center">
					 ${sightSeeingMasterObj.standardDropTime } 
				</td>
				
				<th style="width: 100px;" align="center">Flexible Timing</th>
				<td style="width: 150px;" align="center">
					 ${sightSeeingMasterObj.flexibleTimming }  
				</td>
				</tr>
				<tr>
					<th>Tour Rating</th>
					<td  style="align: center;">
					 	<c:forEach var="i" begin="1" end="${sightSeeingMasterObj.tourRating}">
							<img src="${pageContext.request.contextPath}/resources/images/star.jpg" height="20" width="20" />
						</c:forEach>
					</td>
					<th>Active</th>
					<td  style="align: center;" colspan="3"  >
						${sightSeeingMasterObj.active}
					</td>
				</tr>
				<tr>		
				<td colspan="6" align="center"> <font color="green"><b>Tour Description</b></font></td>
				</tr>
				<tr>		
				<td colspan="6" style="vertical-align: top;text-align:left;">
						<p style="white-space: pre-line"> ${fn:trim(sightSeeingMasterObj.sightSeeingDescription)} </p>
				</td>
				</tr>
				<tr >		
					<td colspan="3" align="center" style=" border: 1px solid black;"> <font color="green"><b>Useful Information</b></font></td>
					<td colspan="3" align="center" style=" border: 1px solid black;"> <font color="red"><b>Terms & Conditions</b></font></td>
				</tr>
				<tr>		
					<td colspan="3" style="vertical-align: top;text-align:left;width:50%; border: 1px solid black;">
							<p style="white-space: pre-line"> ${fn:trim(sightSeeingMasterObj.usefulInfo)} </p>
					</td>
					<td colspan="3" style="vertical-align: top;text-align:left;width:50%; border: 1px solid black;">
							<p style="white-space: pre-line"> ${fn:trim(sightSeeingMasterObj.tnc)}</p>
					</td>
					
				</tr>
		</table>
	</form:form>
	<br>
	<p align="center">
		
		<sec:authorize access="hasAnyRole('ADMIN','SIGHT_SEEING_EDIT')">
			<a href="view_edit_sight_seeing_form?sightSeeingId=${sightSeeingMasterObj.sightSeeingId}" ><input type="button" style="background-color: blue;"value="Edit" /></a>
		</sec:authorize>
		<sec:authorize access="! hasAnyRole('ADMIN','SIGHT_SEEING_EDIT')">
			<a href="view_edit_sight_seeing_form?sightSeeingId=${sightSeeingMasterObj.sightSeeingId}" ><input type="button" style="background-color: #dddddd;"value="Edit" disabled/></a>
		</sec:authorize>
		
		
		<a href="view_search_sight_seeing_form" ><input type="button" value="Search SightSeeing" /></a>
		</p>

</body>


</html>

