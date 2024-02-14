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
      <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<style>
.autocomplete-suggestions { border: 1px solid #999; background: red;overflow-y:auto}
		.autocomplete-suggestion {padding: 2px 5px;color:white; background: black;overflow-y: auto;overflow-y:auto}
		.autocomplete-selected { background: #F0F0F0;overflow-y:auto} 
		.autocomplete-suggestions strong { font-weight: normal; color:black;overflow-y:auto}
		.autocomplete-group { padding: 2px 5px;overflow-y:auto}
		.autocomplete-group strong { display: block; border-bottom: 1px solid #000;  background: black ; color:black overflow-y:auto}
		.autocomplete-selected:hover{
		color:black
		}
		 body::before {
            content: "";
            background-image: url(${pageContext.request.contextPath}/resources/images/revamped/search_clients.jpg);
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
    <div class="container">
    
    
    
<div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>
        <div class="manage-client-wrapper bs">
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
                    <div class="sc-first-li cli-em-sec">
                        <div class="sc-first-li-d1 mp">
                            <label for="">Email </label> <br>
                            <input type="text" class="contact" id="email" name="email" placeholder="email"
                                value="${SEARCH_CLIENTS.email}" />
                        </div>
                        <div class="sc-first-li-d1 mp" >
                            <label for="">Active</label> <br>
                            <select id="active" name="active" class="anc-active" >
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
                       
                    </div>
                     <div class="sc-first-li-d1 due_today_task_data_btnss" style="margin-top:10px">
                            <input style="background-color:#32cd32;" type="submit" value="Apply Filter" />
                            <a href="view_form_admin_search_client"><input type="button" value="Clear Filter" /></a>
                        </div>
                </div>
                </form:form>
            </div>
        </div>
  
         </div>
        
        
           <div class="search-clients-sec bs">
            <c:set value="${CLIENTS_LIST}" var="clientList" />
            <table class="sc-table">
                <thead style="background:#6082B6;">
                    <tr style="height:50px;color:black">
                        <th class="sc-th" style="width: 110px;"><a
                                href="search_search_filtered_clients?sortBy=clientId&clientName=${clientName}&cityId=${cityId}&cityName=${cityName}&email=${email}&active=${active}" style="color:black">Client
                                Id</a></th>
                        <th class="sc-th" style="width:300px">Client Name</th>
                        <th class="sc-th">City</th>
                        <th class="sc-th" style="width: 120px;">Country</th>
                        <th class="sc-th">Email</th>
                        <th class="sc-th">Mobile</th>
                        <th class="sc-th" style="width: 35px;">Active</th>
                        <th class="sc-th" style="width: 105px;">Action</th>
                    </tr>
                    
                </thead>
                <c:forEach items="${clientList}" var="client">
                <tbody>
                    <tr>
                        <td  style="border-bottom:2px solid black;border-right:2px solid black;border-left:2px solid black">${client.clientId }</td>
                        <td style="border-bottom:2px solid black;border-right:2px solid black;">${client.clientName }</td>
                        <td  style="border-bottom:2px solid black;border-right:2px solid black;">${client.cityName }</td>
                        <td  style="border-bottom:2px solid black;border-right:2px solid black;">${client.countryName }</td>
                        <td  style="border-bottom:2px solid black;border-right:2px solid black;">${client.email }</td>
                        <td  style="border-bottom:2px solid black;border-right:2px solid black;">${client.mobile }</td>
                        <td  style="border-bottom:2px solid black;border-right:2px solid black;">${client.active }</td>
                        <td  style="border-bottom:2px solid black;border-right:2px solid black;">
                            <i class="fa-solid fa-sliders anc-i">
                                <div class="ul-anc">
                                    <ul>
                                        
                                            <sec:authorize
                                                access="hasAnyRole('ADMIN','CLIENT_VIEW','CLIENT_EDIT','CLIENT_DELETE')">
                                                <li>
                                                <a href="view_view_admin_client?clientId=${client.clientId}">View</a>
                                                </li>
                                            </sec:authorize>
                                        
                                       
                                            <sec:authorize access="hasAnyRole('ADMIN','CLIENT_EDIT')">
                                             <li>
                                                <a  href="view_edit_admin_client?clientId=${client.clientId}">Edit</a>
                                                </li>
                                            </sec:authorize>

                                            <sec:authorize access="! hasAnyRole('ADMIN','CLIENT_EDIT')">
                                             <li>
                                                <a href="view_edit_admin_client?clientId=${client.clientId}">Delete</a>
                                                 </li>
                                            </sec:authorize>
                                       
                                       
                                            <sec:authorize access="! hasAnyRole('ADMIN','CLIENT_DELETE')">
                                             <li>
                                                <a
                                                    href="view_view_delete_client_confirmation?clientId=${client.clientId}">Delete</a>
                                                     </li>
                                            </sec:authorize>
                                       
                                        
                                            <sec:authorize access="hasAnyRole('ADMIN','CLIENT_MANAGE_DOCS')">
                                            <li>
                                                <a
                                                    href="view_view_crud_client_docs?clientId=${client.clientId}">Docs</a>
                                                     </li>
                                            </sec:authorize>
                                       
                                       
                                            <sec:authorize access="! hasAnyRole('ADMIN','CLIENT_MANAGE_DOCS')">
                                             <li>
                                                <a
                                                    href="view_view_crud_client_docs?clientId=${client.clientId}">Docs</a>
                                                     </li>
                                            </sec:authorize>
                                       
                                    </ul>
                                </div>
                            </i>
                        </td> </tr>
                        </c:forEach>
                </tbody>
            </table>
          </div>

     


	<div id="pagination" align="center">
				<font size="3" style="color:#ffa500;background:black;display:inline-block;padding:2px;border-radius:2px">Page:  </font>
			    <c:url value="view_form_admin_search_client" var="prev">
			       <c:param name="page" value="${page-1}"/>
			    </c:url>
			    <c:if test="${page > 0}">
			        <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href="<c:out value="${prev}&sortBy=${sortBy}&clientName=${clientName}&cityId=${cityId}&cityName=${cityName}&email=${email}&active=${active}" />" class="pn prev">Prev</a>
			    </c:if>
			
			    <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
			        <c:choose>
			            <c:when test="${(page+1) == i.index}">
			                <span style="background:black;padding:2px 5px;border-radius:2px;color:white">${i.index}</span>
			            </c:when>
			            <c:otherwise>
			                <c:url value="view_form_admin_search_client" var="url">
			                    <c:param name="page" value="${i.index-1} "/>
			                </c:url>
			                 <a  style="padding:2px 5px;border-radius:2px;color:black" href='<c:out value="${url}&sortBy=${sortBy}&clientName=${clientName}&cityId=${cityId}&cityName=${cityName}&email=${email}&active=${active}" />'>${i.index}</a>
			            </c:otherwise>
			        </c:choose>
			    </c:forEach>
			    <c:url value="view_form_admin_search_client" var="next">
			        <c:param name="page" value="${page + 1}"/>
			    </c:url>
			    <c:if test="${page + 1 < maxPages}">
			       <a  style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href='<c:out value="${next}&sortBy=${sortBy}&clientName=${clientName}&cityId=${cityId}&cityName=${cityName}&email=${email}&active=${active}" />' class="pn next">Next</a>
			    </c:if>
			    
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