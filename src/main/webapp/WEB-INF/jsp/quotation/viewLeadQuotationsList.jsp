<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />
  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>viewLeadQuotationsList</title>
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
 <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>

<body   style="background: url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
    <div class="viewLeadQuotationsList container">
        <div class="viewLeadQuotationsList_wrapper">
        <h1 class="page-heading">Quotation</h1>
            <form:form modelAttribute="LEAD_OBJ" action="form_view_editlead">
                <form:hidden path="leadId" />
                <div align="center"><b>
                        <font color="green"> ${Success} </font>
                        <font color="red" size="5">${Error}</font>
                    </b></div>
                <div class="viewLeadQuotationsList_wrapper_data">
                    <div class="viewLeadQuotationsList_wrapper_data_line" style="background:#6082B6;margin-bottom:5px">
                        <div class="viewLeadQuotationsList_wrapper_data_l1">
                            <label for="">Lead Id</label>
                            <p>Q-${String.format("%04d",LEAD_OBJ.leadId)}-${LEAD_OBJ.leadSourceShortName }</p>
                        </div>
                        <div class="viewLeadQuotationsList_wrapper_data_l1">
                            <label for="">Is Qualified</label>
                            <p>
                                <form:checkbox path="qualified" disabled="true" />
                            </p>
                        </div>
                        <div class="viewLeadQuotationsList_wrapper_data_l1">
                            <label for="">Is Flagged</label>
                            <p>
                                <form:checkbox path="flagged" disabled="true" />
                            </p>
                        </div>
                        <div class="viewLeadQuotationsList_wrapper_data_l1">
                            <label for="">Client</label>
                            <p>${LEAD_OBJ.contactName}</p>
                        </div>
                        <div class="viewLeadQuotationsList_wrapper_data_l1">
                            <label for="">Lead Owner</label>
                            <p>${LEAD_OBJ.leadOwnerName}</p>
                        </div>
                    </div>
                    <div class="viewLeadQuotationsList_wrapper_data_line" style="background:#6082B6;margin-bottom:5px">
                        <div class="viewLeadQuotationsList_wrapper_data_l1">
                            <label for="">Source</label>
                            <p>${LEAD_OBJ.sourceName}</p>
                        </div>
                        <div class="viewLeadQuotationsList_wrapper_data_l1">
                            <label for="">Destnation</label>
                            <p>${LEAD_OBJ.destinationName}</p>
                        </div>
                        <div class="viewLeadQuotationsList_wrapper_data_l1">
                            <label for="">Adults</label>
                            <p>${LEAD_OBJ.adults}</p>
                        </div>
                        <div class="viewLeadQuotationsList_wrapper_data_l1">
                            <label for="">Children</label>
                            <p>${LEAD_OBJ.children}</p>
                        </div>
                        <div class="viewLeadQuotationsList_wrapper_data_l1">
                            <label for="">Age</label>
                            <p>${LEAD_OBJ.childrenAgeInfo}</p>
                        </div>
                    </div>
                    <div class="viewLeadQuotationsList_wrapper_data_line" style="background:#6082B6;margin-bottom:5px">
                        <div class="viewLeadQuotationsList_wrapper_data_l1">
                            <label for="">Lead Source</label>
                            <p>${LEAD_OBJ.leadSourceName}</p>
                        </div>
                        <div class="viewLeadQuotationsList_wrapper_data_l1">
                            <label for="">Travel Date</label> <br>
                            <fmt:formatDate value="${LEAD_OBJ.travelStartDate}" pattern="dd-MM-yyyy" />
                        </div>
                        <div class="viewLeadQuotationsList_wrapper_data_l1">
                            <label for="">Travel End Date</label> <br>
                            <fmt:formatDate value="${LEAD_OBJ.travelEndDate}" pattern="dd-MM-yyyy" />
                        </div>
                        <div class="viewLeadQuotationsList_wrapper_data_l1">
                            <label for="">Tentative Amount</label>
                            <p>${LEAD_OBJ.tentativeCost}</p>
                        </div>
                        <div class="viewLeadQuotationsList_wrapper_data_l1">
                            <label for="">Status</label>
                            <p>${LEAD_OBJ.statusName}</p>
                        </div>
                    </div>
                    <div class="viewLeadQuotationsList_wrapper_data_line">
                        <div class="leadQ-ser">
                            <h1 style="text-align: left;color:#FABA08">Select Services</h1>
                            <div class="lq-sers">
                                <div class="viewLeadQuotationsList_wrapper_data_l1">
                                    <form:checkbox path="landPackage" name="landPackage;" disabled="true" />
                                    <label for="">Package</label>
                                </div>
                                <div class="viewLeadQuotationsList_wrapper_data_l1">
                                    <form:checkbox path="flight" name="flight" disabled="true" />
                                    <label for="">Flight</label>
                                </div>
                                <div class="viewLeadQuotationsList_wrapper_data_l1">
                                    <form:checkbox path="hotel" name="hotel" disabled="true" />
                                    <label for="">Hotal</label>
                                </div>
                                <div class="viewLeadQuotationsList_wrapper_data_l1">
                                    <form:checkbox path="transfers" name="transfers" disabled="true" />
                                    <label for="">Transfers</label>
                                </div>
                                <div class="viewLeadQuotationsList_wrapper_data_l1">
                                    <form:checkbox path="sightseeing" name="sightseeing" disabled="true" />
                                    <label for="">Sightseeing</label>
                                </div>
                                <div class="viewLeadQuotationsList_wrapper_data_l1">
                                    <form:checkbox path="visa" name="visa" disabled="true" />
                                    <label for="">Visa</label>
                                </div>
                                <div class="viewLeadQuotationsList_wrapper_data_l1">
                                    <form:checkbox path="insurance" name="insurance" disabled="true" />
                                    <label for="">Insurance</label>
                                </div>
                                <div class="viewLeadQuotationsList_wrapper_data_l1">
                                    <form:checkbox path="cruise" name="cruise" disabled="true" />
                                    <label for="">Cruise</label>
                                </div>
                                <div class="viewLeadQuotationsList_wrapper_data_l1">
                                    <form:checkbox path="others" name="others" disabled="true" />
                                    <label for="">Others</label>
                                </div>
                            </div>
                        </div>

                    </div>

                    <!-- ############## top two btns ########## -->

                    <div class="lq-btns">
                        <input type="submit" id="editLead" name="editLead" value="Edit Lead"
                            style="outline: none;border: 2px solid black;padding: 5px;background: #FABA08;color:black;border-radius: 5px;" />
                        <a href="view_filter_leads" style="color:black">Search Again</a>

                    </div>


                </div>
        </div>

        <div class="c-n-q" style="display: flex;justify-content: center;margin-top: 5px;">
            <a href="form_view_new_quotation?leadId=${LEAD_OBJ.leadId }"
                style="background: #FABA08;padding: 10px;;color: black;border: 2px solid black;border-radius: 10px;">Create
                New Quotation</a>
        </div>


        <!-- ############## tabel goes here ##################### -->


        <table class="viewLeadQuotationsTabel" >
            <thead>
                <tr>
                    <th>Quotation ID</th>
                    <th style="width:100px">Version</th>
                    <th>Quotation Name</th>
                    <th>Created Date</th>
                    <th>Last Edit</th>
                    <th>Action</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                <!-- Add your data rows here -->
                <!-- <tr>
                    <td>1</td>
                    <td>1.0</td>
                    <td>Quotation 1</td>
                    <td>2023-11-20</td>
                    <td>2023-11-21</td>
                    <td>
                        <i class="fa-solid fa-sliders vlq-icon">
                            <div class="vlq-icon_div">
                                <ul>
                                    <li><a href="form_view_lead_followup_details?leadId=516" class="pop-up">FollowUp</a>
                                    </li>
                                    <li><a href="form_view_editlead?leadId=516" class="pop-up">Edit</a></li>
                                    <li><a href="view_form_search_supplier_quote?leadId=516" class="pop-up">Request
                                            Quote</a></li>
                                    <li><a href="view_lead_quotations_list?leadId=516" class="pop-up">Quotations</a>
                                    </li>
                                    <li><a href="form_view_lead_reminder_details?leadId=516&amp;page=0"
                                            class="pop-up">Reminder</a></li>
                                </ul>
                            </div>
                        </i>
                    </td>
                    <td>Active</td>
                </tr> -->


                <c:forEach items="${LEAD_OBJ.leadQuotationsList}" var="leadquotations">
                    <tr style=" margin-bottom: 10px">
                        <td style="border-width:5px;">${leadquotations.quotationId }</td>
                        <td style="border-width:5px;">${leadquotations.version }</td>
                        <td style="border-width:5px;">${leadquotations.quotationName}</td>
                        <td style="border-width:5px;">
                            <fmt:formatDate value="${leadquotations.createdAt }" pattern="dd-MMM-yyyy HH:MM" />
                        </td>
                        <td style="border-width:5px;">${leadquotations.updatedAt }</td>
                        <c:if test="${ (leadquotations.converted ne true)  }">
                            <c:choose>
                                <c:when test="${ (leadquotations.version gt CONVERTED_QTN.version) && (CONVERTED_QTN.version gt 0) }">
                                    <td style="border-width:5px;;">
                                        <a
                                            href="form_view_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }" style=";padding:2px 5px; border-radius:3px;background:#32cd32;color:white">View</a> |
                                        <a
                                            href="form_view_edit_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }" style=";padding:2px 5px; border-radius:3px;background:#32cd32;color:white">Edit</a> |
                                        <a
                                            href="form_view_delete_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }" style=";padding:2px 5px; border-radius:3px;background:red;color:white">Delete</a>
                                        |
                                        <a
                                            href="form_view_duplicate_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }" style=";padding:2px 5px; border-radius:3px;background:#32cd32;color:white">Duplicate Quotation</a>
                                        |
                                        <a style=";padding:2px 5px; border-radius:3px;background:#32cd32;color:white">Lock-And-Convert</a>
                                    </td>
                                </c:when>
                                <c:when test="${ leadquotations.version lt CONVERTED_QTN.version  }">
                                    <td style="border-width:5px;;">
                                        <a
                                            href="form_view_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }" style=";padding:2px 5px; border-radius:3px;background:#32cd32;color:white">View</a> |
                                        <a style=";padding:2px 5px; border-radius:3px;background:#32cd32;color:white">Edit</a> |
                                        <a style=";padding:2px 5px; border-radius:3px;background:red;color:white">Delete</a> |
                                        <a
                                            href="form_view_duplicate_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }" style=";padding:2px 5px; border-radius:3px;background:#32cd32;color:white">Duplicate Quotation</a> |
                                        <a style=";padding:2px 5px; border-radius:3px;background:#32cd32;color:white">Lock-And-Convert</a>
                                    </td>
                                </c:when>
                                <c:otherwise>
                                    <td style="border-width:5px;;">
                                     <i class="fa-solid fa-sliders stqb">
                                    <div class="quotation-box-three-bar">
                                    <ul>
                                    <li><a
                                            href="form_view_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }">View</a> </li>
                                    <li><a
                                            href="form_view_edit_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }">Edit</a></li>
                                    <li> <a href="form_view_delete_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }">
                                               Delete</a></li>
                                            
                                    <li><a
                                            href="form_view_duplicate_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }">Duplicate Quotation</a></li>
                                    <li>
                                      <a href="form_convert_new_deal?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }"
                                            aria-disabled="true">Lock-And-Convert</a>
                                    </li>
                                    </ul>
                                     
                                       
                                        
                                        
                                        
                                      
                                        </div>
                                      </i>
                                    </td>
                                </c:otherwise>
                            </c:choose>

                            <td style="border-width:5px;;">
                                <Input type="button" value="Generated"
                                   style="background:transparent;border:none;outline:none;color:white"/>
                            </td>
                        </c:if>
                        <c:if test="${ leadquotations.converted eq true }">
                            <td style="border-width:5px;;">
                                <a
                                    href="form_view_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }" style=";padding:2px 5px; border-radius:3px;background:#32cd32;color:white">View</a> |
                                <a style=";padding:2px 5px; border-radius:3px;background:#32cd32;color:white">Edit</a> |
                                <a style=";padding:2px 5px; border-radius:3px;background:red;color:white" >Delete</a> |
                                <a
                                    href="form_view_duplicate_quotation_details?leadId=${LEAD_OBJ.leadId }&quotationId=${leadquotations.quotationId }" style=";padding:2px 5px; border-radius:3px;background:#32cd32;color:white">Duplicate Quotation</a> |
                                <a style=";padding:2px 5px; border-radius:3px;background:#32cd32;color:white">Lock-And-Convert</a>
                            </td>
                            <td style="border-width:5px;;">
                               <a style=";padding:2px 5px; border-radius:3px;background:#32cd32;color:white">CONVERTED</a>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
                <!-- Add more rows as needed -->
            </tbody>
        </table>

        </form:form>
    </div>



    <div id="myModal" class="modal">
        <!-- Modal content -->
        <div class="modal-content">
            <div class="modal-header">
                <span class="close">&times;</span>
                <br>
                <h2 style="text-align:center;">Confirm Quotation Version Delete</h2>
            </div>
            <div class="modal-body">


            </div>
            <div class="modal-footer">
                <h3 align="center">Powered by @TravelIntelliJ</h3>
            </div>
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

    <script>
        // Get the modal
        var modal = document.getElementById("myModal");

        // Get the button that opens the modal
        var btn = document.getElementById("myBtn");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];



        function myLeadDisplay(clicked) {
            //alert(clicked); 
            $("#myModal .modal-body").load($(clicked).attr('data-load-url'));
            modal.style.display = "block";
        }
        // When the user clicks the button, open the modal 
        /*btn.onclick = function() {
            //$("#myModal .modal-body").html('pass your html text here');
            $("#myModal .modal-body").load($(this).attr('data-load-url'));
            modal.style.display = "block";
          
        }*/

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        }
    </script>



</body>

</html>