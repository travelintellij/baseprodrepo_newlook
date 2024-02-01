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
                    <link rel="stylesheet" href="style.css">
                    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
                    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
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

 <div class="m-d ">
                                    <div class="form_view_aCMQuotation_fbwls">
                                        <label for="" class="lb">Quotation Id</label>
                                        <p>${QTN_OBJ.quotationId}</p>
                                    </div>
                                    <div class="form_view_aCMQuotation_fbwls">
                                        <label for="" class="lb">Version Id</label>
                                        <p>${QTN_OBJ.version}</p>
                                    </div>
</div>

<div style="position:absolute;background:black;color:white;width:300px;left:0;padding:10px 5px;border-radius:5px">

                           

                        <!-- ###############  small box starts ###########  -->
                        <form:form modelAttribute="QTN_OBJ" action="create_create_lead_quotation">

                           
                                
                       
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
     
                            <!-- ########### forth box  starts #########  -->
                            <div class="form_vaccmquotation_lastbox">
                                <div class="form_vaccmquotation_lastbox_wrapper">
                                    <table style="width:100%;  table-layout:fixed;background-color:black;">
                                        <c:set var="grandTotalCost" value="0" scope="page" />
                                        <c:set var="grandTotalMarkup" value="0" scope="page" />

                                        <c:if test="${QTN_OBJ.flight eq true}">
                                            <c:set var="totalFlightCost" scope="page" value="0" />
                                            <c:set var="totalFlightMarkup" scope="page" value="0" />
                                            <c:forEach var="flightList" items="${QTN_OBJ.manualQuotationsVoList}">
                                                <c:set var="totalFlightCost"
                                                    value="${totalFlightCost + flightList.flightCost}" scope="page" />
                                                <c:set var="totalFlightMarkup"
                                                    value="${totalFlightMarkup + flightList.flightMarkup}"
                                                    scope="page" />
                                            </c:forEach>
                                            <tr>
                                                <th colspan="2"
                                                    style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;">
                                                    <a
                                                        href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input
                                                            type="button"
                                                            style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;"
                                                            value="Flight" /></a>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th style="background-color: #C0C0C0;color:black;"> Flight Total Cost
                                                </th>
                                                <td>
                                                    INR
                                                    <c:out value="${totalFlightCost}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="background-color: #C0C0C0;color:black;"> Flight Total Markup
                                                </th>
                                                <td>INR
                                                    <c:out value="${totalFlightMarkup}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="background-color: gray;color:black;"> Grand Total (Flight)
                                                </th>
                                                <td style="background-color: LIGHTCORAL;color:white;">INR
                                                    <c:out value="${totalFlightCost + totalFlightMarkup}" />
                                                </td>
                                            </tr>
                                            <c:set var="grandTotalCost" value="${grandTotalCost + totalFlightCost}"
                                                scope="page" />
                                            <c:set var="grandTotalMarkup"
                                                value="${grandTotalMarkup + totalFlightMarkup}" scope="page" />
                                        </c:if>

                                        <c:if test="${QTN_OBJ.hotel eq true}">

                                            <tr>
                                                <th colspan="2"
                                                    style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;">
                                                    <a
                                                        href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input
                                                            type="button"
                                                            style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;"
                                                            value="Hotel" /></a>
                                                </th>
                                            </tr>


                                            <c:forEach items="${QTN_OBJ.hotelOptionsWiseMap}" var="entry">
                                                <c:set var="totalHotelCost" scope="page" value="0" />
                                                <c:set var="totalHotelMarkup" scope="page" value="0" />
                                                <tr>
                                                    <th colspan="2" style="background-color: blue;color:white;">Option
                                                        (${entry.key})</th>
                                                </tr>
                                                <c:forEach var="hotelObj" items="${entry.value}">
                                                    <c:set var="totalHotelCost"
                                                        value="${totalHotelCost + hotelObj.hotelStayCost}"
                                                        scope="page" />
                                                    <c:set var="totalHotelMarkup"
                                                        value="${totalHotelMarkup + hotelObj.hotelStayMarkup}"
                                                        scope="page" />
                                                </c:forEach>
                                                <tr>
                                                    <th style="background-color: #C0C0C0;color:black;"> Hotel Total Cost
                                                    </th>
                                                    <td>
                                                        INR
                                                        <c:out value="${totalHotelCost}" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th style="background-color: #C0C0C0;color:black;"> Hotel Total
                                                        Markup</th>
                                                    <td>INR
                                                        <c:out value="${totalHotelMarkup}" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <th style="background-color: gray;color:black;"> Grand Total (Hotel)
                                                    </th>
                                                    <td style="background-color: LIGHTCORAL;color:white;">INR
                                                        <c:out value="${totalHotelCost + totalHotelMarkup}" />
                                                    </td>
                                                </tr>
                                            </c:forEach>


                                        </c:if>

                                        <c:if test="${QTN_OBJ.transfers eq true}">
                                            <c:set var="totalTransfersCost" scope="page" value="0" />
                                            <c:set var="totalTransfersMarkup" scope="page" value="0" />
                                            <c:forEach var="transfersList" items="${QTN_OBJ.transferVoList}">
                                                <c:set var="totalTransfersCost"
                                                    value="${totalTransfersCost + transfersList.transferCost}"
                                                    scope="page" />
                                                <c:set var="totalTransfersMarkup"
                                                    value="${totalTransfersMarkup + transfersList.transferMarkup}"
                                                    scope="page" />
                                            </c:forEach>
                                            <tr>
                                                <th colspan="2"
                                                    style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;">
                                                    <a
                                                        href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input
                                                            type="button"
                                                            style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;"
                                                            value="Transfers" /></a>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th style="background-color: #C0C0C0;color:black;"> Transfers Total Cost
                                                </th>
                                                <td>
                                                    INR
                                                    <c:out value="${totalTransfersCost}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="background-color: #C0C0C0;color:black;"> Transfers Total
                                                    Markup</th>
                                                <td>INR
                                                    <c:out value="${totalTransfersMarkup}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="background-color: gray;color:black;"> Grand Total (Transfers)
                                                </th>
                                                <td style="background-color: LIGHTCORAL;color:white;">INR
                                                    <c:out value="${totalTransfersCost + totalTransfersMarkup}" />
                                                </td>
                                            </tr>
                                            <c:set var="grandTotalCost" value="${grandTotalCost + totalTransfersCost}"
                                                scope="page" />
                                            <c:set var="grandTotalMarkup"
                                                value="${grandTotalMarkup + totalTransfersMarkup}" scope="page" />
                                        </c:if>

                                        <c:if test="${QTN_OBJ.sightseeing eq true}">
                                            <c:set var="totalSightSeeingCost" scope="page" value="0" />
                                            <c:set var="totalSightSeeingMarkup" scope="page" value="0" />
                                            <c:forEach var="sightSeeingList" items="${QTN_OBJ.sightSeeingVoList}">
                                                <c:set var="totalSightSeeingCost"
                                                    value="${totalSightSeeingCost + sightSeeingList.sightSeeingCost}"
                                                    scope="page" />
                                                <c:set var="totalSightSeeingMarkup"
                                                    value="${totalSightSeeingMarkup + sightSeeingList.sightSeeingMarkup}"
                                                    scope="page" />
                                            </c:forEach>
                                            <tr>
                                                <th colspan="2"
                                                    style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;">
                                                    <a
                                                        href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input
                                                            type="button"
                                                            style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;"
                                                            value="Sight-Seeing" /></a>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th style="background-color: #C0C0C0;color:black;"> Sight-Seeing Total
                                                    Cost </th>
                                                <td>
                                                    INR
                                                    <c:out value="${totalSightSeeingCost}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="background-color: #C0C0C0;color:black;"> Sight-Seeing Total
                                                    Markup</th>
                                                <td>INR
                                                    <c:out value="${totalSightSeeingMarkup}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="background-color: gray;color:black;"> Grand Total (
                                                    Sight-Seeing )</th>
                                                <td style="background-color: LIGHTCORAL;color:white;">INR
                                                    <c:out value="${totalSightSeeingCost + totalSightSeeingMarkup}" />
                                                </td>
                                            </tr>

                                            <c:set var="grandTotalCost" value="${grandTotalCost + totalSightSeeingCost}"
                                                scope="page" />
                                            <c:set var="grandTotalMarkup"
                                                value="${grandTotalMarkup + totalSightSeeingMarkup}" scope="page" />

                                        </c:if>


                                        <c:if test="${QTN_OBJ.visa eq true}">
                                            <c:set var="totalVisaCost" scope="page" value="0" />
                                            <c:set var="totalVisaMarkup" scope="page" value="0" />
                                            <c:forEach var="visaList" items="${QTN_OBJ.visaVoList}">
                                                <c:set var="totalVisaCost" value="${totalVisaCost + visaList.visaCost}"
                                                    scope="page" />
                                                <c:set var="totalVisaMarkup"
                                                    value="${totalVisaMarkup + visaList.visaMarkup}" scope="page" />
                                            </c:forEach>
                                            <tr>
                                                <th colspan="2"
                                                    style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;">
                                                    <a
                                                        href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input
                                                            type="button"
                                                            style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;"
                                                            value="Visa" /></a>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th style="background-color: #C0C0C0;color:black;"> Visa Total Cost
                                                </th>
                                                <td>
                                                    INR
                                                    <c:out value="${totalVisaCost}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="background-color: #C0C0C0;color:black;"> Visa Total Markup
                                                </th>
                                                <td>INR
                                                    <c:out value="${totalVisaMarkup}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="background-color: gray;color:black;"> Grand Total ( Visa )
                                                </th>
                                                <td style="background-color: LIGHTCORAL;color:white;">INR
                                                    <c:out value="${totalVisaCost + totalVisaMarkup}" />
                                                </td>
                                            </tr>

                                            <c:set var="grandTotalCost" value="${grandTotalCost + totalVisaCost}"
                                                scope="page" />
                                            <c:set var="grandTotalMarkup" value="${grandTotalMarkup + totalVisaMarkup}"
                                                scope="page" />

                                        </c:if>

                                        <c:if test="${QTN_OBJ.insurance eq true}">
                                            <c:set var="totalInsuranceCost" scope="page" value="0" />
                                            <c:set var="totalInsuranceMarkup" scope="page" value="0" />
                                            <c:forEach var="insuranceList" items="${QTN_OBJ.insuranceVoList}">
                                                <c:set var="totalInsuranceCost"
                                                    value="${totalInsuranceCost + insuranceList.premiumCost}"
                                                    scope="page" />
                                                <c:set var="totalInsuranceMarkup"
                                                    value="${totalInsuranceMarkup + insuranceList.premiumMarkup}"
                                                    scope="page" />
                                            </c:forEach>
                                            <tr>
                                                <th colspan="2"
                                                    style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;">
                                                    <a
                                                        href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input
                                                            type="button"
                                                            style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;"
                                                            value="Insurance" /></a>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th style="background-color: #C0C0C0;color:black;"> Insurance Total Cost
                                                </th>
                                                <td>
                                                    INR
                                                    <c:out value="${totalInsuranceCost}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="background-color: #C0C0C0;color:black;"> Insurance Total
                                                    Markup</th>
                                                <td>INR
                                                    <c:out value="${totalInsuranceMarkup}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="background-color: gray;color:black;"> Grand Total ( Insurance
                                                    )</th>
                                                <td style="background-color: LIGHTCORAL;color:white;">INR
                                                    <c:out value="${totalInsuranceCost + totalInsuranceMarkup}" />
                                                </td>
                                            </tr>
                                            <c:set var="grandTotalCost" value="${grandTotalCost + totalInsuranceCost}"
                                                scope="page" />
                                            <c:set var="grandTotalMarkup"
                                                value="${grandTotalMarkup + totalInsuranceMarkup}" scope="page" />

                                        </c:if>


                                        <c:if test="${QTN_OBJ.cruise eq true}">
                                            <c:set var="totalCruiseCost" scope="page" value="0" />
                                            <c:set var="totalCruiseMarkup" scope="page" value="0" />
                                            <c:forEach var="cruiseList" items="${QTN_OBJ.cruiseVoList}">
                                                <c:set var="totalCruiseCost"
                                                    value="${totalCruiseCost + cruiseList.cruiseStayCost}"
                                                    scope="page" />
                                                <c:set var="totalCruiseMarkup"
                                                    value="${totalCruiseMarkup + cruiseList.cruiseStayMarkup}"
                                                    scope="page" />
                                            </c:forEach>
                                            <tr>
                                                <th colspan="2"
                                                    style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;">
                                                    <a
                                                        href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input
                                                            type="button"
                                                            style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;"
                                                            value="Cruise" /></a>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th style="background-color: #C0C0C0;color:black;"> Cruise Total Cost
                                                </th>
                                                <td>
                                                    INR
                                                    <c:out value="${totalCruiseCost}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="background-color: #C0C0C0;color:black;"> Cruise Total Markup
                                                </th>
                                                <td>INR
                                                    <c:out value="${totalCruiseMarkup}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="background-color: gray;color:black;"> Grand Total ( Cruise )
                                                </th>
                                                <td style="background-color: LIGHTCORAL;color:white;">INR
                                                    <c:out value="${totalCruiseCost + totalCruiseMarkup}" />
                                                </td>
                                            </tr>
                                            <c:set var="grandTotalCost" value="${grandTotalCost + totalCruiseCost}"
                                                scope="page" />
                                            <c:set var="grandTotalMarkup"
                                                value="${grandTotalMarkup + totalCruiseMarkup}" scope="page" />

                                        </c:if>

                                        <c:if test="${QTN_OBJ.tourPackage eq true}">
                                            <c:set var="totalPackageCost" scope="page" value="0" />
                                            <c:set var="totalPackageMarkup" scope="page" value="0" />
                                            <c:forEach var="packageList" items="${QTN_OBJ.tourPackageVoList}">
                                                <c:set var="totalPackageCost"
                                                    value="${totalPackageCost + packageList.pkgCost}" scope="page" />
                                                <c:set var="totalPackageMarkup"
                                                    value="${totalPackageMarkup + packageList.pkgMarkup}"
                                                    scope="page" />
                                            </c:forEach>
                                            <tr>
                                                <th colspan="2"
                                                    style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;">
                                                    <a
                                                        href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input
                                                            type="button"
                                                            style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;"
                                                            value="Tour Package" /></a>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th style="background-color: #C0C0C0;color:black;"> Tour Package Total
                                                    Cost </th>
                                                <td>
                                                    INR
                                                    <c:out value="${totalPackageCost}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="background-color: #C0C0C0;color:black;"> Tour Package Total
                                                    Markup</th>
                                                <td>INR
                                                    <c:out value="${totalPackageMarkup}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="background-color: gray;color:black;"> Grand Total ( Tour
                                                    Package )</th>
                                                <td style="background-color: LIGHTCORAL;color:white;">INR
                                                    <c:out value="${totalPackageCost + totalPackageMarkup}" />
                                                </td>
                                            </tr>
                                            <c:set var="grandTotalCost" value="${grandTotalCost + totalPackageCost}"
                                                scope="page" />
                                            <c:set var="grandTotalMarkup"
                                                value="${grandTotalMarkup + totalPackageMarkup}" scope="page" />
                                        </c:if>

                                        <c:if test="${QTN_OBJ.others eq true}">
                                            <c:set var="totalOthersCost" scope="page" value="0" />
                                            <c:set var="totalOthersMarkup" scope="page" value="0" />
                                            <c:forEach var="otherList" items="${QTN_OBJ.otherVoList}">
                                                <c:set var="totalOthersCost"
                                                    value="${totalOthersCost + otherList.serviceCost}" scope="page" />
                                                <c:set var="totalOthersMarkup"
                                                    value="${totalOthersMarkup + otherList.serviceMarkup}"
                                                    scope="page" />
                                            </c:forEach>
                                            <tr>
                                                <th colspan="2"
                                                    style="background-color: rgba(0, 0, 0, 0.0) !important;border:none;">
                                                    <a
                                                        href="form_view_flight_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }"><input
                                                            type="button"
                                                            style="width:70%;background-color:#FF5733;color:white;font-weight: bold;font-weight: 600;font-size: 18px;"
                                                            value="Other Services" /></a>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th style="background-color: #C0C0C0;color:black;"> Other Services Total
                                                    Cost </th>
                                                <td>
                                                    INR
                                                    <c:out value="${totalOthersCost}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="background-color: #C0C0C0;color:black;"> Other Services Total
                                                    Markup</th>
                                                <td>INR
                                                    <c:out value="${totalOthersMarkup}" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <th style="background-color: gray;color:black;"> Grand Total ( Other
                                                    Services )</th>
                                                <td style="background-color: LIGHTCORAL;color:white;">INR
                                                    <c:out value="${totalOthersCost + totalOthersMarkup}" />
                                                </td>
                                            </tr>

                                            <c:set var="grandTotalCost" value="${grandTotalCost + totalOthersCost}"
                                                scope="page" />
                                            <c:set var="grandTotalMarkup"
                                                value="${grandTotalMarkup + totalOthersMarkup}" scope="page" />

                                        </c:if>
                                        <tr>
                                            <th colspan="2">Remarks</th>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <form:textarea path="remarks" rows="5" cols="90" />
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="2">
                                                <table>
                                                    <fmt:setLocale value="en_IN" />
                                                    <tr>
                                                        <th colspan="2" style="background-color:blue; "></th>
                                                    </tr>



                                                    <c:forEach items="${QTN_OBJ.hotelOptionsWiseMap}" var="entry">
                                                        <c:set var="totalHotelChotelOptionsWiseMapost" scope="page"
                                                            value="0" />
                                                        <c:set var="totalHotelMarkup" scope="page" value="0" />
                                                        <c:set var="totalHotelCost" scope="page" value="0" />
                                                        <c:forEach var="hotelObj" items="${entry.value}">
                                                            <c:set var="totalHotelCost"
                                                                value="${totalHotelCost + hotelObj.hotelStayCost}"
                                                                scope="page" />
                                                            <c:set var="totalHotelMarkup"
                                                                value="${totalHotelMarkup + hotelObj.hotelStayMarkup}"
                                                                scope="page" />
                                                        </c:forEach>
                                                        <tr>
                                                            <th colspan="2" style="background-color: blue;color:white;">
                                                                Grand Total with Hotel Option
                                                                (${entry.key})</th>
                                                        </tr>
                                                        <tr>
                                                            <th style="width:50%;background-color:#808000;">Total NETT
                                                                Cost : </th>
                                                            <td>
                                                                <fmt:formatNumber
                                                                    value="${grandTotalCost + totalHotelCost}"
                                                                    type="currency" currencySymbol="INR " />
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <th style="width:50%;background-color:#808000;">Total Markup
                                                                : </th>
                                                            <td>
                                                                <fmt:formatNumber
                                                                    value="${grandTotalMarkup + totalHotelMarkup}"
                                                                    type="currency" currencySymbol="INR " />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <th style="width:50%;background-color:#808000;">Total
                                                                Quotation Amount : </th>
                                                            <td style="background-color:lawngreen;color:black;">
                                                                <fmt:formatNumber
                                                                    value="${grandTotalCost + grandTotalMarkup + totalHotelCost + totalHotelMarkup}"
                                                                    type="currency" currencySymbol="INR " />
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                    <tr>
                                                        <div class="due_today_task_data_btns">
                                                            <input type="submit" name="Save Configuration"
                                                                id="Save Configuration" Value="Save Configuration" />
                                                            <!--
            					<a href="form_view_configure_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:blue;" value="Cancel" /></a>			 
            					
            					<a href="form_view_delete_confirm_configure_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button" style="background-color:red;" value="Restore Default" /></a>
            					 -->
                                                        </div>
                                                    </tr>



                                                </table>
                                            </td>
                                        </tr>

                                    </table>
                                </div>
                                </form:form>
                            </div>
                            <!-- ########### forth box  ends #########  -->
                    </div>
                    <div id="myModal" class="modal">
                        <!-- Modal content -->
                        <div class="modal-content">
                            <div class="modal-header">
                                <span class="close">&times;</span>
                                <br>
                                <h2 style="text-align:center;">View Hotel Details</h2>
                            </div>
                            <div class="modal-body">


                            </div>
                            <div class="modal-footer">
                                <h3 align="center">Powered by @TravelIntelliJ</h3>
                            </div>
                        </div>
                    </div>
                    <script>
                        // Get the modal
                        var modal = document.getElementById("myModal");
                        // Get the button that opens the modal
                        var btn = document.getElementById("myBtn");
                        // Get the <span> element that closes the modal
                        var span = document.getElementsByClassName("close")[0];
                        function myStopsDisplay(clicked) {
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

                        $(document).ready(function () {
                            check();
                        });
                        function check() {
                            if ($("input[name='flightCancellationPolicyDisplay']:checked").val() == "true") {
                                $("#displayFlightCancellationHeader").show();
                                $("#displayFlightCancellationTextArea").show();
                            }
                            if ($("input[name='flightCancellationPolicyDisplay']:checked").val() == "false") {
                                $("#displayFlightCancellationHeader").hide();
                                $("#displayFlightCancellationTextArea").hide();
                            }

                            if ($("input[name='hotelCancellationPolicyDisplay']:checked").val() == "true") {
                                $("#displayHotelCancellationHeader").show();
                                $("#displayHotelCancellationTextArea").show();
                            }
                            if ($("input[name='hotelCancellationPolicyDisplay']:checked").val() == "false") {
                                $("#displayHotelCancellationHeader").hide();
                                $("#displayHotelCancellationTextArea").hide();
                            }

                            if ($("input[name='transfersCancellationPolicyDisplay']:checked").val() == "true") {
                                $("#displayTransfersCancellationHeader").show();
                                $("#displayTransfersCancellationTextArea").show();
                            }
                            if ($("input[name='transfersCancellationPolicyDisplay']:checked").val() == "false") {
                                $("#displayTransfersCancellationHeader").hide();
                                $("#displayTransfersCancellationTextArea").hide();
                            }

                            if ($("input[name='sightSeeingCancellationPolicyDisplay']:checked").val() == "true") {
                                $("#displaySigtSeeingCancellationHeader").show();
                                $("#displaySightSeeingCancellationTextArea").show();
                            }
                            if ($("input[name='sightSeeingCancellationPolicyDisplay']:checked").val() == "false") {
                                $("#displaySigtSeeingCancellationHeader").hide();
                                $("#displaySightSeeingCancellationTextArea").hide();
                            }


                            if ($("input[name='visaAdditionalDetailsDisplay']:checked").val() == "true") {
                                $("#displayVisaAdditionalHeader").show();
                                $("#displayVisaAdditionalTextArea").show();
                            }
                            if ($("input[name='visaAdditionalDetailsDisplay']:checked").val() == "false") {
                                $("#displayVisaAdditionalHeader").hide();
                                $("#displayVisaAdditionalTextArea").hide();
                            }

                            if ($("input[name='visaCancellationPolicyDisplay']:checked").val() == "true") {
                                $("#displayVisaCancellationHeader").show();
                                $("#displayVisaCancellationTextArea").show();
                            }
                            if ($("input[name='visaCancellationPolicyDisplay']:checked").val() == "false") {
                                $("#displayVisaCancellationHeader").hide();
                                $("#displayVisaCancellationTextArea").hide();
                            }

                            if ($("input[name='insuranceCancellationPolicyDisplay']:checked").val() == "true") {
                                $("#displayInsuranceCancellationHeader").show();
                                $("#displayInsuranceCancellationTextArea").show();
                            }
                            if ($("input[name='insuranceCancellationPolicyDisplay']:checked").val() == "false") {
                                $("#displayInsuranceCancellationHeader").hide();
                                $("#displayInsuranceCancellationTextArea").hide();
                            }


                            if ($("input[name='cruiseCancellationPolicyDisplay']:checked").val() == "true") {
                                $("#displayCruiseCancellationHeader").show();
                                $("#displayCruiseCancellationTextArea").show();
                            }
                            if ($("input[name='cruiseCancellationPolicyDisplay']:checked").val() == "false") {
                                $("#displayCruiseCancellationHeader").hide();
                                $("#displayCruiseCancellationTextArea").hide();
                            }


                            if ($("input[name='packageCancellationPolicyDisplay']:checked").val() == "true") {
                                $("#displayTourPackageCancellationHeader").show();
                                $("#displayTourPackageCancellationTextArea").show();
                            }
                            if ($("input[name='packageCancellationPolicyDisplay']:checked").val() == "false") {
                                $("#displayTourPackageCancellationHeader").hide();
                                $("#displayTourPackageCancellationTextArea").hide();
                            }


                            if ($("input[name='otherCancellationPolicyDisplay']:checked").val() == "true") {
                                $("#displayOtherCancellationHeader").show();
                                $("#displayOtherCancellationTextArea").show();
                            }
                            if ($("input[name='otherCancellationPolicyDisplay']:checked").val() == "false") {
                                $("#displayOtherCancellationHeader").hide();
                                $("#displayOtherCancellationTextArea").hide();
                            }

                        }
                    </script>
                </body>

</html>