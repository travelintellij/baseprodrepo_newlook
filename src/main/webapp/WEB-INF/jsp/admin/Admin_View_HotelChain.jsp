<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<jsp:include page="../menu/MenuBuilder.jsp" />

<style>
table {
	margin: 5px 0 30px 0;
}

table tr th, table tr td {
	background: #3B3B3B;
	color: #FFF;
	padding: 5px 2px;
	text-align: left;
	
}

table tr td {
	background: #E5E5DB;
	color: #47433F;
	border-top: 1px solid #FFF;
	align: left;
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
<h3>
	Welcome Administrator <font color="red" size="5"> ${userName} </font>
</h3>
<div class="main-block">
	<body style="background-color: creamwhite;">
	<form:form method="post" action="view_edit_hotel_chain_form"	modelAttribute="hotelchain_obj">
		<input type="hidden" name="hotelChainId" value="${HotelChainObj.hotelChainId}" />
		<div id="table">
			<table style="width:100%;"cellspacing="30px">
				<caption>
					<h2>View Hotel Chain</h2>
				</caption>
				<tr>
					<th>Hotel Chain Id</th>
					<td>${HotelChainObj.hotelChainId}
				</td>
				</tr>

				<tr>
					<th>Hotel Chain Name</th>
					<td>${HotelChainObj.hotelChainName}
				</td>
				</tr>
				<tr>
					<th>Remarks</th>
					<td>${HotelChainObj.remarks}</td>
				</tr>
				<tr>
					<th>Active</th>
					<td>
						${HotelChainObj.active eq true }
					 </td>
				</tr>
				<tr>
					<td colspan="2"><center><input type="submit" value="Edit"></center></td>
				</tr>
			</table>
			</div>
	</form:form>
</div>
</body>
