<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
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
	<h2 align="center">Add New Hotel Chain</h2>
	<form:form method="post" action="add_add_hotel_chain"	modelAttribute="hotelchain_obj">

			<table>
				<tr>
					<th>Hotel Chain Name</th>
					<td><input class="contact" type="text" name="hotelChainName" value="" />
				</td>
				</tr>
			
				<tr>
					<th>Remarks</th>
					<td><textarea rows="3" cols="50" name="remarks"	maxlength="250"></textarea> </td>
				</tr>

				<tr>
					<td colspan="2" style="text-align: center;">
						<input type="submit" value="Add Hotel Chain">
						<a href="view_search_hotel_chain_form"><input type="button" value="View Hotel Chains" style="background-color:blue;" /></a>	
					</td>
				</tr>
			</table>

	</form:form>
</body>
</html>

