<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ViewClientDetails</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
    <script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<body style="background: url(${pageContext.request.contextPath}/resources/images/revamped/view_cli.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
    <div class="ViewClientDetails container">
        <div class="ViewClientDetails_wrapper">
            <h1 style="color:#F8AF51;font-size:25px;">View Client</h1>
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <h2 style="color:#32cd32;margin:10px 0">Client id :  ${CLIENT_OBJ.clientId} </h2>
            <form:form method="post" action="view_edit_admin_client" modelAttribute="CLIENT_OBJ">
            <input type="hidden" name="clientId" value="${CLIENT_OBJ.clientId}" />
            <div class="ViewClientDetails_wrapper_data">
                <div class="ViewClientDetails_wrapper_data_line bc-clr">
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">Client Name</label>
                        <p>${CLIENT_OBJ.clientName}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">City</label>
                        <p>${CLIENT_OBJ.cityName}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">Country</label>
                        <p>${CLIENT_OBJ.countryName}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">Email</label>
                        <p>${CLIENT_OBJ.email}</p>
                    </div>
                </div>
                <div class="ViewClientDetails_wrapper_data_line bc-clr">
                    <div class="ViewClientDetails_wrapper_dl1_add">
                        <label for="" class="lb">Client address</label>
                        <p>${CLIENT_OBJ.address}</p>
                    </div>
                </div>
                <div class="ViewClientDetails_wrapper_data_line bc-clr">
                    <div class="ViewClientDetails_wrapper_dl1_M">
                        <label for="" class="lb">Mobile</label>
                        <p>${CLIENT_OBJ.mobile}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">Phone</label>
                        <p>${CLIENT_OBJ.phone}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">Active</label>
                        <p>${CLIENT_OBJ.active}</p>
                    </div>
                </div>
                <div class="ViewClientDetails_wrapper_data_line bc-clr">
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">Company Details</label>
                        <p>${CLIENT_OBJ.companyDetails}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">Referred by</label>
                        <p>${CLIENT_OBJ.referredBy}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">GST Details</label>
                        <p>${CLIENT_OBJ.gstDetails}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">Bank Details</label>
                        <p>${CLIENT_OBJ.bankDetails}</p>
                    </div>
                </div>

                <div class="ViewClientDetails_wrapper_data_line bc-clr">
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">Passport Number</label>
                        <p>${CLIENT_OBJ.passportNumber}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">Passport Expiry</label>
                        <p>${CLIENT_OBJ.passportExpiry}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">DOB</label>
                        <p>${CLIENT_OBJ.birthDate}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">DOA</label>
                        <p>${CLIENT_OBJ.anniversaryDate}</p>
                    </div>
                </div>
                <div class="ViewClientDetails_wrapper_data_line bc-clr">
                    <div class="ViewClientDetails_wrapper_dl1_rem">
                        <label for="" class="lb">Remarks</label>
                        <p>${CLIENT_OBJ.remarks}</p>
                    </div>
                </div>
                <h2 style="margin: 10px 0;color:#32cd32 ">Personal Prefrences</h2>
                <div class="ViewClientDetails_wrapper_data_line bc-clr">
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">Hotal preferences</label>
                        <p>${CLIENT_OBJ.hotelPref} Star</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">Cost Savy</label>
                        <p>${CLIENT_OBJ.costSavvy} (Scale 1 to 10)</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">Service Savy</label>
                        <p>${CLIENT_OBJ.serviceSavvy} (Scale 1 to 5)</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">Food preferences</label>
                        <p>${CLIENT_OBJ.foodPref}</p>
                    </div>
                </div>
                <div class="ViewClientDetails_wrapper_data_line bc-clr">
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">Aggressivenness</label>
                        <p>${CLIENT_OBJ.aggressiveness} (Scale 1 to 5)</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="lb">Payment Record</label>
                        <p>${CLIENT_OBJ.paymentRating}
                        (Scale 1 to 5) </p>
                    </div>
                </div>
                <div class="due_today_task_data_btns">
                <sec:authorize access="hasAnyRole('ADMIN','CLIENT_EDIT')">
                    <input type="submit" value="Edit Client">
                </sec:authorize>
                
                <a href="view_form_admin_search_client">Client Listing</a>

                </div>
            </div>
                </form:form>
        </div>
    </div>
</body>
</html>