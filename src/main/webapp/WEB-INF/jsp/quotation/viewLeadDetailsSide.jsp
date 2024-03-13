<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>

<body> 

 
    <div class="createNewQuotation container">
    
 <div class="createNewQuotation_btn">
        <input type="submit" id="editLead"  name="editLead" value="Edit Lead" class="my-b"/>  
		<a href="view_filter_leads">Search Again</a> 
 </div>
 
 
        <div class="createNewQuotation_wrapper bs">
            <h1 class="page-heading">Create Quotation</h1>
            <form:form modelAttribute="LEAD_OBJ" action="form_view_editlead">
                <form:hidden path="leadId" />
                <div align="center"><b>
                        <font color="green"> ${Success} </font>
                        <font color="red"> ${Error}</font>
                    </b></div>
            <div class="createNewQuotation_wrapper_data">
                <div class="createNewQuotation_wrapper_data_line a"  style="margin-bottom:5px">
                    <div class="createNewQuotation_wrapper_data_l1">
                        <label for="" style="color:black;font-weight:normal">Lead Id</label>
                        <p style="font-weight:800;color:#023e8a">Q-${String.format("%04d",LEAD_OBJ.leadId)}-${LEAD_OBJ.leadSourceShortName }</p>
                    </div>
                    <div class="createNewQuotation_wrapper_data_l1">
                        <label for="" style="color:black;font-weight:normal">Client</label>
                        <p style="font-weight:800;color:#023e8a">${LEAD_OBJ.contactName}</p>
                    </div>
                    <div class="createNewQuotation_wrapper_data_l1">
                        <label for="" style="color:black;font-weight:normal">Source</label>
                        <p style="font-weight:800;color:#023e8a">${LEAD_OBJ.sourceName}</p>
                    </div>
                    <div class="createNewQuotation_wrapper_data_l1">
                        <label for="" style="color:black;font-weight:normal">Destination</label>
                        <p style="font-weight:800;color:#023e8a">${LEAD_OBJ.destinationName}</p>
                    </div>
                </div>
                <div class="createNewQuotation_wrapper_data_line a"  style="margin-bottom:5px">
                    <div class="createNewQuotation_wrapper_data_l1">
                        <label for="" style="color:black;font-weight:normal">Adults</label>
                        <p style="font-weight:800;color:#023e8a">${LEAD_OBJ.adults}</p>
                    </div>
                    <div class="createNewQuotation_wrapper_data_l1">
                        <label for="" style="color:black;font-weight:normal">Children</label>
                        <p style="font-weight:800;color:#023e8a">${LEAD_OBJ.children} (Age ${LEAD_OBJ.childrenAgeInfo} )</p>
                    </div>
                    <div class="createNewQuotation_wrapper_data_l1">
                        <label for="" style="color:black;font-weight:normal">Travel Start Date</label>
                        <p style="font-weight:800;color:#023e8a"><fmt:formatDate value="${LEAD_OBJ.travelStartDate}" pattern="dd-MM-yyyy" /></p>
                    </div>
                    <div class="createNewQuotation_wrapper_data_l1">
                        <label for="" style="color:black;font-weight:normal">Travel End Date</label>
                        <p style="font-weight:800;color:#023e8a"><fmt:formatDate value="${LEAD_OBJ.travelEndDate}" pattern="dd-MM-yyyy" /></p>
                    </div> 
                </div>
                <div class="createNewQuotation_wrapper_data_line a"  style="margin-bottom:5px">
                    <div class="createNewQuotation_wrapper_data_l3">
                        <label for="" style="color:black;font-weight:normal">Lead Source</label>
                        <p style="font-weight:800;color:#023e8a">${LEAD_OBJ.leadSourceName}</p>
                    </div>
                    <div class="createNewQuotation_wrapper_data_l3">
                        <label for="" style="color:black;font-weight:normal">Status</label>
                        <p style="font-weight:800;color:#023e8a">${LEAD_OBJ.statusName}</p>
                    </div>
                </div>
                <p style="color: black;font-weight: normal;text-align: start;">Services Requested</p>
                <div class="createNewQuotation_wrapper_data_line">
                    <div class="createNewQuotation_ser">
                        <div class="createNewQuotation_ser_box">
                            <span for="" style="color:black;font-weight:normal">Package</span>
                        <form:checkbox class="ch_c" path="landPackage" name="landPackage;" disabled="true" style="width:18px;height:18px"/>
                        </div>
                        <div class="createNewQuotation_ser_box">
                            <span for="" style="color:black;font-weight:normal">Flight</span>
                        <form:checkbox class="ch_c" path="flight" name="flight" disabled="true" style="width:18px;height:18px"/>
                        </div>
                        <div class="createNewQuotation_ser_box">
                            <span for="" style="color:black;font-weight:normal">Hotal</span>
                        <form:checkbox class="ch_c" path="hotel" name="hotel" disabled="true" style="width:18px;height:18px"/>
                        </div>
                        <div class="createNewQuotation_ser_box">
                            <span for="" style="color:black;font-weight:normal">Transfers</span>
                            <form:checkbox class="ch_c" path="transfers" name="transfers" disabled="true" style="width:18px;height:18px"/>
                        </div>
                        <div class="createNewQuotation_ser_box">
                            <span for="" style="color:black;font-weight:normal">Sightseeing</span>
                        <form:checkbox class="ch_c" path="sightseeing" name="sightseeing" disabled="true" style="width:18px;height:18px"/>
                        </div>
                        <div class="createNewQuotation_ser_box">
                            <span for="" style="color:black;font-weight:normal">Visa</span>
                        <form:checkbox class="ch_c" path="visa" name="visa" disabled="true" style="width:18px;height:18px"/>
                        </div>
                        <div class="createNewQuotation_ser_box">
                            <span for="" style="color:black;font-weight:normal">Insurance</span>
                            <form:checkbox class="ch_c" path="insurance" name="insurance" disabled="true" style="width:18px;height:18px"/>
                        </div>
                        <div class="createNewQuotation_ser_box">
                            <span for="" style="color:black;font-weight:normal">Cruise</span>
                        <form:checkbox class="ch_c" path="cruise" name="cruise" disabled="true" style="width:18px;height:18px"/>
                        </div>
                        <div class="createNewQuotation_ser_box">
                            <span for="" style="color:black;font-weight:normal">Others</span>
                            <form:checkbox class="ch_c" path="others" name="others" disabled="true" style="width:18px;height:18px"/>
                        </div>
                    </div>
                </div>
                <p style="color:#fb8500;margin-top:10px">(These services are requested by the client for quotation.)</p>
                    </form:form>
            </div>
        </div>
        
        

 
 
 <script>
	
	$(document).ready(function() {
		$('#contactName').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getClientList',
			paramName: "tagName",
			delimiter: ",",
			onSelect: function(suggestion) {
	            cityID = suggestion.data;
	            id=cityID;
	            jQuery("#contactId").val(cityID);
	            $('input[name=contactId]').val(id);
	            return false;
	        },
			transformResult: function(response) {
		        return {
		            suggestions: $.map($.parseJSON(response), function(item) {
		            	return { value: item.tagName, data: item.id };
		            })
		            
		        };
		    }
		});
		
		
		$('#sourceName').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getCityList',
			paramName: "cityName",
			delimiter: ",",
			onSelect: function(suggestion) {
	            cityID = suggestion.data;
	            id=cityID;
	            jQuery("#destinationId").val(cityID);
	            $('input[name=source]').val(id);
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
		
		$('#destinationName').autocomplete({
			serviceUrl: '${pageContext.request.contextPath}/getCityList',
			paramName: "cityName",
			delimiter: ",",
			onSelect: function(suggestion) {
	            cityID = suggestion.data;
	            id=cityID;
	            jQuery("#destinationId").val(cityID);
	            $('input[name=destination]').val(id);
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
	});
	
	
	
	</script>
	
<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];



function myLeadDisplay(clicked) { 
	//alert(clicked); 
	$("#myModal .modal-body").load($(clicked).attr('data-load-url'));
	modal.style.display = "block";
}   
// When the user clicks the button, open the modal 
/*btn.onclick = function() {
	//$("#myModal .modal-body").html('pass your html text here');
	$("#myModal .modal-body").load($(this).attr('data-load-url'));
	modal.style.display = "block";
  
}*/

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
        
</body>

</html>