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
<style>
label{


}
.autocomplete-suggestions { border: 1px solid #999; background: red;overflow-y:auto}
		.autocomplete-suggestion {padding: 2px 5px;color:black; background: black;overflow-y: auto;overflow-y:auto}
		.autocomplete-selected { background: #F0F0F0;overflow-y:auto} 
		.autocomplete-suggestions strong { font-weight: normal; color:#FABA08;overflow-y:auto}
		.autocomplete-group { padding: 2px 5px;overflow-y:auto}
		.autocomplete-group strong { display: block; border-bottom: 1px solid #000;  background: black ; color:black overflow-y:auto}
		.autocomplete-selected:hover{
		color:black
		}
		 body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);
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
   
   <div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>
   
   
    <div class="AdminCreateNewUser container">
        <div class="AdminCreateNewUser_wrapper">
            <h1 class="page-heading" style="font-weight:600">Create User</h1>
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <form:form method="post" action="create_create_Admin_User" modelAttribute="USER_OBJ">
                <div class="AdminCreateNewUser_wrapper_data">
                    <div class="AdminCreateNewUser_wrapper_data_line1">
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Login Id</label>
                            <form:input path="username" maxlength="100" />
                            <font color="red">
                                <form:errors path="username" cssClass="error" />
                            </font>
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Password</label>
                            <form:password path="password" showPassword="true" />
                            <font color="red">
                                <form:errors path="password" cssClass="error" />
                            </font>
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="font-weight:600">Confirm Password</label>
                            <form:password path="passwordConfirm" showPassword="true" />
                            <font color="red">
                                <form:errors path="passwordConfirm" cssClass="error" />
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:black;font-weight:600">Role</label>
                            <div class="radio-btn-admin-cre-user" style="display:flex">
                             <form:radiobutton path="roleName" value="USER" checked="checked" label="User" style="width:25px;height:25px;margin-right:5px" />
                            &nbsp;&nbsp;
                            <form:radiobutton path="roleName" value="ADMIN" label="Admin" style="width:25px;height:25px;margin-right:5px" /></div>                 
                        </div>
                    </div>
                    <div class="AdminCreateNewUser_wrapper_data_line2">
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:black;font-weight:600">User Full Name</label>
                            <form:input path="name" /> <br>
                            <font color="red">
                                <form:errors path="name" cssClass="error" />
                            </font>
                        </div>
                       
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:black;;font-weight:600">Company Email</label>
                            <form:input path="email" />
                            <font color="red">
                                <form:errors path="email" cssClass="error" />
                            </font>
                        </div>
                        
                         <div class="AdminCreateNewUser_wrapper_data_line2">
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:black;font-weight:600">Company Mobile</label>
                            <form:input path="mobile" type="number" required="required" /> <br>
                            <font color="red">
                                <form:errors path="mobile" cssClass="error" />
                            </font>
                        </div>
                    </div>
                        
                    </div>
                    
               
                    <div class="AdminCreateNewUser_wrapper_data_line1">
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:black;font-weight:600">Designation</label>
                            <form:input path="designation" /> <br>
                            <font color="red">
                                <form:errors path="designation" cssClass="error" />
                            </font>
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:black;font-weight:600">Type</label> <br>
                            <form:select path="type" style="width:90%">
                                <form:options items="${EMP_TYPE_MAP}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:black;font-weight:600">Shift</label> <br>
                            <form:select path="shift" style="width:90%">
                                <form:options items="${EMP_SHIFT_MAP}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:black;font-weight:600">Fixed Incentive</label>
                            <form:input path="fixedIncentive" type="number" required="required" />
                        </div>
                    </div>
                    <div class="AdminCreateNewUser_wrapper_data_line1">
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:black;font-weight:600">Pan Card</label>
                            <form:input path="panCard" />
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:black;font-weight:600">Aadhar Card</label>
                            <form:input path="aadharCard" />
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:black;font-weight:600">Marial Status</label>
                            <form:select path="maritalStatus" style="width:90%"> <br>
                                <form:options items="${MARITAL_STATUS_MAP}" class="service-small" />
                            </form:select>
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:black;font-weight:600">Gender</label> <br>
                            <form:select path="gender" style="width:90%">
                                <form:options items="${GENDER_MAP}" class="service-small" />
                            </form:select>
                        </div>
                    </div>
                    <div class="AdminCreateNewUser_wrapper_data_line1">
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:black;font-weight:600">Date of Birth</label>
                            <form:input path="dob" type="date" required="required" />
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:black;font-weight:600">Date of Joining</label>
                            <form:input path="doj" type="date" required="required" />
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:black;font-weight:600">Personal Email</label>
                            <form:input path="personalEmail" type="email" required="required" />
                        </div>
                        <div class="AdminCreateNewUser_wrapper_data_l1">
                            <label for="" style="color:black;font-weight:600">Personal Phone</label>
                            <form:input path="personalMobile" type="number" required="required" />
                        </div>
                    </div>
                     <div class="AdminCreateNewUser_wrapper_data_l1 add" style="width: 100%;text-align:start;">
                            <label for="" style="color:black;font-weight:600">Address</label> <br>
                            <form:textarea path="address" rows="1" style="width:97.5%" maxlength="250" />
                            <font color="red">
                                <form:errors path="address" cssClass="error" />
                            </font>
                        </div>
                    <div class="AdminCreateNewUser_wrapper_data_line11">
                        <div class="AdminCreateNewUser_wrapper_data_l11" style="text-align: start;">
                            <label for="" style="color:black;font-weight:600">Remarks</label> <br>
                      <form:textarea path = "remarks" rows="3" style="width:97.5%"  maxlength="1000"/>
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