<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Admin_Delete_Confirmation_RoomCategory</title>
                    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
                    <script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
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
                    <div class="Admin_Delete_Confirmation_RoomCategory container">
                        <div class="Admin_Delete_Confirmation_RoomCategory_wr bs">
                            <form:form method="post" action="delete_delete_room_category">
                                <input type="hidden" name="roomCategoryId"
                                    value="${ROOM_CATEGORY_OBJ.roomCategoryId}" />
                                <h1 style="font-size: 25px;color:red;margin: 10px 0;">Delete Room Category <i
                                        class="fa-solid fa-triangle-exclamation fa-lg"></i></h1>
                                <div class="Admin_Delete_Confirmation_RoomCategory_wr_dl ">
                                    <div class="Admin_Delete_Confirmation_RoomCategory_wr_dl1">
                                        <label for="" class="">Room Category Id</label>
                                        <p style="font-weight:600;color:#023e8a">${ROOM_CATEGORY_OBJ.roomCategoryId}</p>
                                    </div>
                                    <div class="Admin_Delete_Confirmation_RoomCategory_wr_dl1">
                                        <label for="" class="">Room Category Name</label>
                                        <p style="font-weight:600;color:#023e8a">${ROOM_CATEGORY_OBJ.roomCategoryName}</p>
                                    </div>
                                    <div class="Admin_Delete_Confirmation_RoomCategory_wr_dl1">
                                        <label for="" class="">Hotel Name</label>
                                        <p style="font-weight:600;color:#023e8a">${ROOM_CATEGORY_OBJ.hotelName}</p>
                                    </div>
                                    <div class="Admin_Delete_Confirmation_RoomCategory_wr_dl1">
                                        <label for="" class="">Active</label>
                                        <p style="font-weight:600;color:#023e8a">${ROOM_CATEGORY_OBJ.active eq true }</p>
                                    </div>
                                </div>
                                <div class="Admin_Delete_Confirmation_RoomCategory_wr_dl ">
                                    <div class="Admin_Delete_Confirmation_RoomCategory_wr_dl1" style="width:100%">
                                        <label for="" class="">Remarks</label>
                                        <p style="font-weight:600;color:#023e8a">${ROOM_CATEGORY_OBJ.remarks}</p>
                                    </div>
                                </div>
                                <div class="due_today_task_data_btnss">
                                    <input type="submit" style="background-color:red;color:white" value="CONFIRM DELETE">
                                    <a
                                        href="edit_edit_hotel?hotelId=${ROOM_CATEGORY_OBJ.hotelId}&action=EditRoomCategory"><input
                                             type="button" value="Cancel" /></a>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </body>

</html>