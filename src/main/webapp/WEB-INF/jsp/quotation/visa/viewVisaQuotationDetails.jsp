<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>viewVisaQuotationDetails</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
   
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>
<style>


  body::before {
            content: "";
            background-image: url(${pageContext.request.contextPath}/resources/images/revamped/visa.jpg);
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
        
        .autocomplete-suggestions { border: 1px solid #999; background: red;overflow-y:auto}
		.autocomplete-suggestion {padding: 2px 5px;color:white; background: black;overflow-y: auto;overflow-y:auto}
		.autocomplete-selected { background: #F0F0F0;overflow-y:auto} 
		.autocomplete-suggestions strong { font-weight: normal; color:#FABA08;overflow-y:auto}
		.autocomplete-group { padding: 2px 5px;overflow-y:auto}
		.autocomplete-group strong { display: block; border-bottom: 1px solid #000;  background: black ; color:black overflow-y:auto}
		.autocomplete-selected:hover{
		color:black
		}


        
</style>
<body>



<div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>

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

<form:form modelAttribute="QTN_OBJ" action="create_create_lead_quotation">
    <div class="viewVisaQuotationDetails container">
        <div class="viewVisaQuotationDetails_wrapper bs">
            <div class="viewVisaQuotationDetails_wrapper_data">
                <div class="viewVisaQuotationDetails_wrapper_data_line">
                    <div class="viewVisaQuotationDetails_wrapper_data_l1">
                        <label for="">Quotation Id </label>
                        <p>${QTN_OBJ.quotationId}</p>
                    </div>
                    <div class="viewVisaQuotationDetails_wrapper_data_l1">
                        <label for="">Version Id</label>
                        <p>${QTN_OBJ.version}</p>
                    </div>
                </div>
            </div>
        </div>
        </div>
        </form:form>
        
        <div class="viewVisaQuotationDetails_wrapper2 bs">
            <c:if test="${VSA_ACTION ne 'SEARCH_ADD' and VSA_ACTION ne 'ADD_VISA' and VSA_ACTION ne 'EDIT_VISA' and VSA_ACTION ne 'DELETE'}">
    <div>
		<font size="4"> <b>Add Visa to quotation.</b></font>

				<div class="due_today_task_data_btns">
		  			<c:if test="${QTN_OBJ.converted ne true }">
		  				<a href="form_view_search_visa_quotation_form?leadId=${LEAD_OBJ.leadId }&quotationId=${QTN_OBJ.quotationId}">Search & Add Visa</a>
		  			</c:if>
		  			<c:if test="${QTN_OBJ.converted eq true }">
		  				<a>Search & Add Visa</a>
		  			</c:if>
				</div>

		</div>
		</c:if>
		</div>
		
		
		
		<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	
	  
		<c:if test="${VSA_ACTION eq 'SEARCH_ADD' or VSA_ACTION eq 'ADD_VISA'}">
			<jsp:include page="form_view_search_visa_add_quotation.jsp" /> 
		</c:if>
		
				<c:forEach items="${QTN_OBJ.visaVoList}" var="visaQtnObj">
			<c:choose>
			<c:when test="${visaQtnObj.manualVisaQuotationId eq MANUAL_VSA.manualVisaQuotationId  && VSA_ACTION  eq 'EDIT_VISA' }">
					<jsp:include page="form_view_edit_manual_visa_quotation.jsp" />
			</c:when>
			<c:when test="${visaQtnObj.manualVisaQuotationId eq MANUAL_VSA.manualVisaQuotationId  && VSA_ACTION  eq 'DELETE' }">
					<jsp:include page="form_view_delete_manual_visa_quotation.jsp" />
			</c:when>
			<c:otherwise>
			  <div class="form_view_search_visa_add_quotation">
        <div class="form_view_search_visa_add_quotation_wrapper bs" style="margin-top:10px">
            <div class="form_view_search_visa_add_quotation_wrapper_data">
                <div class="form_view_search_visa_add_quotation_wrapper_data_line">
                    <div class="form_view_search_visa_add_quotation_wrapper_data_l1_h" style="height:50px;background:#6082B6;padding:10px">
                        <p>Visa Country</p>
                        <p style="padding-right: 20px;">${visaQtnObj.visaCountry}</p>
                        <p style="padding-left: 80px;">Visa Consulate</p>
                        <p style="padding-right: 20px;">${visaQtnObj.visaConsulate}</p>
                    </div>
                    <div class="vertical-line"></div>
                 
                    <div class="form_view_search_visa_add_quotation_wrapper_data_l1_btns">
                        <div class="due_today_task_data_btns part">
                        <a id="myBtn[${visaQtnObj.visaQuotationEntity.visaId}]" onclick="myStopsDisplay(this)"
                            data-load-url="view_visa_master_details_modal?visaId=${visaQtnObj.visaQuotationEntity.visaId}" data-toggle="modal"
                            data-target="#myModal">View Visa Master Details</a>
                        </div>
                        <div class="due_today_task_data_btns">
                        <a id="myBtn[${visaQtnObj.visaQuotationEntity.visaId}]" onclick="myStopsDisplay(this)"
                            data-load-url="view_visa_documents_details_modal?visaId=${visaQtnObj.visaQuotationEntity.visaId}"
                            data-toggle="modal" data-target="#myModal">View Visa Document Details</a>
                        </div>
                    </div>
                    <div class="form_view_search_visa_add_quotation_wrapper_data_l1 a">
                        <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                            <label for="" class="l-st">Adults</label>
                            <p style="color:gray">${visaQtnObj.adults}</p>
                        </div>
                        <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                            <label for="" class="l-st">Child</label>
                           <p style="color:gray">${visaQtnObj.children}</p>
                        </div>
                        <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                            <label for="" class="l-st">Infants</label>
                            <p style="color:gray">${visaQtnObj.infant}</p>
                        </div>
                        <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                            <label for="" class="l-st">Display Order</label>
                            <p style="color:gray">${visaQtnObj.displayOrder}</p>
                        </div>
                    </div>
                    <div class="form_view_search_visa_add_quotation_wrapper_data_l1_c a">
                        <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                            <label for="" class="l-st">Total Visa Cost (System)</label>
                            <p style="color:gray">${visaQtnObj.systemVisaCost}</p>
                        </div>
                        <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                            <label for="" class="l-st">Total Visa Markup (System)</label>
                            <p style="color:gray">${visaQtnObj.systemVisaMarkup }</p>
                        </div>
                        <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                            <label for="" class="l-st">New Cost (Changed Current)</label>
                           <p style="color:gray">${visaQtnObj.visaCost}</p>
                        </div>
                        <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                            <label for="" class="l-st">Quoted Markup</label>
                            <p style="color:gray">${visaQtnObj.visaMarkup }</p>
                        </div>
                    </div>
                    <div class="form_view_search_visa_add_quotation_wrapper_data_l1_c a" style="margin-bottom: 20px;">
                        <div class="form_view_search_visa_add_quotation_wrapper_data_rem">
                            <label for="" class="l-st">Remarks</label> <br>
                           <p style="color:gray">${visaQtnObj.remarks }</p>
                        </div>
                    </div>
                    <div class="due_today_task_data_btns" style="margin-top: 15px;">
                    <c:if test="${QTN_OBJ.converted ne true }">
                        <a
                            href="form_view_edit_visa_quotation_form?manualVisaQuotationId=${visaQtnObj.manualVisaQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}&visaId=${visaQtnObj.visaQuotationEntity.visaId}">Edit Visa</a>
                        <a
                            href="form_view_delete_manual_visa_quotation?manualVisaQuotationId=${visaQtnObj.manualVisaQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}">Delete Visa</a>
                    </c:if>
                    <c:if test="${QTN_OBJ.converted eq true }">
                        <a><input type="button" style="background-color:lightgray;" value="Edit Visa" /></a>
                        <a><input type="button" style="background-color:lightgray;" value="Delete Visa" /></a>
                    
                    </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
		</c:otherwise>
		</c:choose>
		</c:forEach>
		
	      <div id="myModal" class="modal" style="margin-top:105px;z-index:999;display:none">	
		  <!-- Modal content -->
		  <div class="modal-content">
		    <div class="modal-header">
		      <span class="close">&times;</span>
		      <br><h2 style="text-align:center;">View Visa Master</h2>
		    </div>
		    <div class="modal-body">
		
		
		    </div>
		    <div class="modal-footer">
		      <h3 align="center">Powered by @TravelIntelliJ</h3>
		    </div>
		  </div>
	</div>
		
	

<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];



function myStopsDisplay(clicked) { 
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