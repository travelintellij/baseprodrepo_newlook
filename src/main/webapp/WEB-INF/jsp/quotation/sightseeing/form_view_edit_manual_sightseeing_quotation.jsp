<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css"> 
</head>

<body>
    <div class="sssec container">
        <div class="sssec_wrapper">
        
<form:form modelAttribute="MANUAL_STS" action="edit_edit_sightseeing_manual_quotation">
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualSightSeeingQuotationId" value= "${MANUAL_STS.manualSightSeeingQuotationId}" />
	  <h1 style="color:#32cd32;padding:10px 0"><b>Id-  ${MANUAL_STS.manualSightSeeingQuotationId}</b></h1>
            <div class="sssec_wrapper_data_try" style="margin-bottom:10px" >
                <div class="sssec_wrapper_data_line">
                    <label for="" class="lb">Sight Seeing City</label>
                  	<font color="red"><form:errors path="cityName" cssClass="error" /></font>
				<form:input path="cityName" style="width:90%" type="text" id="cityName"  />
				<form:hidden path = "cityId" id="cityId" />
                </div>
                <div class="sssec_wrapper_data_line">
                    <label for="" class="lb">Sight Seeing Selection</label>
                    <div class="sssec_radio_box sssecb1">
                    <div class= "fvemsq">
                     <form:radiobutton path="savedSightSeeing" value="true" onclick="check();" id="system" style="width:20px;height:20px;margin-right:140px"/>  <label for="system" class="radio" style="width:250px">System Based</label>
                    </div>
                   <div class= "fvemsq">
					
					<form:radiobutton path="savedSightSeeing" value="false" onclick="check();" id="cutomized" style="width:20px;height:20px;margin-right:140px"/> <label for="cutomized" class="radio" style="width:250px">Customized</label>
                </div>
                </div>
                
                 </div>
                <div class="sssec_wrapper_data_line">
                    <label for="" class="lb">Transfer Type</label> </br>
                   <form:select path="transferType" required="required" style="width: 90%;">  
					<option class="service-small" value="" selected>Please Select</option>
					<form:options items = "${TRANSFER_TYPE_MODE}" class="service-small"/>
				</form:select>  
               
                </div>
                <div class="sssec_wrapper_data_line">
                    <label for="" class="lb">Sight Seeing date</label>
                   <form:input type="date" path="sightSeeingDate" required="required" />
                </div>
            </div>
            <div class="sssec_wrapper_data">
                <div class="sssec_wrapper_data_line_fam_info">
                    <div class="fam_com_ssc">
                        <label for="" class="lb">Adults</label> <br>
                        <font color="red"><form:errors path="adults" cssClass="error" /></font>
				<form:input path="adults" type="number" min="0" style="height:30px;width:50px;margin: auto;"/>
                    </div>
                    <div class="fam_com_ssc">
                        <label for="" class="lb">Children</label> <br>
                     <form:input path="children" type="number" min="0" style="height:30px;width:50px;margin: auto;"/>
                    </div>
                    <div class="fam_com_ssc">
                        <label for="" class="lb">Infant</label> <br>
                      <form:input path="infant" type="number" min="0" style="height:30px;width:50px;margin: auto;"/>
                    </div>
                </div>
                <div class="sssec_wrapper_data_line">
                    <label for="" class="lb">Sight Seeing Cost</label> </br>
                  <form:input path="sightSeeingCost" type="number" min="0" style="width:90%"/>
                </div>
                <div class="sssec_wrapper_data_line">
                    <label for="" class="lb">Sight Seeing Markup</label> </br>
                 <form:input path="sightSeeingMarkup" type="number" min="0" style="width:90%"/>
                </div>
                <div class="sssec_wrapper_data_line">
                    <label for="" class="lb">Display Order</label> </br>
                  <form:input path="displayOrder" type="number" min="0" style="width:90%"/>
                </div>
            </div>
            <div class="sssec_wrapper_data">
                <div class="sssec_wrapper_data_line_id_name"> <br>
                    <label for="" class="lb">Sight Seeing ID / </br> Sight seeing name</label>
                <font color="red"><form:errors path="sightSeeingName" cssClass="error" /></font> </br>
				<form:input path="sightSeeingName" style="width:100%" type="text" id="sightSeeingName" required="required" onchange="considerAutoComplete()" />
				<form:hidden path = "sightSeeingId" id="sightSeeingId" />
                </div>
            </div>

            <div class="sssec_wrapper_data">
                <div class="sssec_rem_box" style="text-align: start;">
                    <label for="" class="lb">Remarks</label> <br>
                    <form:textarea path="remarks" rows="5" cols="139" maxlength="1450"/>
                    
                </div>
            </div>
            <div class="due_today_task_data_btns">
               <input type="submit" name="editSightSeeing" id="editSightSeeing" Value="Update Sight Seeing" />
				<a href="form_view_sightseeing_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}">Cancel</a>
            </div>
            </form:form>
        </div>
    </div>

<script>

$(document).ready(function() {
	check();
});

function check(){
	if ($("input[name='savedSightSeeing']:checked").val()=="true") {
		$( "#sightSeeingName" ).autocomplete( "enable" );
	}
	if ($("input[name='savedSightSeeing']:checked").val()=="false") {
		$( "#sightSeeingName" ).autocomplete( "disable" );
	}
}

$('#cityName').autocomplete({
	serviceUrl : '${pageContext.request.contextPath}/getCityList',
	paramName : "cityName",
	delimiter : ",",
	onSelect : function(suggestion) {
		cityID = suggestion.data;
		id = cityID;
		jQuery("#cityId").val(cityID);
		$('input[name=cityId]').val(id);
		return false;
	},
	transformResult : function(response) {
		return {
			suggestions : $.map($.parseJSON(response), function(item) {
				return {
					value : item.cityName,
					data : item.destinationId
				};
			})

		};
	}
});



	



	//alert($("input[name='savedSightSeeing']:checked").val());
	$('#sightSeeingName').autocomplete(
		{

			//alert($("#savedSightSeeing").val);
			serviceUrl : "${pageContext.request.contextPath}/getCitySightSeeingList",
			minChars: 3,
			paramName : "sightSeeingName",
			params : {
				cityId : function() {
					return $('#cityId').val()
				}
			},
			delimiter : ",",
			onSelect : function(suggestion) {
				sightSeeingID = suggestion.data;
				id = sightSeeingId;
				jQuery("#sightSeeingId").val(sightSeeingID);
				$('input[name=sightSeeingName]').val(suggestion.value);
				//alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
				return false;
			},
			transformResult : function(response) {
				return {
					suggestions : $.map($.parseJSON(response),
							function(item) {
								return {
									value : item.tagName,
									data : item.id,
									roomCat : item.keyValueList
								};
							})

				};
			}

		});
	$(document).ready(function () {
	    // Handler for .ready() called.
	    var nt = document.getElementById('editSightSeeingTable');
	   	if (nt != null) {
	        $('html, body').animate({
	            scrollTop: $('#editSightSeeingTable').offset().top
	        }, 'slow');
	    	
	    }
	    
	});

</script>
   
    
</body>

</html>