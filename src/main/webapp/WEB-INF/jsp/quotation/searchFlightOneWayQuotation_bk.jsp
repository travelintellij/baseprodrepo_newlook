<!DOCTYPE html>
<html>
<jsp:include page="../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>


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
		<th style="background: #FFC300;color:black;"> Quotation Id</th><td>${QTN_OBJ.quotationId}</td>
		<th style="background: #FFC300;color:black;"> Version Id </th><td>${QTN_OBJ.version}</td>
		
		</tr>
	</table>
</form:form>


<form:form modelAttribute="LEAD_OBJ" action="create_create_lead_quotation">
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<jsp:include page="leadDetailsOpenNavView.jsp" />
	</div>
	<h3>
		<br>
		<font color="red">View Lead Details </font>
	</h3>
	<span style="font-size: 30px; cursor: pointer" onclick="openNav()">&#9776;
		 Quick Lead View</span>
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "35%";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
	</script>
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
</form:form>
<form:form modelAttribute="FLT_SRCH" action="serach_flight_oneway_quotation_results">	
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	
<div class="float-container">

  <div class="float-child-left">
    <div class="green" >
   		<jsp:include page="_quotationServicesMenu.jsp" />
   
    </div>
  </div>
 <div class="float-child-right">
      <div class="gender" align="center">
	         
	          <input type="radio" value="oneway" id="oneway" name="flightMode" data-url="form_view_serach_flight_oneway_quotation?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}" checked/> <label for="oneway" class="radio">One Way</label>
	          <input type="radio" value="return" id="return" name="flightMode" data-url="www.returnflight.com" /> <label for="return" class="radio">Return</label>
	          <input type="radio" value="manual" id="manual" name="flightMode" data-url="form_view_add_manual_flight_quotation?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}" /> <label for="manual" class="radio">Manual</label>
	 </div>	
    <div class="blue">
	
	<table style="width:60%;border-collapse:collapse;border:none;border-spacing:0;background-color:rgba(0, 0, 0, 0);" >
	
	<tr>
		<td><font size="4"><b>Departure</b></font></td><td><font size="4"><b>Destination</b></font></td><td><font size="4"><b>Departure Date</b></font></td>
		<td><font size="4"><b>Departure Time</b></font></td>
	</tr>
	<tr>
		<td>
			<input style="width: 250px;height:40px;" type="text" id="originCity" name="originCity" />
			<form:hidden path = "${FLT_SRCH.segments.origin}" id="origin" value = "0" />
			
		</td>
		<td><input style="width: 250px;height:40px;" type="text" id="destination" /></td>
		<td><input style="height:30px;width:200px;"   type="date" name="preferredDepartureTime" /> </td>
		<td>
			<select id = "preferredDeparture" name="preferredDeparture" style="width: 250px;font-size: 20px;height:40px;" >
				 <option class="service-small" value="Morning">Any Time</option>
				 <option class="service-small" value="Morning">Morning</option>
				 <option class="service-small" value="Morning">Afternoon</option>
				 <option class="service-small" value="Morning">Evening</option>
				 <option class="service-small" value="Morning">Night</option>
			</select>
		</td>
		
	</tr>
	<tr>
		<td><font size="4"><b>Adults</b></font></td><td><font size="4"><b>Children</b></font></td><td><font size="4"><b>Infant</b></font></td><td><font size="4"><b>Cabin Class</b></font></td>
	</tr>
	<tr>
		<td> 
			<form:select path="adultCount" style="width: 250px;font-size: 20px;height:40px;" >  
				<form:options class="service-small" items = "${PAX_COUNT}" />
		    </form:select>  
	  	</td>
		<td>
			<form:select path="childCount" style="width: 250px;font-size: 20px;height:40px;" >  
				<form:options class="service-small" items = "${PAX_COUNT}" />
		    </form:select>
			
		</td>
		<td>
			<form:select path="infantCount" style="width: 250px;font-size: 20px;height:40px;" >  
				<form:options class="service-small" items = "${PAX_COUNT}" />
		    </form:select>
		</td>
		<td>
			<select id = "cabinClass" name="cabinClass" style="width: 250px;font-size: 20px;height:40px;" required>
				 <option class="service-small" value="Morning">Any</option>
				 <option class="service-small" value="Morning">Economy</option>
				 <option class="service-small" value="Morning">Premium Economy</option>
				 <option class="service-small" value="Morning">Business</option>
				 <option class="service-small" value="Morning">First Class</option>
			</select>
		</td>
		
	</tr>
	<tr>
		<td colspan="4">
			<label class="container" style="align:center;">
				<form:checkbox path="directFlight" value="${FLT_SRCH.directFlight}" /> 
					<b>Show Direct Flight Only</b>
				<span class="checkmark"></span>
			</label>
		</td>
		
	</tr>
	<tr>
		<th colspan="4"><input type="submit" name="SearchNow" Value="Search Now" /></th>
	</tr>
	</table>
   
   </div>
   </div>
   </div>
    
    </form:form> 
  
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
	            $('input[name=travelingFrom]').val(id);
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

		$('#destination').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getAirportList',
			paramName: "cityName",
			delimiter: ",",
			onSelect: function(suggestion) {
	            cityID = suggestion.data;
	            id=cityID;
	            jQuery("#destinationId").val(cityID);
	            $('input[name=travelingFrom]').val(id);
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
	
	
	
	</script>
 </body>
  
  </html>
  