<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
                    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <title>Admin_Edit_City</title>
                            <link rel="stylesheet" href="style.css">
                            <link href="<c:url value=" /resources/core/main.css" />" rel="stylesheet">
                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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
                        </style>
                        <body>
                            <form:form method="post" action="edit_edit_city" modelAttribute="CITY_OBJ">
                                <form:hidden path="countryName" id="countryName" />
                                <form:hidden path="destinationId" />
                                <div class="Admin_Edit_City container">
                                    <div class="Admin_Edit_City_wrapper">
                                        <h1 class="hd">Edit Add City</h1>
                                        <div class="Admin_Edit_City_wrapper_data">
                                            <div class="Admin_Edit_City_wrapper_data_line">
                                                <div class="Admin_Edit_City_wrapper_data_line_l1" style="width:150px">
                                                    <label for=""> Destination Id</label>
                                                    <p style="color:#32cd32"> ${CITY_OBJ.destinationId}</p>
                                                </div>
                                                <div class="Admin_Edit_City_wrapper_data_line_l1">
                                                    <label for=""> City Name</label>
                                                    <form:input path="cityName" name="cityName" required="required" />
                                                    <font color="red">
                                                        <form:errors path="cityName" cssClass="error" />
                                                    </font>
                                                </div>
                                                <div class="Admin_Edit_City_wrapper_data_line_l1" style="width:450px">
                                                    <label for=""> Country Name</label>
                                                    <form:select path="countryCode" required="required"
                                                        id="countryCode">
                                                        <c:forEach items="${ACTIVE_CTRYCODE_CTRYNAME_LIST}"
                                                            var="destinationObj">
                                                            <c:if
                                                                test="${destinationObj.countryCode eq CITY_OBJ.countryCode }">
                                                                <option class="service-small"
                                                                    value="${destinationObj.countryCode}" selected>
                                                                    ${destinationObj.countryName}
                                                                </option>
                                                            </c:if>
                                                            <c:if
                                                                test="${destinationObj.countryCode ne CITY_OBJ.countryCode }">
                                                                <option class="service-small"
                                                                    value="${destinationObj.countryCode}">
                                                                    ${destinationObj.countryName}</option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </form:select>
                                                    <font color="red">
                                                        <form:errors path="countryCode" cssClass="error" />
                                                    </font>
                                                </div>
                                                <div class="Admin_Edit_City_wrapper_data_line_l1" style="width:200px;">
                                                    <label for=""> Active </label> <br>
                                                    <form:select path="active" required="required" style="width:100%">
                                                        <c:if test="${CITY_OBJ.active eq true }">
                                                            <option class="service-small" value="true" selected>Active
                                                            </option>
                                                            <option class="service-small" value="false">In-Active
                                                            </option>
                                                        </c:if>
                                                        <c:if test="${CITY_OBJ.active eq false }">
                                                            <option class="service-small" value="true">Active</option>
                                                            <option class="service-small" value="false" selected>
                                                                In-Active</option>
                                                        </c:if>
                                                    </form:select>
                                                </div>
                                            </div>
                                            <div class="due_today_task_data_btnss" style="margin-top:10px">
                                                <input type="submit" value="Update City">
                                                <a href="view_search_city_form"><input type="button"
                                                        value="View City List" /></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form:form>
                            <script>

                                $('#countryCode').on('change', function () {
                                    //alert( $( "#countryCode option:selected" ).text() );
                                    var countryName = $("#countryCode option:selected").text()
                                    $("#countryName").val(countryName);
                                });
                            </script>
                        </body>

</html>