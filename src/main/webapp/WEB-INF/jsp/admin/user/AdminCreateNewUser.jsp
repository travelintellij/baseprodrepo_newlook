<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>add user</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body  style="background: url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
    <div class="AdminCreateNewUser container">
        <div class="AdminCreateNewUser_wrapper">
            <h1 class="page-heading">Create User</h1>
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <form:form method="post" action="create_create_Admin_User" modelAttribute="USER_OBJ">
                <div class="AdminCreateNewUser_wrapper_data">
                    <div class="AdminCreateNewUser_wrapper_data_line1">
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="">Login Id</label>
                            <form:input path="username" maxlength="100" />
                            <font color="red">
                                <form:errors path="username" cssClass="error" />
                            </font>
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="">Password</label>
                            <form:password path="password" showPassword="true" />
                            <font color="red">
                                <form:errors path="password" cssClass="error" />
                            </font>
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="">Confirm Password</label>
                            <form:password path="passwordConfirm" showPassword="true" />
                            <font color="red">
                                <form:errors path="passwordConfirm" cssClass="error" />
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:white">Role</label>
                            <div class="radio-btn-admin-cre-user" style="display:flex">
                             <form:radiobutton path="roleName" value="USER" checked="checked" label="User" style="width:25px;height:25px;margin-right:5px" />
                            &nbsp;&nbsp;
                            <form:radiobutton path="roleName" value="ADMIN" label="Admin" style="width:25px;height:25px;margin-right:5px" /></div>                 
                        </div>
                    </div>
                    <div class="AdminCreateNewUser_wrapper_data_line2">
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:white">User Full Name</label>
                            <form:input path="name" /> <br>
                            <font color="red">
                                <form:errors path="name" cssClass="error" />
                            </font>
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1 add" style="width: 590px;">
                            <label for="" style="color:white">Address</label> <br>
                            <form:textarea path="address" rows="1" cols="66" maxlength="250" />
                            <font color="red">
                                <form:errors path="address" cssClass="error" />
                            </font>
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:white">Company Email</label>
                            <form:input path="email" />
                            <font color="red">
                                <form:errors path="email" cssClass="error" />
                            </font>
                        </div>
                    </div>
                    <div class="AdminCreateNewUser_wrapper_data_line2">
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:white">Company Mobile</label>
                            <form:input path="mobile" type="number" required="required" /> <br>
                            <font color="red">
                                <form:errors path="mobile" cssClass="error" />
                            </font>
                        </div>
                    </div>
                    <div class="AdminCreateNewUser_wrapper_data_line1">
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:white">Designation</label>
                            <form:input path="designation" /> <br>
                            <font color="red">
                                <form:errors path="designation" cssClass="error" />
                            </font>
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:white">Type</label> <br>
                            <form:select path="type" style="width:90%">
                                <form:options items="${EMP_TYPE_MAP}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:white">Shift</label> <br>
                            <form:select path="shift" style="width:90%">
                                <form:options items="${EMP_SHIFT_MAP}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:white">Fixed Incentive</label>
                            <form:input path="fixedIncentive" type="number" required="required" />
                        </div>
                    </div>
                    <div class="AdminCreateNewUser_wrapper_data_line1">
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:white">Pan Card</label>
                            <form:input path="panCard" />
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:white">Aadhar Card</label>
                            <form:input path="aadharCard" />
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:white">Marial Status</label>
                            <form:select path="maritalStatus" style="width:90%"> <br>
                                <form:options items="${MARITAL_STATUS_MAP}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:white">Gender</label> <br>
                            <form:select path="gender" style="width:90%">
                                <form:options items="${GENDER_MAP}" class="service-small" />
                            </form:select>
                        </div>
                    </div>
                    <div class="AdminCreateNewUser_wrapper_data_line1">
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:white">Date of Birth</label>
                            <form:input path="dob" type="date" required="required" />
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:white">Date of Joining</label>
                            <form:input path="doj" type="date" required="required" />
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:white">Personal Email</label>
                            <form:input path="personalEmail" type="email" required="required" />
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:white">Personal Phone</label>
                            <form:input path="personalMobile" type="number" required="required" />
                        </div>
                    </div>
                    <div class="AdminCreateNewUser_wrapper_data_line11">
                        <div class="AdminCreateNewUser_wrapper_data_l11" style="text-align: start;">
                            <label for="" style="color:white">Remarks</label> <br>
                      <form:textarea path = "remarks" rows="3" cols="139"  maxlength="1000"/>
                        </div>
                    </div>
                    <div class="due_today_task_data_btns">
                        <input type="submit" value="Create User">
                        <a href="view_workloadhome">Home</a>
                        <a href="view_search_admin_user">User Listings</a>
                    </div>
                </div>
                <input type="hidden" name="active" value="true" />
            </form:form>
        </div>
    </div>
</body>

</html>