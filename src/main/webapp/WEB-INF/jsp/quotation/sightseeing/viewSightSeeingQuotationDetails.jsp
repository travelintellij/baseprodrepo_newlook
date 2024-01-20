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
    <title>viewTransfersQuotationDetails</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
</head>
<style>
 body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);
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

    <div class="viewTransfersQuotationDetails container_VTQ" ">
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

        <div class="vtdh_btns" style="margin-top:10px">
            <h1 class="vtdh">Add Transfer to Quotation</h1>
            <div class="due_today_task_data_btns mfk">
               <c:if test="${QTN_OBJ.converted ne true }">
		  				<li style="display:inline-block"><a href="#">Search Transfers</a></li>
		  				<li><a style="background: #32cd32  " href="form_view_add_sightseeing_quotation?leadId=${LEAD_OBJ.leadId }&quotationId=${QTN_OBJ.quotationId}">Add Manually</a></li>
		  			</c:if>
		  			<c:if test="${QTN_OBJ.converted eq true }">
		  				<li><a href="#"> Search Transfers</a></li>
		  				<li><a>Add Manually</a></li>
		  			</c:if>
            </div>
        </div>
    </div>
    
    
    

   
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
		<c:if test="${STS_ACTION eq 'ADD'}">
			<jsp:include page="form_view_add_manual_sightseeing_quotation.jsp" /> 
		</c:if>
		
		<c:forEach items="${QTN_OBJ.sightSeeingVoList}" var="sightSeeingQtnObj">
			<c:choose>
				<c:when test="${sightSeeingQtnObj.manualSightSeeingQuotationId eq MANUAL_STS.manualSightSeeingQuotationId  && STS_ACTION  eq 'EDIT' }">
					 <jsp:include page="form_view_edit_manual_sightseeing_quotation.jsp" />  
				</c:when>
				<c:when test="${sightSeeingQtnObj.manualSightSeeingQuotationId eq MANUAL_STS.manualSightSeeingQuotationId  && STS_ACTION  eq 'DELETE' }">
					<jsp:include page="form_view_delete_manual_sightseeing_quotation.jsp" /> 
				</c:when>
				<c:otherwise>
	
    <div class="sssec container">
        <div class="sssec_wrapper">
        <h1 style="color:#32cd32;margin:10px">Id-  ${sightSeeingQtnObj.manualSightSeeingQuotationId}</h1>
            <div class="sssec_wrapper_data a">
                <div class="sssec_wrapper_data_line">
                    <label for="" class="lb" style="font-weight: bold;
    color: #FABA08;">Sight Seeing City</label>
                   <p>${sightSeeingQtnObj.cityName} </p>
                 
                </div>
                <div class="sssec_wrapper_data_line">
                    <label for="" class="lb" style="font-weight: bold;
    color: #FABA08;" >Sight Seeing Selection</label>
                    <p><c:if test="${sightSeeingQtnObj.savedSightSeeing eq true}">
							System Based
						</c:if>
						<c:if test="${sightSeeingQtnObj.savedSightSeeing eq false}">
							Customized 
						</c:if>
						</p>
                </div>
                <div class="sssec_wrapper_data_line">
                    <label for="" class="lb" style="font-weight: bold;
    color: #FABA08;">Transfer Type</label>
                   <p>${sightSeeingQtnObj.transferTypeName} </p>
                </div>
                <div class="sssec_wrapper_data_line">
                    <label for="" class="lb" style="font-weight: bold;
    color: #FABA08;" >Sight Seeing date</label>
                    <p><fmt:formatDate value="${sightSeeingQtnObj.sightSeeingDate}" pattern="dd-MMM-yyyy" /></p>
                </div>
            </div>
            <div class="sssec_wrapper_data a" >
                <div class="sssec_wrapper_data_line_fam_info">
                    <div class="fam_com_ssc">
                        <label for="" class="lb" style="font-weight: bold;
    color: #FABA08;">Adults</label> <br>
                       <p>${sightSeeingQtnObj.adults}</p>
                    </div>
                    <div class="fam_com_ssc">
                        <label for="" class="lb" style="font-weight: bold;
    color: #FABA08;">Children</label> <br>
                        <p>${sightSeeingQtnObj.children}</p>
                    </div>
                    <div class="fam_com_ssc">
                        <label for="" class="lb" style="font-weight: bold;
    color: #FABA08;">Infant</label> <br>
                       <p>${sightSeeingQtnObj.infant}</p>
                    </div>
                </div>
                <div class="sssec_wrapper_data_line">
                    <label for="" class="lb" style="font-weight: bold;
    color: #FABA08;">Sight Seeing Cost</label>
                    <p>${sightSeeingQtnObj.sightSeeingCost}</p>
                </div>
                <div class="sssec_wrapper_data_line">
                    <label for="" class="lb" style="font-weight: bold;
    color: #FABA08;">Sight Seeing Markup</label>
                   <p>${sightSeeingQtnObj.sightSeeingMarkup}</p>
                </div>
                <div class="sssec_wrapper_data_line">
                    <label for="" class="lb" style="font-weight: bold;
    color: #FABA08;">Display Order</label>
                   <p>${sightSeeingQtnObj.displayOrder }</p>
                </div>
            </div>
            <div class="sssec_wrapper_data a">
                <div class="sssec_wrapper_data_line_id_name"> <br>
                    <label for="" class="lb" style="font-weight: bold;
    color: #FABA08;">Sight Seeing ID / Sight seeing name</label>
                   <p>${sightSeeingQtnObj.sightSeeingName}</p>
                </div>
            </div>

            <div class="sssec_wrapper_data a">
                <div class="sssec_rem_box" style="text-align: start;">
                    <label for="" class="lb" style="font-weight: bold;
    color: #FABA08;">Remarks</label> <br>
                    <p>${sightSeeingQtnObj.remarks}</p>
                </div>
            </div>
            <div class="due_today_task_data_btns">
                <c:if test="${QTN_OBJ.converted ne true }">
								<a href="form_view_edit_manual_sightseeing_quotation?manualSightSeeingQuotationId=${sightSeeingQtnObj.manualSightSeeingQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}">Edit Sight Seeing</a>
								<a href="form_view_delete_manual_sightseeing_quotation?manualSightSeeingQuotationId=${sightSeeingQtnObj.manualSightSeeingQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}">Delete Sight Seeing</a>
							</c:if>
							<c:if test="${QTN_OBJ.converted eq true }">
								<a>Edit Sight Seeing</a>
								<a>Delete Sight Seeing</a>
							</c:if>
            </div>
        </div>
    </div>
    			</c:otherwise>
			</c:choose>
		</c:forEach>
		</td>
		</tr>
		

<div id="myModal" class="modal">	
		  <!-- Modal content -->
		  <div class="modal-content">
		    <div class="modal-header" style="background:red">
		      <span class="close">&times;</span>
		      <br><h2 style="text-align:center;">View Sight Seeing Details</h2>
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