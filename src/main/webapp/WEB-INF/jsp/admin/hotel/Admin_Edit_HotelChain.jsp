<!DOCTYPE html>
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
<style>
table {
	  width: 40%;
	  border-collapse: collapse;
	  border: 1px solid #38678f;
	  margin: 5px auto;
	  background: white;
	}
	
	th {
	  background: steelblue;
//	  height: 40px;
	  width: 30%;
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
	</style>
</head>
<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
<br>
<h2 align="center"> Edit Hotel Chain(Id: ${HotelChainObj.hotelChainId})</h2>

	<body style="background-color: creamwhite;">
	<form:form method="post" action="add_add_hotel_chain"	modelAttribute="hotelchain_obj">
		<input type="hidden" name="hotelChainId" value="${HotelChainObj.hotelChainId}" />
		<table >
				<tr>
					<th>Hotel Chain Name</th>
					<td style="text-align:left;"><input type="text" name="hotelChainName" value="${HotelChainObj.hotelChainName}" />
				</td>
				</tr>
				<tr>
					<th>Remarks</th>
					<td style="text-align:left;"><textarea rows="3" cols="50" name="remarks"	maxlength="250">${HotelChainObj.remarks}</textarea> </td>
				</tr>
				<tr>
					<th>Active</th>
					<td style="text-align:left;">
						<div class="select">
					 	<select id = "active" name="active" style="width: 150px;" required>
							<c:if test="${HotelChainObj.active eq true }">
										<option class="service-small" value="true" selected>Active</option>
										<option class="service-small" value="false" >In- Active</option>
							</c:if>
							<c:if test="${HotelChainObj.active ne true }">
								<option class="service-small" value="false" selected>In-Active</option>
								<option class="service-small" value="true">Active</option>
							</c:if>
						</select>
						</div>
					 </td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Update Hotel Chain">
					<a href="view_search_hotel_chain_form"><input type="button" style="width: 140px;background-color: blue;" value="Cancel"></a></td>
				</tr>
			</table>
	</form:form>

</body>
