<jsp:include page="../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script	src="<c:url value="/resources/core/magicsuggest.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<link href="resources/core/magicsuggest.css" rel="stylesheet" type="text/css">

<style>
table {
  width: 100%;
  height: 20px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 3px auto;
  background: white;
}

th {
  background: #7B68EE;
  height: 30px;
  width: 10%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
}
tr {
  border-bottom: 1px solid #cccccc;
}

td {
  border-right: 1px solid #cccccc;
  padding: 10px;
  transition: all 0.2s;
  text-align: center;
}
input[type=button], input[type=submit], input[type=reset] {
  background-color: green;
  border: none;
  color: white;
  padding: 10px 20px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}

</style>
<br>
<h2 align="center">Edit Lead</h2>
	<body>
	<form:form modelAttribute="LEAD_OBJ" action="edit_edit_lead">
	<form:hidden path = "leadId" />
	<hr>
	<table>
		<caption><font color="red"> <form:errors path="adults" cssClass="error" /></font></caption>
		<tr>
		<th>Lead Id </th><td align="center">Q-${String.format("%04d",LEAD_OBJ.leadId)}-${LEAD_OBJ.leadSourceShortName }</td>
		
		<th>Lead Markers</th>
		<td colspan="2">Is Qualified &nbsp;&nbsp;<label class="container" style="display: inline;margin: 0 auto;margin-bottom: 15px;"><form:checkbox path="qualified" /><span class="checkmark"></span></label>
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Is Flagged &nbsp;&nbsp;<label class="container" style="display: inline;margin: 0 auto;margin-bottom: 25px;"><form:checkbox path="flagged" /><span class="checkmark"></span></label></td>
		
		<th>Contact</th>
		<td colspan="2">
			<form:input path="contactName" name="contactName" style="height:30px;width:200px;margin: auto;"/><br>
			<form:hidden path = "contactId" />
			<font color="red"> <form:errors path="contactName" cssClass="error" /></font>
		</td>
		<th>Lead Owner</th>
		<sec:authorize access="hasAnyRole('ADMIN','LEAD_MANAGER')">
			<td>
			<div class="select">
				<form:select path="leadOwner" style="height:30px;width: 150px;" required="required" >  
					<form:options items = "${ACTIVE_USERS_MAP}" class="service-small"/>
				</form:select>  
			</div>
			</td>
			</sec:authorize>
			
			<sec:authorize access="! hasAnyRole('ADMIN','LEAD_MANAGER')">
			<td style="background-color:#66ff00;">
				${userName }
			</td>
			</sec:authorize>
		</tr>
		<tr>
			<th>Source</th>
			<td>
				<form:input path="sourceName" name="sourceName" style="height:30px;width:250px;margin: auto;"/>
				<form:hidden path = "source" />
				<font color="red"> <form:errors path="sourceName" cssClass="error" /></font>
			</td>
			<th>Destination</th>
			<td>
				<form:input path="destinationName"  style="height:30px;width:250px;margin: auto;"/>
				<form:hidden path = "destination" />
				<font color="red"> <form:errors path="destinationName" cssClass="error" /></font>
			</td>
			<th>Adults </th><td><form:input path="adults" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
			<th>Children</th><td><form:input path="children" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
			<th>Age</th><td><form:input path="childrenAgeInfo" style="height:30px;width:150px;margin: auto;"/></td>
		</tr>
		<tr>
			<th>Lead Source</th>
			<td align="center">
				<div class="select" style="height:30px;">
				<form:select path="leadSource">  
			      <form:options items = "${PARTNERS_MAP}" />
		        </form:select>  
				 </div>
				
			</td>
			<th>Travel Date</th><td><form:input path= "travelStartDate" type="date" required="required" style="height:30px;margin: auto;"/></td>
			<th>Travel End Date</th><td><form:input path= "travelEndDate" type="date" required="required" style="height:30px;margin: auto;"/></td>
			<th>Tentative Amount</th><td><form:input path="tentativeCost" type="number" min="100" style="height:30px;width:80px;margin: auto;"/></td>
			<th>Status</th>
			<td align="center">
				<sec:authorize access="hasAnyRole('ADMIN','LEAD_MANAGER','CAN_CLOSE')">
				<div class="select">
					<form:select path="leadStatus" style="height:30px;width: 150px;" required="required" >  
						<form:options items = "${LEAD_STATUS_MAP}" class="service-small"/>
					</form:select>  
				</div>
				
				</sec:authorize>
				
				<sec:authorize access="! hasAnyRole('ADMIN','LEAD_MANAGER','CAN_CLOSE')">
				
					${LEAD_OBJ.statusName }
				
				</sec:authorize>	
				
			 </td>
		</tr>
	</table>
	<div align="center"><font color="red"> <form:errors path="travelEndDate" cssClass="error" /></font></div>
	<table>
		<caption><font color="red"> <form:errors path="minOneserviceError" cssClass="error" /></font></caption>	
		<tr style="background-color:#FFD633;">
		
			<th>Select Services</th>
			<td style="text-align:left;" colspan="2"><label class="container" style="display:inline;"><form:checkbox path="landPackage" name="landPackage;"  /> <span class="checkmark"></span></label>Package </td>
			
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="flight" name="flight"  /><span class="checkmark"></span></label> Flight</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="hotel" name="hotel"  /><span class="checkmark"></span></label> Hotel</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="transfers" name="transfers"  /><span class="checkmark"></span></label> Transfers</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="sightseeing" name="sightseeing"  /><span class="checkmark"></span></label>SightSeeing</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="visa" name="visa"  /><span class="checkmark"></span></label>Visa</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="insurance" name="insurance"  /><span class="checkmark"></span></label>Insurance</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="cruise" name="cruise"  /><span class="checkmark"></span></label>Cruise</td>
			<td style="text-align:left;"><label class="container" style="display:inline;"><form:checkbox path="others" name="others"  /><span class="checkmark"></span></label>Others</td>
		
		</tr>
		<tr><th>Client Remarks</th><td colspan="9">These remarks will be shared with client.<br><form:textarea path = "clientRemarks" rows="7" cols="150"  maxlength="1450"/> </td></tr>
		<tr><th>Internal Remarks</th><td colspan="9">Below Remarks are internal within company.<br><form:textarea path = "internalRemarks" rows="7" cols="150"  maxlength="1450"/></td></tr>


		<tr>
			<th>Tag Team Mate</th>
			<td colspan="9">
				<div id="sscontainer" class="sscontainer" style="text-align: center;">
					<input type="text" id="leadTeams" name="leadTeams" class="form-control" style="width:1000px;"/>
					<form:hidden path = "teamNames" />
					<form:hidden path = "operatingTeams" />
				</div>
			</td>
		</tr>

	
		<tr><td colspan="10"><label class="container" style="display:inline;"><form:checkbox path="leadCreationClientInformed" disabled="true"/> &nbsp;Client Informed Earlier<span class="checkmark"> </span></label><form:hidden path="leadCreationClientInformed"/></td></tr>
		<tr><td colspan="10"><label class="container" style="display:inline;"><form:checkbox path="notifyAgain" /> &nbsp;Sent Registration Email Again !!<span class="checkmark"></span></label></td></tr>

		
		<tr>
		<td colspan="10">
			<input type="submit" id="submitLead"  name="submitLead" value="Update Lead" />  
			<a href="view_lead_details?leadId=${LEAD_OBJ.leadId}"><input type="button" style="background-color:blue;" value="View Lead" /></a>
			<a href="view_filter_leads"><input type="button" style="background-color:blue;" value="Search Again" /></a>
			
		</td>
		</tr>
	</table>
	



    </form:form>
 
 
 <script type="text/javascript" defer>
 
 $(function() {
     var ms = $('#leadTeams').magicSuggest({
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
    		ms.addToSelection(${LEAD_OBJ.teamNames});
         ms.setDataUrlParams({});
     }
 });
		
		       	
     $(ms).on('selectionchange', function(e,m){
     	 $("#operatingTeams").val(ms.getValue());
     });
});


	
	$(document).ready(function() {
		$('#contactName').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getClientList',
			paramName: "tagName",
			delimiter: ",",
			onSelect: function(suggestion) {
	            cityID = suggestion.data;
	            id=cityID;
	            jQuery("#contactId").val(cityID);
	            $('input[name=contactId]').val(id);
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
		
		
		$('#sourceName').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getCityList',
			paramName: "cityName",
			delimiter: ",",
			onSelect: function(suggestion) {
	            cityID = suggestion.data;
	            id=cityID;
	            jQuery("#destinationId").val(cityID);
	            $('input[name=source]').val(id);
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
		
		$('#destinationName').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getCityList',
			paramName: "cityName",
			delimiter: ",",
			onSelect: function(suggestion) {
	            cityID = suggestion.data;
	            id=cityID;
	            jQuery("#destinationId").val(cityID);
	            $('input[name=destination]').val(id);
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
  </body>
  </html>
  