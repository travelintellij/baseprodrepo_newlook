<!DOCTYPE html>
<html lang="en">

<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AddNew Supplier Contact</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script	src="<c:url value="/resources/core/magicsuggest.js" />"></script>
</head>

<style>

        body::before {
            content: "";
            background-image: url(${pageContext.request.contextPath}/resources/images/revamped/addNewSupp.jpg);
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
        .autocomplete-suggestions { border: 1px solid #999; background: red;overflow-y:auto}
		.autocomplete-suggestion {padding: 2px 5px;color:white; background: black;overflow-y: auto;overflow-y:auto}
		.autocomplete-selected { background: #F0F0F0;overflow-y:auto} 
		.autocomplete-suggestions strong { font-weight: normal; color:#FABA08;overflow-y:auto}
		.autocomplete-group { padding: 2px 5px;overflow-y:auto}
		.autocomplete-group strong { display: block; border-bottom: 1px solid #000;  background: black ; color:black overflow-y:auto}
		.autocomplete-selected:hover{
		color:black
		}


</style>

<body>
<div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>
    <div class="AddNewSupplierContact container">
        <div class="AddNewSupplierContact_wrapper bs">
            <h1 style="color:#00b200;font-size: 30px">(Supplier Id : ${SUPPLIER_OBJ.supplierId})</h1>
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <div class="AddNewSupplierContact_wrapper_data">
                <form:form method="post" modelAttribute="SUPPLIER_OBJ">
                    <div class="AddNewSupplierContact_wrapper_data_line a" style="margin-bottom:10px;">
                        <div class="AddNewSupplierContact_wrapper_data_l1">
                            <label for="" style="color:black;font-weight: normal;">Supplier Name</label>
                            <p style="font-weight:600;color:#023e8a">${SUPPLIER_OBJ.supplierName}</p>
                        </div>
                        <div class="AddNewSupplierContact_wrapper_data_l1">
                            <label for="" style="color:black;font-weight: normal;">Email</label>
                            <p style="font-weight:600;color:#023e8a">${SUPPLIER_OBJ.email}</p>
                        </div>
                        <div class="AddNewSupplierContact_wrapper_data_l1">
                            <label for="" style="color:black;font-weight: normal;">Mobile</label>
                            <p style="font-weight:600;color:#023e8a">${SUPPLIER_OBJ.mobile}</p>
                        </div>
                        <div class="AddNewSupplierContact_wrapper_data_l1">
                            <label for="" style="color:black;font-weight: normal;">Destinations Supported</label> <br>
                            <c:forEach items="${SUPPLIER_OBJ.destinations}" var="destination">
                               <span style="font-weight:600;color:#023e8a"> ${destination.cityName}, </span>
                            </c:forEach>
                        </div>
                    </div>
                    <!-- ############ servies starts here ############## -->
                     <h3 style="color:black;font-weight: normal;text-align:start;font-weight:bold">Service Offerred</h3>       
                    <div class="AddNewSupplierContact_wrapper_data_line_ser" style="display:flex;justify-content:space-between">
                    <div><form:checkbox class="ch_c" path="flight" disabled="true" style="margin-right:5pxl;width:18px;height:18px;margin-right:5px"/> <span style="font-weight:600;color:black">Flight</span></div>
                    <div>  <form:checkbox class="ch_c" path="hotel" disabled="true" style="margin-left:10px;margin-right:5px;width:18px;height:18px;margin-right:5px"/><span style="font-weight:600;color:black">Hotel</span></div>
                    <div><form:checkbox class="ch_c" path="transfers" disabled="true" style="margin-left:10px;margin-right:5px;width:18px;height:18px;margin-right:5px"/><span style="font-weight:600;color:black">Transfers</span></div>
                    <div> <form:checkbox class="ch_c" path="sightseeing" disabled="true" style="margin-left:10px;margin-right:5px;width:18px;height:18px;margin-right:5px"/>
 <span style="font-weight:600;color:black">Sight Seeing</span></div>
                    <div><form:checkbox class="ch_c" path="visa" disabled="true" style="margin-left:10px;margin-right:5px;width:18px;height:18px;margin-right:5px"/>
 <span style="font-weight:600;color:black">Visa</span></div>
                    <div> <form:checkbox class="ch_c" path="insurance" disabled="true" style="margin-left:10px;margin-right:5px;width:18px;height:18px;margin-right:5px"/>
 <span style="font-weight:600;color:black">Insurance</span></div>
                    <div> <form:checkbox class="ch_c" path="landPackage" disabled="true" style="margin-left:10px;margin-right:5px;width:18px;height:18px;margin-right:5px"/>
 <span style="font-weight:600;color:black">Package</span></div>
  
                       
                    </div>
                </form:form>
                <!-- ############ servies ends here ############## -->


                <!-- ######## Add new Contact from starts here ########## -->

                <form:form method="post" action="create_create_supplier_contact" modelAttribute="SUPPLIER_CONTACT_OBJ">
                    <div class="AddNewSupplierContact_wrapper_data_form" style="margin:20px 0">
                        <input type="hidden" name="supplierId"
                            value="${SUPPLIER_CONTACT_OBJ.supplierEntity.supplierId}" />
                        <h1 style="color:black;font-weight: 600;font-size: 30px;">Add New Contact</h1>
                        <div class="AddNewSupplierContact_wrapper_data_line_form_data">
                            <div class="AddNewSupplierContact_wrapper_data_form_l1">
                                <label for="" style="color:black;font-weight: 600;">Contact Name</label> <br>
                                <form:input path="contactName" name="contactName" required="required" />
                            </div>
                            <div class="AddNewSupplierContact_wrapper_data_form_l1">
                                <label for="" style="color:black;font-weight: 600;">Role</label> <br>
                                <form:input path="role" name="role" required="required" />
                                <font color="red">
                                    <form:errors path="role" cssClass="error" />
                                </font>
                                </td>
                            </div>
                            <div class="AddNewSupplierContact_wrapper_data_form_l1">
                                <label for="" style="color:black;font-weight: 600;">Email</label> <br>
                                <form:input type="email" path="email" />
                                <font color="red">
                                    <form:errors path="email" cssClass="error" />
                                </font>
                            </div>
                            <div class="AddNewSupplierContact_wrapper_data_form_l1">
                                <label for="" style="color:black;font-weight: 600;">Mobile</label> <br>
                                <form:input type="number" path="mobile" />
                                <font color="red">
                                    <form:errors path="mobile" cssClass="error" />
                                </font>
                            </div>
                        </div>
                        <div class="AddNewSupplierContact_wrapper_data_line_form_data2">
                            <div class="AddNewSupplierContact_wrapper_data_form_l1">
                                <label for="" style="color:black;font-weight: 600;">Phone</label> <br>
                                <form:input type="number" path="phone" />
                                <font color="red">
                                    <form:errors path="phone" cssClass="error" />
                                </font>
                            </div>
                            <div class="AddNewSupplierContact_wrapper_data_form_l1">
                                <label for="" style="color:black;font-weight: 600;">Description</label> <br>
                                <form:input path="description" name="description" />
                            </div>
                            <div class="AddNewSupplierContact_wrapper_data_form_l1">
                                <label for="" style="color:black;font-weight: 600;">City</label> <br>
                                <form:input path="city" name="city" />
                            </div>
                        </div>
                    </div>
                    <!-- ######## Add new Contact from ends here ########## -->

                    <!-- ######## buttons starts here ########## -->
                    <div class="due_today_task_data_btns">
                        <input type="submit" value="Add Contact">
                        <a href="view_supplier_contacts_listing?supplierId=${SUPPLIER_OBJ.supplierId}">Contacts
                            Listing</a>
                    </div>
                    <!-- ######## buttons ends here ########## -->
                </form:form>
            </div>
        </div>
    </div>
    </div>
    </div>
</body>

</html>