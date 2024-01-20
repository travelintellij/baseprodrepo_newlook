<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>view_visa_master_details_modal</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery.datetimepicker.full.js" />"></script>
    <link rel="stylesheet" href="style.css">
</head>

<body>
    <form:form modelAttribute="VISA_OBJ">
        <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
        <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
        <input type="hidden" name="manualFlightQuotationId" value="${MANUAL_HTL.manualHotelQuotationId}" />
        <div class="view_visa_master_details_modal conatiner">
            <div class="view_visa_master_details_modal_wrapper">
                <div class="view_visa_master_details_modal_wrapper_data">
                    <div class="view_visa_master_details_modal_wrapper_data_l1_cn">
                        <label for="">Country Name </label> &nbsp &nbsp
                        <p>${VISA_OBJ.countryName}</p>
                    </div>
                    <div class="view_visa_master_details_modal_wrapper_data_line a">
                        <div class="view_visa_master_details_modal_wrapper_data_l1">
                            <label for="">Consulate City</label>
                            <p>${VISA_OBJ.cityName}</p>
                            <input type="hidden" name="countryCode" id="countryCode" />
                        </div>
                        <div class="view_visa_master_details_modal_wrapper_data_l1">
                            <label for="">Visa Profile</label>
                            <p>${VISA_PROFILE.get(VISA_OBJ.profile)}</p>
                        </div>
                        <div class="view_visa_master_details_modal_wrapper_data_l1">
                            <label for="">Visa Type</label>
                            <p>${VISA_TYPE.get(VISA_OBJ.visaType)}</p>
                        </div>
                        <div class="view_visa_master_details_modal_wrapper_data_l1">
                            <label for="">Visa Purpose</label>
                            <p>${VISA_PURPOSE.get(VISA_OBJ.visaPurpose)}</p>
                        </div>
                    </div>
                    <div class="view_visa_master_details_modal_wrapper_data_line a">
                        <div class="view_visa_master_details_modal_wrapper_data_l1">
                            <label for="">Standrad Cost</label>
                            <p>${VISA_OBJ.standardCost}</p>
                        </div>
                        <div class="view_visa_master_details_modal_wrapper_data_l1">
                            <label for="">B2B Price</label>
                            <p>${VISA_OBJ.standardB2bPrice}</p>
                        </div>
                        <div class="view_visa_master_details_modal_wrapper_data_l1">
                            <label for="">B2C Price</label>
                            <p>${VISA_OBJ.standardB2cPrice}</p>
                        </div>
                        <div class="view_visa_master_details_modal_wrapper_data_l1">
                            <label for="">Processing Time</label>
                            <p>${VISA_OBJ.processingTime} Days</p>
                        </div>
                    </div>
                    <div class="view_visa_master_details_modal_wrapper_data_line_rem_oc a">
                        <div class="view_visa_master_details_modal_wrapper_data_rem rem_oc">
                            <label for="">Internal Remarks(will never be shared with the client)</label>
                            <p>${VISA_OBJ.internalRemarks}</p>
                        </div>
                        <div class="view_visa_master_details_modal_wrapper_data_oc rem_oc" style="width: 50%;">
                            <label for="">Other Costs(Link extended validity visa options)</label>
                            <p>${VISA_OBJ.otherCosts}</p>
                        </div>
                    </div>
                    <div class="view_visa_master_details_modal_wrapper_data_line_rem a">
                        <label for="">Remarks</label> <br>
                        <p>${VISA_OBJ.remarks}</p>
                    </div>
                </div>
            </div>
        </div>
    </form:form>
</body>

</html>