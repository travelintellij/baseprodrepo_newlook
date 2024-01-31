<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Supplier</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
</head>


<style>
.modal {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  padding-top: 50px; /* Location of the box */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 90%; /* Full height */
	  background-color: transparent; /* Black w/ opacity */
	}
	
	/* Modal Content */
	.modal-content {
	  position: relative;
	  margin: auto;
	  padding: 0;
	  width: 1200px;
	  height: 90%;
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
	
	

        body::before {
            content: "";
            background-image:url(${pageContext.request.contextPath}/resources/images/revamped/search_supplier_bg.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            background-attachment: fixed;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            opacity: 0.5; /* Adjust the opacity value as needed (0.0 to 1.0) */
            z-index: -1;
        }

	

</style>


<body>
    <div class="search_supplier container">
        <div class="serach_supplier_wrapper">
            <h1>Search Supplier </h1>
            <div align="center"><b>
                    <font color="#32cd32 "> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <form:form modelAttribute="SEARCH_SUPPLIER" action="view_form_admin_search_supplier">
                <form:hidden path="leadId" />
                <div class="search_supplier_data_l1">
                    <div class="ssd1">
                        <label for="supp-id">Supplier Id</label>
                        <form:input path="supplierId" name="supplierId" id="supp-id" />
                    </div>
                    <div class="ssd1">
                        <label for="supp-name">Supplier Name</label>
                        <form:input path="supplierName" name="supplierName" id="supp-name" />
                    </div>
                    <div class="ssd1">
                        <label for="supp-city">Supplier City</label>
                        <form:input path="cityName" name="cityName" id="supp-city" />
                        <form:hidden path="cityId" />
                    </div>
                    <div class="ssd1">
                        <label for="supp-city-ser">City of Service</label>
                        <form:input path="serviceCityName" name="cityName" id="supp-city-ser" />
                        <form:hidden path="serviceCityId" />
                    </div>
                </div>
                <div class="search_supplier_data_l2">
                    <h2 class="search_supplier_ser" style=" color: #FFBA08;">Based on Services</h2>
                    <div class="inside_ss_ser">
                        <div class="ssd2">
                            <form:checkbox path="flight" id="supp-fight" />
                            <label for="supp-fight">Flight</label>
                        </div>
                        <div class="ssd2">
                            <form:checkbox path="hotel" id="supp-Hotal" />
                            <label for="supp-Hotal">Hotal</label>
                        </div>
                        <div class="ssd2">
                            <form:checkbox path="transfers" id="supp-Transfers" />
                            <label for="supp-Transfers">Transfers</label>
                        </div>
                        <div class="ssd2">
                            <form:checkbox path="sightseeing" id="supp-Sightseeing" />
                            <label for="supp-Sightseeing">Sightseeing</label>
                        </div>
                        <div class="ssd2">
                            <form:checkbox path="visa" id="supp-Visa" />
                            <label for="supp-Visa">Visa</label>
                        </div>
                        <div class="ssd2">
                            <form:checkbox path="insurance" id="supp-Insurence" />
                            <label for="supp-Insurence">Insurence</label>
                        </div>
                        <div class="ssd2">
                            <form:checkbox path="landPackage" id="supp-Package" />
                            <label for="supp-Package">Package</label>
                        </div>
                        <div class="ssd2">
                            <form:checkbox path="cruise" id="supp-Cruise" />
                            <label for="supp-Cruise">Cruise</label>
                        </div>
                        <div class="ssd2">
                            <form:checkbox path="others" id="supp-Others" />
                            <label for="supp-Others">Others</label>
                        </div>
                    </div>
                </div>
                <div class="ss-btn">
                    <input type="submit" value="Apply Filter" />
                    <a href="view_form_admin_search_supplier">Clear Filter</a>
                </div>
                    </form:form>
        </div>
      
    </div>
  

    <div class="search_suppler_table">
        <table style="padding:10px 5px">
            <thead>
                <tr style="background:#6082B6">
                    <th style="width:6.4% ;color:#FFBA08; ">Supplier <br> Id</th>
                    <th style="width:18.8%; color:#FFBA08 ">Supplier Name</th>
                    <th style="width:10.2%;color:#FFBA08 ">City</th>
                    <th style="width:23%; color:#FFBA08">Email</th>
                    <th style="width:8.5%;color:#FFBA08 ">Mobile</th>
                    <th style="width:14.5% ;color:#FFBA08">Destinations</th>
                    <th style="width:10% ;color:#FFBA08">Services</th>
                    <th  style="width:4% ;color:#FFBA08">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:set value="${SUPPLIER_LIST}" var="supplierList" />
             <!--   <table style="padding:25px 10px"> -->
                    <c:forEach items="${supplierList}" var="supplier">
                        <tr style="border-bottom:2px solid green">

                            <td style="width:6.4%;border-bottom:2px solid #FFBA08;border-right:2px solid #FFBA08">${supplier.supplierId }</th>
                            <td style="width:20.8%;border-bottom:2px solid #FFBA08;border-right:2px solid #FFBA08"">${supplier.supplierName }</th>
                            <td style="width:11.2%;border-bottom:2px solid #FFBA08;border-right:2px solid #FFBA08"">${supplier.cityName }</th>
                            <td style="width:23%x;border-bottom:2px solid #FFBA08;border-right:2px solid #FFBA08"">${supplier.email }</th>
                            <td style="width:8.5%;border-bottom:2px solid #FFBA08;border-right:2px solid #FFBA08"">${supplier.mobile }</th>
                            <td  style="width:13.5%;border-bottom:2px solid #FFBA08;border-right:2px solid #FFBA08"">
                                <c:forEach items="${supplier.destinations}" var="destination">
                                    ${destination.cityName},
                                </c:forEach>

                            <td style="width:15%;border-bottom:2px solid #FFBA08;border-right:2px solid #FFBA08"">
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


                            <td class="search_supplier_iicon" style="border-bottom:2px solid #FFBA08">
                              <i class="fa-solid fa-sliders st1">
                                    <div class="search_supplier_ul">
                                        <ul>
                                            <li style="border-bottom: 1px solid #FFBA08;">
                                                <sec:authorize
                                                    access="hasAnyRole('ADMIN','SUPPLIER_VIEW','SUPPLIER_EDIT','SUPPLIER_DELETE')">
                                                    <a id="myBtn[${supplier.supplierId}]" onclick="contactDisplay(this)"
                                                        data-load-url="view_supplier_details_modal?supplierId=${supplier.supplierId }"
                                                        data-toggle="modal" data-target="#myModal"><input type="button"
                                                            value="View" /></a>
                                                </sec:authorize>
                                             
                                            </li>



                                            <li style="border-bottom: 1px solid #FFBA08;" >
                                                <sec:authorize access="hasAnyRole('ADMIN','SUPPLIER_EDIT')">
                                                     <a
                                                        href="form_view_editsupplier?supplierId=${supplier.supplierId }"><input
                                                            type="button" value="Edit" /></a>
                                                </sec:authorize>
                                            </li>

                                            <li>
                                                <sec:authorize access="! hasAnyRole('ADMIN','SUPPLIER_EDIT')">
                                                     <a
                                                        href="form_view_editsupplier?supplierId=${supplier.supplierId }"><input
                                                            type="button" value="Edit" disabled /></a>
                                                </sec:authorize>
                                            </li>


                                            <li style="border-bottom: 1px solid #FFBA08;">
                                                <sec:authorize access="hasAnyRole('ADMIN','SUPPLIER_DELETE')">
                                                     <a id="myBtn[${supplier.supplierId }]"
                                                        onclick="contactDisplay(this)"
                                                        data-load-url="view_delete_supplier_confirm_modal?supplierId=${supplier.supplierId }"
                                                        data-toggle="modal" data-target="#myModal"><input type="button"
                                                            value="Delete" /></a>
                                                </sec:authorize>
                                            </li>

                                            <li>
                                                <sec:authorize access="! hasAnyRole('ADMIN','SUPPLIER_DELETE')">
                                                     <a
                                                        href="view_view_delete_client_confirmation?clientId=${supplier.supplierId }"><input
                                                            type="button" value="Delete" disabled /></a>
                                                </sec:authorize>
                                            </li>


                                            <li>
                                                <sec:authorize
                                                    access="hasAnyRole('ADMIN','SUPPLIER_VIEW','SUPPLIER_EDIT','SUPPLIER_DELETE')">
                                                    <a
                                                        href="view_supplier_contacts_listing?supplierId=${supplier.supplierId }&leadId=${SEARCH_SUPPLIER.leadId}"><input
                                                            type="button" value="View Contacts" /></a>
                                                </sec:authorize>
                                            </li>
                                        </ul>
                                    </div>
                                </i>
                            </td>
                        </tr>
                    </c:forEach>
            </tbody>
        </table>

           	<div id="myModal" class="modal">
			
			  <!-- Modal content -->
			  <div class="modal-content">
			    <div class="modal-header">
			      <span class="close">&times;</span>
			      <br><h2 style="text-align:center;" id="modelheaderh2">Supplier Details</h2>
			    </div>
			    <div class="modal-body">
			
			
			    </div>
			    <div class="modal-footer"> </div>
			  </div>
			
			</div>	
           
    </div>


	<div id="pagination" align="center">
				<font size="3">  <span style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500">Page:</span>   
			    <c:url value="view_form_admin_search_supplier" var="prev"> 
			       <c:param name="page" value="${page-1}"/>
			    </c:url>
			    <c:if test="${page > 0}">
			        <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href="<c:out value="${prev}&sortBy=${sortBy}&supplierName=${SEARCH_SUPPLIER.supplierName}&cityId=${SEARCH_SUPPLIER.cityId}&cityName=${SEARCH_SUPPLIER.cityName}&serviceCityId=${SEARCH_SUPPLIER.serviceCityId}&serviceCityName=${SEARCH_SUPPLIER.serviceCityName}&flight=${SEARCH_SUPPLIER.flight}&hotel=${SEARCH_SUPPLIER.hotel}&transfers=${SEARCH_SUPPLIER.transfers}&sightseeing=${SEARCH_SUPPLIER.sightseeing}&visa=${SEARCH_SUPPLIER.visa}&insurance=${SEARCH_SUPPLIER.insurance}&cruise=${SEARCH_SUPPLIER.cruise}&consolidator=${SEARCH_SUPPLIER.consolidator}&landPackage=${SEARCH_SUPPLIER.landPackage}&leadId=${SEARCH_SUPPLIER.leadId}" />" class="pn prev">Prev</a>
			    </c:if>
			
			    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
			        <c:choose>
			            <c:when test="${(page+1) == i.index}">
			                <span pagination styling   style="background:black;padding:2px 5px;border-radius:2px;color:white">${i.index}</span>
			            </c:when>
			            <c:otherwise>
			                <c:url value="view_form_admin_search_supplier" var="url">
			                    <c:param name="page" value="${i.index-1}"/>
			                </c:url>
			                 <a pagination styling   style="padding:2px 5px;border-radius:2px;color:black" href='<c:out value="${url}&sortBy=${sortBy}&supplierName=${SEARCH_SUPPLIER.supplierName}&cityId=${SEARCH_SUPPLIER.cityId}&cityName=${SEARCH_SUPPLIER.cityName}&serviceCityId=${SEARCH_SUPPLIER.serviceCityId}&serviceCityName=${SEARCH_SUPPLIER.serviceCityName}&flight=${SEARCH_SUPPLIER.flight}&hotel=${SEARCH_SUPPLIER.hotel}&transfers=${SEARCH_SUPPLIER.transfers}&sightseeing=${SEARCH_SUPPLIER.sightseeing}&visa=${SEARCH_SUPPLIER.visa}&insurance=${SEARCH_SUPPLIER.insurance}&cruise=${SEARCH_SUPPLIER.cruise}&consolidator=${SEARCH_SUPPLIER.consolidator}&landPackage=${SEARCH_SUPPLIER.landPackage}&leadId=${SEARCH_SUPPLIER.leadId}" />'>${i.index}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:url value="view_form_admin_search_supplier" var="next">
			        <c:param name="page" value="${page + 1}"/>
			    </c:url>
			    <c:if test="${page + 1 < maxPages}">
			       <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href='<c:out value="${next}&sortBy=${sortBy}&supplierName=${SEARCH_SUPPLIER.supplierName}&cityId=${SEARCH_SUPPLIER.cityId}&cityName=${SEARCH_SUPPLIER.cityName}&serviceCityId=${SEARCH_SUPPLIER.serviceCityId}&serviceCityName=${SEARCH_SUPPLIER.serviceCityName}&flight=${SEARCH_SUPPLIER.flight}&hotel=${SEARCH_SUPPLIER.hotel}&transfers=${SEARCH_SUPPLIER.transfers}&sightseeing=${SEARCH_SUPPLIER.sightseeing}&visa=${SEARCH_SUPPLIER.visa}&insurance=${SEARCH_SUPPLIER.insurance}&cruise=${SEARCH_SUPPLIER.cruise}&consolidator=${SEARCH_SUPPLIER.consolidator}&landPackage=${SEARCH_SUPPLIER.landPackage}&leadId=${SEARCH_SUPPLIER.leadId}" />' class="pn next">Next</a>
			    </c:if>
			    </font>
			</div>
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