<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.jquery-ui.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<head>
	<title>UdanChoo Team Workload Section</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="${pageContext.request.contextPath}/resources/css/tooplate_style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/coda-slider.css" type="text/css" charset="utf-8" />
</head>

<style>

/*
body {
  background-image: url('${pageContext.request.contextPath}/resources/images/hotel.png');
  background-repeat: no-repeat;
   background-position: top;
 background-blend-mode: darken;


}*/
table {
  width: 100%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
  background: transparent;
}

th {
  background: #339933;
  height: 40px;
  width: 10%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: black;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
  font-size:20px;
}

th, td {
  padding: 10px;
}
tr {
  border-bottom: 1px solid #cccccc;
 
}

td {
  border-right: 1px solid #cccccc;
  padding: 10px;
  transition: all 0.2s;
  text-align: center;
  font-size:20px;
}

.heavyTable {
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
  animation: float 5s infinite;
}

input[type=button], input[type=submit], input[type=reset] {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 10px 20px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}
select {
	appearance: none;
	outline: 0;
	background: lightblue;
	background-image: none;
	width: 100%;
	height: 100%;
	color: black;
	cursor: pointer;
	border: 1px solid black;
	border-radius: 3px;
	text-indent: 2px;
}

.select {
	position: relative;
	display: block;
	height: 2.5em;
	line-height: 3;
	overflow: hidden;
	border-radius: .25em;
	padding-bottom: 10px;
	padding-top: 10px;
}

.select option.service-small {
	font-size: 20px;
	padding: 25px;
	background: lightgreen;
}


</style>


<jsp:include page="../_Workload_Menu.jsp" />


<br>
<h2 align="center">
	Hotel Voucher
</h2>
<hr>
	
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<body style="background-color: white;" class="watermarked">
	<form:form name="formaddwl" modelAttribute="HTL_VCHR_OBJ" action="create_create_hotel_voucher">
			<form:hidden path = "htlVoucherId" id="htlVoucherId" />
			<form:hidden path = "dealConfirmationId" id="dealConfirmationId" />
			<form:hidden path = "htlServiceId" id="htlServiceId" />
			<form:hidden path = "serviceMapId" id="serviceMapId" />
			<form:hidden path = "checkInDate" id="checkInDate" />
			<form:hidden path = "checkOutDate" id="checkOutDate" />
			<form:hidden path = "hotelId" id="hotelId" />
			<form:hidden path = "adults" id="adults" />
			<form:hidden path = "cityId" id="cityId" />
			<form:hidden path = "children" id="children" />
			<form:hidden path = "mealPlan" id="mealPlan" />
			<form:hidden path = "roomCategoryId" id="roomCategoryId" />
			<form:hidden path = "noofrooms" id="noofrooms" />
			
			
			<table style="border: 3px solid black;width:85%;" id="updatehotel" >
				<tr>
					<th style="width: 10%; background-color: #CCBA78;" align="center">City</th>
					<th style="width: 25%; background-color: #CCBA78;" align="center">Hotel Name</th>
					<th style="width: 20%; background-color: #CCBA78;" align="center">Room Details</th>
					<th style="width: 10%; background-color: #CCBA78;" align="center">Meal Plan</th>
					<th style="width: 10%; background-color: #CCBA78;" align="center">Check In</th>
					<th style="width: 10%; background-color: #CCBA78;" align="center">Check Out</th>

				</tr>
				<tr>
					<td style="width: 10%;" align="center">
						${HTL_VCHR_OBJ.cityName}

						<b><font color="red"><form:errors path="cityName" cssClass="error" /></font></b>
					</td>
					<td style="width: 25%;" align="center">
						${HTL_VCHR_OBJ.hotelName}
						<form:hidden path = "hotelId" id="hotelId" />
					</td>
					<td style="width: 20%;" align="center">
						${HTL_VCHR_OBJ.roomCategoryName}
					</td>
					<td style="width: 10%;" align="center">
						${HTL_VCHR_OBJ.mealPlanName}
					</td>
					<td style="width: 10%;" align="center">
						<fmt:formatDate value="${HTL_VCHR_OBJ.checkInDate}" pattern="dd-MM-yyyy" />
						<b><font color="red"><form:errors path="checkInDate" cssClass="error" /></font></b>
					</td>
					<td style="width: 10%;" align="center">
						<fmt:formatDate value="${HTL_VCHR_OBJ.checkOutDate}" pattern="dd-MM-yyyy" />
					</td>
				</tr>
				<tr>
					<th style="width: 10%;background-color: #CCBA78;" align="center">No. of Rooms</th>
					<th style="width: 20%;background-color: #CCBA78;" align="center">Guest Details</th>
					<th style="width: 15%;background-color: #CCBA78;" align="center" >Remarks</th>
					<th style="width: 15%;background-color: #CCBA78;" align="center">Partner Header</th>
					<th style="width: 10%;background-color: #CCBA78;" align="center">Status</th>
					<th style="width: 10%;background-color: #CCBA78;" align="center">Voucher Date</th>
				</tr>
				<tr>
					<td style="width: 10%;" align="center" >
						${HTL_VCHR_OBJ.noofrooms}
					</td>
					<td style="width: 20%;" align="center">
						<table>
							<tr>
								<th style="background-color: #CCBA78;">Adults</th>
								<th style="background-color: #CCBA78;">Children</th>
							</tr>
							<tr>
								<td>${HTL_VCHR_OBJ.adults}   </td>
								<td>${HTL_VCHR_OBJ.children} </td>
								<b><font color="red"><form:errors path="adults" cssClass="error" /></font></b>
							</tr>
						</table>
					</td>
					<td style="width: 15%;" align="center">
						<form:textarea path = "remarks" rows = "4" cols = "15" style="width: 300px; height: 100px;border: 2px solid green; border-radius: 4px;" maxlength="500" htmlEscape="false" />
					</td>
					<td style="width: 15%;" align="center">
						<div class="select">
							<form:select path="b2bPartnerId" style="width: 200px;height:40px;border: 1px solid ;" required="required">  
								<form:options items = "${PARTNERS_MAP}" class="service-small"/>
							</form:select>  
						</div>
					</td>
					<td style="width: 10%;" align="center">
						<div class="select">
							<form:select path="status" style="width: 200px;height:40px;border: 1px solid ;" required="required">  
								<form:options items = "${HOTEL_BKNG_PMT_STATUS_MAP}" class="service-small"/>
							</form:select>  
						</div>
					</td>
					<td style="width: 10%;" align="center">
						<form:input path="voucherDate" style="height: 40px; width: 150px;" required="required" type="date" />
					</td>
					
					</tr>
					<tr>
						<th style="width: 10%;background-color: lightblue;" align="center">Lead Guest Name</th>
						<th style="width: 10%;background-color: lightblue;" align="center">Phone</th>
						<th style="width: 10%;background-color: #CCBA78;" align="center">Advance</th>
						<th style="width: 20%;background-color: #CCBA78;" align="center">Balance</th>
						<th style="width: 15%;background-color: #CCBA78;" align="center">Reference Number</th>
						<th style="width: 10%;background-color: #CCBA78;" align="center">Confirmed By</th>

					</tr>
					<tr>
						<td>
							<form:input path="clientName" style="width: 230px;height:40px;border: 1px solid ;" maxlengh="250" />
						</td>
						<td>
							<form:input path="phoneNumber" style="width: 230px;height:40px;border: 1px solid ;" maxlengh="250" type="number" />
						</td>

						<td style="width: 25%;" align="center">
							<form:input path="advance" style="width: 230px;height:40px;border: 1px solid ;" maxlengh="250" />
						</td>	

						<td style="width: 25%;" align="center">
							<form:input path="balance" style="width: 230px;height:40px;border: 1px solid ;" maxlength="250"/>
						</td>	
						<td style="width: 25%;" align="center">
							<form:input path="referenceNumber" style="width: 180px;height:40px;border: 1px solid ;" maxlength="250"/>
						</td>	
						<td style="width: 25%;" align="center">
							<form:input path="confirmedBy" style="width: 230px;height:40px;border: 1px solid ;" maxlength="250" />
						</td>	
					</tr>
					<tr>
						<th style="width: 10%;background-color: #CCBA78;" align="center" colspan="6">Action</th>
					</tr>
					<tr>
						<td colspan="4">&nbsp;</td>
						<td>
							<input style="width: 100px; background-color: green" type="submit" value="Generate" />
						</td>
						<td>
							<a href="view_workload_HTL?dealConfirmationId=${DealObject.dealConfirmationId}" ><input type="button" style="width: 100px;background-color: blue;" value="Cancel"></a>
						</td>
					
					</tr>
			</table>
	</form:form>
