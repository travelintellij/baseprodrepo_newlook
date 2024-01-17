<jsp:include page="../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script	src="<c:url value="/resources/core/magicsuggest.js" />"></script>
<link href="resources/core/magicsuggest.css" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<br>
<br>
<br>
<br>
<br>
<br>
<br>
    <div class="main-block">
      <h2 align="center">Edit Deal</h2>
     
      <form:form modelAttribute="dealRecorder" action="edit_workload_MainDealRecord">
	      <input type="hidden" name="dealConfirmationId" value="${DealObject.dealConfirmationId}" />
	        <hr>
	        <table cellspacing="10">
	        	<tr ><td colspan="2" align="right"><b>Deal Confirmation Number:</b> UDN- ${DealObject.dealConfirmationId}</td></tr>
	       		 <tr>
	       		 	<td align="center">
	        			<label id="icon" for="Query Id"><i class="fas fa-envelope"></i></label>
	        			<input type="text" name="queryId" id="queryId" placeholder="Query Id" size="35" value="${DealObject.queryId}" required/>
	        		</td>
	        		<td align="center"> <label id="icon" for="Client Name"><i class="fas fa-envelope"></i></label>
	      		 		<input type="text" class="contact" id="clientName" name="clientName" size="35" placeholder="Lead Guest Name" value="${DealObject.clientName}" required/>
	        			<input type="hidden" name="clientId" value="${DealObject.clientId}" />
	        	</tr>		
	        
	        </table>
	       
	        <table cellspacing="10">
	        <tr><td align="center">
	        	<label id="icon" for="Traveling From"><i class="fas fa-envelope"></i></label>
	        	<input type="text" name="travelingFromCtrl" id="travelingFromCtrl" size="35" placeholder="Traveling From" value="${DealObject.travelingFromCity}"  required/>
	        	<input type="hidden" name="travelingFrom" value="${DealObject.travelingFrom}" />
	        </td><td align="center">
	        	<label id="icon" for="Traveling To"><i class="fas fa-envelope"></i></label>
	        	<input type="text" name="travelingToCtrl" id="travelingToCtrl" size="35" placeholder="Traveling To" value="${DealObject.travelingToCity}" required />
	        	<input type="hidden" name="travelingTo" value="${DealObject.travelingTo}" />
	        </td>
	        <hr>
	        </tr>
	        </table>
	        <hr>
	        <table cellspacing="10">
	        <tr>
	        <td>
	        	<table cellspacing="10">
	        		<tr>
	        			<td><label id="icon" for="Adults"><i class="fas fa-envelope"></i></label>Adults </td>
	        			<td><input type="text" id="adults" name="adults" style="height:30px;width:35px;" pattern="[0-9.]+" value="${DealObject.adults}" required /></td>
	        			<td><label id="icon" for="Adults"><i class="fas fa-envelope"></i></label>Children </td>
	        			<td><input type="text" id="children" name="children" style="height:30px;width:35px;" pattern="[0-9.]+"  value="${DealObject.children}" required/></td>
	        		</tr>
	        		
	        	</table>
	        	
	        </td>
	        <td>
	        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="green"><b>Booking Date</b></font><br>&nbsp;&nbsp;
	        	<label id="icon" for="travelStartDate"><i class="fas fa-envelope"></i></label>
	        	<input type="date" id="bookingDate" name="bookingDate" style="height:30px;width:255px;" value="${DealObject.bookingDate}" />
	       </td>
	       </tr>
	        <tr><td align="center">
	        	<b>Travel Start Date</b><br>&nbsp;&nbsp;
	        	<label id="icon" for="travelStartDate"><i class="fas fa-envelope"></i></label>
	        	<input type="date" name="travelStartDate" style="height:30px;width:255px;" value="${DealObject.travelStartDate}" />
	       </td>
	       <td align="center"> 	
	       
	        	<b>Travel End Date</b><br>&nbsp;&nbsp;&nbsp;
	        	<label id="icon" for="travelEndDate"><i class="fas fa-envelope"></i></label>
	        	<input type="date" name="travelEndDate" style="height:30px;width:255px;" value="${DealObject.travelEndDate}" />
	        
	        </td>
	        </tr>
	        </table>
	        <hr>
	  			<table cellspacing="10" >
				<tr><td colspan="5">	<b> Please check the services confirmed </b>
				<i>(Any Service / Workload where service line exists , can not be removed.)</i>
				</td></tr>
	  			<tr>
	  			
	  			<c:forEach var="listValue" items="${UdnServicesList}" varStatus="status">
					<jsp:useBean id="status" type="javax.servlet.jsp.jstl.core.LoopTagStatus" />
					<td>
						<label class="container">
							   <c:choose>
							         <c:when test = '${fn:contains(DealObject.serviceWorkLoadList, listValue.serviceCode)}'>
							            <form:checkbox path="serviceList" value="${listValue.serviceCode}" checked="checked" /> <c:out value="${listValue.serviceName}" /><span class="checkmark"></span>
							         </c:when>
							         <c:otherwise>
							            <form:checkbox path="serviceList" value="${listValue.serviceCode}" /> <c:out value="${listValue.serviceName}" /><span class="checkmark"></span>
							         </c:otherwise>
							      </c:choose>
							
							<%--
							<c:forEach var="selectedService" items="${DealObject.serviceWorkLoadList }" varStatus="substatus">
															
									<c:if test="${listValue.serviceCode eq selectedService.dealServiceCode}">
										<form:checkbox path="serviceList" value="${listValue.serviceCode}" checked="checked" /> <c:out value="${listValue.serviceName}" /><span class="checkmark"></span>
									</c:if>
									<c:if test="${listValue.serviceCode ne selectedService.dealServiceCode}">
										<form:checkbox path="serviceList" value="${listValue.serviceCode}" /> <c:out value="${listValue.serviceName}" /><span class="checkmark"></span>
									</c:if>
								
								
							</c:forEach>
							--%>
								
							 
								
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
	      	<table cellspacing="8" style="width:100%;">
	      	<tr><th align="left" colspan="2"><b>Deal Detailed Description</b></th></tr>
	      	<tr><td colspan="2">
	        <textarea rows="7" cols="100" name="dealDescription">${DealObject.dealDescription}</textarea></td></tr>
	        <tr><td>
	       	 Please select Source of Deal
	        
	       		<div class="select">
	        		<select name="dealSource" required>
	        			<option value="" class="service-small">Choose Deal Source</option>
	        			<c:if test="${not empty DEAL_SOURCE}">
						    <c:forEach items="${DEAL_SOURCE}" var="agentObj">
						    	<c:if test="${agentObj.partnerId eq DealObject.dealSource }">
							    	<option value="${ agentObj.partnerId}" class="service-small" selected>${ agentObj.partnerName}</option>
							    </c:if>
							    <c:if test="${agentObj.partnerId ne DealObject.dealSource }">
							    	<option value="${ agentObj.partnerId}" class="service-small">${ agentObj.partnerName}</option>
							    </c:if>
							    
						    </c:forEach>
						 </c:if>
					</select>
				</div>
			</td>
			
			<td>
	        Please select Business Type ${DealObject.isNewClient }
	        
	       <div class="select">
	        	<select id="isNewClient" name="isNewClient" required>
				    <option value="" class="service-small">Choose Business type</option>
				   <c:if test="${DealObject.isNewClient eq true }">
				    	<option value="true" class="service-small" selected>New Client</option>
				    	<option value="false" class="service-small">Existing Client</option>
				    </c:if>
				    <c:if test="${DealObject.isNewClient ne true }">
				    	<option value="true" class="service-small" >New Client</option>
				    	<option value="false" class="service-small" selected>Existing Client</option>
				    
				    </c:if>
				</select>
			</div>
			</td>
			
			</tr>
			 <tr>
	        	<td><b>Projected Cost</b></td><td><b>Selling Price</b></td>
	        </tr>
	        <tr>
	        	<td><label id="icon" for="Query Id"><i class="fas fa-envelope"></i></label>
	        		<input type="text" name="projectedCost" id="projectedCost" placeholder="Cost Total" value="${DealObject.projectedCost}" style="width: 150px;" size="15" required/>
	        	</td>
	        	<td><label id="icon" for="sellingPrice"><i class="fas fa-envelope"></i></label>
	        		<input type="text" name="sellingPrice" id="sellingPrice" placeholder="Selling Price" value="${DealObject.sellingPrice}" style="width: 150px;" size="15" required/>
	        	</td>
	        </tr>
			<tr><td colspan="2">&nbsp;</td></tr>
			
			<tr>
	        	<td><b>Cost Incurred</b></td><td> <b>Deal Status</b></td>
			</tr>
			<tr>
				<td ><mark style="background-color: pink;">${DealObject.actualCost }</mark></td>
					<td  style="text-align: center">
				<div class="select" align="center">
					<select name="dealStatus">
						 <c:if test="${not empty DEAL_STATUS_LIST}">
					      <option value="" class="service-small">Select</option>
					       <c:forEach items="${DEAL_STATUS_LIST}" var="statusObj">
					      		<c:if test="${statusObj.workloadStatusId eq DealObject.dealStatus}">
					      			<option class="service-small" value="${statusObj.workloadStatusId}" selected>${statusObj.workloadStatusName}</option>
					      		</c:if>
					      		<c:if test="${statusObj.workloadStatusId ne DealObject.dealStatus}">
					      			<option class="service-small" value="${statusObj.workloadStatusId}">${statusObj.workloadStatusName}</option>
					      		</c:if>
					      	</c:forEach>
					 	</c:if>
					</select>
				</div>
			</td>
			</tr>        		        
			<tr><td colspan="2"><hr/></td>
			</tr>
			</table>
			<table style="width:100%;">
			<tr>
				<td><b>Deal Owner</b></td>
				<td><b>Tag Mate</b></td>
			</tr>
			
			<tr>
				<sec:authorize access="hasAnyRole('ADMIN','DEAL_MANAGER')">
				<td>
					<div class="select">
						<form:select path="dealOwner" style="height:30px;width: 150px;" required="required" >  
							<form:options items = "${ACTIVE_USERS_MAP}" class="service-small"/>
						</form:select>  
					</div>
				</td>
				</sec:authorize>

				<sec:authorize access="! hasAnyRole('ADMIN','DEAL_MANAGER')">
					<td>
						${dealRecorder.dealOwnerName}
					</td>
					
				</sec:authorize>
				<td style="align:right;">
					<div id="sscontainer" class="sscontainer" style="text-align: center;">
						<input type="text" id="dealTeams" name="dealTeams" class="form-control" style="width:350px;"/>
						<form:hidden path = "teamNames" />
						<form:hidden path = "operatingTeams" />
					</div>
				</td>
			</tr>
			<tr><td colspan="2"><hr/></td></tr>
		
			<tr>
		
			<td colspan="3">
	          	<div class="btn-block">
	          		<button type="submit" href="/">Update Deal</button>
	        	</div>
	        </td>
			</tr>
	         
	        </table>
	        <hr>
     	</form:form>
     	
     	<table width="100%">
     	<tr>
     	<td>
     	 	<form:form action="view_view_deal_form" >
		      	<input type="hidden" name="dealConfirmationId" value="${DealObject.dealConfirmationId}" />
		        <div class="btn-block">
		          <button type="submit" href="/" color="green">Cancel</button>
		        </div>
			</form:form>	
     	</td>
     	<td>
     	 	<form:form action="view_workload_createNewWorkLoadForm" target="_blank">
    			<input type="hidden" name="dealConfirmationId" value="${DealObject.dealConfirmationId}" />
               	<div class="btn-block">
	          		<button type="submit" href="/">View WorkLoad</button>
	        	</div>
	     	</form:form>
     	</td>
     	</tr>
     	</table>
     	
     	
