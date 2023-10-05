<jsp:include page="../menu/MenuBuilder.jsp" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<style>
input[type=button], input[type=submit], input[type=reset] {
		  background-color: #4CAF50;
		  border: none;
		  color: white;
		  padding: 10px 20px;
		  text-decoration: none;
		  margin: 4px 2px;
		  cursor: pointer;
		}
</style>
<div class="submenu-block">
	
		<h2 align="center">Search Deals</h2>
	

	<form:form modelAttribute="FILTER_DEAL_OBJ" action="view_filter_deals">
		<table style="width:80%;" cellpadding="10px" border="1px" rules="none" frame="border" align="center">
			<tr>
				<td>
					<table border="1px;"><caption>Search Criteria</caption>
						<tr>
							<th><b>Deal Confirmation No.</b></th>
							<td style="vertical-align: top; margin: 0;line-height: 4em; ">
							<form:input path="dealConfirmationId" type="number" min="0" style="height:30px;width:180px;" size="35" value="" placeholder="Deal Number"/>
							
						</tr> 
						<tr>
							<th>Client Name</th>
							<td style="vertical-align: top; margin: 0;line-height: 4em; ">
								<form:input path="clientName"  id="clientName" name="clientName" size="35" style="height:30px;width:165px;" placeholder="Client Name" />
								<form:hidden path = "clientId" />
							</td>	
						</tr>
						<tr>
							<th>Query Id</th>
							<td style="vertical-align: top; margin: 0;line-height: 4em; ">
								<form:input path="queryId" type="number" min="0" style="height:30px;width:180px;" size="35" value="" placeholder="Query Id"/>
							</td>
							 
						</tr>
						</table>
				</td>
				<td>
					<table style="width:100%;" cellpadding="0px" border="1px" rules="none" frame="border">
						<tr>
							<td><b>Status</b></td>
							<td>
								<div class="select">
									<form:select path="dealStatus" style="height:30px;width: 150px;" required="required" >  
										<option class="service-small" value="0" >Please Select</option>
										<form:options items = "${DEAL_STATUS_MAP}" class="service-small"/>
									</form:select>  
								</div>
							</td>
						</tr>
						<tr><td colspan="2" style="text-align:center;">
							<table style="width:100%;" border="1" cellpadding="5px" border="1px" rules="none" frame="border" >
								<tr><td>  <input type="radio" value="true" id="true" name="searchOnBookingDate" checked/> <label for="true" class="radio">Booking Date</label> <input type="radio" value="false" id="false" name="searchOnBookingDate" /> <label for="false" class="radio">Travel Date</label> </td></tr>
								<tr><td></td></tr>
								<tr>
									<td>Start Date<form:input path= "startDate" type="date" required="required" style="height:30px;margin: auto;"/>
									To:<form:input path= "endDate" type="date" required="required" style="height:30px;margin: auto;"/>
								</td></tr>
								
							</table>
							
						</td>
						</tr>
						<tr style="border:1px;">
							<td style="width:50%;border: 1px solid black;"><button type="submit" style="width:100px;">Search</button></td>
							<td style="width:50%;border: 1px solid black;"><a href="view_deal_searchDealForm"><input type="button" value="Clear Filter" /></a></td>
						</tr>
						
					</table>
					
				</td>
			</tr>
		</table>
		<div align="center"><font color="red"> <form:errors path="endDate" cssClass="error" /></font></div>
	</form:form>
	<script>
	
	//document.getElementById('startDate').value = new Date().toISOString().substring(0, 10);
	//document.getElementById('endDate').value = new Date().toISOString().substring(0, 10);
	
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
	});
	</script>
 
 </div> <!-- End of Main Block -->
  <%--  <jsp:include page="_Workloadfooter.jsp" /> --%>
  
  </html>
  