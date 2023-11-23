<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>view_changepassword</title>
    	<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body
  style="background: url(${pageContext.request.contextPath}/resources/images/revamped/view_changepassword.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">


    <div class="view_profile_side_menu">
        <ul class="view_profile_side_ul">
            <li><a href="view_form_my_profile">My Profile</a></li>
            <li><a href="view_form_change_password" style="color:#FABA08">Change Password</a></li>
            <li><a href="view_form_manage_permissions">Permissions</a></li>
            <li><a href="#">Email Settings</a></li>
        </ul>
    </div>


    <div class="view_changepassword container">
        <div class="view_changepassword_wrapper">
            <form:form action="update_update_password" modelAttribute="USER_OBJ">
                <h1 class="page-heading">Reset Password</h1>
                <div align="center"><b>
                        <font color="green"> ${Success} </font>
                        <font color="red"> ${Error}</font>
                    </b></div>
                <div class="view_changepassword_wrapper_data">
                    <div class="view_changepassword_wrapper_data_line">
                        <div class="view_changepassword_wrapper_data_l1">
                            <label for="">Current Password</label> <br>
                            <input type="password" name="currentPassword" maxlength="20" required />
                            <font color="red">
                                <form:errors path="currentPassword" cssClass="error" />
                            </font>
                        </div>
                        <div class="view_changepassword_wrapper_data_l1">
                            <label for="">New Password</label> <br>
                            <input type="password" name="changedPassword" minlength="8" maxlength="20" required />
                            <font color="red">
                                <form:errors path="changedPassword" cssClass="error" />
                            </font>
                        </div>
                        <div class="view_changepassword_wrapper_data_l1">
                            <label for="">Confirm Password</label> <br>
                            <input type="password" name="passwordConfirm" minlength="8" maxlength="20" required />
                        </div>
                    </div>
                    <div class="due_today_task_data_btns">
                        <input background-color: green" type="submit" value="Change Password" />
                    </div>
                </div>
            </form:form>
        </div>
    </div>
</body>

</html>