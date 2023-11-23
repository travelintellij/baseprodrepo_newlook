<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    	<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <title>view_user_permissions</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>

<div class="view_user_permissions container">
<c:forEach items="${ROLE_OBJ}" var="roleMap">
        <c:if test="${(roleMap.key ne 'PRIV')}">
            <h3 align="center"><b>${roleMap.key}</b></h3>
            <table style="width: 90%;">
                <tr style="background:#FFCF53">
                    <th style="background-color:#FFCF53;width:9%;">User</th>
                    <c:forEach var="roleList" items="${roleMap.value}">
                        <th style="width:9%;">${roleList.roleName}</th>
                    </c:forEach>
    
                    <c:forEach var="i" begin="${roleMap.value.size()}" end="8">
                        <th style="width:9%;">&nbsp;</th>
                    </c:forEach>
    
    
    
                    <th>Action</th>
                </tr>
    
                <c:forEach var="user" items="${ACTIVE_USERS_LIST}">
                    <c:if test="${! fn:containsIgnoreCase(user.roles, 'ADMIN')}">
                        <form:form action="update_update_user_permissions" modelAttribute="USER_OBJ">
                            <input type="hidden" name="userId" value="${user.userId}" />
                            <input type="hidden" name="roleName" value="${roleMap.key}" />
                            <tr>
                                <td style="width:9%;">${user.username}</td>
                                <c:forEach var="roleList" items="${roleMap.value}">
                                    <c:if test="${fn:containsIgnoreCase(user.roles, roleList.roleName)}">
                                        <td style="width:9%;">
                                            <form:checkbox path="roles" value="${roleList.roleId}" checked="checked" />
                                        </td>
                                    </c:if>
                                    <c:if test="${! fn:containsIgnoreCase(user.roles, roleList.roleName)}">
                                        <td style="width:9%;">
                                            <form:checkbox path="roles" value="${roleList.roleId}" />
                                        </td>
                                    </c:if>
                                </c:forEach>
                                <c:forEach var="i" begin="${roleMap.value.size()}" end="8">
                                    <td style="width:9%;">&nbsp;</td>
                                </c:forEach>
    
                                <td style="width:9%;"><input type="submit" style="background-color: blue;padding: 4px 5px;"
                                        value="Update Permission" /></td>
    
                            </tr>
                        </form:form>
                    </c:if>
                </c:forEach>
            </table>
            <hr>
        </c:if>
    </c:forEach></div>


    
    
    
</body>
</html>