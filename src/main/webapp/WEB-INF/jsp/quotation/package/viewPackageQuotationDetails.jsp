<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
    <script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
</head>
<style>
 body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/package_pic.jpg);
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


<div class="my-ki">
    <!-- ############# quick lead view starts here################## -->
    <form:form modelAttribute="LEAD_OBJ" action="create_create_lead_quotation">
    <div class="sep_quick_lead_view">
        <input type="checkbox" name="" id="" class="ch_quick_lead_view">
        <div class="hamburgur_menu_quick_lead_view">
            <span class="sep_line1"></span>
            <span class="sep_line2"></span>
            <span class="sep_line3"></span>
        </div>
        <h2 style="display:inline-block;font-size:20px;;">Quick lead view</h2>
        <div class="lead_view_sep">
        <jsp:include page="../leadDetailsOpenNavView.jsp" />
        </div>
    </div>
    </form:form>
    <!-- ############# quick lead view ends here################## -->
</div>


<div class="afd">
<jsp:include page="../_quotationServicesMenu.jsp" />
</div>



    <form:form modelAttribute="QTN_OBJ" action="create_create_lead_quotation">
     <div class="viewInsuranceQuotationDetails">
            <div class="viewInsuranceQuotationD_wrapper">
                <div class="viewInsuranceQuotationD_wr_data">
                    <div class="viewInsuranceQuotationD_wr_data_line">
                        <label for="" class="lb">Quotation</label>
                        <p>${QTN_OBJ.quotationId}</p>
                    </div>
                    <div class="viewInsuranceQuotationD_wr_data_line">
                        <label for="" class="lb"> Version Id</label>
                        <p>${QTN_OBJ.version}</p>
                    </div>
                </div>
              </div>
            </div>
    </form:form>
    
    <div class="float-container">
        <div class="float-child-right">
            <div class="blue">
        <div class="pt container" style="margin-top:-70px">
        <div class="pt_wrapper" >
            <h1 style="margin:10px 0">Add Package Stay to quotation</h1>
            <div class="due_today_task_data_btnss">
                <c:if test="${QTN_OBJ.converted ne true }">
                  <a href="#"> <input type="button"  value="Search Package" /></a>
                   <a href="form_view_add_package_quotation?leadId=${LEAD_OBJ.leadId }&quotationId=${QTN_OBJ.quotationId}"><input
                                type="button"  value="Add Manually" /></a>
                </c:if>
                <c:if test="${QTN_OBJ.converted eq true }">
                   <a href="#"> <input type="button" value="Search Package" /></a>
                    <a><input type="button"  value="Add Manually" /></a>
                </c:if>
            </div>
        </div>
    </div>
                <div align="center"><b>
                        <font color="green"> ${Success} </font>
                        <font color="red"> ${Error}</font>
                    </b></div>
                <table style="width:70%;  table-layout:fixed">
                    <tr>
                        <td>
                            <%-- <c:if test="${HTL_STOP_ACTION eq 'ADD'}">
                                <jsp:include page="form_view_add_manual_package_quotation.jsp" />
                                </c:if>
                                --%>
                                <c:forEach items="${QTN_OBJ.tourPackageVoList}" var="packageQtnObj">
                                    <%-- <c:choose>
                                        <c:when
                                            test="${packageQtnObj.manualPackageQuotationId eq MANUAL_PKG.manualPackageQuotationId  && PKG_STOP_ACTION eq 'EDIT' }">
                                            <jsp:include page="form_view_edit_manual_package_quotation.jsp" />
                                        </c:when>
                                        <c:when
                                            test="${packageQtnObj.manualPackageQuotationId eq MANUAL_PKG.manualPackageQuotationId  && PKG_STOP_ACTION eq 'DELETE' }">
                                            <jsp:include page="form_view_delete_manual_package_quotation.jsp" />
                                        </c:when>
                                        <c:otherwise>
                                            --%>
                                            <table
                                                style="width:100%;  table-layout:fixed;background-color: #DFE0DC; border: 3px solid #000000; border-collapse: collapse">
                                                <tr>
                                                    <th style="background-color:blue;" colspan="5">
                                                        <font size="4"><b>Id- ${packageQtnObj.manualPkgQuotationId}</b>
                                                        </font>
                                                    </th>
                                                </tr>
                                                <tr>

                                                    <th colspan="1">
                                                        <font size="4"><b>City</b></font>
                                                    </th>
                                                    <th colspan="2">
                                                        <font size="4"><b>Package Name</b></font>
                                                    </th>
                                                    <th>
                                                        <font size="4"><b>Start Date</b></font>
                                                    </th>
                                                    <th>
                                                        <font size="4"><b>End Date</b></font>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <td>${packageQtnObj.cityName }</td>
                                                    <td colspan="2">${packageQtnObj.packageName}</td>
                                                    <td>
                                                        <fmt:formatDate value="${packageQtnObj.startDate}"
                                                            pattern="dd-MM-yyyy" />
                                                    </td>
                                                    <td>
                                                        <fmt:formatDate value="${packageQtnObj.endDate}"
                                                            pattern="dd-MM-yyyy" />
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <th>
                                                        <font size="4"><b>Adults</b></font>
                                                    </th>
                                                    <th>
                                                        <font size="4"><b>Children</b></font>
                                                    </th>
                                                    <th>
                                                        <font size="4"><b>Infant</b></font>
                                                    </th>
                                                    <th>
                                                        <font size="4"><b>Package Cost</b></font>
                                                    </th>
                                                    <th>
                                                        <font size="4"><b>Package Markup</b></font>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <td>${packageQtnObj.adults}</td>
                                                    <td>${packageQtnObj.children}</td>
                                                    <td>${packageQtnObj.infant}</td>
                                                    <td>${packageQtnObj.pkgCost}</td>
                                                    <td>${packageQtnObj.pkgMarkup}</td>
                                                </tr>
                                                <tr>
                                                    <th colspan="3">
                                                        <font size="4"><b>Remarks</b></font>
                                                    </th>
                                                    <th>
                                                        <font size="4"><b>Flight Included</b></font>
                                                    </th>
                                                    <th>
                                                        <font size="4"><b>Display Order</b></font>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">${packageQtnObj.remarks} </td>
                                                    <td>${packageQtnObj.flightIncluded}</td>
                                                    <td>${packageQtnObj.displayOrder } </td>
                                                </tr>
                                                <tr>
                                                    <th colspan="5">
                                                        <a
                                                            href="form_view_manual_package_quotation_detail?manualPkgQuotationId=${packageQtnObj.manualPkgQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                                                                type="button" style="background-color:blue;"
                                                                value="View Details" /></a>

                                                        <c:if test="${QTN_OBJ.converted ne true }">
                                                            <a
                                                                href="form_view_edit_manual_package_quotation?manualPkgQuotationId=${packageQtnObj.manualPkgQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                                                                    type="button" style="background-color:blue;"
                                                                    value="Edit Package" /></a>
                                                            <a
                                                                href="form_view_delete_manual_package_quotation?manualPkgQuotationId=${packageQtnObj.manualPkgQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                                                                    type="button" style="background-color:red;"
                                                                    value="Delete Package" /></a>
                                                        </c:if>
                                                        <c:if test="${QTN_OBJ.converted eq true }">
                                                            <a><input type="button" style="background-color:lightgray;"
                                                                    value="Edit Package" /></a>
                                                            <a><input type="button" style="background-color:lightgray;"
                                                                    value="Delete Package" /></a>

                                                        </c:if>
                                                    </th>
                                                </tr>
                                            </table>
                                            <%-- </c:otherwise>
                                                </c:choose>
                                                --%>
                                </c:forEach>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

</body>

</html>