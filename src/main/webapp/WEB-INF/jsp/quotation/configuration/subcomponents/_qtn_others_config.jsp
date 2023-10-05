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
	
	<h1 align="center">Other Services </h1>
	
	<table style="width:100%;  background-color:#FFFACD;" >
	<tr>
	<td>	  
	<font size="4"><b>
	<c:set var="count" value="1" scope="page" />
		<c:forEach items="${QTN_OBJ.otherVoList}" var="otherQtnObj">
			<table style="width:100%;  table-layout:fixed;background-color: #DFE0DC; border: 3px solid #000000; border-collapse: collapse" >
				<tr><td colspan="6" height="50" style="background-color:blue;color:white;"><font size="5">Other Services <c:out value="${count}" /></font></td></tr>
				<tr>
					<th><font size="4"><b>Service Name</b></font></th>
					<th colspan="4"><font size="4"><b>Service Details</b></font></th>
					<th><font size="4"><b>Service Date</b></font></th>
				</tr>
				<tr>
					<td height="40">${otherQtnObj.serviceName }</td>
					<td colspan="4">${otherQtnObj.serviceDetails}</td>
					<td><fmt:formatDate value="${otherQtnObj.serviceDate}" pattern="dd-MM-yyyy" /></td>
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
	
	