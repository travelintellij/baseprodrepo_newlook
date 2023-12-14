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
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
    <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body>

    <form:form modelAttribute="MANUAL_CRS" action="delete_delete_cruise_manual_quotation">
        <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
        <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
        <input type="hidden" name="manualCruiseQuotationId" value="${MANUAL_CRS.manualCruiseQuotationId}" />

        <div class="viewCruiseQuotationDetails container">
            <div class="viewCruiseQuotationDetails_wrapper">
            <h1 style="font-size:20px;color:red">Confirm Delete <i class="fa fa-exclamation-triangle fa-xl" aria-hidden="true"></i><h1>
                <h1 style="color:#32cd32;margin-bottom:13px">Id- ${MANUAL_CRS.manualCruiseQuotationId}</h1>
                <div class="viewCruiseQuotationDetails_wrapper_data">
                    <div class="viewCruiseQuotationDetails_wrapper_data_line bc-clr">
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">City</label>
                            <p>${MANUAL_CRS.cityName }</p>
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Cruise Name</label>
                            <p>${MANUAL_CRS.cruiseName}</p>
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">State Room Type</label>
                            <p>${MANUAL_CRS.stateRoomName}</p>
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Cruise Provider</label>
                            <p>${MANUAL_CRS.cruiseProviderName}</p>
                        </div>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_line bc-clr">
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Sailing Start Date</label>
                            <p>
                                <fmt:formatDate value="${MANUAL_CRS.sailingStartDate}" pattern="dd-MM-yyyy" />
                            </p>
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Sailing End Date</label>
                            <p>
                                <fmt:formatDate value="${MANUAL_CRS.sailingEndDate}" pattern="dd-MM-yyyy" />
                            </p>
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Adults</label>
                            <p>${MANUAL_CRS.adults}</p>
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Children</label>
                            <p>${MANUAL_CRS.children}</p>
                        </div>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_line bc-clr">
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Children Age Info</label>
                            <p>${MANUAL_CRS.childrenAgeInfo}</p>
                        </div>

                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">No. of Decks</label>
                            <p>${MANUAL_CRS.noOfDecks}</p>
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Total Cost</label>
                            <p>${MANUAL_CRS.cruiseStayCost}</p>
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Total Markup</label>
                            <p>${MANUAL_CRS.cruiseStayMarkup}</p>
                        </div>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_line bc-clr">
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Display Order</label>
                            <p>${MANUAL_CRS.displayOrder }</p>
                        </div>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_line bc-clr">
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1_rem" style="text-align: start;">
                            <label for="" class="lb">Remarks</label>
                            <p style="width:1175px">${MANUAL_CRS.remarks}</p>
                        </div>
                    </div>
                    <div class="due_today_task_data_btns">
                        <input type="submit" name="deleteCruise" id="deleteCruise" Value="Confirm Delete" style="background:red;color:white" />
                        <a
                            href="form_view_cruise_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}">Cancel</a>
                    </div>
                </div>
            </div>
        </div>
    </form:form>

    <script>
        $(document).ready(function () {
            // Handler for .ready() called.

            var nt = document.getElementById('deleteCruise');
            if (nt != null) {
                $('html, body').animate({
                    scrollTop: $('#deleteCruise').offset().top
                }, 'slow');

            }

        });

    </script>
</body>

</html>