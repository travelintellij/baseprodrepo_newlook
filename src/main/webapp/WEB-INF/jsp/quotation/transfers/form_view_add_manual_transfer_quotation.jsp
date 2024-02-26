<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>form_view_add_manual_transfer_quotation</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
    <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery.datetimepicker.full.js" />"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body>
    <div class="form_view_add_manual_transfer_quotation container">
        <div class="form_view_add_manual_transfer_quotation_wrapper bs" >
            <form:form modelAttribute="MANUAL_TRN" action="create_create_transfer_manual_quotation">
                <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
                <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
                <input type="hidden" name="manualFlightQuotationId" value="${MANUAL_HTL.manualHotelQuotationId}" />
                <div class="form_view_add_manual_transfer_quotation_wrapper_data">
                    <div class="form_view_add_manual_transfer_quotation_wrapper_data_line">
                        <div class="form_view_add_manual_transfer_quotation_wrapper_data_l1">
                            <label for="">Pickup city</label>
                            <font color="red">
                                <form:errors path="pickUpCityName" cssClass="error" />
                            </font>
                            <form:input path="pickUpCityName" type="text" id="pickUpCityName" required="required" />
                            <form:hidden path="pickUpCityId" id="pickUpCityId" />
                        </div>
                        <div class="form_view_add_manual_transfer_quotation_wrapper_data_l1">
                            <label for="">Pickup From</label> <br>
                            <form:select path="pickUpFrom" required="required" style="width:90%">
                                <option class="service-small" value="" selected>Please Select</option>
                                <form:options items="${TRANSFER_POINT_NAME}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="form_view_add_manual_transfer_quotation_wrapper_data_l1">
                            <label for="">Pickup From Name</label>
                            <form:input path="pickUpFromName" type="text" id="pickUpFromName" required="required" />
                        </div>
                        <div class="form_view_add_manual_transfer_quotation_wrapper_data_l1">
                            <label for="">Transfer Date</label>
                            <form:input type="date" path="transferDate" required="required" />
                        </div>
                    </div>
                    <div class="form_view_add_manual_transfer_quotation_wrapper_data_line">
                        <div class="form_view_add_manual_transfer_quotation_wrapper_data_l1">
                            <label for="">Drop city</label>
                            <font color="red">
                                <form:errors path="dropToCityName" cssClass="error" />
                            </font>
                            <form:input path="dropToCityName" type="text" id="dropToCityName" required="required" />
                            <form:hidden path="dropToCityId" id="dropToCityId" />
                        </div>
                        <div class="form_view_add_manual_transfer_quotation_wrapper_data_l1">
                            <label for="">Drop to</label> <br>
                            <form:select path="dropTo" required="required"  style="width:90%">
                                <option class="service-small" value="" selected>Please Select</option>
                                <form:options items="${TRANSFER_POINT_NAME}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="form_view_add_manual_transfer_quotation_wrapper_data_l1">
                            <label for="">Drop to Name</label>
                            <form:input path="dropToName" type="text" id="dropToName" required="required" />
                        </div>
                        <div class="form_view_add_manual_transfer_quotation_wrapper_data_l1">
                            <label for="">Transfer Type</label> <br>
                            <form:select path="transferType" required="required"  style="width:90%">
                                <option class="service-small" value="" selected>Please Select</option>
                                <form:options items="${TRANSFER_TYPE_MODE}" class="service-small" />
                            </form:select>
                        </div>
                    </div>
                    <div class="form_view_add_manual_transfer_quotation_wrapper_data_line">
                        <div class="form_view_add_manual_transfer_wrapper_data_l1_small">
                            <div class="ad-info com-in">
                                <label for="">Adults</label>
                                <form:input path="adults" type="number" min="0" />
                            </div>
                            <div class="ch-info com-in">
                                <label for="">Children</label>
                                <form:input path="children" type="number" min="0" />
                            </div>
                            <div class="if-info com-in">
                                <label for="">Infant</label>
                                <form:input path="infant" type="number" min="0" />
                            </div>
                        </div>
                        <div class="form_view_add_manual_transfer_quotation_wrapper_data_l1">
                            <label for="">Transfer Cost</label>
                            <form:input path="transferCost" type="number" min="0" />
                        </div>
                        <div class="form_view_add_manual_transfer_quotation_wrapper_data_l1">
                            <label for="">Transfer Markup</label>
                            <form:input path="transferMarkup" type="number" min="0" />
                        </div>
                        <div class="form_view_add_manual_transfer_quotation_wrapper_data_l1">
                            <label for="">Display order</label>
                            <form:input path="displayOrder" type="number" min="0" />
                        </div>
                    </div>
                    <div class="form_view_add_manual_transfer_quotation_remarks">
                        <label for="">Remarks</label> <br>
                        <form:textarea path="remarks" cols="139" rows="5" maxlength="1450" />
                    </div>
                    <div class="due_today_task_data_btns">
                        <input type="submit" name="addTransfer" id="addTransfer" Value="Add Transfer" />
                        <a
                            href="form_view_transfer_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}">Cancel</a>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
    <script>
        $('#pickUpCityName').autocomplete({
            serviceUrl: '${pageContext.request.contextPath}/getCityList',
            paramName: "cityName",
            delimiter: ",",
            onSelect: function (suggestion) {
                cityID = suggestion.data;
                id = cityID;
                jQuery("#cityId").val(cityID);
                $('input[name=pickUpCityId]').val(id);
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

        $('#dropToCityName').autocomplete({
            serviceUrl: '${pageContext.request.contextPath}/getCityList',
            paramName: "cityName",
            delimiter: ",",
            onSelect: function (suggestion) {
                cityID = suggestion.data;
                id = cityID;
                jQuery("#cityId").val(cityID);
                $('input[name=dropToCityId]').val(id);
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



        //$("#transferDate").datetimepicker();

    </script>

</body>

</html>