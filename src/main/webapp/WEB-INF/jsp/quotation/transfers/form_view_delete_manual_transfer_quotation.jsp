<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>

<form:form modelAttribute="MANUAL_TRN" action="delete_delete_transfer_manual_quotation">
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualTransferQuotationId" value= "${MANUAL_TRN.manualTransferQuotationId}" />
	
	<table style="width:100%;  table-layout:fixed;background-color: #DFE0DC; border: 3px solid #000000; border-collapse: collapse" id="newflightStop">
		<tr><th style="background-color:#800000;" colspan="5"><font size="4"><b>Id-  ${MANUAL_TRN.manualTransferQuotationId}</b></font></th></tr>
		<tr>
			<th style="background-color:red;" colspan="1"><font size="4"><b>Pickup City</b></font></th>
			<th style="background-color:red;"><font size="4"><b>Pickup From</b></font></th>
			<th style="background-color:red;" colspan="2"><font size="4"><b>Pickup From Name</b></font></th>
			<th style="background-color:red;"><font size="4"><b>Transfer Date</b></font></th>
		</tr>
		<tr>
			<td>${MANUAL_TRN.pickUpCityName }</td>
			<td>${MANUAL_TRN.pickUpFromDesc}</td>
			<td colspan="2">${MANUAL_TRN.pickUpFromName}</td>
			<td><fmt:formatDate value="${MANUAL_TRN.transferDate}" type="date" pattern="dd-MMM-yyyy"/></td>
		</tr>

		<tr>	
			<th style="background-color:red;"><font size="4"><b>Drop City</b></font></th>
			<th style="background-color:red;"><font size="4"><b>Drop To</b></font></th>
			<th style="background-color:red;" colspan="2"><font size="4"><b>Drop To Name</b></font></th>
			<th style="background-color:red;"><font size="4"><b>Transfer Type</b></font></th>
		</tr>
		<tr>
			<td>${MANUAL_TRN.dropToCityName}</td>
			<td>${MANUAL_TRN.dropToDesc}</td>
			<td colspan="2">${MANUAL_TRN.dropToName}</td>
			<td>${MANUAL_TRN.transferTypeName}</td>
		</tr>
		<tr>	
			<th style="background-color:red;"><font size="4"><b>Adults</b></font></th>
			<th style="background-color:red;"><font size="4"><b>Children</b></font></th>
			<th style="background-color:red;"><font size="4"><b>Infant</b></font></th>
			<th style="background-color:red;"><font size="4"><b>Transfer Cost</b></font></th>
			<th style="background-color:red;"><font size="4"><b>Transfer Markup</b></font></th>
		</tr>
		<tr>	
			<td>${MANUAL_TRN.adults}</td>
			<td>${MANUAL_TRN.children}	</td>
			<td>${MANUAL_TRN.infant}</td>
			<td>${MANUAL_TRN.transferCost}</td>
			<td>${MANUAL_TRN.transferMarkup}</td>
		</tr>
		<tr>	
			<th style="background-color:red;" colspan="4"><font size="4"><b>Remarks</b></font></th>
			<th style="background-color:red;"><font size="4"><b>Display Order</b></font></th>
		</tr>
		<tr>	
			<td colspan="4">${MANUAL_TRN.remarks}</td>
			<td>${MANUAL_TRN.displayOrder }</td>	
		</tr>
		<tr>
			<th style="background-color:#800000;" colspan="5">
				<input type="submit" name="deleteTransfer" id="deleteTransfer" Value="Confirm Delete"  style="background-color:red;"/>
				<a href="form_view_transfer_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
			</th>
		</tr>
		</table>		
	</form:form>

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
   