</body>

<script>
/*
$(document).ready(function () {
    // Handler for .ready() called.
    var ut = document.getElementById('updatehotel'); 
    var nt = document.getElementById('newhotel');
    if (ut != null) { 
    	$('html, body').animate({
            scrollTop: $('#updatehotel').offset().top
        }, 'slow');
    }
    else if (nt != null) {
        $('html, body').animate({
            scrollTop: $('#newhotel').offset().top
        }, 'slow');
    	
    }
    
});
*/

$('#cityName').autocomplete({
		serviceUrl : '${pageContext.request.contextPath}/getCityList',
		paramName : "cityName",
		delimiter : ",",
		onSelect : function(suggestion) {
			cityID = suggestion.data;
			id = cityID;
			jQuery("#cityId").val(cityID);
			$('input[name=departingFrom]').val(id);
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

	/*
	 $('#cityName').autocomplete({
	 serviceUrl: '${pageContext.request.contextPath}/getCityList',
	 paramName: "cityName",
	 delimiter: ",",
	 onSelect: function(suggestion) {
	 cityID = suggestion.data;
	 id=cityID;
	 jQuery("#cityId").val(cityID);
	 $('input[name=departingFrom]').val(id);
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
	 */

	/*

	 $('#hotelName').autocomplete({
	
	 serviceUrl: "${pageContext.request.contextPath}/getCityHotelList?cityId=" + $("#cityId").val(),
	 paramName: "hotelName",
	 delimiter: ",",
	 onSelect: function(suggestion) {
	 hotelId = suggestion.data;
	 id=hotelID;
	 jQuery("#hotelId").val(hotelId);
	 $('input[name=hotelName]').val(id);
	 return false;
	 },
	 transformResult: function(response) {
	 return {
	 suggestions: $.map($.parseJSON(response), function(item) {
	 return { value: item.hotelName, data: item.hotelId };
	 })
	
	 };
	 }
	 });

	 $(document).ready(function() { 
	
	
	 $("#clickme").click(function() { 
	 alert($("#cityId").val()); 
	 }); 

	
	 }) 

	 */
</script>

</html>

