<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>form_convertNewDeal</title>
    <link rel="stylesheet" href="style.css">
    <script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
    <script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body style="background: url(${pageContext.request.contextPath}/resources/images/revamped/del_War.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
    <form:form modelAttribute="DEAL_OBJ" action="convert_Quotation_To_DealRecord">
        <form:hidden path="travelingFrom" id="travelingFrom" />
        <form:hidden path="travelingTo" id="travelingTo" />
        <form:hidden path="adults" id="adults" />
        <form:hidden path="children" id="children" />
        <form:hidden path="serviceList" id="serviceList" />
        <input type="hidden" name="clientId" value="${LEAD_OBJ.contactId }" />
        <form:hidden path="queryId" id="queryId" />
        <form:hidden path="travelStartDate" id="travelStartDate" />
        <form:hidden path="travelEndDate" id="travelEndDate" />
        <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId }" />
       <div class="form_convertNewDeal container">
        <div class="form_convertNewDeal_wrapper">
        <h2 style="font-size:25px;margin-bottom:15px;color:#32cd32  "align="center">Confirm: Convert New Win</h2>
            <div class="form_convertNewDeal_wrapper_data">
                <div class="form_convertNewDeal_wrapper_data_line ">
                    <div class="form_convertNewDeal_wrapper_dl1">
                        <label style="font-weight:normal" for="" class="lb" style="font-weight:normal">Queary Id</label>
                        <p style="font-weight:800;color:#32cd32 ">Q-${String.format("%04d",LEAD_OBJ.leadId)}-${LEAD_OBJ.leadSourceShortName }</p>
                    </div>
                    <div class="form_convertNewDeal_wrapper_dl1">
                        <label style="font-weight:normal" for="" class="lb" >Client Name</label>
                        <p style="font-weight:800;color:#023e8a ">${LEAD_OBJ.contactName }</p>
                    </div>
                    <div class="form_convertNewDeal_wrapper_dl1">
                        <label style="font-weight:normal" for="" class="lb">Source</label>
                        <p style="font-weight:800;color:#023e8a ">${LEAD_OBJ.sourceName}</p>
                    </div>
                    <div class="form_convertNewDeal_wrapper_dl1">
                        <label style="font-weight:normal" for="" class="lb">Destination</label>
                        <p style="font-weight:800;color:#023e8a ">${LEAD_OBJ.destinationName}</p>
                    </div>
                </div>
                <div class="form_convertNewDeal_wrapper_data_line ">
                    <div class="form_convertNewDeal_wrapper_dl1">
                        <label style="font-weight:normal" for="" class="lb">Adults</label>
                        <p style="font-weight:800;color:#023e8a ">${LEAD_OBJ.adults}</p>
                    </div>
                    <div class="form_convertNewDeal_wrapper_dl1">
                        <label style="font-weight:normal" for="" class="lb">Children</label>
                        <p style="font-weight:800;color:#023e8a ">${LEAD_OBJ.children}(Age ${LEAD_OBJ.childrenAgeInfo} )</p>
                    </div>
                    <div class="form_convertNewDeal_wrapper_dl1">
                        <label style="font-weight:normal" for="" class="lb">Booking Date</label> <br>
                    <input type="date" id="bookingDate" name="bookingDate" style="width:90%" />
                    </div>
                    <div class="form_convertNewDeal_wrapper_dl1">
                        <label  style="font-weight:normal" for="" class="lb">Travel start date</label> <br>
                        <p style="font-weight:800;color:#023e8a ">
                        <fmt:formatDate value="${LEAD_OBJ.travelStartDate}" pattern="dd-MMM-yyyy" />
                        </p>
                    </div>
                </div>
                <div class="form_convertNewDeal_wrapper_data_line ">
                    <div class="form_convertNewDeal_wrapper_dl1">
                        <label style="font-weight:normal" for="" class="lb">Travel end date</label> <br>
                        <p style="font-weight:800;color:#023e8a ">
                    <fmt:formatDate value="${LEAD_OBJ.travelEndDate}" pattern="dd-MMM-yyyy" />
                    </p>
                    </div>
                </div>
            </div>
            <h1 class="lb" style="text-align: start;font-weight:normal" >Services opted</h1>
            <div class="form_convertNewDeal_wrapper_data_line">
                <div class="form_convertNewDeal_ser">
                        <c:forEach var="listValue" items="${UdnServicesList}" varStatus="status">
                            <jsp:useBean id="status" type="javax.servlet.jsp.jstl.core.LoopTagStatus" />
                            <td>
                                <label class="container" style="color:black">
                        
                                    <%-- <form:checkbox path="serviceList" value="${listValue.serviceCode}" />
                                    --%>
                        
                        
                                    <c:if test="${fn:containsIgnoreCase(UdnSoldServicesList, listValue.serviceCode)}">
                                        <form:checkbox class="ch_c" style="width:18px;height:18px" path="serviceList" value="${listValue.serviceCode}" checked="checked" disabled="true" />
                                        <c:out value="${listValue.serviceName}" />
                                    </c:if>
                                    <c:if test="${not fn:containsIgnoreCase(UdnSoldServicesList, listValue.serviceCode)}">
                                        <form:checkbox class="ch_c" style="width:18px;height:18px" path="serviceList" value="${listValue.serviceCode}" disabled="true" />
                                        <c:out value="${listValue.serviceName}" />
                                    </c:if>
                        
                                    <!-- <input type="checkbox" value="${listValue.serviceCode}" id="${listValue.serviceCode}"  />
                        						 -->
                        
                                    <span class="checkmark"></span>
                                </label>
                            </td>
                            <c:choose>
                                <c:when test="<%=status.getCount()%5==0 && (!status.isLast())%>">
                                    </tr>
                                    <tr>
                                </c:when>
                            </c:choose>
                        </c:forEach>
                </div>
            </div>
                <div class="form_convertNewDeal_wrapper_data_line">
                    <div class="form_convertNewDeal_wrapper_dl1">
                        <label style="font-weight:800" for="" class="lb">Deal Detailed Description</label> 
                        <textarea rows="2" cols="143" name="dealDescription">${LEAD_OBJ.clientRemarks.trim()}</textarea>
                    </div>
                </div>
                <div class="form_convertNewDeal_wrapper_data_line">
                    <div class="form_convertNewDeal_wrapper_dl1">
                        <label for="" class="lb" style="font-weight:800">Source of Deal</label> <br>
                    <form:select path="dealSource" itemValue="${LEAD_OBJ.leadSource}" style="width:90%">
                        <form:options items="${PARTNERS_MAP}" />
                    </form:select>
                    </div>
                    <div class="form_convertNewDeal_wrapper_dl1">
                        <label for="" class="lb" style="font-weight:800">Business type</label>
                        <select id="isNewClient" name="isNewClient" required style="width:90%">
                            <option value="" class="service-small">Choose Business type</option>
                            <c:if test="${DEAL_OBJ.isNewClient eq true }">
                                <option value="true" class="service-small" selected>New Client</option>
                                <option value="false" class="service-small">Existing Client</option>
                            </c:if>
                            <c:if test="${DEAL_OBJ.isNewClient ne true }">
                                <option value="true" class="service-small">New Client</option>
                                <option value="false" class="service-small" selected>Existing Client</option>
                        
                            </c:if>
                        </select>
                    </div>
                    <div class="form_convertNewDeal_wrapper_dl1">
                        <label for="" class="lb" style="font-weight:800">Projected cost</label>
                    <form:input path="projectedCost" name="projectedCost" size="15" required="required" style="width:90%"/>
                    </div>
                    <div class="form_convertNewDeal_wrapper_dl1">
                        <label for="" class="lb" style="font-weight:800">Projacted mark up</label>
                    <form:input path="projectedMarkup" name="projectedMarkup"  size="15" required="required"  style="width:100%"/>
                    </div>
                </div>
                <div class="form_convertNewDeal_wrapper_data_line">
                    <div class="form_convertNewDeal_wrapper_dl1">
                        <label for="" class="lb" style="font-weight:800">Selling price</label>
                        <form:input path="sellingPrice" name="sellingPrice"  size="15" required="required" style="width:88%"/>
                    </div>
                </div>
                <p style="display: inline-block;color:black">Inform client with confirmation code (system will send email)</p>
                <input type="radio" value="yes" id="yes" name="isClientInformed" checked />
                <label for="yes" class="radio" style="color:black">Yes</label>
                <input type="radio" value="no" id="no" name="isClientInformed" />
                <label for="no" class="radio"  style="color:black">No</label>
                <div class="due_today_task_data_btns">
                <button type="submit" href="/" style=" display: inline-block;
    color: white;
    width: auto;
    padding: 10px 15px;
    border-radius: 10px;
    background: #32cd32  ;
    color: black;
    transition: all 0.3s ease-in-out;
    outline: none;
    border: none;
    margin-right: 5px;
    cursor:pointer">Create Won Deal</button>
                    <a href="view_lead_quotations_list?leadId=${LEAD_OBJ.leadId}">Back List Versions</a>
                    <a href="form_view_edit_quotation_details?leadId=${LEAD_OBJ.leadId}&quotationId=${QTN_OBJ.quotationId}"> Edit Quotation</a>
                </div>
        </div>
    </div>
    </div>
    </div>
        </form:form>

        <script>
            document.getElementById('bookingDate').value = new Date().toISOString().substring(0, 10);

            $(document).ready(function () {
                $('#clientName').autocomplete({
                    serviceUrl: '${pageContext.request.contextPath}/getClientList',
                    paramName: "tagName",
                    delimiter: ",",
                    onSelect: function (suggestion) {
                        cityID = suggestion.data;
                        id = cityID;
                        jQuery("#clientId").val(cityID);
                        $('input[name=clientId]').val(id);
                        return false;
                    },
                    transformResult: function (response) {
                        return {
                            suggestions: $.map($.parseJSON(response), function (item) {
                                return { value: item.tagName, data: item.id };
                            })

                        };
                    }
                });


                $('#travelingFromCtrl').autocomplete({
                    serviceUrl: '${pageContext.request.contextPath}/getCityList',
                    paramName: "cityName",
                    delimiter: ",",
                    onSelect: function (suggestion) {
                        cityID = suggestion.data;
                        id = cityID;
                        jQuery("#destinationId").val(cityID);
                        $('input[name=travelingFrom]').val(id);
                        return false;
                    },
                    transformResult: function (response) {
                        return {
                            suggestions: $.map($.parseJSON(response), function (item) {
                                return { value: item.cityName, data: item.destinationId };
                            })

                        };
                    }
                });

                $('#travelingToCtrl').autocomplete({
                    serviceUrl: '${pageContext.request.contextPath}/getCityList',
                    paramName: "cityName",
                    delimiter: ",",
                    onSelect: function (suggestion) {
                        cityID = suggestion.data;
                        id = cityID;
                        jQuery("#destinationId").val(cityID);
                        $('input[name=travelingTo]').val(id);
                        return false;
                    },
                    transformResult: function (response) {
                        return {
                            suggestions: $.map($.parseJSON(response), function (item) {
                                return { value: item.cityName, data: item.destinationId };
                            })

                        };
                    }
                });
            });



        </script>
</body>

</html>