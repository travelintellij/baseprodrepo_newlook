<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=\, initial-scale=1.0">
                        <title>form_viewDeal</title>
                        <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
                        <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
                        <link rel="stylesheet" href="style.css">
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
</style>
                    <body>
                        <div class="form_viewDeal container">
                            <div class="form_viewDeal_wrapper">
                                <h1 style="font-size:25px;color: #32cd32 ">View Deal</h1>
                                <div align="center"><b>
                                        <font color="green"> ${Success} </font>
                                        <font color="red"> ${Error}</font>
                                    </b></div>
                                <form:form modelAttribute="dealRecorder" action="edit_workload_MainDealRecord">
                                    <input type="hidden" name="dealConfirmationId"
                                        value="${DealObject.dealConfirmationId}" />
                                    <div class="form_viewDeal_wrapper_data">
                                        <div class="form_viewDeal_wrapper_data_line a">
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" class="lb">Deal Confirmation Number</label>
                                                <p>UDN- ${DealObject.dealConfirmationId}</p>
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" class="lb">Deal Status</label>
                                                <p>${DealObject.statusName}</p>
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" class="lb">Query Id</label>
                                                <p>${DealObject.queryId}</p>
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" class="lb">Client Name</label>
                                                <p>${DealObject.clientName}</p>
                                            </div>
                                        </div>
                                        <div class="form_viewDeal_wrapper_data_line a">
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" class="lb">Traveling From</label>
                                                <p>${DealObject.travelingFromCity}</p>
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" class="lb">Traveing To</label>
                                                <p>${DealObject.travelingToCity}</p>
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" class="lb">Adults</label>
                                                <p>${DealObject.adults}</p>
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" class="lb">Children</label>
                                                <p>${DealObject.children}</p>
                                            </div>
                                        </div>
                                        <div class="form_viewDeal_wrapper_data_line a">
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" class="lb">Booking Date</label>
                                               <p>  <fmt:formatDate value="${DealObject.bookingDate}"
                                                    pattern="dd-MM-yyyy" /></p>
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" class="lb">Travel Start Date</label>
                                              <p><fmt:formatDate value="${DealObject.travelStartDate}"
                                                    pattern="dd-MM-yyyy" /></p>  
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" class="lb">Travel End Date</label>
                                              <p>  <fmt:formatDate value="${DealObject.travelEndDate}"
                                                    pattern="dd-MM-yyyy" /></p> 
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">

                                            </div>
                                        </div>
                                        <h1 style="text-align: start;">Services Confirmed</h1>
                                        <div class="form_viewDeal_wrapper_data_line_ser ">
                                            <table style="width:100%">
                                                <tr>

                                                    <c:forEach var="listValue" items="${UdnServicesList}"
                                                        varStatus="status">
                                                        <jsp:useBean id="status"
                                                            type="javax.servlet.jsp.jstl.core.LoopTagStatus" />
                                                        <td style="text-align:start">
                                                            <label>
                                                                <c:choose>
                                                                    <c:when
                                                                        test='${fn:contains(DealObject.serviceWorkLoadList, listValue.serviceCode)}'>
                                                                        <form:checkbox path="serviceList"
                                                                            value="${listValue.serviceCode}"
                                                                            checked="checked" disabled="true" />
                                                                        <c:out value="${listValue.serviceName}" /><span
                                                                            class="checkmark"></span>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <form:checkbox path="serviceList"
                                                                            value="${listValue.serviceCode}"
                                                                            disabled="true" />
                                                                        <c:out value="${listValue.serviceName}" /><span
                                                                            class="checkmark"></span>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                            </label>
                                                        </td>
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
                                        <div class="form_viewDeal_wrapper_data_line_des a" style="margin-top:10px">
                                            <h1 style="text-align: start;" class="lb">Deal Detailed Description</h1>
                                            <p style="text-align:start">${DealObject.dealDescription}</p>
                                        </div>

                                        <div class="form_viewDeal_wrapper_data_line a">
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" class="lb">Deal Source</label>
                                                <p>${DealObject.dealSourceName }</p>
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" class="lb">New Client</label>
                                                <p>${DealObject.isNewClient}</p>
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" class="lb">Projected Cost</label>
                                                <p>${DealObject.projectedCost }</p>
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" class="lb">Deal Value</label>
                                                <p>${DealObject.sellingPrice}</p>
                                            </div>

                                        </div>
                                        <div class="form_viewDeal_wrapper_data_line a">
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" class="lb">Cost Incurred</label>
                                                <p>${DealObject.actualCost }</p>
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">

                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">

                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">

                                            </div>

                                        </div>
                                        <div class="form_viewDeal_wrapper_data_line a">
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" class="lb">Deal Owner</label>
                                                <p>${dealRecorder.dealOwnerName}</p>
                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">
                                                <label for="" class="lb">Tag Teammate</label>
                                                <c:forEach items="${DealObject.team}" var="dealteam">
                                                    <li>${dealteam.name}</li>
                                                </c:forEach>
                                            </div>

                                            <div class="form_viewDeal_wrapper_data_l1">

                                            </div>
                                            <div class="form_viewDeal_wrapper_data_l1">

                                            </div>

                                        </div>
                                        <div class="due_today_task_data_btnss" style="display:flex;justify-content:center;margin-top:20px">
                                            <form:form action="view_edit_deal_form" >
			      	<input type="hidden" name="dealConfirmationId" value="${DealObject.dealConfirmationId}" />
			        <div class="btn-block">
			          <button style="  display: inline-block;
    color: white;
    width: auto;
    padding: 10px 15px;
    border-radius: 10px;
    background:  #32cd32;
    cursor:pointer;
    color: black;
    transition: all 0.3s ease-in-out;
    outline: none;
    border: none;
    margin-right: 5px;" type="submit" href="/">Edit Deal</button>
			        </div>
				</form:form>
                                            <form:form action="view_workload_createNewWorkLoadForm" target="_blank">
                                                <input type="hidden" name="dealConfirmationId"
                                                    value="${DealObject.dealConfirmationId}" />
                                                <div>
                                                    <button style="  display: inline-block;
    color: white;
    width: auto;
    padding: 10px 15px;
    border-radius: 10px;
    background: #ffb908cf;
    color: black;
    cursor:pointer;
    transition: all 0.3s ease-in-out;
    outline: none;
    border: none;
    margin-right: 5px;" type="submit" href="/">View WorkLoad</button>
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                         	</form:form>
                            </div>
                        </div>
                    </body>

</html>