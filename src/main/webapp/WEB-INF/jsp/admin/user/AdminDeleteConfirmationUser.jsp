<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin delete confirmation user</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body   style="background: url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">

    <div class="AdminDisplayUser container">
        <div class="AdminDisplayUser_wrapper">
        <form:form method="post" action="delete_delete_admin_user" modelAttribute="userobj">
            <div class="AdminDisplayUser_wrapper_data">
                <div class="AdminDisplayUser_wrapper_data_line">
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Record Id</label>
                        <p>${userobj.userId}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Login Id</label>
                        <p>${userobj.username}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Password</label> <br>
                        <p>${userobj.password}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Primary Role</label>
                        <p>${userobj.roles}</p>
                    </div>
                </div>
                <div class="AdminDisplayUser_wrapper_data_line">
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">User Full Name</label>
                        <p>${userobj.name}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Address</label>
                        <p>${userobj.address}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Company Email</label>
                        <p>${userobj.email}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Company Mobile</label>
                        <p>${userobj.mobile}</p>
                    </div>
                </div>
                <div class="AdminDisplayUser_wrapper_data_line">
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Designation</label>
                        <p>${userobj.designation}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Type</label>
                        <p>${userobj.type}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Shift</label>
                        <p>${userobj.shift}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Fixed Incentive</label>
                        <p>${userobj.fixedIncentive}</p>
                    </div>
                </div>
                <div class="AdminDisplayUser_wrapper_data_line">
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Pan Card</label>
                        <p>${userobj.panCard}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Aadhar Card</label>
                        <p>${userobj.aadharCard}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Marial Status</label>
                        <p>${userobj.maritalStatus}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Gender</label>
                        <p>${userobj.gender}</p>
                    </div>
                </div>
                <div class="AdminDisplayUser_wrapper_data_line">

                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Date of Birth</label> <br>
                        <fmt:formatDate value="${userobj.dob}" pattern="dd-MM-yyyy" />
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Date of Joining</label> <br>
                        <fmt:formatDate value="${userobj.doj}" pattern="dd-MM-yyyy" />
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Personal Email</label>
                        <p>${userobj.personalEmail}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Personal Mobile</label>
                        <p>${userobj.personalMobile}</p>
                    </div>
                </div>
                <div class="AdminDisplayUser_wrapper_data_line">
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Active</label>
                        <p>${userobj.active}</p>
                    </div>
                </div>
                <div class="AdminDisplayUser_wrapper_data_line">
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Remarks</label>
                        <p>${userobj.remarks}</p>
                    </div>
                </div>
                <div class="due_today_task_data_btns">
                    <sec:authorize access="hasAnyRole('ADMIN','USER_DELETE')">
                        <input type="submit" value="Confirm Delete" style="background:red;color:white;border:2px solid black">
                    </sec:authorize>

                    <sec:authorize access="hasAnyRole('ADMIN','USER_EDIT')">
                        <a href="view_edit_Admin_User?userId=${userobj.userId}">Edit User</a>
                    </sec:authorize>
                    <a href="view_search_admin_user">User Listings</a>
                </div>
                <input type="hidden" name="active" value="true" />
                <input type="hidden" name="userId" value="${userobj.userId}" />
            </div>
            </form:form>
        </div>
    </div>

</body>

</html>