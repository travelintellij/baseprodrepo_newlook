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
    <form:form modelAttribute="MANUAL_OTH" action="edit_edit_other_manual_quotation">
        <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
        <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
        <form:hidden path="manualOtherQuotationId" />
     <div class="form_view_add_manual_other_quotation container" style="margin:0 auto">
            <div class="form_view_add_manual_other_wrapper">
                <h1 style="font-size:25px;margin:10px 0;color:#32cd32">Edit service</h1>
                <div class="form_view_add_manual_other_w_data">
                    <div class="form_view_add_manual_other_w_dline">
                        <div class="form_view_add_manual_other_w_dl1">
                            <label for="">Service Name</label>
                            <form:input path="serviceName"  type="text" id="serviceName" required="required"/>
                        </div>
                        <div class="form_view_add_manual_other_w_dl1">
                            <label for="">Service Date</label>
                          <form:input type="date" path="serviceDate" required="required" />
                        </div>
                        <div class="form_view_add_manual_other_w_dl1">
                            <label for="">Service Cost</label>
                           <form:input path="serviceCost" type="number" min="0" />
                        </div>
                        <div class="form_view_add_manual_other_w_dl1" style="width:25%">
                            <label for="">Service Markup</label>
                           <form:input path="serviceMarkup" type="number" min="0" />
                        </div>
                    </div>
                    <div class="form_view_add_manual_other_w_dline">

                        <div class="form_view_add_manual_other_w_dl1" style="width:25%">
                            <label for="">Display</label>
                            <form:input path="displayOrder" type="number" min="0"/>
                        </div>
                        <div class="form_view_add_manual_other_w_dl1">
                            <label for="">Service Details</label>
                            <form:textarea path="serviceDetails" rows="1" cols="103" maxlength="3000" required="required"/>
                        </div>
                    </div>
                    <div class="due_today_task_data_btnss">
                       	<input type="submit"  value="Update Service" />
				<a href="form_view_other_quotation_details?quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input type="button" style="background-color:red;" value="Cancel" /></a>
                    </div>
                </div>
            </div>
        </div>
    
    </form:form>
    <script>
        $(document).ready(function () {
            // Handler for .ready() called.

            var nt = document.getElementById('editServiceTable');
            if (nt != null) {
                $('html, body').animate({
                    scrollTop: $('#editServiceTable').offset().top
                }, 'slow');

            }

        });

    </script>
</body>
</html>