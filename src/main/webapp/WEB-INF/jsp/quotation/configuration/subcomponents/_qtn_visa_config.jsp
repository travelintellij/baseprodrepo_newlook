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
	
	<h1 align="center">Visa </h1>
	
	<table style="width:100%;  background-color:#FFFACD;" >
	<tr>
	<td>	  
	<font size="4"><b>
	<c:set var="count" value="1" scope="page" />
	<c:forEach items="${QTN_OBJ.visaVoList}" var="visaQtnObj">
		<table style="width:100%;  table-layout:fixed;" >
		<tr><td colspan="4" height="50" style="background-color:blue;color:white;"><font size="5">Visa <c:out value="${count}" /></font></td></tr>
		<tr>
			<td style="width:20%;"><img src="${pageContext.request.contextPath}/resources/images/quotation/visa-quote.jpg"  height="200" width="350"/></td>
			<td style="width:80%;" colspan="3">
				<table style="width:100%;table-layout:fixed;" >
		
				<tr>
					<th><font size="4"><b>Visa Country</b></font></th>
					<td height="40">${visaQtnObj.visaCountry}</td>
					<th><font size="4"><b>Visa Consulate</b></font></th>
					<td > ${visaQtnObj.visaConsulate}</td>
				</tr>
				<tr>	
					<th><font size="4"><b>Adults</b></font></th>
					<th><font size="4"><b>Child</b></font></th>
					<th><font size="4"><b>Infants</b></font></th>
					<th><font size="4"><b>&nbsp;</b></font></th>
				</tr>
				<tr>	
					<td height="40">${visaQtnObj.adults}		</td>
					<td>${visaQtnObj.children}		</td>
					<td>${visaQtnObj.infant}		</td>
					<td>&nbsp;</td>
				</tr>
				<c:if test="${not empty visaQtnObj.remarks}">
				<tr>
					<th colspan="1" style="border: 1px solid black;"><font size="4"><b>Remarks</b></font></th><td colspan="3" style="border: 1px solid black;">${visaQtnObj.remarks}</td>  
				</tr>
				</c:if>
			
				</table>
			</td>
		</tr>		
		<tr><td style="background-color:lightblue;" colspan="4" height="50">&nbsp;</td></tr>
		<tr><td style="background-color:white;" colspan="4" height="50">&nbsp;</td></tr>
	</table>	
	<c:set var="count" value="${count + 1}" scope="page"/>
	</c:forEach>
	</b>
	</font>
	</td>
	</tr>
	<c:if test="${MANUAL_CNF.visaCancellationPolicyDisplay eq true}">
	<tr>
		<td style="background-color:red;color:white;" height="30"><b>Visa Remarks or Cancellation Details</b></td>
	</tr>
	<tr>
		<td style="background-color:white;text-align:left;">
			<p style="white-space: pre-line"><font size="4"><c:out value="${MANUAL_CNF.visaCancellationPolicy}"/></font></p>
		</td>
	</tr>
	</c:if>
	</table>
	
	