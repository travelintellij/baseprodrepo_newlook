<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin_Edit_HotelChain</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<style>

        body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/edit_hotal_chain.jpg);
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
    <div class="Admin_Edit_HotelChain container">
        <div class="Admin_Edit_HotelChain_wrapper">
            <h1 style="font-size: 25px;color: #32cd32  ">Edit Hotel Chain(Id: ${HotelChainObj.hotelChainId})</h1>
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <form:form method="post" action="add_add_hotel_chain" modelAttribute="hotelchain_obj">
                <input type="hidden" name="hotelChainId" value="${HotelChainObj.hotelChainId}" />
                <div class="Admin_Edit_HotelChain_wrapper_data">
                    <div class="Admin_Edit_HotelChain_wrapper_li">
                        <div class="Admin_Edit_HotelChain_wrapper_dl1">
                            <label for="">Hotel Chain Name</label>
                            <input type="text" name="hotelChainName" value="${HotelChainObj.hotelChainName}" />
                        </div>
                        <div class="Admin_Edit_HotelChain_wrapper_dl1">
                            <label for="">Active</label>
                            <select id="active" name="active" style="width: 90%" required>
                                <c:if test="${HotelChainObj.active eq true }">
                                    <option class="service-small" value="true" selected>Active</option>
                                    <option class="service-small" value="false">In- Active</option>
                                </c:if>
                                <c:if test="${HotelChainObj.active ne true }">
                                    <option class="service-small" value="false" selected>In-Active</option>
                                    <option class="service-small" value="true">Active</option>
                                </c:if>
                            </select>
                        </div>
                    </div>
                    <div class="Admin_Edit_HotelChain_wrapper_li2" style="width:100%">
                        <div class="Admin_Edit_HotelChain_wrapper_dl1" style="width:100%">
                            <label for="">Remarks</label> <br>
                            <textarea style="width:100%" rows="2" name="remarks"
                                maxlength="250">${HotelChainObj.remarks}</textarea>
                        </div>
                    </div>
                    <div class="due_today_task_data_btnss">
                        <input type="submit" value="Update Hotel Chain">
                        <a href="view_search_hotel_chain_form"><input type="button"
                                 value="Cancel"></a>
                        </td>
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</body>

</html>