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
    <title>form_vaccmquotation</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
<script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value=" /resources/core/main.css" />" rel="stylesheet">
<script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
</head>
<style>
      body::before {
            content: "";
            background-image:  url(${pageContext.request.contextPath}/resources/images/revamped/lens.jpg);
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
<br>
<div style="position:absolute;background:black;color:white;width:300px;right:0;padding:10px 5px;border-radius:5px">

                           

                        <!-- ###############  small box starts ###########  -->
                        <form:form modelAttribute="QTN_OBJ" action="create_create_lead_quotation">

                           
                                <div class="form_view_aCMQuotation_fbw " style="background:#588157">
                                    <div class="form_view_aCMQuotation_fbwls">
                                        <label for="" class="lb">Quotation Id</label>
                                        <p>${QTN_OBJ.quotationId}</p>
                                    </div>
                                    <div class="form_view_aCMQuotation_fbwls">
                                        <label for="" class="lb">Version Id</label>
                                        <p>${QTN_OBJ.version}</p>
                                    </div>
                                </div>
                       
                        </form:form>
                        <!-- ###############  small box ends ###########  -->
                        <form:form modelAttribute="MANUAL_CNF"
                            action="create_update_generate_manual_configuration_quotation">

                            <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
                            <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
                            <input type="hidden" name="manualConfigurationQuotationId"
                                value="${MANUAL_CNF.manualConfigurationQuotationId}" />
                            <form:hidden path="totalQuotationAmount" />
                            <form:hidden path="remarks" />
                            <!-- ###############  buttons box starts ###########  -->
                            <div  style="border:2px solid black">
                                <div class="form_view_aCMQuotation_btns_wrapper ">
                                    <c:if test="${QUOTATION_EXISTS eq true}">
                                        <a class="a"  id="myBtn[${filteredLeads.leadId}]"
                                            href="form_view_quotation_modal?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}&manualConfigurationQuotationId=${MANUAL_CNF.manualConfigurationQuotationId}"
                                            target="_new"><input type="button" value="Old View / Print Quotation" /></a>
                                        <input class="a" type="submit" name="Generate Quotation" id="Generate Quotation"
                                            Value="Generate Quotation" />
                                        <a class="a"  href="viewQuotation?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }&version=${QTN_OBJ.version}"
                                            target="_new"><input type="button" value="View" /></a>
                                        <a class="a" 
                                            href="downloadQuotation?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }&version=${QTN_OBJ.version}"><input
                                                type="button" value="Download" /></a>
                                        <a class="a"
                                            href="form_view_email_quotation?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }&version=${QTN_OBJ.version}"><input
                                                type="button" value="Send Email" /></a>
                                        <a  class="a" href="view_lead_quotations_list?leadId=${QTN_OBJ.leadEntity.leadId}"><input
                                                type="button" value="List Versions" /></a>
                                    </c:if>
                                    <c:if test="${QUOTATION_EXISTS eq false}">
                                        <a class="a" id="myBtn[${filteredLeads.leadId}]"
                                            href="form_view_quotation_modal?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}&manualConfigurationQuotationId=${MANUAL_CNF.manualConfigurationQuotationId}"
                                            target="_new"><input type="button" value="Old View / Print Quotation" /></a>
                                        <input type="submit" name="Generate Quotation" id="Generate Quotation"
                                            Value="Generate Quotation" />
                                        <a class="a" href="view_lead_quotations_list?leadId=${QTN_OBJ.leadEntity.leadId}"><input
                                                type="button" value="List Versions" /></a>
                                    </c:if>
                                </div>
                            </div>
                            <!-- ###############  buttons box ends ###########  -->

                            <!-- ############### 2 buttons box starts ###########  -->
                            <div style="border:2px solid black">
                                <div class="form_view_aCMQuotation_btns_wrapper" style="display:flex;justify-content:center;flex-direction:column">
                                    <a class="a" href="#"><input type="button" value="General Configuration Section" /></a>
                                    <a class="a" href="form_view_cost_remarks_configure_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input
                                            type="button" value="Costing & Remarks Section" /></a>
                                </div>
                            </div>
                            <!-- ############### 2 buttons box ends ###########  -->
</div>
    <div class="form_vaccmquotation container">
            <!-- ########### emailer box  starts #########  -->
            <div class="form_view_send_email_quotation_emailer">
                <div class="form_view_send_email_quotation_emailer_wrapper">
                    <div class="form_view_send_emailqw_mw">
                    <i class="fa-solid fa-envelope fa-xl" style="margin-top:10px;color:#32cd32 "></i>
                         <div class="form_view_send_emailqw">
                         <label for="" class="lb">To</label>
                            <form:input type="text" id="emailMessageVo.emailToList" path="emailMessageVo.emailToList"
                             />
                            <font color="red">
                                <form:errors path="emailMessageVo.emailToList" cssClass="error" />
                            </font>
                         </div>
                         <div class="form_view_send_emailqw">
                         <label for="" class="lb">Cc</label>
                        <form:input type="text" path="emailMessageVo.emailCcList"
                         />
                        <font color="red">
                            <form:errors path="emailMessageVo.emailCcList" cssClass="error" />
                        </font>
                         </div>
                         <div class="form_view_send_emailqw">
                         <label for="" class="lb">Subject</label>
                        <form:input type="text" path="emailMessageVo.emailSubject"
                        />
                        </td>
                         </div>
                         <div class="form_view_send_emailqw">
                         <label for="" class="lb">Massage</label> <br>
                            <form:textarea cols="94" rows="10" path="emailMessageVo.emailMessage" htmlEscape="false" />
                        </div>
                         <p style="color:orangered;margin:10px auto">Quotation Attached</p>
                        <div class="due_today_task_data_btnss">
                        <input type="submit" name="Send Email" value="Send Email" />
                        
                        </div>
                    </div>
                </div>
                </form:form>
            </div>
            <!-- ########### emailer box  ends #########  -->
</body>

</html>