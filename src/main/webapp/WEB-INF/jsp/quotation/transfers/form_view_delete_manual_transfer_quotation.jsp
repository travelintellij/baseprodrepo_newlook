<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>form_view_delete_manual_transfer_quotation</title>
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
    <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body>

    <div class="view_transfer_quotation_table container">
     <div class="view_transfer_quotation_table_wrapper">
    <form:form modelAttribute="MANUAL_TRN" action="delete_delete_transfer_manual_quotation">
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualTransferQuotationId" value= "${MANUAL_TRN.manualTransferQuotationId}" />
            <h1 class="vtdh2">Delete transfer quotation <i class="fa fa-exclamation-triangle" aria-hidden="true"></i>
            </h1>
            <div class="view_transfer_quotation_table_wrapper_data" style="background:#6082B6;margin-bottom:10px">
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Pickup City</label>
                    <p>${transferQtnObj.pickUpCityName }</p>
                </div>
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Pickup From</label>
                    <p>${transferQtnObj.pickUpFromDesc}</p>
                </div>
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Pickup From Name</label>
                    <p>${transferQtnObj.pickUpFromName}</p>
                </div>
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Transfer Date</label>
                    <p>
                        <fmt:formatDate value="${transferQtnObj.transferDate}" pattern="dd-MM-yyyy" />
                    </p>
                </div>
            </div>
            <div class="view_transfer_quotation_table_wrapper_data" style="background:#6082B6;margin-bottom:10px">
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Drop City</label>
                    <p>${transferQtnObj.dropToCityName}</p>
                </div>
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Drop to</label>
                    <p>${transferQtnObj.dropToCityName}</p>
                </div>
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Drop to name</label>
                    <p>${transferQtnObj.dropToName}</p>
                </div>
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Transfer Type</label>
                    <p>${transferQtnObj.transferTypeName}</p>
                </div>
            </div>

            <div class="view_transfer_quotation_table_wrapper_data" style="background:#6082B6;margin-bottom:10px">
                <div class="view_transfer_quotation_table_wrapper_data_li_wrp">
                    <div class="vtq_child">
                        <label for="">Adults</label>
                        <p>${transferQtnObj.adults}</p>
                    </div>
                    <div class="vtq_child">
                        <label for="">Children</label>
                        <p>${transferQtnObj.children}</p>
                    </div>
                    <div class="vtq_child">
                        <label for="">Infant</label>
                        <p>${transferQtnObj.infant}</p>
                    </div>
                </div>
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Transfer Cost</label>
                    <p>${transferQtnObj.transferCost}</p>
                </div>
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Transfer Markup</label>
                    <p>${transferQtnObj.transferMarkup}</p>
                </div>
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Display order</label>
                    <p>${transferQtnObj.displayOrder }</p>
                </div>
            </div>
            <div class="view_transfer_quotation_table_wrapper_data" style="background:#6082B6;margin-bottom:10px">
                <label for="">Remarks</label>
                <p>${transferQtnObj.remarks}</p>
            </div>
            <div class="due_today_task_data_btns">
                <input type="submit" name="deleteTransfer" id="deleteTransfer" Value="Confirm Delete"  style="background-color:red;"/>
				<a href="form_view_transfer_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}">Cancel</a>
            </div>
            	</form:form>
        </div>
    </div>
    
    	
    	
<script>
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


$('#hotelName').autocomplete(
		{
			serviceUrl : "${pageContext.request.contextPath}/getCityHotelList",
			minChars: 3,
			paramName : "hotelName",
			params : {
				cityId : function() {
					return $('#cityId').val()
				}
			},
			delimiter : ",",
			onSelect : function(suggestion) {
				//$('#roomCategory').append(new Option(suggestion.value,suggestion.data));
				//populateRoomCategory(event, ui);
				$('#roomCategoryId').empty();
				$.each(suggestion.roomCat, function(key, value) {
					$('#roomCategoryId').append($("<option class='service-small'>").val(key).text(value));
					//$('#roomCategory').append(new Option(value,key));
				});
				hotelID = suggestion.data;
				id = hotelID;
				jQuery("#hotelId").val(hotelID);
				$('input[name=hotelName]').val(suggestion.value);
				//alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
				return false;
			},
			transformResult : function(response) {
				return {
					suggestions : $.map($.parseJSON(response),
							function(item) {
								/*for(var k in item.keyValueList) {
								    if(item[k] instanceof Object) {
								    	$.each(item[k], function(key, value) {
								    		alert(key);
								    	});
								    } else {
								        alert('not object');
								    };
								}*/
								//alert(item.keyValueList);
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
     
    var nt = document.getElementById('newflightStop');
   	if (nt != null) {
        $('html, body').animate({
            scrollTop: $('#newflightStop').offset().top
        }, 'slow');
    	
    }
    
});

</script>
   
</body>

</html>