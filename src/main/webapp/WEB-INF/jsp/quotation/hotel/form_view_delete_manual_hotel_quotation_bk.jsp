<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>

<form:form modelAttribute="MANUAL_HTL" action="delete_delete_hotel_manual_quotation">
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualHotelQuotationId" value= "${MANUAL_HTL.manualHotelQuotationId}" />
	<form:hidden path="optionNo"/>
	<table style="width:100%;  table-layout:fixed;" id="newflightStop" >
		<tr>
		<th colspan="5" style="background-color:red;">Id - ${MANUAL_HTL.manualHotelQuotationId}</th>
		</tr>
		<tr>
			<th colspan="1" style="width:20%;background-color:red;" ><font size="4"><b>City</b></font></th>
			<th colspan="2" style="width:40%;background-color:red;"><font size="4"><b>Hotel Name</b></font></th>
			<th style="width:20%;background-color:red;"><font size="4"><b>Room Category</b></font></th>
			<th style="width:20%;background-color:red;"> <font size="4"><b>Meal Plan</b></font></th>
		</tr>
		<tr>
			<td>${MANUAL_HTL.cityName}</td>
			<td colspan="2">${MANUAL_HTL.hotelName}</td>
			<td>${MANUAL_HTL.roomCategoryName}</td>
			<td>${MANUAL_HTL.mealPlanName}</td>
		</tr>

		<tr>	
			<th style="width:20%;background-color:red;"><font size="4"><b>CheckIn Date</b></font></th>
			<th style="width:20%;background-color:red;"><font size="4"><b>CheckOut Date</b></font></th>
			<th style="width:20%;background-color:red;"><font size="4"><b>Adults</b></font></th>
			<th style="width:20%;background-color:red;"><font size="4"><b >Children</b></font></th>
			<th style="width:20%;background-color:red;"><font size="4"><b>Extra Bed</b></font></th>
		</tr>
		<tr>
			<td><fmt:formatDate value="${MANUAL_HTL.checkInDate}" pattern="dd-MM-yyyy" /></td>
			<td><fmt:formatDate value="${MANUAL_HTL.checkOutDate}" pattern="dd-MM-yyyy" /></td>
			<td>${MANUAL_HTL.adults}</td>
			<td>${MANUAL_HTL.children} </td>
			<td>${MANUAL_HTL.extrabed}</td>
		</tr>
			
			
		<tr>	
			<th style="background-color:red;"><font size="4"><b>No. of Rooms </b></font></th>
			<th colspan="2" style="background-color:red;"><font size="4"><b>Total Cost</b></font></th>
			<th style="background-color:red;"><font size="4"><b>Total Markup</b></font></th>
			<th style="background-color:red;"><font size="4"><b>Display Order</b></font></th>
		</tr>
		<tr>	
			<td>${MANUAL_HTL.noOfRooms}</td>
			<td colspan="2">${MANUAL_HTL.hotelStayCost}</td>
			<td>${MANUAL_HTL.hotelStayMarkup}</td>
			<td>${MANUAL_HTL.displayOrder}</td>
		</tr>
		<tr>	
			<th colspan="5" style="background-color:red;"><font size="4"><b>Remarks</b></font></th>
		</tr>
		<tr>	
			<td colspan="5">${MANUAL_HTL.remarks}</td>
		</tr>
		<tr>
			<th colspan="5"><input type="submit" name="deleteHotel" id="deleteHotel" Value="Confirm Delete Stay" style="background-color:red;" />
			<a href="form_view_hotel_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}&hotelOptionNo=${QTN_OBJ.hotelOptionNo}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
		
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
   