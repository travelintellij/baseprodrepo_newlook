<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
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
            background-image: url(${pageContext.request.contextPath}/resources/images/revamped/capture_lead_bg.jpg);
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
   
   <div class="autocomplete-suggestions" style="display:none">
    <div class="autocomplete-group" ><strong>NHL</strong></div>
    <div class="autocomplete-suggestion autocomplete-selected" >...</div>
    <div class="autocomplete-suggestion">...</div>
    <div class="autocomplete-suggestion">...</div>
</div>
   
    <div class="edit_lead container">
        <div class="edit_lead_wrapper bs">
            <form:form modelAttribute="LEAD_OBJ" action="create_create_lead">
                <h1 class="page-heading">Capture New Lead</h1>
                <caption> 
                    <font color="red">
                        <form:errors path="adults" cssClass="error" />
                    </font>
                </caption>
                <div class="edit_lead_wrapper_data">
                    <div class="edit_lead_wrapper_data_line" style="margin-top: 10px;">
                        <div class="edit_lead_wrapper_data_l1">
                            <label for="" style="font-weight:800">Lead Id</label>
                            <p>Auto Generated</p>
                        </div>
                        <div class="edit_lead_wrapper_data_l1">
                            <label for=""  style="font-weight:800">Lead Markers</label>
                            <div class="lead_markers_ch">
                                <div class="sun_edit_lead">
                                    <p for="">Is Qualified</p>
                                    <form:checkbox path="qualified" />
                                </div>
                                <div class="sun_edit_lead">
                                    <p for="">Is Flagged</p>
                                    <form:checkbox path="flagged" />
                                </div>
                            </div>
                        </div>
                        <div class="edit_lead_wrapper_data_l1">
                            <label for=""  style="font-weight:800">Contact</label> <br>
                            <form:input path="contactName" name="contactName" /><br>
                            <form:hidden path="contactId" />
                            <font color="red">
                                <form:errors path="contactName" cssClass="error" />
                            </font>
                        </div>
                        <div class="edit_lead_wrapper_data_l1">
                            <label for=""  style="font-weight:800">Lead Owner</label>
                            <sec:authorize access="hasAnyRole('ADMIN','LEAD_MANAGER')">
                                <td>
                                    <div class="select">
                                        <form:select path="leadOwner" required="required" style="width:90%">
                                            <c:forEach items="${ACTIVE_USERS_MAP}" var="userMap">
                                                <c:if test="${userMap.key eq userId }">
                                                    <option class="service-small" value="${userMap.key}" selected>
                                                        ${userMap.value}</option>
                                                </c:if>
                                                <c:if test="${userMap.key ne userId }">
                                                    <option class="service-small" value="${userMap.key}">
                                                        ${userMap.value}</option>
                                                </c:if>
                                            </c:forEach>
                                        </form:select>
                                    </div>
                                </td>
                            </sec:authorize>
                            <sec:authorize access="! hasAnyRole('ADMIN','LEAD_MANAGER')">
                                <td>
                                    ${userName }
                                </td>
                            </sec:authorize>
                        </div>
                    </div>
                    <div class="edit_lead_wrapper_data_line" style="margin-top: 10px;">
                        <div class="edit_lead_wrapper_data_l1">
                            <label for=""  style="font-weight:800">Source</label>
                            <form:input path="sourceName" name="sourceName" />
                            <form:hidden path="source" />
                            <font color="red">
                                <form:errors path="sourceName" cssClass="error" />
                            </font>
                        </div>
                        <div class="edit_lead_wrapper_data_l1">
                            <label for=""  style="font-weight:800">Destination</label>
                            <form:input path="destinationName" />
                            <form:hidden path="destination" />
                            <font color="red">
                                <form:errors path="destinationName" cssClass="error" />
                            </font>
                        </div>
                        <div class="edit_lead_wrapper_data_l1 adults_box_edit_box">
                            <div class="adults_box_edit">
                                <label for=""  style="font-weight:800">Adults</label> <br>
                                <form:input path="adults" type="number" min="0" />
                            </div>
                            <div class="adults_box_edit">
                                <label for=""  style="font-weight:800">Children</label> <br>
                                <form:input path="children" type="number" min="0" />
                            </div>
                            <div class="adults_box_edit">
                                <label for=""  style="font-weight:800">Age Info</label> <br>
                                <form:input path="childrenAgeInfo" />
                            </div>
                        </div>
                        <div class="edit_lead_wrapper_data_l1">
                            <label for=""  style="font-weight:800">Lead Source</label>
                            <form:select path="leadSource"  style="width:90%">
                                <form:options items="${PARTNERS_MAP}" />
                            </form:select>
                        </div>
                    </div>
                    <div class="edit_lead_wrapper_data_line" style="margin: 10px 0;">
                        <div class="edit_lead_wrapper_data_l1">
                            <label for=""  style="font-weight:800">Travel Start Date</label>
                            <form:input path="travelStartDate" type="date" required="required" />
                        </div>
                        <div class="edit_lead_wrapper_data_l1">
                            <label for=""  style="font-weight:800">Travel End Date</label>
                            <form:input path="travelEndDate" type="date" required="required" />
                        </div>
                        <div class="edit_lead_wrapper_data_l1">
                            <label for=""  style="font-weight:800">Tentative Amount</label> <br>
                            <form:input path="tentativeCost" type="number" min="100" />
                             </div>
                                <div class="edit_lead_wrapper_data_l1">
                                    <label for=""  style="font-weight:800">Status</label>
                                    <p style="color:#32cd32;font-weight:bold">${LEAD_OBJ.statusName}</p>
                                    <form:hidden path="leadStatus" />
                                </div>
                        </div>
                        <div align="center">
                            <font color="red">
                                <form:errors path="travelEndDate" cssClass="error" />
                            </font>
                            </caption>
                        </div>
                        <caption>
                            <font color="red">
                                <form:errors path="minOneserviceError" cssClass="error" />
                            </font>
                        </caption>
                        <div style="text-align:start">
                          <label for="" style="margin-right: 20px;   color: black;
    font-weight: 800;">Select Services</label></div>
                        <div class="edit_lead_wrapper_data_line" style=" margin-top:5px;padding:10px 5px">
                            <div class="edit_ser_box" style="padding:0 5px">
                                <div class="ser_1" style="display:flex;align-items:center">
                                    <label for=""  style="font-weight:800">Flight</label>
                                    <form:checkbox path="flight" name="flight" style="width:18px;height:18px;margin-left:5px"/>
                                </div>
                                <div class="ser_1" style="display:flex;align-items:center">
                                    <label for=""  style="font-weight:800">Hotel</label>
                                    <form:checkbox path="hotel" name="hotel" style="width:18px;height:18px;margin-left:5px"/>
                                </div>
                                <div class="ser_1" style="display:flex;align-items:center">
                                    <label for=""  style="font-weight:800">Visa</label>
                                    <form:checkbox path="visa" name="visa" style="width:18px;height:18px;margin-left:5px"/>
                                </div>
                                <div class="ser_1" style="display:flex;align-items:center">
                                    <label for=""  style="font-weight:800">Insurance</label>
                                    <form:checkbox path="insurance" name="insurance" style="width:18px;height:18px;margin-left:5px"/>
                                </div>
                                <div class="ser_1" style="display:flex;align-items:center">
                                    <label for=""  style="font-weight:800">Transfers</label>
                                    <form:checkbox path="transfers" name="transfers" style="width:18px;height:18px;margin-left:5px"/>
                                </div>
                                <div class="ser_1" style="display:flex;align-items:center">
                                    <label for=""  style="font-weight:800">Sightseeing</label>
                                    <form:checkbox path="sightseeing" name="sightseeing" style="width:18px;height:18px;margin-left:5px" />
                                </div>
                                <div class="ser_1" style="display:flex;align-items:center">
                                    <label for=""  style="font-weight:800">Package</label>
                                    <form:checkbox path="landPackage" name="landPackage;" style="width:18px;height:18px;margin-left:5px"/>
                                </div>
                                <div class="ser_1" style="display:flex;align-items:center">
                                    <label for=""  style="font-weight:800">Cruise</label>
                                    <form:checkbox path="cruise" name="cruise" style="width:18px;height:18px;margin-left:5px"/>
                                </div>
                                <div class="ser_1" style="display:flex;align-items:center">
                                    <label for=""  style="font-weight:800">Others</label>
                                    <form:checkbox path="others" name="others" style="width:18px;height:18px;margin-left:5px"/>
                                </div>
                            </div>
                        </div>

                        <div class="edit_lead_wrapper_data_l1_rem" style="margin-top: 10px;">
                            <div class="edit_lead_wrapper_data_l1_rem1">
                                <label for=""  style="font-weight:800">Client Remarks</label> <br>
                                <form:textarea path="clientRemarks" maxlength="1450" name="" id="" cols="68" rows="5" />
                            </div>
                            <div class="edit_lead_wrapper_data_l1_rem2" style="margin-left: 17px;">
                                <label for=""  style="font-weight:800">Internal Remarks</label> <br>
                                <form:textarea path="internalRemarks" maxlength="1450" name="" id="" cols="66" rows="5" />
                            </div>
                        </div>

                        <div class=" info-client" style="margin-top: 10px;">
                            <div class="sub_info-client">
                                <form:checkbox path="leadCreationClientInformed" checked="checked" style="width:18px;height:18px"/>
                                <label for="">Inform client about the lead creation (email will be sent)</label>
                            </div>
                        </div>
                        <div class="due_today_task_data_btns">
                            <input type="submit" id="submitLead" name="submitLead" value="Create Lead" />
                            <a href="view_filter_leads">Search Leads</a>
                        </div>
                    </div>
            </form:form>
        </div>
    </div>

    <script>

        $(document).ready(function () {
            $('#contactName').autocomplete({
                serviceUrl: '${pageContext.request.contextPath}/getClientList',
                paramName: "tagName",
                delimiter: ",",
                onSelect: function (suggestion) {
                    cityID = suggestion.data;
                    id = cityID;
                    jQuery("#contactId").val(cityID);
                    $('input[name=contactId]').val(id);
                    return false;
                },
                transformResult: function (response) {
                    return {
                        suggestions: $.map($.parseJSON(response), function (item) {
                            return { value: item.tagName, data: item.id };
                        })

                    };
                }
            });


            $('#sourceName').autocomplete({
                serviceUrl: '${pageContext.request.contextPath}/getCityList',
                paramName: "cityName",
                delimiter: ",",
                onSelect: function (suggestion) {
                    cityID = suggestion.data;
                    id = cityID;
                    jQuery("#destinationId").val(cityID);
                    $('input[name=source]').val(id);
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

            $('#destinationName').autocomplete({
                serviceUrl: '${pageContext.request.contextPath}/getCityList',
                paramName: "cityName",
                delimiter: ",",
                onSelect: function (suggestion) {
                    cityID = suggestion.data;
                    id = cityID;
                    jQuery("#destinationId").val(cityID);
                    $('input[name=destination]').val(id);
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
        });

    </script>
</body>

</html>