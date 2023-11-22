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
    <title>Admin_Add_City</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body
    style="background: url(${pageContext.request.contextPath}/resources/images/revamped/add_city.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
    <div class="Admin_Add_City container">
        <div class="Admin_Add_City_wrapper">
            <form:form method="post" action="create_create_city" modelAttribute="CITY_OBJ">
                <form:hidden path="countryName" id="countryName" />
                <h1 class="page-heading">Add City</h1>
                <div class="Admin_Add_City_wrapper_data">
                    <div class="Admin_Add_City_wrapper_data_line">
                        <div class="Admin_Add_City_wrapper_data_line_div">
                            <div class="Admin_Add_City_wrapper_data_l1">
                                <label for="">City Name</label> <br>
                                <form:input path="cityName" name="cityName" required="required" />
                                <font color="red">
                                    <form:errors path="cityName" cssClass="error" />
                                </font>
                            </div>
                            <div class="Admin_Add_City_wrapper_data_l1">
                                <label for="">Country name</label> <br>
                                <form:select path="countryCode" required="required" id="countryCode">
                                    <c:forEach items="${ACTIVE_CTRYCODE_CTRYNAME_LIST}" var="destinationObj">
                                        <c:if test="${destinationObj.countryCode eq CITY_OBJ.countryCode }">
                                            <option class="service-small" value="${destinationObj.countryCode}"
                                                selected>${destinationObj.countryName}
                                            </option>
                                        </c:if>
                                        <c:if test="${destinationObj.countryCode ne CITY_OBJ.countryCode }">
                                            <option class="service-small" value="${destinationObj.countryCode}">
                                                ${destinationObj.countryName}</option>
                                        </c:if>
                                    </c:forEach>
                                </form:select>
                                <font color="red">
                                    <form:errors path="countryCode" cssClass="error" />
                                </font>
                            </div>
                        </div>
                        <div class="due_today_task_data_btns">
                            <input type="submit" value="Add City">
                            <a href="view_search_city_form">View City List </a>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>


    <script>

        $('#countryCode').on('change', function () {
            //alert( $( "#countryCode option:selected" ).text() );
            var countryName = $("#countryCode option:selected").text()
            $("#countryName").val(countryName);
        });
    </script>

</body>

</html>