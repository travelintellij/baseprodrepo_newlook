<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>form_view_add_manual_insurance_quotation</title>
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
                    <script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
                </head>
                <style>
                .autocomplete-suggestions { border: 1px solid #999; background: red;overflow-y:auto}
		.autocomplete-suggestion {padding: 2px 5px;color:white; background: black;overflow-y: auto;overflow-y:auto}
		.autocomplete-selected { background: #F0F0F0;overflow-y:auto} 
		.autocomplete-suggestions strong { font-weight: normal; color:#FABA08;overflow-y:auto}
		.autocomplete-group { padding: 2px 5px;overflow-y:auto}
		.autocomplete-group strong { display: block; border-bottom: 1px solid #000;  background: black ; color:black overflow-y:auto}
		.autocomplete-selected:hover{
		color:black
		}


                </style>
                <body>
                
                <div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>
                
                
                    <form:form modelAttribute="MANUAL_INS" action="create_create_insurance_manual_quotation">
                        <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
                        <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
                        <div class="form_view_add_manual_insurance_q container">
                            <div class="form_view_add_manual_insurance_q_wrap bs">
                                <h1>Id- ${insuranceQtnObj.manualInsuranceQuotationId}</h1>
                                <div class="form_view_add_manual_insurance_q_wrap_d">
                                    <div class="form_view_add_manual_insurance_q_wrap_dl">
                                        <div class="form_view_add_manual_insurance_q_wrap_dl1">
                                            <label for="">Country Name</label>
                                            <font color="red">
                                                <form:errors path="countryName" cssClass="error" />
                                            </font>
                                            <form:input path="countryName" type="text" id="countryName"
                                                required="required" />
                                            <form:input path="countryId" type="hidden" />
                                        </div>
                                        <div class="form_view_add_manual_insurance_q_wrap_dl1">
                                            <label for="">Insurance Name</label>
                                            <form:input path="insuranceName" type="text" id="insuranceName"
                                                required="required" />
                                        </div>
                                        <div class="form_view_add_manual_insurance_q_wrap_dl1">
                                            <label for="">Start Date</label>
                                            <font color="red">
                                                <form:errors path="coverageStartDate" cssClass="error" />
                                            </font>
                                            <form:input type="date" path="coverageStartDate" required="required" />
                                            </td>
                                        </div>
                                        <div class="form_view_add_manual_insurance_q_wrap_dl1">
                                            <label for="">End Date</label>
                                            <form:input type="date" path="coverageEndDate" required="required" />
                                        </div>
                                    </div>
                                    <div class="form_view_add_manual_insurance_q_wrap_dl">
                                        <div class="form_view_add_manual_insurance_q_wrap_dl1">
                                            <label for="">Insurance Provider</label>
                                            <form:select path="insuranceProvider" required="required" style="width:90%">
                                                <option class="service-small" value="" selected>Please Select</option>
                                                <form:options items="${INSURANCE_PROVIDERS_MAP}"
                                                    class="service-small" />
                                            </form:select>
                                        </div>
                                        <div class="form_view_add_manual_insurance_q_wrap_dl1">
                                            <label for="">Coverage Amount</label>
                                            <form:input path="coverageAmount" type="number" min="0" />
                                        </div>
                                        <div class="form_view_add_manual_insurance_q_wrap_dl1">
                                            <label for="">Coverage Currency</label>
                                            <form:select path="coverageCurrency" required="required" style="width:90%">
                                                <option class="service-small" value="" selected>Please Select</option>
                                                <form:options items="${CURRENCY_LIST}" class="service-small" />
                                            </form:select>
                                        </div>
                                        <div class="form_view_add_manual_insurance_q_wrap_dl1">
                                            <label for="">Adults</label>
                                            <font color="red">
                                                <form:errors path="adults" cssClass="error" />
                                            </font>
                                            <form:input path="adults" type="number" min="0" />
                                        </div>
                                    </div>
                                    <div class="form_view_add_manual_insurance_q_wrap_dl">
                                        <div class="form_view_add_manual_insurance_q_wrap_dl1">
                                            <label for="">Children</label>
                                            <form:input path="children" type="number" min="0" />
                                        </div>
                                        <div class="form_view_add_manual_insurance_q_wrap_dl1">
                                            <label for="">infants</label>
                                            <form:input path="infant" type="number" min="0" />
                                        </div>
                                        <div class="form_view_add_manual_insurance_q_wrap_dl1">
                                            <label for="">Insurance Type</label>
                                            <form:select path="insuranceType" required="required" style="width:90%">
                                                <form:options items="${INSURANCE_TYPE_MAP}" class="service-small" />
                                            </form:select>
                                        </div>
                                        <div class="form_view_add_manual_insurance_q_wrap_dl1">
                                            <label for="">Premium Cost</label>
                                            <form:input path="premiumCost" type="number" min="0" />
                                        </div>
                                    </div>
                                    <div class="form_view_add_manual_insurance_q_wrap_dl">
                                        <div class="form_view_add_manual_insurance_q_wrap_dl1" style="width:25%">
                                            <label for="">Mark up</label>
                                            <form:input path="premiumMarkup" type="number" min="0" />
                                        </div>
                                        <div class="form_view_add_manual_insurance_q_wrap_dl1" style="width:25%">
                                            <label for="">Display order</label>
                                            <form:input path="displayOrder" type="number" min="0" />
                                        </div>
                                    </div>
                                    <div class="form_view_add_manual_insurance_q_wrap_dl" style="width:100%">
                                        <div class="form_view_add_manual_insurance_q_wrap_dl1" style="width:100%">
                                            <label for="">Remarks</label> <br>
                                            <form:textarea path="remarks" cols="133" rows="5" maxlength="1450" style="width:97%"/>
                                        </div>
                                    </div>
                                    <div class="due_today_task_data_btnss">
                                        <input type="submit" value="Add Insurance" />
                                        <a
                                            href="form_view_insurance_quotation_details?quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                                            type="button" value="Cancel" /></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form:form>
                    <script>
                        $('#countryName').autocomplete({
                            serviceUrl: '${pageContext.request.contextPath}/getCountryList',
                            paramName: "countryName",
                            delimiter: ",",
                            onSelect: function (suggestion) {
                                cityID = suggestion.data;
                                id = cityID;
                                jQuery("#countryId").val(cityID);
                                $('input[name=countryId]').val(id);
                                return false;
                            },
                            transformResult: function (response) {
                                return {
                                    suggestions: $.map($.parseJSON(response), function (item) {
                                        return { value: item.countryName, data: item.destinationId };
                                    })

                                };
                            }
                        });
                    </script>
                </body>

</html>