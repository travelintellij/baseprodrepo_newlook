<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>AdminIncentiveReportSearch</title>
               <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
            </head>
            <style>
           body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/ad_in_rep.jpg);
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
                <div class="AdminIncentiveReportSearch container">
                    <div class="AdminIncentiveReportSearch_wrapper">
                        <form:form method="post" action="showAdminIncentiveSearchReport"
                            modelAttribute="searchincentive">
                            <input type="hidden" name="userId" value="${userId}" />
                            <input type="hidden" name="userName" value="${userName}" />
                            <h1 style="font-size: 25px;margin:10px 0;color:#32cd32  ">Search Incentive Claims</h1>
                            <div class="AdminIncentiveReportSearch_wrapper_data">
                                <div class="AdminIncentiveReportSearch_wrapper_data_line">
                                    <div class="AdminIncentiveReportSearch_wrapper_dl1">
                                        <label for="">From Date</label>
                                        <input type="date" name="claimFromDate" />
                                    </div>
                                    <div class="AdminIncentiveReportSearch_wrapper_dl1">
                                        <label for="">To Date</label>
                                        <input type="date" name="claimToDate" />
                                    </div>
                                    <div class="AdminIncentiveReportSearch_wrapper_dl1">
                                        <label for="">Claim Status</label>
                                        <select id="claimStatus" name="claimStatus" style="width:90%">
                                            <option value="None">Select</option>
                                            <option value="ALL"> -----ALL----</option>
                                            <option value="Pending"> --Pending---</option>
                                            <option value="Approved"> --Approved--</option>
                                            <option value="Paid"> --Paid------</option>
                                            <option value="Rejected">-Rejected---</option>
                                        </select>
                                    </div>
                                    <div class="AdminIncentiveReportSearch_wrapper_dl1">
                                        <label for="">User Name</label>
                                        <select id="reportOfUser" name="reportOfUser" style="width:90%">
                                            <option value="0"> -----ALL----</option>
                                            <c:if test="${not empty ActiveUsersList}">
                                                <c:forEach items="${ActiveUsersList}" var="userObj">
                                                    <option value="${userObj.userId}">${userObj.name}</option>
                                                </c:forEach>
                                            </c:if>

                                        </select>
                                    </div>
                                </div>
                                <div class="due_today_task_data_btns">
                                    <input type="submit" value="Search Claims" />
                                </div>
                            </div>
                        </form:form>
                    </div>
                </div>
            </body>

</html>