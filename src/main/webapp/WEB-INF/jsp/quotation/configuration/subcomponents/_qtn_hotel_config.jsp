<!DOCTYPE html>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<style>
td{
text-align:center;
}
th{
background-color:darkgray;
}
</style>
	
	<h1 align="center">Hotels</h1>
	<br><div align="center"><img src="${pageContext.request.contextPath}/resources/images/quotation/hotel-quote.jpg"  height="100" width="100"/></div>
	
	<c:set var="isMultipleHotelOptions" value="${false}"/>
	<c:if test="${QTN_OBJ.hotelOptionsWiseMap.size() > 1}">
    	<c:set var="isMultipleHotelOptions" value="${true}"/>
	</c:if>
	
	<table style="width:100%; margin-left: auto;margin-right: auto;  background-color:#000080;" >
	
	<tr><td>	  
	<font size="4"><b>
	<c:set var="count" value="0" scope="page" />
	<c:set var="bghotloptioncolor" value="background-color:lightblue;" scope="page" />
	
	 <c:forEach items="${QTN_OBJ.hotelOptionsWiseMap}" var="entry">
		
		<table style="width:100%;  table-layout:fixed;background-color: #DFE0DC; border: 3px solid #000000; border-collapse: collapse" >
				<c:if test="${isMultipleHotelOptions eq true}">
					<tr><td colspan="10" height="50" style="background-color:blue;color:white;"><font size="5">Hotel Option <c:out value="${entry.key}" /></font></td></tr>
					<c:if test="${count %2==0}">
						<c:set var="bghotloptioncolor" value="background-color:lightblue;" scope="page" />
					</c:if>
					<c:if test="${count %2 !=0}">
						<c:set var="bghotloptioncolor" value="background-color:lightgreen;" scope="page" />
					</c:if>
					
				</c:if>
				<c:if test="${isMultipleHotelOptions eq false}">
					<tr><td colspan="10" height="40" style="background-color:blue;color:white;">Hotel </td></tr>
				</c:if>
				
				<tr>
						<th colspan="1"><font size="4"><b>City</b></font></th>
						<th colspan="2"><font size="4"><b>Hotel Name</b></font></th>
						<th><font size="4"><b>Room Category</b></font></th>
						<th><font size="4"><b>Meal Plan</b></font></th>
						<th><font size="4"><b>CheckIn Date</b></font></th>
						<th><font size="4"><b>CheckOut Date</b></font></th>
						<th><font size="4"><b>Adults |  Children</b></font></th>
						<th><font size="4"><b>Extra Bed</b></font></th>
						<th><font size="4"><b>No. of Rooms</b></font></th>
						
					</tr>
				<c:forEach var="hotelQtnObj" items="${entry.value}">
					<tr>
						<td height="40" style="${bghotloptioncolor}border: 1px solid black;">${hotelQtnObj.cityName }</td>
						<td colspan="2" style="${bghotloptioncolor}border: 1px solid black;">${hotelQtnObj.hotelName}</td>
						<td style="${bghotloptioncolor}border: 1px solid black;">${hotelQtnObj.roomCategoryName}</td>
						<td style="${bghotloptioncolor}border: 1px solid black;">${hotelQtnObj.mealPlanName}</td>
						<td height="40" style="${bghotloptioncolor}border: 1px solid black;"><fmt:formatDate value="${hotelQtnObj.checkInDate}" pattern="dd-MM-yyyy" /> </td>
						<td style="${bghotloptioncolor}border: 1px solid black;"><fmt:formatDate value="${hotelQtnObj.checkOutDate}" pattern="dd-MM-yyyy" /></td>
						<td style="${bghotloptioncolor}border: 1px solid black;">${hotelQtnObj.adults} | ${hotelQtnObj.children}</td>
						<td style="${bghotloptioncolor}border: 1px solid black;">${hotelQtnObj.extrabed}</td>
						<td style="${bghotloptioncolor}border: 1px solid black;"><font size="4"><b>${hotelQtnObj.noOfRooms}</b></font></td>
					</tr>
					<c:if test="${not empty hotelQtnObj.remarks}">
					<tr>
					<th colspan="2" style="border: 1px solid black;"><font size="4"><b>Remarks</b></font></th><td colspan="8" style="border: 1px solid black;">${hotelQtnObj.remarks}</td>  
					</tr>
				</c:if>
				</c:forEach>
			<c:set var="count" value="${count + 1}" scope="page"/>
			<tr><td style="background-color:lightgray;" colspan="10" height="50">&nbsp;</td></tr>
			<tr><td style="background-color:white;" colspan="10" height="50">&nbsp;</td></tr>

		</table>
	</c:forEach>
	
	
	
	
		
		
		
		
		</b>
		</font>
		</td>
		</tr>
		<c:if test="${MANUAL_CNF.hotelCancellationPolicyDisplay eq true}">
		<tr>
			<td style="background-color:red;color:white;" height="30"><b>Hotel Remarks or Cancellation Details</b></td>
		</tr>
		<tr>
			<td style="background-color:white;text-align:left;">
				<p style="white-space: pre-line"><font size="4"><c:out value="${MANUAL_CNF.hotelCancellationPolicy}"/></font></p>
			</td>
		</tr>
		</c:if>
		</table>
		
	