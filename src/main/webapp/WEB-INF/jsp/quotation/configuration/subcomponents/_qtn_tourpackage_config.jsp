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
	
	<h1 align="center">Tour Package </h1>
	
	<table style="width:100%;margin-left: auto;margin-right: auto; border: 3px solid #000000;   background-color:#FFFACD;" >
	<tr>
	<td>	  
	<font size="4"><b>
	<c:set var="count" value="1" scope="page" />
	<c:forEach items="${QTN_OBJ.tourPackageVoList}" var="packageQtnObj">
	<table style="width:100%;  table-layout:fixed;" >
		<tr><td colspan="5" height="80" style="background-color:#FFA500;"><font size="5">Package <c:out value="${count}" /></font></td></tr>
		<tr>
			<th style="width:20%;"><font size="4"><b>City</b></font></th>
			<th colspan="2" style="width:40%;"><font size="4"><b>Package Name</b></font></th>
			<th><font size="4" style="width:20%;"><b>Start Date</b></font></th>
			<th><font size="4" style="width:20%;"><b>End Date</b></font></th>
		</tr>
		<tr>
			<td height="40">${packageQtnObj.cityName}</td>
			<td colspan="2">${packageQtnObj.packageName}</td>
			<td><fmt:formatDate value="${packageQtnObj.startDate}" pattern="dd-MM-yyyy" /></td>
			<td><fmt:formatDate value="${packageQtnObj.endDate}" pattern="dd-MM-yyyy" /></td>
		</tr>
		<tr>	
			<th colspan="5"><font size="4"><b>Package Description</b></font></th>
		</tr>
		<tr>
			<td colspan="5"><p align="left" style="white-space: pre-line">${packageQtnObj.packageDescription}</p></td>
		</tr>
		<tr>
			<td colspan="5" style="background-color:green;color:white;" height="40">Inclusions </td>
			
		</tr>
		<tr>
			
			<td colspan="5"><p align="left" style="white-space: pre-line">${packageQtnObj.inclusions}</p></td>
			
		</tr>
		<tr>
			<td colspan="5" style="background-color:red;color:white;"  height="40"> Exclusions</td>
		</tr>
		<tr>
			<td colspan="5"><p align="left" style="white-space: pre-line">${packageQtnObj.exclusions}</p></td>
		</tr>
		<tr>

		</tr>

		
		<tr>	
			<th style="width:20%;"><font size="4"><b>Adults</b></font></th>
			<th style="width:20%;"><font size="4"><b >Children</b></font></th>
			<th style="width:20%;"><font size="4"><b>Infant</b></font></th>
			<th colspan="2"><font size="4"><b>Flights Included</b></font></th>
		</tr>
		<tr>
			<td height="40">${packageQtnObj.adults}</td>
			<td>${packageQtnObj.children}</td>
			<td>${packageQtnObj.infant}</td>
			<td colspan="2">${packageQtnObj.flightIncluded}</td>
		</tr>
		<c:if test="${not empty packageQtnObj.remarks}">
		<tr>
			<th colspan="1" style="border: 1px solid black;"><font size="4"><b>Remarks</b></font></th><td colspan="4" style="border: 1px solid black;">${packageQtnObj.remarks}</td>  
		</tr>
		</c:if>

		<tr><td style="background-color:lightblue;" colspan="5" height="50">&nbsp;</td></tr>
		<tr><td style="background-color:white;" colspan="5" height="50">&nbsp;</td></tr>
		<tr><td style="background-color:white;" colspan="5" height="50">&nbsp;</td></tr>
	</table>	
	<c:set var="count" value="${count + 1}" scope="page"/>
	</c:forEach>
	
	
	</b>
	</font>
	</td>
	</tr>
	<c:if test="${MANUAL_CNF.packageCancellationPolicyDisplay eq true}">
	<tr>
		<td style="background-color:red;color:white;" height="30"><b>Tour Package Remarks or Cancellation Details</b></td>
	</tr>
	<tr>
		<td style="background-color:white;text-align:left;">
			<p style="white-space: pre-line"><font size="4"><c:out value="${MANUAL_CNF.packageCancellationPolicy}"/></font></p>
		</td>
	</tr>
	</c:if>
	</table>
	
	