<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<style>
th {
  border: 1px solid #999;
  padding: 1rem;
  
}
th{
background-color:lightgray;
}


</style>
	<table style="width:100%;" border="1">
		<c:if test="${MANUAL_CNF.logoHeader eq true && MANUAL_CNF.completeAddress eq true}">
		<tr>
		<td style="width:30%;text-align:center;">
			<img src="${pageContext.request.contextPath}/resources/images/partner/${MANUAL_CNF.partnerId}.jpg"  height="250" width="250"/>
		</td>
		<td style="width:70%;text-align:center;" >
			<table style="width:100%;border:none; border-collapse: collapse;">
				<tr>
					<td><font size="7" color="blue"><b><c:out value = "${B2B_PARTNER.partnerName}"/></b></font></td>
				</tr>
				<tr>
					<td style="text-align:center;">
						<font size="4" color="blue"><b>Address:</b> </font> <c:out value = "${B2B_PARTNER.address}"/>
					</td>
				<tr>
					<td> 
						<font size="4" color="blue"><b>Mobile:</b> </font> <c:out value = "${B2B_PARTNER.mobile}"/> | 
						<font size="4" color="blue"><b>Email:</b>  </font> <c:out value = "${B2B_PARTNER.email}"/> 
					</td>
				</tr>
			</table>
		</td>
		</tr>
		</c:if>
		<c:if test="${MANUAL_CNF.logoHeader eq true && MANUAL_CNF.completeAddress eq false}">
		<tr>
		<td style="width:30%;" align="center">
			<img src="${pageContext.request.contextPath}/resources/images/partner/${MANUAL_CNF.partnerId}.jpg"  height="250" width="250"/>
		</td>
		<td style="width:70%;text-align:center;" >
			<table style="width:100%;border:none; border-collapse: collapse;">
				<tr>
					<td><font size="7" color="blue"><b><c:out value = "${B2B_PARTNER.partnerName}"/></b></font></td>
				</tr>
			</table>
		</td>
		</tr>
		</c:if>
		<c:if test="${MANUAL_CNF.logoHeader eq false && MANUAL_CNF.completeAddress eq true}">
		<tr>
		<td style="width:70%;text-align:center;" >
			<table style="width:100%;border:none; border-collapse: collapse;">
				<tr>
					<td><font size="7" color="blue"><b><c:out value = "${B2B_PARTNER.partnerName}"/></b></font></td>
				</tr>
				<tr>
					<td style="text-align:center;">
						<font size="4" color="blue"><b>Address:</b> </font> <c:out value = "${B2B_PARTNER.address}"/>
					</td>
				<tr>
					<td> 
						<font size="4" color="blue"><b>Mobile:</b> </font> <c:out value = "${B2B_PARTNER.mobile}"/> | 
						<font size="4" color="blue"><b>Email:</b>  </font> <c:out value = "${B2B_PARTNER.email}"/> 
					</td>
				</tr>
			</table>
		</td>
		</tr>
		</c:if>
		<c:if test="${MANUAL_CNF.logoHeader eq false && MANUAL_CNF.completeAddress eq false}">
		<tr>
		<td style="width:70%;text-align:center;" >
			<table style="width:100%;border:none; border-collapse: collapse;">
				<tr>
					<td><font size="7" color="blue"><b><c:out value = "${B2B_PARTNER.partnerName}"/></b></font></td>
				</tr>
			</table>
		</td>
		</tr>
		</c:if>
	</table>
	<hr>
<i>Please make a note that all details are tentative till the time we voucher and give you the final confirmation. There can be more destinations or alternate destination / date change as mentioned below but please refer complete quotation for your tentative plan. </i>
	<hr>
	<table style="width:100%;">
	<tr>
		<th style="width:12.5%;">Query Id / Version</th><td style="width:12.5%;text-align:center;border: 1px solid #999;padding: 1rem;">Q -${String.format("%04d",LEAD_OBJ.leadId)}-${LEAD_OBJ.leadSourceShortName } / Version: ${QTN_OBJ.version}</td> 
		<th style="width:12.5%;">Client Name</th> <td style="width:12.5%;text-align:center;border: 1px solid #999;padding: 1rem;">${LEAD_OBJ.contactName}</td>
		<th style="width:12.5%;">From</th><td style="width:12.5%;text-align:center;border: 1px solid #999;padding: 1rem;">${LEAD_OBJ.sourceName}</td>
		<th style="width:12.5%;">To</th><td style="width:12.5%;text-align:center;border: 1px solid #999;padding: 1rem;"> ${LEAD_OBJ.destinationName}   <br>(+- more destinations)</td>
	</tr>
	<tr>
		<th style="width:12.5%;">Tentative Start Date</th><td style="width:12.5%;text-align:center;border: 1px solid #999;padding: 1rem;"><fmt:formatDate value="${LEAD_OBJ.travelStartDate}" pattern="dd-MM-yyyy" /></td>
		<th style="width:12.5%;">Tentative End Date</th><td style="width:12.5%;text-align:center;border: 1px solid #999;padding: 1rem;"> <fmt:formatDate value="${LEAD_OBJ.travelEndDate}" pattern="dd-MM-yyyy" /></td>

		<th style="width:12.5%;">Adult</th><td style="width:12.5%;text-align:center;border: 1px solid #999;padding: 1rem;">${LEAD_OBJ.adults}</td> 
		<th style="width:12.5%;">Children</th> <td style="width:12.5%;text-align:center;border: 1px solid #999;padding: 1rem;">${LEAD_OBJ.children} (Age ${LEAD_OBJ.childrenAgeInfo} )</td>
	</tr>
	</table>
	<table style="width:80%;">
		<tr>
			<th style="width:20%;background-color:blue;color:white;">Tentative Services</th>
			<td style="background-color:lightblue;"><font size="4">
			|&nbsp;&nbsp;
			<c:if test="${QTN_OBJ.flight eq true}">
				Flight &nbsp;&nbsp;| 
			</c:if>
			<c:if test="${QTN_OBJ.hotel eq true}">
				Hotel &nbsp;&nbsp;| 
			</c:if>
			<c:if test="${QTN_OBJ.transfers eq true}">
				Transfers &nbsp;&nbsp;| 
			</c:if>
			<c:if test="${QTN_OBJ.sightseeing eq true}">
				SigntSeeing &nbsp;&nbsp;| 
			</c:if>
			<c:if test="${QTN_OBJ.visa eq true}">
				Visa &nbsp;&nbsp;| 
			</c:if>
			<c:if test="${QTN_OBJ.insurance eq true}">
				Insurance &nbsp;&nbsp;| 
			</c:if>
			<c:if test="${QTN_OBJ.cruise eq true}">
				Cruise &nbsp;&nbsp;| 
			</c:if>
			<c:if test="${QTN_OBJ.tourPackage eq true}">
				Tour Package &nbsp;&nbsp;| 
			</c:if>
			<c:if test="${QTN_OBJ.others eq true}">
				Others &nbsp;&nbsp;| 
			</c:if>
			
			</font>
			</td>			
		</tr>
	</table>
