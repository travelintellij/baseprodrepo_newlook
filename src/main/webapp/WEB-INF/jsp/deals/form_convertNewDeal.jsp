<jsp:include page="../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<style>
th {
  background: darkgrey;
  height: 35px;
  width: 15%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
}

</style>

    <div class="main-block">
      <h2 align="center">Confirm: Convert New Win</h2>
     
      <form:form modelAttribute="DEAL_OBJ" action="convert_Quotation_To_DealRecord">
       	<form:hidden path = "travelingFrom" id="travelingFrom"  />
       	<form:hidden path = "travelingTo" id="travelingTo"  />
       	<form:hidden path = "adults" id="adults"  />
       	<form:hidden path = "children" id="children"  />
       	<form:hidden path = "serviceList" id="serviceList"  />
       	<input type="hidden" name="clientId" value="${LEAD_OBJ.contactId }" />
       	<form:hidden path = "queryId" id="queryId"  />
       	<form:hidden path = "travelStartDate" id="travelStartDate"  />
       	<form:hidden path = "travelEndDate" id="travelEndDate"  />
       	<input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId }" />
       	
       	
		<hr>
	  	
	  	<table style="table-layout: fixed; width:100%;font-size:18px;">
	    <tr>
	    	<th style="width:20%;padding: 0 15px;">Query Id: </th><td style="width:30%;padding: 0 15px;">Q-${String.format("%04d",LEAD_OBJ.leadId)}-${LEAD_OBJ.leadSourceShortName }</td>
	        <th style="width:20%;padding: 0 15px;"> Client Name </th><td style="width:30%;padding: 0 15px;">${LEAD_OBJ.contactName }</td>
	    </tr>
	    </table>
        <hr>    
	  	<table style="table-layout: fixed; width:100%;font-size:18px;">
        <tr>
	        <th style="width:20%;padding: 0 15px;">Source:</th><td style="width:30%;padding: 0 15px;">${LEAD_OBJ.sourceName}</td>
    	    <th style="width:20%;padding: 0 15px;">Destination:</th><td style="width:30%;padding: 0 15px;">${LEAD_OBJ.destinationName}</td>
        </tr>
        </table>
        <hr>
	    
	    <table style="table-layout: fixed; width:100%;font-size:18px;">
	    <tr>
	        <td style="width:65%;font-size:18px;">
	        	<table style="table-layout: fixed; width:100%;font-size:18px;">
	        		<tr>
	        			<td style="width:10%;padding: 0 15px;"><label id="icon" for="Adults"><i class="fas fa-envelope"></i></label>Adults </td>
	        			<td style="width:20%;padding: 0 25px;">${LEAD_OBJ.adults}</td>
	        			<td style="width:10%;padding: 0 15px;"><label id="icon" for="Adults"><i class="fas fa-envelope"></i></label>Children </td>
	        			<td style="width:60%;padding: 0 25px;">${LEAD_OBJ.children}(Age ${LEAD_OBJ.childrenAgeInfo} )</td>
	        		</tr>
	        		
	        	</table>
	        	
	        </td>
	        <td align="center">
	        	<font color="green"><b>Booking Date</b></font><br>
	        	<label id="icon" for="travelStartDate"><i class="fas fa-envelope"></i></label>
	        	<input type="date" id="bookingDate" name="bookingDate" style="height:30px;width:200px;" />
	       </td>
	    </tr>
		</table>
		<hr>

		<table style="table-layout: fixed; width:100%;font-size:18px;border-spacing:0 5px; color:black">
	       <tr>
		       <th><b>Travel Start Date</font></th><th><b>Travel End Date</b></th>
	       </tr>
	       <tr>
			   <td align="center"><fmt:formatDate value="${LEAD_OBJ.travelStartDate}" pattern="dd-MMM-yyyy" /></td>
		       <td align="center"><fmt:formatDate value="${LEAD_OBJ.travelEndDate}" pattern="dd-MMM-yyyy" /></td>
	        </tr>
	    </table>
	    <hr>
	  	<table cellspacing="10" >
		<tr><td colspan="5">	<b> Services opted.  </b></td></tr>
	  	<tr>
	  	<c:forEach var="listValue" items="${UdnServicesList}" varStatus="status">
					<jsp:useBean id="status" type="javax.servlet.jsp.jstl.core.LoopTagStatus" />
					<td>
						<label class="container">
						
						<%--
						<form:checkbox path="serviceList" value="${listValue.serviceCode}" />
						 --%>
						
						
						<c:if test = "${fn:containsIgnoreCase(UdnSoldServicesList, listValue.serviceCode)}">
							<form:checkbox path="serviceList" value="${listValue.serviceCode}" checked="checked" disabled="true"/>
							<c:out value="${listValue.serviceName}" />
						</c:if>
						<c:if test = "${not fn:containsIgnoreCase(UdnSoldServicesList, listValue.serviceCode)}">
							<form:checkbox path="serviceList" value="${listValue.serviceCode}"  disabled="true"/>					
							<c:out value="${listValue.serviceName}" />
						</c:if>
						
						<!-- <input type="checkbox" value="${listValue.serviceCode}" id="${listValue.serviceCode}"  />
						 -->
						
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
	    
	    <hr>
	  <table cellspacing="8">
	      	<tr><th align="left" colspan="2"><b>Deal Detailed Description</b></th></tr>
	      	<tr><td colspan="2">
	        <textarea rows="7" cols="100" name="dealDescription">${LEAD_OBJ.clientRemarks.trim()}</textarea></td></tr>
	        <tr><td>
	        Please select Source of Deal 
	       <div class="select">
	       		<form:select path="dealSource" itemValue="${LEAD_OBJ.leadSource}" >  
			      <form:options items = "${PARTNERS_MAP}" />
		        </form:select> 
			</div>
			</td>
			
			<td>
	        Please select Business Type
	        
	       <div class="select">
	        <select id="isNewClient" name="isNewClient" required>
				    <option value="" class="service-small">Choose Business type</option>
				   <c:if test="${DEAL_OBJ.isNewClient eq true }">
				    	<option value="true" class="service-small" selected>New Client</option>
				    	<option value="false" class="service-small">Existing Client</option>
				    </c:if>
				    <c:if test="${DEAL_OBJ.isNewClient ne true }">
				    	<option value="true" class="service-small" >New Client</option>
				    	<option value="false" class="service-small" selected>Existing Client</option>
				    
				    </c:if>
				</select>

			 
			 </div>
			</td>
			</tr>
			</table>
			<table cellspacing="8" style="width:100%;text-align:center;">
	        <tr>
	        	<td style="text-align:center;"><b>Projected Cost</b></td>
        		<td style="text-align:center;"><b>Projected Mark Up</b></td>
        		<td style="text-align:center;"><b>Selling Price</b></td>
	        </tr>
	        <tr>
				<td>
					<label id="icon" for="Query Id"><i class="fas fa-envelope"></i></label>
		        	<form:input path="projectedCost" name="projectedCost" style="width: 150px;" size="15" required="required"/>
	        	</td>
	        	<td>
		        	<label id="icon" for="Query Id"><i class="fas fa-envelope"></i></label>
		        	<form:input path="projectedMarkup" name="projectedMarkup" style="width: 150px;" size="15" required="required"/>
	        	</td>
	        	<td>
	        		<label id="icon" for="sellingPrice"><i class="fas fa-envelope"></i></label>
	        		<form:input path="sellingPrice" name="sellingPrice" style="width: 150px;" size="15" required="required"/>
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
	        <div class="btn-block">
	          <a href="view_lead_quotations_list?leadId=${LEAD_OBJ.leadId}"> <button type="button" style="background-color:blue;color:white;" value="Back List Versions" >Back List Versions</button></a>
	        </div>
	        <div class="btn-block">
	          <a href="form_view_edit_quotation_details?leadId=${LEAD_OBJ.leadId}&quotationId=${QTN_OBJ.quotationId}"> <button type="button" style="background-color:blue;color:white;" value="Back List Versions" >Edit Quotation</button></a>
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
  