<script>
$(function() {
    var ms = $('#dealTeams').magicSuggest({
    	data: '${pageContext.request.contextPath}/getTeamList',
    	valueField: 'id',
    	displayField: 'tagName',
    	//name: 'operatingDestinations',
    	maxDropHeight: 145,
    	maxSuggestions:10,
    	resultAsString: true
    });
    //ms.addToSelection([{"id":4,"tagName":"Mumbai"},{"id":542,"tagName":"New Delhi"}]);
		
	$(ms).on('load', function(){
    if(this._dataSet === undefined){
   		this._dataSet = true;
   		ms.addToSelection(${DealObject.teamNames});
        ms.setDataUrlParams({});
    }
});
		
		       	
    $(ms).on('selectionchange', function(e,m){
    	 $("#operatingTeams").val(ms.getValue());
    });
});


	
	
	
	$(document).ready(function() {
		$('#clientName').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getClientList',
			paramName: "tagName",
			delimiter: ",",
			onSelect: function(suggestion) {
	            cityID = suggestion.data;
	            id=cityID;
	            jQuery("#clientId").val(cityID);
	            $('input[name=clientId]').val(id);
	            return false;
	        },
			transformResult: function(response) {
		        return {
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	return { value: item.tagName, data: item.id };
		            })
		            
		        };
		    }
		});
		
		
		$('#travelingFromCtrl').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getCityList',
			paramName: "cityName",
			delimiter: ",",
			onSelect: function(suggestion) {
	            cityID = suggestion.data;
	            id=cityID;
	            jQuery("#destinationId").val(cityID);
	            $('input[name=travelingFrom]').val(id);
	            return false;
	        },
			transformResult: function(response) {
		        return {
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	return { value: item.cityName, data: item.destinationId };
		            })
		            
		        };
		    }
		});
		
		$('#travelingToCtrl').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getCityList',
			paramName: "cityName",
			delimiter: ",",
			onSelect: function(suggestion) {
	            cityID = suggestion.data;
	            id=cityID;
	            jQuery("#destinationId").val(cityID);
	            $('input[name=travelingTo]').val(id);
	            return false;
	        },
			transformResult: function(response) {
		        return {
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	return { value: item.cityName, data: item.destinationId };
		            })
		            
		        };
		    }
		});
	});
	
	
	
	</script>
 
 </div> <!-- End of Main Block -->
  <%--  <jsp:include page="_Workloadfooter.jsp" /> --%>
  
  </html>
  