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
    <script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
    <script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
</head>
<body>
    <form:form modelAttribute="MANUAL_OTH" action="delete_delete_other_manual_quotation">
        <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
        <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
        <form:hidden path="manualOtherQuotationId" />
    <div class="form_view_add_manual_other_quotation container" style="margin-top:0">
        <div class="form_view_add_manual_other_wrapper">
            <h1>Id-  ${MANUAL_OTH.manualOtherQuotationId}</h1>
            <div class="form_view_add_manual_other_w_data">
                <div class="form_view_add_manual_other_w_dline a">
                    <div class="form_view_add_manual_other_w_dl1">
                        <label for="" class="lb">Service Name</label>
                        <p>${MANUAL_OTH.serviceName }</p>
                    </div>
                    <div class="form_view_add_manual_other_w_dl1">
                        <label for="" class="lb">Service Details</label>
                        <p>${MANUAL_OTH.serviceDetails}</p>
                    </div>
                    <div class="form_view_add_manual_other_w_dl1">
                        <label for="" class="lb">Service Date</label>
                        <p>
                        <fmt:formatDate value="${MANUAL_OTH.serviceDate}" pattern="dd-MM-yyyy" />
                        </p>
                    </div>
                    <div class="form_view_add_manual_other_w_dl1">
                        <label for="" class="lb">Service Cost</label>
    
                        <p>${MANUAL_OTH.serviceCost}</p>
                    </div>
                </div>
                <div class="form_view_add_manual_other_w_dline a">
                    <div class="form_view_add_manual_other_w_dl1" style="width:25%">
                        <label for="" class="lb">Service Markup</label>
                        <p>${MANUAL_OTH.serviceMarkup}</p>
                    </div>
                    <div class="form_view_add_manual_other_w_dl1" style="width:25%">
                        <label for="" class="lb">Display</label>
                        <p>${MANUAL_OTH.displayOrder}</p>
                    </div>
                </div>
                <div class="due_today_task_data_btnss" style="margin-top:10px">
                <input type="submit" style="background-color:red;" value="Confirm Delete" /></a>
                <a href="form_view_other_quotation_details?quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                        type="button" value="Cancel" /></a>
                </div>
            </div>
        </div>
    </div>
    </form:form>
    <script>
        $(document).ready(function () {
            // Handler for .ready() called.

            var nt = document.getElementById('deleteServiceTable');
            if (nt != null) {
                $('html, body').animate({
                    scrollTop: $('#deleteServiceTable').offset().top
                }, 'slow');

            }

        });

    </script>
</body>
</html>