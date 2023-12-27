<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<!-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> -->

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>edit Supplier Contact</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
<script src="<c:url value=" /resources/core/magicsuggest.js" />"></script>

<style>
 body::before {
            content: "";
            background-image:url(${pageContext.request.contextPath}/resources/images/revamped/search_supplier_bg.jpg);
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

    <div class="editSupplierContact container">
        <div class="editSupplierContact_wrapper">

            <div class="editSupplierContact_details">
                <form:form method="post" modelAttribute="SUPPLIER_OBJ">
                    <h1 class="editSupplierContact_supplier_id" style="font-size: 30px;color:#00b200">(Supplier Id :
                        ${SUPPLIER_OBJ.supplierId})</h1>
                    <div class="editSupplierContact_info">
                        <div class="editSupplierContact_data_info">
                            <div class="editSupplierContact_data_line_info bc-clr">
                                <div class="editSupplierContact_data_line_l1_info">
                                    <label for="" style="color: #FFBA08;font-weight:bold">Supplier Name</label>
                                    <p>${SUPPLIER_OBJ.supplierName}</p>
                                </div>
                                <div class="editSupplierContact_data_line_l1_info">
                                    <label for="" style="color: #FFBA08;font-weight:bold">Email</label>
                                    <p>${SUPPLIER_OBJ.email}</p>
                                </div>
                                <div class="editSupplierContact_data_line_l1_info">
                                    <label for="" style="color: #FFBA08;font-weight:bold">Mobile</label>
                                    <p>${SUPPLIER_OBJ.mobile}</p>
                                </div>
                                <div class="editSupplierContact_data_line_l1_info">
                                    <label for="" style="color: #FFBA08;font-weight:bold">Destinations Supported</label>
                                    <p>
                                        <c:forEach items="${SUPPLIER_OBJ.destinations}" var="destination">
                                            ${destination.cityName},
                                        </c:forEach>
                                    </p>
                                </div>
                            </div>
                            <div class="editSupplierContact_data_line_info">
                                <div class="edit_supp_contact_data_ser">
                                    <h3 for="" style="color: #FFBA08;font-weight:bold;text-align:left;">Services offered
                                    </h3>
                                    <div class="edit_supp_contact_data_servs">
                                        <form:checkbox path="flight" disabled="true" /><span class="checkmark"></span>
                                        </label>Flight
                                        <form:checkbox path="hotel" disabled="true" style="margin-left:10px"/>
                                        Hotel
                                        <form:checkbox path="transfers" disabled="true" style="margin-left:10px"/>Transfers
                                        <form:checkbox path="sightseeing" disabled="true" style="margin-left:10px"/>SightSeeing
                                        <form:checkbox path="visa" disabled="true" style="margin-left:10px"/>
                                        Visa
                                        <form:checkbox path="insurance" disabled="true" style="margin-left:10px"/>Insurance
                                        <form:checkbox path="landPackage" disabled="true" style="margin-left:10px"/>Package
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>



            <form:form method="post" action="edit_edit_supplier_contact" modelAttribute="SUPPLIER_CONTACT_OBJ">
                <input type="hidden" name="supplierId" value="${SUPPLIER_CONTACT_OBJ.supplierEntity.supplierId}" />
                <form:hidden path="supplierContactId" />
                <h1 style="color: #FFBA08;font-size: 30px;">Edit Contact</h1>
                <div class="editSupplierContact_wrapper_data">
                    <div class="editSupplierContact_wrapper_data_line">
                        <div class="editSupplierContact_wrapper_data_line1">
                            <label for="" style="color: #FFBA08;font-weight:bold">Conatct Id</label>
                            <p>${SUPPLIER_CONTACT_OBJ.supplierContactId}</p>
                        </div>
                        <div class="editSupplierContact_wrapper_data_line1">
                            <label for="" style="color: #FFBA08;font-weight:bold">Conatct Name</label>
                            <form:input path="contactName" name="contactName" required="required" />
                        </div>
                        <div class="editSupplierContact_wrapper_data_line1">
                            <label for="" style="color: #FFBA08;font-weight:bold">Role</label>
                            <form:input path="role" name="role" required="required" />
                        </div>
                        <div class="editSupplierContact_wrapper_data_line1">
                            <label for="" style="color: #FFBA08;font-weight:bold">Email</label>
                            <form:input type="email" path="email" />
                        </div>
                    </div>
                    <div class="editSupplierContact_wrapper_data_line">
                        <div class="editSupplierContact_wrapper_data_line1">
                            <label for="" style="color: #FFBA08;font-weight:bold">Mobile</label>
                            <form:input type="number" path="mobile" />
                        </div>
                        <div class="editSupplierContact_wrapper_data_line1">
                            <label for="" style="color: #FFBA08;font-weight:bold">Phone</label>
                            <form:input type="number" path="phone" />
                        </div>
                        <div class="editSupplierContact_wrapper_data_line1">
                            <label for="" style="color: #FFBA08;font-weight:bold">Description</label>
                            <form:input path="description" name="description" />
                        </div>
                        <div class="editSupplierContact_wrapper_data_line1">
                            <label for="" style="color: #FFBA08;font-weight:bold">City</label>
                            <form:input path="city" name="city" />
                        </div>
                    </div>
                    <div class="ans-btns">
                        <input type="submit" value="Update Contact" style="border: none;outline: none;">
                        <a href="view_supplier_contacts_listing?supplierId=${SUPPLIER_OBJ.supplierId}">Contacts
                            Listing</a>
                    </div>
                </div>
            </form:form>
        </div>
    </div>

</body>

</html>