<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<jsp:include page="../../menu/MenuBuilder.jsp" />

<div class="content">
	
		<h2 align="center"><br>Search Hotel </h2>
	

	<form:form modelAttribute="searchhotel_obj" action="search_search_hotel">

	<table cellpadding="7px" border="1px" rules="none" frame="border" align="center">
					<caption> Search Criteria </caption>
		<tr>
			<td>
				<label id="icon" for="CityName"><i class="fas fa-envelope"></i></label> 
				<input type="text" name="cityName" id="cityName" placeholder="City Name" />
				<input type="hidden" name="cityId" value="0" />
			</td>
			<td>
				<div class="select" style="margin: 2px; height: 40px; width: 320px;">
					<select name="hotelChainId">
						<option class="service-small" value="0" selected>-------------Select Hotel Chain-------------</option>
						<c:if test="${not empty HotelChainObjList}">
		       				<c:forEach items="${HotelChainObjList}" var="hotelChainObj">
		      					<option class="service-small" value="${hotelChainObj.hotelChainId}" align="center">${hotelChainObj.hotelChainName}</option>
		   					</c:forEach>
		 				</c:if>
		 			</select>
				</div>
			</td>
			<td>
				<label id="icon" for="localityName"><i class="fas fa-envelope"></i></label> 
				<input type="text" name="locality" id="locality" placeholder="locality like" />
			</td>
			<td style="width: 150px;">
				<div class="select" style="width: 150px;">
					<select name="searchPrefer">
						<option value="0" class="service-small" selected>Select Preferred</option>
						<option value="1" class="service-small" >Yes</option>
						<option value="2" class="service-small">No</option>
					</select>
				</div>
			</td>
		</tr>
		<tr>
		<td colspan="2">
			<label id="icon" for="hotelName"><i class="fas fa-envelope"></i></label> 
			<input style="width: 350px;" type="text" name="hotelName" id="hotelName" placeholder="Hotel Name" />
		
		</td>
		<td>
			<label id="icon" for="hotelId"><i class="fas fa-envelope"></i></label> 
			<input style="width: 150px;" type="text" name="hotelId" id="hotelId" placeholder="Hotel Id" pattern="[0-9.]+" />
		</td>
		<td>
			<div class="select" style="width: 150px;">
			<select name="active">
						<option value="true" class="service-small" selected>Select Active</option>
						<option value="true" class="service-small" >Active</option>
						<option value="false" class="service-small">In-Active</option>
					</select>
			</div>
		</td>
		<tr>
		<td>
			<div class="select" style="width: 180px;">
				<select name="starCategory">
					<option value="0" class="service-small" selected>Hotel Star Category</option>
					<option value="2" class="service-small">2 Star</option>
					<option value="3" class="service-small">3 Star</option>
					<option value="4" class="service-small">4 Star</option>
					<option value="5" class="service-small">5 Star</option>
				</select>
			</div>
		</td>	
		<td style="width: 150px;">
			<div class="select" style="width: 180px;">
				<select name="udnServiceRating">
					<option value="0" class="service-small" selected>Select Hotel Rating</option>
					<option value="2" class="service-small">2 Star</option>
					<option value="3" class="service-small">3 Star</option>
					<option value="4" class="service-small">4 Star</option>
					<option value="5" class="service-small">5 Star</option>
			
				</select>
			</div>
		</td>

		<td colspan="2">
			<button type="submit">Search Hotel</button></td>
		</tr>
	</table>
			

<!-- 
	<table align="center">
	<tr>
	<td>



		<table cellpadding="7px" border="1px" rules="none" frame="border" align="center">
			<tr><td>
					Search Criteria
					<div class="select" style="width: 350px;">
						<select name="inputSearch">
							<option value="based_on_chain_no" class="service-small">Hotel Id</option>
							<option value="based_on_chain_no" class="service-small">Hotel Chain Name</option>
							<option value="based_on_chain_name" class="service-small">Hotel Name</option>
							<option value="based_on_chain_name" class="service-small">Locality Name</option>
						</select>
					</div>
					</td>
				</tr>
			<tr>
					<td><label id="icon" for="Deal Number"><i class="fas fa-envelope"></i></label> 
						<input type="text" name="hotelChainId" id="hotelChainId" placeholder="Chain Number" size="15" pattern="[0-9.]+" /> 
								
					</td>
					</tr>
					<tr><td>
						<label id="icon" for="Deal Number"><i class="fas fa-envelope"></i></label> 
						<input type="text" name="hotelChainName" id="hotelChainName" placeholder="Hotel Chain Name" size="15" /> 
						
						</td>
						</tr>
						</tr>
					<tr><td>
						<button type="submit">Search</button>
						</td>
						</tr>
						</table>
	</td>
	<td>Or
	</td>
	<td></td>
	</tr>
	</table>
		-->		
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

	
 
 </div> <!-- End of Main Block -->
  <%--  <jsp:include page="_Workloadfooter.jsp" /> --%>
  
  </html>
  