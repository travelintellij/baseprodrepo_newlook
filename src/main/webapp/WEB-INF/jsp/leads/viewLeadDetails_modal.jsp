<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>viewLeadDetails_modal</title>
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
                </head>

                <body>
                    <form:form modelAttribute="LEAD_OBJ" action="form_view_editlead">
                        <form:hidden path="leadId" />
                        <div class="viewLeadDetails_modal container">
                            <div class="viewLeadDetails_modal_wrapper">
                                <h1 style="font-size: 25px;margin:5px 0;color:#FABA08">View Lead Details</h1>
                                <div align="center"><b>
                                        <font color="green"> ${Success} </font>
                                        <font color="red"> ${Error}</font>
                                    </b></div>
                                <div class="viewLeadDetails_modal_wrapper_data">
                                    <div class="viewLeadDetails_modal_wrapper_data_line a">
                                        <div class=" viewLeadDetails_modal_wrapper_dl1">
                                            <label for="" class=""  style="font-weight:normal">Lead Id</label>
                                            <p style="font-weight:800;color:#32cd32">Q-${String.format("%04d",LEAD_OBJ.leadId)}-${LEAD_OBJ.leadSourceShortName
                                                }</p>
                                        </div>
                                        <div class="viewLeadDetails_modal_wrapper_dl1">
                                            <label for="" class="">Is Qualified</label>
                                            <p>
                                                <form:checkbox class="ch_c" path="qualified" disabled="true" style="width:18px;height:18px"/>
                                            </p>
                                        </div>
                                        <div class="viewLeadDetails_modal_wrapper_dl1">
                                            <label for="" class="">Is Flagged</label>
                                            <p>
                                                <form:checkbox class="ch_c" path="flagged" disabled="true" style="width:18px;height:18px"/>
                                            </p>
                                        </div>
                                        <div class="viewLeadDetails_modal_wrapper_dl1">
                                            <label for="" >Client</label>
                                            <p style="color:#023e8a;font-weight:800">${LEAD_OBJ.contactName}</p>
                                        </div>
                                    </div>
                                    <div class="viewLeadDetails_modal_wrapper_data_line a">
                                        <div class="viewLeadDetails_modal_wrapper_dl1">
                                            <label for="" class="">Lead Owner</label>
                                            <p style="color:#023e8a;font-weight:800">${LEAD_OBJ.leadOwnerName}</p>
                                        </div>
                                        <div class="viewLeadDetails_modal_wrapper_dl1">
                                            <label for="" class="">Source</label>
                                            <p style="color:#023e8a;font-weight:800">${LEAD_OBJ.sourceName}</p>
                                        </div>
                                        <div class="viewLeadDetails_modal_wrapper_dl1">
                                            <label for="" class="">Destination</label>
                                            <p style="color:#023e8a;font-weight:800">${LEAD_OBJ.destinationName}</p>
                                        </div>
                                        <div class="viewLeadDetails_modal_wrapper_dl1">
                                            <label for="" class="">Adults</label>
                                            <p style="color:#023e8a;font-weight:800">${LEAD_OBJ.adults}</p>
                                        </div>
                                    </div>
                                    <div class="viewLeadDetails_modal_wrapper_data_line a">
                                        <div class="viewLeadDetails_modal_wrapper_dl1">
                                            <label for="" class="">Children</label>
                                            <p style="color:#023e8a;font-weight:800">${LEAD_OBJ.children}</p>
                                        </div>
                                        <div class="viewLeadDetails_modal_wrapper_dl1">
                                            <label for="" class="">Age</label>
                                            <p style="color:#023e8a;font-weight:800">${LEAD_OBJ.childrenAgeInfo}</p>
                                        </div>
                                        <div class="viewLeadDetails_modal_wrapper_dl1">
                                            <label for="" class="">Lead Source</label>
                                            <p style="color:#023e8a;font-weight:800">${LEAD_OBJ.leadSourceName}</p>
                                        </div>
                                        <div class="viewLeadDetails_modal_wrapper_dl1">
                                            <label for="" class="">Travel start date</label>
                                            <p style="color:#023e8a;font-weight:800">
                                                <fmt:formatDate value="${LEAD_OBJ.travelStartDate}"
                                                    pattern="dd-MM-yyyy" />
                                            </p>
                                        </div>
                                    </div>
                                    <div class="viewLeadDetails_modal_wrapper_data_line a">
                                        <div class="viewLeadDetails_modal_wrapper_dl1">
                                            <label for="" class="">Tentative Amount</label>
                                            <p style="color:#023e8a;font-weight:800">${LEAD_OBJ.tentativeCost}</p>
                                        </div>
                                        <div class="viewLeadDetails_modal_wrapper_dl1">
                                            <label for="" class="">Status</label>
                                            <p style="color:#023e8a;font-weight:800">${LEAD_OBJ.statusName}</p>
                                        </div>
                                    </div>
                                    <h1 style="text-align: start;" class="">Select Services</h1>
                                    <div class="viewLeadDetails_modal_wrapper_data_linesr a">
                                        <div class="viewLeadDetails_modal_wrapper_dser">
                                            <form:checkbox class="ch_c" path="landPackage" name="landPackage;" disabled="true" style="width:18px;height:18px"/>
                                            <label for="">Package</label>
                                        </div>
                                        <div class="viewLeadDetails_modal_wrapper_dser">
                                            <form:checkbox class="ch_c" path="flight" name="flight" disabled="true" style="width:18px;height:18px"/>
                                            <label for="">Flight</label>
                                        </div>
                                        <div class="viewLeadDetails_modal_wrapper_dser">
                                            <form:checkbox class="ch_c" path="hotel" name="hotel" disabled="true" style="width:18px;height:18px"/>
                                            <label for="">Hotel</label>
                                        </div>
                                        <div class="viewLeadDetails_modal_wrapper_dser">
                                            <form:checkbox class="ch_c" path="transfers" name="transfers" disabled="true" style="width:18px;height:18px"/>
                                            <label for="">Transfers</label>
                                        </div>
                                        <div class="viewLeadDetails_modal_wrapper_dser">
                                            <form:checkbox class="ch_c" path="sightseeing" name="sightseeing" disabled="true" style="width:18px;height:18px"/>
                                            <label for="">Sightseeing</label>
                                        </div>
                                        <div class="viewLeadDetails_modal_wrapper_dser">
                                            <form:checkbox class="ch_c" path="visa" name="visa" disabled="true" style="width:18px;height:18px"/>
                                            <label for="">Visa</label>
                                        </div>
                                        <div class="viewLeadDetails_modal_wrapper_dser">
                                            <form:checkbox class="ch_c" path="insurance" name="insurance" disabled="true" style="width:18px;height:18px"/>
                                            <label for="">Insurance</label>
                                        </div>
                                        <div class="viewLeadDetails_modal_wrapper_dser">
                                            <form:checkbox class="ch_c" path="cruise" name="cruise" disabled="true" style="width:18px;height:18px"/>
                                            <label for="">Cruise</label>
                                        </div>
                                        <div class="viewLeadDetails_modal_wrapper_dser">
                                            <form:checkbox class="ch_c" path="others" name="others" disabled="true" style="width:18px;height:18px"/>
                                            <label for="">Others</label>
                                        </div>
                                    </div>
                                    <div class="viewLeadDetails_modal_wrapper_data_line a">
                                        <div class="viewLeadDetails_modal_wrapper_dl1rem" style="text-align: start;">
                                            <label for="" class="">Remarks</label>
                                            <p style="color:#023e8a;font-weight:800">${LEAD_OBJ.clientRemarks}</p>
                                        </div>
                                    </div>
                                    <div class="viewLeadDetails_modal_wrapper_data_line a">
                                        <div class="viewLeadDetails_modal_wrapper_dl1rem" style="text-align: start;">
                                            <label for="" class="">Internal Remarks</label>
                                            <p style="color:#023e8a;font-weight:800">${LEAD_OBJ.internalRemarks}</p>
                                        </div>
                                    </div>
                                    <div class="viewLeadDetails_modal_wrapper_data_line a">
                                        <div class="viewLeadDetails_modal_wrapper_dl1rem" style="text-align: start;">
                                            <label for="" class="">Tagged team mates</label>
                                            <c:forEach items="${LEAD_OBJ.team}" var="leadteam">
                                                <li style="color:#023e8a;font-weight:800">${leadteam.name}</li>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="viewLeadDetails_modal_wrapper_data_line_ci">
                                        <div class="viewLeadDetails_modal_wrapper_dlci">
                                            <form:checkbox path="leadCreationClientInformed" disabled="true" style="width:18px;height:18px" class="ch_c"/>
                                            <label for="">Client Informed (email sent)</label>
                                        </div>
                                    </div>
                                    <div class="due_today_task_data_btns"
                                        style="display: flex;justify-content: center;">
                                        <input type="submit" id="editLead" name="editLead" value="Edit Lead" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form:form>


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