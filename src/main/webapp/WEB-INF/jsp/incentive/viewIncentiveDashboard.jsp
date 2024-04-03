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
	
	
    
    .menu-submit-button {
        border: none; /* Remove border */
        background: none; /* Remove background */
        padding: 0; /* Remove padding */
        color: white; /* Text color */
        text-decoration: underline; /* Underline text */
        cursor: pointer; /* Show cursor as pointer on hover */
    }

</style>

                    <body>
                        <div class="IncentiveReportSearch container">
                            <div class="IncentiveReportSearch_wrapper bs">
                                 <a href="<c:url value="/form_view_filter_target"/>">
        							<img class="filter-button" src="${pageContext.request.contextPath}/resources/images/revamped/filter.jpg" alt="Filter" width="20" height="20">
    							</a>
    							 <sec:authorize access="hasAnyRole('ADMIN','MANAGE_INCENTIVE')">
    							 <a href="<c:url value="/addnewtarget"/>">
        							<img class="filter-button" src="${pageContext.request.contextPath}/resources/images/revamped/add_new_plus.jpg" alt="Filter" width="20" height="20">
    							</a>
    							</sec:authorize>
                            </div>
                        </div>

 						<div align="center"><b>
                      	  <font color="#32cd32 "> ${Success} </font>
                      	</b></div>
                        <table class="bs" style="width:1500px;margin:10px auto;text-align:center;background:white;color:black">
                            <tr>
                                <th style="height:50px;width:10%;background: #6082B6;">User Id </th>
                                <th style="height:50px;width:20%;background: #6082B6;">User Name</th>
                                <th style="height:50px;width:10%;background: #6082B6;">Financial Year</th>
                                <th style="height:50px;width:10%;background: #6082B6;">Target</th>
                                <th style="height:50px;width:10%;background: #6082B6;">Incentive</th>
                                <th style="height:50px;width:10%;background: #6082B6;">Approved </th>
                                <th style="height:50px;width:12%;background: #6082B6;">Pending Approval</th>
                                <th style="height:50px;width:8%;background: #6082B6;">Status</th>
                                <th style="height:50px;width:10%;background: #6082B6;">Action</th>
                                
                            </tr>
							<c:forEach items="${TARGET_LIST}" var="filteredTarget">        
								<tr>
                                    <td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">${filteredTarget.userId}</td>
                                    <td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">${filteredTarget.userName}</td>
                                    <td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">	${filteredTarget.financialYear}</td>
                                    <td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">	${filteredTarget.targetAmount}</td>
                                    <td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">	${filteredTarget.incentiveAmount}</td>
                                    <td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">${filteredTarget.approvedTarget}</td>
                                    <td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">${filteredTarget.pendingApprovalTarget}</td>
                               		<td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">
                               			<c:if test="${filteredTarget.approvedTarget ge filteredTarget.targetAmount}">
                               				<b><font color="green">Success</font></b>
                               			</c:if>
                               			<c:if test="${filteredTarget.approvedTarget lt filteredTarget.targetAmount}">
                               				<b><font color="red">Pending</font></b> 
                               			</c:if>
                               		</td>
                               		<td style="border-bottom:2px solid #FABA08;border-right:2px solid #FABA08">
                               		  <i class="fa-solid fa-sliders st1" style="color:black">
	                                   <div class="ul" style="background:gray">
	                                       <ul>
	                                           <li>
	                                           <form:form id="form_edit_target" modelAttribute="TARGET_OBJ" name="form_edit_target" action="form_view_edit_target" method="POST" style="display:inline;">
	                                           		<input type="hidden" name="id" value="${filteredTarget.id}">
	                                           		<input type="Submit" value="Edit" name="Edit_Target" class="menu-submit-button">
	                                           </form:form>
	                                           </li>
	                                           <li>
	                                           <form:form id="form_edit_target" modelAttribute="TARGET_OBJ" name="form_delete_target" action="form_view_delete_target" method="POST" style="display:inline;">
	                                           		<input type="hidden" name="id" value="${filteredTarget.id}">
	                                           		<input type="Submit" value="Delete" name="Delete_Target" class="menu-submit-button">
	                                           </form:form>
	                                           </li>
	                                       </ul>
	                                   </div>
	                               </i>
                               		</td>

                               
 								</tr>
                            </c:forEach>
                            
                           
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