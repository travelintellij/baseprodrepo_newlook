<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
  background: #FF5733;
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
  padding: 10px 20px;
  text-decoration: none;
  margin: 4px 2px;
  cursor: pointer;
}

</style>

<br>
<center>
		<h2>
			View Visa Consulate
		</h2>
	</center>
	
<body>
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
	<form:form method="post" action="view_edit_visa_consulate_form" modelAttribute="VISA_CONSULATE_OBJ">
		
		<input type="hidden" name="consulateId" value="${VISA_CONSULATE_OBJ.consulateId}" />
		
		<table style="width:80%; border:1px;border-collapse: collapse;text-align:center;">
			<tr>
			<th style="width:10%;">Visa Country Name (Embassy) </th>
			 <td style="width:10%; padding-bottom: 5px;">
				${VISA_CONSULATE_OBJ.countryName}
			</td>
			<th style="width:10%;">Consulate Title</th>
			<td style="width:20%;">
				${VISA_CONSULATE_OBJ.consulateTitle}
				
			</td>
			<th style="width:10%;">Consulate City</th>
			<td style="width:10%;">
				${VISA_CONSULATE_OBJ.cityName}
			</td>
			<tr>
				<th style="width:10%;" colspan="2">Address</th>
				<th>Email</th>
				<td>${VISA_CONSULATE_OBJ.email}</td>
				<th>Website</th><td>${VISA_CONSULATE_OBJ.website}</td>
			</tr>
			<tr>
			<td colspan="2">
				${VISA_CONSULATE_OBJ.address}
			</td>
			<th>Telephone</th><td>${VISA_CONSULATE_OBJ.telephone}</td>
				<th>Fax</th><td>${VISA_CONSULATE_OBJ.fax}</td>
			</tr>
			
			<tr>
				<td colspan="8">
					<input type="submit" name="submit" value="Edit Consulate" />
					<a href="view_search_visa_consulate_form" ><input type="button" style="background-color:blue;" value="Search Visa Consulate" /></a>		
				</td>
			</tr>
			</table>
	</form:form>
</body>
