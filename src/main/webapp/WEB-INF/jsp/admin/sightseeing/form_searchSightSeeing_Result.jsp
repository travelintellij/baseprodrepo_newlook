<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
                    <jsp:include page="../../menu/MenuBuilder.jsp" />
                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>form_searchSightSeeing_Result</title>
                        <link rel="stylesheet" href="style.css">
                        <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
                        <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />">
                        </script>
                    </head>
                    <style>
                          body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/sight_seeeing_search.jpg);
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
                        <div class="form_searchSightSeeing_Result container">
                            <div class="form_searchSightSeeing_Result_wrapper">
                                <form:form modelAttribute="search_sight_seeing_obj" action="search_search_sight_seeing">
                                    <div class="form_searchSightSeeing_Result_wrapper_data">
                                        <div class="form_searchSightSeeing_Result_wrapper_dl">
                                            <div class="form_searchSightSeeing_Result_wrapper_dl1">
                                                <label for="">City</label>
                                                <input type="text" name="cityName" placeholder="City Name" id="cityName"
                                                    value="${sight_seeing_search_result.cityName}" />
                                                <input type="hidden" name="cityId"
                                                    value="${sight_seeing_search_result.cityId}" />
                                            </div>
                                            <div class="form_searchSightSeeing_Result_wrapper_dl1">
                                                <label for="">SightSeeing Name</label>
                                                <input type="text" name="sightSeeingName" id="sightSeeingName"
                                                    placeholder="Sight Seeing Name"
                                                    value="${sight_seeing_search_result.sightSeeingName}" />
                                            </div>
                                            <div class="form_searchSightSeeing_Result_wrapper_dl1">
                                                <label for="">Duration (min/max)</label>
                                                <div class="ssd">
                                                    <input type="text" name="minDuration" id="minDuration"
                                                        value="${sight_seeing_search_result.minDuration}" style="width:40%"/>
                                                    <input type="text" name="maxDuration" id="maxDuration"
                                                        value="${sight_seeing_search_result.maxDuration}" style="width:40%"/>
                                                </div>
                                            </div>
                                            <div class="form_searchSightSeeing_Result_wrapper_dl1">
                                                <label for="">Tour Rating</label>
                                                <select name="tourRating" style="width:90%"> 
                                                    <option value="0" class="service-small" selected>Tour Rating
                                                    </option>
                                                    <c:forEach var="i" begin="2" end="5">
                                                        <c:if test="${i eq sight_seeing_search_result.tourRating}">
                                                            <option value="${i}" class="service-small" selected>>= ${i}
                                                                Star</option>
                                                        </c:if>
                                                        <c:if test="${i ne sight_seeing_search_result.tourRating}">
                                                            <option value="${i}" class="service-small">>= ${i}Star
                                                            </option>
                                                        </c:if>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="due_today_task_data_btnss" style="margin:10px 0">
                                            <input type="submit" value="Apply" style="background:#32cd32">
                                            <a href="view_search_sight_seeing_form"><input type="button"
                                                    value="Search Again"></a></td>
                                        </div>
                                    </div>
                                    </form:form>
                            </div>
                            <table class="ssd-t">
                                <thead style="height:40px;background:#6082B6">
                                    <tr>
                                        <th>City Name</th>
                                        <th>Sightseeing ID</th>
                                        <th>Sightseeing Name</th>
                                        <th>Duration</th>
                                        <th>Tour Rating</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${not empty STS_SEARCH_RESULT}">
                                        <c:forEach var="sightSeeingObj" items="${STS_SEARCH_RESULT}">
                                            <tr>
                                                <td style="text-align: center;">
                                                    ${sightSeeingObj.cityName}
                                                </td>
                                                <td>
                                                    ${sightSeeingObj.sightSeeingId}
                                                </td>
                                                <td style="text-align: center;">
                                                    ${sightSeeingObj.sightSeeingName}
                                                </td>
                                                <td style="text-align: center;">
                                                    ${sightSeeingObj.duration} Minutes
                                                </td>
                                                <td style="text-align: center;">
                                                    <c:forEach var="i" begin="1" end="${sightSeeingObj.tourRating}">
                                                        <img src="${pageContext.request.contextPath}/resources/images/star.jpg"
                                                            height="20" width="20" />
                                                    </c:forEach>
                                                </td>

                                                <td style="background-color: white;width:20%;vertical-align: middle;">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <sec:authorize
                                                                    access="hasAnyRole('ADMIN','SIGHT_SEEING_VIEW','SIGHT_SEEING_CREATE','SIGHT_SEEING_EDIT','SIGHT_SEEING_DELETE')">
                                                                    <form:form method="post"
                                                                        action="view_view_sight_seeing_details"
                                                                        style="display:inline;">
                                                                        <!-- 
                            										<input  type="image" src="${pageContext.request.contextPath}/resources/images/view.jpg" height="15" width="15" />
                            										-->
                                                                        <input type="submit" value="View"
                                                                            style="float:left;" />
                                                                        <input type="hidden" name="sightSeeingId"
                                                                            value="${sightSeeingObj.sightSeeingId}" />
                                                                    </form:form>
                                                                </sec:authorize>
                                                            </td>
                                                            <td>
                                                                <sec:authorize
                                                                    access="hasAnyRole('ADMIN','SIGHT_SEEING_EDIT')">
                                                                    <form:form method="post"
                                                                        action="view_edit_sight_seeing_form"
                                                                        style="display:inline;">
                                                                        <!-- 
                            											<input  type="image" src="${pageContext.request.contextPath}/resources/images/edit.jpg" height="15" width="15" />
                            											-->
                                                                        <input type="submit" value="Edit"
                                                                            style="background-color:blue;float:left;display:inline;" />

                                                                        <input type="hidden" name="sightSeeingId"
                                                                            value="${sightSeeingObj.sightSeeingId}" />
                                                                    </form:form>
                                                                </sec:authorize>
                                                                <sec:authorize
                                                                    access="! hasAnyRole('ADMIN','SIGHT_SEEING_EDIT')">
                                                                    <form:form method="post"
                                                                        action="view_edit_sight_seeing_form"
                                                                        style="display:inline;">
                                                                        <input type="submit" value="Edit"
                                                                            style="background-color:#dddddd;float:left;display:inline;"
                                                                            disabled />
                                                                        <input type="hidden" name="sightSeeingId"
                                                                            value="${sightSeeingObj.sightSeeingId}" />
                                                                    </form:form>
                                                                </sec:authorize>
                                                            </td>
                                                            <td>
                                                                <sec:authorize
                                                                    access="hasAnyRole('ADMIN','SIGHT_SEEING_DELETE')">
                                                                    <form:form method="post"
                                                                        action="view_delete_confirmation_sight_seeing"
                                                                        style="display:inline;">
                                                                        <input type="hidden" name="sightSeeingId"
                                                                            value="${sightSeeingObj.sightSeeingId}" />
                                                                        <input type="submit" value="Delete"
                                                                            style="background-color:red;float:left;display:inline;" />
                                                                    </form:form>
                                                                </sec:authorize>

                                                                <sec:authorize
                                                                    access="! hasAnyRole('ADMIN','SIGHT_SEEING_DELETE')">
                                                                    <form:form method="post"
                                                                        action="view_delete_confirmation_sight_seeing"
                                                                        style="display:inline;">
                                                                        <input type="hidden" name="sightSeeingId"
                                                                            value="${sightSeeingObj.sightSeeingId}" />
                                                                        <input type="submit" value="Delete"
                                                                            style="background-color:#dddddd;float:left;display:inline;"
                                                                            disabled />
                                                                    </form:form>
                                                                </sec:authorize>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>

                        <script>
                            $('#cityName').autocomplete({
                                serviceUrl: '${pageContext.request.contextPath}/getCityList',
                                paramName: "cityName",
                                delimiter: ",",
                                onSelect: function (suggestion) {
                                    cityID = suggestion.data;
                                    id = cityID;
                                    jQuery("#destinationId").val(cityID);
                                    $('input[name=cityId]').val(id);
                                    return false;
                                },
                                transformResult: function (response) {
                                    return {
                                        suggestions: $.map($.parseJSON(response), function (item) {
                                            return { value: item.cityName, data: item.destinationId };
                                        })

                                    };
                                }
                            });
                        </script>

                    </body>

</html>