<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AdminDisplayUser</title>
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
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <form:form method="post" action="view_edit_Admin_User" modelAttribute="userobj">
                <div class="AdminDisplayUser_wrapper_data">
                    <div class="AdminDisplayUser_wrapper_data_line a " >
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Record Id</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.userId}</p>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Login Id</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.username}</p>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Password</label>
                            <p style="color:#023e8a;font-weight:800">Confidential (Encrypted)</p>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Primary Role</label>
                            <p style="color:#023e8a;font-weight:800">
                                <c:if test="${fn:containsIgnoreCase(userobj.roles, 'User')}">
                                    User
                                </c:if>
                                <c:if test="${fn:containsIgnoreCase(userobj.roles, 'Admin')}">
                                    Admin
                                </c:if>
                            </p>
                        </div>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_line  a">
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">User Full Name</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.name}</p>
                        </div>
                        
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Company Email</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.email}</p>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Company Mobile</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.mobile}</p>
                        </div>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_l1 a" style="text-align:start">
                            <label for="">Address</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.address}</p>
                        </div>
                    <div class="AdminDisplayUser_wrapper_data_line  a">
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Designation</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.designation}</p>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Type</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.type}</p>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">${userobj.shift}</label>
                            <p style="color:#023e8a;font-weight:800">Dumm</p>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Fixed Incentive</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.fixedIncentive}</p>
                        </div>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_line  a">
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Pan Card</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.panCard}</p>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Aadhar Card</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.aadharCard}</p>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Marial Status</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.maritalStatus}</p>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Gender</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.gender}</p>
                        </div>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_line  a">
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Deleted</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.deleted}</p>
                        </div> 
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Account Locked</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.accountLocked}</p>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Date of Birth</label>
                            <p style="color:#023e8a;font-weight:800">
                                <fmt:formatDate value="${userobj.dob}" pattern="dd-MM-yyyy" />
                            </p>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Date of Joining</label>
                            <p style="color:#023e8a;font-weight:800">
                                <fmt:formatDate value="${userobj.doj}" pattern="dd-MM-yyyy" />
                            </p>
                        </div>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_line  a">
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Personal Email</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.personalEmail}</p>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Personal Mobile</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.personalMobile}</p>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Active</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.active}</p>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Account Expired</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.accountExpired}</p>
                        </div>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_line  a">
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="">Credentials Expired</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.credentialsExpired}</p>
                        </div>
                    </div>
                   
                        <div class="AdminDisplayUser_wrapper_data_l1 a" style="text-align:start">
                            <label for="">Remarks</label>
                            <p style="color:#023e8a;font-weight:800">${userobj.remarks}</p>
                        </div>
                  
                    <div class="due_today_task_data_btns">
                        <sec:authorize access="hasAnyRole('ADMIN','USER_EDIT')">
                            <input type="submit" value="Edit User">
                        </sec:authorize>
                        <a href="view_workloadhome">Home</a>
                        <a href="view_search_admin_user">User Listing</a>
                    </div>
                    <input type="hidden" name="active" value="true" />
                    <input type="hidden" name="userId" value="${userobj.userId}" />
                </div>
            </form:form>
        </div>
    </div>



</body>

</html>