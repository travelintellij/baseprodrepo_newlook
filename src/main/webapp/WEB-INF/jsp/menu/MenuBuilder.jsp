<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<jsp:include page="AdminMenu.jsp" />
</sec:authorize>
<sec:authorize access="hasRole('ROLE_USER')">
	<jsp:include page="UserMenu.jsp" />
</sec:authorize>