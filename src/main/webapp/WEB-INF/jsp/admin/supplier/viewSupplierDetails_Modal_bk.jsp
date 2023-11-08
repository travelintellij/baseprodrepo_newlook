<!doctype html>
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

<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<style>

	</style>
</head>
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
					<th style="background: #8433FF;width:50%;">Supplier Id</th>
					<td>${SUPPLIER_OBJ.supplierId}</td>
				</tr>
				<tr height="50px">
					<th style="background: #8433FF;width:50%;">Supplier Name</th>
					<td>${SUPPLIER_OBJ.supplierName}</td>
				</tr>
				<tr height="50px">
					<th style="background: #8433FF;width:50%;">Address</th>
					<td><pre>${SUPPLIER_OBJ.address}</pre> </td>
				</tr>
				<tr height="50px">
					<th style="background: #8433FF;width:50%;">City</th>
					<td>${SUPPLIER_OBJ.cityName}</td>
				</tr>
				<tr height="50px">
					<th style="background: #8433FF;width:50%;">Country</th>
					<td>${SUPPLIER_OBJ.countryName}</td>
				</tr>
				<tr height="50px">
					<th style="background: #8433FF;width:50%;">Email</th>
					<td>${SUPPLIER_OBJ.email}</td>
				</tr>
				<tr height="50px">
					<th style="background: #8433FF;width:50%;">Mobile</th>
					<td>${SUPPLIER_OBJ.mobile}</td>
				</tr>
				<tr height="50px">
					<th style="background: #8433FF;width:50%;">Phone</th>
					<td>${SUPPLIER_OBJ.phone}</td>
				</tr>
				</table>
			</td>
			<td  style="width:40%;">
				<table>
				<tr height="60px;">
					<th style="background: #8433FF;width:50%;">Company Details</th>
					<td><pre>${SUPPLIER_OBJ.companyDetails}</pre> </td>
				</tr>
				<tr height="50px">
					<th style="background: #8433FF;width:50%;">Referred By</th>
					<td>${SUPPLIER_OBJ.referredBy}</td>
				</tr>
				<tr height="50px">
					<th style="background: #8433FF;width:50%;">GST Details</th>
					<td>${SUPPLIER_OBJ.gstDetails}</td>
				</tr>
				<tr height="50px">
					<th style="background: #8433FF;width:50%;">Bank Details</th>
					<td><pre>${SUPPLIER_OBJ.bankDetails}</pre> </td>
				</tr>
			
				<tr height="50px">
					<th style="background: #8433FF;width:50%;">Remarks</th>
					<td><pre>${SUPPLIER_OBJ.remarks}</pre> </td>
				</tr>
				<tr ><td colspan="2">
					<table><caption> Service Offerred</caption>
					<tr>
						<th style="background: #8433FF;width:20%;">Flight</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="flight" disabled="true"/><span class="checkmark"></span></label></td>
						<th style="background: #8433FF;width:20%;">Hotel</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="hotel" disabled="true"/><span class="checkmark"></span></label></td>
						<th style="background: #8433FF;width:20%;">Transfers</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="transfers" disabled="true"/><span class="checkmark"></span></label></td>
					</tr>
					<tr>
						<th style="background: #8433FF;width:20%;">SightSeeing</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="sightseeing" disabled="true" /><span class="checkmark"></span></label></td>
						<th style="background: #8433FF;width:20%;">Visa</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="visa" disabled="true" /><span class="checkmark"></span></label></td>
						<th style="background: #8433FF;width:20%;">Insurance</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="insurance" disabled="true"/><span class="checkmark"></span></label></td>
					</tr>
					<tr>
						<th style="background: #8433FF;width:20%;">Package</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="landPackage" disabled="true"/><span class="checkmark"></span></label></td>
						<th style="background: #8433FF;width:20%;">Cruise</th><td style="width:13%;"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="cruise" disabled="true"/><span class="checkmark"></span></label></td>
						<th style="background: #8433FF;width:20%;">Others</th><td style="width:13%;" colspan=""><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="others" disabled="true"/><span class="checkmark"></span></label></td>
						<td>&nbsp;</td>
					</tr>
					</table>
				</td></tr>
				</table>
				</td>
				
				<td  style="width:30%;"> 
				<table>
				
				<tr><th style="background: #8433FF;width:50%;" colspan="2">
					Following Destinations are supported.
				</th></tr>
				
				<tr><td colspan="2">
					<c:forEach items="${SUPPLIER_OBJ.destinations}" var="destination">
						${destination.cityName},
					</c:forEach>
					
				</td></tr>
				
				<tr ><td colspan="2"> &nbsp;</td></tr>
				<tr ><th style="width:30%;background: #8433FF;">Consolidator</th><td style="width:30%"><label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="consolidator" disabled="true"/><span class="checkmark"></span></label></td></tr>
				<tr><td colspan="2" style="background-color:light-blue;"> &nbsp;</td></tr>
				<tr><td colspan="2" style="background-color:light-blue;"> &nbsp;</td></tr>
				<tr><td colspan="2"> &nbsp;</td></tr>
				</table>
				<br>
				<table>
					<tr height="40px"><th style="background: #8433FF;width:50%;" colspan="2" >Supplier Preferences</th></tr>
					
					<tr height="40px"><th style="background: #8433FF;width:50%;">Preferred Supplier </th> 
					<td>
						${SUPPLIER_OBJ.supplierRating} Star
						(Scale 1 to 5)
					</td>
					</tr>
					
					<tr height="40px">
						<th style="background: #8433FF;width:50%;"> Negotiates </th>
						<td>
							${SUPPLIER_OBJ.negotiates}
						</td>
						</tr>
				</table>
				</td>
			</tr>
			<tr>
				<td colspan="3" style="text-align: center;"><input type="submit" value="Edit Supplier" style="background-color: green;">
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
