<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>view supplier contacts listing</title>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
     <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<script	src="<c:url value="/resources/core/magicsuggest.js" />"></script>
</head>
<style>
.modal {

	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  padding-top: 50px; /* Location of the box */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 90%; /* Full height */
	  background-color: transparent; /* Black w/ opacity */
	}
	
	/* Modal Content */
	.modal-content {
	  position: relative;
	  margin: auto;
	  padding: 0;
	  width: 1200px;
	 
	  -webkit-animation-name: animatetop;
	  -webkit-animation-duration: 0.4s;
	  animation-name: animatetop;
	  animation-duration: 0.4s
	}
	
	/* Add Animation */
	@-webkit-keyframes animatetop {
	  from {top:-300px; opacity:0} 
	  to {top:0; opacity:1}
	}
	
	@keyframes animatetop {
	  from {top:-300px; opacity:0}
	  to {top:0; opacity:1}
	}
	
	/* The Close Button */
	.close {
	  color: white;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	  color: #000;
	  text-decoration: none;
	  cursor: pointer;
	}
	
	.modal-header {
	  padding: 2px 16px;
	  background-color: lightblue;
	  color: white;
	}
	
	.modal-body {padding: 2px 16px;}


        body::before {
            content: "";
            background-image: url(${pageContext.request.contextPath}/resources/images/revamped/viewSupplierContactsListing_bg.jpg);
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



    <div class="vscl container">
        <div class="vscl_wrapper">
            <h1 class="vscl_sid" style="color:red;font-size: 30px;">Supplier Id : <span style="color:#FFBA08;font-size: 30px">  ${SUPPLIER_OBJ.supplierId}</span></h1>
            <div class="vscl_wrapper_data">
                <form:form method="post" action="form_view_quote_req_email_supplier" modelAttribute="EMAIL_QUOTE_OBJ">
                    <form:hidden path="supplierId" />
                    <form:hidden path="supplierName" />
                    <form:hidden path="leadId" />
                    <div class="vscl_wrapper_data_line_1" style="margin-bottom:10px;background:#6082B6">
                        <div class="vscl_wrapper_data_l1">
                            <label for="" style="color:#FFBA08">Supplier Name</label>
                            <p>${SUPPLIER_OBJ.supplierName}</p>
                        </div>
                        <div class="vscl_wrapper_data_l1">
                            <label for=""  style="color:#FFBA08">Email</label>
                            <p>${SUPPLIER_OBJ.email}</p>
                        </div>
                        <div class="vscl_wrapper_data_l1" style="width:200px">
                            <label for=""  style="color:#FFBA08">Mobile</label>
                            <p>${SUPPLIER_OBJ.mobile}</p>
                        </div>
                        <div class="vscl_wrapper_data_l1">
                            <label for=""  style="color:#FFBA08">Destinations supported</label> <br>
                            <c:forEach items="${SUPPLIER_OBJ.destinations}" var="destination">
                                ${destination.cityName},
                            </c:forEach>
                        </div>
                    </div>
                    <div class="vscl_wrapper_data_line_2">
                        <h1 style="color:#FFBA08">Services offered</h1>
                        <div class="vscl_wrapper_data_l2">
                            <div style="display:flex;justify-content:space-between;margin:10px 0">
                                <div><label class="container">
                                        <c:if test="${SUPPLIER_OBJ.flight eq true}">
                                            <input type="checkbox" checked disabled />
                                        </c:if>
                                        <c:if test="${SUPPLIER_OBJ.flight eq false}">
                                            <input type="checkbox" disabled />
                                        </c:if>
                                        <span class="checkmark"></span>
                                    </label>Flight
                                </div>
                                <div><label class="container"
                                        style="display: inline;margin: 0 auto;margin-bottom: 20px;">
                                        <c:if test="${SUPPLIER_OBJ.hotel eq true}">
                                            <input type="checkbox" checked disabled />
                                        </c:if>
                                        <c:if test="${SUPPLIER_OBJ.hotel eq false}">
                                            <input type="checkbox" disabled />
                                        </c:if>
                                        <span class="checkmark"></span>
                                    </label>Hotel
                                </div>
                                <div>
                                    <label class="container"
                                        style="display: inline;margin: 0 auto;margin-bottom: 20px;">
                                        <c:if test="${SUPPLIER_OBJ.transfers eq true}">
                                            <input type="checkbox" checked disabled />
                                        </c:if>
                                        <c:if test="${SUPPLIER_OBJ.transfers eq false}">
                                            <input type="checkbox" disabled />
                                        </c:if>
                                        <span class="checkmark"></span>
                                    </label>Transfers
                                </div>
                                <div>
                                    <label class="container"
                                        style="display: inline;margin: 0 auto;margin-bottom: 20px;">
                                        <c:if test="${SUPPLIER_OBJ.sightseeing eq true}">
                                            <input type="checkbox" checked disabled />
                                        </c:if>
                                        <c:if test="${SUPPLIER_OBJ.sightseeing eq false}">
                                            <input type="checkbox" disabled />
                                        </c:if>
                                        <span class="checkmark"></span>
                                    </label>Sight Seeing
                                </div>
                                <div>
                                    <label class="container"
                                        style="display: inline;margin: 0 auto;margin-bottom: 20px;">
                                        <c:if test="${SUPPLIER_OBJ.visa eq true}">
                                            <input type="checkbox" checked disabled />
                                        </c:if>
                                        <c:if test="${SUPPLIER_OBJ.visa eq false}">
                                            <input type="checkbox" disabled />
                                        </c:if>
                                        <span class="checkmark"></span>
                                    </label>Visa
                                </div>
                                <div>
                                    <label class="container"
                                        style="display: inline;margin: 0 auto;margin-bottom: 20px;">
                                        <c:if test="${SUPPLIER_OBJ.insurance eq true}">
                                            <input type="checkbox" checked disabled />
                                        </c:if>
                                        <c:if test="${SUPPLIER_OBJ.insurance eq false}">
                                            <input type="checkbox" disabled />
                                        </c:if>
                                        <span class="checkmark"></span>
                                    </label>Insurance
                                </div>
                                <div colspan="2">
                                    <label class="container"
                                        style="display: inline;margin: 0 auto;margin-bottom: 20px;">
                                        <c:if test="${SUPPLIER_OBJ.landPackage eq true}">
                                            <input type="checkbox" checked disabled />
                                        </c:if>
                                        <span class="checkmark"></span>
                                    </label>Package
                                </div>
                        </div>
                    </div>

                    <div class="vscl_side_menu_bar">
                        <ul class="vscl_side_menu_bar_ul">
                            <li><a href="view_supplier_details?supplierId=${SUPPLIER_OBJ.supplierId }">View Supplier</a>
                            </li>
                            <li><a href="form_view_editsupplier?supplierId=${SUPPLIER_OBJ.supplierId }">Edit
                                    Supplier</a></li>
                            <li><a href="view_form_search_supplier_quote?leadId=${EMAIL_QUOTE_OBJ.leadId}">Search
                                    Supplier</a></li>
                        </ul>
                    </div>

            </div>
        </div>
                </div>
                        </div>





        <div class="container" style="display: flex;justify-content:center;margin-top: 10px;">
            <h1 style="color: #FFCF53;background: black;padding: 10px;border-radius: 5px;">Supplier Contacts</h1>
        </div>


  
        <div class="client_listing_tabel_div " style="background:black;text-align:center;margin-top:10px;padding-top:10px">
            <div align="center" style="display:inline;"><b>
                    <font color="#32cd32  "> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>

            <div class="table_div">
                <ul class="table_div">
                    <li><input type="Submit" class="scv_in_btn" value="Email Selected"
                            style="background: transparent;border: none;" /></li>
                    <li><a href="form_view_add_supplier_contact?supplierId=${SUPPLIER_OBJ.supplierId}">Add Contact</a>
                    </li>
                </ul>
            </div>

            <table class="view_task_table ">
            <thead>
                <tr>
                    <th style="background:#6082B6">Contact No.</th>
                    <th style="background:#6082B6">Contact Name</th>
                    <th style="background:#6082B6">Role</th>
                    <th style="background:#6082B6">Mobile</th>
                    <th style="background:#6082B6">Email</th>
                    <th style="background:#6082B6">Action</th>
                </tr>
                </thead>

                <c:forEach items="${SUPPLIER_OBJ.supplierContactsList}" var="contactList">
                    <tr>
                        <td style="border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53">${contactList.supplierContactId}</td>
                        <td  style="border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53">${contactList.contactName}</td>
                        <td  style="border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53">${contactList.role}</td>
                        <td  style="border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53">${contactList.mobile}</td>
                        <td  style="border-bottom:2px solid #FFCF53;border-right:2px solid #FFCF53">${contactList.email}</td>

                        <td colspan="3"  style="border-bottom:2px solid #FFCF53">
                            Email To: <label class="container"
                                style="display: inline;margin: 0 auto;margin-bottom: 20px;"><input type="checkbox"
                                    name="emailToList" value="${contactList.email}" /> <span
                                    class="checkmark"></span></label>

                            Cc: <label class="container"
                                style="display: inline;margin: 0 auto;margin-bottom: 20px;"><input type="checkbox"
                                    name="emailCcList" value="${contactList.email}" /> <span
                                    class="checkmark"></span></label>
                            |
                            <a class="vscl_action" id="myBtn[${contactList.supplierContactId}]" onclick="contactDisplay(this)" data-load-url="view_supplier_contact_details_modal?supplierContactId=${contactList.supplierContactId}" data-toggle="modal" data-target="#myModal" class="vscl_action"><input type="button"
                                    value="View" style="background:transparent;border:none;outline:none"/></a>
                            |
                            <a
                             class="vscl_action" href="form_view_edit_supplier_contact?supplierContactId=${contactList.supplierContactId}"><input 
                                    type="button" style="background:transparent;border:none;outline:none"
                                    value="Edit" /></a> |
                            <a  class="vscl_action" id="myBtn[${contactList.supplierContactId}]" onclick="contactDisplay(this)"
                                data-load-url="view_delete_supplier_contact_confirm_modal?supplierContactId=${contactList.supplierContactId}"
                                data-toggle="modal" data-target="#myModal" class="vscl_action"><input type="button" 
                                    style="background:transparent;border:none;outline:none" value="Delete"/></a>

                        </td>
                    </tr>
                </c:forEach>



                <div id="myModal" class="modal">
						  <!-- Modal content -->
						  <div class="modal-content">
						    <div class="modal-header">
						      <span class="close">&times;</span>
						      <br><h2 style="text-align:center;" id="modelheaderh2">Contact Details</h2>
						    </div>
						    <div class="modal-body">
						
						
						    </div>
						    <div class="modal-footer">
						      <h3>Powered by @TravelIntelliJ</h3>
						    </div>
						  </div>
						</div>	
            </table>
          
        </div>

  </form:form>


    <script>
        // Get the modal
        var modal = document.getElementById("myModal");
        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");
        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];
        function contactDisplay(clicked) {
            //alert(clicked); 
            $("#myModal .modal-body").load($(clicked).attr('data-load-url'));
            modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }

        function cancelModal() {
            modal.style.display = "none";
        }
    </script>


</body>

</html>