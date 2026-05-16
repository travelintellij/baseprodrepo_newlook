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
                    <title>form_view_aCMQuotation</title>
                    <link rel="stylesheet" href="style.css">
                    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
                    <link href="<c:url value="/resources/core/main.css" />" rel="stylesheet">
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


 <div class="m-d bs ">
                                    <div class="form_view_aCMQuotation_fbwls">
                                        <label for="" class="lb">Quotation Id</label>
                                        <p>${QTN_OBJ.quotationId}</p>
                                    </div>
                                    <div class="form_view_aCMQuotation_fbwls">
                                        <label for="" class="lb">Version Id</label>
                                        <p>${QTN_OBJ.version}</p>
                                    </div>
</div>

<form:form modelAttribute="MANUAL_CNF" action="create_update_generate_manual_configuration_quotation">

                            <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
                            <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
                            <input type="hidden" name="manualConfigurationQuotationId"
                                value="${MANUAL_CNF.manualConfigurationQuotationId}" />
                            <form:hidden path="totalQuotationAmount" />
                            <form:hidden path="remarks" />
              


<div style="position:absolute;background:black;color:white;width:300px;left:0;padding:10px 5px;border-radius:5px">

                            <!-- ###############  buttons box starts ###########  -->
                            <div  style="border:2px solid black">
                                <div class="form_view_aCMQuotation_btns_wrapper ">
                                    <c:if test="${QUOTATION_EXISTS eq true}">
                                        <a class="a"  id="myBtn[${filteredLeads.leadId}]"
                                            href="form_view_quotation_modal?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}&manualConfigurationQuotationId=${MANUAL_CNF.manualConfigurationQuotationId}"
                                            target="_new"><input type="button" value="Old View / Print Quotation" /></a>
                                        <input class="a" type="submit" name="Generate Quotation" id="Generate Quotation"
                                            Value="Generate Quotation" style="border-bottom:2px solid gray;width:100%;text-align:start"/>
                                        <a class="a"  href="viewQuotation?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId }&version=${QTN_OBJ.version}"
                                            target="_new"><input type="button" value="View"/></a>
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

				

				

                            <!-- ############### last box starts ###########  -->
                            <div class="form_view_aCMQuotation_btns">
                            
                                <div class="form_view_aCMQuotation_lb_wr bs">
                                 <p style="background:black;text-align:center;width:500px;margin:0 auto;border-radius:5px">
                             <font color="#32cd32"> ${Success} </font>
                                <font color="red"> ${Error}</font></p>
                                <h1 class="hd">Configure Quotation Parameters</h1>
                                    <div class="form_view_aCMQuotation_lb_wr_f " style="margin:10px auto">
                                        <div class="form_view_aCMQuotation_lb_wr_f_sb">
                                            <label for="" class="lb">Quotation Partner Header</label>
                                            <form:select path="partnerId" required="required">
                                                <option class="service-small" value="" selected>Please Select</option>
                                                <form:options items="${B2B_PARTNERS_MAP}" class="service-small" />
                                            </form:select>
                                        </div>
                                        <div class="form_view_aCMQuotation_lb_wr_f_sb">
                                            <label for="" class="lb">Link Itinerary</label>
                                            <select name="itineraryId" class="service-small">
                                                <option value="" ${QTN_OBJ.itineraryId == null ? 'selected' : ''}>-- Select Itinerary --</option>
                                                <c:forEach items="${ITINERARIES}" var="itinerary">
                                                    <option value="${itinerary.itineraryId}" ${QTN_OBJ.itineraryId == itinerary.itineraryId ? 'selected' : ''}>${itinerary.title}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="form_view_aCMQuotation_lb_wr_f_sb">
                                            <label for="" class="lb">Logo Header</label> <br>
                                            <form:radiobutton path="logoHeader" id="logoHeaderTrue" name="logoHeader"
                                                value="true" /> <label for="logoHeaderTrue" class="radio">Yes</label>
                                            <form:radiobutton path="logoHeader" id="logoHeaderFalse" name="logoHeader"
                                                value="false" /> <label for="logoHeaderFalse" class="radio">No</label>
                                        </div>
                                        <div class="form_view_aCMQuotation_lb_wr_f_sb">
                                            <label for="" class="lb">Complete Address</label>  <br>
                                            <form:radiobutton path="completeAddress" id="completeAddressTrue"
                                                name="completeAddress" value="true" /> <label for="completeAddressTrue"
                                                class="radio">Yes</label>
                                            <form:radiobutton path="completeAddress" id="completeAddressFalse"
                                                name="completeAddress" value="false" /> <label
                                                for="completeAddressFalse" class="radio">No</label>
                                        </div>
                                    </div>

                                    <div class="form_view_aCMQuotation_lb_wr_tb">
                                        <c:if test="${QTN_OBJ.flight eq true}">
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb">
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_header">
                                                    <h1 style="text-align: center;font-size: 25px;color:#32cd32">Flight
                                                    </h1>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Show Flight Stop Details</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="flightShowConnections"
                                                                id="showconnectiontrue" name="flightShowConnections"
                                                                value="true" />
                                                            <label for="showconnectiontrue" class="radio">Yes</label>
                                                            <form:radiobutton path="flightShowConnections"
                                                                id="showconnectionfalse" name="flightShowConnections"
                                                                value="false" />
                                                            <label for="showconnectionfalse" class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Display Separate Cost</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="flightSeperateCostDisplay"
                                                                id="showseperatecosttrue"
                                                                name="flightSeperateCostDisplay" value="true" /> <label
                                                                for="showseperatecosttrue" class="radio">Yes</label>
                                                            <form:radiobutton path="flightSeperateCostDisplay"
                                                                id="showseperatecostfalse"
                                                                name="flightSeperateCostDisplay" value="false" /> <label
                                                                for="showseperatecostfalse" class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Show GTS Breakup</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="flightGstBreakup"
                                                                id="flightGstBreakupTrue" name="flightGstBreakup"
                                                                value="true" /> <label for="flightGstBreakupTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="flightGstBreakup"
                                                                id="flightGstBreakupFalse" name="flightGstBreakup"
                                                                value="false" /> <label for="flightGstBreakupFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Display Remark / Cancellation Policy</p>
                                                        <div class="qu_ans">
                                                            <form:radiobutton path="flightCancellationPolicyDisplay"
                                                                id="flightCancellationPolicyDisplayTrue"
                                                                name="flightCancellationPolicyDisplay" value="true"
                                                                onclick="check();" /> <label
                                                                for="flightCancellationPolicyDisplayTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="flightCancellationPolicyDisplay"
                                                                id="flightCancellationPolicyDisplayFalse"
                                                                name="flightCancellationPolicyDisplay" value="false"
                                                                onclick="check();" /> <label
                                                                for="flightCancellationPolicyDisplayFalse"
                                                                class="radio">No</label> 
                                                        </div>
                                                        	
                                                    </div>
                                                </div>
                                            </div>
							             <table style="width:100%" class="a">
								             <tr id="displayFlightCancellationHeader">
												<th style="background-color:lightblue;color:black;" colspan="6"> Flight Remarks / Cancellation Policy </th>
											</tr>
											<tr id="displayFlightCancellationTextArea">
											
												<td colspan="6">
													<form:textarea path="flightCancellationPolicy" rows="10" cols="84" />
												</td>
											</tr>
										</table>
                                        </c:if>
                                        <c:if test="${QTN_OBJ.hotel eq true}">
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb ">
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_header">
                                                    <h1 style="text-align: center;font-size: 25px;color:#32cd32">Hotel
                                                    </h1>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Display Hotel Separate Cost</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="hotelSeperateCostDisplay"
                                                                id="hotelSeperateCostDisplayTrue"
                                                                name="hotelSeperateCostDisplay" value="true" /> <label
                                                                for="hotelSeperateCostDisplayTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="hotelSeperateCostDisplay"
                                                                id="hotelSeperateCostDisplayFalse"
                                                                name="hotelSeperateCostDisplay" value="false" /> <label
                                                                for="hotelSeperateCostDisplayFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Show Hotel GST Breakup</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="hotelGstBreakup"
                                                                id="hotelGstBreakupTrue" name="hotelGstBreakup"
                                                                value="true" /> <label for="hotelGstBreakupTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="hotelGstBreakup"
                                                                id="hotelGstBreakupFalse" name="hotelGstBreakup"
                                                                value="false" /> <label for="hotelGstBreakupFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Display Hotel Remarks / Cancellation Policy</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="hotelCancellationPolicyDisplay"
                                                                id="hotelCancellationPolicyDisplayTrue"
                                                                name="hotelCancellationPolicyDisplay" value="true"
                                                                onclick="check();" /> <label
                                                                for="hotelCancellationPolicyDisplayTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="hotelCancellationPolicyDisplay"
                                                                id="hotelCancellationPolicyDisplayFalse"
                                                                name="hotelCancellationPolicyDisplay" value="false"
                                                                onclick="check();" /> <label
                                                                for="hotelCancellationPolicyDisplayFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                             <table style="width:100%" class="a">
                                            
                                            <tr id="displayHotelCancellationHeader">
				<th style="background-color:lightblue;color:black;" colspan="6"> Hotel Remarks / Cancellation Policy </th>
			</tr>
			<tr id="displayHotelCancellationTextArea">
				<td colspan="6">
					<form:textarea path="hotelCancellationPolicy" rows="10" cols="83" />
				</td>
			</tr>
                                            </table>
                                            
                                        </c:if>
                                        <c:if test="${QTN_OBJ.transfers eq true}">
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb ">
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_header">
                                                    <h1 style="text-align: center;font-size: 25px;color:#32cd32">
                                                        Transfers</h1>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Display Transfers Separate Cost</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="transfersSeperateCostDisplay"
                                                                id="transfersSeperateCostDisplayTrue"
                                                                name="transfersSeperateCostDisplay" value="true" />
                                                            <label for="transfersSeperateCostDisplayTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="transfersSeperateCostDisplay"
                                                                id="transfersSeperateCostDisplayFalse"
                                                                name="transfersSeperateCostDisplay" value="false" />
                                                            <label for="transfersSeperateCostDisplayFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Show Transfers GST Breakup</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="transfersGstBreakup"
                                                                id="transfersGstBreakupTrue" name="transfersGstBreakup"
                                                                value="true" />
                                                            <label for="transfersGstBreakupTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="transfersGstBreakup"
                                                                id="transfersGstBreakupFalse" name="transfersGstBreakup"
                                                                value="false" />
                                                            <label for="transfersGstBreakupFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Display Transfers Remarks / Cancellation Policy
                                                        </p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="transfersCancellationPolicyDisplay"
                                                                id="transfersCancellationPolicyDisplayTrue"
                                                                name="transfersCancellationPolicyDisplay" value="true"
                                                                onclick="check();" /> <label
                                                                for="transfersCancellationPolicyDisplayTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="transfersCancellationPolicyDisplay"
                                                                id="transfersCancellationPolicyDisplayFalse"
                                                                name="transfersCancellationPolicyDisplay" value="false"
                                                                onclick="check();" /> <label
                                                                for="transfersCancellationPolicyDisplayFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                             <table style="width:100%" class="a">
                                             <tr id="displayTransfersCancellationHeader">
				<th style="background-color:lightblue;color:black;" colspan="6"> Transfers Remarks / Cancellation Policy </th>
			</tr>
			<tr id="displayTransfersCancellationTextArea">
				<td colspan="6">
					<form:textarea path="transfersCancellationPolicy" rows="10" cols="84" />
				</td>
			</tr>	
                                             <table>
                                        </c:if>
                                        <c:if test="${QTN_OBJ.sightseeing eq true}">
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb ">
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_header">
                                                    <h1 style="text-align: center;font-size: 25px;color:#32cd32">Sight
                                                        seeing</h1>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Display Sight seeing Separate Cost</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="sightSeeingSeperateCostDisplay"
                                                                id="sightSeeingSeperateCostDisplayTrue"
                                                                name="sightSeeingSeperateCostDisplay" value="true" />
                                                            <label for="sightSeeingSeperateCostDisplayTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="sightSeeingSeperateCostDisplay"
                                                                id="sightSeeingSeperateCostDisplayFalse"
                                                                name="sightSeeingSeperateCostDisplay" value="false" />
                                                            <label for="sightSeeingSeperateCostDisplayFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Show Sight seeing GST Breakup</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="sightSeeingGstBreakup"
                                                                id="sightSeeingGstBreakupTrue"
                                                                name="sightSeeingGstBreakup" value="true" /> <label
                                                                for="sightSeeingGstBreakupTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="sightSeeingGstBreakup"
                                                                id="sightSeeingGstBreakupFalse"
                                                                name="sightSeeingGstBreakup" value="false" /> <label
                                                                for="sightSeeingGstBreakupFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Attach Sight seeing Detailed Information at
                                                            Last</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="sightSeeingsIncludeMasterAppendix"
                                                                id="sightSeeingsIncludeMasterAppendixTrue"
                                                                name="sightSeeingsIncludeMasterAppendix" value="true"
                                                                onclick="check();" /> <label
                                                                for="sightSeeingsIncludeMasterAppendixTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="sightSeeingsIncludeMasterAppendix"
                                                                id="sightSeeingsIncludeMasterAppendixFalse"
                                                                name="sightSeeingsIncludeMasterAppendix" value="false"
                                                                onclick="check();" /> <label
                                                                for="sightSeeingsIncludeMasterAppendixFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                       
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Display Sight seeing Remarks / Cancellation
                                                            Policy</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton
                                                                path="sightSeeingCancellationPolicyDisplay"
                                                                id="sightSeeingCancellationPolicyDisplayTrue"
                                                                name="sightSeeingCancellationPolicyDisplay" value="true"
                                                                onclick="check();" /> <label
                                                                for="sightSeeingCancellationPolicyDisplayTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton
                                                                path="sightSeeingCancellationPolicyDisplay"
                                                                id="sightSeeingCancellationPolicyDisplayFalse"
                                                                name="sightSeeingCancellationPolicyDisplay"
                                                                value="false" onclick="check();" /> <label
                                                                for="sightSeeingCancellationPolicyDisplayFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                               <table style="width:100%" class="a">
                                               	<tr id="displaySigtSeeingCancellationHeader">
				<th style="background-color:lightblue;color:black;" colspan="6"> Sight Seeing Remarks / Cancellation Policy </th>
			</tr>
			<tr id="displaySightSeeingCancellationTextArea">
				<td colspan="6">
					<form:textarea path="sightSeeingCancellationPolicy" rows="10" cols="84" />
				</td>
			</tr>
                                               </table>
                                        </c:if>
                                        <c:if test="${QTN_OBJ.visa eq true}">
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb">
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_header">
                                                    <h1 style="text-align: center;font-size: 25px;color:#32cd32">Visa
                                                    </h1>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Display Visa Separate Cost</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="visaSeperateCostDisplay"
                                                                id="visaSeperateCostDisplayTrue"
                                                                name="visaSeperateCostDisplay" value="true" /> <label
                                                                for="visaSeperateCostDisplayTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="visaSeperateCostDisplay"
                                                                id="visaSeperateCostDisplayFalse"
                                                                name="visaSeperateCostDisplay" value="false" /> <label
                                                                for="visaSeperateCostDisplayFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Show Visa GST Breakup</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="visaGstBreakup"
                                                                id="visaGstBreakupTrue" name="visaGstBreakup"
                                                                value="true" /> <label for="visaGstBreakupTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="visaGstBreakup"
                                                                id="visaGstBreakupFalse" name="visaGstBreakup"
                                                                value="false" /> <label for="visaGstBreakupFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Display Visa Additional Details</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="visaAdditionalDetailsDisplay"
                                                                id="visaAdditionalDetailsDisplayTrue"
                                                                name="visaAdditionalDetailsDisplay" value="true"
                                                                onclick="check();" /> <label
                                                                for="visaAdditionalDetailsDisplayTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="visaAdditionalDetailsDisplay"
                                                                id="visaAdditionalDetailsDisplayFalse"
                                                                name="visaAdditionalDetailsDisplay" value="false"
                                                                onclick="check();" /> <label
                                                                for="visaAdditionalDetailsDisplayFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Display Visa Cancellation Policy</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="visaCancellationPolicyDisplay"
                                                                id="visaCancellationPolicyDisplayTrue"
                                                                name="visaCancellationPolicyDisplay" value="true"
                                                                onclick="check();" /> <label
                                                                for="visaCancellationPolicyDisplayTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="visaCancellationPolicyDisplay"
                                                                id="visaCancellationPolicyDisplayFalse"
                                                                name="visaCancellationPolicyDisplay" value="false"
                                                                onclick="check();" /> <label
                                                                for="visaCancellationPolicyDisplayFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                               <table style="width:100%" class="a">
                                               	<tr id="displayVisaCancellationHeader">
				<th style="background-color:lightblue;color:black;" colspan="6"> Visa Remarks / Cancellation Policy </th>
			</tr>
			<tr id="displayVisaCancellationTextArea">
				<td colspan="6">
					<form:textarea path="visaCancellationPolicy" rows="10" cols="84" />
				</td>
			</tr>
                                               </table>
                                        </c:if>
                                        <c:if test="${QTN_OBJ.insurance eq true}">
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb ">
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_header">
                                                    <h1 style="text-align: center;font-size: 25px;color:#32cd32">
                                                        Insurance</h1>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Display Insurance Separate Cost</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="insuranceSeperateCostDisplay"
                                                                id="insuranceSeperateCostDisplayTrue"
                                                                name="insuranceSeperateCostDisplay" value="true" />
                                                            <label for="insuranceSeperateCostDisplayTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="insuranceSeperateCostDisplay"
                                                                id="insuranceSeperateCostDisplayFalse"
                                                                name="insuranceSeperateCostDisplay" value="false" />
                                                            <label for="insuranceSeperateCostDisplayFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Show Insurance GST Breakup</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="insuranceGstBreakup"
                                                                id="insuranceGstBreakupTrue" name="insuranceGstBreakup"
                                                                value="true" />
                                                            <label for="insuranceGstBreakupTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="insuranceGstBreakup"
                                                                id="insuranceGstBreakupFalse" name="insuranceGstBreakup"
                                                                value="false" />
                                                            <label for="insuranceGstBreakupFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Display Insurance Remarks / Cancellation Policy
                                                        </p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="insuranceCancellationPolicyDisplay"
                                                                id="insuranceCancellationPolicyDisplayTrue"
                                                                name="insuranceCancellationPolicyDisplay" value="true"
                                                                onclick="check();" /> <label
                                                                for="insuranceCancellationPolicyDisplayTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="insuranceCancellationPolicyDisplay"
                                                                id="insuranceCancellationPolicyDisplayFalse"
                                                                name="insuranceCancellationPolicyDisplay" value="false"
                                                                onclick="check();" /> <label
                                                                for="insuranceCancellationPolicyDisplayFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                              <table style="width:100%" class="a">
                                              <tr id="displayInsuranceCancellationHeader">
				<th style="background-color:lightblue;color:black;" colspan="6"> Insurance Remarks / Cancellation Policy </th>
			</tr>
			<tr id="displayInsuranceCancellationTextArea">
				<td colspan="6">
					<form:textarea path="insuranceCancellationPolicy" rows="10" cols="84" />
				</td>
			</tr>
                                              <table>
                                        </c:if>
                                        <c:if test="${QTN_OBJ.cruise eq true}">
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb">
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_header">
                                                    <h1 style="text-align: center;font-size: 25px;color:#32cd32">Cruise
                                                    </h1>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Display Cruise Separate Cost</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="cruiseSeperateCostDisplay"
                                                                id="cruiseSeperateCostDisplayTrue"
                                                                name="cruiseSeperateCostDisplay" value="true" /> <label
                                                                for="cruiseSeperateCostDisplayTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="cruiseSeperateCostDisplay"
                                                                id="cruiseSeperateCostDisplayFalse"
                                                                name="cruiseSeperateCostDisplay" value="false" /> <label
                                                                for="cruiseSeperateCostDisplayFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Show Cruise GST Breakup</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="cruiseGstBreakup"
                                                                id="cruiseGstBreakupTrue" name="cruiseGstBreakup"
                                                                value="true" /> <label for="cruiseGstBreakupTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="cruiseGstBreakup"
                                                                id="cruiseGstBreakupFalse" name="cruiseGstBreakup"
                                                                value="false" /> <label for="cruiseGstBreakupFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Display Cruise Remarks / Cancellation Policy
                                                        </p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="cruiseCancellationPolicyDisplay"
                                                                id="cruiseCancellationPolicyDisplayTrue"
                                                                name="cruiseCancellationPolicyDisplay" value="true"
                                                                onclick="check();" /> <label
                                                                for="cruiseCancellationPolicyDisplayTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="cruiseCancellationPolicyDisplay"
                                                                id="cruiseCancellationPolicyDisplayFalse"
                                                                name="cruiseCancellationPolicyDisplay" value="false"
                                                                onclick="check();" /> <label
                                                                for="cruiseCancellationPolicyDisplayFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                             <table style="width:100%" class="a">
                                             	<tr id="displayCruiseCancellationHeader">
			      	<th style="background-color:lightblue;color:black;" colspan="6"> Cruise Remarks / Cancellation Policy </th>
			</tr>
			<tr id="displayCruiseCancellationTextArea">
				<td colspan="6">
					<form:textarea path="cruiseCancellationPolicy" rows="10" cols="84" />
				</td>
			</tr>
                                             </table>
                                        </c:if>
                                        <c:if test="${QTN_OBJ.tourPackage eq true}">
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb ">
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_header">
                                                    <h1 style="text-align: center;font-size: 25px;color:#32cd32">Tour
                                                        Package</h1>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Display Tour Package Separate Cost</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="packageSeperateCostDisplay"
                                                                id="packageSeperateCostDisplayTrue"
                                                                name="packageSeperateCostDisplay" value="true" /> <label
                                                                for="packageSeperateCostDisplayTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="packageSeperateCostDisplay"
                                                                id="packageSeperateCostDisplayFalse"
                                                                name="packageSeperateCostDisplay" value="false" />
                                                            <label for="packageSeperateCostDisplayFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Show Tour Package GST Breakup</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="packageGstBreakup"
                                                                id="packageGstBreakupTrue" name="packageGstBreakup"
                                                                value="true" /> <label for="packageGstBreakupTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="packageGstBreakup"
                                                                id="packageGstBreakupFalse" name="packageGstBreakup"
                                                                value="false" /> <label for="packageGstBreakupFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Display Tour Package Remarks / Cancellation
                                                            Policy</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="packageCancellationPolicyDisplay"
                                                                id="packageCancellationPolicyDisplayTrue"
                                                                name="packageCancellationPolicyDisplay" value="true"
                                                                onclick="check();" /> <label
                                                                for="packageCancellationPolicyDisplayTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="packageCancellationPolicyDisplay"
                                                                id="packageCancellationPolicyDisplayFalse"
                                                                name="packageCancellationPolicyDisplay" value="false"
                                                                onclick="check();" /> <label
                                                                for="packageCancellationPolicyDisplayFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                              <table style="width:100%" class="a">
                                              	<tr id="displayTourPackageCancellationHeader">
				<th style="background-color:lightblue;color:black;" colspan="6"> Tour Package Remarks / Cancellation Policy </th>
			</tr>
			<tr id="displayTourPackageCancellationTextArea">
				<td colspan="6">
					<form:textarea path="packageCancellationPolicy" rows="10" cols="84" />
				</td>
			</tr>
                                              </table>
                                        </c:if>
                                        <c:if test="${QTN_OBJ.others eq true}">
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb">
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_header">
                                                    <h1 style="text-align: center;font-size: 25px;color:#32cd32">Others
                                                        Services</h1>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Display Others Services Package Separate Cost
                                                        </p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="otherSeperateCostDisplay"
                                                                id="otherSeperateCostDisplayTrue"
                                                                name="otherSeperateCostDisplay" value="true" /> <label
                                                                for="otherSeperateCostDisplayTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="otherSeperateCostDisplay"
                                                                id="otherSeperateCostDisplayFalse"
                                                                name="otherSeperateCostDisplay" value="false" /> <label
                                                                for="otherSeperateCostDisplayFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Show Others Services GST Breakup</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="otherGstBreakup"
                                                                id="otherGstBreakupTrue" name="otherGstBreakup"
                                                                value="true" /> <label for="otherGstBreakupTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="otherGstBreakup"
                                                                id="otherGstBreakupFalse" name="otherGstBreakup"
                                                                value="false" /> <label for="otherGstBreakupFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                    <div class="fvacmq">
                                                        <p class="qu_in">Display Others Services Remarks / Cancellation
                                                            Policy</p>
                                                        <p class="qu_ans">
                                                            <form:radiobutton path="otherCancellationPolicyDisplay"
                                                                id="otherCancellationPolicyDisplayTrue"
                                                                name="otherCancellationPolicyDisplay" value="true"
                                                                onclick="check();" /> <label
                                                                for="otherCancellationPolicyDisplayTrue"
                                                                class="radio">Yes</label>
                                                            <form:radiobutton path="otherCancellationPolicyDisplay"
                                                                id="otherCancellationPolicyDisplayFalse"
                                                                name="otherCancellationPolicyDisplay" value="false"
                                                                onclick="check();" /> <label
                                                                for="otherCancellationPolicyDisplayFalse"
                                                                class="radio">No</label>
                                                        </p>
                                                    </div>
                                                </div>
                                            </div>
                                            <table style="width:100%" class="a">
                                            	<tr id="displayOtherCancellationHeader">
				<th style="background-color:lightblue;color:black;" colspan="6"> Other Services Remarks / Cancellation Policy </th>
			</tr>
			<tr id="displayOtherCancellationTextArea">
				<td colspan="6">
					<form:textarea path="otherCancellationPolicy" rows="10" cols="84" />
				</td>
			</tr>
                                            </table>
                                        </c:if>
                                        <div class="form_view_aCMQuotation_lb_wr_tb_sb a">
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb_header">
                                                <h1 style="text-align: center;font-size: 25px;color:#32cd32">
                                                    Miscellaneous</h1>
                                            </div>
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                <div class="fvacmq">
                                                    <p class="qu_in">Other left over Amount Display</p>
                                                    <p class="qu_ans">
                                                        <form:radiobutton path="leftOverAmtDisplay"
                                                            id="leftOverAmtDisplayTrue" name="leftOverAmtDisplay"
                                                            value="true" onclick="check();" /> <label
                                                            for="leftOverAmtDisplayTrue" class="radio">Yes</label>
                                                        <form:radiobutton path="leftOverAmtDisplay"
                                                            id="leftOverAmtDisplayFalse" name="leftOverAmtDisplay"
                                                            value="false" onclick="check();" /> <label
                                                            for="leftOverAmtDisplayFalse" class="radio">No</label>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                <div class="fvacmq">
                                                    <p class="qu_in">Show Bank Accounts</p>
                                                    <p class="qu_ans">
                                                        <form:radiobutton path="showBankAccounts"
                                                            id="showBankAccountsTrue" name="showBankAccounts"
                                                            value="true" onclick="check();" /> <label
                                                            for="showBankAccountsTrue" class="radio">Yes</label>
                                                        <form:radiobutton path="showBankAccounts"
                                                            id="showBankAccountsFalse" name="showBankAccounts"
                                                            value="false" onclick="check();" /> <label
                                                            for="showBankAccountsFalse" class="radio">No</label>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form_view_aCMQuotation_lb_wr_tb_sb a">
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb_header">
                                                <h1 style="text-align: center;font-size: 25px;color:#32cd32">Other
                                                    Quotation Configration</h1>
                                            </div>
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                <div class="fvacmq">
                                                    <p class="qu_in">Flight New Page</p>
                                                    <p class="qu_ans">
                                                        <form:radiobutton path="flightStarNewPage"
                                                            id="flightStarNewPageTrue" name="flightStarNewPage"
                                                            value="true" onclick="check();" /> <label
                                                            for="flightStarNewPageTrue" class="radio">Yes</label>
                                                        <form:radiobutton path="flightStarNewPage"
                                                            id="flightStarNewPageFalse" name="flightStarNewPage"
                                                            value="false" onclick="check();" /> <label
                                                            for="flightStarNewPageFalse" class="radio">No</label>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                <div class="fvacmq">
                                                    <p class="qu_in">Hotel new page</p>
                                                    <p class="qu_ans">
                                                        <form:radiobutton path="hotelStartNewPage"
                                                            id="hotelStartNewPageTrue" name="hotelStartNewPage"
                                                            value="true" onclick="check();" /> <label
                                                            for="hotelStartNewPageTrue" class="radio">Yes</label>
                                                        <form:radiobutton path="hotelStartNewPage"
                                                            id="hotelStartNewPageFalse" name="hotelStartNewPage"
                                                            value="false" onclick="check();" /> <label
                                                            for="hotelStartNewPageFalse" class="radio">No</label>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                <div class="fvacmq">
                                                    <p class="qu_in">Cruise new page</p>
                                                    <p class="qu_ans">
                                                        <form:radiobutton path="cruiseStartNewPage"
                                                            id="cruiseStartNewPageTrue" name="cruiseStartNewPage"
                                                            value="true" onclick="check();" /> <label
                                                            for="cruiseStartNewPageTrue" class="radio">Yes</label>
                                                        <form:radiobutton path="cruiseStartNewPage"
                                                            id="cruiseStartNewPageFalse" name="cruiseStartNewPage"
                                                            value="false" onclick="check();" /> <label
                                                            for="cruiseStartNewPageFalse" class="radio">No</label>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                <div class="fvacmq">
                                                    <p class="qu_in">Package new page</p>
                                                    <p class="qu_ans">
                                                        <form:radiobutton path="packagesStartNewPage"
                                                            id="packagesStartNewPageTrue" name="packagesStartNewPage"
                                                            value="true" onclick="check();" /> <label
                                                            for="packagesStartNewPageTrue" class="radio">Yes</label>
                                                        <form:radiobutton path="packagesStartNewPage"
                                                            id="packagesStartNewPageFalse" name="packagesStartNewPage"
                                                            value="false" onclick="check();" /> <label
                                                            for="packagesStartNewPageFalse" class="radio">No</label>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                <div class="fvacmq">
                                                    <p class="qu_in">Sight seeing new page</p>
                                                    <p class="qu_ans">
                                                        <form:radiobutton path="sightSeeingStartNewPage"
                                                            id="sightSeeingStartNewPageTrue"
                                                            name="sightSeeingStartNewPage" value="true"
                                                            onclick="check();" /> <label
                                                            for="sightSeeingStartNewPageTrue" class="radio">Yes</label>
                                                        <form:radiobutton path="sightSeeingStartNewPage"
                                                            id="sightSeeingStartNewPageFalse"
                                                            name="sightSeeingStartNewPage" value="false"
                                                            onclick="check();" /> <label
                                                            for="sightSeeingStartNewPageFalse" class="radio">No</label>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                <div class="fvacmq">
                                                    <p class="qu_in">Transfers new page</p>
                                                    <p class="qu_ans">
                                                        <form:radiobutton path="transfersStartNewPage"
                                                            id="transfersStartNewPageTrue" name="transfersStartNewPage"
                                                            value="true" onclick="check();" /> <label
                                                            for="transfersStartNewPageTrue" class="radio">Yes</label>
                                                        <form:radiobutton path="transfersStartNewPage"
                                                            id="transfersStartNewPageFalse" name="transfersStartNewPage"
                                                            value="false" onclick="check();" /> <label
                                                            for="transfersStartNewPageFalse" class="radio">No</label>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                <div class="fvacmq">
                                                    <p class="qu_in">Visa new page</p>
                                                    <p class="qu_ans">
                                                        <form:radiobutton path="visaStartNewPage"
                                                            id="visaStartNewPageTrue" name="visaStartNewPage"
                                                            value="true" onclick="check();" /> <label
                                                            for="visaStartNewPageTrue" class="radio">Yes</label>
                                                        <form:radiobutton path="visaStartNewPage"
                                                            id="visaStartNewPageFalse" name="visaStartNewPage"
                                                            value="false" onclick="check();" /> <label
                                                            for="visaStartNewPageFalse" class="radio">No</label>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                <div class="fvacmq">
                                                    <p class="qu_in">Insurance new page</p>
                                                    <p class="qu_ans">
                                                        <form:radiobutton path="insuranceStartNewPage"
                                                            id="insuranceStartNewPageTrue" name="insuranceStartNewPage"
                                                            value="true" onclick="check();" /> <label
                                                            for="insuranceStartNewPageTrue" class="radio">Yes</label>
                                                        <form:radiobutton path="insuranceStartNewPage"
                                                            id="insuranceStartNewPageFalse" name="insuranceStartNewPage"
                                                            value="false" onclick="check();" /> <label
                                                            for="insuranceStartNewPageFalse" class="radio">No</label>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                <div class="fvacmq">
                                                    <p class="qu_in">Others new page</p>
                                                    <p class="qu_ans">
                                                        <form:radiobutton path="othersStartNewPage"
                                                            id="othersStartNewPageTrue" name="othersStartNewPage"
                                                            value="true" onclick="check();" /> <label
                                                            for="othersStartNewPageTrue" class="radio">Yes</label>
                                                        <form:radiobutton path="othersStartNewPage"
                                                            id="othersStartNewPageFalse" name="othersStartNewPage"
                                                            value="false" onclick="check();" /> <label
                                                            for="othersStartNewPageFalse" class="radio">No</label>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                <div class="fvacmq">
                                                    <p class="qu_in">Costing new page</p>
                                                    <p class="qu_ans">
                                                        <form:radiobutton path="costingStartNewPage"
                                                            id="costingStartNewPageTrue" name="costingStartNewPage"
                                                            value="true" onclick="check();" /> <label
                                                            for="costingStartNewPageTrue" class="radio">Yes</label>
                                                        <form:radiobutton path="costingStartNewPage"
                                                            id="costingStartNewPageFalse" name="costingStartNewPage"
                                                            value="false" onclick="check();" /> <label
                                                            for="costingStartNewPageFalse" class="radio">No</label>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                <div class="fvacmq">
                                                    <p class="qu_in">T &C new page</p>
                                                    <p class="qu_ans">
                                                        <form:radiobutton path="tncStartNewPage"
                                                            id="tncStartNewPageTrue" name="tncStartNewPage" value="true"
                                                            onclick="check();" /> <label for="tncStartNewPageTrue"
                                                            class="radio">Yes</label>
                                                        <form:radiobutton path="tncStartNewPage"
                                                            id="tncStartNewPageFalse" name="tncStartNewPage"
                                                            value="false" onclick="check();" /> <label
                                                            for="tncStartNewPageFalse" class="radio">No</label>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="form_view_aCMQuotation_lb_wr_tb_sb_body">
                                                <div class="fvacmq">
                                                    <p class="qu_in">Itinerary new page</p>
                                                    <p class="qu_ans">
                                                        <form:radiobutton path="itineraryStartNewPage"
                                                            id="itineraryStartNewPageTrue" name="itineraryStartNewPage"
                                                            value="true" onclick="check();" /> <label
                                                            for="itineraryStartNewPageTrue" class="radio">Yes</label>
                                                        <form:radiobutton path="itineraryStartNewPage"
                                                            id="itineraryStartNewPageFalse" name="itineraryStartNewPage"
                                                            value="false" onclick="check();" /> <label
                                                            for="itineraryStartNewPageFalse" class="radio">No</label>
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="due_today_task_data_btnss">
                                        <input type="submit" name="Save Configuration" id="Save Configuration"
                                            Value="Save Configuration" />
                                        <a
                                            href="form_view_configure_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input
                                                type="button" value="Cancel" /></a>
                                        <a
                                            href="form_view_delete_confirm_configure_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input
                                                type="button" value="Restore Default" /></a>
                                    </div>
                                </div>
                        </div>
                         </div>
            
            
                        
                        
                        </form:form>
                        
                    <!-- ############### last box ends ###########  -->
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
span.onclick = function() {
  modal.style.display = "none";
}
// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

