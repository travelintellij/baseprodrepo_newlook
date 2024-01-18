<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>

</head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>



    <form:form modelAttribute="MANUAL_OTH" action="create_create_other_manual_quotation">
        <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
        <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
        <div class="form_view_add_manual_other_quotation container" style="margin:15px auto">
            <div class="form_view_add_manual_other_wrapper">
                <h1 style="font-size:25px;margin:10px 0;color:#32cd32">Add Service to quotation</h1>
                <div class="form_view_add_manual_other_w_data">
                    <div class="form_view_add_manual_other_w_dline">
                        <div class="form_view_add_manual_other_w_dl1">
                            <label for="">Service Name</label>
                            <form:input path="serviceName" type="text" id="serviceName" required="required" />
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
                            <form:input path="displayOrder" type="number" min="0" />
                        </div>
                        <div class="form_view_add_manual_other_w_dl1">
                            <label for="">Service Details</label>
                            <form:textarea path="serviceDetails" rows="1" cols="103" maxlength="3000"
                                required="required" />
                        </div>
                    </div>
                    <div class="due_today_task_data_btnss">
                        <input type="submit" style="background:#32cd32"  value="Add Service" />
                        <a
                            href="form_view_other_quotation_details?quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                                type="button"  value="Cancel" /></a>
                    </div>
                </div>
            </div>
        </div>
    </form:form>

	


   