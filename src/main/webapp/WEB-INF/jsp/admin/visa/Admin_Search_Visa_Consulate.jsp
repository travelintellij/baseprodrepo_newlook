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
    <title>Admin_Search_Visa_Consulate</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body style="background: url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
    <div class="Admin_Search_Visa_Consulate container">
        <div class="Admin_Search_Visa_Consulate_wrapper">
            <h1 class="page-heading">Search Visa Consulate</h1>
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
                    <form:form method="post" action="search_search_visa_consulate" modelAttribute="VISA_CONSULATE_SEARCH">
                        <div align="center">
                            <font color="red"><b>
                                    <form:errors path="*" class="has-error" />
                                </b></font>
                        </div>
            <div class="Admin_Search_Visa_Consulate_wrapper_data">
                <div class="Admin_Search_Visa_Consulate_wrapper_data_line">
                    <div class="Admin_Search_Visa_Consulate_wrapper_data_l1">
                        <label for="">Country Name</label> <br>
                        <input type="hidden" id="countryCode" name="countryCode" />
                        <input type="text" id="countryName" name="countryName"
                            placeholder="country name" required />
                    </div>
                    <div class="due_today_task_data_btns">
                    <input type="submit" name="submit" value="Search Visa Details" />
                    </div>
                </div>
            </div>
            </form:form>
        </div>
        <div align="center">${VISA_CONSULATE_COUNT_MSG}</div>
        
        <c:if test="${not empty VISA_CONSULATE_RESULT_SET}">
            <form:form modelAttribute="EMAIL_VISA_MASTER" action="view_email_visa_master_docs_form">
                <table border="1 px;" style="width:80%; border-collapse: collapse;" align="center">
                    <tr>
                        <th style="width:10%;">Consulate #</th>
                        <th style="width:10%;">Country Name</th>
                        <th style="width:10%;">Consulate City</th>
                        <th style="width:10%;">Title</th>
                        <th style="width:20%;" colspan="2">Action</th>
                    </tr>
                    <c:forEach var="visaConsulateObj" items="${VISA_CONSULATE_RESULT_SET}">
                        <tr>
                            <td style="width:10%;">${visaConsulateObj.consulateId}</td>
                            <td style="width:10%;">${COUNTRY_NAME}</td>
                            <td style="width:10%;">${visaConsulateObj.cityName}</td>
                            <td style="width:10%;">${visaConsulateObj.consulateTitle}</td>
                            <td style="width:10%;border:0;">
                                <a href="view_view_visa_consulate?consulateId=${visaConsulateObj.consulateId}"><input
                                        type="button" style="background-color:blue;" value="View" /></a>
                                <a href="view_edit_visa_consulate_form?consulateId=${visaConsulateObj.consulateId}"><input
                                        type="button" style="background-color:blue;" value="Edit" /></a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </form:form>
        </c:if>
    </div>

<script>
    $('#countryName').autocomplete({
        serviceUrl: '${pageContext.request.contextPath}/getCountryList',
        paramName: "countryName",
        delimiter: ",",
        onSelect: function (suggestion) {
            cityID = suggestion.data;
            id = cityID;
            jQuery("#countryCode").val(cityID);
            $('input[name=countryCode]').val(id);
            return false;
        },
        transformResult: function (response) {
            return {
                suggestions: $.map($.parseJSON(response), function (item) {
                    return { value: item.countryName, data: item.countryCode };
                })

            };
        }
    });
</script>



</body>

</html>