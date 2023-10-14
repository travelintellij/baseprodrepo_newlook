<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Leads</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/leadstyle.css">
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
</head>

<body style="background: url(${pageContext.request.contextPath}/resources/images/revamped/lens.jpg);background-size: cover; background-repeat: no-repeat; background-position: center center;background-attachment: fixed;">
   
    

    <!-- ######################### Search leads ####################### -->

    <div class="form searchLeads container">
        
        <form:form action="view_filter_leads" modelAttribute="FILTER_LEAD_WL">
            <!-- ############## start of upper part ############# -->
            <div class="upperPart">
                <input type="hidden" name="onlyLeadOwner" value="true" />
                <h1 class="heading">Search Leads</h1>
                <div class="firstL">
                    <div class="box1 box">
                        <label for="tf">Traveling From</label><br>
                        <input path="sourceName" name="sourceName" id="tf" class="inf" />
                        <hidden path="source" />
                        <font color="red">
                            <form:errors path="sourceName" htmlEscape="false" />
                        </font>
                    </div>
                    <div class="box2 box">
                        <label for="tt">Traveling To</label><br>
                        <input id="tt" class="inf" path="destinationName" name="sourceName" />
                        <hidden path="destination" />
                        <font color="red">
                            <errors path="destinationName" cssClass="error" htmlEscape="false" />
                        </font>
                    </div>
                    <!-- <sec:authorize access="hasAnyRole('ADMIN','LEAD_MANAGER')">
                        <th>Lead Owner</th>
                        <td>
                            <div class="select">
                                <form:select path="leadOwner" style="width: 150px;">
                                    <form:options items="${ACTIVE_USERS_MAP}" class="service-small" />
                                    <form:option value="0" label="***ALL***" class="service-small" />
                                </form:select>
                            </div>
                        </td>
                    </sec:authorize> -->
                    <div class="box3 box chflex">
                        <input type="checkbox" id="quali" path="qualified">
                        <label for="quali">Qualified</label>
                    </div>
                    <div class="box4 box chflex">
                        <input type="checkbox" id="flag" path="flagged">
                        <label for="flag">Flagged</label>
                    </div>
                    <div class="l2Box1 box">
                        <label for="id">Lead id</label> <br>
                        <input id="id" class="inf" path="leadId" type="number" min="0" size="35" value=""
                            placeholder="Lead Number">
                    </div>
                    <div class="l2Box2 box">
                        <label for="cn">Contact Name</label> <br>
                        <input id="cn" class="inf" path="contactName" id="contactName" name="contactName" size="35"
                            style="width:200px;" placeholder="Contact Name">
                        <input type="hidden" name="contactId" value="0" />
                    </div>
                </div>
                <div class="secondL">
                    <div class="l3Box3 box">
                        <label for="all">Lead Source</label> <br>
                        <select path="leadSource" id="all" class="inf">
                            <options items="${PARTNERS_MAP}" class="service-small" />
                        </select>
                    </div>
                    <div class="l4Box4 box">
                        <label for="aol">All Open Leads</label> <br>
                        <select path="leadStatus" id="aol" class="inf">
                            <option value="0" label="All Leads" />
                            <option value="200" label="All Open Leads" class="service-small" />
                            <option value="100" label="All Closed" class="service-small" />
                            <options items="${LEAD_STATUS_MAP}" />
                        </select>
                        <!-- <select id="leadStatus" name="leadStatus" style="height:30px;width: 150px;">
                            <c:if test="${not empty LEAD_STATUS_LIST}">
                                <c:forEach items="${LEAD_STATUS_LIST}" var="lead_statusObj">
                                    <option class="service-small" value="${lead_statusObj.workloadStatusId}">
                                        ${lead_statusObj.workloadStatusName}</option>
                                </c:forEach>
                            </c:if>
                        </select> -->
                    </div>
                    <div class="l3Box1 box">
                        <label for="dsc">Date Search Criteria</label> <br>
                        <select path="dateCriteria" class="dsc">
                            <option value="0" label="Select Date Criteria" class="service-small" />
                            <option value="1" label="Creation Date" class="service-small" />
                            <option value="2" label="Travel Date" class="service-small" />
                        </select>
                        <font color="red">
                            <form:errors path="dateCriteria" cssClass="error" htmlEscape="false" />
                        </font>
                    </div>
                    <div class="l3Box2 box fromBox">
                        <label for="">From</label> <br>
                        <input type="date" class="inf" path="startDate">
                    </div>
                    <div class="l3Box3 box tobox">
                        <label for="">To</label> <br>
                        <input type="date" class="inf" path="endDate">
                    </div>
                </div>
                <div class="btns">
                    <div class="inBtns">
                        <input type="submit" value="Apply Filter" class="btn btn1">
                        <a href="view_filter_leads" class="btn">Clear Filter</a>
                    </div>
                </div>
            </div>
            <!-- ############## end of upper part ############# -->
            <!-- ############## start of lower part ############# -->
            <div class="lowerPart container">
                <table border="1">
                    <thead>
                        <th>Lead id</th>
                        <th>Flagged</th>
                        <th>Qualified</th>
                        <th>Client Name</th>
                        <th>Desti.</th>
                        <th>Ref.</th>
                        <th>Tsd</th>
                        <th>Ted</th>
                        <th>Status</th>
                        <th>Owner</th>
                        <th>Action</th>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="leadId">Q-0778-HCF</td>
                            <td> False</td>
                            <td class="tick"><i class="fa-solid fa-check"></i></td>
                            <td>Hitesh Kumar</td>
                            <td>Kathmandu</td>
                            <td>Holidays Guide</td>
                            <td>07-09-2023</td>
                            <td>10-09-2023</td>
                            <td>Open</td>
                            <td>namita</td>
                            <td class="st fili">
                                <i class="fa-solid fa-sliders st1">
                                    <div class="ul">
                                        <ul>
                                            <li><a href="form_view_lead_followup_details?leadId=${filteredLeads.leadId }"
                                                    class="pop-up">FollowUp</a></li>
                                            <li><a href="form_view_editlead?leadId=${filteredLeads.leadId }"
                                                    class="pop-up">Edit</a></li>
                                            <li><a href="view_form_search_supplier_quote?leadId=${filteredLeads.leadId }"
                                                    class="pop-up">Request Quote</a></li>
                                            <li><a href="view_lead_quotations_list?leadId=${filteredLeads.leadId }"
                                                    class="pop-up">Quotations</a></li>
                                            <li><a href="form_view_lead_reminder_details?leadId=${filteredLeads.leadId }&page=${page}"
                                                    class="pop-up">Reminder</a></li>
                                        </ul>
                                    </div>
                                </i>
                            </td>
                        </tr>
                        <tr>
                            <td class="leadId">Q-0778-HCF</td>
                            <td> False</td>
                            <td class="cross"><i class="fa-solid fa-xmark"></i></td>
                            <td>Hitesh Kumar</td>
                            <td>Kathmandu</td>
                            <td>Holidays Guide</td>
                            <td>07-09-2023</td>
                            <td>10-09-2023</td>
                            <td>Open</td>
                            <td>namita</td>
                            <td class="st fili">
                                <i class="fa-solid fa-sliders st1">
                                    <div class="ul">
                                        <ul>
                                            <li><a href="form_view_lead_followup_details?leadId=${filteredLeads.leadId }"
                                                    class="pop-up">FollowUp</a></li>
                                            <li><a href="form_view_editlead?leadId=${filteredLeads.leadId }"
                                                    class="pop-up">Edit</a></li>
                                            <li><a href="view_form_search_supplier_quote?leadId=${filteredLeads.leadId }"
                                                    class="pop-up">Request Quote</a></li>
                                            <li><a href="view_lead_quotations_list?leadId=${filteredLeads.leadId }"
                                                    class="pop-up">Quotations</a></li>
                                            <li><a href="form_view_lead_reminder_details?leadId=${filteredLeads.leadId }&page=${page}"
                                                    class="pop-up">Reminder</a></li>
                                        </ul>
                                    </div>
                                </i>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- ############## end of lower part ############# -->
	</form:form>
    </div>

</body>

</html>