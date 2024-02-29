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
<style>
   body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/view_cli.jpg);
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
    <div class="ViewClientDetails container">
        <div class="ViewClientDetails_wrapper bs">
            <h1 style="color:#F8AF51;font-size:25px;">View Client</h1>
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <h2 style="color:#32cd32;margin:10px 0">Client id :  ${CLIENT_OBJ.clientId} </h2>
            <form:form method="post" action="view_edit_admin_client" modelAttribute="CLIENT_OBJ">
            <input type="hidden" name="clientId" value="${CLIENT_OBJ.clientId}" />
            <div class="ViewClientDetails_wrapper_data">
                <div class="ViewClientDetails_wrapper_data_line a">
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="">Client Name</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.clientName}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="">City</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.cityName}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="">Country</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.countryName}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="">Email</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.email}</p>
                    </div>
                </div>
                <div class="ViewClientDetails_wrapper_data_line a">
                    <div class="ViewClientDetails_wrapper_dl1_add">
                        <label for="" class="">Client address</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.address}</p>
                    </div>
                </div>
                <div class="ViewClientDetails_wrapper_data_line a">
                    <div class="ViewClientDetails_wrapper_dl1_M">
                        <label for="" class="">Mobile</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.mobile}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="">Phone</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.phone}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="">Active</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.active}</p>
                    </div>
                </div>
                <div class="ViewClientDetails_wrapper_data_line a">
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="">Company Details</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.companyDetails}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="">Referred by</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.referredBy}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="">GST Details</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.gstDetails}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="">Bank Details</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.bankDetails}</p>
                    </div>
                </div>

                <div class="ViewClientDetails_wrapper_data_line a">
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="">Passport Number</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.passportNumber}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="">Passport Expiry</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.passportExpiry}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="">DOB</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.birthDate}</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="">DOA</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.anniversaryDate}</p>
                    </div>
                </div>
                <div class="ViewClientDetails_wrapper_data_line a">
                    <div class="ViewClientDetails_wrapper_dl1_rem">
                        <label for="" class="">Remarks</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.remarks}</p>
                    </div>
                </div>
                <h2 style="margin: 10px 0;color:#32cd32 ">Personal Prefrences</h2>
                <div class="ViewClientDetails_wrapper_data_line a">
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="" >Hotal preferences</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.hotelPref} Star</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="">Cost Savy</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.costSavvy} (Scale 1 to 10)</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="">Service Savy</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.serviceSavvy} (Scale 1 to 5)</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="">Food preferences</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.foodPref}</p>
                    </div>
                </div>
                <div class="ViewClientDetails_wrapper_data_line a">
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="">Aggressivenness</label>
                        <p style="color:#023e8a;font-weight:600" >${CLIENT_OBJ.aggressiveness} (Scale 1 to 5)</p>
                    </div>
                    <div class="ViewClientDetails_wrapper_dl1">
                        <label for="" class="">Payment Record</label>
                        <p style="color:#023e8a;font-weight:600">${CLIENT_OBJ.paymentRating}
                        (Scale 1 to 5) </p>
                    </div>
                     <div class="ViewClientDetails_wrapper_dl1">
               
                    </div>
                      <div class="ViewClientDetails_wrapper_dl1">
               
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