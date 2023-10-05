<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<style>
table {
  width: 80%;
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
	background-color: green;
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}

</style>
<body style="background-color: white;">
	<br>
	<h2 align="center">
		Edit Sight Seeing Details
	</h2>
	<hr>
		<form:form modelAttribute="sightseeing_obj" action="add_add_sightseeing">
		<input type="hidden" name="sightSeeingId" value="${sightSeeingMasterObj.sightSeeingId}" />
		<table>
			<tr>
				<th style="width: 70px;" align="center">City</th>
				<td style="width: 135px;" align="center">
					<input style="width: 135px; border-color: lightblue !important;" type="text" id="cityName" name="cityName" value="${sightSeeingMasterObj.cityName}" required /> 
					<input type="hidden" id="cityId" name="cityId" value="${sightSeeingMasterObj.cityId}"/>
				</td>
							
				<th style="width: 175px;" align="center">Sight Seeing Name</th>
				<td style="width: 400px;" align="center">
					<input style="width: 300px; border-color: lightblue !important;" type="text" id="sightSeeingName" name="sightSeeingName" value="${sightSeeingMasterObj.sightSeeingName}" required /> 
				</td>
				<th style="width: 200px;" align="center">Tour Duration</th>
				<td style="width: 50px;" align="center">
					<input style="width: 80px; border-color: lightblue !important;" type="text" id="duration" name="duration" value="${sightSeeingMasterObj.duration}" required /> Minutes
				</td>
				</tr>
				<tr>
				<th style="width: 100px;" align="center">Departure Point</th>
				<td style="width: 135px;" align="center">
					<input style="width: 135px; border-color: lightblue !important;" type="text" id="departurePoint" name="departurePoint" value="${sightSeeingMasterObj.departurePoint}" required />
				</td>
				<th style="width: 100px;" align="center">Reporting Point</th>
				<td style="width: 135px;" align="center">
					<input style="width: 135px; border-color: lightblue !important;" type="text" id="reportingPoint" name="reportingPoint" value="${sightSeeingMasterObj.reportingPoint}" required />
				</td>
				
				<th style="width: 175px;" align="center">Meals</th>
				<td style="width: 75px;" align="center">
					<input style="width: 135px; border-color: lightblue !important;" type="text" id="meals" name="meals" value="${sightSeeingMasterObj.meals}"  required />
				</td>
				
				</tr>
				<tr>
				<th style="width: 90px;" align="center">Pickup Time</th>
				<td style="width: 100px;" align="center">
						<input style="width: 135px; border-color: lightblue !important;" type="text" id="standardPickupTime" name="standardPickupTime"  value="${sightSeeingMasterObj.standardPickupTime}" required />
				</td>
				
				<th style="width: 100px;" align="center">Drop Time</th>
				<td style="width: 80px;" align="center">
					<input style="width: 135px; border-color: lightblue !important;" type="text" id="standardDropTime" name="standardDropTime" value="${sightSeeingMasterObj.standardDropTime}" required />
				</td>
				
				<th style="width: 100px;" align="center">Flexible Timing</th>
				<td style="width: 150px;" align="center">
					<div class="select">
						<select id="flexibleTimming" name="flexibleTimming" style="width: 200px;" required>
						    <option value="" class="service-small" selected>Select</option>
							 <c:if test="${sightSeeingMasterObj.flexibleTimming eq true}">
							 	<option class="service-small" value="true" selected >Option Available</option>
							 	<option class="service-small" value="false">Not Available (Fixed)</option>
							 </c:if>
							 <c:if test="${sightSeeingMasterObj.flexibleTimming ne true}">
							 	<option class="service-small" value="true"  >Option Available</option>
							 	<option class="service-small" value="false" selected>Not Available (Fixed)</option>
							 </c:if>
							 	
							 
						</select>
					</div>
				</td>
				</tr>
				<tr>
					<th>Tour Rating</th>
					<td  style="align: left;" >
					<div class="select">
							<select name="tourRating">
								<option class="service-small" selected>Select	Tour Rating</option>
								<c:forEach var="i" begin="2" end="5">
									<c:if test="${i eq sightSeeingMasterObj.tourRating}">
										<option value="${i}" class="service-small" selected> ${i}
											Star</option>
									</c:if>
									<c:if test="${i ne sightSeeingMasterObj.tourRating}">
										<option value="${i}" class="service-small"> ${i}Star</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</td>
					<th>Active</th>
					<td  style="align: left;" colspan="3"  >
						<div class="select" style="width: 150px;">
						<select name="active">
								<option value="true" class="service-small" selected>Select Active</option>
								 <c:if test="${sightSeeingMasterObj.active eq true}">
							 		<option class="service-small" value="true" selected >Active</option>
							 		<option class="service-small" value="false">In-Active</option>
							 	</c:if>
							 	<c:if test="${sightSeeingMasterObj.active ne true}">
							 		<option class="service-small" value="true"  >Active</option>
							 		<option class="service-small" value="false" selected>In-Active</option>
							 	</c:if>							 	
							</select>
						</div>
					</td>
				</tr>
				<tr>		
				<td colspan="6" align="center"> <font color="green"><b>Tour Description</b></font></td>
				</tr>
				<tr>		
				<td colspan="6" align="center">
					<textarea style="width: 1000px; height: 300px;border: 2px solid green; border-radius: 4px;" rows="3" cols="1500" name="sightSeeingDescription" htmlEscape="false">
				${sightSeeingMasterObj.sightSeeingDescription}
					</textarea>
				</td>
				</tr>
				<tr>		
					<td colspan="3" align="center"> <font color="green"><b>Useful Information</b></font></td>
					<td colspan="3" align="center"> <font color="red"><b>Terms & Conditions</b></font></td>
				</tr>
				<tr>		
					<td colspan="3" align="center">
						<textarea style="width: 500px; height: 200px;border: 2px solid green;  border-radius: 4px;" rows="3" cols="1000" name="usefulInfo">
						${sightSeeingMasterObj.usefulInfo}
						</textarea>
					</td>
					<td colspan="3" align="center">
						<textarea style="width: 500px; height: 200px;border: 2px solid red; border-radius: 4px;" rows="3" cols="1000" name="tnc">
							${sightSeeingMasterObj.tnc}
						</textarea>
					</td>
					
				</tr>
				<tr><td colspan="6">&nbsp;</td></tr>
			<tr>
				<td align="center" colspan="6">
					<input type="Submit" value="Update SightSeeing" />
					<a href="view_view_sight_seeing_details?sightSeeingId=${sightSeeingMasterObj.sightSeeingId}" ><input type="button" style="background-color:blue;" value="Cancel" /></a>
					
				</td>
			
			</tr>
		</table>
	</form:form>
</body>

<script>
$('#cityName').autocomplete({
	serviceUrl : '${pageContext.request.contextPath}/getCityList',
	paramName : "cityName",
	delimiter : ",",
	onSelect : function(suggestion) {
		cityID = suggestion.data;
		id = cityID;
		jQuery("#cityId").val(cityID);
		$('input[name=departingFrom]').val(id);
		return false;
	},
	transformResult : function(response) {
		return {
			suggestions : $.map($.parseJSON(response), function(item) {
				return {
					value : item.cityName,
					data : item.destinationId
				};
			})

		};
	}
});




</script>

</html>

