<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=\, initial-scale=1.0">
                        <title>form_viewDeal</title>
                        <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
                        <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
                        <script src="<c:url value="/resources/core/magicsuggest.js" />"></script>
                        <link rel="stylesheet" href="style.css">
                        <link href="resources/core/magicsuggest.css" rel="stylesheet" type="text/css">
                        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
                    </head>
                    <style>
                      body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/lens.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            background-attachment: fixed;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0.5; /* Adjust the opacity value as needed (0.0 to 1.0) */
            z-index: -1;
        }
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
                        <div class="form_viewDeal container">
                            <div class="form_viewDeal_wrapper bs">
                                <h1 style="font-size:25px;color:#32cd32 ">Edit Deal</h1>
                                <form:form modelAttribute="dealRecorder" action="edit_workload_MainDealRecord">
                                    <input type="hidden" name="dealConfirmationId" value="${DealObject.dealConfirmationId}" />
                                    <div class="form_viewDeal_wrapper_data">
                                        <div class="form_viewDeal_wrapper_data_line">
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" >Deal Confirmation Number</label>
                                                <p style="color:#32cd32 ;font-weight:bold;">UDN- ${DealObject.dealConfirmationId}</p>
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" >Deal Status</label>
                                                <select name="dealStatus" style="width:90%">
                                                    <c:if test="${not empty DEAL_STATUS_LIST}">
                                                        <option value="" class="service-small">Select</option>
                                                        <c:forEach items="${DEAL_STATUS_LIST}" var="statusObj">
                                                            <c:if
                                                                test="${statusObj.workloadStatusId eq DealObject.dealStatus}">
                                                                <option class="service-small"
                                                                    value="${statusObj.workloadStatusId}" selected>
                                                                    ${statusObj.workloadStatusName}</option>
                                                            </c:if>
                                                            <c:if
                                                                test="${statusObj.workloadStatusId ne DealObject.dealStatus}">
                                                                <option class="service-small"
                                                                    value="${statusObj.workloadStatusId}">
                                                                    ${statusObj.workloadStatusName}
                                                                </option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </c:if>
                                                </select>
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" >Query Id</label>
                                                <input style="width:90%" type="text" name="queryId" id="queryId" placeholder="Query Id"
                                                    size="35" value="${DealObject.queryId}" required />
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="">Client Name</label>
                                                <input style="width:90%" type="text" class="contact" id="clientName" name="clientName"
                                                    size="35" placeholder="Lead Guest Name"
                                                    value="${DealObject.clientName}" required />
                                                <input type="hidden" name="clientId" value="${DealObject.clientId}" />
                                            </div>
                                        </div>
                                        <div class="form_viewDeal_wrapper_data_line">
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" >Traveling From</label>
                                                <input style="width:90%" type="text" name="travelingFromCtrl" id="travelingFromCtrl"
                                                    size="35" placeholder="Traveling From"
                                                    value="${DealObject.travelingFromCity}" required />
                                                <input type="hidden" name="travelingFrom" value="${DealObject.travelingFrom}" />
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="">Traveing To</label>
                                                <input style="width:90%" type="text" name="travelingToCtrl" id="travelingToCtrl" size="35"
                                                    placeholder="Traveling To" value="${DealObject.travelingToCity}"
                                                    required />
                                                <input type="hidden" name="travelingTo" value="${DealObject.travelingTo}" />
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="">Adults</label>
                                                <input style="width:90%" type="text" id="adults" name="adults" pattern="[0-9.]+"
                                                    value="${DealObject.adults}" required />
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" >Children</label>
                                                <input style="width:90%" type="text" id="children" name="children" pattern="[0-9.]+"
                                                    value="${DealObject.children}" required />
                                            </div>
                                        </div>
                                        <div class="form_viewDeal_wrapper_data_line">
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" >Booking Date</label>
                                                <input style="width:90%" type="date" id="bookingDate" name="bookingDate"
                                                    value="${DealObject.bookingDate}" />
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="">Travel Start Date</label>
                                                <input style="width:90%" type="date" name="travelStartDate"
                                                    value="${DealObject.travelStartDate}" />
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="">Travel End Date</label>
                                                <input style="width:90%" type="date" name="travelEndDate"
                                                    value="${DealObject.travelEndDate}" />
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">

                                            </div>
                                        </div>
                                        <h1 style="text-align: start;margin:10px 0;color:orangered">Please check the services confirmed (Any Service
                                            / Workload where service line exists , can not be removed.)</h1>
                                        <div class="form_viewDeal_wrapper_data_line_ser ">
                                            <c:forEach var="listValue" items="${UdnServicesList}" varStatus="status">
                                                <jsp:useBean id="status"
                                                    type="javax.servlet.jsp.jstl.core.LoopTagStatus" />
                                                <td>
                                                    <label class="container">
                                                        <c:choose>
                                                            <c:when
                                                                test='${fn:contains(DealObject.serviceWorkLoadList, listValue.serviceCode)}'>
                                                                <form:checkbox path="serviceList"
                                                                    value="${listValue.serviceCode}"
                                                                    checked="checked" style="width:18px;height:18px"/>
                                                                <c:out value="${listValue.serviceName}" /><span
                                                                    class="checkmark"></span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <form:checkbox path="serviceList"
                                                                    value="${listValue.serviceCode}" style="width:18px;height:18px"/>
                                                                <c:out value="${listValue.serviceName}" /><span
                                                                    class="checkmark"></span>
                                                            </c:otherwise>
                                                        </c:choose>

                                                    </label>
                                                </td>
                                                <c:choose>
                                                    <c:when test="<%=status.getCount()%5==0 && (!status.isLast())%>">
                                                        </tr>
                                                        <tr>
                                                    </c:when>
                                                </c:choose>
                                            </c:forEach>
                                            </tr>
                                            </table>
                                        </div>
                                        <div class="form_viewDeal_wrapper_data_line_des" style="margin-top:10px">
                                            <h1 style="text-align: start;">Deal Detailed Description</h1>
                                            <textarea rows="5" cols="143"
                                                name="dealDescription">${DealObject.dealDescription}</textarea></td>
                                            </tr>
                                        </div>

                                        <div class="form_viewDeal_wrapper_data_line">
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" >Please select Source of Deal</label>
                                                <select name="dealSource" style="width:90%" required>
                                                    <option value="" class="service-small">Choose Deal Source</option>
                                                    <c:if test="${not empty DEAL_SOURCE}">
                                                        <c:forEach items="${DEAL_SOURCE}" var="agentObj">
                                                            <c:if
                                                                test="${agentObj.partnerId eq DealObject.dealSource }">
                                                                <option value="${ agentObj.partnerId}"
                                                                    class="service-small" selected>${
                                                                    agentObj.partnerName}</option>
                                                            </c:if>
                                                            <c:if
                                                                test="${agentObj.partnerId ne DealObject.dealSource }">
                                                                <option value="${ agentObj.partnerId}"
                                                                    class="service-small">${ agentObj.partnerName}
                                                                </option>
                                                            </c:if>

                                                        </c:forEach>
                                                    </c:if>
                                                </select>
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="">Please select Business Type
                                                    ${DealObject.isNewClient }</label>
                                                <select id="isNewClient" name="isNewClient" style="width:90%"  required>
                                                    <option value="" class="service-small">Choose Business type</option>
                                                    <c:if test="${DealObject.isNewClient eq true }">
                                                        <option value="true" class="service-small" selected>New Client
                                                        </option>
                                                        <option value="false" class="service-small">Existing Client
                                                        </option>
                                                    </c:if>
                                                    <c:if test="${DealObject.isNewClient ne true }">
                                                        <option value="true" class="service-small">New Client</option>
                                                        <option value="false" class="service-small" selected>Existing
                                                            Client</option>

                                                    </c:if>
                                                </select>
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="">Projected Cost</label>
                                                <input style="width:90%"  type="text" name="projectedCost" id="projectedCost"
                                                    placeholder="Cost Total" value="${DealObject.projectedCost}"
                                                    size="15" required />
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for=""  >Deal Value</label>
                                                <input style="width:90%" type="text" name="sellingPrice" id="sellingPrice"
                                                    placeholder="Selling Price" value="${DealObject.sellingPrice}"
                                                    style="width: 150px;" size="15" required />
                                            </div>

                                        </div>
                                        <div class="form_viewDeal_wrapper_data_line">
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="">Cost Incurred</label>
                                                <p style="background:lightpink;width:30px;color:black">${DealObject.actualCost }</p>
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">

                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">

                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">

                                            </div>

                                        </div>
                                        <div class="form_viewDeal_wrapper_data_line">
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="">Deal Owner</label>
                                                <sec:authorize access="hasAnyRole('ADMIN','DEAL_MANAGER')">
                                                    <td>
                                                        <div class="select">
                                                            <form:select path="dealOwner" style="width:90%" required="required">
                                                                <form:options items="${ACTIVE_USERS_MAP}" class="service-small" />
                                                            </form:select>
                                                        </div>
                                                    </td>
                                                </sec:authorize>
                                                <sec:authorize access="! hasAnyRole('ADMIN','DEAL_MANAGER')">
                                                    <td>
                                                        <form:hidden path="dealOwner" />
                                                        ${dealRecorder.dealOwnerName}
                                                    </td>

                                                </sec:authorize>
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" >Tag Teammate</label>
                                                <input type="text" id="dealTeams" name="dealTeams" class="form-control"
                                                    style="width:90%;background:lightgray;border:1px solid black" />
                                                <form:hidden path="teamNames" />
                                                <form:hidden path="operatingTeams" />
                                            </div>

                                            <div class="form_viewDeal_wrapper_data_l1">

                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">

                                            </div>

                                        </div>
                                        <div class="due_today_task_data_btnss" style="margin-top:10px;display:flex;justify-content:center" >
                                           <button style=" display: inline-block; color: white;width: auto;padding: 10px 15px;border-radius: 10px;background:  #32cd32  ;color: black;transition: all 0.3s ease-in-out;outline: none;border: none;margin-right: 5px;" type="submit" href="/">Update Deal</button>
                                            <form:form action="view_view_deal_form">
                                                <input type="hidden" name="dealConfirmationId" value="${DealObject.dealConfirmationId}" />
                                                <div style="display:inline-block">
                                                	<button style=" display: inline-block; color: white;width: auto; padding: 10px 15px;border-radius: 10px;background: red;color: white;transition: all 0.3s ease-in-out;outline: none;border: none;margin-right: 5px;" type="submit" href="/" color="green">Cancel</button>
                                                </div>
                                           </form:form>
                                           <form:form action="view_workload_createNewWorkLoadForm" target="_blank">
												<input type="hidden" name="dealConfirmationId" value="${DealObject.dealConfirmationId}" />
                                                <div style="display:inline-block"> 
                                                	<button style=" display: inline-block;color: white;width: auto;padding: 10px 15px;border-radius: 10px;background: #ffb908cf;color: black;transition: all 0.3s ease-in-out;outline: none;border: none;margin-right: 5px;" type="submit" href="/">View WorkLoad</button>
                                                </div>
                                           </form:form>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>
                        <script>
                            $(function () {
                                var ms = $('#dealTeams').magicSuggest({
                                    data: '${pageContext.request.contextPath}/getTeamList',
                                    valueField: 'id',
                                    displayField: 'tagName',
                                    //name: 'operatingDestinations',
                                    maxDropHeight: 145,
                                    maxSuggestions: 10,
                                    resultAsString: true
                                });
                                //ms.addToSelection([{"id":4,"tagName":"Mumbai"},{"id":542,"tagName":"New Delhi"}]);

                                $(ms).on('load', function () {
                                    if (this._dataSet === undefined) {
                                        this._dataSet = true;
                                        ms.addToSelection(${ DealObject.teamNames });
                                        ms.setDataUrlParams({});
                                    }
                                });


                                $(ms).on('selectionchange', function (e, m) {
                                    $("#operatingTeams").val(ms.getValue());
                                });
                            });





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