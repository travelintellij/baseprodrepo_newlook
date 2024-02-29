<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin_View_Hotel</title>
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
    <div class="Admin_View_Hotel container">
        <div class="Admin_View_Hotel_wrapper bs">
            <h1 style="font-size: 25px;color: #32cd32 ;margin: 10px 0;">Hotal Id : ${hotelMasterObj.hotelId}</h1>
            <div align="center" style="margin:10px 0"><b>
                    <font color="#32cd32 "> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <div class="Admin_View_Hotel_wrapper_data">
                <div class="Admin_View_Hotel_wrapper_data_line a">
                    <div class="Admin_View_Hotel_wrapper_d1">
                        <label for="" class="">Hotal Chain Name</label>
                        <p style="font-weight:600;color:#023e8a">${hotelMasterObj.hotelChainName}</p>
                    </div>
                    <div class="Admin_View_Hotel_wrapper_d1">
                        <label for="" class="">Hotal Name</label>
                        <p style="font-weight:600;color:#023e8a">${hotelMasterObj.hotelName}</p>
                    </div>
                    <div class="Admin_View_Hotel_wrapper_d1">
                        <label for="" class="">City</label>
                        <p style="font-weight:600;color:#023e8a">${hotelMasterObj.cityName}</p>
                    </div>
                    <div class="Admin_View_Hotel_wrapper_d1">
                        <label for="" class="">Locality</label>
                        <p style="font-weight:600;color:#023e8a">${hotelMasterObj.locality}</p>
                    </div>
                </div>
                <div class="Admin_View_Hotel_wrapper_data_line a">
                    <div class="Admin_View_Hotel_wrapper_d1">
                        <label for="" class="">Room Category</label>
                        <p><c:forEach items="${hotelMasterObj.roomCategoryEntityList}" var="roomCategory">
                        
                            <li  style="font-weight:600;color:#023e8a">${roomCategory.roomCategoryName}</li>
                        
                        </c:forEach></p>
                    </div>
                    <div class="Admin_View_Hotel_wrapper_d1">
                        <label for="" class="">Active</label>
                        <p  style="font-weight:600;color:#023e8a">${hotelMasterObj.active}</p>
                    </div>
                    <div class="Admin_View_Hotel_wrapper_d1">
                        <label for="" class="">Hotel Category</label>
                        <p  style="font-weight:600;color:#023e8a">${hotelMasterObj.starCategory} Star</p>
                    </div>
                    <div class="Admin_View_Hotel_wrapper_d1">
                        <label for="" class="">Is Prefered</label>
                        <p  style="font-weight:600;color:#023e8a">${hotelMasterObj.preferred}</p>
                    </div>
                </div>
                <div class="Admin_View_Hotel_wrapper_data_line a">
                    <div class="Admin_View_Hotel_wrapper_d1">
                        <label for="" class="">Hotal Rating</label>
                        <p  style="font-weight:600;color:#023e8a">${hotelMasterObj.udnServiceRating} Star</p>
                    </div>
                    <div class="Admin_View_Hotel_wrapper_d1">
                        <label for="" class="">Address</label>
                        <p  style="font-weight:600;color:#023e8a">${hotelMasterObj.address}</p>
                    </div>
                    <div class="Admin_View_Hotel_wrapper_d1">
                        <label for="" class="">Phone No.</label>
                        <p  style="font-weight:600;color:#023e8a">${hotelMasterObj.phone}</p>
                    </div>
                    <div class="Admin_View_Hotel_wrapper_d1">
                        <label for="" class="">Email</label>
                        <p  style="font-weight:600;color:#023e8a">${hotelMasterObj.email}</p>
                    </div>
                </div>
                <div class="Admin_View_Hotel_wrapper_data_line a">
                    <div class="Admin_View_Hotel_wrapper_d1" style="width:100%">
                        <label for="" class="">Remarks</label>
                        <p  style="font-weight:600;color:#023e8a">${hotelMasterObj.remarks}</p>
                    </div>
                </div>
                <div class="due_today_task_data_btnss" style="margin-top:20px">
                <sec:authorize access="hasAnyRole('ADMIN','HOTEL_EDIT')">
                    <form:form method="post" action="view_edit_hotel_form?hotelId=${hotelMasterObj.hotelId}" modelAttribute="hotel_obj"
                        style="display:inline;">
                        <input type="submit" value="Edit Hotel" style="background-color:#32cd32;" />
                    </form:form>
                </sec:authorize>
                <a href="view_search_hotel_form"><input type="button" 
                        value="Search Hotel"></a></td>
                </div>
            </div>
        </div>
    </div>
</body>
</html>