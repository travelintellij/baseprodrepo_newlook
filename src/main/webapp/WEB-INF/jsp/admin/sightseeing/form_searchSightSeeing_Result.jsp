<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>


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
  background: #D33F14;
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
<body>
	<br>
	<br>
<br>
<br>
<br>
<br>
<br>
<br>
	<form:form modelAttribute="search_sight_seeing_obj" action="search_search_sight_seeing">
		<table style="text-align:center">
				<tr>
					<td style="width:2%;height:30px"><img src="${pageContext.request.contextPath}/resources/images/filter.jpg" height="50" width="50"/></td>
					<th style="width: 5%;">City</th>
					<td style="width: 15%;">
						<input type="text" name="cityName"  placeholder="City Name"  id="cityName" value="${sight_seeing_search_result.cityName}" />
						<input type="hidden" name="cityId" value="${sight_seeing_search_result.cityId}" />
					</td>
					<th style="width: 10%;">SightSeeing Name</th>
					<td style="width: 15%;"><input type="text" name="sightSeeingName" id="sightSeeingName" placeholder="Sight Seeing Name" value="${sight_seeing_search_result.sightSeeingName}" /></td>
					
					<th style="width: 10%;">Duration (Min/Max)</th>
					<td style="width: 5%;">
						<input type="text" style="width: 50px;" name="minDuration" id="minDuration" value="${sight_seeing_search_result.minDuration}"  /><br>
					</td>
					<td style="width: 5%;"><input type="text" style="width: 50px;" name="maxDuration" id="maxDuration" value="${sight_seeing_search_result.maxDuration}" /></td>
					<th style="width: 10%;">Tour Rating</th>
					<td style="width: 7%;">
						<div class="select" style="width:100px;">
							<select name="tourRating">
								<option value="0" class="service-small" selected>Tour Rating</option>
								<c:forEach var="i" begin="2" end="5">
									<c:if test="${i eq sight_seeing_search_result.tourRating}">
										<option value="${i}" class="service-small" selected>>= ${i}
											Star</option>
									</c:if>
									<c:if test="${i ne sight_seeing_search_result.tourRating}">
										<option value="${i}" class="service-small">>= ${i}Star</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
					</td>
					<td colspan="2" style="width: 20%;"><input type="submit" value="Apply" style="display:inline;float:left">
					
					<a href="view_search_sight_seeing_form"><input type="button" value="Search Again" style="background-color:blue;display:inline;float:left"></a></td>
				</tr>

			</table>
	<input type="hidden" name="sightSeeingId" value="${sight_seeing_search_result.sightSeeingId}" />
	<input type="hidden" name="active" value="${sight_seeing_search_result.active}" />
	
</form:form>
	
	<table style="width:85%;border:1;table-layout:fixed;" >
		<caption>Search Result</caption>
		<tr>
			<th  style="width:15%">City Name</th>
			<th  style="width:10%">Sight Seeing ID </th>
			<th  style="width:30%">Sight Seeing Name</th>
			<th  style="width:10%">Duration</th>
			<th  style="width:15%">Tour Rating</th>
			<th  style="width:20%">Action</th>
		</tr>
		<c:if test="${not empty STS_SEARCH_RESULT}">
			<c:forEach var="sightSeeingObj" items="${STS_SEARCH_RESULT}">
				<tr>
					<td style="text-align: center;">
						${sightSeeingObj.cityName}
					</td>
					<td>
						${sightSeeingObj.sightSeeingId}
					</td>
					<td style="text-align: center;">
						${sightSeeingObj.sightSeeingName}
					</td>
					<td style="text-align: center;">
						${sightSeeingObj.duration} Minutes
					</td>
					<td style="text-align: center;">
						<c:forEach var="i" begin="1" end="${sightSeeingObj.tourRating}">
							<img src="${pageContext.request.contextPath}/resources/images/star.jpg" height="20" width="20" />
						</c:forEach>
					</td>

					<td style="background-color: white;width:20%;vertical-align: middle;">
						<table>
							<tr>
							<td>
								<sec:authorize access="hasAnyRole('ADMIN','SIGHT_SEEING_VIEW','SIGHT_SEEING_CREATE','SIGHT_SEEING_EDIT','SIGHT_SEEING_DELETE')">
									<form:form method="post" action="view_view_sight_seeing_details" style="display:inline;" >	
										<!-- 
										<input  type="image" src="${pageContext.request.contextPath}/resources/images/view.jpg" height="15" width="15" />
										-->
										<input type="submit" value="View" style="float:left;"  />
										<input type="hidden" name="sightSeeingId" value="${sightSeeingObj.sightSeeingId}"/>
									</form:form>
								</sec:authorize>
							</td>
							<td>
								<sec:authorize access="hasAnyRole('ADMIN','SIGHT_SEEING_EDIT')">								
									<form:form method="post" action="view_edit_sight_seeing_form" style="display:inline;" >								
											<!-- 
											<input  type="image" src="${pageContext.request.contextPath}/resources/images/edit.jpg" height="15" width="15" />
											-->
											<input type="submit" value="Edit" style="background-color:blue;float:left;display:inline;"  />
											
											<input type="hidden" name="sightSeeingId" value="${sightSeeingObj.sightSeeingId}"/>
									</form:form>
								</sec:authorize>
								<sec:authorize access="! hasAnyRole('ADMIN','SIGHT_SEEING_EDIT')">								
									<form:form method="post" action="view_edit_sight_seeing_form" style="display:inline;" >								
											<input type="submit" value="Edit" style="background-color:#dddddd;float:left;display:inline;"  disabled/>
											<input type="hidden" name="sightSeeingId" value="${sightSeeingObj.sightSeeingId}"/>
									</form:form>
								</sec:authorize>
							</td>
							<td>
								<sec:authorize access="hasAnyRole('ADMIN','SIGHT_SEEING_DELETE')">
									<form:form method="post" action="view_delete_confirmation_sight_seeing" style="display:inline;" >
										<input type="hidden" name="sightSeeingId" value="${sightSeeingObj.sightSeeingId}"/>
										<input type="submit" value="Delete" style="background-color:red;float:left;display:inline;"  />
									</form:form>
								</sec:authorize>
								
								<sec:authorize access="! hasAnyRole('ADMIN','SIGHT_SEEING_DELETE')">
									<form:form method="post" action="view_delete_confirmation_sight_seeing" style="display:inline;" >
										<input type="hidden" name="sightSeeingId" value="${sightSeeingObj.sightSeeingId}"/>
										<input type="submit" value="Delete" style="background-color:#dddddd;float:left;display:inline;"  disabled/>
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


</html>
