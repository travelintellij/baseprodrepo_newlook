<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>delete Supplier Contact Confrm Modal</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <div class="deleteSupplierContactConfrm_Modal container">
        <form:form method="post" action="delete_delete_supplier_contact" modelAttribute="SUPPLIER_CONTACT_OBJ">
            <input type="hidden" name="supplierId" value="${SUPPLIER_CONTACT_OBJ.supplierEntity.supplierId}" />
            <form:hidden path="supplierContactId" />
            <div class="deleteSupplierContactConfrm_Modal_wrapper">
                <h1 style="color:red;font-size: 30px;">Confirm Delete !!</h1>
                <div class="deleteSupplierContactConfrm_Modal_data">
                    <div class="deleteSupplierContactConfrm_Modal_data_line">
                        <div class="deleteSupplierContactConfrm_Modal_data_l1">
                            <label for="" style="color: #FFBA08; font-weight: bold;">Contact Id</label>
                            <p>${SUPPLIER_CONTACT_OBJ.supplierContactId}</p>
                        </div>
                        <div class="deleteSupplierContactConfrm_Modal_data_l1">
                            <label for="" style="color: #FFBA08; font-weight: bold;">Contact Name</label>
                            <p>${SUPPLIER_CONTACT_OBJ.contactName}</p>
                        </div>
                        <div class="deleteSupplierContactConfrm_Modal_data_l1">
                            <label for="" style="color: #FFBA08; font-weight: bold;">Role</label>
                            <p>${SUPPLIER_CONTACT_OBJ.role}</p>
                        </div>
                        <div class="deleteSupplierContactConfrm_Modal_data_l1">
                            <label for="" style="color: #FFBA08; font-weight: bold;">Email</label>
                            <p>${SUPPLIER_CONTACT_OBJ.email}</p>
                        </div>
                    </div>
                    <div class="deleteSupplierContactConfrm_Modal_data_line">
                        <div class="deleteSupplierContactConfrm_Modal_data_l1">
                            <label for="" style="color: #FFBA08; font-weight: bold;">Mobile</label>
                            <p>${SUPPLIER_CONTACT_OBJ.mobile}</p>
                        </div>
                        <div class="deleteSupplierContactConfrm_Modal_data_l1">
                            <label for="" style="color: #FFBA08; font-weight: bold;">Phone</label>
                            <p>${SUPPLIER_CONTACT_OBJ.phone}</p>
                        </div>
                        <div class="deleteSupplierContactConfrm_Modal_data_l1">
                            <label for="" style="color: #FFBA08; font-weight: bold;">Description</label>
                            <p>${SUPPLIER_CONTACT_OBJ.description}</p>
                        </div>
                        <div class="deleteSupplierContactConfrm_Modal_data_l1">
                            <label for="" style="color: #FFBA08; font-weight: bold;">City</label>
                            <p>${SUPPLIER_CONTACT_OBJ.city}</p>
                        </div>
                    </div>
                    <div class="ans-btns">
                        <input type="submit" value="Confirm Delete" style="border:none;outline:none">
                        <input type="button" value="Cancel" onclick="cancelModal();" style="border:none;outline:none" />
                    </div>
                </div>
            </div>
        </form:form>
    </div>


</body>

</html>