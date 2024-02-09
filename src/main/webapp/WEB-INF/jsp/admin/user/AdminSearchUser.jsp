<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<jsp:include page="../../menu/MenuBuilder.jsp" />
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AdminSearchUser</title>
       <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
        <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
</head>
<style>
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
    <div class="AdminSearchUser container">
        <div class="AdminSearchUser_wrapper">
            <h1 class="page-heading">Search User</h1>
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <form:form modelAttribute="SEARCH_USER" action="search_search_filtered_User">
                <div class="AdminSearchUser_wrapper_data">
                    <div class="AdminSearchUser_wrapper_data_line">
                        <div class="AdminSearchUser_wrapper_data_l1_id">
                            <label for="">Id</label>
                            <input type="number" class="contact" id="userId" name="userId" placeholder="userId"
                                value="${SEARCH_USER.userId}" />
                        </div>
                        <div class="AdminSearchUser_wrapper_data_l1">
                            <label for="">User Name</label>
                            <input type="text" class="contact" id="username" name="username" value="" size="35"
                                placeholder="username" value="${SEARCH_USER.username}" />
                        </div>
                        <div class="AdminSearchUser_wrapper_data_l1">
                            <label for="">Name</label>
                            <input type="text" class="contact" id="name" name="name" size="35" placeholder="Name"
                                value="${SEARCH_USER.name}" />
                        </div>
                        <div class="AdminSearchUser_wrapper_data_l1">
                            <label for="">Joining Date Range</label>
                            <input type="date" name="joiningFromDate" value="${SEARCH_USER.joiningFromDate}" />
                        </div>
                        <div class="AdminSearchUser_wrapper_data_l1">
                            <br>
                            <input type="date" name="joiningToDate" value="${SEARCH_USER.joiningToDate}" />
                        </div>
                    </div>
                    <div class="due_today_task_data_btns">
                        <input type="submit" value="Apply Filter" />
                        <a href="view_search_admin_user">Clear Filter</a>
                    </div>
                </div>
            </form:form>
        </div>
        <!-- ################# table starts here ##################### -->
        <c:set value="${USERS_LIST}" var="userList" />
        <table class="admin-search-user-tabel">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>User ID</th>
                    <th>User Name</th>
                    <th>Date of Joining</th>
                    <th>Designation</th>
                    <th>Role</th>
                    <th>Active</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <!-- <tr>
                    <td>1</td>
                    <td>ashish</td>
                    <td>ashish pathania</td>
                    <td>11/09/2023</td>
                    <td>front end devloper</td>
                    <td>user</td>
                    <td>true</td>
                    <td>
                    <i class="fa-solid fa-sliders adsu">
                        <div class="admin-search_user">
                            <ul class="admin-search_user_lis" >
                                <li><a href="">View</a></li>
                                <li><a href="">Edit</a></li>
                                <li><a href="">Delete</a></li>
                                <li><a href="">Docs</a></li>
                            </ul>
                        </div>
                    </i>
                    </td>
                </tr>
                Add more rows with data as needed -->

                <c:forEach items="${userList}" var="user">
                    <tr>
                        <td style="border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53;border-left:2px solid #FFCF53">${user.userId}</td>
                        <td style="border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53;">${user.username}</td>
                        <td style="border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53;">${user.name}</td>
                        <td style="border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53;">
                            <fmt:formatDate value="${user.doj}" pattern="dd-MM-yyyy" />
                        </td style="border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53;">
                        <td style="border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53;">${user.designation}</td>
                        <td style="border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53;">
                            <c:if test="${fn:containsIgnoreCase(user.roles, 'ADMIN')}">
                                Admin
                            </c:if>
                            <c:if test="${!fn:containsIgnoreCase(user.roles, 'ADMIN')}">
                                User
                            </c:if>

                        </td>

                        <td style="border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53;">${user.active}</td>
                        <td style="border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53;">


                            <i class="fa-solid fa-sliders adsu">
                                        <div class="admin-search_user">
                                          
                            <sec:authorize access="hasAnyRole('ADMIN','USER_VIEW','USER_EDIT','USER_DELETE')">
                                <a href="view_view_Admin_User?userId=${user.userId}"><input type="button"
                                        value="View" /></a>
                            </sec:authorize>


                            <sec:authorize access="hasAnyRole('ADMIN','USER_EDIT')">
                                <c:choose>
                                    <c:when
                                        test="${(!fn:containsIgnoreCase(LOGGED_USER.roles, 'ADMIN')) and (user.userId eq LOGGED_USER.userId)}">
                                        <a href="view_edit_Admin_User?userId=${user.userId}"><input type="button"
                                           class="user_btn"   value="Edit"
                                                disabled /></a>
                                    </c:when>
                                    <c:when test="${fn:containsIgnoreCase(LOGGED_USER.roles, 'ADMIN')}">
                                         <a href="view_edit_Admin_User?userId=${user.userId}"><input type="button"
                                           class="user_btn"    value="Edit" /></a>
                                    </c:when>
                                    <c:when
                                        test="${ (! fn:containsIgnoreCase(LOGGED_USER.roles, 'ADMIN') and fn:containsIgnoreCase(user.roles, 'ADMIN'))}">
                                         <a href="view_edit_Admin_User?userId=${user.userId}"><input type="button"
                                         class="user_btn"    value="Edit"
                                                disabled /></a>
                                    </c:when>
                                    <c:when
                                        test="${ (! fn:containsIgnoreCase(LOGGED_USER.roles, 'ADMIN') and (!fn:containsIgnoreCase(user.roles, 'ADMIN')))}">
                                       <a href="view_edit_Admin_User?userId=${user.userId}"><input type="button"
                                             class="user_btn"    value="Edit" /></a>
                                    </c:when>
                                    <c:otherwise>
                                         <a href="view_edit_Admin_User?userId=${user.userId}"><input type="button"
                                              style="background:transparent;border:none;outline:none;color: white;font-weight: normal;transition: all 0.2s ease-in-out;"   value="Edit" /></a>
                                    </c:otherwise>
                                </c:choose>
                            </sec:authorize>
                            <sec:authorize access="hasAnyRole('ADMIN','USER_DELETE')">
                                <c:if test="${user.userId ne LOGGED_USER.userId }">
                                    <c:choose>
                                        <c:when
                                            test="${ (! fn:containsIgnoreCase(LOGGED_USER.roles, 'ADMIN') and fn:containsIgnoreCase(user.roles, 'ADMIN'))}">
                                             <a href="view_view_delete_User_confirmation?userId=${user.userId}"><input
                                             class="user_btn"  type="button" 
                                                    value="Delete" disabled /></a>
                                        </c:when>
                                        <c:when
                                            test="${ (! fn:containsIgnoreCase(LOGGED_USER.roles, 'ADMIN') and (!fn:containsIgnoreCase(user.roles, 'ADMIN')))}">
                                             <a href="view_view_delete_User_confirmation?userId=${user.userId}"><input
                                              class="user_btn"      type="button" 
                                                    value="Delete" /></a>
                                        </c:when>
                                        <c:when test="${ user.deleted eq true }">
                                             <font color="red">Deleted</font>
                                        </c:when>
                                        <c:otherwise>
                                             <a href="view_view_delete_User_confirmation?userId=${user.userId}"><input
                                                type="button" 
                                                class="user_btn"    value="Delete" /></a>
                                        </c:otherwise>
                                    </c:choose>
                                </c:if>

                                <c:if test="${user.userId eq LOGGED_USER.userId }">
                                    <a href="view_view_delete_User_confirmation?userId=${user.userId}"><input
                                      class="user_btn"   class="user_btn"  type="button" 
                                            value="Delete" disabled /></a>
                                </c:if>
                            </sec:authorize>

                            <sec:authorize access="hasAnyRole('ADMIN','USER_MANAGE_DOCS')">
                                <a  href="view_view_crud_user_docs?userId=${user.userId}"><input type="button"
                                  class="user_btn" value="Docs" /></a>
                            </sec:authorize>
                                        </div>
                                    </i>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>

</html>