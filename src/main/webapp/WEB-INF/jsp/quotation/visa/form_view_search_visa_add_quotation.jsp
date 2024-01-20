<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>form_view_search_visa_add_quotation</title>
   <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
     <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body>

    <form:form method="post" action="search_search_visa_master_quotation" modelAttribute="visa_obj">
        <input type="hidden" id="countryCode" name="countryCode" />
        <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
        <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
       <div class="sb">
        <div class="sb_wrapper">
            <input type="text" id="countryName" name="countryName"
                placeholder="country name" required />
            <div class="due_today_task_data_btns">
                <input type="submit" name="submit" value="Search Visa Details" />
                <a href="form_view_visa_quotation_details?quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}">Cancel</a>
            </div>
        </div>
    </div>
    </form:form>
    <!-- ########################## not styled yet ################################## -->


    <c:if test="${not empty VISA_RESULT_SET}">
        <input type="hidden" id="countryName" name="countryName" value="${COUNTRY_NAME}" />
        <input type="hidden" id="countryCode" name="countryCode" value="${COUNTRY_CODE}" />
        <table class="visa_sec_tabel">
            <thead>
                <tr class="vsh">
                    <th>Country Name</th>
                    <th>Consulate City</th>
                    <th>Visa Profile</th>
                    <th>Visa Type</th>
                    <th>Visa Purpose</th>
                    <th>Processing Time</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <!-- Add your data rows here -->
                <c:forEach var="visaMasterObj" items="${VISA_RESULT_SET}">
                    <tr>
                        <td>${visaMasterObj.countryName}</td>
                        <td>${visaMasterObj.cityName}</td>
                        <td>${VISA_PROFILE.get(visaMasterObj.profile)}</td>
                        <td>${VISA_TYPE.get(visaMasterObj.visaType)}</td>
                        <td>${VISA_PURPOSE.get(visaMasterObj.visaPurpose)}</td>
                        <td>${visaMasterObj.processingTime} Days</td>
                        <td>
                            <i class="fa-solid fa-sliders vsi" aria-hidden="true">
                                <div class="vsi-ul">
                                    <ul>
                                        <li><a id="myBtn[${visaMasterObj.visaId}]" onclick="myStopsDisplay(this)"
                                                data-load-url="view_visa_master_details_modal?visaId=${visaMasterObj.visaId}"
                                                data-toggle="modal" data-target="#myModal">View Details</a>
                                        </li>
                                        <li><a id="myBtn[${visaMasterObj.visaId}]" onclick="myStopsDisplay(this)"
                                                data-load-url="view_visa_documents_details_modal?visaId=${visaMasterObj.visaId}"
                                                data-toggle="modal" data-target="#myModal">View Visa Document</li>
                                        <li><a
                                                href="form_view_add_visa_quotation_form?visaId=${visaMasterObj.visaId}&leadId=${LEAD_OBJ.leadId }&quotationId=${QTN_OBJ.quotationId}">Add
                                                To Quotation</a></li>
                                    </ul>
                                </div>
                            </i>
                        </td>
                    </tr>
                </c:forEach>

                <!-- Add more rows as needed -->
            </tbody>
        </table>
    </c:if>




    <!-- ########################## not styled yet ################################## -->
    <c:if test="${VSA_ACTION eq 'ADD_VISA'}">
        <form:form method="post" action="create_create_visa_manual_quotation" modelAttribute="MANUAL_VSA">
            <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
            <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
            <input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
            <div class="form_view_search_visa_add_quotation" style="margin-top:-60px">
                <div class="form_view_search_visa_add_quotation_wrapper">
                    <div class="form_view_search_visa_add_quotation_wrapper_data">
                        <div class="form_view_search_visa_add_quotation_wrapper_data_line">
                            <div class="form_view_search_visa_add_quotation_wrapper_data_l1_h">
                                <p>Visa Country</p>
                                <p style="padding-right: 20px;">${VISA_OBJ.countryName}</p>
                                <p style="padding-left: 80px;">Visa Consulate</p>
                                <p style="padding-right: 20px;">${VISA_OBJ.cityName}</p>
                            </div>
                            <div class="vertical-line"></div>
                           
                            <div class="form_view_search_visa_add_quotation_wrapper_data_l1_btns">
                                <div class="due_today_task_data_btns part">
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
                                    <label for="" class="lb">Adults</label>
                                    <form:input path="adults" type="number" min="0" />
                                     <font color="red">
                                        <form:errors path="adults" cssClass="error" />
                                    </font>
                                </div>
                                <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                    <label for="" class="lb">Child</label>
                                    <form:input path="children" type="number" min="0" />
                                </div>
                                <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                    <label for="" class="lb">Infants</label>
                                    <form:input path="infant" type="number" min="0" />
                                </div>
                                <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                    <label for="" class="lb">Display Order</label>
                                    <form:input path="displayOrder" type="number" min="0" />
                                </div>
                            </div>
                            <div class="form_view_search_visa_add_quotation_wrapper_data_l1_c">
                                <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                    <label for="" class="lb">System Cost PP(B2C)</label>
                                    <p>${VISA_OBJ.standardCost}</p>
                                </div>
                                <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                    <label for="" class="lb">B2C S.Price PP | B2B S.Price PP </label>
                                    <p>${VISA_OBJ.standardB2cPrice } | ${VISA_OBJ.standardB2bPrice } </p>
                                </div>
                                <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                    <label for="" class="lb">Total Updated Cost</label>
                                    <form:input path="visaCost" type="number" min="0" />
                                </div>
                                <div class="form_view_search_visa_add_quotation_wrapper_data_in">
                                    <label for="" class="lb">Total Markup</label>
                                    <form:input path="visaMarkup" type="number" min="0" />
                                </div>
                            </div>
                            <div class="form_view_search_visa_add_quotation_wrapper_data_l1_c"
                                style="margin-bottom: 20px;">
                                <div class="form_view_search_visa_add_quotation_wrapper_data_rem">
                                    <label for="" class="lb">Remarks</label> <br>
                                    <form:textarea path="remarks" rows="2" cols="140" maxlength="1450" />
                                </div>
                            </div>
                            <div class="rel-btns">
                                <input type="button" value="Compute B2C" onclick="computeb2c();" />
                                <input type="button" value="Compute B2B" onclick="computeb2b();" />
                            </div>
                            <div class="due_today_task_data_btns" style="margin-top: 15px;">
                                <input type="submit" name="addVisa" id="addVisa" Value="Add Visa" />
                                <a
                                    href="form_view_visa_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}">Cancel</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form:form>
    </c:if>
    
    
    
<script>
$('#countryName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCountryList',
	paramName: "countryName",
	delimiter: ",",
	onSelect: function(suggestion) {
        cityID = suggestion.data;
        id=cityID;
        jQuery("#countryCode").val(cityID);
        $('input[name=countryCode]').val(id);
        return false;
    },
	transformResult: function(response) {
        return {
            suggestions: $.map($.parseJSON(response), function(item) {
            	return { value: item.countryName, data: item.countryCode };
            })
            
        };
    }
});

</script>
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