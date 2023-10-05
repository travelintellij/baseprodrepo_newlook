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

.search-sec{
    padding: 2rem;
}
.search-slt{
    display: block;*
    width: 50%;
    font-size: 0.875rem;
    line-height: 1.5;
    color: #55595c;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    height: calc(3rem + 2px) !important;
    border-radius:0;
}
.wrn-btn{
    width: 50%;
    font-size: 16px;
    font-weight: 400;
    text-transform: capitalize;
    height: calc(3rem + 2px) !important;
    border-radius:0;
}
</style>
<jsp:include page="../_Workload_Menu.jsp" />
<br>
<h2 align="center">
	Sight Seeing WorkLoad Details
</h2>
<hr><br>
	<h2 align="center"> Search Criteria </h2>
	<body style="background-color: white;">
	
	
<!-- 	
	
    <div class="container" id="container">
        <form action="#" method="post" novalidate="novalidate">
            <div class="row">
                <div>
                    <div class="row">
                        <div>
                            <input type="text" style="width:20%;" class="form-control search-slt" name="cityName" id="cityName" placeholder="City">
                              <input class="form-control search-slt" type="text" name="sightSeeingName" id="sightSeeingName" placeholder="Sight Seeing Name" />
                        </div>
                        <div>
                         
                            <input type="text" class="form-control search-slt" placeholder="Enter Drop City">
                        </div>
                        <div>
                            <button type="button" class="btn btn-danger wrn-btn">Search</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
 -->
	

	<form:form modelAttribute="search_sight_seeing_obj" action="search_wl_sight_seeing_master">
	<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
	<table style="border:none;background-color: #dac400; margin: 5px auto;width:85%;">
					
		<tr>
			<td style="width:15%;" align="center" >
				<input style="width:100%;" class="form-control search-slt" type="text" name="cityName" id="cityName" placeholder="City Name" required />
				<input type="hidden" name="cityId" value="0" />
			</td>
			<td style="width:25%;" align="left">
				<input style="width: 100%;" class="form-control search-slt" type="text" name="sightSeeingName" id="sightSeeingName" placeholder="Sight Seeing Name" />
			</td>
			<td style="width:10%;" align="center">
				<input style="width: 100%;" class="form-control search-slt" type="text" name="sightSeeingId" id="sightSeeingId" placeholder="Sight Seeing Id" pattern="[0-9.]+" />
			</td>
			<td style="width:10%;" align="left">
				<div class="select">
					<select name="tourRating" style="background-color: #9ACD32;height:50px;width:100%;">
						<option value="0" class="service-medium" selected>Select Tour Rating</option>
						<option value="2" style="height:20px;">> 2 Star</option>
						<option value="3" class="service-small">> 3 Star</option>
						<option value="4" class="service-small">> 4 Star</option>
						<option value="5" class="service-small">5 Star</option>
					</select>
				</div>
			</td>
			<td style="width:15%;" align="left">
				<input style="width: 100%;height:50px; class="form-control search-slt" type="text" name="minDuration" id="minDuration" placeholder="Min Duration (Minutes)" pattern="[0-9.]+" />
			</td>
			<td style="width:15%;" align="left">
				<input style="width: 100%;height:50px; class="form-control search-slt" type="text" name="maxDuration" id="maxDuration" placeholder="Max Duration (Minutes)" pattern="[0-9.]+" />
			</td>
		</tr>
		<tr>
			<td align="center" colspan="6">
				<table style="width:100%">
				<tr>
					<td align="right">
						<button type="submit" class="btn btn-danger wrn-btn">Search</button>
					</td>
					<td>
						<a href="view_workload_STS?dealConfirmationId=${dealConfirmationId}"><button type="button" class="btn btn-danger wrn-btn">Cancel</button></a>
					</td>
					</tr>
				</table>
			</td>
	</table>
	</form:form>


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

