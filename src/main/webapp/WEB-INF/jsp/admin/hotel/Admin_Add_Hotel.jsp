<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<style>
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
<center>
		<h2>
			Add Hotel
		</h2>
	</center>
<body style="background-color: creamwhite;">
	<form:form method="post" action="add_add_hotel" modelAttribute="hotel_obj">
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
									      					<c:if test="${hotelChainObj.hotelChainId eq 1 }">
									      						<option class="service-small" value="${hotelChainObj.hotelChainId}" selected>${hotelChainObj.hotelChainName}</option>
									      					</c:if>
									      					<c:if test="${hotelChainObj.hotelChainId ne 1 }">
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
											<input type="text" style="height:40px;width:350px; margin: 2px;" name="hotelName" id="hotelName" placeholder="Hotel Name" size="140"  required />
										</td>
									</tr>
									<tr>
									<th>Default Room Category Name </th> 
									<td><input type="text" style="height:40px;width:350px; margin: 2px;" name="defaultRoomCategory" value="Standard" required /></td>
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
											<input type="text" style="height:40px;width:350px; margin: 2px;" name="cityName" id="cityName" placeholder="City Name" required />
											
											<input type="hidden" name="cityId" id="cityId" value="0" />
											<br><font color="red"><form:errors path="cityId" cssClass="error" /></font>
										</td> 
									</tr>
									<tr>
										<th style="width: 100px;">Address</th>
										<td> <textarea rows="3" cols="47" name="address"></textarea></td>
									</tr>
									<tr>
										<th style="width: 100px;">Locality</th>
										<td><input type="text" style="height:40px;width:350px; margin: 2px;" name="locality" id="locality" /></td>
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
											<div class="select" style="width: 120px;">
												<select name="starCategory">
													<option value="2" class="service-small">2 Star</option>
													<option value="3" class="service-small" selected>3 Star</option>
													<option value="4" class="service-small">4 Star</option>
													<option value="5" class="service-small">5 Star</option>
											
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<th style="width: 150px;">Hotel Rating</th>
										<td style="width: 150px;">
											<div class="select" style="width: 120px;">
												<select name="udnServiceRating">
													<option value="2" class="service-small">2 Star</option>
													<option value="3" class="service-small" selected>3 Star</option>
													<option value="4" class="service-small">4 Star</option>
													<option value="5" class="service-small">5 Star</option>
											
												</select>
											</div>
										</td>
									</tr>
									<tr>
										<th style="width: 150px;">Is Preferred</th>
										<td style="width: 150px;">
											<div class="select" style="width: 120px;">
												<select name="preferred">
													<option value="false" class="service-small">No</option>
													<option value="true" class="service-small" selected>Yes</option>
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
										<tr><td colspan="2"> <textarea rows="5" cols="47" name="remarks"></textarea></td></tr>
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
										<td><input type="number" style="height:40px;width:250px; margin: 2px;" name="phone" id="phone" value="0" pattern="[0-9.]+" /></td>
									</tr>
									<tr>
										<th style="width: 150px;">Hotel Email</th>
										<td><input type="text" style="height:40px;width:250px; margin: 2px;" name="email" id="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" /></td>
									</tr>
									
								</tbody>
							</table>
						</td>
					</tr>
					
					<tr>
						<td colspan="2"><input type="submit" value="Add Hotel" style="width: 550px;" /></td>
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
