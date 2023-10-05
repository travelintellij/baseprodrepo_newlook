<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.jquery-ui.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<head>
	<title>UdanChoo Team Workload Section</title>
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="${pageContext.request.contextPath}/resources/css/tooplate_style.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/coda-slider.css" type="text/css" charset="utf-8" />
</head>

<style>
table {
  width: 100%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
}

th {
  background: #dac400;
  height: 40px;
  width: 10%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
}

th, td {
  padding: 10px;
}
tr {
  border-bottom: 1px solid #cccccc;
  
}
tr:hover {background-color:#f5f5f5;}
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
select {
	appearance: none;
	outline: 0;
	background: lightblue;
	background-image: none;
	width: 100%;
	height: 100%;
	color: black;
	cursor: pointer;
	border: 1px solid black;
	border-radius: 3px;
	text-indent: 2px;
}

.select {
	position: relative;
	display: block;
	height: 2.5em;
	line-height: 3;
	overflow: hidden;
	border-radius: .25em;
	padding-bottom: 10px;
	padding-top: 10px;
}

.select option.service-small {
	font-size: 20px;
	padding: 25px;
	background: lightgreen;
}
</style>
<jsp:include page="../_Workload_Menu.jsp" />


<br>
<h2 align="center">
	Sight Seeing Search Result
</h2>
<hr>
	<body style="background-color: white;">
		<table border="1" align="center" id="hotel-sl" style="border:none;margin: 5px auto;width:85%;">
		
		<tr>
			<th  style="width:15%">City Name</th>
			<th  style="width:10%">Sight Seeing ID </th>
			<th  style="width:30%">Sight Seeing Name</th>
			<th  style="width:10%">Duration</th>
			<th  style="width:15%">Tour Rating</th>
			<th  style="width:15%">Action</th>
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

					<td style="background-color: white;">
						<table style="border:none;margin-left: auto; margin-right: auto;">
							<tr>
								<form:form method="post" action="view_view_wl_sight_seeing_details" style="display:inline;" >	
								<td style="text-align: center;">
									<input type="submit" name="View" Value="View" style="background-color: green; padding: 6px 12px;" />
									<input type="hidden" name="sightSeeingId" value="${sightSeeingObj.sightSeeingId}"/>
									<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
								</td>
								</form:form>
								
								<form:form modelAttribute="STS_SL_OBJ" action="view_add_wl_sight_seeing_itenerary">
									<input type="hidden" name="sightSeeingId" value="${sightSeeingObj.sightSeeingId}" />
									<input type="hidden" name="sightSeeingName" value="${sightSeeingObj.sightSeeingName}" />
									<input type="hidden" name="cityId" value="${sightSeeingObj.cityId}" />
									<input type="hidden" name="cityName" value="${sightSeeingObj.cityName}" />
									<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
									<input type="hidden" name="savedSightSeeing" value="true" />
																
									<td style="text-align: center;">
										<input type="submit" name="AddItenary" Value="Add to Itenary" style="background-color: green; padding: 6px 12px;" />
									</td>
								</form:form>
								
								
							</tr>
						</table>

					</td>
				</tr>
			</c:forEach>
		</c:if>
		<tr>
		<td colspan="5">&nbsp;</td>

		<td style="width:10%">
			
			<a href="view_search_sightseeing_master?dealConfirmationId=${dealConfirmationId}" ><input type="button" style="width: 150px;background-color: blue;" value="Search Again!"></a>
		</td></tr>
	</table>
</div>
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
