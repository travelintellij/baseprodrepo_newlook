<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>


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
  background: #D33F14;
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

	<center>
		<h2><br>Search Client</h2>
	</center>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
<body>
	<form:form modelAttribute="SEARCH_CLIENTS" action="search_search_filtered_clients">
			
			<table style="width: 90%; ">
			<tr >
				<th style="width:12%;height:30px;background-color:orange;color:black;" colspan="2">
					Client Id
				</th>
				<th style="width:20%;height:30px;background-color:orange;color:black;">
					Client Name
				</th>
				<th style="width:12%;height:30px;background-color:orange;color:black;">
					City Name
				</th>
				<th style="width:10%;height:30px;background-color:orange;color:black;">
					Contact Number
				</th>
				<th style="width:15%;height:30px;background-color:orange;color:black;">
					Email
				</th>
				<th style="width:10%;height:30px;background-color:orange;color:black;">
					Active
				</th>
				
	 			<th style="width:20%;height:30px;background-color:orange;color:black;" colspan="2"></th>
				
			</tr>

			<tr >
				<td style="width:2%;height:30px"><img src="${pageContext.request.contextPath}/resources/images/filter.jpg" height="50" width="50"/></td>
				<td style="width:10%;height:30px">
					<input type="number" class="contact" id="clientId" name="clientId" placeholder="clientId" min="0" style="height:30px;width:70px;" value="${SEARCH_CLIENTS.clientId}" />
				</td>
				<td style="width:20%;height:30px">
					<input type="text" class="contact" id="clientName" name="clientName" size="35" placeholder="clientName" value="${SEARCH_CLIENTS.clientName}" />
				</td>
				<td style="width:12%;height:30px">
					<input type="text" class="contact" id="cityName" name="cityName"  style="width:150px;" size="35" placeholder="City / Country" value="${SEARCH_CLIENTS.cityName}" />
					<input type="hidden" name="cityId" value="${SEARCH_CLIENTS.cityId}" />
				</td>
				<td style="width:10%;height:30px">
					<input type="number" class="contact" id="contactNumber" name="contactNumber" min="0" style="height:30px;width:120px;" size="20" placeholder="Contact Number" value="${SEARCH_CLIENTS.contactNumber}" />
				</td>
				<td style="width:15%;height:30px">
					<input type="text" class="contact" id="email" name="email"  style="width:200px;" placeholder="email" value="${SEARCH_CLIENTS.email}" />
				</td>
				<td style="width:10%;height:30px">
					<div class="select" style="width:120px;">
						<select id = "active" name = "active" style="width:100px;">
						   <c:if test="${active eq true }">
						   		<option class="service-small" value = "true" selected> <c:out value = "True"/></option>
						   		<option class="service-small" value = "false"> <c:out value = "False"/></option>
						   	</c:if>
						 	<c:if test="${active eq false}">
						   		<option class="service-small" value = "true" > <c:out value = "True"/></option>
						   		<option class="service-small" value = "false" selected> <c:out value = "False"/></option>

						   	</c:if>
						</select>
					</div>
					
				</td>
	 			<td style="width:10%;height:30px"><input style="background-color:red;" type="submit" value="Apply Filter" /> </td>
				<td style="width:10%;height:30px"><a href="view_form_admin_search_client"><input type="button" value="Clear Filter" /></a></td>
			</tr>
		</table>
				
	</form:form>
		<c:set value="${CLIENTS_LIST}" var="clientList" />
		<table>
			<tr>
				<th style="width:10%;"><a href="search_search_filtered_clients?sortBy=clientId&clientName=${clientName}&cityId=${cityId}&cityName=${cityName}&email=${email}&active=${active}">Client Id</a></th>
				<th style="width:30%;color:green" class="vsc-cn">Client Name</th>
				<th style="width:10%;">City</th>
				<th style="width:12%;">Country</th>
				<th style="width:15%;">Email</th>
				<th style="width:10%;">Mobile</th>
				<th style="width:8%;">Active</th>
				<th style="width:15%;">Action</th>
			</tr>
			<c:forEach items="${clientList}" var="client">
				<tr>
				
					<td style="width:10%;">${client.clientId }</td>
					<td style="width:18%;">${client.clientName }</td>
					<td style="width:10%;">${client.cityName }</td>
					<td style="width:12%;">${client.countryName }</td>
					<td style="width:15%;">${client.email }</td>
					<td style="width:10%;">${client.mobile }</td>
					<td style="width:8%;">${client.active }</td>
					
				
				<td style="width:15%;">
					
					<sec:authorize access="hasAnyRole('ADMIN','CLIENT_VIEW','CLIENT_EDIT','CLIENT_DELETE')">
						<a href="view_view_admin_client?clientId=${client.clientId}"><input type="button" style="background-color: green;padding: 4px 5px;"value="View" /></a> 
					</sec:authorize> 
					
					<sec:authorize access="hasAnyRole('ADMIN','CLIENT_EDIT')">
						| <a href="view_edit_admin_client?clientId=${client.clientId}"><input type="button" style="background-color: blue;padding: 4px 5px;"value="Edit" /></a> 
					</sec:authorize>

					<sec:authorize access="! hasAnyRole('ADMIN','CLIENT_EDIT')">
						 | <a href="view_edit_admin_client?clientId=${client.clientId}"><input type="button" style="background-color: #dddddd;padding: 4px 5px;"value="Edit" disabled /></a>
					</sec:authorize>

					<sec:authorize access="hasAnyRole('ADMIN','CLIENT_DELETE')">
						| <a href="view_view_delete_client_confirmation?clientId=${client.clientId}"><input type="button" style="background-color: red;padding: 4px 5px;"value="Delete" /></a> 
					</sec:authorize>
					
					<sec:authorize access="! hasAnyRole('ADMIN','CLIENT_DELETE')">
						| <a href="view_view_delete_client_confirmation?clientId=${client.clientId}"><input type="button" style="background-color: #dddddd;padding: 4px 5px;"value="Delete" disabled /></a> 
					</sec:authorize>
					
					
					<sec:authorize access="hasAnyRole('ADMIN','CLIENT_MANAGE_DOCS')">
						| <a href="view_view_crud_client_docs?clientId=${client.clientId}"><input type="button" style="color:black;background-color: #FFDF00;padding: 4px 5px;"value="Docs" /></a>
					</sec:authorize>
					
					<sec:authorize access="! hasAnyRole('ADMIN','CLIENT_MANAGE_DOCS')">
						| <a href="view_view_crud_client_docs?clientId=${client.clientId}"><input type="button" style="background-color: #dddddd;padding: 4px 5px;"value="Docs" disabled /></a>
					</sec:authorize>
				</td>
				</tr>
			</c:forEach>
		</table>
 				<div id="pagination" align="center">
				<font size="3">Page: 
			    <c:url value="view_form_admin_search_client" var="prev">
			       <c:param name="page" value="${page-1}"/>
			    </c:url>
			    <c:if test="${page > 0}">
			        <a href="<c:out value="${prev}&sortBy=${sortBy}&clientName=${clientName}&cityId=${cityId}&cityName=${cityName}&email=${email}&active=${active}" />" class="pn prev">Prev</a>
			    </c:if>
			
			    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
			        <c:choose>
			            <c:when test="${(page+1) == i.index}">
			                <span>${i.index}</span>
			            </c:when>
			            <c:otherwise>
			                <c:url value="view_form_admin_search_client" var="url">
			                    <c:param name="page" value="${i.index-1}"/>
			                </c:url>
			                 <a href='<c:out value="${url}&sortBy=${sortBy}&clientName=${clientName}&cityId=${cityId}&cityName=${cityName}&email=${email}&active=${active}" />'>${i.index}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:url value="view_form_admin_search_client" var="next">
			        <c:param name="page" value="${page + 1}"/>
			    </c:url>
			    <c:if test="${page + 1 < maxPages}">
			       <a href='<c:out value="${next}&sortBy=${sortBy}&clientName=${clientName}&cityId=${cityId}&cityName=${cityName}&email=${email}&active=${active}" />' class="pn next">Next</a>
			    </c:if>
			    </font>
			</div>

			<br>
 
 <script>
	$('#cityName').autocomplete({
		serviceUrl : '${pageContext.request.contextPath}/getCityList',
		paramName : "cityName",
		delimiter : ",",
		onSelect : function(suggestion) {
			cityID = suggestion.data;
			id = cityID;
			jQuery("#destinationId").val(cityID);
			$('input[name=cityId]').val(id);
			return false;
		},
		transformResult : function(response) {
			return {
				suggestions : $.map($.parseJSON(response), function(item) {
					return {
						value : item.cityName,
						data : item.destinationId
					};
				})

			};
		}
	});

 
 </script>
 </body>
  
  </html>
  