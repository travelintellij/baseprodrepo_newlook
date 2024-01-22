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
                    <title>Admin_Delete_Confirmation_HotelChain</title>
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
                    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
                    <script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
                </head>
                <style>
                    body::before {
                        content: "";
                        background-image: url(${pageContext.request.contextPath}/resources/images/revamped/lens.jpg);
                        background-size: cover;
                        background-repeat: no-repeat;
                        background-position: center center;
                        background-attachment: fixed;
                        position: fixed;
                        top: 0;
                        left: 0;
                        width: 100%;
                        height: 100%;
                        opacity: 0.5;
                        /* Adjust the opacity value as needed (0.0 to 1.0) */
                        z-index: -1;
                    }
                </style>

                <body>
                    <div class="Admin_Edit_HotelChain container">
                        <div class="Admin_Edit_HotelChain_wrapper">
                            <form:form method="post" action="delete_delete_hotel_chain" modelAttribute="hotelchain_obj">
                                <input type="hidden" name="hotelChainId" value="${HotelChainObj.hotelChainId}" />
                                <h1 style="font-size: 25px;color: red  ">Delete Hotal Chain <i
                                        class="fa-solid fa-triangle-exclamation fa-lg"></i></h1>
                                <p style="color:orangered;margin-bottom: 10px;">( Hotel Chain can only be deleted if
                                    there is no
                                    participating hotel in the chain. Kindly ensure before deleting. )</p>
                                <div align="center"><b>
                                        <font color="green"> ${Success} </font>
                                        <font color="red"> ${Error}</font>
                                    </b></div>
                                <div class="Admin_Edit_HotelChain_wrapper_data">
                                    <div class="Admin_Edit_HotelChain_wrapper_li a">
                                        <div class="Admin_Edit_HotelChain_wrapper_dl1">
                                            <label for="" class="lb">Hotel Chain Id</label>
                                            <p>${HotelChainObj.hotelChainId}</p>
                                        </div>
                                        <div class="Admin_Edit_HotelChain_wrapper_dl1">
                                            <label for="" class="lb">Hotal Chain Name</label>
                                            <p>${HotelChainObj.hotelChainName}</p>
                                        </div>
                                        <div class="Admin_Edit_HotelChain_wrapper_dl1">
                                            <label for="" class="lb">Active</label>
                                            <p>${HotelChainObj.active eq true }</p>
                                        </div>
                                    </div>
                                    <div class="Admin_Edit_HotelChain_wrapper_li2 a">
                                        <div class="Admin_Edit_HotelChain_wrapper_dl1">
                                            <label for="" class="lb">Remarks</label> <br>
                                            <p>${HotelChainObj.remarks}</p>
                                        </div>
                                    </div>
                                    <div class="due_today_task_data_btnss" style="margin-top:20px">
                                        <input type="submit" style="background-color:red;" value="CONFIRM DELETE">
                                        <a href="view_search_hotel_chain_form"><input type="button" value="Cancel"></a>
                                    </div>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </body>

</html>