<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin_Add_Visa</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
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

<body  style="background: url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
   
   
   
   
<div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>
   
   
   
    <div class="Admin_Add_Visa container">
        <div class="Admin_Add_Visa_wrapper">
            <h1 class="page-heading">Add Visa</h1>
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
                <form:form method="post" action="add_add_visa_master" modelAttribute="visa_obj">
            <div class="Admin_Add_Visa_wrapper_data">
                <div class="Admin_Add_Visa_wrapper_data_line">
                    <div class="Admin_Add_Visa_wrapper_data_l1">
                        <label for="">Country Name</label>
                    <input  type="text" id="countryName" name="countryName" placeholder="country name" required />
                    <input type="hidden" name="countryCode" id="countryCode" />
                    </div>
                    <div class="Admin_Add_Visa_wrapper_data_l1">
                        <label for="">Consulate City</label> <br>
                        <select id="consulateCity" name="consulateCity" style="width:90%" required>
                            <option class="service-small" value="" selected>Please Select</option>
                        </select>
                    </div>
                    <div class="Admin_Add_Visa_wrapper_data_l1">
                        <label for="">Visa Profile</label>
                    <select name="profile" style="width:90%" required>
                        <option class="service-small" value="" selected>Please Select</option>
                        <c:if test="${not empty VISA_PROFILE}">
                            <c:forEach items="${VISA_PROFILE}" var="visaProfile">
                                <option class="service-small" value="${visaProfile.key}">${visaProfile.value}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                    </div>
                    <div class="Admin_Add_Visa_wrapper_data_l1">
                        <label for="">Visa Type</label>
                    <select name="visaType" style="width:90%"  required>
                        <option class="service-small" value="" selected>Please Select</option>
                        <c:if test="${not empty VISA_TYPE}">
                            <c:forEach items="${VISA_TYPE}" var="visaType">
                                <option class="service-small" value="${visaType.key}">${visaType.value}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                    </div>
                </div>
                <div class="Admin_Add_Visa_wrapper_data_line">
                    <div class="Admin_Add_Visa_wrapper_data_l1">
                        <label for="">Visa Purpose</label>
                        <select name="visaPurpose" style="width:90%" required>
                            <option class="service-small" value="" selected>Please Select</option>
                            <c:if test="${not empty VISA_PURPOSE}">
                                <c:forEach items="${VISA_PURPOSE}" var="visaPurpose">
                                    <option class="service-small" value="${visaPurpose.key}">${visaPurpose.value}</option>
                                </c:forEach>
                            </c:if>
                        </select>
                    </div>
                    <div class="Admin_Add_Visa_wrapper_data_l1">
                        <label for="">Standard Cost</label>
                    <input  type="text" name="standardCost" />
                    </div>
                    <div class="Admin_Add_Visa_wrapper_data_l1">
                        <label for="">B2B Price</label>
                    <input  type="text" name="standardB2bPrice" />
                    </div>
                    <div class="Admin_Add_Visa_wrapper_data_l1">
                        <label for="">B2C Price</label>
                    <input type="text" name="standardB2cPrice" />
                    </div>
                </div>
                <div class="Admin_Add_Visa_wrapper_data_line">
                    <div class="Admin_Add_Visa_wrapper_data_l1">
                        <label for="">Processing Time</label><br>
                        <input type="text" name="processingTime" style="width:75%" />Days
                    </div>
                </div>
                <div class="Admin_Add_Visa_wrapper_data_line_remarks">
                    <div class="Admin_Add_Visa_wrapper_data_l1">
                        <label for="">Internal Remarks</label>
                        <textarea rows="2" cols="67"
                            name="internalRemarks" htmlEscape="false" maxlength="1040" placeholder="Will never be shared with clients"></textarea>
                    </div>
                    <div class="Admin_Add_Visa_wrapper_data_l1">
                        <label for="">Other Costs</label>
                        <textarea  rows="2" cols="67"
                            name="otherCosts" htmlEscape="false" maxlength="1040" placeholder="Like extended validity visa options"></textarea>
                    </div>
                </div>
                <div class="Admin_Add_Visa_wrapper_data_line_remarks">
                    <div class="Admin_Add_Visa_wrapper_data_l1">
                        <label for="">Remarks</label>
                        <textarea  rows="2" cols="140"
                            name="remarks" htmlEscape="false" maxlength="1995"></textarea>
                    </div>
                </div>
                <!-- ########### BTNS ############ -->
                <div class="due_today_task_data_btns">
                    <input type="submit" name="submit" value="Add and Proceed" />
                    <a href="view_search_visa_form">Search Visa Master</a>  
                </div>
            </div>
            	</form:form>
        </div>
    </div>
    
    
<script>
	/*
	$('#countryName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCountryList',
	paramName: "countryName",
	delimiter: ",",
	onSelect: function(suggestion) {
        cityID = suggestion.data;
        id=cityID;
        jQuery("#countryCode").val(cityID);
        $('input[name=countryCode]').val(id);
        return false;
    },
	transformResult: function(response) {
        return {
            suggestions: $.map($.parseJSON(response), function(item) {
            	return { value: item.countryName, data: item.countryCode };
            })
            
        };
    }
});
	
	*/
	
	$('#countryName').autocomplete({
		serviceUrl: '${pageContext.request.contextPath}/getCountryConsulateList',
		paramName: "countryName",
		delimiter: ",",
		onSelect: function(suggestion) {
			$('#consulateCity').empty();
			$('#consulateCity').append($("<option class='service-small'>").val("").text("Please Select"));
			$.each(suggestion.consCityList, function(key, value) {
				$('#consulateCity').append($("<option class='service-small'>").val(key).text(value));
			});
			cityID = suggestion.data;
	        id=cityID;
	        jQuery("#countryCode").val(cityID);
	        $('input[name=countryCode]').val(id);
	        return false;
	    },
		transformResult: function(response) {
	        return {
	            suggestions: $.map($.parseJSON(response), function(item) {
	            	return { value: item.countryName, data: item.countryCode,consCityList : item.cityKeyValue };
	            })
	            
	        };
	        
	    }
	});
	
</script>
    
</body>
</html>