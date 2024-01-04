<!DOCTYPE html>
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
<head>

<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<style>
table {
	  width: 40%;
	  border-collapse: collapse;
	  border: 1px solid #38678f;
	  margin: 5px auto;
	  background: white;
	}
	
	th {
	  background: #FFCC00;
	  width: 40%;
	  font-weight: heavy;
	  text-shadow: 0 1px 0 #38678f;
	  color: black;
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
	input[type="radio"] {
		display: inline-block;
		opacity: 1;
		width: 1em;
		z-index: -1;
	}

select {
	appearance: none;
	outline: 0;
	background: lightblue;
	background-image: none;
	width: 80%;
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


input[type=button], input[type=submit], input[type=reset] {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 16px 32px;
	text-decoration: none;
	margin: 4px 2px;
	cursor: pointer;
}

.warning {
    border: 10px ridge #f00;
    background-color: #ff0;
    padding: .3rem;
    display: block;
    flex-direction: column;
}
ul li span {
        display: block;
        margin-left: -0.5em;
        color: #000;
      }
	</style>
</head>



<br>
<br>
<br>
<br>
<br>
<br>
<br>
<h2 align="center">
	<input type="image" src="${pageContext.request.contextPath}/resources/images/warning.jpg" height="50" width="50"/> Delete Hotel Chain
</h2>
<p align="center">
	<font color="red">Hotel Chain can only be deleted if there is no participating hotel in the chain. Kindly ensure before deleting.</font>
</p>
<hr>
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>

	<body style="background-color: creamwhite;">
	<form:form method="post" action="delete_delete_hotel_chain"	modelAttribute="hotelchain_obj">
		<input type="hidden" name="hotelChainId" value="${HotelChainObj.hotelChainId}" />
			<table>
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
					<td colspan="2">
						<input type="submit" style="background-color:red;"value="CONFIRM DELETE">
						<a href="view_search_hotel_chain_form"><input type="button" style="width: 140px;background-color: blue;" value="Cancel"></a>
					</td>
				</tr>
			</table>
	</form:form>

</body>
