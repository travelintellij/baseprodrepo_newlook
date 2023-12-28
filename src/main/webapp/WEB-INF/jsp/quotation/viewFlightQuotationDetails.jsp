<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
</head>
<style>
  body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/flight_qu.jpg);
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
        <jsp:include page="leadDetailsOpenNavView.jsp" />
        </div>
    </div>
    </form:form>
    <!-- ############# quick lead view ends here################## -->
</div>
                
                
            <form:form modelAttribute="QTN_OBJ" action="create_create_lead_quotation">
             <div class="viewInsuranceQuotationDetails">
            <div class="viewInsuranceQuotationD_wrapper">
                <div class="viewInsuranceQuotationD_wr_data">
                    <div class="viewInsuranceQuotationD_wr_data_line">
                        <label for="" class="lb">Quotation</label>
                        <p>${QTN_OBJ.quotationId}</p>
                    </div>
                    <div class="viewInsuranceQuotationD_wr_data_line">
                        <label for="" class="lb"> Version Id</label>
                        <p>${QTN_OBJ.version}</p>
                    </div>
                </div>
              </div>
            </div>
            </form:form>


<div class="afd">
<jsp:include page="_quotationServicesMenu.jsp" />
</div>

                     <div class="Flight_qu">
            <h1 style="text-align:center;font-size:20px;margin:10px 0;'">Add Flight Sectors to Quotation</h1>
            <div class="due_today_task_data_btnss">
                 <c:if test="${QTN_OBJ.converted ne true }">
                                                       <a
                                                                href="form_view_serach_flight_oneway_quotation?leadId=${LEAD_OBJ.leadId }&quotationId=${QTN_OBJ.quotationId}"><input
                                                                    type="button" 
                                                                    value="Flight-Search-One-Way" /> <input
                                                                    type="button"
                                                                    value="Flight-Search-Return" /></a>
                                                       <a
                                                                href="form_view_add_manual_flight_quotation?leadId=${LEAD_OBJ.leadId }&quotationId=${QTN_OBJ.quotationId}"><input
                                                                    type="button" 
                                                                    value="Add Manually" /></a>
                                                    </c:if>
                                                    <c:if test="${QTN_OBJ.converted eq true }">
                                                       <a><input type="button" 
                                                                    value="Flight-Search-One-Way" /> <input
                                                                    type="button" 
                                                                    value="Flight-Search-Return" /></a>
                                                        
                                                        <a><input type="button"
                                                                    value="Add Manually" /></a>
                                                    </c:if>
            </div>
        </div>
                    
                    
                    <form:form modelAttribute="QTN_OBJ" action="create_create_lead_quotation">
                      
                            

                            <div class="float-child-right">
                                <div class="blue">
                                    
                                    <div align="center"><b>
                                            <font color="green"> ${Success} </font>
                                            <font color="red"> ${Error}</font>
                                        </b></div>
                                    <table style="width:70%;  table-layout:fixed;">
                                        <tr>
                                            <td>
                                                <c:forEach items="${QTN_OBJ.manualQuotationsVoList}" var="flightQtnObj">
                                                    <table style="width:100%;  table-layout:fixed;">
                                                        <tr>
                                                            <th style="background-color:blue;">
                                                                <font size="4"><b>Id-
                                                                        ${flightQtnObj.manualFlightQuotationId}</b>
                                                                </font>
                                                            </th>

                                                            <th colspan="1">
                                                                <font size="4"><b>Airline</b></font>
                                                            </th>
                                                            <td>${flightQtnObj.airlineName }</td>
                                                            <th>
                                                                <font size="4"><b>Flight No. </b></font>
                                                            </th>
                                                            <td> ${flightQtnObj.flightNumber }</td>
                                                        </tr>
                                                        <tr>
                                                            <th>
                                                                <font size="4"><b>Departure</b></font>
                                                            </th>
                                                            <th>
                                                                <font size="4"><b>Arrival</b></font>
                                                            </th>
                                                            <th>
                                                                <font size="4"><b>Departure Details</b></font>
                                                            </th>
                                                            <th>
                                                                <font size="4"><b>Arrival Details</b></font>
                                                            </th>
                                                            <th>
                                                                <font size="4"><b>Duration</b></font>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <td> ${flightQtnObj.originCity } </td>
                                                            <td> ${flightQtnObj.destinationCity} </td>
                                                            <td>${localDateTimeFormat.format(flightQtnObj.departureDate
                                                                )} </td>
                                                            <td>${localDateTimeFormat.format(flightQtnObj.arrivalDate )}
                                                            </td>
                                                            <td>${flightQtnObj.duration } </td>
                                                        </tr>
                                                        <tr>
                                                            <th>
                                                                <font size="4"><b>Adults</b></font>
                                                            </th>
                                                            <th>
                                                                <font size="4"><b>Child</b></font>
                                                            </th>
                                                            <th>
                                                                <font size="4"><b>Infants</b></font>
                                                            </th>
                                                            <th>
                                                                <font size="4"><b>Stops</b></font>
                                                            </th>
                                                            <th>
                                                                <font size="4"><b>Travel Class</b></font>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <td>${flightQtnObj.adultCount } </td>
                                                            <td>${flightQtnObj.childCount } </td>
                                                            <td>${flightQtnObj.infantCount } </td>
                                                            <td>${flightQtnObj.noOfStops } </td>
                                                            <td>${flightQtnObj.cabinClassName }</td>
                                                        </tr>
                                                        <tr>
                                                            <th colspan="2">
                                                                <font size="4"><b>Total Flight Cost</b></font>
                                                            </th>
                                                            <th colspan="2">
                                                                <font size="4"><b>Total Flight Markup</b></font>
                                                            </th>
                                                            <th>
                                                                <font size="4"><b>Display Order</b></font>
                                                            </th>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2">${flightQtnObj.flightCost} </td>
                                                            <td colspan="2">${flightQtnObj.flightMarkup } </td>
                                                            <td>${flightQtnObj.displayOrder } </td>
                                                        </tr>
                                                        <tr>
                                                            <th colspan="2">
                                                                <c:if test="${flightQtnObj.noOfStops gt 0 }">
                                                                    <a
                                                                        href="form_view_manage_stops_quotation?manualFlightQuotationId=${flightQtnObj.manualFlightQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                                                                            type="button"
                                                                            style="background-color:orange;color:black;"
                                                                            value="Manage Stops" /></a>
                                                                    <a id="myBtn[${filteredLeads.leadId}]"
                                                                        onclick="myStopsDisplay(this)"
                                                                        data-load-url="form_view_flight_stops_quotation_modal?manualFlightQuotationId=${flightQtnObj.manualFlightQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"
                                                                        data-toggle="modal"
                                                                        data-target="#myModal"><input type="button"
                                                                            style="background-color:orange;color:black;"
                                                                            value="View Connections" /></a>
                                                                </c:if>

                                                                &nbsp;
                                                            </th>

                                                            <c:if test="${QTN_OBJ.converted eq true }">
                                                                <th colspan="3">
                                                                    <a><input type="button"
                                                                            style="background-color:lightgray;"
                                                                            value="Edit Flight" /></a>
                                                                    <a><input type="button"
                                                                            style="background-color:lightgray;"
                                                                            value="Delete Flight" /></a>
                                                                </th>
                                                            </c:if>
                                                            <c:if test="${QTN_OBJ.converted ne true }">
                                                                <th colspan="3">
                                                                    <a
                                                                        href="form_view_edit_manual_flight_quotation?manualFlightQuotationId=${flightQtnObj.manualFlightQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                                                                            type="button" style="background-color:blue;"
                                                                            value="Edit Flight" /></a>
                                                                    <a
                                                                        href="form_view_delete_manual_flight_quotation?manualFlightQuotationId=${flightQtnObj.manualFlightQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                                                                            type="button" style="background-color:red;"
                                                                            value="Delete Flight" /></a>
                                                                </th>
                                                            </c:if>

                                                        </tr>
                                                    </table>
                                                </c:forEach>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>

                       

                    </form:form>

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