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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
</head>

<body>

    <form:form modelAttribute="MANUAL_CRS" action="edit_edit_cruise_manual_quotation">
        <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
        <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
        <input type="hidden" name="manualCruiseQuotationId" value="${MANUAL_CRS.manualCruiseQuotationId}" />
        <div class="viewCruiseQuotationDetails container">
            <div class="viewCruiseQuotationDetails_wrapper">
                <h1>Id- ${MANUAL_CRS.manualCruiseQuotationId}</h1>
                <div class="viewCruiseQuotationDetails_wrapper_data">
                    <div class="viewCruiseQuotationDetails_wrapper_data_line">
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">City</label>
                            <font color="red">
                                <form:errors path="cityName" cssClass="error" />
                            </font>
                            <form:input path="cityName" type="text" id="cityName" />
                            <form:hidden path="cityId" id="cityId" />
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Cruise Name</label>
                            <form:input path="cruiseName" type="text" id="cruiseName" />
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">State Room Type</label>
                            <form:select path="stateRoomType" required="required">
                                <option class="service-small" value="" selected>Please Select</option>
                                <form:options items="${CRUISE_STATE_ROOM_TYPE_MAP}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Cruise Provider</label>
                            <form:select path="cruiseProvider" required="required">
                                <option class="service-small" value="">Please Select</option>
                                <form:options items="${CRUISE_PROVIDER_NAMES_MAP}" class="service-small" />
                            </form:select>
                        </div>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_line">
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Sailing Start Date</label>
                            <font color="red">
                                <form:errors path="sailingStartDate" cssClass="error" />
                            </font>
                            <form:input type="date" path="sailingStartDate" required="required" />
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Sailing End Date</label>
                            <form:input type="date" path="sailingEndDate" required="required" />
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Adults</label>
                            <font color="red">
                                <form:errors path="adults" cssClass="error" />
                            </font>
                            <form:input path="adults" type="number" min="0" />
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Children</label>
                            <form:input path="children" type="number" min="0" />
                        </div>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_line">
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Children Age Info</label>
                            <form:input path="childrenAgeInfo" type="text" min="0" />
                        </div>

                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">No. of Decks</label>
                            <form:input path="noOfDecks" type="number" min="1" />
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Total Cost</label>
                            <form:input path="cruiseStayCost" type="number" min="0" />
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Total Markup</label>
                            <form:input path="cruiseStayMarkup" type="number" min="0" />
                        </div>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_line">
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="lb">Display Order</label>
                            <form:input path="displayOrder" type="number" min="0" />
                        </div>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_line">
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1_rem" style="text-align: start;">
                            <label for="" class="lb">Remarks</label>
                            <form:textarea path="remarks" rows="3" cols="150" maxlength="1450" />
                        </div>
                    </div>
                    <div class="due_today_task_data_btns">
                        <input type="submit" name="addCruise" id="addCruise" Value="Update Cruise" />
                        <a
                            href="form_view_cruise_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}">Cancel</a>
                    </div>
                </div>
            </div>
        </div>
    </form:form>

    <script>
        $('#cityName').autocomplete({
            serviceUrl: '${pageContext.request.contextPath}/getCityList',
            paramName: "cityName",
            delimiter: ",",
            onSelect: function (suggestion) {
                cityID = suggestion.data;
                id = cityID;
                jQuery("#cityId").val(cityID);
                $('input[name=cityId]').val(id);
                return false;
            },
            transformResult: function (response) {
                return {
                    suggestions: $.map($.parseJSON(response), function (item) {
                        return {
                            value: item.cityName,
                            data: item.destinationId
                        };
                    })

                };
            }
        });

        $(document).ready(function () {
            // Handler for .ready() called.

            var nt = document.getElementById('editCruise');
            if (nt != null) {
                $('html, body').animate({
                    scrollTop: $('#editCruise').offset().top
                }, 'slow');

            }

        });

    </script>
</body>

</html>