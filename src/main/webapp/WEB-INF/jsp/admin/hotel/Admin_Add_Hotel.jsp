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
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>a
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
    
    <div class="add_hotal container">
        <div class="add_hotal_wrapper bs">
            <h1>Add Hotel</h1>
            <form:form method="post" action="add_add_hotel" modelAttribute="hotel_obj">
                <div class="add_hotal_in">
                    <div class="add_hotal_fli">
                        <div class="ah-d1">
                            <label for="">Select Hotel Chain</label>
                            <select name="hotelChainId" style="width:90%;">
                                <c:if test="${not empty HotelChainObjList}">
                                    <c:forEach items="${HotelChainObjList}" var="hotelChainObj">
                                        <c:if test="${hotelChainObj.hotelChainId eq 1 }">
                                            <option class="service-small" value="${hotelChainObj.hotelChainId}" selected
                                            style="background:black;color:white">
                                                ${hotelChainObj.hotelChainName}
                                            </option>
                                        </c:if>
                                        <c:if test="${hotelChainObj.hotelChainId ne 1 }">
                                            <option class="service-small" value="${hotelChainObj.hotelChainId}"  style="background:black;color:white">
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
                    </div>
                    <div class="add_hotal_fli">

                        <div class="ah-d1">
                            <label for="">Locality</label> <br>
                        <input type="text"  name="locality" id="locality" />
                        </div>
                                   <div class="ah-d1">
                            <label for="">Star Category</label>
                                <select name="starCategory" style="width:90%;">
                                    <option value="2" class="service-small" style="background:black;color:white">
                                        2 Star</option>
                                    <option value="3" class="service-small" selected style="background:black;color:white">3 Star</option>
                                    <option value="4" class="service-small" style="background:black;color:white">
                                        4 Star</option>
                                    <option value="5" class="service-small" style="background:black;color:white">
                                        5 Star</option>
                                
                                </select>
                        </div>
                            <div class="ah-d1">
                            <label for="">Hotel Rating</label>
                            <select name="udnServiceRating" style="width:90%">
                                <option value="2" class="service-small" style="background:black;color:white">
                                    2 Star</option>
                                <option value="3" class="service-small" selected style="background:black;color:white">3 Star</option>
                                <option value="4" class="service-small" style="background:black;color:white">
                                    4 Star</option>
                                <option value="5" class="service-small" style="background:black;color:white">
                                    5 Star</option>
                            </select>
                        </div>
                            <div class="ah-d1">
                            <label for="">Is Preferred</label>
                            <select name="preferred" style="width:90%">
                                <option value="false" class="service-small" style="background:black;color:white">No</option>
                                <option value="true" class="service-small" selected style="background:black;color:white">Yes
                                </option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="add_hotal_fli">
                        
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
                        <div class="ah-d1">
                          
                        </div>
                        <div class="ah-d1">
                          
                        </div>
                    </div>
                       <div class="ah-d1" style="width:100%">
                            <label for="">Address</label> <br>
                            <textarea rows="1" cols="38" name="address" style="width:96%"></textarea>
                        </div>
                        <div class="ah-d1" style="width:100%">
                            <label for="">Remarks</label><br>
                            <textarea rows="5" cols="38" name="remarks" style="width:96%"></textarea>
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