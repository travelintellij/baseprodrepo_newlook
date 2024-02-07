<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

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

<body>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<h2 align="center">Add City</h2>
	<form:form method="post" action="edit_edit_city" modelAttribute="CITY_OBJ">
		<form:hidden path = "countryName" id="countryName" />
		<form:hidden path = "destinationId" />
			<table>
				<tr>
					<th>Destination Id</th>
					<td>${CITY_OBJ.destinationId}
				</td>
				</tr>


				<tr>
					<th>City Name</th>
					<td><form:input path="cityName" name="cityName" style="height:30px;width:250px;margin: auto;" required="required"/>
					<font color="red"><form:errors path="cityName" cssClass="error" /></font>
				</td>
				</tr>
			
				<tr>
					<th>Country Name</th>
					<td>
					<div class="select">
						<form:select path="countryCode" style="height:30px;width: 150px;" required="required" id="countryCode">  
							<c:forEach items="${ACTIVE_CTRYCODE_CTRYNAME_LIST}" var="destinationObj">
								<c:if test="${destinationObj.countryCode eq CITY_OBJ.countryCode }">
									<option class="service-small" value="${destinationObj.countryCode}" selected>${destinationObj.countryName}</option>
								</c:if>
								<c:if test="${destinationObj.countryCode ne CITY_OBJ.countryCode }">
									<option class="service-small" value="${destinationObj.countryCode}">${destinationObj.countryName}</option>
								</c:if>
							</c:forEach>
						</form:select>  
				</div>
					<font color="red"><form:errors path="countryCode" cssClass="error" /></font>
					 </td>
				</tr>
				<tr>
				<th>Active</th>
				<td>
					<div class="select">
						<form:select path="active" style="height:30px;width: 150px;" required="required" >  
								<c:if test="${CITY_OBJ.active eq true }">
									<option class="service-small" value="true" selected>Active</option>
									<option class="service-small" value="false">In-Active</option>
								</c:if>
								<c:if test="${CITY_OBJ.active eq false }">
									<option class="service-small" value="true" >Active</option>
									<option class="service-small" value="false" selected>In-Active</option>

								</c:if>
								
						</form:select>
					</div>
				
				</td>
				</tr>


				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" value="Update City">
						<a href="view_search_city_form"><input type="button" value="View City List" style="background-color:blue;" /></a>	
					</td>
				</tr>
			</table>

	</form:form>
	<script>

		$('#countryCode').on('change', function() {
		  //alert( $( "#countryCode option:selected" ).text() );
			var countryName = $( "#countryCode option:selected" ).text() 
			$("#countryName").val(countryName);
		});
	</script>
</body>
</html>

