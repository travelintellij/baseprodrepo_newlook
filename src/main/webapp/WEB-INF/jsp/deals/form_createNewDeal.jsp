<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
	<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body
    style="background: url(${pageContext.request.contextPath}/resources/images/revamped/create_new_deal.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">

    <div class="craete_new_deal container">
        <div class="create_new_deal_wrapper">
            <h1 class="create_new_deal_heading">
                Create New Win
            </h1>
            <form:form modelAttribute="dealRecorder" action="create_workload_MainDealRecord">
                <div class="create_new_win_data">
                    <div class="create_new_win_li1">
                        <div class="create_new_win_li">
                            <label for="queary_id">Queary Id</label>
                            <input type="text" id="queary_id" required>
                        </div>
                        <div class="create_new_win_li">
                            <label for="clientName">Lead Guest name</label>
                            <input type="text" class="contact" id="clientName" name="clientName" value=""
                                placeholder="Lead Guest Name" required>
                        </div>
                        <div class="create_new_win_li">
                            <label for="travelingFromCtrl">Traveling from</label>
                            <input type="text" " name=" travelingFromCtrl" id="travelingFromCtrl"
                                placeholder="Traveling From" vale="" required>
                        </div>
                        <div class="create_new_win_li">
                            <label for="tt">Traveling to</label>
                            <input type="travelingToCtrl" name="travelingToCtrl" id="travelingToCtrl"
                                placeholder="Traveling To" value="" required>
                        </div>
                    </div>
                    <div class="create_new_win_li2">
                        <div class="create_new_win_li">
                            <label for="adults">Adults</label>
                            <input id="adults" type="text" id="adults" name="adults" pattern="[0-9.]+" required>
                        </div>
                        <div class="create_new_win_li">
                            <label for="Children">Children</label>
                            <input id="Children" type="text" id="children" name="children" pattern="[0-9.]+" required>
                        </div>
                        <div class="create_new_win_li">
                            <label for="bookingDate">Booking Date</label>
                            <input type="date" id="bookingDate" name="bookingDate">
                        </div>
                    </div>
                    <div class="create_new_win_li2">
                        <div class="create_new_win_li">
                            <label for="tsd">Traveling Start Date</label>
                            <input id="tsd" type="date" name="travelStartDate">
                        </div>
                        <div class="create_new_win_li">
                            <label for="ted">Traveling End Date</label>
                            <input id="ted" type="date" name="travelEndDate">
                        </div>
                    </div>
                    <div class="create_new_win_li3">
                        <h2 class="new_deal_ser_package_h2">Please check the services confirmed</h2>
                        <div class="new_deal_ser">
                            <c:forEach var="listValue" items="${UdnServicesList}" varStatus="status">
                                <jsp:useBean id="status" type="javax.servlet.jsp.jstl.core.LoopTagStatus" />
                                <td>
                                    <label class="container">
                                        <form:checkbox path="serviceList" value="${listValue.serviceCode}" />
                                        <c:out value="${listValue.serviceName}" />
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
                    <div class="create_new_deal_des">
                        <h2>Deal Detailed Description</h2>
                        <textarea name="" id="" cols="30" rows="3" style="width: 100%;border-radius:5px"></textarea>
                    </div>
                    <div class="create_new_win_li2">
                        <div class="create_new_win_li">
                            <label for="sod">Please select Source of Deal</label>
                            <select name="dealSource" required>
                                <option value="" class="service-small" selected>Choose Deal Source</option>
                                <c:if test="${not empty DEAL_SOURCE}">
                                    <c:forEach items="${DEAL_SOURCE}" var="agentObj">
                                        <option value="${ agentObj.partnerId}" class="service-small">${
                                            agentObj.partnerName}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                        <div class="create_new_win_li">
                            <label for="bt">Please select Business Type</label>
                            <select id="isNewClient" name="isNewClient" required>
                                <option value="" class="service-small">Choose Business type</option>
                                <option value="true" class="service-small">New Client</option>
                                <option value="false" class="service-small">Existing Client</option>
                            </select>
                        </div>
                        <div class="create_new_win_li">
                            <label for="projectedCost">Projected Cost</label>
                            <input placeholder="Cost Total" type="text" name="projectedCost" id="projectedCost"
                                placeholder="Cost Total" required>
                        </div>
                        <div class="create_new_win_li">
                            <label for="sellingPrice">Selling Price</label>
                            <input placeholder="seliing price" type="text" name="sellingPrice" id="sellingPrice"
                                placeholder="Selling Price" required>
                        </div>
                    </div>
                    <div class="cr-new-deal_infor_client">
                        <p>Inform Client With Confirmation Code (system will send email)
                            <span> <input type="radio" value="yes" id="yes" name="isClientInformed" checked> <label
                                    for="yes" class="radio">Yes</label><input type="radio" value="no" id="no"
                                    name="isClientInformed" style="margin-left: 10px;">No<label for="no"
                                    class="radio"></label> </span>
                        </p>
                    </div>
                    <div class="create_new_deal_btn">
                        <button type="submit" href="/">Create Won Deal</button>
                    </div>
                </div>
            </form:form>
        </div>
    </div>


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
        
        </div> <!-- End of Main Block -->
        <%-- <jsp:include page="_Workloadfooter.jsp" /> --%>


</body>

</html>