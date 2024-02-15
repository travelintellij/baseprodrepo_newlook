<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <jsp:include page="../../menu/MenuBuilder.jsp" />

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Admin_Delete_Confirmation_Hotel</title>
                    <link rel="stylesheet" href="style.css">
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
                    <div class="Admin_View_Hotel container">
                        <div class="Admin_View_Hotel_wrapper bs">
                            <div align="center">${confirmation}</div>
                            <h1 style="font-size: 25px;color: #32cd32 ;margin: 10px 0;">Hotal Id :
                                ${hotelMasterObj.hotelId}</h1>
                            <div align="center" style="margin:10px 0"><b>
                                    <font color="#32cd32 "> ${Success} </font>
                                    <font color="red"> ${Error}</font>
                                </b></div>
                            <div class="Admin_View_Hotel_wrapper_data">
                                <div class="Admin_View_Hotel_wrapper_data_line ">
                                    <div class="Admin_View_Hotel_wrapper_d1">
                                        <label for="" class="lb">Hotal Chain Name</label>
                                        <p style="color:gray">${hotelMasterObj.hotelChainName}</p>
                                    </div>
                                    <div class="Admin_View_Hotel_wrapper_d1">
                                        <label for="" class="lb">Hotal Name</label>
                                        <p style="color:gray">${hotelMasterObj.hotelName}</p>
                                    </div>
                                    <div class="Admin_View_Hotel_wrapper_d1" style="text-align:start;width:250px">
                                        <label for="" class="lb">City</label>
                                        <p style="color:gray">${hotelMasterObj.cityName}</p>
                                    </div>
                                    <div class="Admin_View_Hotel_wrapper_d1">
                                        <label for="" class="lb">Locality</label>
                                        <p style="color:gray">${hotelMasterObj.locality}</p>
                                    </div>
                                </div>
                                <div class="Admin_View_Hotel_wrapper_data_line ">
                                    <div class="Admin_View_Hotel_wrapper_d1">
                                        <label for="" class="lb">Room Category</label>
                                        <p style="color:gray">
                                            <c:forEach items="${hotelMasterObj.roomCategoryEntityList}"
                                                var="roomCategory">

                                                <li style="color:gray">${roomCategory.roomCategoryName}</li>

                                            </c:forEach>
                                        </p>
                                    </div>
                                    <div class="Admin_View_Hotel_wrapper_d1">
                                        <label for="" class="lb">Active</label>
                                        <p style="color:gray">${hotelMasterObj.active}</p>
                                    </div>
                                    <div class="Admin_View_Hotel_wrapper_d1" style="text-align:start;width:250px">
                                        <label for="" class="lb">Hotel Category</label>
                                        <p style="color:gray"> ${hotelMasterObj.starCategory} Star</p>
                                    </div>
                                    <div class="Admin_View_Hotel_wrapper_d1">
                                        <label for="" class="lb">Is Prefered</label>
                                        <p style="color:gray">${hotelMasterObj.preferred}</p>
                                    </div>
                                </div>
                                <div class="Admin_View_Hotel_wrapper_data_line ">
                                    <div class="Admin_View_Hotel_wrapper_d1">
                                        <label for="" class="lb">Hotal Rating</label>
                                        <p style="color:gray">${hotelMasterObj.udnServiceRating} Star</p>
                                    </div>
                                    <div class="Admin_View_Hotel_wrapper_d1">
                                        <label for="" class="lb">Address</label>
                                        <p style="color:gray">${hotelMasterObj.address}</p>
                                    </div>
                                    <div class="Admin_View_Hotel_wrapper_d1" style="text-align:start;width:250px">
                                        <label for="" class="lb">Phone No.</label>
                                        <p style="color:gray">${hotelMasterObj.phone}</p>
                                    </div>
                                    <div class="Admin_View_Hotel_wrapper_d1" >
                                        <label for="" class="lb">Email</label>
                                        <p style="color:gray">${hotelMasterObj.email}</p>
                                    </div>
                                </div>
                                <div class="Admin_View_Hotel_wrapper_data_line  ">
                                    <div class="Admin_View_Hotel_wrapper_d1" style="width:100%">
                                        <label for="" class="lb">Remarks</label>
                                        <p style="color:gray">${hotelMasterObj.remarks}</p>
                                    </div>
                                </div>
                                <div class="due_today_task_data_btnss" style="width:100%">
                                    <form:form method="post"
                                        action="delete_delete_hotel?hotelId=${hotelMasterObj.hotelId}">
                                        <input type="submit" name="Delete" Value="Confirm Delete"
                                            style="background-color: red;color:white" />
                                        <a href="view_search_hotel_form"><input type="button"
                                                value="Search Again" /></a>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </body>

</html>