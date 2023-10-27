<!DOCTYPE html>
<html lang="en">
	<jsp:include page="../../menu/MenuBuilder.jsp" />
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Hotal Chain</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body
    style="background: url(${pageContext.request.contextPath}/resources/images/revamped/ADD_HOTAL_CHAIN_BG.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">


    <div class="Add-Hotal-Chain container">
        <form:form method="post" action="add_add_hotel_chain" modelAttribute="hotelchain_obj">
            <div class="add-hotal-chain-wrapper">
                <h1>Add New Hotel Chain</h1>
                <form action="">
                    <div class="ahc-in">
                        <div class="ahc-l1">
                            <label for="Add-hotal-Chain">Hotel Chain Name</label>
                            <input class="contact" type="text" name="hotelChainName" value="" id="Add-hotal-Chain" />
                        </div>
                        <div class="ahc-l2">
                            <label for="Remarks">Remarks</label>
                            <input type="text" id="Remarks">
                        </div>
                    </div>
                    <div class="Ahc-btns">
                        <input type="submit" value="Add Hotel Chain" class="ahc-btn ahc-in-btn">
                        <a href="view_search_hotel_chain_form">View Hotal Chain</a>
                    </div>
                </form>
            </div>
        </form:form>
    </div>



</body>

</html>