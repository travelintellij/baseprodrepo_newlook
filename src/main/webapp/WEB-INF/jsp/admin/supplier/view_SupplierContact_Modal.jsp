<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>view_SupplierContact_Modal</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<body>
    <div class="view_SupplierContact_Modal container">
    <form:form method="post" >
		<input type="hidden" name="supplierId" value= "${SUPPLIER_CONTACT_OBJ.supplierEntity.supplierId}" />
        <div class="view_SupplierContact_Modal_wrapper">
            <h1 class="view_SupplierContact_Modal_heading">Contact Details</h1>
            <div class="view_SupplierContact_Modal_data">
                <div class="view_SupplierContact_Modal_data_line1">
                    <div class="view_SupplierContact_Modal_data_l1">
                        <label for="">Contact Id</label>
                        <p>${SUPPLIER_CONTACT_OBJ.supplierContactId}</p>
                    </div>
                    <div class="view_SupplierContact_Modal_data_l1">
                        <label for="">Contact Name</label>
                        <p>${SUPPLIER_CONTACT_OBJ.contactName}</p>
                    </div>
                    <div class="view_SupplierContact_Modal_data_l1">
                        <label for="">Role</label>
                        <p>${SUPPLIER_CONTACT_OBJ.role}</p>
                    </div>
                    <div class="view_SupplierContact_Modal_data_l1">
                        <label for="">Email</label>
                        <p>${SUPPLIER_CONTACT_OBJ.email}</p>
                    </div>
                </div>
                <div class="view_SupplierContact_Modal_data_line2">
                    <div class="view_SupplierContact_Modal_data_l1">
                        <label for="">Mobile</label>
                        <p>${SUPPLIER_CONTACT_OBJ.mobile}</p>
                    </div>
                    <div class="view_SupplierContact_Modal_data_l1">
                        <label for="">Phone</label>
                        <p>${SUPPLIER_CONTACT_OBJ.phone}</p>
                    </div>
                    <div class="view_SupplierContact_Modal_data_l1">
                        <label for="">Description</label>
                        <p>${SUPPLIER_CONTACT_OBJ.description}</p>
                    </div>
                    <div class="view_SupplierContact_Modal_data_l1">
                        <label for="">City</label>
                        <p>${SUPPLIER_CONTACT_OBJ.city}</p>
                    </div>
                </div>
            </div>
        </div>
        </form:form>
    </div>
</body>
</html>