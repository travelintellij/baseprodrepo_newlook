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
		<h2><br>Search Supplier</h2>
	</center>
	<div align="center"><b><font color="green" > ${Success} </font><font color="red"> ${Error}</font> </b></div>
<body>
	<form:form modelAttribute="SEARCH_SUPPLIER" action="view_form_admin_search_supplier">
			<form:hidden path = "leadId" />
			<table style="width: 90%; ">
			<tr >
				<td style="width:2%;height:30px"><img src="${pageContext.request.contextPath}/resources/images/filter.jpg" height="50" width="50"/></td>
				<th style="width:12%;">
					Supplier Id
				</th>
				<td style="width:10%;height:30px">
					<form:input path="supplierId" name="supplierId" style="height:30px;width:100px;margin: auto;" />
				</td>
				<th>
					Supplier Name
				</th>
				<td>
					<form:input path="supplierName" name="supplierName" style="height:30px;width:250px;margin: auto;"/>
				</td>
				<th>
					Supplier City
				</th>
				<td>
					<form:input path="cityName" name="cityName" style="height:30px;width:200px;margin: auto;"/>
					<form:hidden path = "cityId" />
				</td>
				<td style="width:10%;height:30px"><input style="background-color:red;" type="submit" value="Apply Filter" /> </td>
				<td style="width:10%;height:30px"><a href="view_form_admin_search_supplier"><input type="button" value="Clear Filter" /></a></td>
		</tr>
		<tr >
			
			<th>
					Based on Services
			</th>
			<td colspan="6">
				<label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="flight" /><span class="checkmark"></span></label>Flight &nbsp;|
				<label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="hotel" /><span class="checkmark"></span></label>Hotel &nbsp;|
				<label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="transfers" /><span class="checkmark"></span></label>Transfers &nbsp;|
				<label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="sightseeing" /><span class="checkmark"></span></label>SightSeeing &nbsp;|
				<label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="visa" /><span class="checkmark"></span></label>Visa &nbsp;|
				<label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="insurance" /><span class="checkmark"></span></label>Insurance &nbsp;|
				<label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="landPackage" /><span class="checkmark"></span></label>Package&nbsp;|
				<label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="cruise" /><span class="checkmark"></span></label>Cruise&nbsp;|
				<label class="container" style="display: inline;margin: 0 auto;margin-bottom: 20px;"><form:checkbox path="others" /><span class="checkmark"></span></label>Others
			</td>
			<th>
					City of Service
			</th>
				<td>
					<form:input path="serviceCityName" name="cityName" style="height:30px;width:200px;margin: auto;"/>
					<form:hidden path = "serviceCityId" />
				</td>
		</tr>
	</table>
				
	</form:form>
		<c:set value="${SUPPLIER_LIST}" var="supplierList" />
		<table style="width:95%;">
			<tr>
				<th style="width:5%;background-color:steelblue;">Supplier Id</th>
				<th style="width:15%;background-color:steelblue;">Supplier Name</th>
				<th style="width:10%;background-color:steelblue;">City</th>
				<th style="width:15%;background-color:steelblue;">Email</th>
				<th style="width:8%;background-color:steelblue;">Mobile</th>
				<th style="width:15%;background-color:steelblue;">Destinations</th>
				<th style="width:15%;background-color:steelblue;">Services</th>
				<th style="width:17%;background-color:steelblue;">Action</th>
			</tr>
			<c:forEach items="${supplierList}" var="supplier">
				<tr>

				<td style="width:5%;">${supplier.supplierId }</th>
				<td style="width:15%;">${supplier.supplierName }</th>
				<td style="width:10%;">${supplier.cityName }</th>
				<td style="width:15%;">${supplier.email }</th>
				<td style="width:8%;">${supplier.mobile }</th>
				<td style="width:15%;">
				<c:forEach items="${supplier.destinations}" var="destination">
				${destination.cityName}, 
				</c:forEach>
				
				<td style="width:15%;">
					 <c:if test="${supplier.flight eq true}">
					 	Flight,
					 </c:if>
					 <c:if test="${supplier.hotel eq true}">
					 	Hotel,
					 </c:if>
					 <c:if test="${supplier.transfers eq true}">
					 	Transfer,
					 </c:if>
					 <c:if test="${supplier.sightseeing eq true}">
					 	Sight Seeing,
					 </c:if>
					 <c:if test="${supplier.visa eq true}">
					 	Visa,
					 </c:if>
					<c:if test="${supplier.insurance eq true}">
					 	Insurance,
					</c:if>
					<c:if test="${supplier.cruise eq true}">
					 	Cruise,
					</c:if>
					<c:if test="${supplier.landPackage eq true}">
					 	Package,
					</c:if>
				</td>
				
				<td style="width:17%;">
					
					<sec:authorize access="hasAnyRole('ADMIN','SUPPLIER_VIEW','SUPPLIER_EDIT','SUPPLIER_DELETE')">
						<a id="myBtn[${supplier.supplierId}]" onclick="contactDisplay(this)" data-load-url="view_supplier_details_modal?supplierId=${supplier.supplierId }" data-toggle="modal" data-target="#myModal" ><input type="button" style="background-color: #786AAF;padding: 4px 5px;"  value="View" /></a> 
					</sec:authorize> 
					
					<sec:authorize access="hasAnyRole('ADMIN','SUPPLIER_EDIT')">
						| <a href="form_view_editsupplier?supplierId=${supplier.supplierId }"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"value="Edit" /></a> 
					</sec:authorize>

					<sec:authorize access="! hasAnyRole('ADMIN','SUPPLIER_EDIT')">
						 | <a href="form_view_editsupplier?supplierId=${supplier.supplierId }"><input type="button" style="background-color: #786AAF;padding: 4px 5px;"value="Edit" disabled /></a>
					</sec:authorize>

					<sec:authorize access="hasAnyRole('ADMIN','SUPPLIER_DELETE')">
						| <a id="myBtn[${supplier.supplierId }]" onclick="contactDisplay(this)" data-load-url="view_delete_supplier_confirm_modal?supplierId=${supplier.supplierId }" data-toggle="modal" data-target="#myModal" ><input type="button" style="background-color: red;padding: 4px 5px;"  value="Delete" /></a> 
					</sec:authorize>
					
					<sec:authorize access="! hasAnyRole('ADMIN','SUPPLIER_DELETE')">
						| <a href="view_view_delete_client_confirmation?clientId=${supplier.supplierId }"><input type="button" style="background-color: #dddddd;padding: 4px 5px;"value="Delete" disabled /></a> 
					</sec:authorize>
					
					<sec:authorize access="hasAnyRole('ADMIN','SUPPLIER_VIEW','SUPPLIER_EDIT','SUPPLIER_DELETE')">
						<a href="view_supplier_contacts_listing?supplierId=${supplier.supplierId }&leadId=${SEARCH_SUPPLIER.leadId}"><input type="button" style="background-color: green;padding: 4px 5px;"value="View Contacts" /></a> 
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
			    <c:url value="view_form_admin_search_supplier" var="prev">
			       <c:param name="page" value="${page-1}"/>
			    </c:url>
			    <c:if test="${page > 0}">
			        <a href="<c:out value="${prev}&sortBy=${sortBy}&supplierName=${SEARCH_SUPPLIER.supplierName}&cityId=${SEARCH_SUPPLIER.cityId}&cityName=${SEARCH_SUPPLIER.cityName}&serviceCityId=${SEARCH_SUPPLIER.serviceCityId}&serviceCityName=${SEARCH_SUPPLIER.serviceCityName}&flight=${SEARCH_SUPPLIER.flight}&hotel=${SEARCH_SUPPLIER.hotel}&transfers=${SEARCH_SUPPLIER.transfers}&sightseeing=${SEARCH_SUPPLIER.sightseeing}&visa=${SEARCH_SUPPLIER.visa}&insurance=${SEARCH_SUPPLIER.insurance}&cruise=${SEARCH_SUPPLIER.cruise}&consolidator=${SEARCH_SUPPLIER.consolidator}&landPackage=${SEARCH_SUPPLIER.landPackage}&leadId=${SEARCH_SUPPLIER.leadId}" />" class="pn prev">Prev</a>
			    </c:if>
			
			    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
			        <c:choose>
			            <c:when test="${(page+1) == i.index}">
			                <span>${i.index}</span>
			            </c:when>
			            <c:otherwise>
			                <c:url value="view_form_admin_search_supplier" var="url">
			                    <c:param name="page" value="${i.index-1}"/>
			                </c:url>
			                 <a href='<c:out value="${url}&sortBy=${sortBy}&supplierName=${SEARCH_SUPPLIER.supplierName}&cityId=${SEARCH_SUPPLIER.cityId}&cityName=${SEARCH_SUPPLIER.cityName}&serviceCityId=${SEARCH_SUPPLIER.serviceCityId}&serviceCityName=${SEARCH_SUPPLIER.serviceCityName}&flight=${SEARCH_SUPPLIER.flight}&hotel=${SEARCH_SUPPLIER.hotel}&transfers=${SEARCH_SUPPLIER.transfers}&sightseeing=${SEARCH_SUPPLIER.sightseeing}&visa=${SEARCH_SUPPLIER.visa}&insurance=${SEARCH_SUPPLIER.insurance}&cruise=${SEARCH_SUPPLIER.cruise}&consolidator=${SEARCH_SUPPLIER.consolidator}&landPackage=${SEARCH_SUPPLIER.landPackage}&leadId=${SEARCH_SUPPLIER.leadId}" />'>${i.index}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:url value="view_form_admin_search_supplier" var="next">
			        <c:param name="page" value="${page + 1}"/>
			    </c:url>
			    <c:if test="${page + 1 < maxPages}">
			       <a href='<c:out value="${next}&sortBy=${sortBy}&supplierName=${SEARCH_SUPPLIER.supplierName}&cityId=${SEARCH_SUPPLIER.cityId}&cityName=${SEARCH_SUPPLIER.cityName}&serviceCityId=${SEARCH_SUPPLIER.serviceCityId}&serviceCityName=${SEARCH_SUPPLIER.serviceCityName}&flight=${SEARCH_SUPPLIER.flight}&hotel=${SEARCH_SUPPLIER.hotel}&transfers=${SEARCH_SUPPLIER.transfers}&sightseeing=${SEARCH_SUPPLIER.sightseeing}&visa=${SEARCH_SUPPLIER.visa}&insurance=${SEARCH_SUPPLIER.insurance}&cruise=${SEARCH_SUPPLIER.cruise}&consolidator=${SEARCH_SUPPLIER.consolidator}&landPackage=${SEARCH_SUPPLIER.landPackage}&leadId=${SEARCH_SUPPLIER.leadId}" />' class="pn next">Next</a>
			    </c:if>
			    </font>
			</div>

			<br>
 
 <script>
	//Get the modal
	 var modal = document.getElementById("myModal");
	 // Get the button that opens the modal
	 var btn = document.getElementById("myBtn");
	 // Get the <span> element that closes the modal
	 var span = document.getElementsByClassName("close")[0];
	 function contactDisplay(clicked) { 
	 	//alert(clicked); 
	 	$("#myModal .modal-body").load($(clicked).attr('data-load-url'));
	 	modal.style.display = "block";
	 }   
	
	 // When the user clicks on <span> (x), close the modal
	 span.onclick = function() {
	   modal.style.display = "none";
	 }
	
	 // When the user clicks anywhere outside of the modal, close it
	 window.onclick = function(event) {
	   if (event.target == modal) {
	     modal.style.display = "none";
	   }
	 }
	
	 function cancelModal(){
	 	modal.style.display = "none";
	 }
	 
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

	$('#serviceCityName').autocomplete({
		serviceUrl : '${pageContext.request.contextPath}/getCityList',
		paramName : "cityName",
		delimiter : ",",
		onSelect : function(suggestion) {
			cityID = suggestion.data;
			id = cityID;
			jQuery("#destinationId").val(cityID);
			$('input[name=serviceCityId]').val(id);
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
  