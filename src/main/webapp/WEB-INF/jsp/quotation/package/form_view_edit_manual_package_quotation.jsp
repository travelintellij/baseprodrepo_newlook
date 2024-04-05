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
                                
                    <div class="afd">
<jsp:include page="../_quotationServicesMenu.jsp" />
</div>
                
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
                <div class="viewInsuranceQuotationD_wr_data bs">
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

                                <div align="center"><b>
                                        <font color="green"> ${Success} </font>
                                        <font color="red"> ${Error}</font>
                                    </b></div>
                               
                                            <form:form modelAttribute="MANUAL_PKG"
                                                action="edit_edit_package_manual_quotation">

                                                <input type="hidden" name="leadId"
                                                    value="${QTN_OBJ.leadEntity.leadId}" />
                                                <input type="hidden" name="quotationId"
                                                    value="${QTN_OBJ.quotationId}" />
                                                <input type="hidden" name="manualPkgQuotationId"
                                                    value="${MANUAL_PKG.manualPkgQuotationId}" />

                                             <div class="add_man_pckage" style="width:1050px;margin:0 auto" >
            <div class="add_man_pckage_wrapper bs">
            <h1 style="margin:10px 0;font-size:25px;color:#32cd32  ">Edit Package</h1>
            <div class="test">
            <h1 style="margin:10px 0;font-size:20px;color:#32cd32  ">Id-  ${MANUAL_PKG.manualPkgQuotationId}</h1>
            <div class="test">
                <div class="add_man_pckage_wrapper_data " >
                
                    <div class="add_man_pckage_wrapper_data_line">
                        <div class="add_man_pckage_wrapper_dl1">
                            <label for="">City</label>
                            <form:input path="cityName" type="text" id="cityName" />
                            <form:hidden path="cityId" id="cityId" />
                             <font color="red">
                                <form:errors path="cityName" cssClass="error" />
                            </font>
                        </div>
                        <div class="add_man_pckage_wrapper_dl1">
                            <label for="">Package Name</label>
                            
                            <form:input path="packageName" type="text" id="packageName" required="required" />
                            <font color="red">
                                <form:errors path="packageName" cssClass="error" />
                            </font>
                        </div>
                        <div class="add_man_pckage_wrapper_dl1">
                            <label for="">Start Date</label>
                            
                            <form:input type="date" path="startDate" required="required" />
                            <font color="red">
                                <form:errors path="startDate" cssClass="error" />
                            </font>
                        </div>
                        <div class="add_man_pckage_wrapper_dl1">
                            <label for="">End Date</label>
                            <form:input type="date" path="endDate" required="required" />
                        </div>
                    </div>
                    <div class="add_man_pckage_wrapper_data_line">
                        <div class="add_man_pckage_wrapper_dl1">
                            <label for="">Adults</label>
                            
                            <form:input path="adults" type="number" min="0" />
                            <font color="red">
                                <form:errors path="adults" cssClass="error" />
                            </font>
                        </div>
                        <div class="add_man_pckage_wrapper_dl1">
                            <label for="">Children</label>
                            <form:input path="children" type="number" min="0" />
                        </div>
                        <div class="add_man_pckage_wrapper_dl1">
                            <label for="">Infant</label>
                            <form:input path="infant" type="number" min="0" />
                        </div>
                        <div class="add_man_pckage_wrapper_dl1">
                            <label for="">Package Cost</label>
                            <form:input path="pkgCost" type="number" min="0" />
                        </div>
                    </div>
                    <div class="add_man_pckage_wrapper_data_line">
                        <div class="add_man_pckage_wrapper_dl1" style="width:25%">
                            <label for="">Package Markup</label>
                            <form:input path="pkgMarkup" type="number" min="0" />
                        </div>
                        <div class="add_man_pckage_wrapper_dl1" style="width:25%">
                            <label for="">Display Order</label>
                            <form:input path="displayOrder" type="number" min="0" />
                        </div>
                    </div>
                    <div class="add_man_pckage_wrapper_data_line">
                        <div class="add_man_pckage_wrapper_dl1_pd" style="text-align: start;">
                            <label for="">Package Description</label> <br>
                            <form:textarea path="packageDescription" rows="15" cols="121" maxlength="5000" style="width:100%"/>
                        </div>
                    </div>
                    <div class="add_man_pckage_wrapper_data_line">
                        <div class="add_man_pckage_wrapper_dl1_pd" style="text-align: start;">
                            <label for="">Inclusions</label> <br>
                            <form:textarea path="inclusions" rows="15" cols="121" maxlength="2000"  style="width:100%"/>
                        </div>
                    </div>
                    <div class="add_man_pckage_wrapper_data_line">
                        <div class="add_man_pckage_wrapper_dl1_pd" style="text-align: start;">
                            <label for="">Exclusions</label> <br>
                            <form:textarea path="exclusions" rows="15" cols="121" maxlength="2000"  style="width:100%"/>
                        </div>
                    </div>
                    <div class="add_man_pckage_wrapper_data_line">
                        <div class="add_man_pckage_wrapper_dl1_pd" style="text-align: start;">
                            <label for="">Cancellation Policy (if left empty , it won't be printed ) </label> <br>
                            <form:textarea path="cancellationPolicy" rows="15" cols="121" maxlength="3000"  style="width:100%"/>
                        </div>
                    </div>
                    <div class="add_man_pckage_wrapper_data_line">
                        <div class="add_man_pckage_wrapper_dl1_pd" style="text-align: start;">
                            <label for="">Remarks</label> <br>
                            <form:textarea path="remarks" rows="15" cols="121" maxlength="5000"  style="width:100%"/>
                        </div>
                    </div>
                    <div class="isFlight">
                        <div class="wp_div" style="margin:10px 0">
                            <p style="display: inline-block;">Flights Included</p>
                            <input type="radio" value="true" id="yes" name="flightIncluded" /> <label for="yes"
                                class="radio">Yes</label>
                            <input type="radio" value="false" id="no" name="flightIncluded" checked />
                            <label for="no" class="radio">No</label>
                        </div>

                    </div>
                    <div class="due_today_task_data_btnss">
                       <th colspan="5"><input type="submit" style="background:#32cd32" name="UpdatePackage" id="updatePackage" Value="Update Package" />
			<a href="form_view_package_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input type="button"  value="Cancel" /></a>
                    </div>
                </div>
                </div>

            </div>
        </div>
                                            </form:form>


                      
                            </div>
                        </div>
                    </div>
                    <script>
                        $('#cityName').autocomplete({
                            serviceUrl: '${pageContext.request.contextPath}/getCityList',
                            paramName: "cityName",
                            delimiter: ",",
                            onSelect: function (suggestion) {
                                cityID = suggestion.data;
                                id = cityID;
                                jQuery("#cityId").val(cityID);
                                $('input[name=cityId]').val(id);
                                return false;
                            },
                            transformResult: function (response) {
                                return {
                                    suggestions: $.map($.parseJSON(response), function (item) {
                                        return {
                                            value: item.cityName,
                                            data: item.destinationId
                                        };
                                    })

                                };
                            }
                        });



                    </script>
                </body>

</html>