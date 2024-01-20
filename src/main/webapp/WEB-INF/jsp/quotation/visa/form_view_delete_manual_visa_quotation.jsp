<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <jsp:include page="../../menu/MenuBuilder.jsp" />

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>form_view_delete_manual_visa_quotation</title>
                    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
                </head>

                <body>
                    <c:if test="${VSA_ACTION eq 'DELETE'}">
                        <div class="form_view_delete_manual_visa_quotation container">
                            <div class="form_view_delete_manual_visa_quotation_wrpr">
                                <form:form method="post" action="delete_delete_visa_manual_quotation"
                                    modelAttribute="MANUAL_VSA">
                                    <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
                                    <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
                                    <input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
                                    <input type="hidden" name="manualVisaQuotationId"
                                        value="${MANUAL_VSA.manualVisaQuotationId}" />
                                    <h1 style="font-size: 25px;margin:10px 0;color:#32cd32 ;">ID -
                                        ${MANUAL_VSA.manualVisaQuotationId}
                                    </h1>
                                    <div class="form_view_delete_manual_visa_quotation_wrpr_data">
                                        <div class="form_view_delete_manual_visa_quotation_wrpe_data_line a">
                                            <div class="form_view_delete_manual_visa_quotation_wdl1">
                                                <label for="" class="lb">Visa Country</label>
                                                <p>${MANUAL_VSA.visaCountry}</p>
                                            </div>
                                            <div class="form_view_delete_manual_visa_quotation_wdl1">
                                                <label for="" class="lb">Visa Consulate</label>
                                                <p>${MANUAL_VSA.visaConsulate}</p>
                                            </div>
                                            <div class="form_view_delete_manual_visa_quotation_wdl1">
                                                <label for="" class="lb">Adults</label>
                                                <p>${MANUAL_VSA.adults}</p>
                                            </div>
                                            <div class="form_view_delete_manual_visa_quotation_wdl1">
                                                <label for="" class="lb">Children</label>
                                                <p>${MANUAL_VSA.children}</p>
                                            </div>
                                        </div>
                                        <div class="form_view_delete_manual_visa_quotation_wrpe_data_line a">
                                            <div class="form_view_delete_manual_visa_quotation_wdl1">
                                                <label for="" class="lb">Infants</label>
                                                <p>${MANUAL_VSA.infant}</p>
                                            </div>
                                            <div class="form_view_delete_manual_visa_quotation_wdl1">
                                                <label for="" class="lb">Display Order</label>
                                                <p>${MANUAL_VSA.displayOrder}</p>
                                            </div>
                                            <div class="form_view_delete_manual_visa_quotation_wdl1">
                                                <label for="" class="lb">Total Visa Cost (System)</label>
                                                <p>${MANUAL_VSA.systemVisaCost}</p>
                                            </div>
                                            <div class="form_view_delete_manual_visa_quotation_wdl1">
                                                <label for="" class="lb">Total Visa Markup (System)</label>
                                                <p>${MANUAL_VSA.systemVisaMarkup }</p>
                                            </div>
                                        </div>
                                        <div class="form_view_delete_manual_visa_quotation_wrpe_data_line a">
                                            <div class="form_view_delete_manual_visa_quotation_wdl1">
                                                <label for="" class="lb">New Cost (Changed Current)</label>
                                                <p>${MANUAL_VSA.visaCost}</p>
                                            </div>
                                            <div class="form_view_delete_manual_visa_quotation_wdl1">
                                                <label for="" class="lb">Quoted Markup</label>
                                                <p>${MANUAL_VSA.visaMarkup }</p>
                                            </div>
                                            <div class="form_view_delete_manual_visa_quotation_wdl1">

                                            </div>
                                            <div class="form_view_delete_manual_visa_quotation_wdl1">

                                            </div>
                                        </div>
                                        <div class="form_view_delete_manual_visa_quotation_wrpe_data_line a">
                                            <div class="form_view_delete_manual_visa_quotation_wdl1" style="width:100%">
                                                <label for="" class="lb">Remarks</label>
                                                <p>${MANUAL_VSA.remarks }</p>
                                            </div>
                                        </div>
                                        <div class="due_today_task_data_btnss" style="margin-top:20px">
                                            <input type="submit" name="deleteVisa" id="deleteVisa"
                                                Value="Confirm Delete" style="background-color:red;" />
                                            <a
                                                href="form_view_visa_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input
                                                    type="button"  value="Cancel" /></a>
                                        </div>
                                    </div>

                                    <!-- ############### top-btns ############### -->

                                    <div class="visa-tp-tbns due_today_task_data_btnss">
                                        <a id="myBtn[${MANUAL_VSA.visaQuotationEntity.visaId}]"
                                            onclick="myStopsDisplay(this)"
                                            data-load-url="view_visa_master_details_modal?visaId=${MANUAL_VSA.visaQuotationEntity.visaId}" 
                                            data-toggle="modal" data-target="#myModal"><input type="button"
                                                value="View Visa Master Details" /></a>
                                        <a id="myBtn[${MANUAL_VSA.visaQuotationEntity.visaId}]"
                                            onclick="myStopsDisplay(this)"
                                            data-load-url="view_visa_documents_details_modal?visaId=${MANUAL_VSA.visaQuotationEntity.visaId}" 
                                            data-toggle="modal" data-target="#myModal"><input type="button"
                                                value="View Visa Document Details" /></a>
                                    </div>
                                </form:form>
                            </div>
                        </div>
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