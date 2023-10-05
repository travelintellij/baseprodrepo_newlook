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
	
	<h1 align="center">Transfers</h1>
	
	<table style="width:100%; margin-left: auto;margin-right: auto;  background-color:#000080;" >
	<tr>
	<td>	  
	<font size="4"><b>
	<c:set var="count" value="1" scope="page" />
		<c:forEach items="${QTN_OBJ.transferVoList}" var="transferQtnObj">
			<table style="width:100%;" >
			<tr><td colspan="6" height="50" style="background-color:blue;color:white;"><font size="5">Transfer <c:out value="${count}" /></font></td></tr>
			<tr>
			<td style="width:20%;"><img src="${pageContext.request.contextPath}/resources/images/quotation/transfers-quote.jpg"  height="200" width="350"/></td>
			<td style="width:80%;" colspan="5">
				<table style="width:100%;table-layout:fixed;" >
				<tr>
				<th colspan="1" style="width:16%;border: 1px solid black;"><font size="4"><b>Pickup City</b></font></th><td height="40" style="width:16%;border: 1px solid black;">${transferQtnObj.pickUpCityName }</td>
				<th style="width:16%;border: 1px solid black;"><font size="4"><b>Pickup From</b></font></th><td style="width:16%;border: 1px solid black;">${transferQtnObj.pickUpFromDesc}</td>
				<th style="width:16%;border: 1px solid black;"><font size="4"><b>Pickup From Name</b></font></th><td style="width:16%;border: 1px solid black;">${transferQtnObj.pickUpFromName}</td>
				</tr>
				<tr>
				<th style="width:16%;border: 1px solid black;"><font size="4"><b>Drop City</b></font></th><td height="40" style="width:16%;border: 1px solid black;">${transferQtnObj.dropToCityName}</td>
				<th style="width:16%;border: 1px solid black;"><font size="4"><b>Drop To</b></font></th><td style="width:16%;border: 1px solid black;">${transferQtnObj.dropToDesc}</td>
				<th style="width:16%;border: 1px solid black;"><font size="4"><b>Drop To Name</b></font></th><td style="width:16%;border: 1px solid black;">${transferQtnObj.dropToName}</td>
				</tr>
				<tr>
					<th style="width:16%;border: 1px solid black;"><font size="4"><b>Transfer Date</b></font></th><td style="width:16%;border: 1px solid black;"><fmt:formatDate value="${transferQtnObj.transferDate}" pattern="dd-MM-yyyy" />  </td>
					<th style="width:16%;border: 1px solid black;"><font size="4"><b>Transfer Type</b></font></th><td style="width:16%;border: 1px solid black;">${transferQtnObj.transferTypeName}</td>
					<th style="width:16%;border: 1px solid black;"><font size="4"><b>Adults| Children | Infants</b></font></th><td height="40" style="width:16%;border: 1px solid black;">${transferQtnObj.adults} | ${transferQtnObj.children} | ${transferQtnObj.infant}</td>
				</tr>
				<c:if test="${not empty transferQtnObj.remarks}">
				<tr>
					<th colspan="2" style="border: 1px solid black;"><font size="4"><b>Remarks</b></font></th><td colspan="4" style="border: 1px solid black;">${transferQtnObj.remarks}</td>  
				</tr>
				</c:if>
	
	
				</table>
			</td>
			</tr>
			<tr><td style="background-color:lightblue;" colspan="6" height="50">&nbsp;</td></tr>
			<tr><td style="background-color:white;" colspan="6" height="50">&nbsp;</td></tr>
			
		</table>	
		<c:set var="count" value="${count + 1}" scope="page"/>
		</c:forEach>
		</b>
		</font>
		</td>
		</tr>
		<c:if test="${MANUAL_CNF.transfersCancellationPolicyDisplay eq true}">
		<tr>
			<td style="background-color:red;color:white;" height="30"><b>Transfers Remarks or Cancellation Details</b></td>
		</tr>
		<tr>
			<td style="background-color:white;text-align:left;">
				<p style="white-space: pre-line"><font size="4"><c:out value="${MANUAL_CNF.transfersCancellationPolicy}"/></font></p>
			</td>
		</tr>
		</c:if>
		</table>
		
	