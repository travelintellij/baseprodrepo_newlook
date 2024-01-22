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
    <title>form_searchSightSeeing</title>
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
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/add_hotal.jpg);
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
  
    <div class="searchSightSeeing container">
        <div class="searchSightSeeing_wrapper">
         <h1 style="font-size: 30px;
    color: #FFBA08;
    margin-bottom: 10px;">Search Sight Seeing </h1>
            <form:form modelAttribute="search_sight_seeing_obj" action="search_search_sight_seeing">
            <div class="searchSightSeeing_wrapper_data">
                <div class="searchSightSeeing_wrapper_data_line">
                    <div class="searchSightSeeing_wrapepr_data_l1">
                        <label for="">City Name</label>
                        <input type="text"  name="cityName" id="cityName" placeholder="City Name" required />
                        <input type="hidden" name="cityId" value="0" />
                    </div>
                    <div class="searchSightSeeing_wrapepr_data_l1">
                        <label for="">Sight seeing name</label>
                        <input  type="text" name="sightSeeingName" id="sightSeeingName" />
                    </div>
                    <div class="searchSightSeeing_wrapepr_data_l1">
                        <label for="">Min duration</label>
                            <input type="text" name="minDuration" id="minDuration" placeholder="Min Duration (Minutes)" />
                    </div>
                    <div class="searchSightSeeing_wrapepr_data_l1">
                        <label for="">Max duration</label>
                    <input type="text" name="maxDuration" id="maxDuration" placeholder="Max Duration (Minutes)" />
                    </div>
                </div>
                <div class="searchSightSeeing_wrapper_data_line2">
                    <div class="searchSightSeeing_wrapepr_data_l1">
                        <label for="">Select Tour Rating</label>
                        <select name="tourRating" style="width:90%">
                            <option value="0" class="service-small" selected>Select Tour Rating</option>
                            <option value="2" class="service-small"> > 2 Star</option>
                            <option value="3" class="service-small">> 3 Star</option>
                            <option value="4" class="service-small">> 4 Star</option>
                            <option value="5" class="service-small">5 Star</option>
                        </select>
                    </div>
                    <div class="searchSightSeeing_wrapepr_data_l1">
                        <label for="">Sight seeing id</label>
                            <input type="text" name="sightSeeingId" id="sightSeeingId" placeholder="Sight Seeing Id"
                                pattern="[0-9.]+" />
                    </div>
                    <div class="searchSightSeeing_wrapepr_data_l1">
                        <label for="">In-Active</label> <br>
                        <select name="active" style="width:90%">
                            <option value="true" class="service-small" selected>Select Active</option>
                            <option value="true" class="service-small">Active</option>
                            <option value="false" class="service-small">In-Active</option>
                        </select>
                    </div>
                </div>
                <div class="due_today_task_data_btns">
                    <input type="submit" value="Search">
                </div>
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