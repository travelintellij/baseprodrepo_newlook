<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>

<form:form modelAttribute="MANUAL_HTL" action="edit_edit_hotel_manual_quotation">
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualHotelQuotationId" value= "${MANUAL_HTL.manualHotelQuotationId}" />
	<form:hidden path="optionNo"/>
	<input type="hidden" name="hotelOptionNo" value= "${QTN_OBJ.hotelOptionNo}" />
	
	<table style="width:100%;  table-layout:fixed;" id="newflightStop" >
		<tr>
			<th colspan="1" style="width:20%;"><font size="4"><b>City</b></font></th>
			<th colspan="2" style="width:40%;"><font size="4"><b>Hotel Name</b></font></th>
			<th><font size="4" style="width:20%;"><b>Room Category</b></font></th>
			<th><font size="4" style="width:20%;"><b>Meal Plan</b></font></th>
		</tr>
		<tr>
			<td>
				<font color="red"><form:errors path="cityName" cssClass="error" /></font>
				<form:input path="cityName" style="width: 150px;height:40px;" type="text" id="cityName"  />
				<form:hidden path = "cityId" id="cityId" />
			</td>
			<td colspan="2">
				<font color="red"><form:errors path="hotelName" cssClass="error" /></font>
				<form:input path="hotelName" style="width: 300px;height:40px;" type="text" id="hotelName" />
				<form:hidden path = "hotelId" id="hotelId" />
			</td>
			<td>
				<div class="select">
					<select id="roomCategoryId" name="roomCategoryId" id="roomCategoryId" style="width: 120px;" required>
						<option class="service-small" value="" selected>Select Category</option>
						<c:if test="${not empty SELECTED_HOTEL_ALL_ROOM_CATEGORY}">
					       <c:forEach items="${SELECTED_HOTEL_ALL_ROOM_CATEGORY}" var="htl_sl_htl_room_cat">
					      		<c:if test="${MANUAL_HTL.roomCategoryId eq htl_sl_htl_room_cat.roomCategoryId }">
					      			<option class="service-small" value="${htl_sl_htl_room_cat.roomCategoryId}" selected>${htl_sl_htl_room_cat.roomCategoryName}</option>
					      		</c:if>
					      		<c:if test="${MANUAL_HTL.roomCategoryId ne htl_sl_htl_room_cat.roomCategoryId }">
					      			<option class="service-small" value="${htl_sl_htl_room_cat.roomCategoryId}">${htl_sl_htl_room_cat.roomCategoryName}</option>
					      	</c:if>
					      </c:forEach>
						</c:if>
						
					</select>
				</div>
			
			</td>
			<td>
				<div class="select">
					<form:select path="mealPlan" required="required" style="width: 100px;">  
						<option class="service-small" value="" selected>Please Select</option>
						<form:options items = "${MEAL_PLANS_MAP}" class="service-small"/>
					</form:select>  
				</div>
			</td>
		</tr>

		<tr>	
			<th style="width:20%;"><font size="4"><b>CheckIn Date</b></font></th>
			<th style="width:20%;"><font size="4"><b>CheckOut Date</b></font></th>
			<th style="width:20%;"><font size="4"><b>Adults</b></font></th>
			<th style="width:20%;"><font size="4"><b >Children</b></font></th>
			<th style="width:20%;"><font size="4"><b>Extra Bed</b></font></th>
		</tr>
		<tr>
			<td>
			<font color="red"><form:errors path="checkInDate" cssClass="error" /></font>
				<form:input type="date" path="checkInDate" required="required" /> 
			</td>
			<td><form:input type="date" path="checkOutDate" required="required" /></td>
			<td>
				<font color="red"><form:errors path="adults" cssClass="error" /></font>
				<form:input path="adults" type="number" min="0" style="height:30px;width:50px;margin: auto;"/>
			</td>
			<td><form:input path="children" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
			<td><form:input path="extrabed" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
		</tr>
			
			
		<tr>	
			<th><font size="4"><b>No. of Rooms </b></font></th>
			<th colspan="2"><font size="4"><b>Total Cost</b></font></th>
			<th><font size="4"><b>Total Markup</b></font></th>
			<th><font size="4"><b>Display Order</b></font></th>
		</tr>
		<tr>	
			<td><form:input path="noOfRooms" type="number" min="1" style="height:30px;width:50px;margin: auto;"/></td>
			<td colspan="2"><form:input path="hotelStayCost" type="number" min="0" style="height:30px;width:120px;margin: auto;"/>	</td>
			<td><form:input path="hotelStayMarkup" type="number" min="0" style="height:30px;width:80px;margin: auto;"/></td>
			<td><form:input path="displayOrder" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
		</tr>
		<tr>	
			<th colspan="5"><font size="4"><b>Remarks</b></font></th>
		</tr>
		<tr>	
			<td colspan="5"><form:textarea path="remarks" rows="3" cols="150" maxlength="1450"/></td>
		</tr>
		<tr>
			<th colspan="5"><input type="submit" name="editHotel" id="editHotel" Value="Update Hotel Stay" />
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
   