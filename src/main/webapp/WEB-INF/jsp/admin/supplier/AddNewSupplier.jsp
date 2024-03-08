<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Supplier</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    
    
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script	src="<c:url value="/resources/core/magicsuggest.js" />"></script>

<link href="resources/core/magicsuggest.css" rel="stylesheet" type="text/css">
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

	<script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
</head>
<style>
.autocomplete-suggestions { border: 1px solid #999; background: red;overflow-y:auto}
		.autocomplete-suggestion {padding: 2px 5px;color:white; background: black;overflow-y: auto;overflow-y:auto}
		.autocomplete-selected { background: #F0F0F0;overflow-y:auto} 
		.autocomplete-suggestions strong { font-weight: normal; color:#FABA08;overflow-y:auto}
		.autocomplete-group { padding: 2px 5px;overflow-y:auto}
		.autocomplete-group strong { display: block; border-bottom: 1px solid #000;  background: black ; color:black overflow-y:auto}
		.autocomplete-selected:hover{
		color:black
		}
		    body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/addNewSupp.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            background-attachment: fixed;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0.5; /* Adjust the opacity value as needed (0.0 to 1.0) */
            z-index: -1;
        }

        
</style>
<body>
   <div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>
    <div class="container">
        <div class="add-new-supplier-wrapper bs">
            <h1 class="ansupplier-heading" style="font-size: 30px;
    color: #FFBA08;
    margin-bottom: 10px;">Add New Supplier</h1>
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <form:form method="post" action="create_create_admin_supplier" modelAttribute="SUPPLIER_OBJ">
                <div class="ans-fir-li">
                    <div class="ansd1">
                        <label for="supp-name" style="font-weight:600">Supplier Name</label><br>
                        <form:input path="supplierName" name="supplierName" required="required" id="supp-name" />
                        <font color="red">
                            <form:errors path="supplierName" cssClass="error" />
                        </font>
                    </div>
                    
                    
                     <div class="ansd1">
                        <label for="City" style="font-weight:600">City</label><br>
                        <form:input path="cityName" name="cityName" style="height:30px;width:250px;margin: auto;" id="cityName" />
                        <form:hidden path="cityId" /><br>
                        <font color="red">
                            <form:errors path="cityName" cssClass="error" />
                        </font>
                    </div>
                    
                    
                     <div class="ansd1">
                        <label for="con" style="font-weight:600">Country</label><br>
                        <form:input path="countryName" style="height:30px;width:250px;margin: auto;" id="countryName" />
                        <form:hidden path="countryId" />
                        <font color="red">
                            <form:errors path="countryName" cssClass="error" />
                        </font>
                    </div>
                   
                     <div class="ansd1">
                        <label for="mob" style="font-weight:600">Mobile</label><br>
                        <form:input type="number" path="mobile" style="height:30px;width:250px;margin: auto;"
                            id="mob" />
                        <font color="red">
                            <form:errors path="mobile" cssClass="error" />
                        </font>
                    </div>
                   
                    
                </div>
                <div class="ans-sc-li">
                    <div class="ansd1">
                        <label for="Referred-by" style="font-weight:600">Referred By</label><br>
                        <form:input path="referredBy" name="referredBy" style="height:30px;width:250px;margin: auto;" id="Referred-by" />
                        <font color="red">
                            <form:errors path="referredBy" cssClass="error" />
                        </font>
                    </div>
                   
                    <div class="ansd1">
                        <label for="mail" style="font-weight:600">Email</label><br>
                        <form:input type="email" path="email" style="height:30px;width:250px;margin: auto;" id="mail" />
                        <font color="red">
                            <form:errors path="email" cssClass="error" />
                        </font>
                    </div>
                   
                    <div class="ansd1">
                        <label for="Phone" style="font-weight:600">Phone</label><br>
                        <form:input type="number" path="phone" style="height:30px;width:250px;margin: auto;"
                            id="Phone" />
                        <font color="red">
                            <form:errors path="phone" cssClass="error" />
                        </font>
                    </div>
                </div>
                
               <div class="ans-last-sec" style="text-align:start">
                        <p class="ans-heading" style="text-align:start;font-weight:600" >Select Destinations Services</p>
                     <font color="red"><form:errors path="destinationNames" cssClass="error" /></font>
					<div id="sscontainer" class="sscontainer">
					<form:hidden path = "destinationNames" color="white"/>
					<form:hidden path = "operatingDestinations"  color="white"/>
					<input type="text" id="destinationHandling" name="destinationHandling" class="form-control"  style="width:1190px;border:1px solid black"/>
					</div>
                    </div>
                
                
                
                <div class="ans-thir-li">
                    <div class="ansd1-rem ans-comDel">
                        <label for="cd" style="font-weight:600">Company Details</label><br>
                        <form:textarea path="companyDetails" rows="1" cols="50" maxlength="240" />
                        <font color="red">
                            <form:errors path="companyDetails" cssClass="error" />
                        </font>
                    </div>
                    <div class="ansd1 ans-gst">
                        <label for="GST-Details" style="font-weight:600">GST Details</label><br>
                        <form:input path="gstDetails" name="gstDetails" style="height:30px;width:250px;margin: auto;"
                            class="contact" id="GST-Details" />
                        <font color="red">
                            <form:errors path="gstDetails" cssClass="error" />
                        </font>
                    </div>
                    <div class="ansd1-rem">
                        <label for="Address" style="font-weight:600">Address</label><br>
                        <form:textarea path="address" rows="2" cols="50" maxlength="240" />
                        <font color="red">
                            <form:errors path="address" cssClass="error" />
                        </font>
                    </div>
                </div>
                <div class="ans-for-li">
                    <div class="ansd1-rem">
                        <label for="cd" style="font-weight:600">Bank Details</label><br>
                        <form:textarea path="bankDetails" rows="2" cols="50" maxlength="240" />
                        <font color="red">
                            <form:errors path="bankDetails" cssClass="error" />
                        </font>
                    </div>
                    <div class="ansd1-rem">
                        <label for="Address" style="font-weight:600">Remarks</label><br>
                        <form:textarea path="remarks" rows="2" cols="50" maxlength="240" />
                        <font color="red">
                            <form:errors path="remarks" cssClass="error" />
                        </font>
                    </div>
                </div>
                <div class="ans-5-li">
                <div class="ans-left-sec"> <form:errors path="minOneserviceError" cssClass="error" />
                    </font>
                    <h3 style="color: blue;font-weight: bold;margin-bottom: 5px;margin-top:10px; font-weight:600">Services Offered</h3>
                    <div class="inside-services">
                        <div class="ansd1-ser">
                        <form:checkbox path="flight" id="flight" />
                            <label for="flight" class="flight-lab f" style="font-weight:600">Flight</label>
                            
                        </div>
                        <div class="ansd1-ser">
                           <form:checkbox path="hotel" id="Hotal" />
                            <label for="Hotal" class="h" style="font-weight:600">Hotal</label>
                         
                        </div>
                        <div class="ansd1-ser">
                        <form:checkbox path="transfers" id="Transfers" />
                            <label for="Transfers" class="t" style="font-weight:600">Transfers</label>
                            
                        </div>
                        <div class="ansd1-ser">
                          <form:checkbox path="sightseeing" id="Signtseeing" />
                            <label for="Signtseeing" class="s" style="font-weight:600">Signtseeing</label>
                          
                        </div>
                        <div class="ansd1-ser">
                        <form:checkbox path="visa" id="Visa" />
                            <label for="Visa" class="v" style="font-weight:600">Visa</label>
                            
                        </div>
                        <div class="ansd1-ser">
                         <form:checkbox path="insurance" id="Insurence" />
                            <label for="Insurence" class="i" style="font-weight:600">Insurance</label>
                           
                        </div>
                        <div class="ansd1-ser">
                          <form:checkbox path="landPackage" id="Package" />
                            <label for="Package" class="p" style="font-weight:600">Package</label>
                          
                        </div>
                        <div class="ansd1-ser">
                         <form:checkbox path="others" id="Others" style="width:18px;height:18px"/>
                            <label for="Others" class="o" style="font-weight:600">Others</label>
                        </div>

                    </div>
                     <div class="ans-last-sec" style="margin: 10px 0;">
                        <h3 class="ans-heading" style="color: #FFBA08;font-weight: normal;margin-bottom: 5px;"></h3>
                            <div class="ans-cons">
                             <label for="" style="margin-right:5px;font-weight:600" >Consolidator</label>
                        <form:checkbox path="consolidator" style="width: 18px;height: 18px;margin-right:8px;" /> 
                        <span title="please mark consolidator if supplier is handling all above 
                        destination as consolidator"><i class="fa-solid fa-question" style="color:blue;"></i></span>
                        </div>
                       
                    </div>
                    </div>
                    <div class="ans-right-sec">
                     <div class="ans-6-li">
                  
                   
                </div>
                <div class="ans-7-li">
                    <h3 style="font-weight: bold;color: blue; margin-top:20px;margin-bottom:9px">Supplier Preferences</h3>
                    <div class="supp-sec">
                        <div class="supp-pre-sec" style="margin-right: 30px;">
                            <label for="" style="font-weight:600">Preferred Supplier</label>
                            <form:select path="supplierRating">
                                <form:options items="${SUPPLIER_RATING_MAP}" />
                            </form:select>
                            <p style="color: blue; margin-left: -70px;">(Scale 1 to 5)</p>
                        </div>
                        <div class="supp-pre-sec">
                            <label for="" style="font-weight:600">Negotiates</label>
                            <form:select path="negotiates">
                                <form:options items="${SUPPLIER_NEGOTIATES}" />
                            </form:select>
                        </div>
                    </div>
                </div></div>
                   
                </div>
               
                <div class="ans-btns">
                    <input type="submit" value="Add Supplier" style="border:none;outline:none">
                    <a href="view_form_admin_search_client">Search Supplier</a>
                </div>
        </div>
    </div>
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