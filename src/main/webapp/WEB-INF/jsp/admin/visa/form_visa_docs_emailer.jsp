<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>form_visa_docs_emailer</title>
     <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
    <script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<style>


        body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/mailer.jpg);
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
    <div align="center"><b>
            <font color="green"> ${Success} </font>
            <font color="red"> ${Error}</font>
        </b></div>
    <form:form name="visaEmailForm" id="visaEmailForm" action="send_send_email_visa_master_checklist"
        style="display:inline;" modelAttribute="EMAIL_VISA_MASTER">
        <form:hidden path="visaCostToIncludeList" />
        <form:hidden path="visaIdListToEmail" />
        <form:hidden path="countryName" />
        <form:hidden path="countryCode" />
        <div class="form_visa_docs_emailer container">
            <div class="form_visa_docs_emailer_wrapper bs">
            <i class="fa-regular fa-envelope fa-2x" style="color:#32cd32 "></i>
                <div class="form_visa_docs_emailer_wrapper_data">
                    <div class="form_visa_docs_emailer_wrapper_data_wrapper_dl">
                        <div class="form_visa_docs_emailer_wrapper_data_wrapper_dl1">
                            <label for="" class="lb">To : </label> <br>
                            <input type="text" name="emailToList" !important;"
                                value="${EMAIL_VISA_MASTER.emailToList}" />
                            <font color="red">
                                <form:errors path="emailToList" cssClass="error" />
                            </font>
                        </div>
                        <div class="form_visa_docs_emailer_wrapper_data_wrapper_dl1">
                            <label for="" class="lb">Cc :</label> <br>
                            <input type="text" name="emailCcList" !important;"
                                value="${EMAIL_VISA_MASTER.emailCcList}" />
                            <font color="red">
                                <form:errors path="emailCcList" cssClass="error" />
                            </font>
                        </div>
                        <div class="form_visa_docs_emailer_wrapper_data_wrapper_dl1">
                            <label for="" class="lb">Subject : </label> <br>
                            <input type="text" name="emailSubject" !important;"
                                value="${EMAIL_VISA_MASTER.visaObjectListForEmail[0].countryName} Visa Documents Checklist" />
                        </div>
                        <div class="form_visa_docs_emailer_wrapper_data_wrapper_dl1">
                            <label for="" class="lb">Message : </label> <br>
                            <p>Following Profile of Checklist documents will be sent to the recipient. You can change
                                the cost if needed below</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- ##################### second form goes here ######################### -->
            <div class="form_visa_docs_emailer_wrapper_div bs">
                <div class="form_visa_docs_emailer_wrapper_2">
                    <h1 style="color:#32cd32 ;margin:10px 0">Sending Visa Docs Checklist for</h1>
                    <div class="form_visa_docs_emailer_wrapper_2_data">
                        <table class="form_visa_docs_emailer_wrapper_2_tabel">
                            <tr style="background: #6082B6;height:50px;color:black">
                                <th>Country</th>
                                <th>Visa Id</th>
                                <th>Profile</th>
                                <th>Purpose</th>
                                <th>Visa Type</th>
                                <c:if
                                    test="${EMAIL_VISA_MASTER.visaCostToIncludeList eq 'b2bcost' or EMAIL_VISA_MASTER.visaCostToIncludeList eq 'bothcosts'}">
                                    <th>B2b Cost</th>
                                </c:if>
                                <c:if
                                    test="${EMAIL_VISA_MASTER.visaCostToIncludeList eq 'b2ccost' or EMAIL_VISA_MASTER.visaCostToIncludeList eq 'bothcosts'}">
                                    <th>B2C Cost</th>
                                </c:if>
                            </tr>
                            <c:forEach varStatus="visaobj" var="visaProfObj"
                                items="${EMAIL_VISA_MASTER.visaObjectListForEmail}">


                                <c:set var="columnCount" scope="page" value="6" />
                                <c:if test="${EMAIL_VISA_MASTER.visaCostToIncludeList eq 'bothcosts'}">
                                    <c:set var="columnCount" scope="page" value="7" />
                                </c:if>
                                <tbody>
                                    <tr style="margin:10px 0">
                                        <td>${visaProfObj.countryName}</td>
                                        <td>${visaProfObj.visaId}</td>
                                        <td>${VISA_PROFILE.get(visaProfObj.profile)}</td>
                                        <td>${VISA_PURPOSE.get(visaProfObj.visaPurpose)}</td>
                                        <td>${VISA_TYPE.get(visaProfObj.visaType)}</td>
                                        <c:if
                                            test="${EMAIL_VISA_MASTER.visaCostToIncludeList eq 'b2bcost' or EMAIL_VISA_MASTER.visaCostToIncludeList eq 'bothcosts'}">
                                            <td>
                                                <form:input
                                                    path="visaObjectListForEmail[${visaobj.index}].standardB2bPrice"
                                                    type="text" style="border-color: red !important;"
                                                    value="${visaProfObj.standardB2bPrice}" />
                                            </td>
                                        </c:if>
                                        <c:if
                                            test="${EMAIL_VISA_MASTER.visaCostToIncludeList eq 'b2ccost' or EMAIL_VISA_MASTER.visaCostToIncludeList eq 'bothcosts'}">
                                            <td>
                                                <form:input
                                                    path="visaObjectListForEmail[${visaobj.index}].standardB2cPrice"
                                                    type="text" style="border-color: red !important;"
                                                    value="${visaProfObj.standardB2cPrice}" />
                                            </td>
                                        </c:if>
                                        <form:hidden path="visaObjectListForEmail[${visaobj.index}].visaId" />
                                        <form:hidden path="visaObjectListForEmail[${visaobj.index}].standardB2bPrice" />
                                        <form:hidden path="visaObjectListForEmail[${visaobj.index}].standardB2cPrice" />
                                    </tr>
                                    <div style="margin:10px 0">
                                        <td colspan=<c:out value="${columnCount}" />>
                                        <form:textarea path="visaObjectListForEmail[${visaobj.index}].otherCosts"
                                            style="width: 100%; height: 100px;border: 2px solid green; border-radius: 4px;"
                                            rows="2" cols="1500" name="otherCosts" htmlEscape="false" />
                                        </td>

                                    </div>
                                    <!-- Add more rows as needed -->
                                </tbody>
                            </c:forEach>
                            

                        </table>
                        <div class="due_today_task_data_btns">
                                <input type="submit" name="emailVisaDocs" value="Send Check List" />
                                <a href="search_search_visa_master?countryCode=${EMAIL_VISA_MASTER.countryCode} ">Cancel</a>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </form:form>
</body>

</html>