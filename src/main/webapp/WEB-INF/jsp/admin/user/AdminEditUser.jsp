<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AdminEditUser</title>
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
            <h1 class="hd" style="font-weight:600">Edit User (Id: ${USER_OBJ.userId})</h1>
            <div class="AdminDisplayUser_wrapper_data">
                <form:form method="post" action="edit_edit_Admin_User" modelAttribute="USER_OBJ">
                    <form:hidden path="userId" />
                    <div align="center"><b>
                            <font color="green"> ${Success} </font>
                            <font color="red"> ${Error}</font>
                        </b></div>
                    <div class="AdminDisplayUser_wrapper_data_line">
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Record Id</label>
                            <form:input path="username" maxlength="20" style="width:90%"/>
                            <font color="red">
                                <form:errors path="username" cssClass="error" />
                            </font>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Password</label>
                            <form:password path="password" showPassword="true" style="width:90%" />
                            <font color="red">
                                <form:errors path="password" cssClass="error" />
                            </font>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Confirm Password</label>
                            <form:password path="passwordConfirm" showPassword="true" style="width:90%"/>
                            <form:errors path="passwordConfirm" cssClass="error" />
                            </font>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Role</label> <br>
                            <c:forEach var="userRoles" items="${USER_OBJ.roles}">
                                <c:if test="${userRoles.roleTarget eq 'PRIV' }">
                                    <c:if test="${userRoles.roleName eq 'ADMIN' }">
                                        <input type="radio" id="roleId" name="roleId" value="2"> User &nbsp;&nbsp;
                                        <input type="radio" id="roleId" name="roleId" value="1" checked> Admin
                                    </c:if>
                                    <c:if test="${userRoles.roleName eq 'USER' }">
                                        <input type="radio" id="roleId" name="roleId" value="2" checked> User
                                        &nbsp;&nbsp;
                                        <input type="radio" id="roleId" name="roleId" value="1"> Admin
                                    </c:if>
                                </c:if>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_line">
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">User Full Name</label>
                            <form:input path="name" style="width:90%" />
                            <font color="red">
                                <form:errors path="name" cssClass="error" />
                            </font>
                        </div>
                       
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Company Email</label>
                            <form:input path="email"  style="width:90%"/><br>
                            <font color="red">
                                <form:errors path="email" cssClass="error" />
                            </font>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Company Mobile</label>
                            <form:input path="mobile" type="number" required="required"  style="width:90%"/> <br>
                            <font color="red">
                                <form:errors path="mobile" cssClass="error" />
                            </font>
                        </div>
                        
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Credentials Expired</label>
                            <form:select path="credentialsExpired"  style="width:90%">
                                <form:options items="${ACTIVE_MAP}" class="service-small" />
                            </form:select>
                        </div>
                  
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_line">
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Designation</label>
                            <form:input path="designation"  style="width:90%"/> <br>
                            <font color="red">
                                <form:errors path="designation" cssClass="error" />
                            </font>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Type</label>
                            <form:select path="type"  style="width:90%">
                                <form:options items="${EMP_TYPE_MAP}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Shift</label>
                            <form:select path="shift"  style="width:90%">
                                <form:options items="${EMP_SHIFT_MAP}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Fixed Incentive</label>
                            <form:input path="fixedIncentive" type="number" required="required"  style="width:90%"/>
                        </div>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_line">
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Pan Card</label>
                            <form:input path="panCard"  style="width:90%"/>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Aadhar Card</label>
                            <form:input path="aadharCard"  style="width:90%"/>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Marial Status</label>
                            <form:select path="maritalStatus"  style="width:90%">
                                <form:options items="${MARITAL_STATUS_MAP}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Gender</label>
                            <form:select path="gender"  style="width:90%">
                                <form:options items="${GENDER_MAP}" class="service-small" />
                            </form:select>
                        </div>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_line">
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Deleted</label>
                            <form:select path="deleted"  style="width:90%">
                                <form:options items="${ACTIVE_MAP}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Account Locked</label>
                            <form:select path="accountLocked"  style="width:90%">
                                <form:options items="${ACTIVE_MAP}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for=""style="font-weight:600">Date of Birth</label>
                            <form:input path="dob" type="date" required="required"  style="width:90%"/>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Date of Joining</label>
                            <form:input path="doj" type="date" required="required"  style="width:90%"/>
                        </div>
                    </div>
                    <div class="AdminDisplayUser_wrapper_data_line">
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Personal Email</label>
                            <form:input path="personalEmail" type="email" required="required"  style="width:90%"/>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Personal Mobile</label>
                            <form:input path="personalMobile" type="number" required="required"  style="width:90%"/>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Active</label>
                            <form:select path="active"  style="width:90%">
                                <form:options items="${ACTIVE_MAP}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="AdminDisplayUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Account Expired</label>
                            <form:select path="accountExpired"  style="width:90%">
                                <form:options items="${ACTIVE_MAP}" class="service-small" />
                            </form:select>
                        </div>
                    </div>
                    
                     <div class="AdminDisplayUser_wrapper_data_l1" style="text-align:start">
                            <label for="" style="font-weight:600">Address</label><br>
                            <form:textarea path="address" rows="1" maxlength="250" style="width:97%"/><br>
                            <font color="red">
                                <form:errors path="address" cssClass="error" />
                            </font>
                        </div> 
                    <div class="AdminDisplayUser_wrapper_data_line" style="width:100%">
                        <div class="AdminDisplayUser_wrapper_data_l1"   style="width:100%">
                         <label for="" style="font-weight:600">Remarks</label><br>
                            <form:textarea path="remarks" rows="2" style="width:97%" maxlength="1000" />
                        </div>
                    </div>
                    <div class="due_today_task_data_btns">
                        <input type="submit" value="Update User">
                        <a href="view_search_admin_user">User Listings</a>
                    </div>
                    <input type="hidden" name="active" value="true" />

            </div>
            </form:form>
        </div>
    </div>



</body>

</html>