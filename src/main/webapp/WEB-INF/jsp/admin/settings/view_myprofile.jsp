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
    <title>view_myprofile</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    	<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
</head>

<body
    style="background: url(${pageContext.request.contextPath}/resources/images/revamped/view_myprofile_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
    <div class="view_profile_side_menu">
        <ul class="view_profile_side_ul">
            <li><a href="view_form_my_profile" style="color:#FABA08">My Profile</a></li>
            <li><a href="view_form_change_password">Change Password</a></li>
            <li><a href="view_form_manage_permissions">Permissions</a></li>
            <li><a href="#">Email Settings</a></li>
        </ul>
    </div>

    <div class="view_myprofile container_view_p">
        <div class="view_myprofile_wrapper">
            <form:form action="view_open_task_form_user" modelAttribute="TASK_FILTER_OBJ">
                <div align="center"><b>
                        <font color="green"> ${Success} </font>
                        <font color="red"> ${Error}</font>
                    </b></div>
                <div class="view_myprofile_wrapper_data">
                    <div class="view_myprofile_wrapper_data_line">
                        <div class="view_myprofile_wrapper_data_line_l1_pic">
                            <img src="${pageContext.request.contextPath}/resources/images/${USER_OBJ.username}.jpg" alt="">
                        </div>
                        <div class="other_data_view_profie">
                            <div class="view_myprofile_wrapper_data_l1">
                                <label for="">User Name</label>
                                <p>${USER_OBJ.username}</p>
                            </div>
                            <div class="view_myprofile_wrapper_data_l1">
                                <label for="">Name</label>
                                <p>${USER_OBJ.name }</p>
                            </div>
                            <div class="view_myprofile_wrapper_data_l1">
                                <label for="">Designtion</label>
                                <p>${USER_OBJ.designation}</p>
                            </div>
                            <div class="view_myprofile_wrapper_data_l1">
                                <label for="">Date of Joining</label>
                                <p>
                                    <fmt:formatDate value="${USER_OBJ.doj }" pattern="dd-MM-yyyy" />
                                </p>
                            </div>
                            <div class="view_myprofile_wrapper_data_l1">
                                <label for="">Fixed Incentive</label>
                                <p>${USER_OBJ.fixedIncentive}</p>
                            </div>
                        </div>
                        <div class="other_data_view_profie2">
                            <div class="view_myprofile_wrapper_data_l1">
                                <label for="">System User</label>
                                <p>
                                    <c:if test="${fn:containsIgnoreCase(USER_OBJ.roles, 'User')}">
                                        User
                                    </c:if>
                                    <c:if test="${fn:containsIgnoreCase(USER_OBJ.roles, 'Admin')}">
                                        Admin
                                    </c:if>
                                </p>
                            </div>
                            <div class="view_myprofile_wrapper_data_l1">
                                <label for="">Address</label>
                                <p>${USER_OBJ.address }</p>
                            </div>
                            <div class="view_myprofile_wrapper_data_l1">
                                <label for="">Bank Account</label>
                                <p></p>
                            </div>
                        </div>
                    </div>
            </form:form>
        </div>
    </div>

</body>

</html>