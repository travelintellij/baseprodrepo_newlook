<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register New Lead</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/captureLead.css">
</head>
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
<body  style="background: url(${pageContext.request.contextPath}/resources/images/revamped/capture_lead_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">


    <!-- ################## lead managment page #################### -->
    
    
<div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>

    <main class="leadManagmentSection " style="margin-top:85px">
        <div class="leadMangementForm  container1">
            <div class="overlay">
                <div class="heading">
                    <h1 class="mainHeadingLeadManagment">Capture New Lead</h1>
                </div>
                <form:form modelAttribute="LEAD_OBJ" action="create_create_lead">
                    <div class="firstLine firLi">
                        <div class="div1 commonDiv1s firstLineDiv" />
                            <p class="firstLineHeadings">Lead Id</p>
                            <p class="leadId">Auto Generated</p>
                        </div>
                        <div class="div1 commonDiv1 firstLineDiv2">
                            <p class="firstLineHeadings">Lead Markers</p>
                            <label for="quali" class="leadMarks">Is Qualified</label>
                            <form:checkbox path="qualified" class="sCheckBox qualified" id="quali"/>
                            <label for="flag" id="flag" class="leadMarks">Is Flagged</label>
                            <form:checkbox path="flagged" class="sCheckBox flagged" id="flag" />
                        </div>
                        <div class="div1 commonDiv1 contact firstLineDiv">
                            <label for="contact" class="firstLineHeadings">Contact</label> <br>
                            <form:input path="contactName" name="contactName" id="contactName" class="inputSmall " />
                            <form:hidden path = "contactId" />
                            <font color="red">
                                <form:errors path="contactName" cssClass="error" />
                            </font>
                        </div>
                        <div class="div1 commonDiv1 ldown firstLineDivLeadOwner">
                            <label for="leadOwner" class="firstLineHeadings">Lead Owner</label> <br>
                            <sec:authorize access="hasAnyRole('ADMIN','LEAD_MANAGER')">
                                <!-- <input type="text" name="" id="leadOwner"> -->
                                <form:select path="leadOwner" required="required">
                                    <!-- <form:option value="0" label=" Select Lead Owner "/>
                                    <form:options items="${ACTIVE_USERS_MAP}"/>  -->
                                    <c:forEach items="${ACTIVE_USERS_MAP}" var="userMap">
                                        <c:if test="${userMap.key eq userId }">
                                            <option class="service-small" value="${userMap.key}" selected>
                                                ${userMap.value}</option>
                                        </c:if>
                                        <c:if test="${userMap.key ne userId }">
                                            <option class="service-small" value="${userMap.key}">${userMap.value}
                                            </option>
                                        </c:if>
                                    </c:forEach>
                                </form:select>
                            </sec:authorize>
                            <sec:authorize access="! hasAnyRole('ADMIN','LEAD_MANAGER')">
                                ${userName }
                            </sec:authorize>
                        </div>


                    </div>
                    <div class="secondLine">
                        <div class="div1 commonDiv1">
                            <label for="Source" class="firstLineHeadings">Source</label> <br>
                            <form:input path="sourceName" name="sourceName" class="inputSmall" id="sourceName" />
							<form:hidden path = "source" />
                            <font color="red">
                                <form:errors path="sourceName" cssClass="error" />
                            </font>
                        </div>
                        <div class="div1 commonDiv1">
                            <label for="Destination" class="firstLineHeadings">Destination</label> <br>
                            <form:input path="destinationName"  class="inputSmall" id="destinationName" />
                            <form:hidden path="destination" />
                            <font color="red">
                                <form:errors path="destinationName" cssClass="error" />
                            </font>
                        </div>
                        <div class="div1 commonDiv1">
                            <label for="Adults" class="firstLineHeadings">Adults</label> <br>
                            <form:input path="adults" type="number" min="0" id="Adults" />
                        </div>
                        <div class="div1 commonDiv1">
                            <label for="Children" class="firstLineHeadings">Children</label> <br>
                           <form:input path="children" type="number" min="0" id="Children"/>
                        </div>
                        <div class="div1 commonDiv1">
                            <label for="Age" class="firstLineHeadings">Age Info</label> <br>
                            <form:input path="childrenAgeInfo" id="Age" />
                        </div>
                        <div class="div1 commonDiv1">
                            <label for="LeadSource" class="firstLineHeadings">Lead Source</label> <br>
                            <!-- <input type="text" name="" id="LeadSource"> -->
                            <form:select path="leadSource" class="selectLeadSource">  
			      				<form:options items = "${PARTNERS_MAP}" />
		        			</form:select>  
                        </div>
                    </div>
                    <div class="thirdLine">
                        <div class="div1 commonDiv1">
                            <label for="TravelDate" class="firstLineHeadings">Travel Start Date</label> <br>
                            <form:input path= "travelStartDate" type="date" required="required" />
                        </div>
                        <div class="div1 commonDiv1 Ted">
                            <label for="TravelEndDate" class="firstLineHeadings">Travel End Date</label> <br>
                            <form:input path= "travelEndDate" type="date" required="required" />
                        </div>
                        <div class="div1 commonDiv1 tent">
                            <label for="TentativeAmount" class="firstLineHeadings">Tentative Amount</label> <br>
                            <form:input path="tentativeCost" type="number" min="100" class="inputSmall" />
                        </div>
                        <div class="div1 commonDiv1">
                            <p class="firstLineHeadings sts">Status</p class="firstLineHeadings">
                            <!-- <p>open</p> -->
                            ${LEAD_OBJ.statusName}
                            <form:hidden path="leadStatus" />
                            <form:errors path="travelEndDate" />
                            <form:errors path="minOneserviceError" />
                        </div>
                    </div>
                    <div class="ForthLine ser">
                        <div class="div1 commonDiv1 services">
                            <label for="services" class="firstLineHeadings slectser">Select Services</label> <br>
                            <div class="checkboxes">
                                <div class="checkbox">
                                    <label for="flight">Flight</label>
                                        <form:checkbox path="flight" name="flight" class="sCheckBox" id="flight"/>
                                </div>
                                <div class="checkbox">
                                    <label for="hotal">Hotal</label>
                                    <form:checkbox path="hotel" name="hotel"  class="sCheckBox" id="hotal" />
                                </div>
                                <div class="checkbox">
                                    <label for="visa">Visa</label>
                                    <form:checkbox path="visa" name="visa" class="sCheckBox" id="visa" />
                                </div>
                                <div class="checkbox">
                                    <label for="insu">Insurance</label>
                                        <form:checkbox path="insurance" name="insurance"  class="sCheckBox" id="insu"/>
                                </div>
                                <div class="checkbox">
                                    <label for="Transfers">Transfers</label>
                                        <form:checkbox path="transfers" name="transfers" class="sCheckBox" id="Transfers" />
                                </div>
                                <div class="checkbox">
                                    <label for="Sightseeing">Sightseeing</label>
                                        <form:checkbox path="sightseeing" name="sightseeing"  class="sCheckBox" id="Sightseeing"/>
                                </div>
                                <div class="checkbox">
                                    <label for="Package">Package</label>
                                        <form:checkbox path="landPackage" name="landPackage;" class="sCheckBox" id="Package" />
                                </div>
                                <div class="checkbox">
                                    <label for="Cruise">Cruise</label>
                                    <form:checkbox path="cruise" name="cruise"  class="sCheckBox"  id="Cruise"/>
                                </div>
                                <div class="checkbox">
                                    <label for="Others">Others</label>
                                    <form:checkbox path="others" name="others" class="sCheckBox" id="Others"/>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="remarks">
                        <div class="clientRemarks">
                            <p class="remarksHedading rmks">Client Remarks</p>
                               <form:textarea path = "clientRemarks" placeholder="These remarks will be shared with the client..." rows="3" cols="150"  maxlength="1450" class="remark1" /> 
                        </div>
                        <div class="internalRemarks">
                            <p class="remarksHedading rmks">Internal Remarks</p>
                            <form:textarea path = "internalRemarks" rows="3" cols="150"  maxlength="1450" class="remark2"/>
                        </div>
                    </div>

                    <div class="confermation">
                        <form:checkbox path="leadCreationClientInformed" checked="checked" class="confermationCheckbox"/>
                        <p class="fs">Inform Client About Lead Creation (Email will be sent)</p>
                    </div>

                    <div class="buttons">
                        <input type="submit" id="submitLead" name="submitLead" value="Create Lead"
                            class="submitbtns submit1" />
                        <a href="view_filter_leads" class="submitbtns">Search leads</a>
                    </div>
                </form:form>
            </div>
        </div>
        </div>
        </div>
    </main>


 <script>
	
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