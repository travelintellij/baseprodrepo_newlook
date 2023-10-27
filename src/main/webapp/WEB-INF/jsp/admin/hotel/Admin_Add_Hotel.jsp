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
    <title>Add Hotal</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
     
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
</head>

<body
    style="background: url(${pageContext.request.contextPath}/resources/images/revamped/add_hotal.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
    <div class="add_hotal container">
        <div class="add_hotal_wrapper">
            <h1>Add Hotel</h1>
            <form:form method="post" action="add_add_hotel" modelAttribute="hotel_obj">
                <div class="add_hotal_in">
                    <div class="add_hotal_fli">
                        <div class="ah-d1">
                            <label for="">Select Hotel Chain</label>
                            <select name="hotelChainId">
                                <c:if test="${not empty HotelChainObjList}">
                                    <c:forEach items="${HotelChainObjList}" var="hotelChainObj">
                                        <c:if test="${hotelChainObj.hotelChainId eq 1 }">
                                            <option class="service-small" value="${hotelChainObj.hotelChainId}" selected>
                                                ${hotelChainObj.hotelChainName}
                                            </option>
                                        </c:if>
                                        <c:if test="${hotelChainObj.hotelChainId ne 1 }">
                                            <option class="service-small" value="${hotelChainObj.hotelChainId}">
                                                ${hotelChainObj.hotelChainName}
                                            </option>
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </div>
                        <div class="ah-d1">
                            <label for="">Hotel Name</label>
                            <input type="text"  name="hotelName" id="hotelName"
                                placeholder="Hotel Name" size="140" required />
                        </div>
                        <div class="ah-d1">
                            <label for="">Default Room Category Name</label>
                            <input type="text" name="defaultRoomCategory" value="Standard" required />
                        </div>
                    </div>
                    <div class="add_hotal_fli">
                        <div class="ah-d1">
                            <label for="">City</label> <br>
                            <input type="text" name="cityName" id="cityName" placeholder="City Name"
                                required />
                            
                            <input type="hidden" name="cityId" id="cityId" value="0" />
                            <br>
                            <font color="red">
                                <form:errors path="cityId" cssClass="error" />
                            </font>
                        </div>
                        <div class="ah-d1">
                            <label for="">Address</label> <br>
                            <textarea rows="2" cols="38" name="address"></textarea>
                        </div>
                        <div class="ah-d1">
                            <label for="">Locality</label> <br>
                        <input type="text"  name="locality" id="locality" />
                        </div>
                    </div>
                    <div class="add_hotal_fli">
                        <div class="ah-d1">
                            <label for="">Star Category</label>
                                <select name="starCategory">
                                    <option value="2" class="service-small">
                                        2 Star</option>
                                    <option value="3" class="service-small" selected>3 Star</option>
                                    <option value="4" class="service-small">
                                        4 Star</option>
                                    <option value="5" class="service-small">
                                        5 Star</option>
                                
                                </select>
                        </div>
                        <div class="ah-d1">
                            <label for="">Hotel Rating</label>
                            <select name="udnServiceRating">
                                <option value="2" class="service-small">
                                    2 Star</option>
                                <option value="3" class="service-small" selected>3 Star</option>
                                <option value="4" class="service-small">
                                    4 Star</option>
                                <option value="5" class="service-small">
                                    5 Star</option>
                            </select>
                        </div>
                        <div class="ah-d1">
                            <label for="">Is Preferred</label>
                            <select name="preferred">
                                <option value="false" class="service-small">No</option>
                                <option value="true" class="service-small" selected>Yes
                                </option>
                            </select>
                        </div>
                    </div>
                    <div class="add_hotal_fli">
                        <div class="ah-d1">
                            <label for="">Remarks</label>
                            <textarea rows="2" cols="38" name="remarks"></textarea>
                        </div>
                        <div class="ah-d1">
                            <label for="">Hotel Phone</label>
                            <input type="number"  name="phone" id="phone" value="0"
                                pattern="[0-9.]+" />
                        </div>
                        <div class="ah-d1">
                            <label for="">Hotel Email</label>
                        <input type="text"  name="email" id="email"
                            pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" />
                        </div>
                    </div>
                    <div class="add_hotal_fli">
                        <div class="ah-d1-btn">
                        <input type="submit" value="Add Hotel"/>
                        </div>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</body>


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



</html>