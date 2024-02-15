<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Admin_View_Hotel</title>
                    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
                    <link rel="stylesheet" href="style.css">
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
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/lens.jpg);
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
                
                    <div class="Admin_View_Hotel container">
                        <div class="Admin_View_Hotel_wrapper bs">
                            <form:form method="post" action="edit_edit_hotel" modelAttribute="hotel_obj">
                                <input type="hidden" name="hotelId" id="hotelId" value="${hotel_obj.hotelId}" />
                                <h1 style="font-size: 25px;color: #32cd32 ;margin: 10px 0;">Edit Hotal </h1>
                                <div class="Admin_View_Hotel_wrapper_data">
                                    <div class="Admin_View_Hotel_wrapper_data_line ">
                                        <div class="Admin_View_Hotel_wrapper_d1">
                                            <label for="">Select Hotal Chain</label>
                                            <select name="hotelChainId" style="width:90%">
                                                <c:if test="${not empty HotelChainObjList}">
                                                    <c:forEach items="${HotelChainObjList}" var="hotelChainObj">
                                                        <c:if
                                                            test="${hotelChainObj.hotelChainId eq hotel_obj.hotelChainId }">
                                                            <option class="service-small"
                                                                value="${hotelChainObj.hotelChainId}" selected>
                                                                ${hotelChainObj.hotelChainName}</option>
                                                        </c:if>
                                                        <c:if
                                                            test="${hotelChainObj.hotelChainId ne hotel_obj.hotelChainId }">
                                                            <option class="service-small"
                                                                value="${hotelChainObj.hotelChainId}">
                                                                ${hotelChainObj.hotelChainName}
                                                            </option>
                                                        </c:if>
                                                    </c:forEach>
                                                </c:if>
                                            </select>
                                        </div>
                                        <div class="Admin_View_Hotel_wrapper_d1">
                                            <label for="">Hotal Name</label>
                                            <input type="text" name="hotelName" id="hotelName"
                                                value="${hotel_obj.hotelName}" style="width:90%" required />
                                        </div>
                                        <div class="Admin_View_Hotel_wrapper_d1">
                                            <label for="">City</label>
                                            <input type="text" name="cityName" id="cityName"
                                                value="${hotel_obj.cityName}" style="width:90%" required />

                                            <input type="hidden" name="cityId" id="cityId"
                                                value="${hotel_obj.cityId}" />
                                            <br>
                                            <font color="red">
                                                <form:errors path="cityId" cssClass="error" />
                                            </font>
                                        </div>
                                        <div class="Admin_View_Hotel_wrapper_d1">
                                            <label for="">Locality</label>
                                            <input type="text" name="locality" value="${hotel_obj.locality}"
                                                id="locality" style="width:90%"/>
                                        </div>
                                    </div>
                                    <div class="Admin_View_Hotel_wrapper_data_line ">
                 
                                        <div class="Admin_View_Hotel_wrapper_d1">
                                            <label for="">Star Category</label>
                                            <select name="starCategory" style="width:90%">
                                                <option value="0" class="service-small" selected>Hotel Star Category
                                                </option>
                                                <c:forEach var="i" begin="2" end="5">
                                                    <c:if test="${i eq hotel_obj.starCategory}">
                                                        <option value="${i}" class="service-small" selected>${i} Star
                                                        </option>
                                                    </c:if>
                                                    <c:if test="${i ne hotel_obj.starCategory}">
                                                        <option value="${i}" class="service-small">${i}Star</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="Admin_View_Hotel_wrapper_d1">
                                            <label for="">Is Prefered</label>
                                            <select name="preferred" style="width:90%">
                                                <c:if test="${hotel_obj.preferred eq true}">
                                                    <option value="false" class="service-small">No</option>
                                                    <option value="true" class="service-small" selected>Yes</option>
                                                </c:if>
                                                <c:if test="${hotel_obj.preferred ne true}">
                                                    <option value="false" class="service-small" selected>No</option>
                                                    <option value="true" class="service-small">Yes</option>
                                                </c:if>
                                            </select>
                                        </div>
                                               <div class="Admin_View_Hotel_wrapper_d1">
                                            <label for="">Hotal Rating</label>
                                            <select name="udnServiceRating" style="width:90%">
                                                <option value="0" class="service-small" selected>Select Hotel Rating
                                                </option>
                                                <c:forEach var="i" begin="2" end="5">
                                                    <c:if test="${i eq hotel_obj.udnServiceRating}">
                                                        <option value="${i}" class="service-small" selected>${i}
                                                            Star</option>
                                                    </c:if>
                                                    <c:if test="${i ne hotel_obj.udnServiceRating}">
                                                        <option value="${i}" class="service-small">${i}Star</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        
                                        <div class="Admin_View_Hotel_wrapper_d1">
                                            <label for="">Hotel Phone No.</label>
                                            <input type="text" name="phone" id="phone" value="${hotel_obj.phone}"
                                                pattern="[0-9.]+" style="width:90%"/>
                                        </div>
                                    </div>
                                    <div class="Admin_View_Hotel_wrapper_data_line ">
                                 
                                        <div class="Admin_View_Hotel_wrapper_d1" style="width:628px">
                                            <label for="">Hotel Email</label>
                                            <input type="text" name="email" id="email" value="${hotel_obj.email}"
                                                pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" style="width:89%"/>
                                        </div>
                                    </div>
                                    <div class="Admin_View_Hotel_wrapper_d1 room-ct" style="display:flex;width:757px;margin:10px 0">
                                            <label for="" >Room Category</label>
                                            <c:forEach items="${hotel_obj.roomCategoryEntityList}" var="roomCategory">
                                                <li style="color:orangered;margin:0  42px;">${roomCategory.roomCategoryName}</li>
                                            </c:forEach>
                                            <button type="submit" id="btnSave" name="action" class="cat-btn"
                                              style="border:1px solid orangered;outline:none;background:transparent;color:orangered;padding:2px 4px;border-radius:3px;cursor:pointer"  value="EditRoomCategory">Edit Room
                                                Category</button>        
                                        </div>
                                    <div class="Admin_View_Hotel_wrapper_data_line">
                                      <div class="Admin_View_Hotel_wrapper_d1">
                                            <label for="">Address</label>
                                            <textarea rows="2" cols="139" name="address" >${hotel_obj.address}</textarea>
                                        </div>
                                    </div>
                                     <div class="Admin_View_Hotel_wrapper_data_line">
                                        <div class="Admin_View_Hotel_wrapper_d1" style="width:100%">
                                            <label for="">Remarks</label> <br>
                                            <textarea rows="5" cols="139" name="remarks">${hotel_obj.remarks}</textarea>
                                        </div>
                                    </div>
                                    <div class="due_today_task_data_btnss" style="margin:10px 0">
                                        <input type="submit" name="action" value="Update Hotel"
                                            style="background-color:#32cd32;" />
                                        <a href="view_search_hotel_form"><input type="button"
                                                 value="Search Hotel"></a>
                                        <a href="view_view_hotel_details?hotelId=${hotel_obj.hotelId}"><input
                                                type="button" value="Cancel"  /></a>
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