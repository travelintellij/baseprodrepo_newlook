<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin_Add_Visa_Consulate</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
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
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/visa_bg3.jpg);
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
<body >
  
  
  
<div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>
  
  
  
    <div class="Admin_Add_Visa_Consulate container">
        <div class="Admin_Add_Visa_Consulate_wrapper">
            <h1 class="page-heading">Add Visa Consulate</h1>
            <div align="center"><b>
                    <font color="green"> ${Success} </font>
                    <font color="red"> ${Error}</font>
                </b></div>
            <form:form method="post" action="add_add_visa_consulate_master" modelAttribute="VISA_CONSULATE_OBJ">
                <font color="red">
                    <form:errors path="countryName" cssClass="error" /></b>
                </font>
                <font color="red">
                    <form:errors path="cityName" cssClass="error" /></b>
                </font>
                <div class="Admin_Add_Visa_Consulate_wrapper_data">
                    <div class="Admin_Add_Visa_Consulate_wrapper_data_line">
                        <div class="Admin_Add_Visa_Consulate_wrapper_data_l1">
                            <label for="">Visa Country Name (Embassy)</label> <br>
                            <input type="text" id="countryName" name="countryName" placeholder="country name"
                                required />
                            <input type="hidden" name="visaCountryCode" id="visaCountryCode" />
                        </div>
                        <div class="Admin_Add_Visa_Consulate_wrapper_data_l1">
                            <label for="">Consulate title</label> <br>
                            <input type="text" id="consulateTitle" name="consulateTitle" placeholder="Title"
                                value="${VISA_CONSULATE_OBJ.consulateTitle }" required />
                        </div>
                        <div class="Admin_Add_Visa_Consulate_wrapper_data_l1">
                            <label for="">Consulate city</label> <br>
                            <input type="text" id="cityName" name="cityName" placeholder="country name" required />
                            <input type="hidden" name="consulateCity" id="consulateCity" />
                        </div>
                        <div class="Admin_Add_Visa_Consulate_wrapper_data_l1">
                            <label for="">Email</label> <br>
                            <input type="email" id="email" name="email" value="${VISA_CONSULATE_OBJ.email }"
                                placeholder="Email" />
                        </div>
                    </div>
                    <div class="Admin_Add_Visa_Consulate_wrapper_data_line">
                        
                        <div class="Admin_Add_Visa_Consulate_wrapper_data_l1">
                            <label for="">Website</label> <br>
                            <input type="text" id="email" name="website" value="${VISA_CONSULATE_OBJ.website }"
                                placeholder="website" />
                        </div>
                        <div class="Admin_Add_Visa_Consulate_wrapper_data_l1">
                            <label for="">Telephone</label> <br>
                            <input type="text" id="telephone" name="telephone" placeholder="telephone"
                                value="${VISA_CONSULATE_OBJ.telephone }" />
                        </div>
                           <div class="Admin_Add_Visa_Consulate_wrapper_data_l1">
                            <label for="">Fax</label> <br>
                            <input type="text" id="fax" name="fax" placeholder="fax"
                                value="${VISA_CONSULATE_OBJ.fax }" />
                        </div>
                         <div class="Admin_Add_Visa_Consulate_wrapper_data_l1">
                           
                        </div>
                    </div>
                    <div class="Admin_Add_Visa_Consulate_wrapper_data_line"  style="width:100%">
                    <div class="Admin_Add_Visa_Consulate_wrapper_data_l1_add" style="width:100%">
                            <label for="">Address</label><br>
                            <textarea rows="1" style="width:97.5%" name="address"
                                htmlEscape="false">${VISA_CONSULATE_OBJ.address }</textarea>
                        </div>
                     
                    </div>
                    <div class="due_today_task_data_btns">
                        <input type="submit" name="submit" value="Add Consulate" />
                        <a href="#">Search Visa Consulate</a>
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