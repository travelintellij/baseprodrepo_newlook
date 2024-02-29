<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
	<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <title>Add new client</title>
    <link rel="stylesheet" href="style.css">
</head>

<style>
.autocomplete-suggestions { border: 1px solid #999; background: red;overflow-y:auto}
		.autocomplete-suggestion {padding: 2px 5px;color:white; background: black;overflow-y: auto;overflow-y:auto}
		.autocomplete-selected { background: #F0F0F0;overflow-y:auto} 
		.autocomplete-suggestions strong { font-weight: normal; color:#FABA08;overflow-y:auto}
		.autocomplete-group { padding: 2px 5px;overflow-y:auto}
		.autocomplete-group strong { display: block; border-bottom: 1px solid #000;  background: black ; color:black overflow-y:auto}
		.autocomplete-selected:hover{
		color:black
		}
		 body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/add_new_client.jpg);
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
		v
</style>

<body>
    <div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>
    <div class="container">
        <div align="center"><b>
                <font color="green"> ${Success} </font>
                <font color="red"> ${Error}</font>
            </b></div>
                <form:form method="post" action="create_create_admin_client" modelAttribute="CLIENT_OBJ">
        <div class="anc-wrapper bs">
            <h1 class="anc-heading">Add New Client</h1>
          
                <div class="anc-fir-li">
                    <div class="anc-cn anc-com">
                        <label for="cn" style="font-weight:600">Client Name</label>
                        <input class="contact" type="text" name="clientName" value="${CLIENT_OBJ.clientName}" required
                            id="cn" />
                        <font color="red">
                            <form:errors path="clientName" cssClass="error" />
                        </font>
                    </div>
                     <div class="anc-cn anc-com">
                        <label for="country" style="font-weight:600">Country</label><br>
                        <input type="text" name="countryName" id="countryName" size="35"
                            value="${CLIENT_OBJ.countryName}" id="country" />
                        <input type="hidden" name="countryId" value="${CLIENT_OBJ.countryId}" />
                    </div>
                   
                    <div class="anc-city anc-com">
                        <label for="cityName" style="font-weight:600">City</label>
                        <input type="text" name="cityName" id="cityName" size="35" value="${CLIENT_OBJ.cityName}" />
                        <input type="hidden" name="cityId" value="${CLIENT_OBJ.cityId}" />
                    </div>
                    
                      <div class="anc-rb anc-com">
                        <label for="rb" style="font-weight:600">Refered by</label>
                        <input class="contact" type="text" name="referredBy" value="${CLIENT_OBJ.referredBy}" id="rb" />
                        <font color="red">
                            <form:errors path="referredBy" cssClass="error" />
                        </font>
                    </div>
                   
                </div>
                <div class="anc-sec-li">
                   <div class="anc-phone anc-com">
                        <label for="phone" style="font-weight:600">Phone</label><br>
                        <input class="contact" type="number" name="phone" style="height:30px;" step="1"
                            value="${CLIENT_OBJ.phone}" id="phone" />
                        <font color="red">
                            <form:errors path="phone" cssClass="error" />
                        </font>
                    </div>
                    <div class="anc-mail anc-com">
                        <label for="email" style="font-weight:600">Email</label><br>
                        <input class="contact" type="text" name="email" value="${CLIENT_OBJ.email}" id="email" />
                        <font color="red">
                            <form:errors path="email" cssClass="error" />
                        </font>
                    </div>
                   
                    <div class="anc-mobile anc-com">
                        <label for="mobile" style="font-weight:600">Mobile</label><br>
                        <input class="contact" type="number" name="mobile" style="height:30px;" step="1"
                            value="${CLIENT_OBJ.mobile}" id="mobile" />
                        <font color="red">
                            <form:errors path="mobile" cssClass="error" />
                        </font>
                    </div>
                </div>
                <div class="anc-third-li">
                    <div class="anc-passport anc-com">
                        <label for="Passport" style="font-weight:600">Passport Number</label><br>
                        <input class="contact" type="text" name="passportNumber" value="${CLIENT_OBJ.passportNumber}"
                            id="Passport" />
                    </div>
                    <div class="anc-passex anc-com">
                        <label for="passportexpiry" style="font-weight:600">Passport Expiry</label><br>
                        <input type="date" name="passportExpiry" value="${CLIENT_OBJ.passportExpiry}"
                            id="passportexpiry" />
                    </div>
                    <div class="anc-DOB anc-com">
                        <label for="DOB" style="font-weight:600">DOB</label><br>
                        <input type="date" name="birthDate" value="${CLIENT_OBJ.birthDate}" id="DOB" />
                    </div>
                    <div class="anc-DOA anc-com">
                        <label for="DOA" style="font-weight:600">DOA</label><br>
                        <input type="date" name="anniversaryDate" value="${CLIENT_OBJ.anniversaryDate}" id="DOA" />
                    </div>
                </div>
                <div class="anc-forth-li">
                    <div class="anc-con-del anc-com-ta">
                        <label for="company-des" style="font-weight:600">Company Details</label><br>
                        <textarea rows="1" cols="5" name="companyDetails"
                            maxlength="250">${CLIENT_OBJ.companyDetails}</textarea>
                        <font color="red">
                            <form:errors path="companyDetails" cssClass="error" />
                        </font>
                    </div>
                     <div class="anc-gst anc-com">
                        <label for="gst" style="font-weight:600">GST Details</label>
                        <input class="contact" type="text" name="gstDetails" value="${CLIENT_OBJ.gstDetails}"
                            id="gst" />
                        <font color="red">
                            <form:errors path="gstDetails" cssClass="error" />
                        </font>
                    </div>
                    <div class="anc-bank-des anc-com-ta">
                        <label for="bank-des" style="font-weight:600">Bank Details</label><br>
                        <textarea rows="2" cols="50" name="bankDetails"
                            maxlength="250">${CLIENT_OBJ.bankDetails}</textarea>
                        <font color="red">
                            <form:errors path="bankDetails" cssClass="error" />
                        </font>
                    </div>
                </div>
                <div class="anc-fif-li">
                    <div class="anc-con-ca anc-com-ta">
                        <label for="cli-add" style="font-weight:600">Client Address</label><br>
                        <textarea rows="2" cols="50" name="address" maxlength="250">${CLIENT_OBJ.address}</textarea>
                        <font color="red">
                            <form:errors path="address" cssClass="error" />
                        </font>
                    </div>
                    <div class="anc-bank-des anc-com-ta">
                        <label for="remarks" style="font-weight:600">Remarks</label><br>
                        <textarea rows="2" cols="50" name="remarks" maxlength="250">${CLIENT_OBJ.remarks}</textarea>
                        <font color="red">
                            <form:errors path="remarks" cssClass="error" />
                        </font>
                    </div>
                </div>
        </div>
        <div class="anc-personal-pref bs">
            <h2 class="anc-pp" >Personal Prefrences</h2>
            <div class="pp-wrapper">
                <div class="pp-d1">
                    <label for="" style="font-weight:600">Hotel Preferences</label><br>
                    <div class="anc-pref">
                        <select id="type" name="hotelPref" style="width:120px;">
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
                </div>
                <div class="pp-d1">
                    <label for="" style="font-weight:600">Cost Savy</label><br>
                    <div class="anc-pref">
                        <select id="type" name="costSavvy" style="width:120px;">
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
                    </div>
                    <p style="margin-top: 5px;color:blue">(Scale 1 to 10)</p>
                </div>
                <div class="pp-d1">
                    <label for="" style="font-weight:600">Service Savvy</label><br>
                    <div class="anc-pref">
                        <select id="type" name="serviceSavvy" style="width:120px;">
                            <option class="service-small" value="0"> Please Select </option>
                            <c:forEach var="i" begin="1" end="5">
                                <c:if test="${i != CLIENT_OBJ.serviceSavvy }">
                                    <option class="service-small" value="${i}">
                                        <c:out value="${i}" />
                                    </option>
                                </c:if>
                                <c:if test="${i == CLIENT_OBJ.serviceSavvy }">
                                    <option class="service-small" value="${i}" selected>
                                        <c:out value="${i}" />
                                    </option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                    <p style="margin-top: 5px;color:blue">(Scale 1 to 5)</p>
                </div>
                <div class="pp-d1">
                    <label for="" style="font-weight:600">Food Pref.</label><br>
                    <div class="anc-pref">
                        <select id="type" name="foodPref" style="width:120px;">
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
                <div class="pp-d1">
                    <label for="" style="font-weight:600">Aggressiveness</label><br>
                    <div class="anc-pref">
                        <select id="type" name="aggressiveness" style="width:120px;">
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
                    </div>
                    <p style="margin-top: 5px;color:blue">(Scale 1 to 5)</p>
                </div>
                <div class="pp-d1">
                    <label for="" style="font-weight:600">Payment Record</label><br>
                    <div class="anc-pref">
                        <select id="type" name="paymentRating" style="width:120px;">
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
                    </div>
                    <p style="margin-top: 5px;color:blue">(Scale 1 to 10)</p>
                </div>
            </div>
            <div class="anc-btns">
                <input type="submit" value="Add Client" style="border: none;outline: none;
                ">
                <a href="view_form_admin_search_client">Client Listing</a>
            </div>
        </div>
          </form:form>
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
                jQuery("#countryId").val(cityID);
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