<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>DeleteConfirmationClient</title>
                    <link rel="stylesheet" href="style.css">
                    <script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
                    <link href="<c:url value=" /resources/core/main.css" />" rel="stylesheet">
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
                </head>
                <style>
                   body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/lens.jpg);
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
                <br>
                <br>
                <br>
                  <br>
                    <br>
                    <div class="DeleteConfirmationClient container">
                        <div class="del_war">
                            <h1 class="del_war_hd">Confirm Delete</h1>
                            <p class="del_war_p">You can only delete client, if there is no deal, ticket record
                                associated with the client.<br>
                                Please ensure manual delete of clients Deals / Tickets / Other Items and then attempt
                                delete else delete will be
                                failed.<br>
                                Consider rather de-activating the client.</p>
                        </div>
                        <div class="DeleteConfirmationClient_wrapper">
                            <h1 class="hd">Client Id : ${CLIENT_OBJ.clientId}</h1>
                            <div align="center"><b>
                                    <font color="green"> ${Success} </font>
                                    <font color="red"> ${Error}</font>
                                </b></div>
                            <form:form method="post" action="delete_delete_admin_client" modelAttribute="CLIENT_OBJ">
                                <input type="hidden" name="clientId" value="${CLIENT_OBJ.clientId}" />
                                <div class="DeleteConfirmationClient_wrapper_data">
                                    <div class="DeleteConfirmationClient_wrapper_data_line a">
                                        <div class="DeleteConfirmationClient_wrapper_data_l1"
                                            style="width: 300px;text-align:start;">
                                            <label for="" class="lb">Client Name</label>
                                            <p>${CLIENT_OBJ.clientName}</p>
                                        </div>
                                        <div class="DeleteConfirmationClient_wrapper_data_l1"
                                            style="width:900px;text-align:start">
                                            <label for="" class="lb">Client Address</label>
                                            <p>${CLIENT_OBJ.address}</p>
                                        </div>
                                    </div>
                                    <div class="DeleteConfirmationClient_wrapper_data_line a">
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">City</label>
                                            <p>${CLIENT_OBJ.cityName}</p>
                                        </div>
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">Country</label>
                                            <p>${CLIENT_OBJ.countryName}</p>
                                        </div>
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">Email</label>
                                            <p>${CLIENT_OBJ.email}</p>
                                        </div>
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">Mobile</label>
                                            <p>${CLIENT_OBJ.mobile}</p>
                                        </div>
                                    </div>
                                    <div class="DeleteConfirmationClient_wrapper_data_line a">
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">Phone</label>
                                            <p>${CLIENT_OBJ.phone}</p>
                                        </div>
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">Active</label>
                                            <p>${CLIENT_OBJ.active}</p>
                                        </div>
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                        </div>
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                        </div>
                                    </div>
                                    <div class="DeleteConfirmationClient_wrapper_data_line a">
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">Company Details</label>
                                            <p>${CLIENT_OBJ.companyDetails}</p>
                                        </div>
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">Referred By</label>
                                            <p>${CLIENT_OBJ.referredBy}</p>
                                        </div>
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">GST Details</label>
                                            <p>${CLIENT_OBJ.gstDetails}</p>
                                        </div>
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">Bank Details</label>
                                            <p>${CLIENT_OBJ.bankDetails}</p>
                                        </div>
                                    </div>
                                    <div class="DeleteConfirmationClient_wrapper_data_line a">
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">Passport Number</label>
                                            <p>${CLIENT_OBJ.passportNumber}</p>
                                        </div>
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">Passport Expiry</label>
                                            <p>${CLIENT_OBJ.passportExpiry}</p>
                                        </div>
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">DOB</label>
                                            <p>${CLIENT_OBJ.birthDate}</p>
                                        </div>
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">DOA</label>
                                            <p>${CLIENT_OBJ.anniversaryDate}</p>
                                        </div>
                                    </div>
                                    <div class="DeleteConfirmationClient_wrapper_data_line a">
                                        <div class="DeleteConfirmationClient_wrapper_data_l2" style="width: 100%;">
                                            <label for="" class="lb">Remarks</label>
                                            <p>${CLIENT_OBJ.remarks}</p>
                                        </div>
                                    </div>
                                    <h1 class="hd"> Personal Preferences</h1>
                                    <div class="DeleteConfirmationClient_wrapper_data_line a">
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">Hotal Preferences</label>
                                            <p>${CLIENT_OBJ.hotelPref} Star</p>
                                        </div>
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">Cost Savy</label>
                                            <p>${CLIENT_OBJ.costSavvy}<br>
                                               <span style="color:orangered"> (Scale 1 to 10)</span>  </p>
                                        </div>
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">Service Savvy</label>
                                            <p>${CLIENT_OBJ.serviceSavvy}<br>
                                                <span style="color:orangered">  (Scale 1 to 5)</span> </p>
                                        </div>
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">Food Preferences</label>
                                            <p>${CLIENT_OBJ.foodPref}</p>
                                        </div>
                                    </div>
                                    <div class="DeleteConfirmationClient_wrapper_data_line a">
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">Aggressiveness</label>
                                            <p>${CLIENT_OBJ.aggressiveness} <br>
                                              <span style="color:orangered">(Scale 1 to 5)</span>  </p>
                                        </div>
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                            <label for="" class="lb">Payment Record</label>
                                            <p>${CLIENT_OBJ.paymentRating} <br>
                                               <span style="color:orangered"> (Scale 1 to 5)</span>  </p>
                                        </div>
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                        </div>
                                        <div class="DeleteConfirmationClient_wrapper_data_l2">
                                        </div>
                                    </div>
                                    <div class="due_today_task_data_btnss" style="margin-top: 10px;">
                                        <sec:authorize access="hasAnyRole('ADMIN','CLIENT_DELETE')">
                                            <input type="submit" style="background-color: red;color: white;"
                                                value="Confirm Delete">
                                        </sec:authorize>

                                        <sec:authorize access="hasAnyRole('ADMIN','CLIENT_EDIT')">
                                            <a href="view_edit_admin_client?clientId=${CLIENT_OBJ.clientId}"><input
                                                    type="button" value="Edit Client" /></a>
                                        </sec:authorize>
                                        <a href="view_form_admin_search_client"><input type="button"
                                                value="Client Listing"></a>
                                    </div>
                            </form:form>
                        </div>
                </body>

</html>