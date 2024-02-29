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
    <title>admin add sight seeing</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<style>
    body::before {
            content: "";
            background-image:   url(${pageContext.request.contextPath}/resources/images/revamped/add_hotal.jpg);
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
.autocomplete-suggestions { border: 1px solid #999; background: red;overflow-y:auto}
		.autocomplete-suggestion {padding: 2px 5px;color:white; background: black;overflow-y: auto;overflow-y:auto}
		.autocomplete-selected { background: #F0F0F0;overflow-y:auto} 
		.autocomplete-suggestions strong { font-weight: normal; color:#FABA08;overflow-y:auto}
		.autocomplete-group { padding: 2px 5px;overflow-y:auto}
		.autocomplete-group strong { display: block; border-bottom: 1px solid #000;  background: black ; color:black overflow-y:auto}
		.autocomplete-selected:hover{
		color:black
		}

</style>
<body>
    
    <div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>
    
    <div class="Admin_Add_SightSeeing container">
        <div class="Admin_Add_SightSeeing_wrapper bs">
       
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
                <h1 style="font-size: 30px;
    color: #FFBA08;
    margin-bottom: 10px;">Add Sight Seeing</h1>
            <form:form modelAttribute="sightseeing_obj" action="add_add_sightseeing">
                <input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
                <input type="hidden" name="serviceMapId" value="${serviceMapId}" />
                <div class="Admin_Add_SightSeeing_wrapper_data">
                    <div class="Admin_Add_SightSeeing_wrapper_data_line">
                        <div class="Admin_Add_SightSeeing_wrapper_data_l1">
                            <label for=""  style="font-weight:600;color:black">City</label> <br>
                            <input type="text" id="cityName" name="cityName" required />
                            <input type="hidden" id="cityId" name="cityId" value="0" />
                        </div>
                        <div class="Admin_Add_SightSeeing_wrapper_data_l1">
                            <label for=""  style="font-weight:600;color:black">Sightseeing Name</label>
                            <input type="text" id="sightSeeingName" name="sightSeeingName" required />
                        </div>
                        <div class="Admin_Add_SightSeeing_wrapper_data_l1">
                            <label for=""  style="font-weight:600;color:black">Tour Destination</label>
                            <input type="text" id="duration" name="duration" required />
                        </div>
                        <div class="Admin_Add_SightSeeing_wrapper_data_l1">
                            <label for=""  style="font-weight:600;color:black">Departure Point</label>
                            <input type="text" id="departurePoint" name="departurePoint" required />
                        </div>
                    </div>
                    <div class="Admin_Add_SightSeeing_wrapper_data_line">
                        <div class="Admin_Add_SightSeeing_wrapper_data_l2">
                            <label for=""  style="font-weight:600;color:black">Reporting Point</label> <br>
                            <input type="text" id="reportingPoint" name="reportingPoint" required />
                        </div>
                        <div class="Admin_Add_SightSeeing_wrapper_data_l2">
                            <label for=""  style="font-weight:600;color:black">Meals</label> <br>
                            <input type="text" id="meals" name="meals" required />
                        </div>
                        <div class="Admin_Add_SightSeeing_wrapper_data_l2">
                            <label for=""  style="font-weight:600;color:black">Pickup time</label> <br>
                            <input type="text" id="standardPickupTime" name="standardPickupTime" required />
                        </div>
                        <div class="Admin_Add_SightSeeing_wrapper_data_l2">
                            <label for=""  style="font-weight:600;color:black">Drop Time</label> <br>
                            <input type="text" id="standardDropTime" name="standardDropTime" required />
                        </div>
                    </div>
                </div>
                <div class="Admin_Add_SightSeeing_wrapper_data_line">
                    <div class="Admin_Add_SightSeeing_wrapper_data_l3">
                        <label for=""  style="font-weight:600;color:black">Flexible Timing</label> <br>
                        <select id="flexibleTimming" name="flexibleTimming" style="width: 90%;" required>
                            <option value="" class="service-small" selected>Select</option>
                            <option class="service-small" value="true">Option Available</option>
                            <option class="service-small" value="false">Not Available (Fixed)</option>
                        </select>
                    </div>
                    <div class="Admin_Add_SightSeeing_wrapper_data_l3">
                        <label for=""  style="font-weight:600;color:black">Tour Rating</label> <br>
                        <select name="tourRating" style="width: 90%;">
                            <option class="service-small" selected>Select Tour Rating</option>
                            <c:forEach var="i" begin="2" end="5">
                                <c:if test="${i eq sight_seeing_search_result.tourRating}">
                                    <option value="${i}" class="service-small" selected> ${i}
                                        Star</option>
                                </c:if>
                                <c:if test="${i ne sight_seeing_search_result.tourRating}">
                                    <option value="${i}" class="service-small"> ${i}Star</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="Admin_Add_SightSeeing_wrapper_data_des">
                    <div class="Admin_Add_SightSeeing_wrapper_data_l3" style="text-align: start;">
                        <label for=""  style="font-weight:600;color:black">Tour Description</label> <br>
                        <textarea rows="4" style="width:100%;" name="sightSeeingDescription"
                            htmlEscape="false"></textarea>
                    </div>
                </div>
                <div class="Admin_Add_SightSeeing_wrapper_data_des2">
                    <div class="Admin_Add_SightSeeing_wrapper_data_l3" style="text-align: start;">
                        <label for=""  style="font-weight:600;color:black">Useful information</label> <br>
                        <textarea rows="4" cols="69" name="usefulInfo"></textarea>
                    </div>
                    <div class="Admin_Add_SightSeeing_wrapper_data_l3" style="text-align: start;">
                        <label for=""  style="font-weight:600;color:black">Terms and Conditions</label> <br>
                        <textarea rows="4" cols="69" name="tnc"></textarea>
                    </div>
                </div>
                <div class="due_today_task_data_btns">
                    <input type="submit" value="Add Sightseeing">
                </div>
            </form:form>
        </div>
    </div>

    <script>
        $('#cityName').autocomplete({
            serviceUrl: '${pageContext.request.contextPath}/getCityList',
            paramName: "cityName",
            delimiter: ",",
            onSelect: function (suggestion) {
                cityID = suggestion.data;
                id = cityID;
                jQuery("#cityId").val(cityID);
                $('input[name=departingFrom]').val(id);
                return false;
            },
            transformResult: function (response) {
                return {
                    suggestions: $.map($.parseJSON(response), function (item) {
                        return {
                            value: item.cityName,
                            data: item.destinationId
                        };
                    })

                };
            }
        });




    </script>



</body>

</html>