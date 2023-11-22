<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>viewCityListing</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body style="background: url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
    <div class="viewCityListing container">
        <div class="viewCityListing_wrapper">
            <form:form modelAttribute="SEARCH_CITY" action="view_search_city_form">
                <h1 class="page-heading">Search City</h1>
                <div align="center"><b>
                        <font color="green"> ${Success} </font>
                        <font color="red"> ${Error}</font>
                    </b></div>
                <div class="viewCityListing_wrapper_data">
                    <div class="viewCityListing_wrapper_data_line">
                        <div class="viewCityListing_wrapper_data_l1">
                            <label for="">Destination Id</label>
                            <form:input path="destinationId" name="destinationId" />
                        </div>
                        <div class="viewCityListing_wrapper_data_l1">
                            <label for="">City Name</label>
                            <form:input path="cityName" name="cityName" />
                        </div>
                        <div class="viewCityListing_wrapper_data_l1">
                            <label for="">Country Name</label>
                            <form:select path="countryCode" required="required">
                                <c:forEach items="${ACTIVE_CTRYCODE_CTRYNAME_LIST}" var="destinationObj">
                                    <c:if test="${destinationObj.countryCode eq SEARCH_CITY.countryCode}">
                                        <option class="service-small" value="${destinationObj.countryCode}" selected>
                                            ${destinationObj.countryName}
                                        </option>
                                    </c:if>
                                    <c:if test="${destinationObj.countryCode ne SEARCH_CITY.countryCode}">
                                        <option class="service-small" value="${destinationObj.countryCode}">
                                            ${destinationObj.countryName}</option>
                                    </c:if>
                                </c:forEach>
                            </form:select>
                        </div>
                    </div>
                </div>
                <div class="due_today_task_data_btns">
                    <input type="submit" value="Apply Filter" />
                    <a href="view_search_city_form">Clear Filter</a>
                </div>
            </form:form>
        </div>
        <!-- ############## tabel starts here ####################### -->
        <table class="viewCityListing_table">
            <thead>
                <tr>
                    <th>Destination ID</th>
                    <th>City Name</th>
                    <th>Country Name</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <!-- Add your data rows here -->
                <tr>
                    <c:forEach items="${cityList}" var="cityRec">
                <tr>
                    <td style="width:5%;">${cityRec.destinationId }</td>
                    <td style="width:15%;">${cityRec.cityName }</td>
                    <td style="width:10%;">${cityRec.countryName }</td>
                    <td style="width:10%;">
                        <c:if test="${cityRec.active eq true}">
                            <input type="button" style="background-color: green;padding: 4px 5px;pointer-events: none;"
                                value="Active" />
                        </c:if>
                        <c:if test="${cityRec.active eq false}">
                            <input type="button" style="background-color: red;padding: 4px 5px;pointer-events: none;"
                                value="In-Active" />
                        </c:if>

                    </td>

                    <td style="width:10%;">
                        <sec:authorize access="hasAnyRole('ADMIN')">
                            <a href="view_edit_city_form?destinationId=${cityRec.destinationId }"><input type="button"
                                    style="background-color: #786AAF;padding: 4px 5px;" value="Edit" /></a>
                        </sec:authorize>
                    </td>
                </tr>
                </c:forEach>
                <!-- The Modal -->
                <div id="myModal" class="modal">

                    <!-- Modal content -->
                    <div class="modal-content">
                        <div class="modal-header">
                            <span class="close">&times;</span>
                            <br>
                            <h2 style="text-align:center;" id="modelheaderh2">Supplier Details</h2>
                        </div>
                        <div class="modal-body">


                        </div>
                        <div class="modal-footer">
                            <h3>Powered by @TravelIntelliJ</h3>
                        </div>
                    </div>

                </div>

                <div id="pagination" align="center">
                    <font size="3">Page:
                        <c:url value="view_search_city_form" var="prev">
                            <c:param name="page" value="${page-1}" />
                        </c:url>
                        <c:if test="${page > 0}">
                            <a href="<c:out value=" ${prev}&sortBy=${sortBy}&countryCode=${countryCode}" />" class="pn
                            prev">Prev</a>
                        </c:if>

                        <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                            <c:choose>
                                <c:when test="${(page+1) == i.index}">
                                    <span>${i.index}</span>
                                </c:when>
                                <c:otherwise>
                                    <c:url value="view_search_city_form" var="url">
                                        <c:param name="page" value="${i.index-1}" />
                                    </c:url>
                                    <a
                                        href='<c:out value="${url}&sortBy=${sortBy}&countryCode=${countryCode}" />'>${i.index}</a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:url value="view_search_city_form" var="next">
                            <c:param name="page" value="${page + 1}" />
                        </c:url>
                        <c:if test="${page + 1 < maxPages}">
                            <a href='<c:out value="${next}&sortBy=${sortBy}&countryCode=${countryCode}" />'
                                class="pn next">Next</a>
                        </c:if>
                    </font>
                </div>
                </tr>
                <!-- Add more rows as needed -->
            </tbody>
        </table>
    </div>
</body>

</html>