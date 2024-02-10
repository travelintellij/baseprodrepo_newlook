<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>form_viewDeal_modal</title>
                        <link rel="stylesheet" href="style.css">
                        <script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
                        <script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
               
                    </head>
                    <br>
                    <br>
                    <body>
                        <div class="form_viewDeal_modal">
                            <div class="form_viewDeal_modal_wrapper">
                                <font color="green"> ${Success} </font>
                                <font color="red"> ${Error}</font>
                                <form:form modelAttribute="dealRecorder" action="edit_workload_MainDealRecord">
                                    <input type="hidden" name="dealConfirmationId"
                                        value="${DealObject.dealConfirmationId}" />
                                    <div class="form_viewDeal_modal_wrapper_data a">
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                            <label for="" class="lb">Deal Confirmation No</label>
                                            <p>UDN- ${DealObject.dealConfirmationId}</p>
                                        </div>
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                            <label for="" class="lb">Deal Status</label>
                                            <p>${DealObject.statusName}</p>
                                        </div>
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                            <label for="" class="lb">Query Id </label>
                                            <p>${DealObject.queryId}</p>
                                        </div>
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                            <label for="" class="lb">Client Name</label>
                                            <p>${DealObject.clientName}</p>
                                        </div>
                                    </div>
                                    <div class="form_viewDeal_modal_wrapper_data a">
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                            <label for="" class="lb">Traveling From</label>
                                            <p>${DealObject.travelingFromCity}</p>
                                        </div>
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                            <label for="" class="lb">Travelling to</label>
                                            <p>${DealObject.travelingToCity}</p>
                                        </div>
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                            <label for="" class="lb">Adults</label>
                                            <p>${DealObject.adults}</p>
                                        </div>
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                            <label for="" class="lb">Children</label>
                                            <p>${DealObject.children}</p>
                                        </div>
                                    </div>
                                    <div class="form_viewDeal_modal_wrapper_data a">
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                            <label for="" class="lb">Booking Date</label>
                                            <p>
                                                <fmt:formatDate value="${DealObject.bookingDate}"
                                                    pattern="dd-MM-yyyy" />
                                            </p>
                                        </div>
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                            <label for="" class="lb">Travel Start Date</label>
                                            <p>
                                                <fmt:formatDate value="${DealObject.travelStartDate}"
                                                    pattern="dd-MM-yyyy" />
                                            </p>
                                        </div>
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                            <label for="" class="lb">Travel End Date</label>
                                            <p>
                                                <fmt:formatDate value="${DealObject.travelEndDate}"
                                                    pattern="dd-MM-yyyy" />
                                            </p>
                                        </div>
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                        </div>
                                    </div>
                                    <h1 style="text-align: start;" class="lb">Services Confirmed</h1>
                                    <div class="form_viewDeal_modal_wrapper_data_ser  a">
                                                <c:forEach var="listValue" items="${UdnServicesList}"
                                                    varStatus="status">
                                                    <jsp:useBean id="status"
                                                        type="javax.servlet.jsp.jstl.core.LoopTagStatus" />
                                                            <c:choose>
                                                                <c:when
                                                                    test='${fn:contains(DealObject.serviceWorkLoadList, listValue.serviceCode)}'>
                                                                    <form:checkbox path="serviceList"
                                                                        value="${listValue.serviceCode}"
                                                                        checked="checked" disabled="true" class="ch_c" style="width:18px;height:18px"/>
                                                                    <c:out value="${listValue.serviceName}" /><span
                                                                        class="checkmark"></span>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <form:checkbox path="serviceList"
                                                                        value="${listValue.serviceCode}"
                                                                        disabled="true"  class="ch_c" style="width:18px;height:18px"/>
                                                                    <c:out value="${listValue.serviceName}" /><span
                                                                        class="checkmark"></span>
                                                                </c:otherwise>
                                                            </c:choose>

                                                        </label>
                                                    
                                                    <c:choose>
                                                        <c:when
                                                            test="<%=status.getCount()%5==0 && (!status.isLast())%>">
                                            </tr>
                                            <tr>
                                                </c:when>
                                                </c:choose>
                                                </c:forEach>
                                            </tr>
                                        </table>

                                    </div>
                                    <div class="form_viewDeal_modal_wrapper_data a" style="width:100%;">
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                            <label for="" class="lb">Deal Detailed Description</label>
                                            <p>${DealObject.dealDescription}</p>
                                        </div>
                                    </div>
                                    <div class="form_viewDeal_modal_wrapper_data a">
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                            <label for="" class="lb">Deal Source</label>
                                            <p>${DealObject.dealSourceName }</p>
                                        </div>
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                            <label for="" class="lb">New Client</label>
                                            <p>${DealObject.isNewClient}</p>
                                        </div>
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                            <label for="" class="lb">Project Cost</label>
                                            <p>${DealObject.projectedCost }</p>
                                        </div>
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                            <label for="" class="lb">Deal Value</label>
                                            <p>${DealObject.sellingPrice}</p>
                                        </div>
                                    </div>
                                    <div class="form_viewDeal_modal_wrapper_data a">
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                            <label for="" class="lb">Cost Incurred</label>
                                            <p>${DealObject.actualCost }</p>
                                        </div>
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                        </div>
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                        </div>
                                        <div class="form_viewDeal_modal_wrapper_data_line">
                                        </div>
                                </form:form>
                            </div>
                        </div>
                    </body>

</html>