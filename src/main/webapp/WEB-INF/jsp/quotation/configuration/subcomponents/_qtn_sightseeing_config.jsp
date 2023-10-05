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
	
	<h1 align="center">Sight Seeing</h1>
	
	<table style="width:100%;  background-color:#000080;" >
	<tr>
	<td>	  
	<font size="4"><b>
	<c:set var="count" value="1" scope="page" />
		<c:forEach items="${QTN_OBJ.sightSeeingVoList}" var="sightSeeingQtnObj">
			<table style="width:100%;  table-layout:fixed;background-color: #98FB98; border: 3px solid #000000; border-collapse: collapse" >
			<tr><td colspan="5" height="50" style="background-color:blue;color:white;"><font size="5">Sight Seeing <c:out value="${count}" /></font></td></tr>
			<tr>
			<td style="width:20%;"><img src="${pageContext.request.contextPath}/resources/images/quotation/sightseeing-quote.jpg"  height="200" width="250"/></td>
			<td style="width:80%;" colspan="4">
				<table style="width:100%;table-layout:fixed;" >
				<tr>
						
						<th colspan="1"><font size="4"><b>Sight Seeing City</b></font></th>
						<th><font size="4"><b>Adults</b></font></th>
						<th><font size="4"><b>Children | Infant</b></font></th>
						<th><font size="4"><b>Transfer Type</b></font></th>
						<th><font size="4"><b>Sight Seeing Date</b></font></th>
					</tr>
					<tr>
						<td height="40">${sightSeeingQtnObj.cityName} </td>
						<td height="40">${sightSeeingQtnObj.adults}</td>
						<td>${sightSeeingQtnObj.children} | ${sightSeeingQtnObj.infant}	</td>
						<td>${sightSeeingQtnObj.transferTypeName} </td>
						<td><fmt:formatDate value="${sightSeeingQtnObj.sightSeeingDate}" pattern="dd-MMM-yyyy" /> </td>
					</tr>
		
					<tr>	
						<th colspan="5"><font size="4"><b>Sight Seeing Name</b></font></th>
						
					</tr>
					<tr>
						<td colspan="5" height="40">${sightSeeingQtnObj.sightSeeingName} </td>
					</tr>
					<c:if test="${not empty sightSeeingQtnObj.remarks}">
					<tr>
						<th colspan="1" style="border: 1px solid black;"><font size="4"><b>Remarks</b></font></th><td colspan="4" style="border: 1px solid black;">${sightSeeingQtnObj.remarks}</td>  
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
		<c:if test="${MANUAL_CNF.sightSeeingCancellationPolicyDisplay eq true}">
		<tr>
			<td style="background-color:red;color:white;" height="30"><b>Sight Seeing Remarks or Cancellation Details</b></td>
		</tr>
		<tr>
			<td style="background-color:white;text-align:left;">
				<p style="white-space: pre-line"><font size="4"><c:out value="${MANUAL_CNF.sightSeeingCancellationPolicy}"/></font></p>
			</td>
		</tr>
		</c:if>
		</table>
		
	