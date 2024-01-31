<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
            background-image:   url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);
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
        <div class="ViewClientDetails_wrapper">
            <form:form method="post" action="edit_edit_admin_client" modelAttribute="CLIENT_OBJ">
                <input type="hidden" name="clientId" value="${CLIENT_OBJ.clientId}" />
                <h1 style="font-size:25px;color:#F8AF51">Edit Client</h1>
                <div align="center"><b>
                        <font color="green"> ${Success} </font>
                        <font color="red"> ${Error}</font>
                    </b></div>
                <h2 style="color:#32cd32 ">Client id : ${CLIENT_OBJ.clientId}</h2>
                <div class="ViewClientDetails_wrapper_data">
                    <div class="ViewClientDetails_wrapper_data_line">
                        <div class="ViewClientDetails_wrapper_dl1">
                            <label for="" class="lb">Client Name</label>
                            <input class="contact" type="text" name="clientName" value="${CLIENT_OBJ.clientName}"
                                required style="width:90%"/>
                            <font color="red">
                                <form:errors path="clientName" cssClass="error" />
                            </font>
                        </div>
                        <div class="ViewClientDetails_wrapper_dl1">
                            <label for="" class="lb">City</label>
                            <input type="text" name="cityName" id="cityName" size="35" value="${CLIENT_OBJ.cityName}"  style="width:90%"/>
                            <input type="hidden" name="cityId" value="${CLIENT_OBJ.cityId}" />
                        </div>
                        <div class="ViewClientDetails_wrapper_dl1">
                            <label for="" class="lb">Country</label>
                            <input type="text" name="countryName" id="countryName" size="35"
                                value="${CLIENT_OBJ.countryName}"  style="width:90%" />
                            <input type="hidden" name="countryId" value="${CLIENT_OBJ.countryId}" />
                        </div>
                        <div class="ViewClientDetails_wrapper_dl1">
                            <label for="" class="lb">Email</label> <br>
                            <input class="contact" type="text" name="email" value="${CLIENT_OBJ.email}"  style="width:90%"/><br>
                            <font color="red">
                                <form:errors path="email" cssClass="error" />
                            </font>

                        </div>
                    </div>
                    <div class="ViewClientDetails_wrapper_data_line">
                        <div class="ViewClientDetails_wrapper_dl1_add">
                            <label for="" class="lb">Client address</label> <br>
                            <textarea rows="1" cols="140" name="address"
                                maxlength="250">${CLIENT_OBJ.address}</textarea>
                            <font color="red">
                                <form:errors path="address" cssClass="error" />
                            </font>
                        </div>
                    </div>
                    <div class="ViewClientDetails_wrapper_data_line">
                        <div class="ViewClientDetails_wrapper_dl1_M">
                            <label for="" class="lb">Mobile</label>
                            <input class="contact" type="number" name="mobile" step="1"
                                value="${CLIENT_OBJ.mobile}"  style="width:90%"/><br>
                            <font color="red">
                                <form:errors path="mobile" cssClass="error" />
                            </font>

                        </div>
                        <div class="ViewClientDetails_wrapper_dl1">
                            <label for="" class="lb">Phone</label> <br>
                            <input class="contact" type="number" name="phone"  step="1"
                                value="${CLIENT_OBJ.phone}"  style="width:90%"/><br>
                            <font color="red">
                                <form:errors path="phone" cssClass="error" />
                            </font>
                        </div>
                        <div class="ViewClientDetails_wrapper_dl1">
                            <label for="" class="lb">Active</label>
                            <select id="active" name="active" style="width:90%;">
                                <c:if test="${CLIENT_OBJ.active eq true }">
                                    <option class="service-small" value="true" selected>
                                        <c:out value="True" />
                                    </option>
                                    <option class="service-small" value="false">
                                        <c:out value="False" />
                                    </option>
                                </c:if>
                                <c:if test="${CLIENT_OBJ.active eq false}">
                                    <option class="service-small" value="true">
                                        <c:out value="True" />
                                    </option>
                                    <option class="service-small" value="false" selected>
                                        <c:out value="False" />
                                    </option>

                                </c:if>
                            </select>
                        </div>
                    </div>
                    <div class="ViewClientDetails_wrapper_data_line">
                        <div class="ViewClientDetails_wrapper_dl1">
                            <label for="" class="lb">Company Details</label>
                            <textarea rows="1" cols="30" name="companyDetails"
                                maxlength="250" style="width:90%">${CLIENT_OBJ.companyDetails}</textarea><br>
                            <font color="red">
                                <form:errors path="companyDetails" cssClass="error" />
                            </font>

                        </div>
                        <div class="ViewClientDetails_wrapper_dl1">
                            <label for="" class="lb">Referred by</label>
                            <input class="contact" type="text" name="referredBy" value="${CLIENT_OBJ.referredBy}" style="width:90%"/><br>
                            <font color="red">
                                <form:errors path="referredBy" cssClass="error" />
                            </font>
                        </div>
                        <div class="ViewClientDetails_wrapper_dl1">
                            <label for="" class="lb">GST Details</label>
                            <input class="contact" type="text" name="gstDetails" value="${CLIENT_OBJ.gstDetails}" style="width:90%"/><br>
                            <font color="red">
                                <form:errors path="gstDetails" cssClass="error" />
                            </font>
                        </div>
                        <div class="ViewClientDetails_wrapper_dl1">
                            <label for="" class="lb">Bank Details</label>
                            <textarea rows="1" cols="30" name="bankDetails"
                                maxlength="250">${CLIENT_OBJ.bankDetails}</textarea><br>
                            <font color="red">
                                <form:errors path="bankDetails" cssClass="error" />
                            </font>
                        </div>
                    </div>
                    <div class="ViewClientDetails_wrapper_data_line">
                        <div class="ViewClientDetails_wrapper_dl1">
                            <label for="" class="lb">Passport Number</label>
                            <input class="contact" type="text" name="passportNumber"
                                value="${CLIENT_OBJ.passportNumber}" style="width:90%"/>
                        </div>
                        <div class="ViewClientDetails_wrapper_dl1">
                            <label for="" class="lb">Passport Expiry</label>
                            <input type="date" name="passportExpiry" value="${CLIENT_OBJ.passportExpiry}" style="width:90%"/>
                        </div>
                        <div class="ViewClientDetails_wrapper_dl1">
                            <label for="" class="lb">DOB</label>
                            <input type="date" name="birthDate" value="${CLIENT_OBJ.birthDate}" style="width:90%" />
                        </div>
                        <div class="ViewClientDetails_wrapper_dl1">
                            <label for="" class="lb">DOA</label>
                            <input type="date" name="anniversaryDate" value="${CLIENT_OBJ.anniversaryDate}" style="width:90%" />
                        </div>
                    </div>
                    <div class="ViewClientDetails_wrapper_data_line">
                        <div class="ViewClientDetails_wrapper_dl1_rem">
                            <label for="" class="lb">Remarks</label>
                            <textarea rows="1" cols="140" name="remarks"
                                maxlength="250">${CLIENT_OBJ.remarks}</textarea><br>
                            <font color="red">
                                <form:errors path="remarks" cssClass="error" />
                            </font>

                        </div>
                    </div>
                    <h2 style="color:#32cd32">Personal Prefrences</h2>
                    <div class="ViewClientDetails_wrapper_data_line">
                        <div class="ViewClientDetails_wrapper_dl1">
                            <label for="" class="lb">Hotal preferences</label>
                            <select id="type" name="hotelPref" style="width:90%">
                                <option class="service-small" value="0"> Please Select </option>
                                <c:forEach var="i" begin="1" end="5">
                                    <c:if test="${i != CLIENT_OBJ.hotelPref }">
                                        <option class="service-small" value="${i}">
                                            <c:out value="${i}" /> Star
                                        </option>
                                    </c:if>
                                    <c:if test="${i == CLIENT_OBJ.hotelPref }">
                                        <option class="service-small" value="${i}" selected>
                                            <c:out value="${i}" /> Star
                                        </option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="ViewClientDetails_wrapper_dl1">
                            <label for="" class="lb">Cost Savy</label>
                            <select id = "type" name = "costSavvy" style="width:90%">
									<option class="service-small" value = "0">  Please Select  </option>
									<c:forEach var = "i" begin = "1" end = "10">
    	     							<c:if test="${i != CLIENT_OBJ.costSavvy }">
    	     								<option class="service-small" value = "${i}"> <c:out value = "${i}"/></option>
    	     							</c:if>
    	     							<c:if test="${i == CLIENT_OBJ.costSavvy }">
    	     								<option class="service-small" value = "${i}" selected> <c:out value = "${i}"/></option>
    	     							</c:if>
      								</c:forEach>
      							</select>
									(Scale 1 to 10) 
                        </div>
                        <div class="ViewClientDetails_wrapper_dl1">
                            <label for="" class="lb">Service Savy</label>
                            <select id="type" name="costSavvy" style="width:90%">
                                <option class="service-small" value="0"> Please Select </option>
                                <c:forEach var="i" begin="1" end="10">
                                    <c:if test="${i != CLIENT_OBJ.costSavvy }">
                                        <option class="service-small" value="${i}">
                                            <c:out value="${i}" />
                                        </option>
                                    </c:if>
                                    <c:if test="${i == CLIENT_OBJ.costSavvy }">
                                        <option class="service-small" value="${i}" selected>
                                            <c:out value="${i}" />
                                        </option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            (Scale 1 to 10)
                        </div>
                        <div class="ViewClientDetails_wrapper_dl1">
                            <label for="" class="lb">Food preferences</label>
                            <select id="type" name="foodPref" style="width:90%">
                                <c:if test="${CLIENT_OBJ.foodPref eq 'nveg'}">
                                    <option class="service-small" value="veg"> Veg</option>
                                    <option class="service-small" value="nveg" selected> Non-Veg</option>
                                </c:if>
                                <c:if test="${CLIENT_OBJ.foodPref ne 'nveg'}">
                                    <option class="service-small" value="veg" selected> Veg</option>
                                    <option class="service-small" value="nveg"> Non-Veg</option>
                                </c:if>

                            </select>
                        </div>
                    </div>
                    <div class="ViewClientDetails_wrapper_data_line">
                        <div class="ViewClientDetails_wrapper_dl1" style="width:295px">
                            <label for="" class="lb">Aggressivenness</label>
                            <select id="type" name="aggressiveness" style="width:90%">
                                <option class="service-small" value="0"> Please Select </option>
                                <c:forEach var="i" begin="1" end="5">
                                    <c:if test="${i != CLIENT_OBJ.aggressiveness }">
                                        <option class="service-small" value="${i}">
                                            <c:out value="${i}" />
                                        </option>
                                    </c:if>
                                    <c:if test="${i == CLIENT_OBJ.aggressiveness }">
                                        <option class="service-small" value="${i}" selected>
                                            <c:out value="${i}" />
                                        </option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            (Scale 1 to 5)
                        </div>
                        <div class="ViewClientDetails_wrapper_dl1" style="width:295px">
                            <label for="" class="lb">Payment Record</label>
                            <select id="type" name="paymentRating" style="width:90%">
                                <option class="service-small" value="0"> Please Select </option>
                                <c:forEach var="i" begin="1" end="5">
                                    <c:if test="${i != CLIENT_OBJ.paymentRating }">
                                        <option class="service-small" value="${i}">
                                            <c:out value="${i}" />
                                        </option>
                                    </c:if>
                                    <c:if test="${i == CLIENT_OBJ.paymentRating }">
                                        <option class="service-small" value="${i}" selected>
                                            <c:out value="${i}" />
                                        </option>
                                    </c:if>
                                </c:forEach>
                            </select>
                            (Scale 1 to 5)
                        </div>
                    </div>
                    <div class="due_today_task_data_btns">
                        <input type="submit" value="Update Client" style="background-color:#32cd32 ;color:white;">
                        <a href="view_form_admin_search_client">Client Listing</a>
                    </div>
                </div>
            </form:form>
        </div>
    </div>

    <script>
        $('#cityName').autocomplete({
            serviceUrl: '${pageContext.request.contextPath}/getCityList',
            paramName: "cityName",
            delimiter: ",",
            onSelect: function (suggestion) {
                cityID = suggestion.data;
                id = cityID;
                jQuery("#destinationId").val(cityID);
                $('input[name=cityId]').val(id);
                return false;
            },
            transformResult: function (response) {
                return {
                    suggestions: $.map($.parseJSON(response), function (item) {
                        return {
                            value: item.cityName,
                            data: item.destinationId
                        };
                    })

                };
            }
        });


        $('#countryName').autocomplete({
            serviceUrl: '${pageContext.request.contextPath}/getCountryList',
            paramName: "countryName",
            delimiter: ",",
            onSelect: function (suggestion) {
                cityID = suggestion.data;
                id = cityID;
                jQuery("#destinationId").val(cityID);
                $('input[name=countryId]').val(id);
                return false;
            },
            transformResult: function (response) {
                return {
                    suggestions: $.map($.parseJSON(response), function (item) {
                        return { value: item.countryName, data: item.destinationId };
                    })

                };
            }
        });
    </script>

</body>

</html>