<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Campaign Form | UdanChoo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
    <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
    <style>
        body::before {
            content: "";
            background-image: url(${pageContext.request.contextPath}/resources/images/revamped/add_new_client.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center center;
            background-attachment: fixed;
            position: fixed;
            top: 0; left: 0;
            width: 100%; height: 100%;
            opacity: 0.45;
            z-index: -1;
        }
        .helper-text { font-size: 11px; color: #555; margin-top: 3px; }
        
        /* Standard Autocomplete Styles from Lead Form */
        .autocomplete-suggestions { border: 1px solid #999; background: red; overflow-y:auto; z-index: 9999; }
        .autocomplete-suggestion { padding: 5px 10px; color:white; background: black; cursor: pointer; }
        .autocomplete-selected { background: #F0F0F0; color: black; }
        .autocomplete-suggestions strong { font-weight: normal; color:#FABA08; }
    </style>
</head>
<body>
<div class="container">
    <div class="anc-wrapper bs">
        <h1 class="anc-heading"><i class="fa fa-plus-circle" style="color:#6082B6"></i> Add Campaign Form</h1>

        <form:form action="${pageContext.request.contextPath}/campaign/save" method="POST" modelAttribute="campaign">
            <form:hidden path="campaignFormId" />

            <div class="anc-fir-li">
                <div class="anc-cn anc-com">
                    <label for="formName" style="font-weight:600">Form Name *</label>
                    <form:input path="formName" id="formName" class="contact"
                        placeholder="e.g. Goa Summer Campaign Form" required="true"/>
                </div>

                <div class="anc-cn anc-com">
                    <label for="formType" style="font-weight:600">Platform *</label>
                    <form:select path="formType" id="formType" required="true">
                        <form:option value="">-- Select Platform --</form:option>
                        <form:option value="META">Meta (Facebook / Instagram)</form:option>
                        <form:option value="GOOGLE">Google Ads</form:option>
                    </form:select>
                </div>

                <div class="anc-cn anc-com">
                    <label for="formId" style="font-weight:600">Form ID *</label>
                    <form:input path="formId" id="formId" class="contact"
                        placeholder="e.g. 1234567890123456" required="true"/>
                    <p class="helper-text">The unique Lead Form ID from Meta Business Suite or Google Ads.</p>
                </div>

                <div class="anc-cn anc-com">
                    <label for="active" style="font-weight:600">Status</label>
                    <form:select path="active" id="active">
                        <form:option value="true">Active</form:option>
                        <form:option value="false">Inactive</form:option>
                    </form:select>
                </div>
            </div>

            <div class="anc-sec-li">
                <div class="anc-cn anc-com" style="width:50%">
                    <label for="campaignName" style="font-weight:600">Campaign Name</label>
                    <form:input path="campaignName" id="campaignName" class="contact"
                        placeholder="e.g. Goa Summer 2025"/>
                </div>
                <div class="anc-cn anc-com" style="position: relative;">
                    <label for="destination" style="font-weight:600">Destination / Location</label>
                    <form:input path="destination" id="destination" class="inf" placeholder="Type city name..." autocomplete="off" />
                    <i class="fa fa-caret-down" style="position: absolute; right: 25px; top: 43px; color: #6082B6; cursor: pointer;" onclick="$('#destination').focus()"></i>
                </div>

                <div class="anc-cn anc-com">
                    <label for="tentativeCost" style="font-weight:600">Tentative Amount</label>
                    <form:input path="tentativeCost" id="tentativeCost" type="number" min="0" class="contact"
                        placeholder="e.g. 50000"/>
                </div>


            </div>

            <div style="width: 100%; margin: 20px 0;">
                <label style="font-weight:600; display: block; margin-bottom: 12px; font-size: 15px; color: #333;">
                    <i class="fa fa-check-square" style="color:#6082B6"></i> Select Services (Tick all that apply) *
                </label>
                <div style="display: flex; flex-wrap: wrap; gap: 20px; background: rgba(255,255,255,0.9); padding: 20px; border-radius: 8px; border: 1px solid #ccc; box-shadow: inset 0 1px 3px rgba(0,0,0,0.05);">
                    <div style="display: flex; align-items: center; gap: 10px; min-width: 150px;">
                        <form:checkbox path="services" value="FLT" id="srv_FLT" style="width: 22px; height: 22px; cursor: pointer; accent-color: #6082B6;"/>
                        <label for="srv_FLT" style="cursor: pointer; font-size: 15px; font-weight: 500; color: #333;">Flight</label>
                    </div>
                    <div style="display: flex; align-items: center; gap: 10px; min-width: 150px;">
                        <form:checkbox path="services" value="HTL" id="srv_HTL" style="width: 22px; height: 22px; cursor: pointer; accent-color: #6082B6;"/>
                        <label for="srv_HTL" style="cursor: pointer; font-size: 15px; font-weight: 500; color: #333;">Hotel</label>
                    </div>
                    <div style="display: flex; align-items: center; gap: 10px; min-width: 150px;">
                        <form:checkbox path="services" value="LDP" id="srv_LDP" style="width: 22px; height: 22px; cursor: pointer; accent-color: #6082B6;"/>
                        <label for="srv_LDP" style="cursor: pointer; font-size: 15px; font-weight: 500; color: #333;">Land Package</label>
                    </div>
                    <div style="display: flex; align-items: center; gap: 10px; min-width: 150px;">
                        <form:checkbox path="services" value="VSA" id="srv_VSA" style="width: 22px; height: 22px; cursor: pointer; accent-color: #6082B6;"/>
                        <label for="srv_VSA" style="cursor: pointer; font-size: 15px; font-weight: 500; color: #333;">Visa</label>
                    </div>
                    <div style="display: flex; align-items: center; gap: 10px; min-width: 150px;">
                        <form:checkbox path="services" value="TRN" id="srv_TRN" style="width: 22px; height: 22px; cursor: pointer; accent-color: #6082B6;"/>
                        <label for="srv_TRN" style="cursor: pointer; font-size: 15px; font-weight: 500; color: #333;">Transfers</label>
                    </div>
                    <div style="display: flex; align-items: center; gap: 10px; min-width: 150px;">
                        <form:checkbox path="services" value="STS" id="srv_STS" style="width: 22px; height: 22px; cursor: pointer; accent-color: #6082B6;"/>
                        <label for="srv_STS" style="cursor: pointer; font-size: 15px; font-weight: 500; color: #333;">Sightseeing</label>
                    </div>
                    <div style="display: flex; align-items: center; gap: 10px; min-width: 150px;">
                        <form:checkbox path="services" value="INS" id="srv_INS" style="width: 22px; height: 22px; cursor: pointer; accent-color: #6082B6;"/>
                        <label for="srv_INS" style="cursor: pointer; font-size: 15px; font-weight: 500; color: #333;">Insurance</label>
                    </div>
                    <div style="display: flex; align-items: center; gap: 10px; min-width: 150px;">
                        <form:checkbox path="services" value="CRS" id="srv_CRS" style="width: 22px; height: 22px; cursor: pointer; accent-color: #6082B6;"/>
                        <label for="srv_CRS" style="cursor: pointer; font-size: 15px; font-weight: 500; color: #333;">Cruise</label>
                    </div>
                    <div style="display: flex; align-items: center; gap: 10px; min-width: 150px;">
                        <form:checkbox path="services" value="OTH" id="srv_OTH" style="width: 22px; height: 22px; cursor: pointer; accent-color: #6082B6;"/>
                        <label for="srv_OTH" style="cursor: pointer; font-size: 15px; font-weight: 500; color: #333;">Others</label>
                    </div>
                </div>
            </div>

            <div class="anc-third-li">
                <div class="anc-cn anc-com-ta" style="width:100%">
                    <label for="description" style="font-weight:600">Description</label><br>
                    <form:textarea path="description" id="description" rows="3" cols="80"
                        placeholder="Brief description of this campaign form..." maxlength="500"/>
                </div>
            </div>

            <div class="anc-btns">
                <input type="submit" value="Save Campaign Form" style="border:none;outline:none;background:#32cd32;color:white;">
                <a href="${pageContext.request.contextPath}/campaign/list">Back to List</a>
            </div>

        </form:form>
    </div>
</div>
    <script>
        $(document).ready(function() {
            $('#destination').autocomplete({
                serviceUrl: '${pageContext.request.contextPath}/getCityList',
                paramName: "cityName",
                delimiter: ",",
                minChars: 1,
                onSelect: function (suggestion) {
                    $('#destination').val(suggestion.cityName);
                    return false;
                },
                transformResult: function (response) {
                    return {
                        suggestions: $.map($.parseJSON(response), function (item) {
                            return { 
                                value: item.cityName + ' (' + item.countryName + ')', 
                                data: item.destinationId,
                                cityName: item.cityName 
                            };
                        })
                    };
                }
            });

            // Trigger suggestions on focus or click
            $('#destination').on('focus click', function() {
                if($(this).val() === '') {
                   // Optional: force search with empty string if supported
                }
            });
        });
    </script>
</body>
</html>
