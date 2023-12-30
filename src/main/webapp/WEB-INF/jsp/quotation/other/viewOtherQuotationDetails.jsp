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
                    <link rel="stylesheet" href="style.css">
                    <script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>

                </head>
<style>
  body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/other_qu.jpg);
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

                    <div class="float-container">
                      
                              
                                <c:if test="${OTH_ACTION ne 'ADD'}">
                              <div class="btn-other-wrap" style="width:200px;border:2px solid red;margin:20px auto;color: white;
    text-align: center;
    border-collapse: collapse;
    border: none;
    background: rgba(0, 0, 0, 9);
    padding: 10px;
    border-radius: 10px;">
                            <font size="4"> <b>Services Action </b></font>
                              <div class="due_today_task_data_btnss">
                            <c:if test="${QTN_OBJ.converted ne true }">
                            <a
                            href="form_view_add_other_quotation?leadId=${LEAD_OBJ.leadId }&quotationId=${QTN_OBJ.quotationId}"><input
                             type="button" 
                             value="Add Service" /></a>
                                                      
                             </c:if>
                             <c:if test="${QTN_OBJ.converted eq true }">
                             <a><input type="button" style="background-color:lightgray;" value="Add Service" /></a>
                              </c:if>            
                              </div>
                              </div>
                               </c:if>


                        <div class="float-child-right">
                            <div class="blue">
                                <div align="center"><b>
                                        <font color="green"> ${Success} </font>
                                        <font color="red"> ${Error}</font>
                                    </b></div>
                               
                                    <tr>
                                        <td>
                                            <c:if test="${OTH_ACTION eq 'ADD'}">
                                                <jsp:include page="form_view_add_manual_other_quotation.jsp" />
                                            </c:if>

                                            <c:forEach items="${QTN_OBJ.otherVoList}" var="otherQtnObj">
                                                <c:choose>
                                                    <c:when
                                                        test="${otherQtnObj.manualOtherQuotationId eq MANUAL_OTH.manualOtherQuotationId  && OTH_ACTION eq 'EDIT' }">
                                                        <jsp:include page="form_view_edit_manual_other_quotation.jsp" />
                                                    </c:when>
                                                    <c:when
                                                        test="${otherQtnObj.manualOtherQuotationId eq MANUAL_OTH.manualOtherQuotationId  && OTH_ACTION eq 'DELETE' }">
                                                        <jsp:include
                                                            page="form_view_delete_manual_other_quotation.jsp" />
                                                    </c:when>
                                                    <c:otherwise>
                                                    
                                                    
                                                    <br>
                                                     <br>
                                                      
        <div class="form_view_add_manual_other_quotation container" style="margin-top:-10px">
        <div class="form_view_add_manual_other_wrapper">
            <h1>Id-
                ${otherQtnObj.manualOtherQuotationId}</h1>
            <div class="form_view_add_manual_other_w_data">
                <div class="form_view_add_manual_other_w_dline bc-clr">
                    <div class="form_view_add_manual_other_w_dl1">
                        <label for="" class="lb">Service Name</label>
                        <p>${otherQtnObj.serviceName }</p>
                    </div>
                    <div class="form_view_add_manual_other_w_dl1">
                        <label for="" class="lb">Service Details</label>
                        <p>${otherQtnObj.serviceDetails}</p>
                    </div>
                    <div class="form_view_add_manual_other_w_dl1">
                        <label for="" class="lb">Service Date</label>
                        <p>
                            <fmt:formatDate value="${otherQtnObj.serviceDate}" pattern="dd-MM-yyyy" />
                        </p>
                    </div>
                    <div class="form_view_add_manual_other_w_dl1">
                        <label for="" class="lb">Service Cost</label>

                        <p>${otherQtnObj.serviceCost}</p>
                    </div>
                </div>
                <div class="form_view_add_manual_other_w_dline bc-clr">
                    <div class="form_view_add_manual_other_w_dl1" style="width:25%">
                        <label for="" class="lb">Service Markup</label>
                        <p>${otherQtnObj.serviceMarkup}</p>
                    </div>
                    <div class="form_view_add_manual_other_w_dl1" style="width:25%">
                        <label for="" class="lb">Display</label>
                        <p>${otherQtnObj.displayOrder}</p>
                    </div>
                </div>
                <div class="due_today_task_data_btnss">
                    <c:if test="${QTN_OBJ.converted ne true }">
                        <a
                            href="form_view_edit_manual_other_quotation?manualOtherQuotationId=${otherQtnObj.manualOtherQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                                type="button"  value="Edit Service" /></a>
                        <a
                            href="form_view_delete_manual_other_quotation?manualOtherQuotationId=${otherQtnObj.manualOtherQuotationId}&quotationId=${QTN_OBJ.quotationId}&leadId=${QTN_OBJ.leadEntity.leadId}"><input
                                type="button" style="background-color:red;" value="Delete Service" /></a>
                    </c:if>
                    <c:if test="${QTN_OBJ.converted eq true }">
                        <a><input type="button" style="background-color:lightgray;" value="Edit Service" /></a>
                        <a><input type="button" style="background-color:lightgray;" value="Delete Service" /></a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>

                </body>

</html>