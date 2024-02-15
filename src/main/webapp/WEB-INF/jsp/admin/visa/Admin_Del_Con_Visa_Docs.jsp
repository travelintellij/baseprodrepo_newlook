<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../menu/MenuBuilder.jsp" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin_Del_Con_Visa_Docs</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://kit.fontawesome.com/6f6addf9b0.js" crossorigin="anonymous"></script>
    <script src="<c:url value="/resources/core/jquery.1.10.2.min.js" />"></script>
    <script	src="<c:url value="/resources/core/jquery.autocomplete.min.js" />"></script>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/revamped/style.css">
</head>
<style>

        body::before {
            content: "";
            background-image:   url(${pageContext.request.contextPath}/resources/images/revamped/delete.jpg);
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
    <div align="center"><b>
            <font color="green"> ${Success} </font>
            <font color="red"> ${Error}</font>
        </b></div>
    <form:form method="post" action="del_del_visa_docs" modelAttribute="VISA_OBJ">
        <div class="Admin_Del_Con_Visa_Docs container">
            <div class="Admin_Del_Con_Visa_Docs_wrapper bs">

                <div class="Admin_Del_Con_Visa_Docs_wrapper_data">
                    <div class="Admin_Del_Con_Visa_Docs_wrapper_data_li a" >
                        <div class="Admin_Del_Con_Visa_Docs_wrapper_data_l1">
                            <label for="" class="lb">Country name </label>
                            <p style="color:gray">${VISA_OBJ.countryName}</p>
                        </div>
                        <div class="Admin_Del_Con_Visa_Docs_wrapper_data_l1">
                            <label for="" class="lb">Visa Profile</label>
                            <p style="color:gray">${VISA_PROFILE.get(VISA_OBJ.profile)}</p>
                        </div>
                        <div class="Admin_Del_Con_Visa_Docs_wrapper_data_l1">
                            <label for="" class="lb">Visa Type</label>
                            <p style="color:gray">${VISA_TYPE.get(VISA_OBJ.visaType)}</p>
                        </div>
                        <div class="Admin_Del_Con_Visa_Docs_wrapper_data_l1">
                            <label for="" class="lb">Visa Purpose</label>
                            <p style="color:gray">${VISA_PURPOSE.get(VISA_OBJ.visaPurpose)}</p>
                        </div>
                    </div>
                    <div class="Admin_Del_Con_Visa_Docs_wrapper_data_li a">
                        <div class="Admin_Del_Con_Visa_Docs_wrapper_data_l1">
                            <label for="" class="lb">Standrad Cost</label>
                            <p style="color:gray">${VISA_OBJ.standardCost}</p>
                        </div>
                        <div class="Admin_Del_Con_Visa_Docs_wrapper_data_l1">
                            <label for="" class="lb">B2B Price</label>
                            <p style="color:gray">${VISA_OBJ.standardB2bPrice}</p>
                        </div>
                        <div class="Admin_Del_Con_Visa_Docs_wrapper_data_l1">
                            <label for="" class="lb">B2C Price</label>
                            <p style="color:gray">${VISA_OBJ.standardB2cPrice}</p>
                        </div>
                        <div class="Admin_Del_Con_Visa_Docs_wrapper_data_l1">
                            <label for="" class="lb">Processing Time</label>
                            <p style="color:gray">${VISA_OBJ.processingTime} Days</p>
                        </div>
                    </div>
                    <div class="Admin_Del_Con_Visa_Docs_wrapper_data_li a" style="width:100%">
                        <div class="Admin_Del_Con_Visa_Docs_wrapper_data_l1" style="width:100%">
                            <label for="" class="lb">Remarks</label>
                            <p style="color:gray">${VISA_OBJ.remarks}</p>
                        </div>
                    </div>
                    <h1 style="color: red;font-size: 25px;">Delete Visa Document <i
                            class="fa fa-exclamation-triangle fa-lg" aria-hidden="true"></i></h1>
                    <div class="Admin_Del_Con_Visa_Docs_wrapper_data_lower a">
                        <div class="Admin_Del_Con_Visa_Docs_wrapper_document">
                            <label for="" class="lb">Document Id</label>
                            <p style="color:gray">${ORG_VISA_DOC_OBJ.visaDocId}</p>
                        </div>
                        <div class="Admin_Del_Con_Visa_Docs_wrapper_document">
                            <label for="" class="lb">Document Title</label>
                            <p style="color:gray">${ORG_VISA_DOC_OBJ.documentTitle}</p>
                        </div>
                    </div>
                    <div class="Admin_Del_Con_Visa_Docs_wrapper_data_lower a" style="width:100%;">
                        <div class="Admin_Del_Con_Visa_Docs_wrapper_document_des" style="width:100%;">
                            <label for="" class="lb">Document Description</label>
                            <p style="color:gray">${ORG_VISA_DOC_OBJ.description}</p>
                        </div>
                    </div>
                    <div class="due_today_task_data_btns">
                        <input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
                        <input type="hidden" name="visaDocId" value="${ORG_VISA_DOC_OBJ.visaDocId}" />
                        <input type="submit" name="Delete" Value="Confirm Delete" style="background-color: red;color:white " />
                    </form:form>
                        <form:form modelAttribute="VISA_DOC_OBJ" action="view_list_visa_proceed_docs_form" style="display:inline;">
                            <input type="hidden" name="visaId" value="${VISA_OBJ.visaId}" />
                            <input type="submit" name="submit" value="Cancel " />
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    
</body>

</html>