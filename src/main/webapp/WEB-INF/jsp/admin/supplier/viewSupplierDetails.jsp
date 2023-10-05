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
	  background: #8433FF;
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
<h2 align="center">View Supplier Details <font color="#8433FF">(Supplier Id : ${SUPPLIER_OBJ.supplierId})</font></h2><br>
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<body style="background-color: creamwhite;">
	<form:form method="post" action="form_view_editsupplier" modelAttribute="SUPPLIER_OBJ" >
	<form:hidden path = "supplierId" />
	<form:hidden path = "destinationNames" />
	<form:hidden path = "operatingDestinations" />
	 
	<table>
		<tr>
			<td  style="width:30%;">
				<table>
				<tr height="50px">
					<th>Supplier Name</th>
					<td>${SUPPLIER_OBJ.supplierName}</td>
				</tr>
				<tr height="50px">
					<th>Address</th>
					<td><pre>${SUPPLIER_OBJ.address}</pre> </td>
				</tr>
				<tr height="50px">
					<th>City</th>
					<td>${SUPPLIER_OBJ.cityName}</td>
				</tr>
				<tr height="50px">
					<th>Country</th>
					<td>${SUPPLIER_OBJ.countryName}</td>
				</tr>
				<tr height="50px">
					<th>Email</th>
					<td>${SUPPLIER_OBJ.email}</td>
				</tr>
				<tr height="50px">
					<th>Mobile</th>
					<td>${SUPPLIER_OBJ.mobile}</td>
				</tr>
				<tr height="50px">
					<th>Phone</th>
					<td>${SUPPLIER_OBJ.phone}</td>
				</tr>
				<tr><td colspan="2">&nbsp;</td></tr>
				</table>
			</td>
			<td  style="width:40%;">
				<table>
				<tr height="60px;">
					<th>Company Details</th>
					<td><pre>${SUPPLIER_OBJ.companyDetails}</pre> </td>
				</tr>
				<tr height="50px">
					<th>Referred By</th>
					<td>${SUPPLIER_OBJ.referredBy}</td>
				</tr>
				<tr height="50px">
					<th>GST Details</th>
					<td>${SUPPLIER_OBJ.gstDetails}</td>
				</tr>
				<tr height="50px">
					<th>Bank Details</th>
					<td><pre>${SUPPLIER_OBJ.bankDetails}</pre> </td>
				</tr>
			
				<tr height="50px">
					<th>Remarks</th>
					<td><pre>${SUPPLIER_OBJ.remarks}</pre> </td>
				</tr>
				<tr ><td colspan="2">
					<table><caption> Service Offerred</caption>
					<tr>
						<th style="width:20%;">Flight</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="flight" disabled="true"/><span class="checkmark"></span></label></td>
						<th style="width:20%;">Hotel</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="hotel" disabled="true"/><span class="checkmark"></span></label></td>
						<th style="width:20%;">Transfers</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="transfers" disabled="true"/><span class="checkmark"></span></label></td>
					</tr>
					<tr>
						<th style="width:20%;">SightSeeing</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="sightseeing" disabled="true" /><span class="checkmark"></span></label></td>
						<th style="width:20%;">Visa</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="visa" disabled="true" /><span class="checkmark"></span></label></td>
						<th style="width:20%;">Insurance</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="insurance" disabled="true"/><span class="checkmark"></span></label></td>
					</tr>
					<tr>
						<th style="width:20%;">Package</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="landPackage" disabled="true"/><span class="checkmark"></span></label></td>
						<th style="width:20%;">Cruise</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="cruise" disabled="true"/><span class="checkmark"></span></label></td>
						<th style="width:20%;">Others</th><td style="width:13%;" ><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="others" disabled="true"/><span class="checkmark"></span></label></td>
					</tr>
					</table>
				</td></tr>
				</table>
				</td>
				
				<td  style="width:60%;"> 
				<table>
				<tr ><td colspan="2"> &nbsp;</td></tr>
				<tr><th colspan="2">
					Following Destinations are supported.
				</th></tr>
				
				<tr><td colspan="2">
					<c:forEach items="${SUPPLIER_OBJ.destinations}" var="destination">
						${destination.cityName},
					</c:forEach>
					
				</td></tr>
				<tr><td colspan="2"> &nbsp;</td></tr>
				<tr><td colspan="2"> &nbsp;</td></tr>
				<tr><td colspan="2"> &nbsp;</td></tr>
				<tr><td colspan="2"> Supplier is handling all above destination as consolidator.</td></tr>
				<tr ><th style="width:30%">Consolidator</th><td style="width:30%"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="consolidator" disabled="true"/><span class="checkmark"></span></label></td></tr>
				<tr><td colspan="2"> &nbsp;</td></tr>
				</table>
				<br>
				<table>
					<tr height="40px"><th colspan="2" >Supplier Preferences</th></tr>
					
					<tr height="40px"><th>Preferred Supplier </th> 
					<td>
						${SUPPLIER_OBJ.supplierRating} Star
						(Scale 1 to 5)
					</td>
					</tr>
					
					<tr height="40px">
						<th> Negotiates </th>
						<td>
							${SUPPLIER_OBJ.negotiates}
						</td>
						</tr>
				</table>
				</td>
			</tr>
				 
			<tr>
				<td colspan="3" style="text-align: center;"><input type="submit" value="Edit Supplier" style="background-color: green;">
						
						<a href="view_form_admin_search_supplier"><input type="button" style="width: 160px;background-color: blue;" value="Search Supplier"></a>
						<a href="view_supplier_contacts_listing?supplierId=${SUPPLIER_OBJ.supplierId}"><input type="button" style="width: 160px;background-color: blue;" value="Contacts Listing"></a> 
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
