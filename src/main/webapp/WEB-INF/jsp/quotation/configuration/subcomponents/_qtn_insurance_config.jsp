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
	
	<h1 align="center">Insurance </h1>
	
	<table style="width:100%; background-color:#FFFACD;" >
	<tr>
	<td>	  
	<font size="4"><b>
	<c:set var="count" value="1" scope="page" />
		<c:forEach items="${QTN_OBJ.insuranceVoList}" var="insuranceQtnObj">
		<table style="width:100%;  table-layout:fixed;background-color: #BC8F8F; border: 3px solid #000000; border-collapse: collapse" >
			<tr><td colspan="5" height="50" style="background-color:blue;color:white;"><font size="5">Insurance <c:out value="${count}" /></font></td></tr>
			
			<tr>
			<td style="width:20%;"><img src="${pageContext.request.contextPath}/resources/images/quotation/insurance-quote.jpg"  height="200" width="250"/></td>
			<td style="width:80%;" colspan="4">
				<table style="width:100%;table-layout:fixed;" >
					
					<tr>
						<th><font size="4"><b>Country Name</b></font></th>
						<th><font size="4"><b>Insurance Name</b></font></th>
						<th><font size="4"><b>Start Date</b></font></th>
						<th><font size="4"><b>End Date</b></font></th>
						<th><font size="4"><b>Insurance Provider</b></font></th>
					</tr>
					<tr>
						<td height="40">${insuranceQtnObj.countryName }</td>
						<td>${insuranceQtnObj.insuranceName}</td>
						<td><fmt:formatDate value="${insuranceQtnObj.coverageStartDate}" pattern="dd-MM-yyyy" /></td>
						<td><fmt:formatDate value="${insuranceQtnObj.coverageEndDate}" pattern="dd-MM-yyyy" /></td>
						<td>${insuranceQtnObj.insuranceProviderName}</td>
					</tr>
		
					<tr>	
						<th><font size="4"><b>Coverage Amount</b></font></th>
						<th><font size="4"><b>Coverage Currency</b></font></th>
						<th><font size="4"><b>Adults</b></font></th>
						<th><font size="4"><b>Chidren</b></font></th>
						<th><font size="4"><b>Infant</b></font></th>
					</tr>
					<tr>
						<td height="40">${insuranceQtnObj.coverageAmount }</td>
						<td>${insuranceQtnObj.coverageCurrency}</td>
						<td>${insuranceQtnObj.adults}</td>
						<td>${insuranceQtnObj.children}</td>
						<td>${insuranceQtnObj.infant}</td>
					</tr>
					<c:if test="${not empty insuranceQtnObj.remarks}">
					<tr>
						<th colspan="1" style="border: 1px solid black;"><font size="4"><b>Remarks</b></font></th><td colspan="4" style="border: 1px solid black;">${insuranceQtnObj.remarks}</td>  
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
	<c:if test="${MANUAL_CNF.insuranceCancellationPolicyDisplay eq true}">
	<tr>
		<td style="background-color:red;color:white;" height="30"><b>Insurance Remarks or Cancellation Details</b></td>
	</tr>
	<tr>
		<td style="background-color:white;text-align:left;">
			<p style="white-space: pre-line"><font size="4"><c:out value="${MANUAL_CNF.insuranceCancellationPolicy}"/></font></p>
		</td>
	</tr>
	</c:if>
	</table>
	
	