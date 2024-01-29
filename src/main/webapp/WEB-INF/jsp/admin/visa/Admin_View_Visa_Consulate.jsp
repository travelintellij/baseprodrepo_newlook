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
    <title>Document</title>
   <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<style>
 body::before {
            content: "";
            background-image:   url(${pageContext.request.contextPath}/resources/images/revamped/visa_bg1.jpg);
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
    <div class="Admin_View_Visa_Consulate container">
        <div class="Admin_View_Visa_Consulate_wrapper">
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <form:form method="post" action="view_edit_visa_consulate_form" modelAttribute="VISA_CONSULATE_OBJ">
                <input type="hidden" name="consulateId" value="${VISA_CONSULATE_OBJ.consulateId}" />
                <h1 style="font-size: 20px;margin-bottom: 10px;">View Visa Consulate</h1>
                <div class="Admin_View_Visa_Consulate_wrapepr_data">
                    <div class="Admin_View_Visa_Consulate_wrapepr_data_line a">
                        <div class="Admin_View_Visa_Consulate_wrapepr_data_l1">
                            <label for="" class="lb">Visa Country Name (Embassy)</label>
                            <p>${VISA_CONSULATE_OBJ.countryName}</p>
                        </div>
                        <div class="Admin_View_Visa_Consulate_wrapepr_data_l1">
                            <label for="" class="lb">Consulate Title</label>
                            <p>${VISA_CONSULATE_OBJ.consulateTitle}</p>
                        </div>
                        <div class="Admin_View_Visa_Consulate_wrapepr_data_l1">
                            <label for="" class="lb">Consulate city</label>
                            <p>${VISA_CONSULATE_OBJ.cityName}</p>
                        </div>
                        <div class="Admin_View_Visa_Consulate_wrapepr_data_l1">
                            <label for="" class="lb">Address</label>
                            <p>${VISA_CONSULATE_OBJ.address}</p>
                        </div>
                    </div>
                    <div class="Admin_View_Visa_Consulate_wrapepr_data_line a">
                        <div class="Admin_View_Visa_Consulate_wrapepr_data_l1">
                            <label for="" class="lb">Email</label>
                            <p>${VISA_CONSULATE_OBJ.email}</p>
                        </div>
                        <div class="Admin_View_Visa_Consulate_wrapepr_data_l1">
                            <label for="" class="lb">Website</label>
                            <p>${VISA_CONSULATE_OBJ.website}</p>
                        </div>
                        <div class="Admin_View_Visa_Consulate_wrapepr_data_l1">
                            <label for="" class="lb">Telephone</label>
                            <p>${VISA_CONSULATE_OBJ.telephone}</p>
                        </div>
                        <div class="Admin_View_Visa_Consulate_wrapepr_data_l1">
                            <label for="" class="lb">Fax</label>
                            <p>${VISA_CONSULATE_OBJ.fax}</p>
                        </div>
                    </div>
                    <div class="due_today_task_data_btns">
                        <input type="submit" name="submit" value="Edit Consulate" />
                        <a href="view_search_visa_consulate_form">Search Visa Consulate</a>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</body>

</html>