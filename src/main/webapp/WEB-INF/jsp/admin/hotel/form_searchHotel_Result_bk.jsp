<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<jsp:include page="../../menu/MenuBuilder.jsp" />

<style>
table {
  width: 90%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
}

th {
  background: #7B68EE;
  height: 40px;
  width: 10%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
}
tr {
  border-bottom: 1px solid #cccccc;
}

td {
  border-right: 1px solid #cccccc;
  padding: 10px;
  transition: all 0.2s;
  text-align: center;
}

.heavyTable {
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
  animation: float 5s infinite;
}

input[type=button], input[type=submit], input[type=reset] {
  background-color: #4CAF50;
  border: none;
  color: white;
  padding: 10px 20px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;

}


</style>
	<h2 align="center"><br>Search Hotel Results</h2>
	
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<form:form modelAttribute="searchhotel_obj" action="search_search_hotel">
		<table style="width:98%;">
			<tr >
				<td style="width:10%;height:30px;"><img src="${pageContext.request.contextPath}/resources/images/filter.jpg" height="50" width="50"/></td>
				<th style="width:10%;height:30px;">Locality</th>
				<td style="width:10%;height:30px;">
					<input type="text" style="width:200px;" name="locality" id="locality" placeholder="locality like" value="${hotel_search_result.locality}" />
				</td>
				<th style="width:10%;height:30px;">Hotel Name</th>
				<td style="width:15%;height:30px;">
					<input type="text" style="width:250px;" name="hotelName" id="hotelName" placeholder="Hotel Name" value="${hotel_search_result.hotelName}" />
				</td>
				
				
				<th style="width:10%;height:30px;">Hotel Category</th>
				<td style="width:5%;height:30px;">
						<div class="select" style="margin: 0 auto;">
							<select name="starCategory" style="width:140px;">
								<option value="0" class="service-small" selected>Hotel Star Category</option>
								<c:forEach var="i" begin="2" end="5">
									<c:if test="${i eq hotel_search_result.starCategory}">
										<option value="${i}" class="service-small" selected>${i} Star</option>
									</c:if>
									<c:if test="${i ne hotel_search_result.starCategory}">
										<option value="${i}" class="service-small">${i}Star</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
				</td>
				<th style="width:10%;height:30px;">Hotel Rating</th>
				<td style="width:8%;height:30px;">
					<div class="select" style="margin: 0 auto;">
						<select name="udnServiceRating" style="width:140px;">
							<option value="0" class="service-small" selected>Select	Hotel Rating</option>
							<c:forEach var="i" begin="2" end="5">
								<c:if test="${i eq hotel_search_result.udnServiceRating}">
									<option value="${i}" class="service-small" selected>${i}
										Star</option>
								</c:if>
								<c:if test="${i ne hotel_search_result.udnServiceRating}">
									<option value="${i}" class="service-small">${i}Star</option>
								</c:if>
							</c:forEach>
							</select>
					</div>
				</td>

				<td style="width:10%;height:30px;"><input style="background-color:red;" type="submit" value="Apply Filter" /> </td>
				<td style="width:10%;height:30px;"><a href="view_search_hotel_form"><input type="button" value="Search Again" /></a></td>

			</tr>
		</table>
	
	<input type="hidden" name="hotelId" value="${hotel_search_result.hotelId}" />
	<input type="hidden" name="cityId" value="${hotel_search_result.cityId}" />
	<input type="hidden" name="hotelChainId" value="${hotel_search_result.hotelChainId}" />

	<input type="hidden" name="active" value="${hotel_search_result.active}" />
	<input type="hidden" name="active" value="${hotel_search_result.searchPrefer}" />
