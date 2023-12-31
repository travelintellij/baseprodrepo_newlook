<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Document</title>
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
                    <script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
                </head>

                <body>
                    <form:form modelAttribute="MANUAL_INS" action="delete_delete_insurance_manual_quotation">
                        <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
                        <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
                        <form:hidden path="manualInsuranceQuotationId" />
                        <div class="in_mu_add container">
                            <div class="in_mu_add_wrp" style="margin-top:100px">
                                <h1>Id- ${MANUAL_INS.manualInsuranceQuotationId}</h1>
                                <div class="in_mu_add_wrp_d bc-clr">
                                    <div class="in_mu_add_wrp_l">
                                        <label for="" class="lb">Contry Name</label>
                                        <p>${MANUAL_INS.countryName }</p>
                                    </div>
                                    <div class="in_mu_add_wrp_l">
                                        <label for="" class="lb">Insurance Name</label>
                                        <p>${MANUAL_INS.insuranceName}</p>
                                    </div>
                                    <div class="in_mu_add_wrp_l">
                                        <label for="" class="lb">Start Date</label>
                                        <p>
                                            <fmt:formatDate value="${MANUAL_INS.coverageStartDate}"
                                                pattern="dd-MM-yyyy" />
                                        </p>
                                    </div>
                                    <div class="in_mu_add_wrp_l">
                                        <label for="" class="lb">End Date</label>
                                        <p>
                                            <fmt:formatDate value="${MANUAL_INS.coverageEndDate}"
                                                pattern="dd-MM-yyyy" />
                                        </p>
                                    </div>
                                </div>

                                <div class="in_mu_add_wrp_d bc-clr">
                                    <div class="in_mu_add_wrp_l">
                                        <label for="" class="lb">Insurance Provider</label>
                                        <p>${MANUAL_INS.insuranceProviderName}</p>
                                    </div>
                                    <div class="in_mu_add_wrp_l">
                                        <label for="" class="lb">Coverage Amount</label>
                                        <p>${MANUAL_INS.coverageAmount }</p>
                                    </div>
                                    <div class="in_mu_add_wrp_l">
                                        <label for="" class="lb">Coverage Currency</label>
                                        <p>${MANUAL_INS.coverageCurrency}</p>
                                    </div>
                                    <div class="in_mu_add_wrp_l">
                                        <label for="" class="lb">Adults</label>
                                        <p>${MANUAL_INS.adults}</p>
                                    </div>
                                </div>
                                <div class="in_mu_add_wrp_d bc-clr">
                                    <div class="in_mu_add_wrp_l">
                                        <label for="" class="lb">Children</label>
                                        <p>${MANUAL_INS.children}</p>
                                    </div>
                                    <div class="in_mu_add_wrp_l">
                                        <label for="" class="lb">Infants</label>
                                        <p>${MANUAL_INS.infant}</p>
                                    </div>
                                    <div class="in_mu_add_wrp_l">
                                        <label for="" class="lb">Insurance type name</label>
                                        <p>${MANUAL_INS.insuranceTypeName}</p>
                                    </div>
                                    <div class="in_mu_add_wrp_l">
                                        <label for="" class="lb">Premium Cost</label>
                                        <p>${MANUAL_INS.premiumCost}</p>
                                    </div>
                                </div>
                                <div class="in_mu_add_wrp_d bc-clr">
                                    <div class="in_mu_add_wrp_l">
                                        <label for="" class="lb">Mark up</label>
                                        <p>${MANUAL_INS.premiumMarkup}</p>
                                    </div>
                                    <div class="in_mu_add_wrp_l">
                                        <label for="" class="lb">Display Order</label>
                                        <p>${MANUAL_INS.displayOrder}</p>
                                    </div>
                                </div>
                                <div class="in_mu_add_wrp_d bc-clr">
                                    <div class="in_mu_add_wrp_l" style="width:100%">
                                        <label for="" class="lb">Remarks</label>
                                        <p>${MANUAL_INS.remarks }</p>
                                    </div>
                                </div>
                                <div class="due_today_task_data_btnss">
                                    <input type="submit" style="background-color:red;" value="Confirm Delete" />
                                    <a
                                        href="form_view_insurance_quotation_details?quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                                            type="button"  value="Cancel" /></a>
                                </div>
                            </div>
                        </div>
                    </form:form>
                    <script>
                        $(document).ready(function () {
                            // Handler for .ready() called.

                            var nt = document.getElementById('deleteInsranceTable');
                            if (nt != null) {
                                $('html, body').animate({
                                    scrollTop: $('#deleteInsranceTable').offset().top
                                }, 'slow');

                            }

                        });

                    </script>

                </body>

</html>