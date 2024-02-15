<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Document</title>
                    <script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
                </head>
                <style>
                     body::before {
            content: "";
            background-image:   url(${pageContext.request.contextPath}/resources/images/revamped/visa_bg.jpg);
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
                    <div class="Admin_View_Visa_Consulate container">
                        <div class="Admin_View_Visa_Consulate_wrapper bs">
                            <form:form method="post" action="edit_edit_visa_consulate_master"
                                modelAttribute="VISA_CONSULATE_OBJ">
                                <input type="hidden" name="consulateId" id="consulateId"
                                    value="${VISA_CONSULATE_OBJ.consulateId}" />
                                <div align="center"><b>
                                        <font color="red">
                                            <form:errors path="countryName" cssClass="error" />
                                    </b></font>
                                </div>
                                <div align="center"><b>
                                        <font color="red">
                                            <form:errors path="cityName" cssClass="error" />
                                    </b></font>
                                </div>
                                <h1 class="hd">Edit Visa Consulate</h1>
                                <div class="Admin_View_Visa_Consulate_wrapepr_data">
                                    <div class="Admin_View_Visa_Consulate_wrapepr_data_line">
                                        <div class="Admin_View_Visa_Consulate_wrapepr_data_l1">
                                            <label for="" class="lb">Visa Country Name (Embassy)</label>
                                            <p style="color:#32cd32;font-weight:bold"> ${VISA_CONSULATE_OBJ.countryName }</p>
                                            <input type="hidden" name="visaCountryCode" id="visaCountryCode"
                                                value="${VISA_CONSULATE_OBJ.visaCountryCode }" />
                                        </div>
                                        <div class="Admin_View_Visa_Consulate_wrapepr_data_l1">
                                            <label for="" class="lb">Consulate Title</label>
                                            <input type="text" id="consulateTitle" name="consulateTitle"
                                                placeholder="Title" value="${VISA_CONSULATE_OBJ.consulateTitle }"
                                                required style="width:90%"/>
                                        </div>
                                        <div class="Admin_View_Visa_Consulate_wrapepr_data_l1">
                                            <label for="" class="lb">Consulate city</label>
                                            <p>${VISA_CONSULATE_OBJ.cityName }</p>
                                            <input type="hidden" name="consulateCity" id="consulateCity"
                                                value="${VISA_CONSULATE_OBJ.consulateCity }" />
                                        </div>
                                        <div class="Admin_View_Visa_Consulate_wrapepr_data_l1">
                                            <label for="" class="lb">Address</label>
                                            <textarea rows="1" cols="30" name="address"
                                                htmlEscape="false">${VISA_CONSULATE_OBJ.address }</textarea>
                                        </div>
                                    </div>
                                    <div class="Admin_View_Visa_Consulate_wrapepr_data_line">
                                        <div class="Admin_View_Visa_Consulate_wrapepr_data_l1">
                                            <label for="" class="lb">Email</label> <br>
                                            <input type="email" id="email" name="email"
                                                value="${VISA_CONSULATE_OBJ.email }" placeholder="Email" style="width:90%"/>
                                        </div>
                                        <div class="Admin_View_Visa_Consulate_wrapepr_data_l1">
                                            <label for="" class="lb">Website</label>
                                            <input type="text" id="email" name="website"
                                                value="${VISA_CONSULATE_OBJ.website }" placeholder="website" style="width:90%"/>
                                        </div>
                                        <div class="Admin_View_Visa_Consulate_wrapepr_data_l1">
                                            <label for="" class="lb">Telephone</label>
                                            <input type="text" id="telephone" name="telephone" placeholder="telephone"
                                                value="${VISA_CONSULATE_OBJ.telephone }" style="width:90%"/>
                                        </div>
                                        <div class="Admin_View_Visa_Consulate_wrapepr_data_l1">
                                            <label for="" class="lb">Fax</label>
                                            <input type="text" id="fax" name="fax" placeholder="fax"
                                                value="${VISA_CONSULATE_OBJ.fax }" style="width:90%"/>
                                        </div>
                                    </div>
                                    <div class="due_today_task_data_btns" style="margin-top:20px">
                                        <input type="submit" name="submit" value="Update Consulate" background="#32cd32  "/>
                                        <a
                                            href="view_view_visa_consulate?consulateId=${VISA_CONSULATE_OBJ.consulateId}">Cancel</a>
                                        <a href="view_search_visa_consulate_form">Search Visa Consulate</a>
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
                                jQuery("#consulateCity").val(cityID);
                                $('input[name=consulateCity]').val(id);
                                return false;
                            },
                            transformResult: function (response) {
                                return {
                                    suggestions: $.map($.parseJSON(response), function (item) {
                                        return { value: item.cityName, data: item.destinationId };
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
                                jQuery("#visaCountryCode").val(cityID);
                                $('input[name=visaCountryCode]').val(id);
                                return false;
                            },
                            transformResult: function (response) {
                                return {
                                    suggestions: $.map($.parseJSON(response), function (item) {
                                        return { value: item.countryName, data: item.countryCode };
                                    })

                                };
                            }
                        });
                        /*
                        Following code works perfectly fine. Depending upon the country selected, this populates the other select combo for all cities within that country.
                    	
                        $('#countryName').autocomplete({
                        serviceUrl: '${pageContext.request.contextPath}/getCountryCityList',
                        paramName: "countryName",
                        delimiter: ",",
                        onSelect: function(suggestion) {
                            $('#consulateCity').empty();
                            $.each(suggestion.roomCat, function(key, value) {
                                $('#consulateCity').append($("<option class='service-small'>").val(key).text(value));
                            });
                            cityID = suggestion.data;
                            id=cityID;
                            jQuery("#countryCode").val(cityID);
                            $('input[name=countryCode]').val(id);
                            return false;
                        },
                        transformResult: function(response) {
                            return {
                                suggestions: $.map($.parseJSON(response), function(item) {
                                    return { value: item.countryName, data: item.countryCode,roomCat : item.cityKeyValue };
                                })
                                
                            };
                            
                        }
                    });
                        */

                    </script>


                </body>

</html>