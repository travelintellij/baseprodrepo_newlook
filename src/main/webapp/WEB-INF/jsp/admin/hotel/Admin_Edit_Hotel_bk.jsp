<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<jsp:include page="../../menu/MenuBuilder.jsp" />


<style>
li {
  text-align: left;
}
th {
	background: royalblue;
	color: #FFF;
	padding: 2px 2px;
	text-align: center;
}

td {
	text-align: center;
}

input[type=button], input[type=submit], input[type=reset] {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}
</style>
<br>
<br>
<h2 align="center">Edit Hotel</h2>

	
<body style="background-color: creamwhite;">

<br>
<br>
<br>
<br>
<br>
<br><br>

<br>


	<form:form method="post" action="edit_edit_hotel" modelAttribute="hotel_obj">
	<input type="hidden" name="hotelId" id="hotelId" value="${hotel_obj.hotelId}" />
		<div id="table">
				<table border="1px" style="width:80%;border-collapse: collapse;"  cellpadding="10px;" align="center">
				<tbody>
					<tr>
						<td>
							<table cellpadding="0px;" cellspacing="10px;">
								<tbody>
									<tr>
										<th style="width: 250px;">Select Hotel Chain</th>
										<td>
											<div class="select" style="margin: 2px; height: 40px; width: 320px;">
												<select name="hotelChainId">
													<c:if test="${not empty HotelChainObjList}">
									       				<c:forEach items="${HotelChainObjList}" var="hotelChainObj">
									      					<c:if test="${hotelChainObj.hotelChainId eq hotel_obj.hotelChainId }">
									      						<option class="service-small" value="${hotelChainObj.hotelChainId}" selected>${hotelChainObj.hotelChainName}</option>
									      					</c:if>
									      					<c:if test="${hotelChainObj.hotelChainId ne hotel_obj.hotelChainId }">
									      						<option class="service-small" value="${hotelChainObj.hotelChainId}">${hotelChainObj.hotelChainName}</option>
									      					</c:if>
									   					</c:forEach>
									 				</c:if>
									 			</select>
											</div>
										</td>
									</tr>
									<tr>
										<th style="width: 250px;">Hotel Name</th>
										<td style="width: 350px;">
											<input type="text" style="height:40px;width:350px; margin: 2px;" name="hotelName" id="hotelName" value="${hotel_obj.hotelName}" size="140"  required />
										</td>
									</tr>
									<tr>
									<th>Room Category</th> 
									<td style="border: 1px solid black;padding: 5px;">
										<c:forEach items="${hotel_obj.roomCategoryEntityList}" var="roomCategory">
 											<li>${roomCategory.roomCategoryName}</li>
 										</c:forEach>
 										<br>
 									 	<button type="submit" id="btnSave" name="action" value="EditRoomCategory">Edit Room Category</button>
 										<!-- 
 										<input type="submit" value="Edit Room Category" style="text-align: left;padding: 7px 7px;"  />
										--> 
									
									</td>
									</tr>
								</tbody>
							</table>
						</td>
						<td>
							<table cellpadding="0px;" cellspacing="20px;">
								<tbody>
									<tr>
										<th style="width: 100px;">City</th>
										<td style="width: 100px;">
											<input type="text" style="height:40px;width:350px; margin: 2px;" name="cityName" id="cityName" value="${hotel_obj.cityName}" required />
											
											<input type="hidden" name="cityId" id="cityId" value="${hotel_obj.cityId}" />
											<br><font color="red"><form:errors path="cityId" cssClass="error" /></font>
										</td> 
									</tr>
									<tr>
										<th style="width: 100px;">Address</th>
										<td> <textarea rows="3" cols="47" name="address">${hotel_obj.address}</textarea></td>
									</tr>
									<tr>
										<th style="width: 100px;">Locality</th>
										<td><input type="text" style="height:40px;width:350px; margin: 2px;" name="locality" value="${hotel_obj.locality}" id="locality" /></td>
									</tr>
								</tbody>
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table>
							<tr><td>
							
							
							<table cellpadding="0px;" cellspacing="20px;">
								<tbody>
									<tr>
										<th style="width: 150px;">Star Category</th>
										<td style="width: 150px;">
											<div class="select" style="margin: 0 auto;">
											<select name="starCategory">
													<option value="0" class="service-small" selected>Hotel Star Category</option>
													<c:forEach var="i" begin="2" end="5">
														<c:if test="${i eq hotel_obj.starCategory}">
															<option value="${i}" class="service-small" selected>${i} Star</option>
														</c:if>
														<c:if test="${i ne hotel_obj.starCategory}">
															<option value="${i}" class="service-small">${i}Star</option>
														</c:if>
													</c:forEach>
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<th style="width: 150px;">Hotel Rating</th>
										<td style="width: 150px;">
												<div class="select" style="margin: 0 auto;">
													<select name="udnServiceRating">
														<option value="0" class="service-small" selected>Select	Hotel Rating</option>
														<c:forEach var="i" begin="2" end="5">
															<c:if test="${i eq hotel_obj.udnServiceRating}">
																<option value="${i}" class="service-small" selected>${i}
																	Star</option>
															</c:if>
															<c:if test="${i ne hotel_obj.udnServiceRating}">
																<option value="${i}" class="service-small">${i}Star</option>
															</c:if>
														</c:forEach>
													</select>
												</div>
										</td>
									</tr>
									<tr>
										<th style="width: 150px;">Is Preferred</th>
										<td style="width: 150px;">
											<div class="select" style="width: 120px;">
												<select name="preferred">
													<c:if test="${hotel_obj.preferred eq true}">
														<option value="false" class="service-small">No</option>
														<option value="true" class="service-small" selected>Yes</option>
													</c:if>
													<c:if test="${hotel_obj.preferred ne true}">
														<option value="false" class="service-small" selected>No</option>
														<option value="true" class="service-small" >Yes</option>
													</c:if>
													
													
													<!-- 
													<option value="false" class="service-small">No</option>
													<option value="true" class="service-small" selected>Yes</option>
													 -->

												</select>
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							</td>
							<td >
								<table cellspacing="10px;">
								<tr><th width="355" height="50">Remarks</th></tr>
										<tr><td colspan="2"> <textarea rows="5" cols="47" name="remarks">${hotel_obj.remarks}</textarea></td></tr>
									</table>
							</td>
							</tr>
							</table>
							
						</td>
						<td>
							<table cellspacing="20px;">
								<tbody>
									<tr>
										<th style="width: 150px;">Hotel Phone</th>
										<td><input type="text" style="height:40px;width:250px; margin: 2px;" name="phone" id="phone" value="${hotel_obj.phone}" pattern="[0-9.]+" /></td>
									</tr>
									<tr>
										<th style="width: 150px;">Hotel Email</th>
										<td><input type="text" style="height:40px;width:250px; margin: 2px;" name="email" id="email" value="${hotel_obj.email}" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" /></td>
									</tr>
									
								</tbody>
							</table>
						</td>
					</tr>
					
					<tr>
						<td colspan="2">
						 <input type="submit" name="action" value="Update Hotel" style="background-color:green;" /> 
						
       					<!-- 	 <button type="submit" id="btnSave" name="action" value="EditHotel">Edit Hotel</button> -->
        					<a href="view_search_hotel_form"><input type="button" style="width: 140px;background-color: blue;" value="Search Hotel"></a>
        					<a href="view_view_hotel_details?hotelId=${hotel_obj.hotelId}" ><input type="button" value="Cancel" style="background-color:blue;" /></a>
						</td>
					</tr>
				</tbody>
			</table>

		

		</div>
	</form:form>


<script>
	$('#cityName').autocomplete({
	serviceUrl: '${pageContext.request.contextPath}/getCityList',
	paramName: "cityName",
	delimiter: ",",
	onSelect: function(suggestion) {
        cityID = suggestion.data;
        id=cityID;
        jQuery("#destinationId").val(cityID);
        $('input[name=cityId]').val(id);
        return false;
    },
	transformResult: function(response) {
        return {
            suggestions: $.map($.parseJSON(response), function(item) {
            	return { value: item.cityName, data: item.destinationId };
            })
            
        };
    }
});
</script>


</body>
