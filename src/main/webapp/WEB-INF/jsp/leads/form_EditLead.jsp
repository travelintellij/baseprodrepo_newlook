<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script	src="<c:url value="/resources/core/magicsuggest.js" />"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
<link href="resources/core/magicsuggest.css" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<style>
 .autocomplete-suggestions { border: 1px solid #999; background: red;overflow-y:auto}
		.autocomplete-suggestion {padding: 2px 5px;color:white; background: black;overflow-y: auto;overflow-y:auto}
		.autocomplete-selected { background: #F0F0F0;overflow-y:auto} 
		.autocomplete-suggestions strong { font-weight: normal; color:#FABA08;overflow-y:auto}
		.autocomplete-group { padding: 2px 5px;overflow-y:auto}
		.autocomplete-group strong { display: block; border-bottom: 1px solid #000;  background: black ; color:black overflow-y:auto}
		.autocomplete-selected:hover{
		color:black
		}
</style>

</head>


<body  style="background: url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
   
    <div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
    </div>


    <div class="edit_lead container">
        <div class="edit_lead_wrapper">
            <h1 class="page-heading">Edit Lead</h1>
            <form:form modelAttribute="LEAD_OBJ" action="edit_edit_lead">
                <form:hidden path="leadId" />
                <font color="red">
                    <form:errors path="adults" cssClass="error" />
                </font>
                <div class="edit_lead_wrapper_data">
                    <div class="edit_lead_wrapper_data_line" style="margin-top: 10px;">
                        <div class="edit_lead_wrapper_data_l1">
                            <label for="">Lead Id</label>
                            <p>Q-${String.format("%04d",LEAD_OBJ.leadId)}-${LEAD_OBJ.leadSourceShortName }</p>
                        </div>
                        <div class="edit_lead_wrapper_data_l1">
                            <label for="">Lead Markers</label>
                            <div class="lead_markers_ch">
                                <div class="sun_edit_lead">
                                    <p >Is Qualified</p>
                                    <form:checkbox path="qualified" />
                                </div>
                                <div class="sun_edit_lead">
                                    <p >Is Flagged</p>
                                    <form:checkbox path="flagged" />
                                </div>
                            </div>
                        </div>
                        <div class="edit_lead_wrapper_data_l1">
                            <label for="">Contact</label> <br>
                            <form:input path="contactName" name="contactName" />
                            <form:hidden path="contactId" />
                            <font color="red">
                                <form:errors path="contactName" cssClass="error" />
                            </font>
                        </div>
                        <div class="edit_lead_wrapper_data_l1">
                            <label for="">Lead Owner</label>
                            <sec:authorize access="hasAnyRole('ADMIN','LEAD_MANAGER')">
                                <td>
                                    <div class="select" >
                                        <form:select path="leadOwner" style="width:90%"
                                            required="required">
                                            <form:options items="${ACTIVE_USERS_MAP}" class="service-small" />
                                        </form:select>
                                    </div>
                                </td>
                            </sec:authorize>
                            <sec:authorize access="! hasAnyRole('ADMIN','LEAD_MANAGER')">
                                <td style="background-color:#66ff00;">
                                    ${userName }
                                </td>
                            </sec:authorize>
                        </div>
                    </div>
                    <div class="edit_lead_wrapper_data_line" style="margin-top: 10px;">
                        <div class="edit_lead_wrapper_data_l1">
                            <label for="">Source</label>
                            <form:input path="sourceName" name="sourceName" />
                            <form:hidden path="source" />
                            <div style="margin-left:-10px">
                            <font color="red">
                                <form:errors path="sourceName" cssClass="error" />
                            </font>
                            </div>
                        </div>
                        <div class="edit_lead_wrapper_data_l1">
                            <label for="">Destination</label>
                            <form:input path="destinationName" />
                            <form:hidden path="destination" />
                            <font color="red">
                                <form:errors path="destinationName" cssClass="error" />
                            </font>
                        </div>
                        <div class="edit_lead_wrapper_data_l1 adults_box_edit_box">
                            <div class="adults_box_edit">
                                <label for="">Adults</label> <br>
                                <form:input path="adults" type="number" min="0" />
                            </div>
                            <div class="adults_box_edit">
                                <label for="">Children</label> <br>
                                <form:input path="children" type="number" min="0" />
                            </div>
                            <div class="adults_box_edit">
                                <label for="">Age Info</label> <br>
                                <form:input path="childrenAgeInfo" />
                            </div>
                        </div>
                        <div class="edit_lead_wrapper_data_l1">
                            <label for="">Lead Source</label>
                            <form:select path="leadSource" style="width:90%">
                                <form:options items="${PARTNERS_MAP}" />
                            </form:select>
                        </div>
                    </div>
                    <div class="edit_lead_wrapper_data_line" style="margin-top: 10px;">
                        <div class="edit_lead_wrapper_data_l1">
                            <label for="">Travel Start Date</label>
                            <form:input path="travelStartDate" type="date" required="required" />
                        </div>
                        <div class="edit_lead_wrapper_data_l1">
                            <label for="">Travel End Date</label>
                            <form:input path="travelEndDate" type="date" required="required" />
                             <div align="center">
                            <p style="margin-left:-22px;color:red">
                                <form:errors path="travelEndDate" cssClass="error" />
                            </p>
                        </div>
                        </div>
                        <div class="edit_lead_wrapper_data_l1">
                            <label for="">Tentative Amount</label> <br>
                            <form:input path="tentativeCost" type="number" min="100" />
                        </div>
                        <div class="edit_lead_wrapper_data_l1">
                            <label for="">Status</label>
                            <sec:authorize access="hasAnyRole('ADMIN','LEAD_MANAGER','CAN_CLOSE')">
                                <div class="select">
                                    <form:select path="leadStatus" style="width:90%"
                                        required="required">
                                        <form:options items="${LEAD_STATUS_MAP}" class="service-small" />
                                    </form:select>
                                </div>

                            </sec:authorize>

                            <sec:authorize access="! hasAnyRole('ADMIN','LEAD_MANAGER','CAN_CLOSE')">

                                ${LEAD_OBJ.statusName }

                            </sec:authorize>
                        </div>
            
                    </div>
                    
                        <font color="red">
                            <form:errors path="minOneserviceError" cssClass="error" />
                        </font>
                  
                    <div class="edit_lead_wrapper_data_line_ser" style=" margin-top: 10px;">
                        <label for="" style="margin-right: 20px;   color: #FFBA08; font-weight: bold;">Select Services</label>
                        <div class="edit_ser_box" style=" padding: 0 5px;">
                            <div class="ser_1">
                                <label for="">Flight</label>
                                <form:checkbox path="flight" name="flight" style="width:15px;height:15px;"/>
                            </div>
                            <div class="ser_1">
                                <label for="">Hotal</label>
                                <form:checkbox path="hotel" name="hotel" style="width:15px;height:15px;"/>
                            </div>
                            <div class="ser_1">
                                <label for="">Visa</label>
                                <form:checkbox path="visa" name="visa" style="width:15px;height:15px;"/>
                            </div>
                            <div class="ser_1">
                                <label for="">Insurance</label>
                                <form:checkbox path="insurance" name="insurance" style="width:15px;height:15px;"/>
                            </div>
                            <div class="ser_1">
                                <label for="">Transfers</label>
                                <form:checkbox path="transfers" name="transfers" style="width:15px;height:15px;"/>
                            </div>
                            <div class="ser_1">
                                <label for="">Sightseeing</label>
                                <form:checkbox path="sightseeing" name="sightseeing" style="width:15px;height:15px;"/> </div>
                                    <div class="ser_1">
                                        <label for="">Package</label>
                                        <form:checkbox path="landPackage" name="landPackage;" style="width:15px;height:15px;" />
                                    </div>
                                    <div class="ser_1">
                                        <label for="">Cruise</label>
                                        <form:checkbox path="cruise" name="cruise" style="width:15px;height:15px;"/>
                                    </div>
                                    <div class="ser_1">
                                        <label for="">Others</label>
                                        <form:checkbox path="others" name="others" style="width:15px;height:15px;" />
                                    </div>
                            </div>
                        </div>

                        <div class="edit_lead_wrapper_data_l1_rem" style="margin-top: 10px;">
                            <div class="edit_lead_wrapper_data_l1_rem1">
                                <label for="">Client Remarks</label> <br>
                                <form:textarea path="clientRemarks" name="" id="" cols="68" rows="2" />
                            </div>
                            <div class="edit_lead_wrapper_data_l1_rem2" style="margin-left: 17px;">
                                <label for="">Internal Remarks</label> <br>
                                <form:textarea path="internalRemarks" name="" id="" cols="66" rows="2" />
                            </div>
                        </div>

                        <div class=" info-client" style="margin-top: 10px;">
                            <div class="sub_info-client">
                                <input type="checkbox">
                                <label for="">Inform client about the lead creation (email will be sent)</label>
                            </div>
                        </div>
                       
                       
                       
                       <p style="color: #FFBA08;font-weight: bold;margin-bottom:5px">Tag Team Mate</p>
                       <div style="display:flex;justify-content:center">
                       <div id="sscontainer" class="sscontainer" style="text-align: center;background:white;color:blue;">
					<input type="text" id="leadTeams" name="leadTeams" class="form-control" style="width:498px;"/>
					<form:hidden path = "teamNames"  style="background:red"/>
					<form:hidden path = "operatingTeams"  style="background:red" />
				     </div>
                       </div>
                       
				
			
		
                       
                       
                       
                       
                       
                       
                    <div class="info-client_3" style="margin-top: 10px;">
                    <div class=" sub_info-client" >
                        <form:checkbox path="leadCreationClientInformed" disabled="true" />
                        <label for="">Client Informed Earlier</label>
                        <form:hidden path="leadCreationClientInformed" />
                    </div>
                    <div class="sub_info-client" style="margin-left: 10px;">
                        <form:checkbox path="notifyAgain" />
                        <label for="">Send Registration email again</label>
                    </div>
                </div>
                <div class="due_today_task_data_btns">
                    <input type="submit" id="submitLead"  name="submitLead" value="Update Lead" />  
			<a href="view_lead_details?leadId=${LEAD_OBJ.leadId}">View Lead</a>
			<a href="view_filter_leads">Search Again</a>
                </div>
        </div>
            </form:form>
    </div>
    </div>
    
    
    
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