<jsp:include page="../../menu/MenuBuilder.jsp" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>




<style>
table {
  width: 75%;
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
<br>
<br>
<br>
<br>
<br>
<h2 align="center">Search Sight Seeing</h2>


	<form:form modelAttribute="search_sight_seeing_obj" action="search_search_sight_seeing">
	<table>
		<caption> Search Criteria </caption>
		<tr >
			
			<td align="center">
				<input type="color" id="CityName" name="CityName" value="#008000"><i class="fas fa-envelope" ></i></label> 
				<input type="text" style="width: 200px;" name="cityName" id="cityName" placeholder="City Name" required/>
				<input type="hidden" name="cityId" value="0" />
			</td>
			<td align="left">
				<input type="color" id="sightSeeingName" value="#008000"><i class="fas fa-envelope"></i></label> 
				<input style="width: 300px;" type="text" name="sightSeeingName" id="sightSeeingName" placeholder="Sight Seeing Name" />
			</td>
			<td align="center">
				<input type="color" id="minDuration" value="#008000"><i class="fas fa-envelope"></i></label> 
				<input type="text" style="width: 150px;" name="minDuration" id="minDuration" placeholder="Min Duration (Minutes)" />
			</td>
			<td align="center">
				<input type="color" id="maxDuration"  value="#008000"><i class="fas fa-envelope"></i> 
				<input type="text" style="width: 150px;" name="maxDuration" id="maxDuration" placeholder="Max Duration (Minutes)" />
			</td>
		</tr>
		<tr>
			<td style="align-text:center;">
			<div class="select" style="margin: 0 auto;" >
				<select name="tourRating" style="background-color: #9ACD32;">
					<option value="0" class="service-small" selected>Select Tour Rating</option>
					<option value="2" class="service-small"> > 2 Star</option>
					<option value="3" class="service-small">> 3 Star</option>
					<option value="4" class="service-small">> 4 Star</option>
					<option value="5" class="service-small">5 Star</option>
				</select>
			</div>
		
		</td>
		<td >
			<input type="color" id="sightSeeingId" value="#008000"><i class="fas fa-envelope"></i>
				<input style="width: 150px;" type="text" name="sightSeeingId" id="sightSeeingId" placeholder="Sight Seeing Id" pattern="[0-9.]+" />
		</td>
		<td>
			<div class="select" style="margin: 0 auto;">
				<select name="active" style="background-color: #9ACD32;">
					<option value="true" class="service-small" selected>Select Active</option>
					<option value="true" class="service-small" >Active</option>
					<option value="false" class="service-small">In-Active</option>
				</select>
			</div>
		</td>
		
		<td align="center" colspan="2">
			<button style="background-color: green;" type="submit">Search </button></td>
		</tr>
		
	</table>
			
	
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
	
  </html>
  