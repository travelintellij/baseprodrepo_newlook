<!DOCTYPE html>
<html lang="en">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>viewTransfersQuotationDetails</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
</head>

<body style="background: url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">

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

    <div class="viewTransfersQuotationDetails container_VTQ">
        <div class="viewTransfersQuotationDetails_wrapper">
            <div class="viewTransfersQuotationDetails_wrapper_data">
            <form:form modelAttribute="QTN_OBJ" action="create_create_lead_quotation">
                <div class="viewTransfersQuotationDetails_wrapper_data_line">
                    <div class="viewTransfersQuotationDetails_wrapper_data_l1">
                        <label for="">Quotation ID</label>
                        <p>${QTN_OBJ.quotationId}</p>
                    </div>
                    <div class="viewTransfersQuotationDetails_wrapper_data_l1">
                        <label for="">Version ID</label>
                        <p>${QTN_OBJ.version}</p>
                    </div>
                </div>
                </form:form>
                
            </div>
        </div>
        <h1 class="vtdh">View transfer Details</h1>

        <div class="vtdh_btns">
            <h1 class="vtdh">Add Transfer to Quotation</h1>
            <div class="due_today_task_data_btns mfk">
               <c:if test="${QTN_OBJ.converted ne true }">
		  				<li style="display:inline-block"><a href="#">Search Transfers</a></li>
		  				<li><a style="background: #32cd32  " href="form_view_add_transfer_quotation?leadId=${LEAD_OBJ.leadId }&quotationId=${QTN_OBJ.quotationId}">Add Manually</a></li>
		  			</c:if>
		  			<c:if test="${QTN_OBJ.converted eq true }">
		  				<li><a href="#"> Search Transfers</a></li>
		  				<li><a>Add Manually</a></li>
		  			</c:if>
            </div>
        </div>

    </div>
    
    
    

    	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<table style="width:auto;table-layout:fixed;" >
	<tr><td>
		<c:if test="${TRN_ACTION eq 'ADD'}">
			<jsp:include page="form_view_add_manual_transfer_quotation.jsp" />
		</c:if>
		
		<c:forEach items="${QTN_OBJ.transferVoList}" var="transferQtnObj">
			<c:choose>
				<c:when test="${transferQtnObj.manualTransferQuotationId eq MANUAL_TRN.manualTransferQuotationId  && TRN_ACTION  eq 'EDIT' }">
					<jsp:include page="form_view_edit_manual_transfer_quotation.jsp" />
				</c:when>
				<c:when test="${transferQtnObj.manualTransferQuotationId eq MANUAL_TRN.manualTransferQuotationId  && TRN_ACTION  eq 'DELETE' }">
					<jsp:include page="form_view_delete_manual_transfer_quotation.jsp" />
				</c:when>
				<c:otherwise>
			 <div class="view_transfer_quotation_table container">
        <div class="view_transfer_quotation_table_wrapper" style="margin-top:10px">
            <div class="view_transfer_quotation_table_wrapper_data" style="background:#6082B6;margin-bottom:10px">
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Pickup City</label>
                    <p>${transferQtnObj.pickUpCityName }</p>
                </div>
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Pickup From</label>
                    <p>${transferQtnObj.pickUpFromDesc}</p>
                </div>
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Pickup From Name</label>
                    <p>${transferQtnObj.pickUpFromName}</p>
                </div>
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Transfer Date</label>
                    <p><fmt:formatDate value="${transferQtnObj.transferDate}" pattern="dd-MM-yyyy" /></p>
                </div>
            </div>
            <div class="view_transfer_quotation_table_wrapper_data" style="background:#6082B6;margin-bottom:10px">
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Drop City</label>
                    <p>${transferQtnObj.dropToCityName}</p>
                </div>
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Drop to</label>
                    <p>${transferQtnObj.dropToCityName}</p>
                </div>
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Drop to name</label>
                    <p>${transferQtnObj.dropToName}</p>
                </div>
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Transfer Type</label>
                    <p>${transferQtnObj.transferTypeName}</p>
                </div>
            </div>

            <div class="view_transfer_quotation_table_wrapper_data" style="background:#6082B6;margin-bottom:10px">
                <div class="view_transfer_quotation_table_wrapper_data_li_wrp">
                    <div class="vtq_child">
                        <label for="">Adults</label>
                        <p>${transferQtnObj.adults}</p>
                    </div>
                    <div class="vtq_child">
                        <label for="">Children</label>
                        <p>${transferQtnObj.children}</p>
                    </div>
                    <div class="vtq_child">
                        <label for="">Infant</label>
                        <p>${transferQtnObj.infant}</p>
                    </div>
                </div>
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Transfer Cost</label>
                    <p>${transferQtnObj.transferCost}</p>
                </div>
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Transfer Markup</label>
                    <p>${transferQtnObj.transferMarkup}</p>
                </div>
                <div class="view_transfer_quotation_table_wrapper_data_li">
                    <label for="">Display order</label>
                    <p>${transferQtnObj.displayOrder }</p>
                </div>
            </div>
            <div class="view_transfer_quotation_table_wrapper_data" style="background:#6082B6;margin-bottom:10px">
                <label for="">Remarks</label>
                <p>${transferQtnObj.remarks}</p>
            </div>
            <div class="due_today_task_data_btns">
                <c:if test="${QTN_OBJ.converted ne true }">
                    <a
                        href="form_view_edit_manual_transfer_quotation?manualTransferQuotationId=${transferQtnObj.manualTransferQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}">Edit Transfer</a>
                    <a
                        href="form_view_delete_manual_transfer_quotation?manualTransferQuotationId=${transferQtnObj.manualTransferQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}">Delete Transfer</a>
                </c:if>
                <c:if test="${QTN_OBJ.converted eq true }">
                    <a>Edit Transfer</a>
                    <a>Delete Transfer</a>
                </c:if>
            </div>
        </div>
	
			</c:otherwise>
			</c:choose>
		</c:forEach>
		</td>
		</tr>
		</table>
    </div>
    
    
    
    
    
    
    
    <div id="myModal" class="modal">	
		  <!-- Modal content -->
		  <div class="modal-content">
		    <div class="modal-header">
		      <span class="close">&times;</span>
		      <br><h2 style="text-align:center;"></h2>
		    </div>
		    <div class="modal-body">
		
		
		    </div>
		    <div class="modal-footer">
		      <h3 align="center"></h3>
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