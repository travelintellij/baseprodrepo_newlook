<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<jsp:include page="../../menu/MenuBuilder.jsp" />


<style>
li {
  text-align: left;
}
table {
  border-collapse: separate;
  border-spacing: 0;
}
th,
td {
  padding: 10px 15px;
 text-align: center;
}
thead {
  background: #395870;
  color: #fff;
}
th {
  font-weight: bold;
  border:1px solid white;
}
tbody tr:nth-child(even) {
  background: #f0f0f2;
}
td {
  border-bottom: 1px solid #cecfd5;
  border-right: 1px solid #cecfd5;
}
td:first-child {
  border-left: 1px solid #cecfd5;
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
<h2 align="center">
		View Hotel
	</h2>

	
	

<body>
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
<table class="table" style="border:1px solid white;margin-left:auto;margin-right:auto; width: 80%;" >
  <thead class="thead-dark">
    <tr>
      <th scope="col">Hotel Id</th>
      <th scope="col">Hotel Chain Name</th>
      <th scope="col" width="40%">Hotel Name</th>
      <th scope="col" width="15%">City</th>
      <th scope="col" width="15%">Locality</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">${hotelMasterObj.hotelId}</th>
      <td>${hotelMasterObj.hotelChainName} </td>
      <td width="30%">${hotelMasterObj.hotelName}</td>
      <td>${hotelMasterObj.cityName}</td>
      <td>${hotelMasterObj.locality}</td>
    </tr>
 <tr>
 <td colspan="2">
 	<table class="table" style="border:1px solid white;margin-left:auto;margin-right:auto;width: 100%; " >
 	 <thead class="thead-dark">
 	<tr>
 		<th scope="col" width="40%">Room Category</th>
 		<th scope="col" width="10%">Active</th>
 	</tr>
 	</thead>
 	<tr>
 		<td scope="col" width="40%">
 			<c:forEach items="${hotelMasterObj.roomCategoryEntityList}" var="roomCategory">
 				
 				<li>${roomCategory.roomCategoryName}</li>
 			
 			</c:forEach>
 			<br>
 			
 		
 		</td>
 		<td scope="col" width="10%">${hotelMasterObj.active}</td>
 	</tr>
 	</table>
 </td>
 <td>
 	<table class="table" style="border:1px solid white;margin-left:auto;margin-right:auto;width: 100%; " >
 	 <thead class="thead-dark">
 	<tr>
 		<th scope="col" width="15%">Hotel Category</th>
 		<th scope="col" width="10%">Is Preferred</th>
 		<th scope="col" width="15%">Hotel Rating</th>
 		
 	</tr>
 	</thead>
 	<tr>
 		<td scope="col">${hotelMasterObj.starCategory} Star</td>
 		<td scope="col" width="10%">${hotelMasterObj.preferred}</td>
 		<td scope="col">${hotelMasterObj.udnServiceRating} Star</td>
 	</tr>
 	</table>
 </td>
 <td colspan="2">
 	<table class="table" style="border:1px solid white;margin-left:auto;margin-right:auto;width: 100%; " >
 	 <thead class="thead-dark">
 	<tr>
 		
 		<th scope="col" width="25%">Address</th>
 	</tr>
 	</thead>
 	<tr>
 		
 		<td scope="col" width="25%">${hotelMasterObj.address}</td>
 	</tr>
 	</table>
 </td>
 <tr>
 <td colspan="3">
	 	<table class="table" style="border:1px solid white;margin-left:auto;margin-right:auto;width: 100%; " >
	 	 <thead class="thead-dark">
	 	<tr>
	 		<th scope="col">Remarks</th>
	 	</tr>
	 	</thead>
	 	<tr>
	 		<td scope="col">${hotelMasterObj.remarks} </td>
	 		
	 	</tr>
	 	</table>
	</td>
	<td colspan="2">
 		<table class="table" style="border:1px solid white;margin-left:auto;margin-right:auto;width: 100%; " >
	 	 <thead class="thead-dark">
	 	<tr>
	 		<th scope="col">Phone</th>
	 		<th scope="col">Email</th>
	 	</tr>
	 	</thead>
	 	<tr>
	 		<td scope="col">${hotelMasterObj.phone} </td>
	 		<td scope="col">${hotelMasterObj.email} </td>
		</tr>
	 	</table>
	 </td>
	 </tr>	
	 <tr>
	 <td colspan="5" style="border:1px solid white;margin-left:auto;margin-right:auto;width: 100%; ">
	 		<sec:authorize access="hasAnyRole('ADMIN','HOTEL_EDIT')">
		 		<form:form method="post" action="view_edit_hotel_form?hotelId=${hotelMasterObj.hotelId}" modelAttribute="hotel_obj" style="display:inline;">
		 			<input type="submit" value="Edit Hotel" style="background-color:green;"  />
		 		</form:form>
		 	</sec:authorize>	 
	 		<a href="view_search_hotel_form"><input type="button" style="width: 140px;background-color: blue;" value="Search Hotel"></a></td>
	 		 
	 </td>

	 </tr>
  </tbody>
</table>

</body>
