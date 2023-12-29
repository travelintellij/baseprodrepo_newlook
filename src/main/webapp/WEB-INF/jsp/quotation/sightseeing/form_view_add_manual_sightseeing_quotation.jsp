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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css"> <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
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
<body>


<div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>
    <div class="sssec container">
        <div class="sssec_wrapper">
        
<form:form modelAttribute="MANUAL_STS" action="create_create_sightseeing_manual_quotation">
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualSightSeeingQuotationId" value= "${MANUAL_STS.manualSightSeeingQuotationId}" />
            <div class="sssec_wrapper_data">
                <div class="sssec_wrapper_data_line">
                    <label for="" class="lb">Sight Seeing City</label>
                    <font color="red"><form:errors path="cityName" cssClass="error" /></font>
				<form:input path="cityName"  type="text" id="cityName"  required="required" />
				<form:hidden path = "cityId" id="cityId" />
                </div>
                <div class="sssec_wrapper_data_line">
                    <label for="" class="lb">Sight Seeing Selection</label>
                    <div class="sssec_radio_box sssecb1">
                        <div class="sub_sssec_radio_box">
                            <label style="color:#ff6700" for="system" class="radio">system based</label>
                            <input type="radio" value="true" id="system" name="savedSightSeeing" onclick="check();" />
                        </div>
                        <div class="sub_sssec_radio_box sssecb2">
                            <label for="customized" class="radio" style="color:#ff6700">customized</label>
                           <input type="radio" value="false" id="customized" name="savedSightSeeing" onclick="check();" checked /> 
                        </div>
                        <input type="button" onclick="check();" value="Click" style="background:gray;width:40%;border:none;outline;none;border-radius:2px;color:white;cursor:pointer"/>
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
				<form:input path="adults" type="number" min="0" />
				<font color="red"><form:errors path="adults" cssClass="error" /></font>
                    </div>
                    <div class="fam_com_ssc">
                        <label for="" class="lb">Children</label> <br>
                      <form:input path="children" type="number" min="0"/>
                    </div>
                    <div class="fam_com_ssc">
                        <label for="" class="lb">Infant</label> <br>
                       <form:input path="infant" type="number" min="0" />
                    </div>
                </div>
                <div class="sssec_wrapper_data_line">
                    <label for="" class="lb">Sight Seeing Cost</label>
                     <form:input path="sightSeeingCost" type="number" min="0" />
                </div>
                <div class="sssec_wrapper_data_line">
                    <label for="" class="lb">Sight Seeing Markup</label>
                   <form:input path="sightSeeingMarkup" type="number" min="0"/>
                </div>
                <div class="sssec_wrapper_data_line">
                    <label for="" class="lb">Display Order</label>
                   <form:input path="displayOrder" type="number" min="0"/>
                </div>
            </div>
            <div class="sssec_wrapper_data">
                <div class="sssec_wrapper_data_line_id_name"> <br>
                    <label for="" class="lb">Sight Seeing ID / </br> Sight seeing name</label>
                    <font color="red"><form:errors path="sightSeeingName" cssClass="error" /></font>
				<form:input path="sightSeeingName" style="width: 100%;height:40px;" type="text" id="sightSeeingName" required="required" onchange="considerAutoComplete()" />
				<form:hidden path = "sightSeeingId" id="sightSeeingId" />
                </div>
            </div>

            <div class="sssec_wrapper_data">
                <div class="sssec_rem_box" style="text-align: start;">
                    <label for="" class="lb">Remarks</label> <br>
                    <form:textarea path="remarks" rows="2" cols="139" maxlength="1450"/>
                    
                </div>
            </div>
            <div class="due_today_task_data_btns">
                <input type="submit" name="addHotel" id="addHotel" Value="Add Sight Seeing" />
				<a href="form_view_sightseeing_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}">Cancel</a>
            </div>
            </form:form>
        </div>
    </div>
    
    
<script>

$(document).ready(function() {
	//$( "#sightSeeingName" ).autocomplete({ disabled: false });
	$( "#sightSeeingName" ).autocomplete( "disable" );
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


</script>
   
    
</body>

</html>