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
<style>

        body::before {
            content: "";
            background-image: url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);
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

    <div class="AdminDisplayUser container">
        <div class="AdminDisplayUser_wrapper bs">
        <form:form method="post" action="delete_delete_admin_user" modelAttribute="userobj">
            <div class="AdminDisplayUser_wrapper_data">
            <h1 class="hd" style="color:red;font-weight:600">Delete User</h1>
                <div class="AdminDisplayUser_wrapper_data_line a">
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Record Id</label>
                        <p style="color:gray;font-weight:bold;font-weight:bold">${userobj.userId}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Login Id</label>
                        <p style="color:gray;font-weight:bold;font-weight:bold">${userobj.username}</p>
                    </div>
                     <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">User Full Name</label>
                        <p style="color:gray;font-weight:bold;font-weight:bold">${userobj.name}</p>
                    </div>
                    
                    
                </div>
                <div class="AdminDisplayUser_wrapper_data_l1  a" style="text-align:start">
                        <label for="">Password</label> <br>
                        <p style="color:gray;font-weight:bold">${userobj.password}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1 a" style="text-align:start">
                        <label for="">Primary Role</label>
                        <p style="color:gray;font-weight:bold">${userobj.roles}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1 a"  style="text-align:start">
                        <label for="">Address</label>
                        <p style="color:gray;font-weight:bold">${userobj.address}</p>
                    </div>
                <div class="AdminDisplayUser_wrapper_data_line a">
                   
                    
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Company Email</label>
                        <p style="color:gray;font-weight:bold">${userobj.email}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Company Mobile</label>
                        <p style="color:gray;font-weight:bold">${userobj.mobile}</p>
                    </div>
                </div>
                <div class="AdminDisplayUser_wrapper_data_line a">
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Designation</label>
                        <p style="color:gray;font-weight:bold">${userobj.designation}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Type</label>
                        <p style="color:gray;font-weight:bold">${userobj.type}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Shift</label>
                        <p style="color:gray;font-weight:bold">${userobj.shift}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Fixed Incentive</label>
                        <p style="color:gray;font-weight:bold">${userobj.fixedIncentive}</p>
                    </div>
                </div>
                <div class="AdminDisplayUser_wrapper_data_line a">
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Pan Card</label>
                        <p style="color:gray;font-weight:bold">${userobj.panCard}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Aadhar Card</label>
                        <p style="color:gray;font-weight:bold">${userobj.aadharCard}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Marial Status</label>
                        <p style="color:gray;font-weight:bold">${userobj.maritalStatus}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Gender</label>
                        <p style="color:gray;font-weight:bold">${userobj.gender}</p>
                    </div>
                </div>
                <div class="AdminDisplayUser_wrapper_data_line a">

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
                        <p style="color:gray;font-weight:bold">${userobj.personalEmail}</p>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Personal Mobile</label>
                        <p style="color:gray;font-weight:bold">${userobj.personalMobile}</p>
                    </div>
                </div>
                <div class="AdminDisplayUser_wrapper_data_line a">
                    <div class="AdminDisplayUser_wrapper_data_l1">
                        <label for="">Active</label>
                        <p style="color:gray;font-weight:bold">${userobj.active}</p>
                    </div>
                </div>
                <div class="AdminDisplayUser_wrapper_data_line a" style="width:100%">
                    <div class="AdminDisplayUser_wrapper_data_l1" style="width:100%">
                        <label for="">Remarks</label>
                        <p style="color:gray;font-weight:bold;width:100%">${userobj.remarks}</p>
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