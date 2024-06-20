<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>IncentiveReportSearch</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
</head>
<style>
 body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/in_re.jpg);
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
        	/* The Modal (background) */
	.modal {
	  display: none; /* Hidden by default */
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  padding-top: 50px; /* Location of the box */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 100%; /* Full height */
	  overflow: scroll; /* Enable scroll if needed */
	  background-color: rgb(0,0,0); /* Fallback color */
	  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */;
	}
	
	/* Modal Content */
	.modal-content {
	  position: relative;
	  background-color: #fefefe;
	  margin: auto;
	  padding: 0;
	  border: 1px solid #888;
	  width: 80%;
	  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
	  -webkit-animation-name: animatetop;
	  -webkit-animation-duration: 0.4s;
	  animation-name: animatetop;
	  animation-duration: 0.4s
	}
	
	/* Add Animation */
	@-webkit-keyframes animatetop {
	  from {top:-300px; opacity:0} 
	  to {top:0; opacity:1}
	}
	
	@keyframes animatetop {
	  from {top:-300px; opacity:0}
	  to {top:0; opacity:1}
	}
	
	/* The Close Button */
	.close {
	  color: white;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	  color: #000;
	  text-decoration: none;
	  cursor: pointer;
	}
	
	.modal-header {
	  padding: 2px 16px;
	  background-color: lightblue;
	  color: white;
	}
	
	.modal-body {padding: 2px 16px;}
	
	.modal-footer {
	  padding: 2px 16px;
	  background-color: lightblue;
	  color: white;
	}
