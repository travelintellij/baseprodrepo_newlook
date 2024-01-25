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
                    <title>form_view_delete_cmquotation</title>
                    <link rel="stylesheet" href="style.css">
                    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
                    <script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
                    <link href="<c:url value=" /resources/core/main.css" />" rel="stylesheet">
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
                    <div class="form_view_delete_cmquotation container">
                        <form:form modelAttribute="QTN_OBJ" action="create_create_lead_quotation">
                            <div class="form_vaccmquotation_fbox_wrapper">
                                <h1 class="hd">Configure Quotation Parameters</h1>
                                <div class="form_vaccmquotation_fbox">
                                    <div class="form_vaccmquotation_fbox1">
                                        <label for="" class="lb">Quotation Id</label>
                                        <p>123</p>
                                    </div>
                                    <div class="form_vaccmquotation_fbox1">
                                        <label for="" class="lb">Version Id</label>
                                        <p>123</p>
                                    </div>
                                </div>
                        </form:form>
                    </div>

                    <div align="center"><b>
                            <font color="green"> ${Success} </font>
                            <font color="red"> ${Error}</font>
                        </b></div>

                    <form:form modelAttribute="MANUAL_CNF" action="delete_delete_manual_configuration_quotation">

                        <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
                        <input type="hidden" name="quotationId" value="${QTN_OBJ.quotationId}" />
                        <input type="hidden" name="manualConfigurationQuotationId"
                            value="${MANUAL_CNF.manualConfigurationQuotationId}" />
                        <form:hidden path="totalQuotationAmount" />

                        <!-- ############# delete box starts ##########  -->
                        <div class="form_view_delete_cmquotation_dev">
                            <h1 style="color:red;font-size: 25px;"> <i
                                    class="fa-solid fa-triangle-exclamation fa-xl"></i> Confirm
                                Delete
                            </h1>
                            <p style="margin:10px 0">Restoring Default will delete all configration setting</p>
                            <div class="due_today_task_data_btnss">
                                <input type="submit" name="deleteHotel" id="deleteHotel" Value="Confirm Reset"
                                    style="background-color:red;color:white" />
                                <a
                                    href="form_view_configure_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}"><input
                                        type="button" value="Cancel" /></a>
                            </div>
                        </div>
                        <!-- ############# delete box ends ##########  -->
                    </form:form>
                    </div>
                </body>

</html>