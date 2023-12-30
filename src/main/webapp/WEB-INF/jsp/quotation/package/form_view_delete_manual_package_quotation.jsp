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
    
    <div class="afd">
<jsp:include page="../_quotationServicesMenu.jsp" />
</div>
 
    
  
    
    <div class="float-container">
       
    
        <div class="float-child-right">
            <div class="blue">
    
                <div align="center"><b>
                        <font color="green"> ${Success} </font>
                        <font color="red"> ${Error}</font>
                    </b></div>
              
                            <form:form modelAttribute="MANUAL_PKG" action="delete_delete_package_manual_quotation">
    
                                <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
                                <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
                                <input type="hidden" name="manualPkgQuotationId"
                                    value="${MANUAL_PKG.manualPkgQuotationId}" />
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
     <br>
      <br>
                       <div class="com_page container">
        <div class="com_page_wrapper" >
            <h1>Id- ${MANUAL_PKG.manualPkgQuotationId}</h1>
            <div class="com_page_wrapper_data">
                <div class="com_page_wrapper_data_line bc-clr">
                    <div class="com_page_wrapper_dl1">
                        <label for="" class="lb">City</label>
                        <p>${MANUAL_PKG.cityName}</p>
                    </div>
                    <div class="com_page_wrapper_dl1">
                        <label for="" class="lb">Package Name</label>
                        <p>${MANUAL_PKG.packageName}</p>
                    </div>
                    <div class="com_page_wrapper_dl1">
                        <label for="" class="lb">Start Date</label>
                        <p>${MANUAL_PKG.startDate}</p>
                    </div>
                    <div class="com_page_wrapper_dl1">
                        <label for="" class="lb">End Date</label>
                        <p>${MANUAL_PKG.endDate}</p>
                    </div>
                </div>
                <div class="com_page_wrapper_data_line bc-clr">
                    <div class="com_page_wrapper_dl1">
                        <label for="" class="lb">Adults</label>
                        <p>${MANUAL_PKG.adults}</p>
                    </div>
                    <div class="com_page_wrapper_dl1">
                        <label for="" class="lb">Children</label>
                        <p>${MANUAL_PKG.children}</p>
                    </div>
                    <div class="com_page_wrapper_dl1">
                        <label for="" class="lb">Infant</label>
                        <p>${MANUAL_PKG.infant}</p>
                    </div>
                    <div class="com_page_wrapper_dl1">
                        <label for="" class="lb">Package Cost</label>
                        <p>${MANUAL_PKG.pkgCost}</p>
                    </div>
                </div>
                <div class="com_page_wrapper_data_line bc-clr">
                    <div class="com_page_wrapper_dl1" style="width:294px">
                        <label for="" class="lb">Package Markup</label>
                        <p>${MANUAL_PKG.pkgMarkup}</p>
                    </div>
                    <div class="com_page_wrapper_dl1" style="width:294px">
                        <label for="" class="lb">Flight Included</label>
                        <p>${MANUAL_PKG.flightIncluded}</p>
                    </div>
                    <div class="com_page_wrapper_dl1" style="width:294px">
                        <label for="" class="lb">Display Order</label>
                        <p>${MANUAL_PKG.displayOrder}</p>
                    </div>
                </div>
                <div class="com_page_wrapper_data_line bc-clr">
                    <div class="com_page_wrapper_dl1" style="width: 100%;">
                        <label for="" class="lb">Package Description</label>
                        <p>${MANUAL_PKG.packageDescription}</p>
                    </div>
                </div>
                <div class="com_page_wrapper_data_line bc-clr">
                    <div class="com_page_wrapper_dl1" style="width: 100%;">
                        <label for="" class="lb">Inclusions</label>
                        <p>${MANUAL_PKG.inclusions}</p>
                    </div>
                </div>
                <div class="com_page_wrapper_data_line bc-clr">
                    <div class="com_page_wrapper_dl1" style="width: 100%;">
                        <label for="" class="lb">Exclusions</label>
                        <p>${MANUAL_PKG.exclusions}</p>
                    </div>
                </div>
                <div class="com_page_wrapper_data_line bc-clr">
                    <div class="com_page_wrapper_dl1" style="width: 100%;">
                        <label for="" class="lb">Cancellation Policy (If left empty , it wont be printed)</label>
                        <p>${MANUAL_PKG.cancellationPolicy}</p>
                    </div>
                </div>
                <div class="due_today_task_data_btnss">
                <input type="submit" name="deletePackage" id="deletePackage" Value="Confirm Delete !" />
                <a href="form_view_package_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input
                        type="button" value="Back" /></a>
                </div>
            </div>
        </div>
    </div>
                            </form:form>
    
    
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</body>
</html>