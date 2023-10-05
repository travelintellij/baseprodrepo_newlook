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
/* The Modal (background) */
	.modal {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  padding-top: 50px; /* Location of the box */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 90%; /* Full height */
	  overflow: scroll; /* Enable scroll if needed */
	  background-color: rgb(0,0,0); /* Fallback color */
	  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content */
	.modal-content {
	  position: relative;
	  background-color: #fefefe;
	  margin: auto;
	  padding: 0;
	  border: 1px solid #888;
	  width: 90%;
	  height: 90%;
	  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
	  -webkit-animation-name: animatetop;
	  -webkit-animation-duration: 0.4s;
	  animation-name: animatetop;
	  animation-duration: 0.4s
	}
	
	/* Add Animation */
	@-webkit-keyframes animatetop {
	  from {top:-300px; opacity:0} 
	  to {top:0; opacity:1}
	}
	
	@keyframes animatetop {
	  from {top:-300px; opacity:0}
	  to {top:0; opacity:1}
	}
	
	/* The Close Button */
	.close {
	  color: white;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	  color: #000;
	  text-decoration: none;
	  cursor: pointer;
	}
	
	.modal-header {
	  padding: 2px 16px;
	  background-color: lightblue;
	  color: white;
	}
	
	.modal-body {padding: 2px 16px;}
	
	.modal-footer {
	  padding: 2px 16px;
	  background-color: lightblue;
	  color: white;
	}
	
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
		<h2><br>Search City</h2>
	</center>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
<body>
	<form:form modelAttribute="SEARCH_CITY" action="view_search_city_form">
			
			<table style="width: 80%; ">
			<tr >
				<td style="width:2%;height:30px"><img src="${pageContext.request.contextPath}/resources/images/filter.jpg" height="50" width="50"/></td>
				<th style="width:12%;">
					Destination Id
				</th>
				<td style="width:10%;height:30px">
					<form:input path="destinationId" name="destinationId" style="height:30px;width:100px;margin: auto;" />
				</td>
				<th>
					City Name
				</th>
				<td>
					<form:input path="cityName" name="cityName" style="height:30px;width:250px;margin: auto;"/>
				</td>
				<th>
					Country Name
				</th>
				<td>
					<div class="select">
						<form:select path="countryCode" style="height:30px;width: 200px;" required="required" >  
							<c:forEach items="${ACTIVE_CTRYCODE_CTRYNAME_LIST}" var="destinationObj">
								<c:if test="${destinationObj.countryCode eq SEARCH_CITY.countryCode}">
									<option class="service-small" value="${destinationObj.countryCode}" selected>${destinationObj.countryName}</option>
								</c:if>
								<c:if test="${destinationObj.countryCode ne SEARCH_CITY.countryCode}">
									<option class="service-small" value="${destinationObj.countryCode}">${destinationObj.countryName}</option>
								</c:if>
							</c:forEach>
						</form:select>  
					</div>
				</td>
				<td style="width:10%;height:30px"><input style="background-color:red;" type="submit" value="Apply Filter" /> </td>
				<td style="width:10%;height:30px"><a href="view_search_city_form"><input type="button" value="Clear Filter" /></a></td>
		</tr>
		
	</table>
				
	</form:form>
		<c:set value="${CITY_LIST}" var="cityList" />
		<table style="width:60%;">
			<tr>
				<th style="width:5%;background-color:steelblue;">Destination Id</th>
				<th style="width:15%;background-color:steelblue;">City Name</th>
				<th style="width:10%;background-color:steelblue;">Country Name</th>
				<th style="width:10%;background-color:steelblue;">Status</th>
				<th style="width:10%;background-color:steelblue;">Action</th>
			</tr>
			<c:forEach items="${cityList}" var="cityRec">
				<tr>
					<td style="width:5%;">${cityRec.destinationId }</td>
					<td style="width:15%;">${cityRec.cityName }</td>
					<td style="width:10%;">${cityRec.countryName }</td>
					<td style="width:10%;">
						<c:if test="${cityRec.active eq true}">
								<input type="button" style="background-color: green;padding: 4px 5px;pointer-events: none;"  value="Active" />
						</c:if>
						<c:if test="${cityRec.active eq false}">
								<input type="button" style="background-color: red;padding: 4px 5px;pointer-events: none;"  value="In-Active" />
						</c:if> 
					
					</td>
					
					<td style="width:10%;">
						<sec:authorize access="hasAnyRole('ADMIN')">
							<a href="view_edit_city_form?destinationId=${cityRec.destinationId }"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"value="Edit" /></a> 
						</sec:authorize>
					</td>
				</tr>
			</c:forEach>
			<!-- The Modal -->
			<div id="myModal" class="modal">
			
			  <!-- Modal content -->
			  <div class="modal-content">
			    <div class="modal-header">
			      <span class="close">&times;</span>
			      <br><h2 style="text-align:center;" id="modelheaderh2">Supplier Details</h2>
			    </div>
			    <div class="modal-body">
			
			
			    </div>
			    <div class="modal-footer">
			      <h3>Powered by @TravelIntelliJ</h3>
			    </div>
			  </div>
			
			</div>	
		</table>
 				<div id="pagination" align="center">
				<font size="3">Page: 
			    <c:url value="view_search_city_form" var="prev">
			       <c:param name="page" value="${page-1}"/>
			    </c:url>
			    <c:if test="${page > 0}">
			        <a href="<c:out value="${prev}&sortBy=${sortBy}&countryCode=${countryCode}" />" class="pn prev">Prev</a>
			    </c:if>
			
			    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
			        <c:choose>
			            <c:when test="${(page+1) == i.index}">
			                <span>${i.index}</span>
			            </c:when>
			            <c:otherwise>
			                <c:url value="view_search_city_form" var="url">
			                    <c:param name="page" value="${i.index-1}"/>
			                </c:url>
			                 <a href='<c:out value="${url}&sortBy=${sortBy}&countryCode=${countryCode}" />'>${i.index}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:url value="view_search_city_form" var="next">
			        <c:param name="page" value="${page + 1}"/>
			    </c:url>
			    <c:if test="${page + 1 < maxPages}">
			       <a href='<c:out value="${next}&sortBy=${sortBy}&countryCode=${countryCode}" />' class="pn next">Next</a>
			    </c:if>
			    </font>
			</div>
 </body>
  
  </html>
  