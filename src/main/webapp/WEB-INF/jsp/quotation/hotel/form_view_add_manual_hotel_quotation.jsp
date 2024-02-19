<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>form_view_add_manual_hotel_quotation</title>
    <link rel="stylesheet" href="style.css">
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
</head>
<body>

<form:form modelAttribute="MANUAL_HTL" action="create_create_hotel_manual_quotation">
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualHotelQuotationId" value= "${MANUAL_HTL.manualHotelQuotationId}" />
	<form:hidden path="optionNo"/>
	<input type="hidden" name="hotelOptionNo" value= "${QTN_OBJ.hotelOptionNo}" />
    <div class="form_view_add_manual_hotel_quotation bs">
        <div class="form_view_add_manual_hotel_quotation_wrapper">
            <div class="form_view_add_manual_hotel_quo_box">
                <label for="">City</label>
               <font color="red"><form:errors path="cityName" cssClass="error" /></font>
				<form:input path="cityName"  type="text" id="cityName"  />
				<form:hidden path = "cityId" id="cityId" />
            </div>
            <div class="form_view_add_manual_hotel_quo_box">
                <label for="">Hotal Name</label>
               <font color="red"><form:errors path="hotelName" cssClass="error" /></font>
				<form:input path="hotelName"  type="text" id="hotelName" />
				<form:hidden path = "hotelId" id="hotelId" />
            </div>
            <div class="form_view_add_manual_hotel_quo_box">
                <label for="">Room Category</label>
              	<select id="roomCategoryId" name="roomCategoryId" id="roomCategoryId"  required  style="width:90%">
						<option class="service-small" value="" selected>Select Category</option>
				</select>
            </div>
            <div class="form_view_add_manual_hotel_quo_box">
                <label for="">Meal plan</label>
              <form:select path="mealPlan" required="required" style="width:90%" >  
						<option class="service-small" value="" selected>Please Select</option>
						<form:options items = "${MEAL_PLANS_MAP}" class="service-small"/>
					</form:select> 
            </div>
        </div>
        <div class="form_view_add_manual_hotel_quotation_wrapper">
            <div class="form_view_add_manual_hotel_quo_box">
                <label for="">Checkin Date</label>
               <font color="red"><form:errors path="checkInDate" cssClass="error" /></font>
				<form:input type="date" path="checkInDate" required="required" /> 
            </div>
            <div class="form_view_add_manual_hotel_quo_box">
                <label for="">CheckOut Date</label>
              <form:input type="date" path="checkOutDate" required="required" />
            </div>
            <div class="form_view_add_manual_hotel_quo_box">
                <label for="">Adults</label>
              <font color="red"><form:errors path="adults" cssClass="error" /></font>
				<form:input path="adults" type="number" min="0"/>
            </div>
            <div class="form_view_add_manual_hotel_quo_box">
                <label for="">Children</label>
               <form:input path="children" type="number" min="0" />
            </div>
        </div>
        <div class="form_view_add_manual_hotel_quotation_wrapper">
            <div class="form_view_add_manual_hotel_quo_box">
                <label for="">Extra Bed</label>
               <form:input path="extrabed" type="number" min="0" />
            </div>
            <div class="form_view_add_manual_hotel_quo_box">
                <label for="">Number of Rooms</label>
              <form:input path="noOfRooms" type="number" min="1" />
            </div>
            <div class="form_view_add_manual_hotel_quo_box">
                <label for="">Total Cost</label>
                <form:input path="hotelStayCost" type="number" min="0" />
            </div>
            <div class="form_view_add_manual_hotel_quo_box">
                <label for="">Total Markup</label>
               <form:input path="hotelStayMarkup" type="number" min="0" />
            </div>
        </div>
        <div class="form_view_add_manual_hotel_quotation_wrapper">
            <div class="form_view_add_manual_hotel_quo_box">
                <label for="">Display Order</label>
               <form:input path="displayOrder" type="number" min="0" />
            </div>
        </div>
        <div class="form_view_add_manual_hotel_quotation_wrapper">
            <div class="form_view_add_manual_hotel_quo_box">
                <label for="">Remarks</label>
                <form:textarea path="remarks" rows="5" cols="139" maxlength="1450"/>
            </div>
        </div>
        <div class="due_today_task_data_btns">
        <input type="submit" name="addHotel" id="addHotel" Value="Add Hotel Stay" />
           <c:if test="${(MAX_HOTEL_OPTION_CREATED+1) == QTN_OBJ.hotelOptionNo }">
				<a href="form_view_hotel_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}">Cancel</a>
			</c:if>
			<c:if test="${(MAX_HOTEL_OPTION_CREATED+1) != QTN_OBJ.hotelOptionNo }">
				<a href="form_view_hotel_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}&hotelOptionNo=${QTN_OBJ.hotelOptionNo}">Cancel</a>
			</c:if>
        </div>
    </div>
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


</script>
   
</body>
</html>