<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<style>
td{
text-align:center;
}
</style>
	
	<h1 align="center">Cruise </h1>
	
	<table style="width:100%;  background-color:#FFFACD;" >
	<tr>
	<td>	  
	<font size="4"><b>
		<c:set var="count" value="1" scope="page" />
		<c:forEach items="${QTN_OBJ.cruiseVoList}" var="cruiseQtnObj">
		<table style="width:100%;" >
			<tr><td colspan="5" height="50" style="background-color:blue;color:white;"><font size="5">Cruise <c:out value="${count}" /></font></td></tr>
			<tr>
			<td style="width:20%;"><img src="${pageContext.request.contextPath}/resources/images/quotation/cruise-quote.jpg"  height="200" width="350"/></td>
			<td style="width:80%;" colspan="4">
				<table style="width:100%;table-layout:fixed;" >
					<tr>
						
						<th colspan="1"><font size="4"><b>City</b></font></th>
						<th colspan="2"><font size="4"><b>Cruise Name</b></font></th>
						<th><font size="4"><b>State Room Type</b></font></th>
						<th><font size="4"><b>Cruise Provider</b></font></th>
					</tr>
					<tr>
						<td height="40">${cruiseQtnObj.cityName }</td>
						<td colspan="2">${cruiseQtnObj.cruiseName}</td>
						<td>${cruiseQtnObj.stateRoomName}</td>
						<td>${cruiseQtnObj.cruiseProviderName}</td>
					</tr>
		
					<tr>	
						<th><font size="4"><b>Sailing Start Date</b></font></th>
						<th><font size="4"><b>Sailing End Date</b></font></th>
						<th><font size="4"><b>Adults | Children</b></font></th>
						<th><font size="4"><b>Children Age Info</b></font></th>
						<th><font size="4"><b>No. of Decks </b></font></th>
					</tr>
					<tr>
						<td  height="40"><fmt:formatDate value="${cruiseQtnObj.sailingStartDate}" pattern="dd-MM-yyyy" /> </td>
						<td><fmt:formatDate value="${cruiseQtnObj.sailingEndDate}" pattern="dd-MM-yyyy" /></td>
						<td>${cruiseQtnObj.adults} | ${cruiseQtnObj.children}</td>
						<td>${cruiseQtnObj.childrenAgeInfo}</td>
						<td>${cruiseQtnObj.noOfDecks}</td>
					</tr>
					<c:if test="${not empty cruiseQtnObj.remarks}">
					<tr>
						<th colspan="2" style="border: 1px solid black;"><font size="4"><b>Remarks</b></font></th><td colspan="3" style="border: 1px solid black;">${cruiseQtnObj.remarks}</td>  
					</tr>
					</c:if>
				</table>
			</td>
			</tr>
			<tr><td style="background-color:lightblue;" colspan="5" height="50">&nbsp;</td></tr>
			<tr><td style="background-color:white;" colspan="5" height="50">&nbsp;</td></tr>
		</table>	
		<c:set var="count" value="${count + 1}" scope="page"/>
	</c:forEach>
	
	
	</b>
	</font>
	</td>
	</tr>
	<c:if test="${MANUAL_CNF.cruiseCancellationPolicyDisplay eq true}">
	<tr>
		<td style="background-color:red;color:white;" height="30"><b>Cruise Remarks or Cancellation Details</b></td>
	</tr>
	<tr>
		<td style="background-color:white;text-align:left;">
			<p style="white-space: pre-line"><font size="4"><c:out value="${MANUAL_CNF.cruiseCancellationPolicy}"/></font></p>
		</td>
	</tr>
	</c:if>
	</table>
	
	