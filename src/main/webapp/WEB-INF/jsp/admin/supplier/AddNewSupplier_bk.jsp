<!doctype html>
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<html>
<head>
<link href="resources/core/magicsuggest.css" rel="stylesheet" type="text/css">
<style>
.sscontainer { max-width: 550px; }
</style>
</head>
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script	src="<c:url value="/resources/core/magicsuggest.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<style>
table {
	  width: 100%;
	  border-collapse: collapse;
	  border: 1px solid #38678f;
	  //margin: 5px auto;
	  background: white;
	}
	
	th {
	  background: #D33F14;
	  width: 50%;
	  font-weight: heavy;
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
	  border-right: 1px solid #cccccc;
	  padding: 5px;
	  transition: all 0.2s;
	  text-align: center;
	}
	
	.heavyTable {
	  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
	  animation: float 5s infinite;
	}
	input[type="radio"] {
		display: inline-block;
		opacity: 1;
		width: 1em;
		z-index: -1;
	}

select {
	appearance: none;
	outline: 0;
	background: lightblue;
	background-image: none;
	width: 80%;
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


input[type=button], input[type=submit], input[type=reset] {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}

.sscontainer {
z-index: 5;
  position: absolute;
  width: 750px;
  border: 1px dashed #900;
  background-color: #fdd;  
  max-width: 570px; 
}
	</style>
</head>
<br>
<h2 align="center">Add New Supplier</h2>
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<body style="background-color: creamwhite;">
	<form:form method="post" action="create_create_admin_supplier"	modelAttribute="SUPPLIER_OBJ" >
	<table>
		<tr>
			<td  style="width:30%;">
				<table>
				<tr height="50px;">
					<th>Supplier Name</th>
					<td><form:input path="supplierName" name="supplierName" style="height:30px;width:350px;margin: auto;" required="required"/>
					
					<font color="red"><form:errors path="supplierName" cssClass="error" /></font></td>
				</tr>
				<tr>
					<th>Address</th>
					<td><form:textarea path = "address" rows="3" cols="45"  maxlength="240"/><br>
					<font color="red"><form:errors path="address" cssClass="error" /></font></td>
				</tr>
				<tr height="50px;">
					<th>City</th>
					<td><form:input path="cityName" name="cityName" style="height:30px;width:250px;margin: auto;"/>
					<form:hidden path = "cityId" /><br>
					<font color="red"> <form:errors path="cityName" cssClass="error" /></font> 
					
				</tr>
				<tr height="50px;">
					<th>Country</th>
					<td><form:input path="countryName" style="height:30px;width:250px;margin: auto;"/><br>
					<form:hidden path = "countryId" />
					<font color="red"> <form:errors path="countryName" cssClass="error" /></font>
					</td>
				</tr>
				<tr height="50px;">
					<th>Email</th>
					<td><form:input type="email" path="email" style="height:30px;width:250px;margin: auto;" />
					<br>
					<font color="red"><form:errors path="email" cssClass="error" /></font></td>
				</tr>
				<tr height="50px;">
					<th>Mobile</th>
					<td>
					<form:input type="number" path="mobile" style="height:30px;width:250px;margin: auto;"  />
					<br>
					<font color="red"><form:errors path="mobile" cssClass="error" /></font></td>
				</tr>
				<tr height="50px;">
					<th>Phone</th>
					<td>
					
					<form:input type="number" path="phone" style="height:30px;width:250px;margin: auto;"  />
					<br>
					<font color="red"><form:errors path="phone" cssClass="error" /></font></td>
				</tr>
				<tr><td colspan="2">&nbsp;</td></tr>
				</table>
			</td>
			<td  style="width:40%;">
				<table>
				<tr>
					<th>Company Details</th>
					<td><form:textarea path = "companyDetails" rows="3" cols="45"  maxlength="240"/>
					<br>
					<font color="red"><form:errors path="companyDetails" cssClass="error" /></font></td>
				</tr>
				<tr>
					<th>Referred By</th>
					<td><form:input path="referredBy" name="referredBy" style="height:30px;width:250px;margin: auto;"/>
					<br>
					<font color="red"><form:errors path="referredBy" cssClass="error" /></font></td>
				</tr>
				<tr>
					<th>GST Details</th>
					<td><form:input path="gstDetails" name="gstDetails" style="height:30px;width:250px;margin: auto;" class="contact"/>
					<br>
					<font color="red"><form:errors path="gstDetails" cssClass="error" /></font></td>
				</tr>
				<tr>
					<th>Bank Details</th>
					<td><form:textarea path = "bankDetails" rows="3" cols="45"  maxlength="240"/>
					<br>
					<font color="red"><form:errors path="bankDetails" cssClass="error" /></font></td>
				</tr>
			
				<tr>
					<th>Remarks</th>
					<td><form:textarea path = "remarks" rows="3" cols="45"  maxlength="240"/>
					<br>
					<font color="red"><form:errors path="remarks" cssClass="error" /></font></td>
				</tr>
				<tr><td colspan="2">
					<font color="red"> <form:errors path="minOneserviceError" cssClass="error" /></font>
					<table><caption> Service Offerred</caption>
					<tr>
						<th style="width:20%;">Flight</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="flight" /><span class="checkmark"></span></label></td>
						<th style="width:20%;">Hotel</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="hotel" /><span class="checkmark"></span></label></td>
						<th style="width:20%;">Transfers</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="transfers" /><span class="checkmark"></span></label></td>
					</tr>
					<tr>
						<th style="width:20%;">SightSeeing</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="sightseeing" /><span class="checkmark"></span></label></td>
						<th style="width:20%;">Visa</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="visa" /><span class="checkmark"></span></label></td>
						<th style="width:20%;">Insurance</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="insurance" /><span class="checkmark"></span></label></td>
					</tr>
					<tr>
						<th style="width:40%;" colspan="2">Package </th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="landPackage" /><span class="checkmark"></span></label></td>
						
						<th style="width:20%;">Others</th><td style="width:13%;" ><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="others" /><span class="checkmark"></span></label></td>
					</tr>
					</table>
				</td></tr>
				</table>
				</td>
				
				<td  style="width:60%;"> 
				<table>
				<tr><td colspan="2"> Please mention all destinations taken care by supplier</td></tr>
				<tr><th colspan="2">
					Select Destination Services
				</th></tr>
				
				<tr><td colspan="2">
					<font color="red"><form:errors path="destinationNames" cssClass="error" /></font>
					<div id="sscontainer" class="sscontainer">
					  <!--  <div id="operatingDestinations" name="operatingDestinations" class="form-control"></div> -->
					<input type="text" id="destinationHandling" name="destinationHandling" class="form-control" />
					<form:hidden path = "destinationNames" />
					<form:hidden path = "operatingDestinations" />
					</div>
					
					
				</td></tr>
				<tr><td colspan="2"> &nbsp;</td></tr>
				<tr><td colspan="2"> &nbsp;</td></tr>
				<tr><td colspan="2"> &nbsp;</td></tr>
				<tr><td colspan="2"> please mark consolidator if supplier is handling all above destination as consolidator.</td></tr>
				<tr ><th style="width:30%">Consolidator</th><td style="width:30%"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="consolidator" /><span class="checkmark"></span></label></td></tr>
				<tr><td colspan="2"> &nbsp;</td></tr>
				</table>
				<br>
				<table>
					
					
					
					<tr><th colspan="2" style="background-color:steelblue;">Supplier Preferences</th></tr>
					
					<tr><th style="background-color:steelblue;">Preferred Supplier </th> 
					<td>
						<div class="select" style="height:30px;">
							<form:select path="supplierRating">  
			      				<form:options items = "${SUPPLIER_RATING_MAP}" />
		        			</form:select>  
				 		</div>
						(Scale 1 to 5)
					</td>
					</tr>
					
					<tr>
						<th style="background-color:steelblue;"> Negotiates </th>
						<td>
							<div class="select">
								<form:select path="negotiates">  
				      				<form:options items = "${SUPPLIER_NEGOTIATES}" />
			        			</form:select>  
      						</div>
						</td>
						</tr>
				</table>
				</td>
			</tr>
				 
			<tr>
				<td colspan="3" style="text-align: center;"><input type="submit" value="Add Supplier" style="background-color: green;">
						<a href="view_form_admin_search_client"><input type="button" style="width: 140px;background-color: blue;" value="Search Supplier"></a> 
				</td>
			</tr>
		</table>
</form:form>


<script type="text/javascript" defer>

$(function() {
        var ms = $('#destinationHandling').magicSuggest({
        	data: '${pageContext.request.contextPath}/getDestinationList',
        	valueField: 'id',
        	displayField: 'tagName',
        	//name: 'operatingDestinations',
        	maxDropHeight: 145,
        	maxSuggestions:10,
        	resultAsString: true
        });
        //ms.addToSelection([{"id":4,"tagName":"Mumbai"},{"id":542,"tagName":"New Delhi"}]);
		
	$(ms).on('load', function(){
        if(this._dataSet === undefined){
       		this._dataSet = true;
       		ms.addToSelection(${SUPPLIER_OBJ.destinationNames});
            ms.setDataUrlParams({});
        }
    });
		
		       	
        $(ms).on('selectionchange', function(e,m){
        	 $("#operatingDestinations").val(ms.getValue());
        });
 });



$('#cityName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCityList',
	paramName: "cityName",
	delimiter: ",",
	onSelect: function(suggestion) {
        cityID = suggestion.data;
        id=cityID;
        jQuery("#destinationId").val(cityID);
        $('input[name=cityId]').val(id);
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

$('#countryName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCountryList',
	paramName: "countryName",
	delimiter: ",",
	onSelect: function(suggestion) {
        cityID = suggestion.data;
        id=cityID;
        jQuery("#countryId").val(cityID);
        $('input[name=countryId]').val(id);
        return false;
    },
	transformResult: function(response) {
        return {
            suggestions: $.map($.parseJSON(response), function(item) {
            	return { value: item.countryName, data: item.destinationId };
            })
            
        };
    }
});

</script>

	
</body>
</html>
