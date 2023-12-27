<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>delete Supplier Contact Confrm Modal</title>
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
      <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body>

    <div class="deleteSupplierContactConfrm_Modal container">
        <form:form method="post" action="delete_delete_supplier_contact" modelAttribute="SUPPLIER_CONTACT_OBJ">
            <input type="hidden" name="supplierId" value="${SUPPLIER_CONTACT_OBJ.supplierEntity.supplierId}" />
            <form:hidden path="supplierContactId" />
            <div class="deleteSupplierContactConfrm_Modal_wrapper" style="background:#94D2BD">
                <h1 style="color:red;font-size: 30px;">Confirm Delete <i class="fa-solid fa-triangle-exclamation fa-lg"></i></h1>
                <div class="deleteSupplierContactConfrm_Modal_data">
                    <div class="deleteSupplierContactConfrm_Modal_data_line" style="margin-bottom:10px;background:#d8e2dc;color:black">
                        <div class="deleteSupplierContactConfrm_Modal_data_l1">
                            <label for="" style="color: black; font-weight: bold;">Contact Id</label>
                            <p>${SUPPLIER_CONTACT_OBJ.supplierContactId}</p>
                        </div>
                        <div class="deleteSupplierContactConfrm_Modal_data_l1">
                            <label for="" style="color: black; font-weight: bold;">Contact Name</label>
                            <p>${SUPPLIER_CONTACT_OBJ.contactName}</p>
                        </div>
                        <div class="deleteSupplierContactConfrm_Modal_data_l1">
                            <label for="" style="color: black; font-weight: bold;">Role</label>
                            <p>${SUPPLIER_CONTACT_OBJ.role}</p>
                        </div>
                        <div class="deleteSupplierContactConfrm_Modal_data_l1">
                            <label for="" style="color: black; font-weight: bold;">Email</label>
                            <p>${SUPPLIER_CONTACT_OBJ.email}</p>
                        </div>
                    </div>
                    <div class="deleteSupplierContactConfrm_Modal_data_line" style="margin-bottom:10px;background:#d8e2dc;color:black">
                        <div class="deleteSupplierContactConfrm_Modal_data_l1">
                            <label for="" style="color: black; font-weight: bold;">Mobile</label>
                            <p>${SUPPLIER_CONTACT_OBJ.mobile}</p>
                        </div>
                        <div class="deleteSupplierContactConfrm_Modal_data_l1">
                            <label for="" style="color: black; font-weight: bold;">Phone</label>
                            <p>${SUPPLIER_CONTACT_OBJ.phone}</p>
                        </div>
                        <div class="deleteSupplierContactConfrm_Modal_data_l1">
                            <label for="" style="color: black; font-weight: bold;">Description</label>
                            <p>${SUPPLIER_CONTACT_OBJ.description}</p>
                        </div>
                        <div class="deleteSupplierContactConfrm_Modal_data_l1">
                            <label for="" style="color: black; font-weight: bold;">City</label>
                            <p>${SUPPLIER_CONTACT_OBJ.city}</p>
                        </div>
                    </div>
                    <div class="ans-btns">
                        <input type="submit" value="Confirm Delete" class="dscc-btn">
                        <input type="button" value="Cancel" onclick="cancelModal();" class="dscc-btn" />
                    </div>
                </div>
            </div>
        </form:form>
    </div>


</body>

</html>