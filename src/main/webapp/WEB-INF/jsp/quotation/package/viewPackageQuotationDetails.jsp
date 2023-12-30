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
                    
                  
                        
                    <br>
                   
               
                                <c:forEach items="${QTN_OBJ.tourPackageVoList}" var="packageQtnObj">
                              
       <div class="fl_view " style="margin:0 auto;width:1200px">
        <div class="fl_view_wrapper">
            <div class="fl_view_wrapper_data">
                <div class="fl_view_wrapper_data_line bc-clr">
                    <div class="fl_view_wrapper_dl">
                        <label for="" class="lb">City</label>
                        <p>${packageQtnObj.cityName }</p>
                    </div>
                    <div class="fl_view_wrapper_dl">
                        <label for="" class="lb">Package Name</label>
                        <p>${packageQtnObj.packageName}</p>
                    </div>
                    <div class="fl_view_wrapper_dl">
                        <label for="" class="lb">Start Date</label>
                        <p><fmt:formatDate value="${packageQtnObj.startDate}" pattern="dd-MM-yyyy" /></p>
                    </div>
                    <div class="fl_view_wrapper_dl">
                        <label for="" class="lb">End Date</label>
                        <p><fmt:formatDate value="${packageQtnObj.endDate}" pattern="dd-MM-yyyy" /></p>
                    </div>
                </div>
                <div class="fl_view_wrapper_data_line bc-clr">
                    <div class="fl_view_wrapper_dl">
                        <label for="" class="lb">Adult</label>
                        <p>${packageQtnObj.adults}</p>
                    </div>
                    <div class="fl_view_wrapper_dl">
                        <label for="" class="lb">Children</label>
                        <p>${packageQtnObj.children}</p>
                    </div>
                    <div class="fl_view_wrapper_dl">
                        <label for="" class="lb">Infant</label>
                        <p>${packageQtnObj.infant}</p>
                    </div>
                    <div class="fl_view_wrapper_dl">
                        <label for="" class="lb">Package Cost</label>
                        <p>${packageQtnObj.pkgCost}</p>
                    </div>
                </div>
                <div class="fl_view_wrapper_data_line bc-clr">
                    <div class="fl_view_wrapper_dl" style="width:25%">
                        <label for="" class="lb">Package Markup</label>
                        <p>${packageQtnObj.pkgMarkup}</p>
                    </div>
                    <div class="fl_view_wrapper_dl" style="width:25%">
                        <label for="" class="lb">Flight Included</label>
                        <p>${packageQtnObj.flightIncluded}</p>
                    </div>
                    <div class="fl_view_wrapper_dl" style="width:25%">
                        <label for="" class="lb">Display Order</label>
                        <p>${packageQtnObj.displayOrder }</p>
                    </div>
                </div>
                <div class="fl_view_wrapper_data_line bc-clr">
                    <div class="fl_view_wrapper_dl" style="width:100%">
                        <label for="" class="lb">Remarks</label>
                        <p>${packageQtnObj.remarks}</p>
                    </div>
                </div>
                <div class="due_today_task_data_btnss">
                    <a
                        href="form_view_manual_package_quotation_detail?manualPkgQuotationId=${packageQtnObj.manualPkgQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                            type="button"  value="View Details" /></a>
                    
                    <c:if test="${QTN_OBJ.converted ne true }">
                        <a
                            href="form_view_edit_manual_package_quotation?manualPkgQuotationId=${packageQtnObj.manualPkgQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                                type="button"  value="Edit Package" /></a>
                        <a
                            href="form_view_delete_manual_package_quotation?manualPkgQuotationId=${packageQtnObj.manualPkgQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                                type="button" style="background-color:red;" value="Delete Package" /></a>
                    </c:if>
                    <c:if test="${QTN_OBJ.converted eq true }">
                        <a><input type="button" style="background-color:lightgray;" value="Edit Package" /></a>
                        <a><input type="button" style="background-color:lightgray;" value="Delete Package" /></a>
                    
                    </c:if>
                </div>
            </div>
        </div>
    </div>
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