<!DOCTYPE html>
<html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">


    
      
     <div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
      <form:form modelAttribute="dealRecorder" action="edit_workload_MainDealRecord">
	      <input type="hidden" name="dealConfirmationId" value="${DealObject.dealConfirmationId}" />
	     <table style="width:100%;">
	        	<tr >
	        		<th style="width:25%;"><b>Deal Confirmation Number:</b> </th><td style="width:25%;">UDN- ${DealObject.dealConfirmationId}</td>
	        		<th style="width:25%;"><b>Deal Status:</b> </th><td style="width:25%;"><mark> ${DealObject.statusName} </mark></td>
	        	</tr>
	      
	        	
	       		 <tr>
	       		 	<th style="width:25%;"><b> QueryId</b></th><td style="width:25%;">${DealObject.queryId}</td>
	       		 	<th style="width:25%;"><b>Client Name</b></th><td style="width:25%;">${DealObject.clientName}</td>
	        	</tr>		
	        
	      
		        <tr>
		        	<th style="width:25%;"><b>Traveling From</b></th><td style="width:25%;">${DealObject.travelingFromCity}</td>
		       		 <th style="width:25%;"><b>Traveling To</b></th><td style="width:25%;">${DealObject.travelingToCity}</td>
		        
		        </tr>
	        </table>
	        <hr>
	        <table style="width:100%;">
	        	<tr>
	         		<th style="width:25%;"><b>Guest Details</b></th><td style="width:25%;"> <b>Adults</b> ${DealObject.adults} &nbsp;&nbsp;<b>Children</b> ${DealObject.children}</td>
	       			<th style="width:25%;"><b>Booking Date</b></th><td  style="width:25%;"><fmt:formatDate value="${DealObject.bookingDate}" pattern="dd-MM-yyyy" /></td>
	       		</tr>
	       </table>
	       <hr>
	       <table style="width:100%;">
	        <tr>
	       		<th style="width:25%;"><b>Travel Start Date</b></th><td style="width:25%;"><fmt:formatDate value="${DealObject.travelStartDate}" pattern="dd-MM-yyyy" /></td>
	       		<th style="width:25%;"><b>Travel End Date</b></th><td style="width:25%;"><fmt:formatDate value="${DealObject.travelEndDate}" pattern="dd-MM-yyyy" /></td>
	        </tr>
	        </table>
	        <hr>
	  		<table style="width:80%;">
				<tr><th colspan="5"><b> Services Confirmed </b></th></tr>
	  			<tr>
	  			
	  			<c:forEach var="listValue" items="${UdnServicesList}" varStatus="status">
					<jsp:useBean id="status" type="javax.servlet.jsp.jstl.core.LoopTagStatus" />
					<td>
						<label class="container">
							   <c:choose>
							         <c:when test = '${fn:contains(DealObject.serviceWorkLoadList, listValue.serviceCode)}'>
							            <form:checkbox path="serviceList" value="${listValue.serviceCode}" checked="checked" disabled = "true"/> <c:out value="${listValue.serviceName}" /><span class="checkmark"></span>
							         </c:when>
							         <c:otherwise>
							            <form:checkbox path="serviceList" value="${listValue.serviceCode}" disabled = "true" /> <c:out value="${listValue.serviceName}" /><span class="checkmark"></span>
							         </c:otherwise>
							      </c:choose>
							
						</label>
					</td>
					<c:choose>
						<c:when test="<%=status.getCount()%5==0 && (!status.isLast())%>">
							</tr>
	            			<tr>
	          			</c:when>
          			</c:choose>
				</c:forEach>
	  			</tr>
	  			</table>
	  		  
	        <hr>
	      	<table style="width:80%;">
	      	<tr><th align="left" colspan="4"><b>Deal Detailed Description</b></th></tr>
	      	<tr style="height: 60px;"><td colspan="4">${DealObject.dealDescription}</td></tr>
	        
	        <tr>
	        	<th><b>Deal Source</b></th><td>${DealObject.dealSourceName }</td>
				<th><b>New Client </b></th><td>${DealObject.isNewClient}</td>
			
			</tr>
	         <tr>
	        	<th><b>Projected Cost</b></th><td>${DealObject.projectedCost }</td>
				<th><b>Deal Value</b></th><td>${DealObject.sellingPrice}</td>
			</tr>
	         <tr>
	        	<th><b>Cost Incurred</b></th><td><mark style="background-color: pink;">${DealObject.actualCost }</mark></td>
				<th>&nbsp;</th><td>&nbsp;</td>
			</tr>
	        
	        </table>
      	</form:form>
	       
	       <%-- this is not needed for modal. need to be uncommented once needed. 
	        <hr>
	        <table>
	        <tr>
	        	
	        	<td style="width: 30%;">
	                <form:form action="view_workload_createNewWorkLoadForm" target="_blank">
	      				<input type="hidden" name="dealConfirmationId" value="${DealObject.dealConfirmationId}" />
		                <div class="btn-block">
				          <button type="submit" href="/">View WorkLoad</button>
				        </div>
				     </form:form>
	        	</td>
	        </tr>
	        
	        
	        </table>
	         --%>
     
     	
 

  
  </html>
  