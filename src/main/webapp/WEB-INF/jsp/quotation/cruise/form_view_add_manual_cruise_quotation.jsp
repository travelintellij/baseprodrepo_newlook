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
    <form:form modelAttribute="MANUAL_CRS" action="create_create_cruise_manual_quotation">
        <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
        <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
        <input type="hidden" name="manualCruiseQuotationId" value="${MANUAL_CRS.manualCruiseQuotationId}" />
        <div class="viewCruiseQuotationDetails container">
            <div class="viewCruiseQuotationDetails_wrapper bs">
                <h1 class="hd">Id- ${MANUAL_CRS.manualCruiseQuotationId}</h1>
                <div class="viewCruiseQuotationDetails_wrapper_data">
                    <div class="viewCruiseQuotationDetails_wrapper_data_line">
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="">City</label> <br>
                            <font color="red">
                                <form:errors path="cityName" cssClass="error" />
                            </font>
                            <form:input path="cityName" type="text" id="cityName" style="width:90%"/>
                            <form:hidden path="cityId" id="cityId" />
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="">Cruise Name</label>
                            <form:input path="cruiseName" style="width:90%" type="text"
                                id="cruiseName" />
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="">State Room Type</label>
                            <form:select path="stateRoomType" required="required" style="width:90%">
                                <option class="service-small" value="" selected>Please Select</option>
                                <form:options items="${CRUISE_STATE_ROOM_TYPE_MAP}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="">Cruise Provider</label>
                            <form:select path="cruiseProvider" required="required" style="width:90%">
                                <option class="service-small" value="">Please Select</option>
                                <form:options items="${CRUISE_PROVIDER_NAMES_MAP}" class="service-small" />
                            </form:select>
                        </div>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_line">
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="">Sailing Start Date</label>
                            <font color="red">
                                <form:errors path="sailingStartDate" cssClass="error" />
                            </font>
                            <form:input type="date" path="sailingStartDate" required="required"  style="width:90%"/>
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="">Sailing End Date</label>
                            <form:input type="date" path="sailingEndDate" required="required" style="width:90%"/>
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="">Adults</label> <br>
                            <font color="red">
                                <form:errors path="adults" cssClass="error" />
                            </font>
                            <form:input path="adults" type="number" min="0" style="width:90%"/>
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="">Children</label> <br>
                            <form:input path="children" type="number" min="0" style="width:90%"/>
                        </div>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_line">
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="">Children Age Info</label>
                            <form:input path="childrenAgeInfo" type="text" min="0" style="width:90%"/>
                        </div>

                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="">No. of Decks</label>
                            <form:input path="noOfDecks" type="number" min="1" style="width:90%"/>
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="">Total Cost</label>
                            <form:input path="cruiseStayCost" type="number" min="0" style="width:90%"/>
                        </div>
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="">Total Markup</label>
                            <form:input path="cruiseStayMarkup" type="number" min="0" style="width:90%" />
                        </div>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_line">
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1">
                            <label for="" class="">Display Order</label>
                            <form:input path="displayOrder" type="number" min="0" style="width:88%"/>
                        </div>
                    </div>
                    <div class="viewCruiseQuotationDetails_wrapper_data_line">
                        <div class="viewCruiseQuotationDetails_wrapper_data_l1_rem" style="text-align: start;">
                            <label for="" class="">Remarks</label> <br>
                            <form:textarea path="remarks" rows="5" cols="140" maxlength="1450" style="width:98%"/>
                        </div>
                    </div>
                    <div class="due_today_task_data_btns">
                        <input type="submit" name="addCruise" id="addCruise" Value="Add Cruise Stay" />
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

            var nt = document.getElementById('addCruise');
            if (nt != null) {
                $('html, body').animate({
                    scrollTop: $('#addCruise').offset().top
                }, 'slow');

            }

        });

    </script>
</body>

</html>