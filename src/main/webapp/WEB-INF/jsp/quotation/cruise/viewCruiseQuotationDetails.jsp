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
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
</head>
<style>

  body::before {
            content: "";
            background-image:   url(${pageContext.request.contextPath}/resources/images/revamped/cruise.jpg);
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

    <!-- #################### menu starts ######################## -->
    <div class="afd">
        <jsp:include page="../_quotationServicesMenu.jsp" />
    </div>
    <!-- #################### menu ends ######################## -->

    <form:form modelAttribute="QTN_OBJ" action="create_create_lead_quotation">
        <div class="viewCruiseQuotationDetailsfrm ">
            <div class="viewCruiseQuotationDetailsfrm_wrapper bs">
                <div class="viewCruiseQuotationDetailsfrm_wrapper_data">
                    <div class="viewCruiseQuotationDetailsfrm_wrapper_l1">
                        <label for="" style=" font-weight: bold;color: black;">Quotation Id</label>
                        <p>${QTN_OBJ.quotationId}</p>
                    </div>
                    <div class="viewCruiseQuotationDetailsfrm_wrapper_l1">
                        <label for="" style=" font-weight: bold;   color: black;">Version Id</label>
                        <p>${QTN_OBJ.version}</p>
                    </div>
                </div>
            </div>
            <div class="viewCruiseQuotationDetailsfrm_wrapper_2 bs">
                <h1>Add Cruise Stay To Quotation</h1>
                <div class="due_today_task_data_btns">
                    <c:if test="${QTN_OBJ.converted ne true }">
                        <a href="#">Search Cruise</a>
                        <a
                            href="form_view_add_cruise_quotation?leadId=${LEAD_OBJ.leadId }&quotationId=${QTN_OBJ.quotationId}">Add
                            Manually</a>
                    </c:if>
                    <c:if test="${QTN_OBJ.converted eq true }">
                        <a href="#"> Search Cruise</a>
                        <a>Add Manually</a>

                    </c:if>
                </div>
            </div>
        </div>
    </form:form>
    
    		<c:if test="${CRS_ACTION eq 'ADD'}">
			<jsp:include page="form_view_add_manual_cruise_quotation.jsp" />
		</c:if>
		
		<c:forEach items="${QTN_OBJ.cruiseVoList}" var="cruiseQtnObj">
			<c:choose>
				<c:when test="${cruiseQtnObj.manualCruiseQuotationId eq MANUAL_CRS.manualCruiseQuotationId  && CRS_ACTION eq 'EDIT' }">
					<jsp:include page="form_view_edit_manual_cruise_quotation.jsp" />
				</c:when>
				<c:when test="${cruiseQtnObj.manualCruiseQuotationId eq MANUAL_CRS.manualCruiseQuotationId  && CRS_ACTION eq 'DELETE' }">
					<jsp:include page="form_view_delete_manual_cruise_quotation.jsp" />
				</c:when>
				<c:otherwise>

    <div class="viewCruiseQuotationDetails container">
        <div class="viewCruiseQuotationDetails_wrapper bs">
        <h1 class="hd" style = "margin-bottom:10px;color:#32cd32 ">Id-  ${cruiseQtnObj.manualCruiseQuotationId}</h1>
            <div class="viewCruiseQuotationDetails_wrapper_data">
                <div class="viewCruiseQuotationDetails_wrapper_data_line a" >
                    <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                        <label for="" class="lb">City</label>
                        <p style="color:gray">${cruiseQtnObj.cityName }</p>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_l1 ">
                        <label for="" class="lb">Cruise Name</label>
                        <p style="color:gray">${cruiseQtnObj.cruiseName}</p>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                        <label for="" class="lb">State Room Type</label>
                        <p style="color:gray">${cruiseQtnObj.stateRoomName}</p>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                        <label for="" class="lb">Cruise Provider</label>
                        <p style="color:gray">${cruiseQtnObj.cruiseProviderName}</p>
                    </div>
                </div>
                <div class="viewCruiseQuotationDetails_wrapper_data_line a">
                    <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                        <label for="" class="lb">Sailing Start Date</label>
                        <p style="color:gray">
                            <fmt:formatDate value="${cruiseQtnObj.sailingStartDate}" pattern="dd-MM-yyyy" />
                        </p>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                        <label for="" class="lb">Sailing End Date</label>
                        <p style="color:gray">
                            <fmt:formatDate value="${cruiseQtnObj.sailingEndDate}" pattern="dd-MM-yyyy" />
                        </p>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                        <label for="" class="lb">Adults</label>
                        <p style="color:gray">${cruiseQtnObj.adults}</p>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                        <label for="" class="lb">Children</label>
                        <p style="color:gray">${cruiseQtnObj.children}</p>
                    </div>
                </div>
                <div class="viewCruiseQuotationDetails_wrapper_data_line a">
                    <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                        <label for="" class="lb">Children Age Info</label>
                        <p style="color:gray">${cruiseQtnObj.childrenAgeInfo}</p>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                        <label for="" class="lb">No. of Decks</label>
                        <p style="color:gray">${cruiseQtnObj.noOfDecks}</p>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                        <label for="" class="lb">Total Cost</label>
                        <p style="color:gray">${cruiseQtnObj.cruiseStayCost}</p>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                        <label for="" class="lb">Total Markup</label>
                        <p style="color:gray">${cruiseQtnObj.cruiseStayMarkup}</p>
                    </div>
                </div>
                <div class="viewCruiseQuotationDetails_wrapper_data_line a">
                    <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                        <label for="" class="lb">Display Order</label>
                        <p style="color:gray">${cruiseQtnObj.displayOrder}</p>
                    </div>
                </div>
                <div class="viewCruiseQuotationDetails_wrapper_data_line a">
                    <div class="viewCruiseQuotationDetails_wrapper_data_l1_rem" style="text-align: start;">
                        <label for="" class="lb">Remarks</label>
                        <p style="width:1175px;color:gray">${cruiseQtnObj.remarks}</p>
                    </div>
                </div>
                <div class="due_today_task_data_btns">
                    <c:if test="${QTN_OBJ.converted ne true }">
                        <a
                            href="form_view_edit_manual_cruise_quotation?manualCruiseQuotationId=${cruiseQtnObj.manualCruiseQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}">Edit
                            Stay</a>
                        <a
                            href="form_view_delete_manual_cruise_quotation?manualCruiseQuotationId=${cruiseQtnObj.manualCruiseQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}">Delete
                            Stay</a>
                    </c:if>
                    <c:if test="${QTN_OBJ.converted eq true }">
                        <a>Edit Stay</a>
                        <a>Delete Stay</a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    </c:otherwise>
			</c:choose>
		</c:forEach>

<div id="myModal" class="modal">	
		  <!-- Modal content -->
		  <div class="modal-content">
		    <div class="modal-header">
		      <span class="close">&times;</span>
		      <br><h2 style="text-align:center;">View Cruise Details</h2>
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