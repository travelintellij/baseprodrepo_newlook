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
    <title>Hotel_Room_Category_Update</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">

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
    <div class="Hotel_Room_Category_Update container">
        <div class="Hotel_Room_Category_Update_wrapper">
            <h1 style="font-size: 25px;margin: 10px 0;color: #32cd32  ;">Manage Room Category</h1>
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <div class="Hotel_Room_Category_Update_wrapper_data">
                <div class="Hotel_Room_Category_Update_wrapper_dline bc-clr">
                    <div class="Hotel_Room_Category_Update_wrapper_dl1">
                        <label for="" class="lb">Hotel Id</label>
                        <p>${hotelId}</p>
                    </div>
                    <div class="Hotel_Room_Category_Update_wrapper_dl1">
                        <label for="" class="lb">Hotel Name</label>
                        <p>${hotelName}</p>
                    </div>
                    <div class="Hotel_Room_Category_Update_wrapper_dl1">
                        <label for="" class="lb">Address</label>
                        <p>${address}</p>
                    </div>
                    <div class="Hotel_Room_Category_Update_wrapper_dl1">
                        <label for="" class="lb">City</label>
                        <p>${city}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <table class="rm-ct-up">
        <thead style="background:#6082B6;height:40px">
            <tr>
                <th>Room Category Name</th>
                <th>Room Hierarchy</th>
                <th>Room Size</th>
                <th>No of Rooms</th>
                <th>Remarks</th>
                <th>Active</th>
                <th style="width:20px">Action</th>
            </tr>
        </thead>
        <tbody>
                    <c:if test="${not empty Room_Cat_Obj_List}">
                        <c:forEach var="roomCategoryObj" items="${Room_Cat_Obj_List}">
                            <c:choose>
                                <c:when
                                    test="${roomCategoryObj.roomCategoryId eq ORG_ROOM_CAT_VO.roomCategoryId  && ROOM_CAT_ACT eq 'UPDATE' }">
                                    <form:form name="editRoomCategoryForm" modelAttribute="HTL_ROOM_CAT"
                                        action="edit_edit_hotel_room_category">
                                        <input type="hidden" name="roomCategoryId" value="${roomCategoryObj.roomCategoryId}" />
                                        <input type="hidden" name="hotelId" value="${hotelId}" />
                    
                                        <tr>
                                            <td style="width: 10%;border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53;border-left:2px solid #FFCF53""><input type="text" style="width:250px;" size="100"
                                                    name="roomCategoryName" value="${roomCategoryObj.roomCategoryName}" required /></td>
                                            <td style="width: 10%;border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53">
                                                <div class="select" style="text-align:center;">
                                                    <select id="higherCategory" name="higherCategory" style="width: 100px;">
                                                        <c:forEach var="i" begin="0" end="5">
                                                            <c:if test="${roomCategoryObj.higherCategory eq i}">
                                                                <option class="service-small" value="${i}" selected>
                                                                    <c:out value="${i}" /> Higher
                                                                </option>
                                                            </c:if>
                                                            <c:if test="${roomCategoryObj.higherCategory ne i}">
                                                                <option class="service-small" value="${i}">
                                                                    <c:out value="${i}" /> Higher
                                                                </option>
                                                            </c:if>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                    
                                            </td>
                                            <td style="width: 10%;text-align:center;border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53">
                                                <input type="text" style="width: 60px;" name="roomSize" value="${roomCategoryObj.roomSize}"
                                                    id="roomSize" size="15" pattern="[0-9.]+" /> Sq. Ft.
                                            </td>
                                            <td style="width: 10%;text-align:center;border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53">
                                                <input type="number" style="width: 80px;" name="noOfRooms"
                                                    value="${roomCategoryObj.noOfRooms}" id="noOfRooms" size="15" pattern="[0-9.]+" />
                                            </td>
                                            <td style="width: 30%;text-align:center;border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53">
                                                <textarea rows="3" cols="47" name="remarks">${roomCategoryObj.remarks}</textarea>
                                            </td>
                                            <td style="width: 10%;border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53">
                                                <div class="select" style="width: 120px;text-align:center;">
                                                    <select name="active">
                                                        <c:if test="${roomCategoryObj.active eq true}">
                                                            <option value="false" class="service-small">False</option>
                                                            <option value="true" class="service-small" selected>True</option>
                                                        </c:if>
                                                        <c:if test="${roomCategoryObj.active ne true}">
                                                            <option value="false" class="service-small" selected>False</option>
                                                            <option value="true" class="service-small">True</option>
                                                        </c:if>
                                                    </select>
                                                </div>
                                            </td>
                                            <td style="width: 20%;border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53">
                                                <input style="background-color:#32cd32;color:white;border:none;outline:none;float:left;padding:2px 4px;border-radius:3px;
                                                margin-left:25px" type="submit" value="Update" />
                                                <a  href="edit_edit_hotel?hotelId=${hotelId}&action=EditRoomCategory"><input
                                                       style="background-color:red;color:white;border:none;outline:none;float:left;padding:2px 4px;border-radius:3px;
                                                margin-left:15px" type="button" value="Cancel" /></a>
                                            </td>
                                        </tr>
                                    </form:form>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td style="width: 150px;border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53;border-left:2px solid #FFCF53">${roomCategoryObj.roomCategoryName}</td>
                                        <td style="width: 100px;text-align:center;border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53;">${roomCategoryObj.higherCategory} Higher</td>
                                        <td style="width: 140px;text-align:center; border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53;">
                    
                                            <c:choose>
                                                <c:when test="${roomCategoryObj.roomSize eq 0}">
                                                    Un-Known
                                                </c:when>
                                                <c:otherwise>
                                                    ${roomCategoryObj.roomSize} Sq. Ft.
                                                </c:otherwise>
                                            </c:choose>
                    
                                        </td>
                                        <td style="width: 100px;text-align:center;border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53;">
                                            <c:choose>
                                                <c:when test="${roomCategoryObj.noOfRooms eq 0}">
                                                    Un-Known
                                                </c:when>
                                                <c:otherwise>
                                                    ${roomCategoryObj.noOfRooms}
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td style="width: 300px;border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53;">${roomCategoryObj.remarks}</td>
                                        <td style="width: 100px;text-align:center;border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53;">${roomCategoryObj.active}</td>
                                        <td style="width: 10%;text-align:center;border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53;">
                                        
                                            <form:form id="form_update_room_cat" name="form_update_room_cat"
                                                action="view_edit_hotel_room_category_form" method="POST" style="display:inline;">
                                                <input type="hidden" name="hotelId" value="${roomCategoryObj.hotelId}" />
                                                <input type="hidden" name="roomCategoryId" value="${roomCategoryObj.roomCategoryId}" />
                                                <!-- <input type="image" src="${pageContext.request.contextPath}/resources/images/edit.jpg" height="20" width="20"/> -->
                                                <input type="submit" style="background-color:#32cd32;color:white;border:none;outline:none;float:left;padding:2px 4px;border-radius:3px;
                                                margin-left:25px"
                                                    value="Edit" />
                                            </form:form>
                    
                                            <form:form id="form_del_FLT_SL" name="form_del_FLT_SL"
                                                action="view_delete_confirmation_room_category" method="POST" style="display:inline;">
                                                <input type="hidden" name="roomCategoryId" value="${roomCategoryObj.roomCategoryId}" />
                                                <input type="submit" style="background-color:red;color:white;border:none;outline:none;float:left;padding:2px 4px;border-radius:3px;
                                                margin-left:15px;float:left"
                                                    value="Delete" />
                    
                                            </form:form>
                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:if>

                    <c:if test="${ROOM_CAT_ACT eq 'ADD' }">
                        <form:form id="form_add_room_cat" name="form_add_room_cat" action="add_add_hotel_room_category_form" method="POST"
                            style="display:inline;">
                            <input type="hidden" name="hotelId" value="${hotelId}" />
                            <tr>
                                <td style="text-align:center;border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53;border-left:2px solid #FFCF53"><input type="text" size="100" name="roomCategoryName" style="width: 200px;"
                                        required /></td>
                                <td style="width: 100px;border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53">
                                    <div class="select" style="text-align:center;">
                                        <select id="higherCategory" name="higherCategory" style="width: 100px;">
                                            <c:forEach var="i" begin="0" end="5">
                                                <option class="service-small" value="${i}">
                                                    <c:out value="${i}" /> Higher
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                    
                                </td>
                                <td style="width: 140px;text-align:center;border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53">
                                    <input type="text" style="width: 50px;" name="roomSize" value="0" id="roomSize" size="15"
                                        pattern="[0-9.]+" /> Sq. Ft.
                                </td>
                                <td style="width: 100px;text-align:center;border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53">
                                    <input type="text" style="width: 80px;" name="noOfRooms" value="0" id="noOfRooms" size="15"
                                        pattern="[0-9.]+" />
                                </td>
                                <td style="width: 300px;border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53">
                                    <textarea rows="3" cols="47" name="remarks"></textarea>
                                </td>
                                <td style="border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53">
                                    <div class="select" style="width: 120px;text-align:center;">
                                        <select name="active">
                                            <option value="true" class="service-small" selected>True</option>
                                            <option value="false" class="service-small">False</option>
                                        </select>
                                    </div>
                                </td>
                                <td style="width: 100px;text-align:center;border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53">
                                    <input style="background-color:#32cd32  ;color:white;border:none;outline:none;float:left;padding:2px 4px;border-radius:3px;
                                                margin-left:15px" type="submit" value="ADD" />
                                    <a href="edit_edit_hotel?hotelId=${hotelId}&action=EditRoomCategory"><input
                                            style="background-color:red  ;color:white;border:none;outline:none;float:left;padding:2px 4px;border-radius:3px;
                                                margin-left:15px" type="button" value="Cancel" /></a>
                                </td>
                            </tr>
                        </form:form>
                    </c:if>


                    <c:if test="${ROOM_CAT_ACT ne 'ADD' }">
                        <tr>
                            <td colspan="6">&nbsp;</td>
                            <form:form id="form_add_room_cat" name="form_add_room_cat" action="view_add_hotel_room_category_form"
                                method="POST" style="display:inline;">
                                <input type="hidden" name="hotelId" value="${hotelId}" />
                                <td><input type="submit" style="background-color:red;color:white;border:none;outline:none;float:left;padding:2px 4px;border-radius:3px;
                                                margin:5px 2px" value="Add Room Category" /></td>
                            </form:form>
                        </tr>
                    </c:if>
                    
                    </table>
                    <div class="due_today_task_data_btnss" style="display:flex;justify-content:center;margin:10px 0">
                        <a href="view_view_hotel_details?hotelId=${hotelId}"><input type="button" value="View Hotel"
                                /></a>
                        <a href="view_search_hotel_form"><input type="button" value="Search Hotel"  /></a>
                    </div>
           
        </tbody>
    </table>

</body>
</html>