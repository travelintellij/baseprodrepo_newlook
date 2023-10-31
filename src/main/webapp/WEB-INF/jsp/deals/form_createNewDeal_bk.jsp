<jsp:include page="../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">


    <div class="main-block">
      <h2 align="center">Create New Win</h2>
     
      <form:form modelAttribute="dealRecorder" action="create_workload_MainDealRecord">
	        <hr>
	        <table cellspacing="10">
	        <tr><td align="center">
	        <label id="icon" for="Query Id"><i class="fas fa-envelope"></i></label>
	        <input type="text" name="queryId" id="queryId" placeholder="Query Id" size="35" required/>
	        </td>
	        <td align="center"> <label id="icon" for="Client Name"><i class="fas fa-envelope"></i></label>
	       <input type="text" class="contact" id="clientName" name="clientName" value="" size="35" placeholder="Lead Guest Name" required/>
	        <input type="hidden" name="clientId" value="" />
	        </tr>
	        </table>
	       
	        <table cellspacing="10">
	        <tr><td align="center">
	        	<label id="icon" for="Traveling From"><i class="fas fa-envelope"></i></label>
	        	<input type="text" name="travelingFromCtrl" id="travelingFromCtrl" size="35" placeholder="Traveling From" vale="" required/>
	        	<input type="hidden" name="travelingFrom" value="0" />
	        </td><td align="center">
	        	<label id="icon" for="Traveling To"><i class="fas fa-envelope"></i></label>
	        	<input type="text" name="travelingToCtrl" id="travelingToCtrl" size="35" placeholder="Traveling To" value="" required />
	        	<input type="hidden" name="travelingTo" value="0" />
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
	        			<td><input type="text" id="adults" name="adults" style="height:30px;width:35px;" pattern="[0-9.]+" required /></td>
	        			<td><label id="icon" for="Adults"><i class="fas fa-envelope"></i></label>Children </td>
	        			<td><input type="text" id="children" name="children" style="height:30px;width:35px;" pattern="[0-9.]+"  required/></td>
	        		</tr>
	        		
	        	</table>
	        	
	        </td>
	        <td>
	        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="green"><b>Booking Date</b></font><br>&nbsp;&nbsp;
	        	<label id="icon" for="travelStartDate"><i class="fas fa-envelope"></i></label>
	        	<input type="date" id="bookingDate" name="bookingDate" style="height:30px;width:255px;" />
	       </td>
	       </tr>
	        <tr><td align="center">
	        	Travel Start Date<br>&nbsp;&nbsp;
	        	<label id="icon" for="travelStartDate"><i class="fas fa-envelope"></i></label>
	        	<input type="date" name="travelStartDate" style="height:30px;width:255px;" />
	       </td><td align="center"> 	
	       
	        	Travel End Date<br>&nbsp;&nbsp;&nbsp;
	        	<label id="icon" for="travelEndDate"><i class="fas fa-envelope"></i></label>
	        	<input type="date" name="travelEndDate" style="height:30px;width:255px;" />
	        
	        </td>
	        </tr>
	        </table>
	        <hr>
	  			<table cellspacing="10" >
				<tr><td colspan="5">	<b> Please check the services confirmed </b></td></tr>
	  			<tr>
	  			<c:forEach var="listValue" items="${UdnServicesList}" varStatus="status">
					<jsp:useBean id="status" type="javax.servlet.jsp.jstl.core.LoopTagStatus" />
					<td>
						<label class="container">
						<form:checkbox path="serviceList" value="${listValue.serviceCode}" />
						
						<!-- <input type="checkbox" value="${listValue.serviceCode}" id="${listValue.serviceCode}"  />
						 -->
						<c:out value="${listValue.serviceName}" />
						<span class="checkmark"></span>
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
	  <table cellspacing="8">
	      	<tr><th align="left" colspan="2"><b>Deal Detailed Description</b></th></tr>
	      	<tr><td colspan="2">
	        <textarea rows="7" cols="100" name="dealDescription"></textarea></td></tr>
	        <tr><td>
	        Please select Source of Deal
	       <div class="select">
	       		<select name="dealSource" required>
        			<option value="" class="service-small" selected>Choose Deal Source</option>
        			<c:if test="${not empty DEAL_SOURCE}">
					    <c:forEach items="${DEAL_SOURCE}" var="agentObj">
						    	<option value="${ agentObj.partnerId}" class="service-small">${ agentObj.partnerName}</option>
					    </c:forEach>
					 </c:if>
				</select>
			</div>
			</td>
			
			<td>
	        Please select Business Type
	        
	       <div class="select">
	        <select id="isNewClient" name="isNewClient" required>
				    <option value="" class="service-small">Choose Business type</option>
				    <option value="true" class="service-small">New Client</option>
				    <option value="false" class="service-small">Existing Client</option>
					</select></div>
			</td>
			</tr>
	        <tr>
	        	<td><b>Projected Cost</b></td><td><b>Selling Price</b></td>
	        	<tr>
	        	<td><label id="icon" for="Query Id"><i class="fas fa-envelope"></i></label>
	        		<input type="text" name="projectedCost" id="projectedCost" placeholder="Cost Total" style="width: 150px;" size="15" required/>
	        	</td>
	        	<td><label id="icon" for="sellingPrice"><i class="fas fa-envelope"></i></label>
	        		<input type="text" name="sellingPrice" id="sellingPrice" placeholder="Selling Price" style="width: 150px;" size="15" required/>
	        	</td>
					        		        
	        </tr>
	        
	        
	        </table>
	        <hr>
	        <div class="gender">
	          Inform Client With Confirmation Code (system will send email)
	          <input type="radio" value="yes" id="yes" name="isClientInformed" checked/>
	          <label for="yes" class="radio">Yes</label>
	          <input type="radio" value="no" id="no" name="isClientInformed" />
	          <label for="no" class="radio">No</label>
	        </div>
	        <hr>
	        <div class="btn-block">
	          <button type="submit" href="/">Create Won Deal</button>
	        </div>
     	</form:form>
     <script>
     		document.getElementById('bookingDate').value = new Date().toISOString().substring(0, 10);
     		
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
  