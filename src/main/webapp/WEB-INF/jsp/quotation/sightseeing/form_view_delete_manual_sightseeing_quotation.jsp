<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>form_view_delete_manual_sightseeing_quotation</title>
     <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
    <script src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<body>
    <div class="form_view_delete_manual container">
        <div class="form_view_delete_manual_wrapper bs">
        <form:form modelAttribute="MANUAL_STS" action="delete_delete_sightseeing_manual_quotation">
	<input type="hidden" name="leadId" value= "${QTN_OBJ.leadEntity.leadId}" />
	<input type="hidden" name="quotationId" value= "${QTN_OBJ.quotationId}" />
	<input type="hidden" name="manualSightSeeingQuotationId" value= "${MANUAL_STS.manualSightSeeingQuotationId}" />
	 <h1 class="vtdh2">Delete transfer quotation <i class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i>
            </h1>
            <div class="form_view_delete_manual_wrapper_data">
            <h1 style="color:#32cd32;margin-top:-20px;margin-bottom:15px">Id-  ${MANUAL_STS.manualSightSeeingQuotationId}</h1>
                <div class="form_view_delete_manual_wrapper_data_line a">
                    <div class="form_view_delete_manual_wrapper_data_l1">
                        <label for="">Sight Seeing City</label>
                        <p style="color:gray">${MANUAL_STS.cityName}</p>
                    </div>
                    <div class="form_view_delete_manual_wrapper_data_l1">
                        <label for="">Sight Seeing Selection</label>
                        <p style="color:gray"><c:if test="${MANUAL_STS.savedSightSeeing eq true}">
							System Based
				</c:if>
				<c:if test="${MANUAL_STS.savedSightSeeing eq false}">
							Customized 
				</c:if></p>
                    </div>
                    <div class="form_view_delete_manual_wrapper_data_l1">
                        <label for="">Transfer Type</label>
                        <p style="color:gray">${MANUAL_STS.transferTypeName}</p>
                    </div>
                    <div class="form_view_delete_manual_wrapper_data_l1">
                        <label for="">Sight Seeing Date</label>
                        <p style="color:gray"><fmt:formatDate value="${MANUAL_STS.sightSeeingDate}" pattern="dd-MMM-yyyy" /> </p>
                    </div>
                </div>

                <div class="form_view_delete_manual_wrapper_data_line a">
                    <div class="form_view_delete_manual_wrapper_data_l1_ad">
                        <div class="fvmwdl1">
                            <label for="">Adults</label>
                            <p style="color:gray">${MANUAL_STS.adults}</p>
                        </div>
                        <div class="fvmwdl1 fvmwdl1m">
                            <label for="">Children</label>
                            <p style="color:gray">${MANUAL_STS.children}</p>
                        </div>
                        <div class="fvmwdl1">
                            <label for="">Infant</label>
                            <p style="color:gray">${MANUAL_STS.infant}</p>
                        </div>
                    </div>
                    <div class="form_view_delete_manual_wrapper_data_l1">
                        <label for="">Sight Seeing Cost</label>
                        <p style="color:gray">${MANUAL_STS.sightSeeingCost}</p>
                    </div>
                    <div class="form_view_delete_manual_wrapper_data_l1">
                        <label for="">Sight Seeing Markup</label>
                        <p style="color:gray">d${MANUAL_STS.sightSeeingMarkup}</p>
                    </div>
                    <div class="form_view_delete_manual_wrapper_data_l1">
                        <label for="">Display Order</label>
                        <p style="color:gray">${MANUAL_STS.displayOrder }</p>
                    </div>
                </div>


                <div class="form_view_delete_manual_wrapper_data_line a">
                    <div class="form_view_delete_manual_wrapper_data_l1_id">
                        <label for="">Sight Seeing ID /  Sight Seeing Name</label>
                        <p style="color:gray">delhi</p>
                    </div>
                    
                </div>
                <div class="form_view_delete_manual_wrapper_data_line a">
                    <div class="form_view_delete_manual_wrapper_data_l1_rem">
                        <label for="">Remarks</label>
                        <p style="color:gray">${MANUAL_STS.remarks}</p>
                    </div> 
                </div>
                
                <div class="due_today_task_data_btns">
                <input type="submit" name="confirmDelete" id="confirmDelete" Value="Confirm Delete" style="color:white;background:red"/>
				<a href="form_view_sightseeing_quotation_details?leadId=${QTN_OBJ.leadEntity.leadId}&quotationId=${QTN_OBJ.quotationId}">Cancel</a>
                </div>
            </div>
            </form:form>
        </div>
    </div>
</body>
</html>