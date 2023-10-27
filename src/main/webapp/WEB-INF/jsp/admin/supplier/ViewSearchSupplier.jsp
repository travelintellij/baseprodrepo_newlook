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
</head>

<body
    style="background: url(${pageContext.request.contextPath}/resources/images/revamped/search_supplier_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
    <div class="search_supplier container">
        <div class="serach_supplier_wrapper">
            <h1>Search Supplier</h1>
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
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
        </div>
    </div>
    </form:form>

    <div class="search_suppler_table">
        <table>
            <thead>
                <tr>
                    <th style="width: 100px;">Supplier Id</th>
                    <th>Supplier Name</th>
                    <th style="width:170px;">City</th>
                    <th style="width: 300px;">Email</th>
                    <th style="width: 200px;">Mobile</th>
                    <th style="width: 200px;">Destinations</th>
                    <th style="width: 200px;">Services</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <!-- <tr>
                    <td>--</td>
                    <td>--</td>
                    <td>--</td>
                    <td>--</td>
                    <td>--</td>
                    <td>--</td>
                    <td>--</td>
                    <td class="search_supplier_iicon">
                        <i class="fa-solid fa-sliders st1">
                            <div class="search_supplier_ul">
                                <ul>
                                    <li><a href="" class="ss-pop-up">FollowUp</a></li>
                                    <li><a href="" class="ss-pop-up">Edit</a></li>
                                    <li><a href="">Request
                                            Quote</a></li>
                                    <li><a href="" class="ss-pop-up">Quotations</a>
                                    </li>
                                    <li><a href="" class="ss-pop-up">Reminder</a></li>
                                </ul>
                            </div>
                        </i>
                    </td>
                </tr> -->

                <c:set value="${SUPPLIER_LIST}" var="supplierList" />
                <table style="width:95%;">
                    <!-- <tr>
                        <th style="width:5%;background-color:steelblue;">Supplier Id</th>
                        <th style="width:15%;background-color:steelblue;">Supplier Name</th>
                        <th style="width:10%;background-color:steelblue;">City</th>
                        <th style="width:15%;background-color:steelblue;">Email</th>
                        <th style="width:8%;background-color:steelblue;">Mobile</th>
                        <th style="width:15%;background-color:steelblue;">Destinations</th>
                        <th style="width:15%;background-color:steelblue;">Services</th>
                        <th style="width:17%;background-color:steelblue;">Action</th>
                    </tr> -->
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


                            <td class="search_supplier_iicon">
                                <i class="fa-solid fa-sliders st1">
                                    <div class="search_supplier_ul">
                                        <ul>
                                            <li>
                                                <sec:authorize
                                                    access="hasAnyRole('ADMIN','SUPPLIER_VIEW','SUPPLIER_EDIT','SUPPLIER_DELETE')">
                                                    <a id="myBtn[${supplier.supplierId}]" onclick="contactDisplay(this)"
                                                        data-load-url="view_supplier_details_modal?supplierId=${supplier.supplierId }"
                                                        data-toggle="modal" data-target="#myModal"><input type="button"
                                                            value="View" /></a>
                                                </sec:authorize>
                                            </li>



                                            <li>
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


                                            <li>
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
                <!-- <div class="modal-content">
                    <div class="modal-header">
                        <span class="close">&times;</span>
                        <br>
                        <h2 style="text-align:center;" id="modelheaderh2">Supplier Details</h2>
                    </div>
                    <div class="modal-body">
            
            
                    </div>
                    <div class="modal-footer">
                        <h3>Powered by @TravelIntelliJ</h3>
                    </div>
                </div> -->
            
            </div>
            </table>
    </div>


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


</body>

</html>