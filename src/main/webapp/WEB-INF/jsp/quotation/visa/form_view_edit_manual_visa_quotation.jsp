<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
</head>

<body>
    <c:if test="${VSA_ACTION eq 'EDIT_VISA'}">
        <form:form method="post" action="edit_edit_visa_manual_quotation" modelAttribute="MANUAL_VSA">
            <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
            <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
            <input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
            <input type="hidden" name="manualVisaQuotationId" value="${MANUAL_VSA.manualVisaQuotationId}" />
            <div class="form_view_search_visa_add_quotation">
                <div class="form_view_search_visa_add_quotation_wrapper">
                    <div class="form_view_search_visa_add_quotation_wrapper_data">
                        <div class="form_view_search_visa_add_quotation_wrapper_data_line">
                            <div class="form_view_search_visa_add_quotation_wrapper_data_l1_h" style="height:50px;background:#6082B6;padding:10px">
                                <p>Visa Country</p>
                                <p style="padding-right: 20px;">${VISA_OBJ.countryName}</p>
                                <p style="padding-left: 80px;">Visa Consulate</p>
                                <p style="padding-right: 20px;">${VISA_OBJ.cityName}</p>
                            </div>
                            <div class="vertical-line"></div>
                           
                            <div class="form_view_search_visa_add_quotation_wrapper_data_l1_btns">
                                <div class="due_today_task_data_btns part" style="width:40%">
                                    <a id="myBtn[${VISA_OBJ.visaId}]" onclick="myStopsDisplay(this)"
                                        data-load-url="view_visa_master_details_modal?visaId=${VISA_OBJ.visaId}"
                                        data-toggle="modal" data-target="#myModal">View Visa Master Details</a>
                                </div>
                                <div class="due_today_task_data_btns">
                                    <a id="myBtn[${VISA_OBJ.visaId}]" onclick="myStopsDisplay(this)"
                                        data-load-url="view_visa_documents_details_modal?visaId=${VISA_OBJ.visaId}"
                                        data-toggle="modal" data-target="#myModal">View Visa Document Details</a>
                                </div>
                            </div>
                            <div class="form_view_search_visa_add_quotation_wrapper_data_l1">
                                <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                    <label for="">Adults</label>
                                    <font color="red">
                                        <form:errors path="adults" cssClass="error" />
                                    </font>
                                    <form:input path="adults" type="number" min="0" />
                                </div>
                                <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                    <label for="">Child</label>
                                    <form:input path="children" type="number" min="0" />
                                </div>
                                <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                    <label for="">Infants</label>
                                    <form:input path="infant" type="number" min="0" />
                                </div>
                                <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                    <label for="">Display Order</label>
                                    <form:input path="displayOrder" type="number" min="0" />
                                </div>
                            </div>
                            <div class="form_view_search_visa_add_quotation_wrapper_data_l1_c">
                                <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                    <label for="">System Cost PP(B2C)</label>
                                    <p>${VISA_OBJ.standardCost}</p>
                                </div>
                                <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                    <label for="">B2C S.Price PP | B2B S.Price PP </label>
                                    <p style="background:lightpink;color:black;width:120px;padding:3px;border-radius:2px'">${VISA_OBJ.standardB2cPrice } | ${VISA_OBJ.standardB2bPrice }</p>
                                </div>
                                <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                    <label for="">Total Updated Cost</label>
                                    <form:input path="visaCost" type="number" min="0" />
                                </div>
                                <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                    <label for="">Total Markup</label>
                                    <form:input path="visaMarkup" type="number" min="0" />
                                </div>
                            </div>
                            <div class="form_view_search_visa_add_quotation_wrapper_data_l1_c"
                                style="margin-bottom: 20px;">
                                <div class="form_view_search_visa_add_quotation_wrapper_data_rem" style="width:100%">
                                    <label for="">Remarks</label> <br>
                                    <form:textarea path="remarks" rows="5" cols="103" maxlength="1450" style="width:98%"/>
                                </div>
                            </div>
                            <div class="rel-btns">
                                <input type="button" value="Compute B2C" onclick="computeb2c();" />
                                <input type="button" value="Compute B2B" onclick="computeb2b();" />
                            </div>
                            <div class="due_today_task_data_btnss" style="margin-top: 15px;">
                                	<input type="submit" name="updateVisa" id="updateVisa" Value="Update Visa" />
				                    <a style="	display: inline-block;
    color: white;
    width: auto;
    padding: 10px 15px;
    border-radius: 10px;
    background: #ffb908cf;
    color: black;
    transition: all 0.3s ease-in-out;
    outline: none;
    border: none;
    margin-right: 5px;
    cursor:pointer;" href="form_view_visa_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}">Cancel</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form:form>
    </c:if>




<script>

function computeb2c(){
	var totalGuests = parseInt($("#adults").val()) + parseInt($("#children").val()) + parseInt($("#infant").val());
	$('#visaCost').val(totalGuests * ${VISA_OBJ.standardCost});
	$('#visaMarkup').val(totalGuests * (${VISA_OBJ.standardB2cPrice} - ${VISA_OBJ.standardCost}));
}

function computeb2b(){
	var totalGuests = parseInt($("#adults").val()) + parseInt($("#children").val()) + parseInt($("#infant").val());
	$('#visaCost').val(totalGuests * ${VISA_OBJ.standardCost});
	$('#visaMarkup').val(totalGuests * (${VISA_OBJ.standardB2bPrice} - ${VISA_OBJ.standardCost}));
}

</script>
</body>

</html>