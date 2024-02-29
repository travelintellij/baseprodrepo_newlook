<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>manage hotal chain</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<style>
        body::before {
            content: "";
            background-image: url(${pageContext.request.contextPath}/resources/images/revamped/manage_hotal_chain.jpg);
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

    <div class="manage-hotal-chain container">
        <div class="manage_hotal_chain_wrapper bs">
            <h1>Search Hotel Chain</h1>
            <div align="center" style="margin:10px 0"><b>
                    <font color="#32cd32"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <form:form modelAttribute="SEARCH_HOTEL_CHAIN" action="search_search_hotel_chain">
                <div class="mhc-in-l1">
                    <div class="mhc-li">
                        <label for="hotelChainId" style="font-weight:600;color:black">Hotel Chain Id</label> <br>
                        <input type="number" class="contact" id="hotelChainId" name="hotelChainId"
                            value="${SEARCH_HOTEL_CHAIN.hotelChainId}" />
                    </div>
                    <div class="mhc-li">
                        <label for="hotelChainName" style="font-weight:600;color:black">Hotel Chain Name</label> <br>
                        <input type="text" class="contact" id="hotelChainName" name="hotelChainName" size="35"
                            placeholder="Hotel Chain Name" value="${SEARCH_HOTEL_CHAIN.hotelChainName}" />
                    </div>
                    <div class="mhc-li">
                        <label for="hoatl_active" style="font-weight:600;color:black">Active</label> <br>
                        <select id="active" name="active" style="width:90%;">
                            <c:if test="${SEARCH_HOTEL_CHAIN.active eq true }">
                                <option class="service-small" value="true" selected style="background:white;color:black">
                                    <c:out value="True"/>
                                </option>
                                <option class="service-small" value="false" style="background:white;color:black">
                                    <c:out value="False" />
                                </option>
                            </c:if>
                            <c:if test="${SEARCH_HOTEL_CHAIN.active eq false}">
                                <option class="service-small" value="true">
                                    <c:out value="True" />
                                </option>
                                <option class="service-small" value="false" selected>
                                    <c:out value="False" />
                                </option>

                            </c:if>
                        </select>
                    </div>
                </div>
                <div class="mhc-in-l2">
                    <input type="submit" value="Apply Filter" class="mhc-btn" />
                    <a href="view_search_hotel_chain_form">Clear Filter</a>
                </div>
            </form:form>
        </div>
        <!-- ################ table ################## -->

        <table class="manage-hotal-chain-tabel bs">
            <thead style="background:#6082B6;height:50px;">
                <tr>
                    <th style="width:100px;color:black">Chain No</th>
                    <th style="color:black">Hotel Chain Name</th>
                    <th style="color:black">Hotel Chain Remarks</th>
                    <th style="color:black;width:100px">Active</th>
                    <th style="color:black">Action</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <c:if test="${not empty chainSearchList}">
                        <c:forEach var="chainObj" items="${chainSearchList}">
                <tr>
                    <td style="color:black;text-align:center;border-bottom:2px solid black;border-left:2px solid black;border-right:2px solid black">${chainObj.hotelChainId}</td>
                    <td  style="color:black;text-align:center;border-bottom:2px solid black;">${chainObj.hotelChainName}</td>
                    <td  style="color:black;text-align:center;border-bottom:2px solid black;border-left:2px solid black;">${chainObj.remarks}</td>
                    <td  style="color:black;text-align:center;border-bottom:2px solid black;border-left:2px solid black;">${chainObj.active}</td>
                    <td style="width:15%;text-align:center;border-bottom:2px solid black;border-left:2px solid black;">

                        <table style= "background:transparent;text-align:center">
                            <tr>
                                <td style=";width:50px;text-align:center">
                                    <sec:authorize access="hasAnyRole('ADMIN','HOTEL_CHAIN_EDIT')">
                                        <form:form id="form_update_FLT_SL" name="form_update_FLT_SL"
                                            action="view_edit_hotel_chain_form" method="POST" >
                                            <input type="hidden" name="hotelChainId" value="${chainObj.hotelChainId}" />
                                            <input class="search-hotal-chain-actions" type="submit" value="Edit" style="border:none;outline:none;background:transparent;color:black;margin-right:-50px"/>
                                            <!-- <input type="image" src="${pageContext.request.contextPath}/resources/images/edit.jpg" height="20" width="20"/>  -->
                                        </form:form>
                                    </sec:authorize>

                                    <sec:authorize access="! hasAnyRole('ADMIN','HOTEL_CHAIN_EDIT')">
                                        <form:form id="form_update_FLT_SL" name="form_update_FLT_SL"
                                            action="view_edit_hotel_chain_form" method="POST" style="display:inline;">
                                            <input type="hidden" name="hotelChainId" value="${chainObj.hotelChainId}" />
                                            <input type="submit" value="Edit" disabled />
                                            <!-- <input type="image" src="${pageContext.request.contextPath}/resources/images/edit.jpg" height="20" width="20"/>  -->
                                        </form:form>
                                    </sec:authorize>
                                </td>
                                <td style="width:50px;text-align:center">
                                    <sec:authorize access="hasAnyRole('ADMIN','HOTEL_CHAIN_DELETE')">
                                        <form:form id="form_del_FLT_SL" name="form_del_FLT_SL"
                                            action="view_delete_hotel_chain_form" method="POST" style="display:inline;">
                                            <input type="hidden" name="hotelChainId" value="${chainObj.hotelChainId}" />
                                            <input class="search-hotal-chain-actions" type="submit" value="Delete"  style="border:none;outline:none;background:transparent;color:black;margin-right:20px"/>
                                        </form:form>
                                    </sec:authorize>
                                    <sec:authorize access="! hasAnyRole('ADMIN','HOTEL_CHAIN_DELETE')">
                                        <form:form id="form_del_FLT_SL" name="form_del_FLT_SL"
                                            action="view_delete_hotel_chain_form" method="POST" style="display:inline;">
                                            <input type="hidden" name="hotelChainId" value="${chainObj.hotelChainId}" />
                                            <input type="submit" value="Delete" disabled />
                                        </form:form>
                                    </sec:authorize>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                </c:forEach>
                </c:if>
                </tr>
            </tbody>
        </table>
    </div>
</body>

</html>