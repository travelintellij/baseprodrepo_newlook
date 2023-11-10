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



<body
      style="background: url(${pageContext.request.contextPath}/resources/images/revamped/addNewSupp.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
    <div class="AddNewSupplierContact container">
        <div class="AddNewSupplierContact_wrapper">
            <h1 style="color:#00b200;font-size: 30px">(Supplier Id : ${SUPPLIER_OBJ.supplierId})</h1>
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <div class="AddNewSupplierContact_wrapper_data">
                <form:form method="post" modelAttribute="SUPPLIER_OBJ">
                    <div class="AddNewSupplierContact_wrapper_data_line">
                        <div class="AddNewSupplierContact_wrapper_data_l1">
                            <label for="" style="color:#FFBA08;font-weight: bold;">Supplier Name</label>
                            <p>${SUPPLIER_OBJ.supplierName}</p>
                        </div>
                        <div class="AddNewSupplierContact_wrapper_data_l1">
                            <label for="" style="color:#FFBA08;font-weight: bold;">Email</label>
                            <p>${SUPPLIER_OBJ.email}</p>
                        </div>
                        <div class="AddNewSupplierContact_wrapper_data_l1">
                            <label for="" style="color:#FFBA08;font-weight: bold;">Mobile</label>
                            <p>${SUPPLIER_OBJ.mobile}</p>
                        </div>
                        <div class="AddNewSupplierContact_wrapper_data_l1">
                            <label for="" style="color:#FFBA08;font-weight: bold;">Destinations Supported</label> <br>
                            <c:forEach items="${SUPPLIER_OBJ.destinations}" var="destination">
                                ${destination.cityName},
                            </c:forEach>
                        </div>
                    </div>
                    <!-- ############ servies starts here ############## -->
                     <h3 style="color:#FFBA08;font-weight: bold;text-align:start">Service Offerred</h3>       
                    <div class="AddNewSupplierContact_wrapper_data_line_ser" style="display:flex;">
                        <form:checkbox path="flight" disabled="true" style="margin-right:5px"/>Flight
                        <form:checkbox path="hotel" disabled="true" style="margin-left:10px;margin-right:5px"/>Hotel
                        <form:checkbox path="transfers" disabled="true" style="margin-left:10px;margin-right:5px"/>Transfers
                        <form:checkbox path="sightseeing" disabled="true" style="margin-left:10px;margin-right:5px"/>SightSeeing
                        <form:checkbox path="visa" disabled="true" style="margin-left:10px;margin-right:5px"/>Visa
                        <form:checkbox path="insurance" disabled="true" style="margin-left:10px;margin-right:5px"/>Insurance
                        <form:checkbox path="landPackage" disabled="true" style="margin-left:10px;margin-right:5px"/>Package
                    </div>
                </form:form>
                <!-- ############ servies ends here ############## -->


                <!-- ######## Add new Contact from starts here ########## -->

                <form:form method="post" action="create_create_supplier_contact" modelAttribute="SUPPLIER_CONTACT_OBJ">
                    <div class="AddNewSupplierContact_wrapper_data_form">
                        <input type="hidden" name="supplierId"
                            value="${SUPPLIER_CONTACT_OBJ.supplierEntity.supplierId}" />
                        <h1 style="color:#FFBA08;font-weight: bold;font-size: 30px;">Add New Contact</h1>
                        <div class="AddNewSupplierContact_wrapper_data_line_form_data">
                            <div class="AddNewSupplierContact_wrapper_data_form_l1">
                                <label for="" style="color:#FFBA08;font-weight: bold;">Contact Name</label> <br>
                                <form:input path="contactName" name="contactName" required="required" />
                            </div>
                            <div class="AddNewSupplierContact_wrapper_data_form_l1">
                                <label for="" style="color:#FFBA08;font-weight: bold;">Role</label> <br>
                                <form:input path="role" name="role" required="required" />
                                <font color="red">
                                    <form:errors path="role" cssClass="error" />
                                </font>
                                </td>
                            </div>
                            <div class="AddNewSupplierContact_wrapper_data_form_l1">
                                <label for="" style="color:#FFBA08;font-weight: bold;">Email</label> <br>
                                <form:input type="email" path="email" />
                                <font color="red">
                                    <form:errors path="email" cssClass="error" />
                                </font>
                            </div>
                            <div class="AddNewSupplierContact_wrapper_data_form_l1">
                                <label for="" style="color:#FFBA08;font-weight: bold;">Mobile</label> <br>
                                <form:input type="number" path="mobile" />
                                <font color="red">
                                    <form:errors path="mobile" cssClass="error" />
                                </font>
                            </div>
                        </div>
                        <div class="AddNewSupplierContact_wrapper_data_line_form_data2">
                            <div class="AddNewSupplierContact_wrapper_data_form_l1">
                                <label for="" style="color:#FFBA08;font-weight: bold;">Phone</label> <br>
                                <form:input type="number" path="phone" />
                                <font color="red">
                                    <form:errors path="phone" cssClass="error" />
                                </font>
                            </div>
                            <div class="AddNewSupplierContact_wrapper_data_form_l1">
                                <label for="" style="color:#FFBA08;font-weight: bold;">Description</label> <br>
                                <form:input path="description" name="description" />
                            </div>
                            <div class="AddNewSupplierContact_wrapper_data_form_l1">
                                <label for="" style="color:#FFBA08;font-weight: bold;">City</label> <br>
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