</form:form>
	<table>
		<caption>Search Result</caption>
		<tr>
			<th style="width: 10%;">Hotel Id</th>
			<th style="width: 20%;">Hotel Name</th>
			<th style="width: 5%;">Locality</th>
			<th style="width: 10%;">Hotel Category</th>
			<th style="width: 10%;">Preferred</th>
			<th style="width: 10%;">Hotel Rating</th>

			<th style="width: 25%;">Action</th>
		</tr>
		<c:if test="${not empty HTL_SEARCH_RESULT}">
			<c:forEach var="hotelObj" items="${HTL_SEARCH_RESULT}">
				<tr>
					<td style="width: 10%;">
						${hotelObj.hotelId}</td>
					<td style="width: 20%;">
						${hotelObj.hotelName}
					</td>
					<td style="width: 15%;">
						${hotelObj.locality}</td>
					<td style="width: 10%;">
						<c:forEach	var="i" begin="1" end="${hotelObj.starCategory}">
							<input type="image" src="${pageContext.request.contextPath}/resources/images/star.jpg" height="20" width="20" />
						</c:forEach></td>
					<td style="width: 10%;">
						${hotelObj.preferred}
					</td>
					<td style="width: 10%;">
						<c:forEach var="i" begin="1" end="${hotelObj.udnServiceRating}">
							<input type="image" src="${pageContext.request.contextPath}/resources/images/star.jpg" height="20" width="20" />
						</c:forEach>
					</td>

					<td style="width: 25%;text-align:center;">
						<table>
						<tr>
						<td>
							<sec:authorize access="hasAnyRole('ADMIN','HOTEL_CREATE','HOTEL_VIEW','HOTEL_EDIT','HOTEL_DEL','ROOM_CAT_MANAGE')">
								<a href="view_view_hotel_details?hotelId=${hotelObj.hotelId}" ><input type="button" value="View" style="background-color:blue;display:inline;float:left" /></a>
							</sec:authorize>
						</td>
						<td>
							<sec:authorize access="hasAnyRole('ADMIN','HOTEL_EDIT')">
								<form:form method="post" action="view_edit_hotel_form?hotelId=${hotelObj.hotelId}" style="display:inline;" >								
										<input  type="submit" value="Edit" style="background-color:blue;float:left"/>
								</form:form>
							</sec:authorize>
	
							<sec:authorize access="! hasAnyRole('ADMIN','HOTEL_EDIT')">
								<form:form method="post" action="view_edit_hotel_form?hotelId=${hotelObj.hotelId}" style="display:inline;" >								
										<input  type="submit" value="Edit" style="background-color: #dddddd;float:left" disabled/>
								</form:form>
							</sec:authorize>
						</td>
						<td>
							<sec:authorize access="hasAnyRole('ADMIN','ROOM_CAT_MANAGE')">
								<form:form method="post" action="edit_edit_hotel?hotelId=${hotelObj.hotelId}" style="display:inline;" >
									<input type="hidden" name="action" value="EditRoomCategory" />
									<input  type="submit" value="Edit Room Category" style="background-color:blue;float:left" />
								</form:form>
							</sec:authorize>	
	
							<sec:authorize access="! hasAnyRole('ADMIN','ROOM_CAT_MANAGE')">
								<form:form method="post" action="edit_edit_hotel?hotelId=${hotelObj.hotelId}" style="display:inline;" >
									<input type="hidden" name="action" value="EditRoomCategory" />
									<input  type="submit" value="Edit Room Category" style="background-color: #dddddd;float:left" disabled/>
								</form:form>
							</sec:authorize>	
						</td>
						<td>
							<sec:authorize access="hasAnyRole('ADMIN','HOTEL_DEL')">
								<form:form method="post" action="view_delete_hotel" style="display:inline;" >
									<input type="hidden" name="hotelId" value="${hotelObj.hotelId}" />
									<input type="submit" value="Delete" style="background-color:red;float:left;"  />
								</form:form>
							</sec:authorize>
							<sec:authorize access="! hasAnyRole('ADMIN','HOTEL_DEL')">
								<form:form method="post" action="view_delete_hotel" style="display:inline;" >
									<input type="hidden" name="hotelId" value="${hotelObj.hotelId}" />
									<input type="submit" value="Delete" style="background-color: #dddddd;float:left;" disabled />
								</form:form>
							</sec:authorize>
						</td>
						</tr>
						</table>
					</td>
				</tr>
			</c:forEach>
		</c:if>

	</table>
</body>

</html>
