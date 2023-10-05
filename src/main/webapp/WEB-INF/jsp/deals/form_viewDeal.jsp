<jsp:include page="../menu/MenuBuilder.jsp" />  

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">


    <div class="main-block">
      <h2 align="center">View Deal</h2>
     <div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
      <form:form modelAttribute="dealRecorder" action="edit_workload_MainDealRecord">
	      <input type="hidden" name="dealConfirmationId" value="${DealObject.dealConfirmationId}" />
	     <table cellspacing="10" width="100%">
	        	<tr >
	        		<td style="width:25%;"><b>Deal Confirmation Number:</b> </td><td style="width:25%;">UDN- ${DealObject.dealConfirmationId}</td>
	        		<td style="width:25%;"><b>Deal Status:</b> </td><td style="width:25%;"><mark> ${DealObject.statusName} </mark></td>
	        	</tr>
	      </table>
	      
	        <table cellspacing="10" width="100%">
	        	
	       		 <tr>
	       		 	<td style="width:25%;"><b> QueryId</b></td>
	       		 	<td style="width:25%;">	${DealObject.queryId}</td>
	       		 	<td style="width:25%;"><b>Client Name</b></td>
	       		 	<td style="width:25%;">${DealObject.clientName}</td>

	        	</tr>		
	        
	      
		        <tr>
		        <td style="width:25%;"><b>Traveling From</b></td>
		        <td style="width:25%;">${DealObject.travelingFromCity}</td>
		        <td style="width:25%;"><b>Traveling To</b></td>
		        <td style="width:25%;">${DealObject.travelingToCity}</td>
		        <hr>
		        </tr>
	        </table>
	        <hr>
	        <table cellspacing="10"  width="100%">
	        <tr>
	        <td style="width:25%;">
	        	<b>Adults</b>&nbsp;&nbsp;&nbsp;&nbsp; ${DealObject.adults} 
	        </td>
	        <td style="width:25%;">	
	        <b>Children</b>
	        ${DealObject.children}	
	        </td>
	        <td style="width:25%;">
	        	<b>Booking Date</b>
	       </td>
	       <td style="width:25%;"><fmt:formatDate value="${DealObject.bookingDate}" pattern="dd-MM-yyyy" /></td>
	       </tr>
	       </table>
	       <hr>
	       <table cellspacing="10"  width="100%">
	        <tr>
	        <td style="width:25%;">
	        	<b>Travel Start Date</b>
	        </td>
	        <td style="width:25%;">	
	        	<fmt:formatDate value="${DealObject.travelStartDate}" pattern="dd-MM-yyyy" />
	        	
	       </td>
	       <td style="width:25%;"> 	
	       
	        	<b>Travel End Date</b>
	        	</td>
	       <td style="width:25%;">
	        	<fmt:formatDate value="${DealObject.travelEndDate}" pattern="dd-MM-yyyy" />
	        </td>
	        </tr>
	        </table>
	        <hr>
	  			<table cellspacing="10" >
				<tr><td colspan="5">	<b> Services Confirmed </b>
				
				</td></tr>
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
	      	<table cellspacing="10" width="100%">
	      	<tr><th align="left" colspan="4"><b>Deal Detailed Description</b></th></tr>
	      	<tr style="height: 60px;"><td colspan="4">${DealObject.dealDescription}</td></tr>
	        
	        <tr>
	        	<td style="width:25%;"><b>Deal Source</b></td><td style="width:25%;">${DealObject.dealSourceName }</td>
				<td style="width:25%;"><b>New Client </b></td><td style="width:25%;">${DealObject.isNewClient}</td>
			
			</tr>
	         <tr>
	        	<td style="width:25%;"><b>Projected Cost</b></td><td style="width:25%;">${DealObject.projectedCost }</td>
				<td style="width:25%;"><b>Deal Value</b></td><td style="width:25%;">${DealObject.sellingPrice}</td>
			</tr>
	         <tr>
	        	<td style="width:25%;"><b>Cost Incurred</b></td><td style="width:25%;"><mark style="background-color: pink;">${DealObject.actualCost }</mark></td>
				<td style="width:25%;">&nbsp;</b></td><td style="width:25%;">&nbsp;</td>
			</tr>
	        
	        			<tr><td colspan="4"><hr/></td>
			<tr>
				<td><b>Deal Owner</b></td>			
				<td>${dealRecorder.dealOwnerName}</td>
				<td><b>Tag Mate</b></td>
				<td>
					<c:forEach items="${DealObject.team}" var="dealteam">
							<li>${dealteam.name}</li>
					</c:forEach>
				
				
				</td>
			</tr>
			<tr><td colspan="4"><hr/></td></tr>
	        
	        
	        
	        </table>
	        
      	</form:form>
	        <hr>
	        <table cellspacing="10" width="100%" >
	        <tr>
	        	<td style="width: 50%;">
			      <form:form action="view_edit_deal_form" >
			      	<input type="hidden" name="dealConfirmationId" value="${DealObject.dealConfirmationId}" />
			        <div class="btn-block">
			          <button type="submit" href="/">Edit Deal</button>
			        </div>
				</form:form>		     
	        	</td>
	        	<td style="width: 50%;">
	                <form:form action="view_workload_createNewWorkLoadForm" target="_blank">
	      				<input type="hidden" name="dealConfirmationId" value="${DealObject.dealConfirmationId}" />
		                <div class="btn-block">
				          <button type="submit" href="/">View WorkLoad</button>
				        </div>
				     </form:form>
	        	</td>
	        </tr>
	        
	        
	        </table>
	        
     
     	
 
 </div>
  
  </html>
  