</style>

                    <body>
                        <div class="IncentiveReportSearch container">
                            <div class="IncentiveReportSearch_wrapper bs">
                                <form:form method="post" action="view_filter_incentives" modelAttribute="SEARCH_INCENTIVE">
                                    <input type="hidden" name="userName" value="${userName}" />
                                    <h1 style="font-size: 25px;margin:10px 0;color:#FABA08">Search Incentive Claims</h1>
                                    <div class="IncentiveReportSearch_wrapper_data">
                                        <div class="IncentiveReportSearch_wrapper_data_line">
                                            <div class="IncentiveReportSearch_wrapper_dl1_r">
                                                <label for="">Incentive Id</label> <br>
                                                <form:input path="incentiveId" type="number" min="0" size="35" value=""
                                                    placeholder="Incentive Id" />
                                            </div>
                                            <div class="IncentiveReportSearch_wrapper_dl1">
                                                <label for="">Search Criteria</label> <br>
                                                <div class="in_wr_div">
                                                    <div>
                                                        <form:radiobutton path="blnSearchOnClaimDate" value="true" />
                                                        <label for="">Claim Date</label> <br>
                                                    </div>
                                                    <div>
                                                        <form:radiobutton path="blnSearchOnClaimDate" value="false" />
                                                        <label for="">Travel End Date</label> <br>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="IncentiveReportSearch_wrapper_dl1_r">
                                                <label for="">Search Period</label>
                                                <form:select path="incentiveSearchPeriodType" required="required" style="width:90%">
                                                 <form:options items="${INCENTIVE_SEARCH_PERIOD_TYPE}" class="service-small" />
                                                </form:select>

                                            </div>
                                            <div class="IncentiveReportSearch_wrapper_dl1_r">
                                                <label for="">From Date </label>
                                                <form:input path="claimFromDate" type="date" required="required" />
                                            </div>
                                            <div class="IncentiveReportSearch_wrapper_dl1_r">
                                                <label for="">To Date</label>
                                                <form:input path="claimToDate" type="date" required="required" />
                                            </div>
                                        </div>
                                        <div class="IncentiveReportSearch_wrapper_data_line" style="margin-top:20px">
                                            <div class="IncentiveReportSearch_wrapper_dl1_r">
                                                <label for="">Deal Confirmation No</label>
                                                <form:input path="dealName" placeholder="Deal Search keyword " class="form-control search-slt" />
                                                <form:hidden path="dealConfirmationId" />
                                            </div>
                                            <div class="IncentiveReportSearch_wrapper_dl1_r">
                                                <label for="">Claim Status</label>
                                                <form:select path="claimStatus" required="required" style="width:90%">
                                                 <form:options items="${ACTIVE_INCENTIVE_STATUS}" class="service-small" />
                                                </form:select>
                                            </div>
                                            <div class="IncentiveReportSearch_wrapper_dl1_r">
                                                <label for="">Claimant</label>
                                                <sec:authorize access="hasAnyRole('ADMIN')" >
                                                    <td>
                                                        <div class="select">
                                                            <form:select path="claimantId" style="width:90%" required="required">
                                                                <form:options items="${ACTIVE_USERS_MAP}" class="service-small" />
                                                            </form:select>
                                                        </div>
                                                </sec:authorize>
                                                <sec:authorize access="!hasAnyRole('ADMIN')">
                                                    ${userName}
                                                </sec:authorize>
                                            </div>
   											<div class="IncentiveReportSearch_wrapper_dl1_r">
                                                <label for="">Type</label>
                                                <form:select path="claimOption" required="required" style="width:90%">
                                                 <form:options items="${CLAIM_OPTION}" class="service-small" />
                                                </form:select>
                                            </div>                                        
                                        </div>
                                        <div class="due_today_task_data_btnss" style="margin:10px 0">
                                            <input type="submit" value="Apply Filter" />
                                            <a href="view_default_incentives_report"><input type="button" value="Clear Filter" /></a>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                        </div>


                        <table class="bs" style="width:1500px;margin:10px auto;text-align:center;background:white;color:black">
                            <tr>
                                <th style="height:50px;width:10%;background: #6082B6;">Incentive Id </th>
                                <th style="height:50px;width:10%;background: #6082B6;">Deal Id </th>
                                <th style="height:50px;width:15%;background: #6082B6;">Lead Guest Name</th>
                                <th style="height:50px;width:8%;background: #6082B6;">Start Date</th>
                                <th style="height:50px;width:8%;background: #6082B6;">End Date</th>
                                <th style="height:50px;width:8%;background: #6082B6;">Claim Date</th>
                                <th style="height:50px;width:8%;background: #6082B6;">Claimant</th>
                                <th style="height:50px;width:10%;background: #6082B6;">Claim Type</th>
                                <th style="height:50px;width:7%;background: #6082B6;">Claim</th>
                                <th style="height:50px;width:7%;background: #6082B6;">Approved</th>
                                <th style="height:50px;width:10%;background: #6082B6;">Claim Status</th>
                            </tr>
                            <c:if test="${not empty INCENTIVES_LIST}">
                                <c:set var="totalIncentive" value="${0}" />
                                <c:forEach var="incentiveObj" items="${INCENTIVES_LIST}">
                                    <tr>
                                        <td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">
                                            <a style="color:blue;text-decoration:nonr;cursor:pointer" id="myBtn[${incentiveObj.incentiveId}]" onclick="myLeadDisplay(this)"
                                                data-load-url="displayIncentiveModal?incentiveId=${incentiveObj.incentiveId}"
                                                data-toggle="modal" data-target="#myModal">${incentiveObj.incentiveId}</a>

                                            <sec:authorize access="hasAnyRole('ADMIN')">
                                                &nbsp;&nbsp;
                                                <a style="color:#32cd32" href="form_view_editIncentive?incentiveId=${incentiveObj.incentiveId}">Edit</a>
                                            </sec:authorize>
                                            <c:if test="${not empty incentiveObj and incentiveObj.status eq STATUS_EDIT_ALLOWED}">
    											<!-- Display edit link if status matches status_edit_allowed -->
												    <a style="color:#32cd32" href="form_edit_newincentive?incentiveId=${incentiveObj.incentiveId}">Edit</a>
											</c:if>
                                        </td>
                                        <td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">
                                            <a style="color:blue;text-decoration:none;cursor:pointer" id="myBtn[${incentiveObj.dealConfirmationId}]"
                                                onclick="myLeadDisplay(this)"
                                                data-load-url="view_view_deal_form_modal_free_acl?dealConfirmationId=${incentiveObj.dealConfirmationId}"
                                                data-toggle="modal" data-target="#myModal">${incentiveObj.dealConfirmationId}</a>

                                        </td>
                                        <td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">${incentiveObj.guestName}</td>
                                        <td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">
                                            <fmt:formatDate value="${incentiveObj.travelStartDate}"
                                                pattern="dd-MM-yyyy" />
                                        </td>
                                        <td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">
                                            <fmt:formatDate value="${incentiveObj.travelEndDate}"
                                                pattern="dd-MM-yyyy" />
                                        </td>
                                        <td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">
                                            <fmt:formatDate value="${incentiveObj.createdAt}" pattern="dd-MM-yyyy" />
                                        </td>
                                        <td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">${incentiveObj.claimantName}</td>
                                        <td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">${incentiveObj.claimOption} </td>
                                        <td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">${incentiveObj.claimedAmount}</td>
                                        <td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">${incentiveObj.approvedAmount}</td>
                                        <td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">${incentiveObj.claimStatusName}</td>
                                    </tr>
                                    <c:set var="totalIncentive" value="${totalIncentive + incentiveObj.claimedAmount}" />
                                    <c:set var="totalApproved" value="${totalApproved + incentiveObj.approvedAmount}" />
                                </c:forEach>
                            </c:if>
                            <tr>
                                <td colspan="8" style="text-align:end;margin-right:10px;"><b>
                                        <font size="3">Total </font>
                                    </b></td>
                                    <td style="text-align:center;black:#32cd32;font-weight:bold">${totalIncentive}</td>
                                    <td style="text-align:center;black:#32cd32;font-weight:bold">${totalApproved}</td>
                            </tr>
                        </table>
                        <table style="width:20%;margin:10px auto ; background:black;color:white;border-radius:3px;padding;3px">
                            
                        </table>

                        <div id="myModal" class="modal" style="z-index:999;margin-top:100px">

                            <!-- Modal content -->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <span class="close" style="color:red">&times;</span>
                                    <h2 style="text-align:center;color:black">View Details</h2>
                                </div>
                                <div class="modal-body" style="padding:0;text-align:center">
                                
                                </div>
                                <div class="modal-footer">
                                    <h3 style="color:black;text-align:center">Powered by @TravelIntelliJ</h3>
                                </div>
                            </div>

                        </div>


                        <div id="pagination" align="center">
                           <p style="color:#ffa500;background:black;display:inline-block;padding:2px;border-radius:2px">Page:</p> 
                            <c:url value="view_filter_incentives" var="prev">
                                <c:param name="page" value="${page-1}" />
                            </c:url>
                            <c:if test="${page > 0}">
                                <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500" href="<c:out value="
                                    ${prev}&sortBy=${sortBy}&claimFromDate=${SEARCH_INCENTIVE.claimFromDate
                                    }&claimToDate=${SEARCH_INCENTIVE.claimToDate}&claimantId=${SEARCH_INCENTIVE.claimantId}&claimStatus=${SEARCH_INCENTIVE.claimStatus}&incentiveSearchPeriodType=${SEARCH_INCENTIVE.incentiveSearchPeriodType}" />"
                                class="pn prev">Prev</a>
                            </c:if>

                            <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                                <c:choose>
                                    <c:when test="${(page+1) == i.index}">
                                        <span style="background:black;padding:2px 5px;border-radius:2px;color:white">${i.index}</span>
                                    </c:when>
                                    <c:otherwise>
                                        <c:url value="view_filter_incentives" var="url">
                                            <c:param name="page" value="${i.index-1}" />
                                        </c:url>
                                        <a href='<c:out value="${url}&sortBy=${sortBy}&claimFromDate=${SEARCH_INCENTIVE.claimFromDate }&claimToDate=${SEARCH_INCENTIVE.claimToDate}&claimantId=${SEARCH_INCENTIVE.claimantId}&claimStatus=${SEARCH_INCENTIVE.claimStatus}&incentiveSearchPeriodType=${SEARCH_INCENTIVE.incentiveSearchPeriodType}" />'>${i.index}</a>
                                    </c:otherwise>
                                </c:choose>
                            </c:forEach>
                            <c:url value="view_filter_incentives" var="next">
                                <c:param name="page" value="${page + 1}" />
                            </c:url>
                            <c:if test="${page + 1 < maxPages}">
                                <a style="background:black;padding:2px 5px;border-radius:2px;color:#ffa500"  href='<c:out value="${next}&sortBy=${sortBy}&claimFromDate=${SEARCH_INCENTIVE.claimFromDate }&claimToDate=${SEARCH_INCENTIVE.claimToDate}&claimantId=${SEARCH_INCENTIVE.claimantId}&claimStatus=${SEARCH_INCENTIVE.claimStatus}&incentiveSearchPeriodType=${SEARCH_INCENTIVE.incentiveSearchPeriodType}" />'
                                    class="pn next">Next</a>
                            </c:if>
                        </div>
                  


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


                            $('#dealName').autocomplete({
                                serviceUrl: '${pageContext.request.contextPath}/getDealInfo_For_Incentives',
                                paramName: "dealKeyword",
                                delimiter: ",",
                                onSelect: function (suggestion) {
                                    dealID = suggestion.data;
                                    id = dealID;
                                    jQuery("#dealConfirmationId").val(dealID);
                                    $('input[name=dealName]').val(id);
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
                        </script>

                    </body>

</html>