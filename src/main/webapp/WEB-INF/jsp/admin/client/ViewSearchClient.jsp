<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Clients</title>
    
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
</head>

<body
    style="background: url(${pageContext.request.contextPath}/resources/images/revamped/search_clients.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
    <div class="container">
        <div class="manage-client-wrapper">
            <h1 class="search-clients">Search Client</h1>
            <font color="green"> ${Success} </font>
            <font color="red"> ${Error}</font>
            <div class="search-client-form">
                <form:form modelAttribute="SEARCH_CLIENTS" action="search_search_filtered_clients">
                <div class="sc-first-li">
                    <div class="sc-first-li-d1">
                        <label for="clientId">Client Id</label>
                        <input type="number" class="contact" id="clientId" name="clientId" placeholder="clientId"
                            min="0" value="${SEARCH_CLIENTS.clientId}" />
                    </div>
                    <div class="sc-first-li-d1">
                        <label for="">Client Name</label>
                        <input type="text" class="contact" id="clientName" name="clientName" size="35" placeholder="clientName" value="${SEARCH_CLIENTS.clientName}" />
                    </div>
                    <div class="sc-first-li-d1">
                        <label for="">City Name</label>
                        <input type="text" class="contact" id="cityName" name="cityName" size="35"
                            placeholder="City / Country" value="${SEARCH_CLIENTS.cityName}" />
                        <input type="hidden" name="cityId" value="${SEARCH_CLIENTS.cityId}" />
                    </div>
                    <div class="sc-first-li-d1">
                        <label for="">Contact Number</label>
                        <input type="number" class="contact" id="contactNumber" name="contactNumber" min="0" size="20"
                            placeholder="Contact Number" value="${SEARCH_CLIENTS.contactNumber}" />
                    </div>
                </div>
                <div class="search-client-form">
                    <div class="sc-first-li">
                        <div class="sc-first-li-d1">
                            <label for="">Email</label> <br>
                            <input type="text" class="contact" id="email" name="email" placeholder="email"
                                value="${SEARCH_CLIENTS.email}" />
                        </div>
                        <div class="sc-first-li-d1">
                            <label for="">Active</label> <br>
                            <select id="active" name="active" class="anc-active">
                                <c:if test="${active eq true }">
                                    <option value="true" selected>
                                        <c:out value="True" />
                                    </option>
                                    <option value="false">
                                        <c:out value="False" />
                                    </option>
                                </c:if>
                                <c:if test="${active eq false}">
                                    <option value="true">
                                        <c:out value="True" />
                                    </option>
                                    <option value="false" selected>
                                        <c:out value="False" />
                                    </option>

                                </c:if>
                            </select>
                        </div>
                        <div class="sc-first-li-d1 sc-btns">
                            <a href="">Apply filter</a>
                            <a href="view_form_admin_search_client">Clear Filter</a>
                        </div>
                    </div>
                </div>
                </form:form>
            </div>
        </div>
        

        
         </div>
        
        
           <div class="search-clients-sec">
            <c:set value="${CLIENTS_LIST}" var="clientList" />
            <table class="sc-table">
                <thead>
                    <tr>
                        <th class="sc-th" style="width: 110px;"><a
                                href="search_search_filtered_clients?sortBy=clientId&clientName=${clientName}&cityId=${cityId}&cityName=${cityName}&email=${email}&active=${active}" style="color:#FFBA08">Client
                                Id</a></th>
                        <th class="sc-th" style="width:300px">Client Name</th>
                        <th class="sc-th">City</th>
                        <th class="sc-th" style="width: 120px;">Country</th>
                        <th class="sc-th">Email</th>
                        <th class="sc-th">Mobile</th>
                        <th class="sc-th" style="width: 30px;">Active</th>
                        <th class="sc-th" style="width: 110px;">Action</th>
                    </tr>
                    
                </thead>
                <c:forEach items="${clientList}" var="client">
                <tbody>
                    <tr>
                        <td>${client.clientId }</td>
                        <td>${client.clientName }</td>
                        <td>${client.cityName }</td>
                        <td>${client.countryName }</td>
                        <td>${client.email }</td>
                        <td>${client.mobile }</td>
                        <td>${client.active }</td>
                        <td>
                            <i class="fa-solid fa-sliders anc-i">
                                <div class="ul-anc">
                                    <ul>
                                        <li>
                                            <sec:authorize
                                                access="hasAnyRole('ADMIN','CLIENT_VIEW','CLIENT_EDIT','CLIENT_DELETE')">
                                                <a href="view_view_admin_client?clientId=${client.clientId}">View</a>
                                            </sec:authorize>
                                        </li>
                                        <li>
                                            <sec:authorize access="hasAnyRole('ADMIN','CLIENT_EDIT')">
                                                <a href="view_edit_admin_client?clientId=${client.clientId}">Edit</a>
                                            </sec:authorize>
                                        </li>
                                        <li>
                                            <sec:authorize access="! hasAnyRole('ADMIN','CLIENT_EDIT')">
                                                <a href="view_edit_admin_client?clientId=${client.clientId}">Delete</a>
                                            </sec:authorize>
                                        </li>
                                        <li>
                                            <sec:authorize access="! hasAnyRole('ADMIN','CLIENT_DELETE')">
                                                <a
                                                    href="view_view_delete_client_confirmation?clientId=${client.clientId}">Delete</a>
                                            </sec:authorize>
                                        </li>
                                        <li>
                                            <sec:authorize access="hasAnyRole('ADMIN','CLIENT_MANAGE_DOCS')">
                                                <a
                                                    href="view_view_crud_client_docs?clientId=${client.clientId}">Docs</a>
                                            </sec:authorize>
                                        </li>
                                        <li>
                                            <sec:authorize access="! hasAnyRole('ADMIN','CLIENT_MANAGE_DOCS')">
                                                <a
                                                    href="view_view_crud_client_docs?clientId=${client.clientId}">Docs</a>
                                            </sec:authorize>
                                        </li>
                                    </ul>
                                </div>
                            </i>
                        </td> </tr>
                        </c:forEach>
                </tbody>
            </table>
          </div>

     


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


        <script>
            $('#cityName').autocomplete({
                serviceUrl: '${pageContext.request.contextPath}/getCityList',
                paramName: "cityName",
                delimiter: ",",
                onSelect: function (suggestion) {
                    cityID = suggestion.data;
                    id = cityID;
                    jQuery("#destinationId").val(cityID);
                    $('input[name=cityId]').val(id);
                    return false;
                },
                transformResult: function (response) {
                    return {
                        suggestions: $.map($.parseJSON(response), function (item) {
                            return {
                                value: item.cityName,
                                data: item.destinationId
                            };
                        })

                    };
                }
            });


        </script>

</body>

</html>