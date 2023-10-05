<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<html>
<head>
	<jsp:include page="../../menu/MenuBuilder.jsp" />
	
	<style>
	table {
	  width: 50%;
	  height: 60px;
	  border-collapse: collapse;
	  border: 1px solid #38678f;
	  margin: 5px auto;
	  background: white;
	}
	
	th {
	  background: #7B68EE;
	  height: 40px;
	  width: 40%;
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
	  text-align: left;
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
</head>

<br>
	<h2 align="center">
	Manage Room Category
	</h2>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<body>
	<table style="width:50%;border:1px;border-collapse: collapse;">
		<tr>
			<th style="width: 100px; background: green;">Hotel Id</th><td style="width: 100px;">${hotelId}</td>
			<th style="width: 100px; background: green;">Address</th><td style="width: 600px;">${address}</td>
		</tr>
		<tr>
			<th style="width: 150px; background: green;">Hotel Name</th><td style="width: 600px;">${hotelName}</td>
			<th style="width: 100px; background: green;">City</th><td style="width: 300px;">${city}</td>
		</tr>
	</table>
	
		<br>
		<table  style="width:85%;border:1px;border-collapse: collapse;">
			<tr>
				<th style="width: 10%;">Room Category Name</th>
				<th style="width: 10%;">Category Hierarchy</th>
				<th style="width: 10%;">Room Size</th>
				<th style="width: 10%;">No. of Rooms</th>
				<th style="width: 30%;">Remarks</th>
				<th style="width: 10%;">Active</th>
				<th style="width: 20%;">Action</th>
			</tr>
		
		<c:if test="${not empty Room_Cat_Obj_List}">
			<c:forEach var="roomCategoryObj" items="${Room_Cat_Obj_List}">
			<c:choose>
				<c:when test="${roomCategoryObj.roomCategoryId eq ORG_ROOM_CAT_VO.roomCategoryId  && ROOM_CAT_ACT eq 'UPDATE' }">
				<form:form name="editRoomCategoryForm" modelAttribute="HTL_ROOM_CAT" action="edit_edit_hotel_room_category" >
					<input type="hidden" name="roomCategoryId" value="${roomCategoryObj.roomCategoryId}" />
					<input type="hidden" name="hotelId" value="${hotelId}" />
	
					<tr>
						<td style="width: 10%;"><input type="text" style="width:250px;" size="100" name="roomCategoryName" value="${roomCategoryObj.roomCategoryName}" required/></td>
						<td style="width: 10%;">
							 <div class="select" style="text-align:center;">
								<select id = "higherCategory" name="higherCategory" style="width: 100px;">
									<c:forEach var = "i" begin = "0" end = "5">
         							 <c:if test="${roomCategoryObj.higherCategory eq i}">
         								<option class="service-small" value="${i}" selected><c:out value = "${i}"/> Higher</option>
         						      </c:if>
         						      <c:if test="${roomCategoryObj.higherCategory ne i}">
         								<option class="service-small" value="${i}"><c:out value = "${i}"/> Higher</option>
         						      </c:if>
						  			</c:forEach>
								</select>
							</div>
						
						</td>
						<td style="width: 10%;text-align:center;">
							<input type="text" style="width: 80px;" name="roomSize" value="${roomCategoryObj.roomSize}" id="roomSize" size="15" pattern="[0-9.]+" /> Sq. Ft.
						</td>
						<td style="width: 10%;text-align:center;">
							<input type="number" style="width: 80px;" name="noOfRooms" value="${roomCategoryObj.noOfRooms}" id="noOfRooms" size="15" pattern="[0-9.]+" /> 
						</td>
						<td style="width: 30%;text-align:center;" >
							<textarea rows="3" cols="47" name="remarks">${roomCategoryObj.remarks}</textarea>
						</td>
						<td style="width: 10%;">
							<div class="select" style="width: 120px;text-align:center;">
								<select name="active">
									<c:if test="${roomCategoryObj.active eq true}">
										<option value="false" class="service-small">False</option>
										<option value="true" class="service-small" selected>True</option>
									</c:if>
									<c:if test="${roomCategoryObj.active ne true}">
										<option value="false" class="service-small" selected>False</option>
										<option value="true" class="service-small" >True</option>
									</c:if>
								</select>
							</div>
						</td>
						<td style="width: 20%;">
								<input style="background-color: green;" type="submit" value="Update" />
								<a href="edit_edit_hotel?hotelId=${hotelId}&action=EditRoomCategory"><input style="background-color: blue;" type="button" value="Cancel" /></a>
						</td>
						</tr>
				</form:form>
				</c:when>
				<c:otherwise>
					<tr>
						<td style="width: 150px;">${roomCategoryObj.roomCategoryName}</td>
						<td style="width: 100px;text-align:center;">${roomCategoryObj.higherCategory} Higher</td>
						<td style="width: 140px;text-align:center;">
						
						<c:choose>
						    <c:when test="${roomCategoryObj.roomSize eq 0}">
								Un-Known
						    </c:when>    
						    <c:otherwise>
								${roomCategoryObj.roomSize} Sq. Ft.
						    </c:otherwise>
						</c:choose>
			
						</td>
						<td style="width: 100px;text-align:center;">
							<c:choose>
							    <c:when test="${roomCategoryObj.noOfRooms eq 0}">
									Un-Known
							    </c:when>    
							    <c:otherwise>
									${roomCategoryObj.noOfRooms}
							    </c:otherwise>
							</c:choose>
						</td>
						<td style="width: 300px;">${roomCategoryObj.remarks}</td>
						<td style="width: 100px;text-align:center;">${roomCategoryObj.active}</td>
						<td style="width: 15%;text-align:center;">
							<form:form id="form_update_room_cat" name="form_update_room_cat" action="view_edit_hotel_room_category_form" method="POST" style="display:inline;">
								<input type="hidden" name="hotelId" value="${roomCategoryObj.hotelId}"/>
								<input type="hidden" name="roomCategoryId" value="${roomCategoryObj.roomCategoryId}"/>
								<!-- <input type="image" src="${pageContext.request.contextPath}/resources/images/edit.jpg" height="20" width="20"/> -->
								<input type="submit" style="background-color: blue;display:inline;float:left" value="Edit" />
							</form:form>

							<form:form id="form_del_FLT_SL" name="form_del_FLT_SL" action="view_delete_confirmation_room_category" method="POST" style="display:inline;">		
								<input type="hidden" name="roomCategoryId" value="${roomCategoryObj.roomCategoryId}"/>
								<input type="submit" style="background-color: red;display:inline;float:left" value="Delete" />

							</form:form>
						</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</c:if>
		
		<c:if test="${ROOM_CAT_ACT eq 'ADD' }">
			<form:form id="form_add_room_cat" name="form_add_room_cat" action="add_add_hotel_room_category_form" method="POST" style="display:inline;">
					<input type="hidden" name="hotelId" value="${hotelId}"/>
					<tr>
						<td style="text-align:center;"><input type="text" size="100" name="roomCategoryName" style="width: 200px;" required/></td>
						<td style="width: 100px;">
							 <div class="select" style="text-align:center;">
								<select id = "higherCategory" name="higherCategory" style="width: 100px;">
									<c:forEach var = "i" begin = "0" end = "5">
         								<option class="service-small" value="${i}"><c:out value = "${i}"/> Higher</option>
						  			</c:forEach>
								</select>
							</div>
						
						</td>
						<td style="width: 140px;text-align:center;">
							<input type="text" style="width: 50px;" name="roomSize" value="0" id="roomSize" size="15" pattern="[0-9.]+" /> Sq. Ft.
						</td>
						<td style="width: 100px;text-align:center;">
							<input type="text" style="width: 80px;" name="noOfRooms" value="0" id="noOfRooms" size="15" pattern="[0-9.]+" /> 
						</td>
						<td style="width: 300px;">
							<textarea rows="3" cols="47" name="remarks"></textarea>
						</td>
						<td>
							<div class="select" style="width: 120px;text-align:center;">
								<select name="active">
									<option value="true" class="service-small" selected>True</option>
									<option value="false" class="service-small">False</option>
								</select>
							</div>
						</td>
						<td style="width: 100px;text-align:center;">
								<input style="background-color: green;" type="submit" value="ADD" />
								<a href="edit_edit_hotel?hotelId=${hotelId}&action=EditRoomCategory"><input style="background-color: blue;" type="button" value="Cancel" /></a>
						</td>
						</tr>
				</form:form>
			</c:if>
		
		
		<c:if test="${ROOM_CAT_ACT ne 'ADD' }">
		<tr>
		<td colspan="6">&nbsp;</td>
			<form:form id="form_add_room_cat" name="form_add_room_cat" action="view_add_hotel_room_category_form" method="POST" style="display:inline;">
				<input type="hidden" name="hotelId" value="${hotelId}"/>
				<td><input type="submit" value="Add Room Category" /></td>
			</form:form>
		</tr>
		</c:if>	
		
		</table>
		<p align="center">
			<a href="view_view_hotel_details?hotelId=${hotelId}" ><input type="button" value="View Hotel" style="background-color:blue;" /></a>
			<a href="view_search_hotel_form"><input type="button" value="Search Hotel" style="background-color:blue;" /></a>
		</p>
	</body>
</html>
