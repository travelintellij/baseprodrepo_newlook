<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
                    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
                        <jsp:include page="../../menu/MenuBuilder.jsp" />

                        <head>
                            <meta charset="UTF-8">
                            <meta name="viewport" content="width=device-width, initial-scale=1.0">
                            <title>form_searchHotel_Result</title>
                            <link rel="stylesheet"
                                href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
                                <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
                        </head>
<style>
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
                            <div class="form_searchHotel_Result container">
                                <div class="form_searchHotel_Result_wrapper bs">
                                    <h1 style="font-size: 25px;margin: 10px 0;color: #32cd32 ;">Hotel Search</h1>
                                    <div align="center"><b>
                                            <font color="green"> ${Success} </font>
                                            <font color="red"> ${Error}</font>
                                        </b></div>
                                    <form:form modelAttribute="searchhotel_obj" action="search_search_hotel">
                                        <div class="form_searchHotel_Result_wrapper_data">
                                            <div class="form_searchHotel_Result_wrapper_data_lin">
                                                <div class="form_searchHotel_Result_wrapper_dl1">
                                                    <label for="">Locality</label>
                                                    <input type="text" name="locality" id="locality"
                                                        placeholder="locality like"
                                                        value="${hotel_search_result.locality}" />
                                                </div>
                                                <div class="form_searchHotel_Result_wrapper_dl1">
                                                    <label for="">Hotal Name</label>
                                                    <input type="text" name="hotelName" id="hotelName"
                                                        placeholder="Hotel Name"
                                                        value="${hotel_search_result.hotelName}" />
                                                </div>
                                                <div class="form_searchHotel_Result_wrapper_dl1">
                                                    <label for="">Hotal Category</label>
                                                    <select name="starCategory" style="width:90%">
                                                        <option value="0" class="service-small" selected>Hotel Star
                                                            Category</option>
                                                        <c:forEach var="i" begin="2" end="5">
                                                            <c:if test="${i eq hotel_search_result.starCategory}">
                                                                <option value="${i}" class="service-small" selected>${i}
                                                                    Star</option>
                                                            </c:if>
                                                            <c:if test="${i ne hotel_search_result.starCategory}">
                                                                <option value="${i}" class="service-small">${i}Star
                                                                </option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="form_searchHotel_Result_wrapper_dl1">
                                                    <label for="">Hotal Rating</label>
                                                    <select name="udnServiceRating" style="width:90%">
                                                        <option value="0" class="service-small" selected>Select Hotel
                                                            Rating</option>
                                                        <c:forEach var="i" begin="2" end="5">
                                                            <c:if test="${i eq hotel_search_result.udnServiceRating}">
                                                                <option value="${i}" class="service-small" selected>${i}
                                                                    Star</option>
                                                            </c:if>
                                                            <c:if test="${i ne hotel_search_result.udnServiceRating}">
                                                                <option value="${i}" class="service-small">${i}Star
                                                                </option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="due_today_task_data_btnss" style="margin:10px 0">
                                                <input style="background-color: #32cd32  ;" type="submit"
                                                    value="Apply Filter" />
                                                <a href="view_search_hotel_form"><input type="button"
                                                        value="Search Again" /></a>

                                            </div>
                                    </form:form>
                                </div>
                            </div>
                            <!-- ############### tabel ################ -->
                            <input type="hidden" name="hotelId" value="${hotel_search_result.hotelId}" />
                            <input type="hidden" name="cityId" value="${hotel_search_result.cityId}" />
                            <input type="hidden" name="hotelChainId" value="${hotel_search_result.hotelChainId}" />

                            <input type="hidden" name="active" value="${hotel_search_result.active}" />
                            <input type="hidden" name="active" value="${hotel_search_result.searchPrefer}" />
                          

                            </div>
                            
                            
                            
                            
                              <table class="hotel_re_tb">
                                <thead style="background:#6082B6;height:50px;margin-bottom:10px">
                                    <tr>
                                        <th>Hotel ID</th>
                                        <th>Hotel Name</th>
                                        <th>Locality</th>
                                        <th>Hotel Category</th>
                                        <th>Preferred</th>
                                        <th>Hotel Rating</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <!-- Add your hotel data rows here -->
                                    <tr >
                                        <c:if test="${not empty HTL_SEARCH_RESULT}">
                                            <c:forEach var="hotelObj" items="${HTL_SEARCH_RESULT}">
                                    <tr>
                                        <td style="width: 10%;border-bottom:2px solid black;border-left:2px solid black;border-right:2px solid black">
                                            ${hotelObj.hotelId}</td>
                                        <td style="width: 20%;border-bottom:2px solid black;border-right:2px solid black">
                                            ${hotelObj.hotelName}
                                        </td>
                                        <td style="width: 15%;border-bottom:2px solid black;border-right:2px solid black">
                                            ${hotelObj.locality}</td>
                                        <td style="width: 10%;border-bottom:2px solid black;border-right:2px solid black">
                                            <c:forEach var="i" begin="1" end="${hotelObj.starCategory}">
                                                <i class="fa-solid fa-star" style="color:#d00000"></i>
                                            </c:forEach>
                                        </td>
                                        <td style="width: 10%;border-bottom:2px solid black;border-right:2px solid black">
                                            ${hotelObj.preferred}
                                        </td>
                                        <td style="width: 10%;border-bottom:2px solid black;border-right:2px solid black">
                                            <c:forEach var="i" begin="1" end="${hotelObj.udnServiceRating}">
                                                <i class="fa-solid fa-star" style="color:#d00000"></i>
                                            </c:forEach>
                                        </td>

                                        <td style="text-align:center;border-bottom:2px solid black;border-right:2px solid black">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <sec:authorize
                                                            access="hasAnyRole('ADMIN','HOTEL_CREATE','HOTEL_VIEW','HOTEL_EDIT','HOTEL_DEL','ROOM_CAT_MANAGE')">
                                                            <a
                                                                href="view_view_hotel_details?hotelId=${hotelObj.hotelId}"><input
                                                                style="margin-left:10px;background:#32cd32 ;color:white;border-radius:3px;outline:none;padding:2px 4px;cursor:pointer"    type="button" value="View"
                                                                    style="background-color:blue;display:inline;float:left" /></a>
                                                        </sec:authorize>
                                                    </td>
                                                    <td>
                                                        <sec:authorize access="hasAnyRole('ADMIN','HOTEL_EDIT')">
                                                            <form:form method="post"
                                                                action="view_edit_hotel_form?hotelId=${hotelObj.hotelId}"
                                                                style="display:inline;">
                                                                <input type="submit" value="Edit"
                                                                 style="background:#32cd32 ;color:white;border-radius:3px;outline:none;padding:2px 4px;cursor:pointer"   style="background-color:blue;float:left" />
                                                            </form:form>
                                                        </sec:authorize>

                                                        <sec:authorize access="! hasAnyRole('ADMIN','HOTEL_EDIT')">
                                                            <form:form method="post"
                                                                action="view_edit_hotel_form?hotelId=${hotelObj.hotelId}"
                                                                style="display:inline;">
                                                                <input type="submit" value="Edit"
                                                            style="background:#32cd32 ;color:white;border-radius:3px;outline:none;padding:2px 4px;cursor:pointer"
                                                                    disabled />
                                                            </form:form>
                                                        </sec:authorize>
                                                    </td>
                                                    <td>
                                                        <sec:authorize access="hasAnyRole('ADMIN','ROOM_CAT_MANAGE')">
                                                            <form:form method="post"
                                                                action="edit_edit_hotel?hotelId=${hotelObj.hotelId}"
                                                                style="display:inline;">
                                                                <input type="hidden" name="action"
                                                                style="background:#32cd32 ;color:white;border-radius:3px;outline:none;padding:2px 4px;cursor:pointer"    value="EditRoomCategory" />
                                                                <input type="submit" value="Edit Room Category"
                                                                  style="background:#32cd32 ;color:white;border-radius:3px;outline:none;padding:2px 4px;cursor:pointer" />
                                                            </form:form>
                                                        </sec:authorize>

                                                        <sec:authorize access="! hasAnyRole('ADMIN','ROOM_CAT_MANAGE')">
                                                            <form:form method="post"
                                                                action="edit_edit_hotel?hotelId=${hotelObj.hotelId}"
                                                                style="display:inline;">
                                                                <input type="hidden" name="action"
                                                                    value="EditRoomCategory" />
                                                                <input type="submit" value="Edit Room Category"
                                                                   style="background:#32cd32 ;color:white;border-radius:3px;outline:none;padding:2px 4px;cursor:pointer"
                                                                    disabled />
                                                            </form:form>
                                                        </sec:authorize>
                                                    </td>
                                                    <td>
                                                        <sec:authorize access="hasAnyRole('ADMIN','HOTEL_DEL')">
                                                            <form:form method="post" action="view_delete_hotel"
                                                                style="display:inline;">
                                                                <input type="hidden" name="hotelId"
                                                                    value="${hotelObj.hotelId}" />
                                                                <input type="submit" value="Delete"
                                                                   style="background:red ;color:white;border-radius:3px;outline:none;padding:2px 4px;cursor:pointer" />
                                                            </form:form>
                                                        </sec:authorize>
                                                        <sec:authorize access="! hasAnyRole('ADMIN','HOTEL_DEL')">
                                                            <form:form method="post" action="view_delete_hotel"
                                                                style="display:inline;">
                                                                <input type="hidden" name="hotelId"
                                                                    value="${hotelObj.hotelId}" />
                                                                <input type="submit" value="Delete"
                                                                    style="background-color: #dddddd;float:left;cursor:pointer"
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
                                    </tr>
                                </tbody>
                            </table>
                            
                        </body>

</html>