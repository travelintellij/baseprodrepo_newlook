<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">

<jsp:include page="../../menu/MenuBuilder.jsp" />

<style>
table {
  width: 100%;
  height: 60px;
  border-collapse: collapse;
  border: 1px solid #38678f;
  margin: 5px auto;
  background: white;
}

th {
  background: #7B68EE;
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
	<h2 align="center"><br>Search Hotel Chain</h2>
	
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>

	<form:form modelAttribute="SEARCH_HOTEL_CHAIN" action="search_search_hotel_chain">
			<table style="width: 90%; ">
			<tr >
				<td style="height:30px"><img src="${pageContext.request.contextPath}/resources/images/filter.jpg" height="50" width="50"/></td>
				<th>Hotel Chain Id</th>
				<td style="height:30px">
					<input type="number" class="contact" id="hotelChainId" name="hotelChainId" style="height:30px;width:170px;" value="${SEARCH_HOTEL_CHAIN.hotelChainId}" />
				</td>
				<th>Hotel Chain Name</th>
				<td style="height:30px">
					<input type="text" class="contact" id="hotelChainName" name="hotelChainName" size="35" placeholder="Hotel Chain Name" value="${SEARCH_HOTEL_CHAIN.hotelChainName}" />
				</td>
				<th>Active</th>
				<td style="width:10%;height:30px">
					<div class="select" style="width:120px;">
						<select id = "active" name = "active" style="width:100px;">
						   <c:if test="${SEARCH_HOTEL_CHAIN.active eq true }">
						   		<option class="service-small" value = "true" selected> <c:out value = "True"/></option>
						   		<option class="service-small" value = "false"> <c:out value = "False"/></option>
						   	</c:if>
						 	<c:if test="${SEARCH_HOTEL_CHAIN.active eq false}">
						   		<option class="service-small" value = "true" > <c:out value = "True"/></option>
						   		<option class="service-small" value = "false" selected> <c:out value = "False"/></option>

						   	</c:if>
						</select>
					</div>
					
				</td>
				<td style="height:30px"><input style="background-color:red;" type="submit" value="Apply Filter" /> </td>
				<td style="height:30px"><a href="view_search_hotel_chain_form"><input type="button" value="Clear Filter" /></a></td>

			</tr>
		</table>
				
	</form:form>
  
<br>  
  <table border="1px" style="border-collapse: collapse;width:80%;" align="center">
			<tr>
				<th style="width:10%;">Chain No.</th>
				<th style="width:30%;">Hotel Chain Name</th>
				<th style="width:30%;">Hotel Chain Remarks</th>
				<th style="width:10%;">Active</th>
				<th style="width:20%;">Action</th>
			</tr>
			<c:if test="${not empty chainSearchList}">
				<c:forEach var="chainObj" items="${chainSearchList}">
					<tr>
						<td style="width:10%;">${chainObj.hotelChainId}</td>
						<td style="width:30%;">${chainObj.hotelChainName}</td>
						<td style="width:35%;">${chainObj.remarks}</td>
						<td style="width:10%;">${chainObj.active}</td>
						<td style="width:15%;text-align:center;" >
							
							<table>
							<tr>
							<td>
								<sec:authorize access="hasAnyRole('ADMIN','HOTEL_CHAIN_EDIT')">
									<form:form id="form_update_FLT_SL" name="form_update_FLT_SL" action="view_edit_hotel_chain_form" method="POST" style="display:inline;">
										<input type="hidden" name="hotelChainId" value="${chainObj.hotelChainId}"/>
										<input type="submit" style="background-color: blue;float:left;" value="Edit" />
										<!-- <input type="image" src="${pageContext.request.contextPath}/resources/images/edit.jpg" height="20" width="20"/>  -->
									</form:form>
								</sec:authorize>
								
								<sec:authorize access="! hasAnyRole('ADMIN','HOTEL_CHAIN_EDIT')">
									<form:form id="form_update_FLT_SL" name="form_update_FLT_SL" action="view_edit_hotel_chain_form" method="POST" style="display:inline;">
										<input type="hidden" name="hotelChainId" value="${chainObj.hotelChainId}"/>
										<input type="submit" style="background-color: #dddddd;float:left;" value="Edit" disabled/>
										<!-- <input type="image" src="${pageContext.request.contextPath}/resources/images/edit.jpg" height="20" width="20"/>  -->
									</form:form>
								</sec:authorize>
							</td>
							<td>
								<sec:authorize access="hasAnyRole('ADMIN','HOTEL_CHAIN_DELETE')">
									<form:form id="form_del_FLT_SL" name="form_del_FLT_SL" action="view_delete_hotel_chain_form" method="POST" style="display:inline;">		
											<input type="hidden" name="hotelChainId" value="${chainObj.hotelChainId}"/>
											<input type="submit" style="background-color: red;float:left;" value="Delete" />
									</form:form>
								</sec:authorize>
								<sec:authorize access="! hasAnyRole('ADMIN','HOTEL_CHAIN_DELETE')">
									<form:form id="form_del_FLT_SL" name="form_del_FLT_SL" action="view_delete_hotel_chain_form" method="POST" style="display:inline;">		
											<input type="hidden" name="hotelChainId" value="${chainObj.hotelChainId}"/>
											<input type="submit" style="background-color: #dddddd;float:left;" value="Delete" disabled />
									</form:form>
								</sec:authorize>
							</td>
							</tr>
							</table>
					</td>
					</tr>
				</c:forEach>
			</c:if>

		</table>
  
  </html>