<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Hotel</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body
    style="background: url(${pageContext.request.contextPath}/resources/images/revamped/search_hotals_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
    <div class="search_hotal container">
        <div class="search_hotal_wraper">
            <h1>Search Hotel</h1>
            <form:form modelAttribute="searchhotel_obj" action="search_search_hotel">
            <div class="sh-f1">
                <div class="sh-fi-d">
                    <label for="">City Name</label>
                    <input type="text" name="cityName" id="cityName" placeholder="City Name" />
                    <input type="hidden" name="cityId" value="0" />
                </div>
                <div class="sh-fi-d">
                    <label for="">Select Hotal Chain</label>
                    <select name="hotelChainId">
                        <option class="service-small" value="0" selected>-----Select Hotel Chain-----</option>
                        <c:if test="${not empty HotelChainObjList}">
                            <c:forEach items="${HotelChainObjList}" var="hotelChainObj">
                                <option class="service-small" value="${hotelChainObj.hotelChainId}" align="center">
                                    ${hotelChainObj.hotelChainName}</option>
                            </c:forEach>
                        </c:if>
                    </select>
                </div>
                <div class="sh-fi-d">
                    <label for="">Locality like</label>
                    <input type="text" name="locality" id="locality" placeholder="locality like" />
                </div>
                <div class="sh-fi-d">
                    <label for="">Select preferred</label>
                    <select name="searchPrefer">
                        <option value="0" class="service-small" selected>Select Preferred</option>
                        <option value="1" class="service-small">Yes</option>
                        <option value="2" class="service-small">No</option>
                    </select>
                </div>
            </div>
            <div class="sh-f2">
                <div class="sh-fi-d">
                    <label for="">Hotal Name</label><br>
                    <input type="text" name="hotelName" id="hotelName" placeholder="Hotel Name" />
                </div>
                <div class="sh-fi-d">
                    <label for="">Hotal id</label><br>
                    <input type="text" name="hotelId" id="hotelId" placeholder="Hotel Id" pattern="[0-9.]+" />
                </div>
                <div class="sh-fi-d">
                    <label for="">Select Active</label><br>
                    <select name="active">
                        <option value="true" class="service-small" selected>Select Active</option>
                        <option value="true" class="service-small">Active</option>
                        <option value="false" class="service-small">In-Active</option>
                    </select>
                </div>
                <div class="sh-fi-d">
                    <label for="">Hotal Star Category</label> <br>
                    <select name="starCategory">
                        <option value="0" class="service-small" selected>Hotel Star Category</option>
                        <option value="2" class="service-small">2 Star</option>
                        <option value="3" class="service-small">3 Star</option>
                        <option value="4" class="service-small">4 Star</option>
                        <option value="5" class="service-small">5 Star</option>
                    </select>
                </div>
            </div>
            <div class="sh-f3">
                <div class="sh-fi-d">
                    <label for="">Select Hotal Rating</label> <br>
                    <select name="udnServiceRating">
                        <option value="0" class="service-small" selected>Select Hotel Rating</option>
                        <option value="2" class="service-small">2 Star</option>
                        <option value="3" class="service-small">3 Star</option>
                        <option value="4" class="service-small">4 Star</option>
                        <option value="5" class="service-small">5 Star</option>

                    </select>
                </div>
            </div>
            <div class="sh-fi-d-btn">
                <button type="submit">Search Hotel</button>
            </div>
            </form:form>
        </div>
    </div>
    
    <script>
	$('#cityName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCityList',
	paramName: "cityName",
	delimiter: ",",
	onSelect: function(suggestion) {
        cityID = suggestion.data;
        id=cityID;
        jQuery("#destinationId").val(cityID);
        $('input[name=cityId]').val(id);
        return false;
    },
	transformResult: function(response) {
        return {
            suggestions: $.map($.parseJSON(response), function(item) {
            	return { value: item.cityName, data: item.destinationId };
            })
            
        };
    }
});
</script>

</body>

</html>