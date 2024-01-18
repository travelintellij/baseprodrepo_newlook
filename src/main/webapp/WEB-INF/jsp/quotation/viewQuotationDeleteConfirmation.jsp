<!DOCTYPE html>
<html lang="en">
<jsp:include page="../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
        <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>viewEditQuotationDetails</title>
                    <link rel="stylesheet" href="style.css">
                    <script src="<c:url value=" /resources/core/jquery.1.10.2.min.js" />"></script>
                    <script src="<c:url value=" /resources/core/jquery.autocomplete.min.js" />"></script>
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
        <jsp:include page="leadDetailsOpenNavView.jsp" />
        </div>
    </div>
    </form:form>
    <!-- ############# quick lead view ends here################## -->
</div>


<div class="afd">
<jsp:include page="_quotationServicesMenu.jsp" />
</div>
                
                <i class="fa-solid fa-triangle-exclamation"></i>
                
                    <form:form modelAttribute="QTN_OBJ" action="delete_delete_lead_quotation">
                        <input type="hidden" name="leadId" value="${QTN_OBJ.leadEntity.leadId}" />
                        <form:hidden path="quotationId" />
                        <div class="viewEditQuotationDetails">
                            <div class="viewEditQuotationDetails_wrapper">
                            <h2 align="center" style="font-size:25px;color:red;margin-bottom:10px">Delete Confirmation   <i class="fa-solid fa-triangle-exclamation fa-xl"></i></h2>
                               <p style="font-weight:15px;color:red;margin-bottom:10px">Are you sure,you want to delete this quotation ? All quotation services components will also be deleted and will not be restored.</p>
                                <div class="viewEditQuotationDetails_wrapper_data">
                                    <div class="viewEditQuotationDetails_wrapper_data_line">
                                        <div class="viewEditQuotationDetails_wrapper_dl1">
                                            <label for="" class="lb">Quotation Id</label>
                                            <p>${QTN_OBJ.quotationId}</p>
                                        </div>
                                        <div class="viewEditQuotationDetails_wrapper_dl1">
                                            <label for="" class="lb">Version Id</label>
                                            <p>${QTN_OBJ.version}</p>
                                        </div>
                                        <div class="viewEditQuotationDetails_wrapper_dl1">
                                            <label for="" class="lb">Quotation Header</label>
                                            <form:input path="quotationName" />
                                        </div>
                                        <div class="viewEditQuotationDetails_wrapper_dl1">
                                            <label for="" class="lb">Quotation Status</label>
                                            <p>Created</p>
                                        </div>
                                    </div>
                                    <h1 class="lb" style="text-align: start;">Services to be included</h1>
                                    <div class="viewEditQuotationDetails_wrapper_data_line_sr">
                                        <div class="q_sr">
                                            <label for="">package</label>
                                            <form:checkbox path="tourPackage" name="tourPackage" disabled="true" />
                                        </div>
                                        <div class="q_sr">
                                            <label for="">flight</label>
                                            <form:checkbox path="flight" name="flight" disabled="true" />
                                        </div>
                                        <div class="q_sr">
                                            <label for="">hotal</label>
                                            <form:checkbox path="hotel" name="hotel" disabled="true" />
                                        </div>
                                        <div class="q_sr">
                                            <label for="">transfers</label>
                                            <form:checkbox path="transfers" name="transfers" disabled="true" />
                                        </div>
                                        <div class="q_sr">
                                            <label for="">sightseeing</label>
                                            <form:checkbox path="sightseeing" name="sightseeing" disabled="true" />
                                        </div>
                                        <div class="q_sr">
                                            <label for="">Visa</label>
                                            <form:checkbox path="visa" name="visa" disabled="true" />
                                        </div>
                                        <div class="q_sr">
                                            <label for="">insurance</label>
                                            <form:checkbox path="insurance" name="insurance" disabled="true" />
                                        </div>
                                        <div class="q_sr">
                                            <label for="">Cruise</label>
                                            <form:checkbox path="cruise" name="cruise" disabled="true" />
                                        </div>
                                        <div class="q_sr">
                                            <label for="">others</label>
                                            <form:checkbox path="others" name="others" disabled="true" />
                                        </div>
                                    </div>
                                    <div class="due_today_task_data_btns">
                                        <input type="submit" id="deletequotation" name="deletequotation"
                                            value="Confirm Delete" style="background-color:red;" />
                                        <a
                                            href="view_lead_quotations_list?leadId=${QTN_OBJ.leadEntity.leadId}">Cancel</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form:form>
                </body>

</html>