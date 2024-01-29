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
<style>
.autocomplete-suggestions { border: 1px solid #999; background: red;overflow-y:auto}
		.autocomplete-suggestion {padding: 2px 5px;color:white; background: black;overflow-y: auto;overflow-y:auto}
		.autocomplete-selected { background: #F0F0F0;overflow-y:auto} 
		.autocomplete-suggestions strong { font-weight: normal; color:#FABA08;overflow-y:auto}
		.autocomplete-group { padding: 2px 5px;overflow-y:auto}
		.autocomplete-group strong { display: block; border-bottom: 1px solid #000;  background: black ; color:black overflow-y:auto}
		.autocomplete-selected:hover{
		color:black
		}
		   body::before {
            content: "";
            background-image:   url(${pageContext.request.contextPath}/resources/images/revamped/visa_bg2.jpg);
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

<div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>


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
        <div style="background:black;color: #32cd32 ;text-align:center;width:250px;margin:10px auto;border-radius:2px" >${VISA_CONSULATE_COUNT_MSG}</div>
        
        <c:if test="${not empty VISA_CONSULATE_RESULT_SET}">
            <form:form modelAttribute="EMAIL_VISA_MASTER" action="view_email_visa_master_docs_form">
         <table class = "vst_wrapper container ">
        <thead>
            <tr style="background:#6082B6">
                <th class="vsth">Consulate</th>
                <th class="vsth">Country Name</th>
                <th class="vsth">Consulate City</th>
                <th class="vsth">Title</th>
                <th class="vsth">Action</th>
            </tr>
        </thead>
        <tbody>
        <c:forEach var="visaConsulateObj" items="${VISA_CONSULATE_RESULT_SET}">
            <tr>
                <td>${visaConsulateObj.consulateId}</td>
                <td>${COUNTRY_NAME}</td>
                <td>${visaConsulateObj.cityName}</td>
                <td>${visaConsulateObj.consulateTitle}</td>
                <td class="vts-btn">
                <a href="view_view_visa_consulate?consulateId=${visaConsulateObj.consulateId}">View</a>
                <a href="view_edit_visa_consulate_form?consulateId=${visaConsulateObj.consulateId}">Edit</a>
                </td>
            </tr>
            </c:forEach>
            <!-- Add more rows as needed with <tr> and <td> elements -->
        </tbody>
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