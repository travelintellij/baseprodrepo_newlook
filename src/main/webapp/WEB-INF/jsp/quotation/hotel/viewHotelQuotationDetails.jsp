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
     <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
</head>

<style> body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/hotal_qu.jpg);
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
        } </style>

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

 <div class="viewHotelQuotationDetails">
        <div class="viewHotelQuotationDetails_wrapper">
            <div class="viewHotelQuotationDetails_wrapper_data">
             <form:form modelAttribute="QTN_OBJ" action="create_create_lead_quotation">
                <div class="viewHotelQuotationDetails_wrapper_dl">
                    <div class="viewHotelQuotationDetails_wrapper_dli">
                        <label for="" class="lb">Quotation Id</label>
                        <p>${QTN_OBJ.quotationId}</p>
                    </div>
                    <div class="viewHotelQuotationDetails_wrapper_dli">
                        <label for="" class="lb">Version Id</label>
                        <p>${QTN_OBJ.version}</p>
                    </div>
                </div>
                </form:form>
            </div>
        </div>
      
        <div class="viewHotelQuotationDetails_hd">
            <h2 style="font-size: 20px;">Add Hotal To Stay Quotation</h2>
            <div class="due_today_task_data_btns">
               <c:if test="${QTN_OBJ.converted ne true }">
		  				<a href="#">Search Hotel</a>
		  				<a href="form_view_add_hotel_quotation?leadId=${LEAD_OBJ.leadId }&quotationId=${QTN_OBJ.quotationId}&hotelOptionNo=${QTN_OBJ.hotelOptionNo}">
		  				Add Manually </a>
		  			</c:if>
		  			<c:if test="${QTN_OBJ.converted eq true }">
		  				<a href="#">Search Hotel</a>
		  				<a>Add Manually</a>
		  			</c:if>
            </div>
        </div>
        <div align="center"><b><font color="#32cd32  " > ${Success} </font><font color="red"> ${Error}</font> </b></div>
    </div>


	<c:if test="${not empty QTN_OBJ.hotelVoList}">
			<tr>
			<td style="background-color:white;text-align:left;">
				
				<c:forEach var = "i" begin = "1" end = "${MAX_HOTEL_OPTION_CREATED}">
         			<c:if test="${i == QTN_OBJ.hotelOptionNo}">
         		    	<input type="button" style="background-color: green;padding: 10px 10px;" value="Option ${i}" disabled/>
         		    </c:if>
         		    <c:if test="${i != QTN_OBJ.hotelOptionNo}">
         		    	<a href="form_view_hotel_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${QTN_OBJ.quotationId}&hotelOptionNo=${i}"><input type="button" style="background-color: grey;padding: 4px 5px;"value="Option ${i}" /></a>
         		    </c:if>
      			</c:forEach>
				<c:if test="${QTN_OBJ.converted ne true }">
					<a href="form_view_add_hotel_option_quotation?leadId=${LEAD_OBJ.leadId }&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"value="Add Hotel Option" /></a>
				</c:if>
			</td>
			</tr>

	</c:if>
	
	<c:if test="${HTL_STOP_ACTION eq 'ADD'}">
			<jsp:include page="form_view_add_manual_hotel_quotation.jsp" />
		</c:if>
	
    <c:forEach items="${QTN_OBJ.hotelVoList}" var="hotelQtnObj">
        <c:choose>
            <c:when
                test="${hotelQtnObj.manualHotelQuotationId eq MANUAL_HTL.manualHotelQuotationId  && HTL_STOP_ACTION eq 'EDIT' }">
                <jsp:include page="form_view_edit_manual_hotel_quotation.jsp" />
            </c:when>
            <c:when
                test="${hotelQtnObj.manualHotelQuotationId eq MANUAL_HTL.manualHotelQuotationId  && HTL_STOP_ACTION eq 'DELETE' }">
                <jsp:include page="form_view_delete_manual_hotel_quotation.jsp" />
            </c:when>
            <c:otherwise>
                <div class="main_p container" >
                    <div class="main_p_wrapper" style="margin-top:100px">
                        <div class="main_p_wrapper_data">
                            <h1 style="margin:10px 0">Id- ${hotelQtnObj.manualHotelQuotationId}</h1>
                            <div class="main_p_wrapper_data_line bc-clr">
                                <div class="main_p_wrapper_dl ">
                                    <label for="" class="lb">City</label>
                                    <p>${hotelQtnObj.cityName }</p>
                                </div>
                                <div class="main_p_wrapper_dl">
                                    <label for="" class="lb">Hotal Name</label>
                                    <p>${hotelQtnObj.cityName }</p>
                                </div>
                                <div class="main_p_wrapper_dl">
                                    <label for="" class="lb">Category</label>
                                    <p>${hotelQtnObj.roomCategoryName}</p>
                                </div>
                                <div class="main_p_wrapper_dl">
                                    <label for="" class="lb">Meal Plan</label>
                                    <p>${hotelQtnObj.mealPlanName}</p>
                                </div>
                            </div>
                            <div class="main_p_wrapper_data_line bc-clr">
                                <div class="main_p_wrapper_dl ">
                                    <label for="" class="lb">CheckIn Date</label>
                                    <p>
                                        <fmt:formatDate value="${hotelQtnObj.checkInDate}" pattern="dd-MM-yyyy" />
                                    </p>
                                </div>
                                <div class="main_p_wrapper_dl">
                                    <label for="" class="lb">CheckOut Date</label>
                                    <p>
                                        <fmt:formatDate value="${hotelQtnObj.checkOutDate}" pattern="dd-MM-yyyy" />
                                    </p>
                                </div>


                                <div class="main_p_wrapper_dl">
                                    <label for="" class="lb">Adults</label>
                                    <p>${hotelQtnObj.adults}</p>
                                </div>
                                <div class="main_p_wrapper_dl">
                                    <label for="" class="lb">Children</label>
                                    <p>${hotelQtnObj.children}</p>
                                </div>
                            </div>
                            <div class="main_p_wrapper_data_line bc-clr">
                                <div class="main_p_wrapper_dl ">
                                    <label for="" class="lb">Extra Bed</label>
                                    <p>${hotelQtnObj.extrabed}</p>
                                </div>

                                <div class="main_p_wrapper_dl">
                                    <label for="" class="lb">Number of Rooms</label>
                                    <p>${hotelQtnObj.noOfRooms}</p>
                                </div>
                                <div class="main_p_wrapper_dl">
                                    <label for="" class="lb">Total Cost</label>
                                    <p>${hotelQtnObj.hotelStayCost}</p>
                                </div>
                                <div class="main_p_wrapper_dl">
                                    <label for="" class="lb">Total Markup</label>
                                    <p>${hotelQtnObj.hotelStayMarkup}</p>
                                </div>
                            </div>
                            <div class="main_p_wrapper_data_line bc-clr">
                                <div class="main_p_wrapper_dl ">
                                    <label for="" class="lb">Display Order</label>
                                    <p>${hotelQtnObj.displayOrder }</p>
                                </div>
                            </div>
                            <div class="main_p_wrapper_data_line bc-clr">
                                <div class="main_p_wrapper_dl_rem ">
                                    <label for="" class="lb">Remarks</label>
                                    <p>${hotelQtnObj.remarks}</p>
                                </div>
                            </div>
                            <div class="due_today_task_data_btnss">
                                <c:if test="${QTN_OBJ.converted ne true }">
                                    <a
                                        href="form_view_edit_manual_hotel_quotation?manualHotelQuotationId=${hotelQtnObj.manualHotelQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}&hotelOptionNo=${QTN_OBJ.hotelOptionNo}"><input
                                            type="button" value="Edit Stay" /></a>
                                    <a
                                        href="form_view_delete_manual_hotel_quotation?manualHotelQuotationId=${hotelQtnObj.manualHotelQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}&hotelOptionNo=${QTN_OBJ.hotelOptionNo}"><input
                                            type="button" style="background:red;color:white"  value="Delete Stay" /></a>
                                </c:if>
                                <c:if test="${QTN_OBJ.converted eq true }">
                                    <input type="button"  value="Edit Stay" />
                                    <input type="button"
                                            value="Delete Stay" />
                                </c:if>
                                <form:form action="view_lead_quotations_list">
				<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
				<input type="submit" name="Version List" Value="Show Version List" />
			</form:form>
                            </div>
                        </div>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
    </c:forEach>

<br>
<br>
		<div class="due_today_task_data_btns" style="margin-left:17px">
			<form:form action="view_lead_quotations_list">
				<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" style="background:#03045e;color:white"/>
				<input type="submit" name="Version List" Value="Show Version List"  style="background:#03045e;color:white"/>
			</form:form>
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