<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin_Search_Visa</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body style="background: url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
    <div class="Admin_Search_Visa container">
        <div class="Admin_Search_Visa_wrapper">
            <h1 class="page-heading">Search Visa</h1>
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <form:form method="post" action="search_search_visa_master" modelAttribute="visa_obj">
                <div class="Admin_Search_Visa_wrapper_data">
                    <div class="Admin_Search_Visa_wrapper_data_line">
                        <div class="Admin_Search_Visa_wrapper_data_l1">
                            <label for="">Country name</label> <br>
                            <input type="hidden" id="countryCode" name="countryCode" />
                            <input type="text" id="countryName" name="countryName" placeholder="country name"
                                required />
                        </div>
                        <div class="due_today_task_data_btns">
                            <input type="submit" name="submit" value="Search Visa Details" />
                        </div>
                    </div>
                </div>
            </form:form>
        </div>

        <div align="center">${VISA_COUNT_MSG}</div>

        <c:if test="${not empty VISA_RESULT_SET}">
            <form:form modelAttribute="EMAIL_VISA_MASTER" action="view_email_visa_master_docs_form">
                <input type="hidden" id="countryName" name="countryName" value="${COUNTRY_NAME}" />
                <input type="hidden" id="countryCode" name="countryCode" value="${COUNTRY_CODE}" />
                <table border="1 px;" style="width:80%; border-collapse: collapse;" align="center">
                    <tr style="background-color:pink;">
                        <td colspan="7">&nbsp;</td>
                        <td><input type="radio" id="visaCostToIncludeList" name="visaCostToIncludeList" value="b2bcost">
                            <b>With
                                B2B Cost</b></td>
                        <td><input type="radio" id="visaCostToIncludeList" name="visaCostToIncludeList" value="b2ccost"
                                checked>
                            <b>With B2C Cost</b>
                        </td>
                        <td><input type="radio" id="visaCostToIncludeList" name="visaCostToIncludeList"
                                value="bothcosts">
                            <b>Both Costs</b>
                        </td>
                        <td><input type="Submit" name="emailVisaDocsList" value="Email Selected"
                                style="background-color:blue;" /></td>
                    </tr>

                    <tr>
                        <th style="width:9%;">Country Name</th>
                        <th style="width:9%;">Consulate City</th>
                        <th style="width:9%;">Visa Profile</th>
                        <th style="width:9%;">Visa Type</th>
                        <th style="width:9%;">Visa Purpose</th>
                        <th style="width:9%;">Processing Time</th>
                        <th style="width:9%;">Standard Cost</th>
                        <th style="width:9%;">B2B Price</th>
                        <th style="width:9%;">B2C Price</th>
                        <th style="width:20%;" colspan="2">Action</th>
                    </tr>
                    <c:forEach var="visaMasterObj" items="${VISA_RESULT_SET}">
                        <tr>
                            <td style="width:9%;">${visaMasterObj.countryName}</td>
                            <td style="width:9%;">${visaMasterObj.cityName}</td>
                            <td style="width:9%;">${VISA_PROFILE.get(visaMasterObj.profile)}</td>
                            <td style="width:9%;">${VISA_TYPE.get(visaMasterObj.visaType)}</td>
                            <td style="width:9%;">${VISA_PURPOSE.get(visaMasterObj.visaPurpose)}</td>
                            <td style="width:9%;">${visaMasterObj.processingTime} Days</td>
                            <td style="width:9%;">${visaMasterObj.standardCost}</td>
                            <td style="width:9%;">${visaMasterObj.standardB2bPrice}</td>
                            <td style="width:9%;">${visaMasterObj.standardB2cPrice}</td>
                            <td style="width:10%;border:0;">
                                <input type="checkbox" id="visaIdListToEmail" name="visaIdListToEmail"
                                    value="${visaMasterObj.visaId}"> <b>Email</b>
                            </td>
                            <td style="width:10%;border:0;">
                                <a href="view_list_visa_proceed_docs_form?visaId=${visaMasterObj.visaId}"><input
                                        type="button" style="background-color:green;" value="View Details" /></a>

                                <!-- 
                								<form:form method="post" action="view_list_visa_proceed_docs_form" modelAttribute="VISA_OBJ">
                										<input type="hidden" name="visaId" value="${visaMasterObj.visaId}" />
                										<input type="submit" name="submit" value="View Details" style="padding: 6px 12px;"  />
                								</form:form>
                								 -->
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </form:form>
        </c:if>


    </div>
</body>

</html>