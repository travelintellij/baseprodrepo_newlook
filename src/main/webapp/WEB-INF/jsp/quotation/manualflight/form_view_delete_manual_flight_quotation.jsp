<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />

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
                    <br><br>
                    <br><br>
                    
                    <br><br>
                    <br><br>
                    <br><br> <br>
                    
             
                   
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




                    <div class="float-container">
                       
                        <div class="float-child-right">
                            <div class="blue">
                                <form:form modelAttribute="MANUAL_FLT" action="delete_delete_manual_flight_quotation">
        <form:hidden path="manualFlightQuotationId" />
        <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
        <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
    <div class="fli_de container">
        <div class="fli_de_wrapper">
            <h1 style="margin:10px 0;font-size: 25px;color:#32cd32 ">Id-
                ${flightQtnObj.manualFlightQuotationId}</h1>
            <div class="fli_de_wrapper_data">
                <div class="fli_de_wrapper_data_fli bc-clr">
                    <div class="fli_de_wrapper_dl1">
                        <label for="" class="lb">Airline</label>
                        <p>${MANUAL_FLT.airlineName}</p>
                    </div>
                    <div class="fli_de_wrapper_dl1">
                        <label for="" class="lb">Flight Number</label>
                        <p>${MANUAL_FLT.flightNumber}</p>
                    </div>
                </div>
            </div>
            <div class="fli_de_wrapper_data_li bc-clr">
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Departure</label>
                    <p>${MANUAL_FLT.originCity}</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Arrival</label>
                    <p>${MANUAL_FLT.destinationCity}</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Departure Details</label>
                    <p>${localDateTimeFormatToEdit.format(MANUAL_FLT.departureDate)}</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Arrival Details</label>
                    <p>${localDateTimeFormatToEdit.format(MANUAL_FLT.arrivalDate)}</p>
                </div>
            </div>
            <div class="fli_de_wrapper_data_li bc-clr">
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Duration</label>
                    <p>${MANUAL_FLT.duration}</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Adults</label>
                    <p>${MANUAL_FLT.adultCount}</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Child</label>
                    <p>${MANUAL_FLT.childCount}</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Infants</label>
                    <p>${MANUAL_FLT.infantCount}</p>
                </div>
            </div>
            <div class="fli_de_wrapper_data_li bc-clr">
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Stops</label>
                    <p>${MANUAL_FLT.noOfStops}</p>
                </div>
                <div class="fli_de_wrapper_dl1">
                    <label for="" class="lb">Travel Class</label>
                    <p>${MANUAL_FLT.cabinClassName}</p>
                </div>
            </div>         
            <div class="due_today_task_data_btnss">
                <input type="submit" name="deleteFlight" id="deleteFlight" style="background-color:red;" Value="Confirm Delete" />
                <a href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input
                        type="button"  value="Cancel" /></a>
            </div>
        </div>
    </div>
    </form:form>
                            </div>
                        </div>
                    </div>

                </body>

</html>