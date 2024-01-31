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
    <title>View Lead details</title>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
    <link rel="stylesheet" href="style.css">
</head>

<style>
      body::before {
            content: "";
            background-image: url(${pageContext.request.contextPath}/resources/images/revamped/assin_to_me_tasks_bg.jpg);
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
    <div class="edit_lead container">
        <div class="edit_lead_wrapper" style="background:black">

            <form:form modelAttribute="LEAD_OBJ" action="form_view_editlead">
                <form:hidden path="leadId" />
                <div align="center"><b>
                        <font color="#32cd32 "> ${Success} </font>
                        <font color="red"> ${Error}</font>
                    </b></div>
                <h1 class="page-heading">View Lead</h1>
                <div class="edit_lead_wrapper_data">
                    <div class="edit_lead_wrapper_data_line a" style="margin-top: 10px;">
                        <div class="edit_lead_wrapper_data_l1" >
                            <label for="">Lead Id</label>
                            <p>Q-${String.format("%04d",LEAD_OBJ.leadId)}-${LEAD_OBJ.leadSourceShortName }</p>
                        </div>
                        <div class="edit_lead_wrapper_data_l1" >
                            <label for="">Lead Markers</label>
                            <div class="lead_markers_ch">
                                <div class="sun_edit_lead">
                                    <p for="">Is Qualified</p>
                                    <form:checkbox class="ch_c" path="qualified" disabled="true" />
                                </div>
                                <div class="sun_edit_lead">
                                    <p for="">Is Flagged</p>
                                    <form:checkbox class="ch_c" path="flagged" disabled="true" />
                                </div>
                            </div>
                        </div>
                        <div class="edit_lead_wrapper_data_l1" >
                            <label for="">Client</label> <br>
                            <p>${LEAD_OBJ.contactName}</p>
                        </div>
                        <div class="edit_lead_wrapper_data_l1" >
                            <label for="">Lead Owner</label>
                            <p>${LEAD_OBJ.leadOwnerName}</p>
                        </div>
                    </div>
                    <div class="edit_lead_wrapper_data_line a" style="margin-top: 10px">
                        <div class="edit_lead_wrapper_data_l1">
                            <label for="">Source</label>
                            <p>${LEAD_OBJ.sourceName}</p>
                        </div>
                        <div class="edit_lead_wrapper_data_l1"">
                            <label for="">Destination</label>
                            <p>${LEAD_OBJ.destinationName}</p>
                        </div>
                        <div class="edit_lead_wrapper_data_l1 adults_box_edit_box" >
                            <div class="adults_box_edit">
                                <label for="">Adults</label> <br>
                                <p>${LEAD_OBJ.adults}</p>
                            </div>
                            <div class="adults_box_edit">
                                <label for="">Children</label> <br>
                                <p>${LEAD_OBJ.children}</p>
                            </div>
                            <div class="adults_box_edit">
                                <label for="">Age Info</label> <br>
                                <p>${LEAD_OBJ.childrenAgeInfo}</p>
                            </div>
                        </div>
                        <div class="edit_lead_wrapper_data_l1" >
                            <label for="">Lead Source</label>
                            <p>${LEAD_OBJ.leadSourceName}</p>
                        </div>
                    </div>
                    <div class="edit_lead_wrapper_data_line a" style="margin: 10px 0;">
                        <div class="edit_lead_wrapper_data_l1">
                            <label for="">Travel Start Date</label> <br>
                            <fmt:formatDate value="${LEAD_OBJ.travelStartDate}" pattern="dd-MM-yyyy" />
                        </div>
                        <div class="edit_lead_wrapper_data_l1" >
                            <label for="">Travel End Date</label> <br>
                            <fmt:formatDate value="${LEAD_OBJ.travelEndDate}" pattern="dd-MM-yyyy" />
                        </div>
                        <div class="edit_lead_wrapper_data_l1" >
                            <label for="">Tentative Amount</label> <br>
                            <p>${LEAD_OBJ.tentativeCost}</p>
                        </div>
                        <div class="edit_lead_wrapper_data_l1">
                            <label for="">Status</label>
                            <p>${LEAD_OBJ.statusName}</p>
                        </div>
                    </div>
                      <label for="" style="margin-right:20px;  color: #FFBA08;font-weight: bold;">Select Services</label>
                    <div class="edit_lead_wrapper_data_line" style=" margin-top: 10px;">
                        <div class="edit_ser_box" style="width:100%;background:black;color:white">
                            <div class="ser_1" style="display:flex;align-items:center">
                                <label for="">Flight</label>
                                <form:checkbox class="ch_c" path="flight" name="flight" disabled="true" style="width:18px;height:18px;margin-left:5px"/></div>
                                    <div class="ser_1" style="display:flex;align-items:center">
                                        <label for="">Hotal</label>
                                        <form:checkbox class="ch_c" path="hotel" name="hotel" disabled="true" style="width:18px;height:18px;margin-left:5px"/>
                                    </div>
                                    <div class="ser_1"  style="display:flex;align-items:center">
                                        <label for="">Visa</label>
                                        <form:checkbox class="ch_c" path="visa" name="visa" disabled="true" style="width:18px;height:18px;margin-left:5px"/>
                                    </div>
                                    <div class="ser_1"  style="display:flex;align-items:center"v>
                                        <label for="">Insurance</label>
                                        <form:checkbox class="ch_c" path="insurance" name="insurance" disabled="true" style="width:18px;height:18px;margin-left:5px"/>
                                    </div>
                                    <div class="ser_1"  style="display:flex;align-items:center">
                                        <label for="">Transfers</label>
                                        <form:checkbox class="ch_c" path="transfers" name="transfers" disabled="true" style="width:18px;height:18px;margin-left:5px"/>
                                    </div>
                                    <div class="ser_1"  style="display:flex;align-items:center">
                                        <label for="">Sightseeing</label>
                                        <form:checkbox class="ch_c" path="sightseeing" name="sightseeing" disabled="true" style="width:18px;height:18px;margin-left:5px"/>
                                    </div>
                                    <div class="ser_1"  style="display:flex;align-items:center">
                                        <label for="">Package</label>
                                        <form:checkbox class="ch_c" path="landPackage" name="landPackage;" disabled="true" style="width:18px;height:18px;margin-left:5px"/>
                                    </div>
                                    <div class="ser_1"  style="display:flex;align-items:center">
                                        <label for="">Cruise</label>
                                        <form:checkbox class="ch_c" path="cruise" name="cruise" disabled="true" style="width:18px;height:18px;margin-left:5px" />
                                    </div>
                                    <div class="ser_1"  style="display:flex;align-items:center">
                                        <label for="">Others</label>
                                        <form:checkbox class="ch_c"  path="others" name="others" disabled="true" style="width:18px;height:18px;margin-left:5px;background:red"/>
                                    </div>
                            </div>
                        </div>

                        <div class="edit_lead_wrapper_data_l1_rem a" style="margin-top: 10px;">
                            <div class="edit_lead_wrapper_data_l1_rem1" style="width:50%;">
                                <label for="">Client Remarks</label> <br>
                                <p>${LEAD_OBJ.clientRemarks}</p>
                            </div>
                            <div class="edit_lead_wrapper_data_l1_rem2" style="margin-left: 17px;width:50%">
                                <label for="">Internal Remarks</label> <br>
                                <p>${LEAD_OBJ.internalRemarks}</p>
                            </div>
                        </div>

                        <div class="info-client view_lead_tag_team" style="margin-top: 10px;">
                            <label for="" style="color: #FFBA08;font-weight: bold;margin-right:10px">Tag Team Mate</label>
                            <c:forEach items="${LEAD_OBJ.team}" var="leadteam">
                                <li >${leadteam.name}</li> &nbsp; &nbsp; &nbsp;
                            </c:forEach>
                        </div>
                        
                    <div class=" sub_info-client" style="margin-top:10px">
                            <form:checkbox class="ch_c" path="leadCreationClientInformed" disabled="true" style="width:18px;height:18px;margin-left:5px"/>
                            <label for="">Client Informed (Email Sent)</label>
                        </div>
                    
                    <div class="due_today_task_data_btns">
                        <input type="submit" id="editLead" name="editLead" value="Edit Lead" />
                        <a href="view_filter_leads">Search Again</a>
                    </div>

                </div>
            </form:form>
        </div>
    </div>
</body>

</html>