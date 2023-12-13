<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
    <script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body>
<br>
<br>
<br>
<br>
<br>

    <c:if test="${VSA_ACTION eq 'DELETE'}">

       <form:form method="post" action="delete_delete_visa_manual_quotation" modelAttribute="MANUAL_VSA">
			<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
			<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
			<input type="hidden" name="visaId" value= "${VISA_OBJ.visaId}" />
			<input type="hidden" name="manualVisaQuotationId" value= "${MANUAL_VSA.manualVisaQuotationId}" />
            <div class="form_view_search_visa_add_quotation">
                <div class="form_view_search_visa_add_quotation_wrapper" style="margin-top:10px">
                    <b>Id- ${MANUAL_VSA.manualVisaQuotationId}</b>
                    <div class="form_view_search_visa_add_quotation_wrapper_data">
                        <div class="form_view_search_visa_add_quotation_wrapper_data_line">
                            <div class="form_view_search_visa_add_quotation_wrapper_data_l1_h">
                                <p>Visa Country</p>
                                <p style="padding-right: 20px;">${MANUAL_VSA.visaCountry}</p>
                                <p style="padding-left: 80px;">Visa Consulate</p>
                                <p style="padding-right: 20px;">${MANUAL_VSA.visaConsulate}</p>
                            </div>
                            <div class="vertical-line"></div>

                            <div class="form_view_search_visa_add_quotation_wrapper_data_l1_btns">
                                <div class="due_today_task_data_btns part">
                                    <a id="myBtn[${MANUAL_VSA.visaQuotationEntity.visaId}]"
                                        onclick="myStopsDisplay(this)"
                                        data-load-url="view_visa_master_details_modal?visaId=${MANUAL_VSA.visaQuotationEntity.visaId}"
                                        data-toggle="modal" data-target="#myModal">View Visa Master Details</a>
                                    <div class="due_today_task_data_btns">
                                        <a id="myBtn[${MANUAL_VSA.visaQuotationEntity.visaId}]"
                                            onclick="myStopsDisplay(this)"
                                            data-load-url="view_visa_documents_details_modal?visaId=${MANUAL_VSA.visaQuotationEntity.visaId}"
                                            data-toggle="modal" data-target="#myModal">View Visa Document Details</a>
                                    </div>
                                </div>
                                <div class="form_view_search_visa_add_quotation_wrapper_data_l1 bc-clr">
                                    <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                        <label for="" class="l-st">Adults</label>
                                        <p>${MANUAL_VSA.adults}</p>
                                    </div>
                                    <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                        <label for="" class="l-st">Child</label>
                                        <p>${MANUAL_VSA.children}</p>
                                    </div>
                                    <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                        <label for="" class="l-st">Infants</label>
                                        <p>${MANUAL_VSA.infant}</p>
                                    </div>
                                    <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                        <label for="" class="l-st">Display Order</label>
                                        <p>${MANUAL_VSA.displayOrder}</p>
                                    </div>
                                </div>
                                <div class="form_view_search_visa_add_quotation_wrapper_data_l1_c bc-clr">
                                    <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                        <label for="" class="l-st">Total Visa Cost (System)</label>
                                        <p>${MANUAL_VSA.systemVisaCost}/p>
                                    </div>
                                    <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                        <label for="" class="l-st">Total Visa Markup (System)</label>
                                        <p>${MANUAL_VSA.systemVisaMarkup }</p>
                                    </div>
                                    <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                        <label for="" class="l-st">New Cost (Changed Current)</label>
                                        <p>${MANUAL_VSA.visaCost}</p>
                                    </div>
                                    <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                        <label for="" class="l-st">Quoted Markup</label>
                                        <p>${MANUAL_VSA.visaMarkup }</p>
                                    </div>
                                </div>
                                <div class="form_view_search_visa_add_quotation_wrapper_data_l1_c bc-clr"
                                    style="margin-bottom: 20px;">
                                    <div class="form_view_search_visa_add_quotation_wrapper_data_rem">
                                        <label for="" class="l-st">Remarks</label> <br>
                                        <p>${MANUAL_VSA.remarks }</p>
                                    </div>
                                </div>
                                <div class="due_today_task_data_btns" style="margin-top: 15px;">
                                    <input type="submit" name="deleteVisa" id="deleteVisa" Value="Confirm Delete"
                                        style="background-color:red;" />
                                    <a
                                        href="form_view_visa_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}">Cancel</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                 </div>
             		</form:form>
		</c:if>


                <script>
                    $(document).ready(function () {
                        // Handler for .ready() called.
                        var nt = document.getElementById('deleteVisaRecord');
                        if (nt != null) {
                            $('html, body').animate({
                                scrollTop: $('#deleteVisaRecord').offset().top
                            }, 'slow');

                        }

                    });
                </script>
                <script>

                    function computeb2c() {
                        var totalGuests = parseInt($("#adults").val()) + parseInt($("#children").val()) + parseInt($("#infant").val());
                        $('#visaCost').val(totalGuests * ${ VISA_OBJ.standardCost });
                        $('#visaMarkup').val(totalGuests * (${ VISA_OBJ.standardB2cPrice } - ${ VISA_OBJ.standardCost }));
                    }

                    function computeb2b() {
                        var totalGuests = parseInt($("#adults").val()) + parseInt($("#children").val()) + parseInt($("#infant").val());
                        $('#visaCost').val(totalGuests * ${ VISA_OBJ.standardCost });
                        $('#visaMarkup').val(totalGuests * (${ VISA_OBJ.standardB2bPrice } - ${ VISA_OBJ.standardCost }));
                    }

                </script>

</body>

</html>