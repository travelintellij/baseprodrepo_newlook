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
</style>

<body
    style="background: url(${pageContext.request.contextPath}/resources/images/revamped/search_hotals_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
   
<div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>


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
                        <option  class="service-small" value="0" selected>-----Select Hotel Chain-----</option>
                        <c:if test="${not empty HotelChainObjList}">
                            <c:forEach items="${HotelChainObjList}" var="hotelChainObj">
                                <option class="service-small" value="${hotelChainObj.hotelChainId}" align="center" style="background:black;color:white">
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
                    <select name="searchPrefer" style="width:95%">
                        <option value="0" class="service-small" selected style="background:black;color:white">Select Preferred</option>
                        <option value="1" class="service-small" style="background:black;color:white">Yes</option>
                        <option value="2" class="service-small" style="background:black;color:white">No</option>
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
                    <select name="active" style="width:95%">
                        <option value="true" class="service-small" selected style="background:black;color:white">Select Active</option>
                        <option value="true" class="service-small" style="background:black;color:white">Active</option>
                        <option value="false" class="service-small" style="background:black;color:white">In-Active</option>
                    </select>
                </div>
                <div class="sh-fi-d">
                    <label for="">Hotal Star Category</label> <br>
                    <select name="starCategory" style="width:95%">
                        <option value="0" class="service-small" selected>Hotel Star Category</option>
                        <option value="2" class="service-small" style="background:black;color:white">2 Star</option>
                        <option value="3" class="service-small" style="background:black;color:white">3 Star</option>
                        <option value="4" class="service-small" style="background:black;color:white">4 Star</option>
                        <option value="5" class="service-small" style="background:black;color:white" >5 Star</option>
                    </select>
                </div>
            </div>
            <div class="sh-f3">
                <div class="sh-fi-d">
                    <label for="">Select Hotal Rating</label> <br>
                    <select name="udnServiceRating" style="width:95%;">
                        <option value="0" class="service-small" selected>Select Hotel Rating</option>
                        <option value="2" class="service-small" style="background:black;color:white">2 Star</option>
                        <option value="3" class="service-small" style="background:black;color:white">3 Star</option>
                        <option value="4" class="service-small" style="background:black;color:white">4 Star</option>
                        <option value="5" class="service-small" style="background:black;color:white">5 Star</option>

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