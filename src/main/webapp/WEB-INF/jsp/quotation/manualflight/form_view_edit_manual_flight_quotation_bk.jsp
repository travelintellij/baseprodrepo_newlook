<!DOCTYPE html>
<html>
<jsp:include page="../../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/css/jquery.datetimepicker.min.css" />" rel="stylesheet">
	<script src="<c:url value="/resources/js/jquery.datetimepicker.full.js" />"></script>

<style>
table {
  width: 100%;
  height: 20px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 3px auto;
  background: white;
  
}

th {
  background: #FF4D00;
  height: 25px;
  width: 15%;
  font-weight: heavy;
  font-size: 20px;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
}
tr {
  border-bottom: 1px solid #cccccc;
}

td {
 // border-right: 1px solid #cccccc;
  width: 15%;
  padding: 10px;
  transition: all 0.2s;
  text-align: left;
     
}
input[type=button], input[type=submit], input[type=reset] {
  background-color: green;
  border: none;
  color: white;
  padding: 10px 20px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}

.sidenav {
	height: 70%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 118;
	left: 0; //
	//background-color: #111;
	background-color: lightblue;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 30px;
	text-align: center;
}

.sidenav a {
	padding: 4px 4px 4px 16px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover {
	color: #f1f1f1;
	
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

.float-container {
    //border: 3px solid #fff;
    padding: 15px;
}

.float-child-left {
    width: 20%;
    float: left;
    padding: 20px;
    //border: 2px solid red;
}

.float-child-right {
    width: 80%;
    float: center;
    //padding: 50px;
    //border: 2px solid red;
}  
  ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
}

li {
  float: left;
}

li a {
  display: block;
  padding: 20px;
  background-color: #dddddd;
}

</style>
<br>
<h2 align="center">View Flight Quotation Details </h2>
<body>
<form:form modelAttribute="QTN_OBJ" action="create_create_lead_quotation">
	<table style="width:45%;margin: auto;">
		<tr>
		<th style="background: #FFC300;color:black;"> Quotation Id </th><td>${QTN_OBJ.quotationId}</td>
		<th style="background: #FFC300;color:black;"> Version Id </th><td>${QTN_OBJ.version}</td>
		
		</tr>
	</table>
</form:form>



<div class="my-ki">
    <!-- ############# quick lead view starts here################## -->
    <form:form modelAttribute="LEAD_OBJ" action="create_create_lead_quotation">
    <div class="sep_quick_lead_view">
        <input type="checkbox" name="" id="" class="ch_quick_lead_view">
        <div class="hamburgur_menu_quick_lead_view">
            <span class="sep_line1"></span>
            <span class="sep_line2"></span>
            <span class="sep_line3"></span>
        </div>
        <h2 style="display:inline-block;font-size:20px;;">Quick lead view</h2>
        <div class="lead_view_sep">
        <jsp:include page="../leadDetailsOpenNavView.jsp" />
        </div>
    </div>
    </form:form>
    <!-- ############# quick lead view ends here################## -->
</div>

<div class="afd">
<jsp:include page="../_quotationServicesMenu.jsp" />
</div>




	
<div class="float-container">

 	<div class="float-child-right">
    	<div class="gender" align="center">
			<input type="radio" value="oneway" id="oneway" name="flightMode" data-url="form_view_serach_flight_oneway_quotation?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}" disabled /> <label for="oneway" class="radio">One Way</label>
	        <input type="radio" value="return" id="return" name="flightMode" data-url="www.returnflight.com" disabled/> <label for="return" class="radio">Return</label>
	        <input type="radio" value="manual" id="manual" name="flightMode" data-url="form_view_add_manual_flight_quotation?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}" checked/> <label for="manual" class="radio">Manual</label>
	 	</div>	
    	<div class="blue">
		<form:form modelAttribute="MANUAL_FLT" action="edit_edit_manual_flight_quotation">	
			
			
			 <form:hidden path = "manualFlightQuotationId"  />
			<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
			<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
			
			
	
		<table style="width:70%;border-collapse:collapse;border:none;border-spacing:0;background-color:rgba(0, 0, 0, 0);" >
			<tr>
				<td colspan="1"><font size="4"><b>Airline</b></font></td>
				<td>
					<div class="select">
						<form:select path="airlineId" required="required" >  
							<option class="service-small" value="" selected>Please Select</option>
							<form:options items = "${AIRLINE_MAP}" class="service-small"/>
						</form:select>  
					</div>
				</td>
				<td><font size="4"><b>Flight No. </b></font></td>
				<td colspan="2"><form:input path="flightNumber"  style="height:30px;width:120px;margin: auto;"/></td>
			</tr>
			<tr>	
				<td><font size="4"><b>Departure</b></font></td>
				<td><font size="4"><b>Arrival</b></font></td>
				<td><font size="4"><b>Departure Details</b></font></td>
				<td><font size="4"><b>Arrival Details</b></font></td>
				<td><font size="4"><b>Duration</b></font></td>
			</tr>
			<tr>	
				<td>
					<font color="red"><form:errors path="originCity" cssClass="error" /></font>
					<form:input path="originCity" style="width: 250px;height:40px;" type="text" id="originCity"  />
					<form:hidden path = "airportCodeOrigin" id="origin" />
				</td>
				<td>
					<font color="red"><form:errors path="destinationCity" cssClass="error" /></font>
					<form:input path="destinationCity" style="width: 250px;height:40px;" type="text" id="destinationCity"  />
					<form:hidden path = "airportCodeDestination" id="origin"  />
				</td>
				<td>
					<input style="height: 30px; width: 180px;" id="departureDate" name="departureDate" value="${localDateTimeFormatToEdit.format(MANUAL_FLT.departureDate)}" required />
				</td>
				<td>
					<input style="height: 30px; width: 180px;" id="arrivalDate" name="arrivalDate" value="${localDateTimeFormatToEdit.format(MANUAL_FLT.arrivalDate)}" required />
				</td>
				<td>
					<form:input path="duration"  style="height:30px;width:120px;margin: auto;"/>
				</td>
			</tr>
			<tr>	
				<td><font size="4"><b>Adults</b></font></td>
				<td><font size="4"><b>Child</b></font></td>
				<td><font size="4"><b>Infants</b></font></td>
				<td><font size="4"><b>Stops</b></font></td>
				<td><font size="4"><b>Travel Class</b></font></td>
			</tr>
			<tr>	
				<td>
				<font color="red"><form:errors path="adultCount" cssClass="error" /></font>
						<form:input path="adultCount" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
				<td><form:input path="childCount" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
				<td><form:input path="infantCount" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
				
				<td><font color="red"><form:errors path="noOfStops" cssClass="error" /></font>
				<form:input path="noOfStops" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
				<td>
					<div class="select">
						<form:select path="cabinClass" required="required" >  
							<option class="service-small" value="0" selected>Please Select</option>
							<form:options items = "${CABIN_CLASS}" class="service-small"/>
						</form:select>  
					</div>
				</td>
			</tr>
			<tr>	
				<td colspan="2"><font size="4"><b>Total Flight Cost</b></font></td>
				<td colspan="2"><font size="4"><b>Total Flight Markup</b></font></td>
				<td><font size="4"><b>Display Order</b></font></td>
			</tr>
			<tr>	
				<td colspan="2"><form:input path="flightCost" type="number" min="0" style="height:30px;width:150px;margin: auto;"/></td> 
				<td colspan="2"><form:input path="flightMarkup" type="number" min="0" style="height:30px;width:150px;margin: auto;"/></td>
				<td><form:input path="displayOrder" type="number" min="0" style="height:30px;width:50px;margin: auto;"/></td>
			</tr>
			<tr>
				<th colspan="5">
					<input type="submit" name="editFlight" id="editFlight" Value="Update Flight" />
					<a href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>
				</th>
			</tr>
			</table>
		</form:form>
   	</div>


   </div>
   </div>

<script>
$(document).ready(function() {	
	$('#originCity').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getAirportList',
			paramName: "cityName",
			delimiter: ",",
			onSelect: function(suggestion) {
	            cityID = suggestion.data;
	            id=cityID;
	            jQuery("#destinationId").val(cityID);
	            $('input[name=airportCodeOrigin]').val(id);
	            return false;
	        },
			transformResult: function(response) {
		        return {
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	return { value: item.cityName, data: item.airportId };
		            })
		            
		        };
		    }
		});

		$('#destinationCity').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getAirportList',
			paramName: "cityName",
			delimiter: ",",
			onSelect: function(suggestion) {
	            cityID = suggestion.data;
	            id=cityID;
	            jQuery("#destinationId").val(cityID);
	            $('input[name=airportCodeDestination]').val(id);
	            return false;
	        },
			transformResult: function(response) {
		        return {
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	return { value: item.cityName, data: item.airportId };
		            })
		            
		        };
		    }
		});

		//$('.flightMode').change(function(e) {
		//$('#flightMode').change(function(e) {
		$('input[name="flightMode"]').change(function() {
			//alert($('form input[type=radio]:checked').val());
			var url = $(this).attr('data-url');
			window.location.replace(url);
			//const $this = $(this), $link = $("#url");
			//$link.html($this.val());
			//$link.attr("href", $this.attr("data-url"));
			//alert($this.attr("data-url"))
			});
				
	});

	
	/*$("input[type=radio][name=flightMode]").change(function (one,two) {
	
	    if ($(this).val() == "oneway") {
		    alert(one);
	    	//window.location.replace("form_view_serach_flight_oneway_quotation?leadId=&quotationId=");
	    } else {
	        alert('false');
	    }
	});
	*/
	</script>
	<script>

$(document).ready(function(){
	$("#addFlight").on('click', function () {
	   var getValue=$("#departureDate").val();
	   $('input[name=departureDate]').val(getValue);
	 });

	 
	});
	$("#departureDate").datetimepicker();
	$("#arrivalDate").datetimepicker();


</script>

</body>
</html>
  