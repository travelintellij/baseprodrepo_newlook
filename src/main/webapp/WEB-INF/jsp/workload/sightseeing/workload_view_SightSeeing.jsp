<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<head>
<title>UdanChoo Team Workload Section</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="${pageContext.request.contextPath}/resources/css/tooplate_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet"	href="${pageContext.request.contextPath}/resources/css/coda-slider.css" type="text/css" charset="utf-8" />

</head>

<style>
th {
  background: #4CAF50;
  height: 40px;
  width: 10%;
  font-weight: heavy;
  text-shadow: 0 1px 0 #38678f;
  color: white;
  border: 1px solid #38678f;
  box-shadow: inset 0px 1px 2px #568ebd;
  transition: all 0.2s;
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
 select { 
	appearance: none; 
    outline: 0; 
    background: lightblue; 
    background-image: none; 
    width: 100%; 
    height: 100%; 
    color: black; 
    cursor: pointer; 
    border:1px solid black; 
    border-radius:3px; 
      text-indent: 2px;
} 
.select { 
    position: relative; 
    display: block; 
    height: 2.5em; 
    line-height: 3; 
    overflow: hidden; 
    border-radius: .25em; 
    padding-bottom:10px; 
   	padding-top: 10px;
	      
} 
.select option.service-small {
	font-size: 20px;
  	padding: 25px;
  	background: lightgreen;
}

.ui-autocomplete.ui-widget {
  font-family: Verdana,Arial,sans-serif;
  font-size: 30px;
}


#flight-sl {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#flight-sl td, #flight-sl th {
  border: 1px solid #ddd;
  padding: 8px;
}

#flight-sl tr:nth-child(even){background-color: #f2f2f2;}

#flight-sl tr:hover {background-color: #ddd;}

#flight-sl th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: center;
  background-color: #00bfff;
  color: white;
}
</style>
<jsp:include page="../_Workload_Menu.jsp" />
	<br><br>
	<h2 align="center">
		View Sight Seeing Details
	</h2>

	

<body style="background-color: white;">
<div align="center"><b><font color="green">${confirmation}</font></b></div>
<hr>
		<table border="1" style="table-layout:fixed; width:75%;" align="center"  id="flight-sl" >
			<tr>
				<th style="width: 15%;" align="center">City</th>
				<td style="width: 15%;" align="center">
					${sightSeeingMasterObj.cityName } 
					<input type="hidden" id="cityId" name="cityId" value="0"/>
				</td>
							
				<th style="width: 15%" align="center">Sight Seeing Name</th>
				<td style="width: 25%;" align="center">
					 ${sightSeeingMasterObj.sightSeeingName } 
				</td>
				<th style="width: 15%" align="center">Tour Duration</th>
				<td style="width: 15%" align="center">
						 ${sightSeeingMasterObj.duration }  Minutes
				</td>
				</tr>
				<tr>
				<th style="width: 15%;" align="center">Departure Point</th>
				<td style="width: 15%;" align="center">
					 ${sightSeeingMasterObj.departurePoint }  
				</td>
				<th style="width: 15%" align="center">Reporting Point</th>
				<td style="width: 15%;" align="center">
					 ${sightSeeingMasterObj.reportingPoint }  
				</td>
				
				<th sstyle="width: 15%;" align="center">Meals</th>
				<td style="width: 15%;" align="center">
					 ${sightSeeingMasterObj.meals }  
				</td>
				
				</tr>
				<tr>
				<th style="width:15%;" align="center">Pickup Time</th>
				<td style="width: 15%;" align="center">
					 ${sightSeeingMasterObj.standardPickupTime }  
				</td>
				
				<th style="width: 15%;" align="center">Drop Time</th>
				<td style="width: 15%;" align="center">
					 ${sightSeeingMasterObj.standardDropTime } 
				</td>
				
				<th style="width: 15%" align="center">Flexible Timing</th>
				<td style="width: 15%" align="center">
					 ${sightSeeingMasterObj.flexibleTimming }  
				</td>
				</tr>
				<tr>
					<th>Tour Rating</th>
					<td  style="align: left;">
					 	<c:forEach var="i" begin="1" end="${sightSeeingMasterObj.tourRating}">
							<img src="${pageContext.request.contextPath}/resources/images/star.jpg" height="20" width="20" />
						</c:forEach>
					</td>
					<th>Active</th>
					<td  style="align: left;" colspan="3"  >
						${sightSeeingMasterObj.active}
					</td>
				</tr>
				<tr>		
				<td colspan="6" align="center"> <font color="green"><b>Tour Description</b></font></td>
				</tr>
				<tr>		
				<td colspan="6">
						<p style="white-space: pre-line"> ${sightSeeingMasterObj.sightSeeingDescription } </p>
				</td>
				</tr>
				<tr >		
					<td colspan="3" align="center" style=" border: 1px solid black;"> <font color="green"><b>Useful Information</b></font></td>
					<td colspan="3" align="center" style=" border: 1px solid black;"> <font color="red"><b>Terms & Conditions</b></font></td>
				</tr>
				<tr>		
					<td colspan="3" style="width:50%; border: 1px solid black;">
							<p style="white-space: pre-line"> ${sightSeeingMasterObj.usefulInfo.trim() } </p>
					</td>
					<td colspan="3" style="width:50%; border: 1px solid black;">
							<p style="white-space: pre-line"> ${sightSeeingMasterObj.tnc.trim() }</p>
					</td>
					
				</tr>
		</table>
	
<div align="center">
	<table>
	<tr>
	<td>
		
		<form:form modelAttribute="STS_SL_OBJ" action="view_add_wl_sight_seeing_itenerary">
			<input type="hidden" name="sightSeeingId" value="${sightSeeingMasterObj.sightSeeingId}" />
			<input type="hidden" name="sightSeeingName" value="${sightSeeingMasterObj.sightSeeingName}" />
			<input type="hidden" name="cityId" value="${sightSeeingMasterObj.cityId}" />
			<input type="hidden" name="cityName" value="${sightSeeingMasterObj.cityName}" />
			<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
			<input type="submit" value="Add To Itenerary" />
		</form:form>
	</td>
	<td>
	<form:form modelAttribute="STS_SL_OBJ" action="view_search_sightseeing_master">
		<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
		<input type="submit" value="Search Again" style="background-color: #dac400; color: #0B0000;" />
	</form:form>
	</td>
	<td>
	
	<form:form modelAttribute="STS_SL_OBJ" action="view_workload_STS">
		<input type="hidden" name="dealConfirmationId" value="${dealConfirmationId}" />
		<input type="submit" value="Cancel" style="background-color: blue" />
	</form:form>
	</td>
	</tr>
	</table>
</div>

</body>


</html>