<script>
$(document).ready(function() {
	check();
});

function check(){
	if ($("input[name='flightCancellationPolicyDisplay']:checked").val()=="true") {
		$("#displayFlightCancellationHeader").show();
		$("#displayFlightCancellationTextArea").show();
	}
	if ($("input[name='flightCancellationPolicyDisplay']:checked").val()=="false") {
		$("#displayFlightCancellationHeader").hide();
		$("#displayFlightCancellationTextArea").hide();
	}

	if ($("input[name='hotelCancellationPolicyDisplay']:checked").val()=="true") {
		$("#displayHotelCancellationHeader").show();
		$("#displayHotelCancellationTextArea").show();
	}
	if ($("input[name='hotelCancellationPolicyDisplay']:checked").val()=="false") {
		$("#displayHotelCancellationHeader").hide();
		$("#displayHotelCancellationTextArea").hide();
	}

	if ($("input[name='transfersCancellationPolicyDisplay']:checked").val()=="true") {
		$("#displayTransfersCancellationHeader").show();
		$("#displayTransfersCancellationTextArea").show();
	}
	if ($("input[name='transfersCancellationPolicyDisplay']:checked").val()=="false") {
		$("#displayTransfersCancellationHeader").hide();
		$("#displayTransfersCancellationTextArea").hide();
	}

	if ($("input[name='sightSeeingCancellationPolicyDisplay']:checked").val()=="true") {
		$("#displaySigtSeeingCancellationHeader").show();
		$("#displaySightSeeingCancellationTextArea").show();
	}
	if ($("input[name='sightSeeingCancellationPolicyDisplay']:checked").val()=="false") {
		$("#displaySigtSeeingCancellationHeader").hide();
		$("#displaySightSeeingCancellationTextArea").hide();
	}


	if ($("input[name='visaAdditionalDetailsDisplay']:checked").val()=="true") {
		$("#displayVisaAdditionalHeader").show();
		$("#displayVisaAdditionalTextArea").show();
	}
	if ($("input[name='visaAdditionalDetailsDisplay']:checked").val()=="false") {
		$("#displayVisaAdditionalHeader").hide();
		$("#displayVisaAdditionalTextArea").hide();
	}

	if ($("input[name='visaCancellationPolicyDisplay']:checked").val()=="true") {
		$("#displayVisaCancellationHeader").show();
		$("#displayVisaCancellationTextArea").show();
	}
	if ($("input[name='visaCancellationPolicyDisplay']:checked").val()=="false") {
		$("#displayVisaCancellationHeader").hide();
		$("#displayVisaCancellationTextArea").hide();
	}

	if ($("input[name='insuranceCancellationPolicyDisplay']:checked").val()=="true") {
		$("#displayInsuranceCancellationHeader").show();
		$("#displayInsuranceCancellationTextArea").show();
	}
	if ($("input[name='insuranceCancellationPolicyDisplay']:checked").val()=="false") {
		$("#displayInsuranceCancellationHeader").hide();
		$("#displayInsuranceCancellationTextArea").hide();
	}
	

	if ($("input[name='cruiseCancellationPolicyDisplay']:checked").val()=="true") {
		$("#displayCruiseCancellationHeader").show();
		$("#displayCruiseCancellationTextArea").show();
	}
	if ($("input[name='cruiseCancellationPolicyDisplay']:checked").val()=="false") {
		$("#displayCruiseCancellationHeader").hide();
		$("#displayCruiseCancellationTextArea").hide();
	}


	if ($("input[name='packageCancellationPolicyDisplay']:checked").val()=="true") {
		$("#displayTourPackageCancellationHeader").show();
		$("#displayTourPackageCancellationTextArea").show();
	}
	if ($("input[name='packageCancellationPolicyDisplay']:checked").val()=="false") {
		$("#displayTourPackageCancellationHeader").hide();
		$("#displayTourPackageCancellationTextArea").hide();
	}


	if ($("input[name='otherCancellationPolicyDisplay']:checked").val()=="true") {
		$("#displayOtherCancellationHeader").show();
		$("#displayOtherCancellationTextArea").show();
	}
	if ($("input[name='otherCancellationPolicyDisplay']:checked").val()=="false") {
		$("#displayOtherCancellationHeader").hide();
		$("#displayOtherCancellationTextArea").hide();
	}
	
}



</script>
                </body>

</html>